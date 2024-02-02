import cv2
import numpy as np
import os
import pytesseract
from PIL import Image

def is_duplicate_square(square, squares, tolerance=10):
    x, y, w, h = square
    for other_square in squares:
        ox, oy, ow, oh = other_square
        if abs(x - ox) <= tolerance and abs(y - oy) <= tolerance:
            return True
    return False



# Load the input image
image = cv2.imread('image.png', cv2.IMREAD_COLOR)

# Load the template images (130x130 squares)
templates = [
    cv2.imread('template.png', cv2.IMREAD_COLOR),
    cv2.imread('template1.png', cv2.IMREAD_COLOR),
    cv2.imread('template2.png', cv2.IMREAD_COLOR),
    cv2.imread('template3.png', cv2.IMREAD_COLOR),
    # Add more templates as needed
]

# Convert the templates to grayscale
templates_gray = [cv2.cvtColor(template, cv2.COLOR_BGR2GRAY) for template in templates]

# Convert the input image to grayscale
gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

# Set the similarity threshold
threshold = 0.8

detected_squares = []

# Loop through the templates
for template_gray in templates_gray:
    # Apply template matching
    res = cv2.matchTemplate(gray, template_gray, cv2.TM_CCOEFF_NORMED)

    # Find the locations of the matches
    loc = np.where(res >= threshold)

    # Draw rectangles on the detected squares and save their coordinates
    for pt in zip(*loc[::-1]):
        x, y, w, h = pt[0], pt[1], template_gray.shape[1], template_gray.shape[0]
        square = (x, y, w, h)

        if not is_duplicate_square(square, detected_squares):
            cv2.rectangle(image, pt, (x + w, y + h), (0, 0, 255), 2)
            detected_squares.append(square)

output_folder = 'squares'

# Save the detected squares into a folder
if not os.path.exists(output_folder):
    os.makedirs(output_folder)

for idx, (x, y, w, h) in enumerate(detected_squares):
    square_image = image[y:y+h, x:x+w]
    output_path = os.path.join(output_folder, f'square_{idx}.png')
    cv2.imwrite(output_path, square_image)


def extract_amount(square_image):
    # Define the two ROIs
    roi1 = (40, 0, 45, 40)
    roi2 = (67, 85, 40, 20)

    # Crop the square image to the ROIs
    cropped_roi1 = square_image[roi1[1]:roi1[1]+roi1[3], roi1[0]:roi1[0]+roi1[2]]
    cropped_roi2 = square_image[roi2[1]:roi2[1]+roi2[3], roi2[0]:roi2[0]+roi2[2]]

    # Create a list of the cropped ROIs
    cropped_rois = [cropped_roi1, cropped_roi2]

    extracted_texts = []

    for cropped_roi in cropped_rois:
        # Convert the image to grayscale
        gray = cv2.cvtColor(cropped_roi, cv2.COLOR_BGR2GRAY)

        # Resize the image to a larger size
        gray = cv2.resize(gray, None, fx=2, fy=2, interpolation=cv2.INTER_CUBIC)

        # Apply adaptive thresholding
        thresh = cv2.adaptiveThreshold(gray, 255, cv2.ADAPTIVE_THRESH_GAUSSIAN_C, cv2.THRESH_BINARY_INV, 11, 2)

        # Apply a median blur to remove noise
        blur = cv2.medianBlur(thresh, 3)

        # Use morphological operations to connect broken characters
        kernel = np.ones((3, 3), np.uint8)
        dilation = cv2.dilate(blur, kernel, iterations=1)

        # Find the contours in the image
        contours, _ = cv2.findContours(dilation, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

        # Sort the contours by x coordinate (left to right)
        contours = sorted(contours, key=lambda ctr: cv2.boundingRect(ctr)[0])

        text = ""

        for contour in contours:
            # Get the bounding box for the contour
            x, y, w, h = cv2.boundingRect(contour)

            # Crop the character from the image
            char_image = dilation[y:y+h, x:x+w]

            # Convert the OpenCV image to a PIL image
            pil_image = Image.fromarray(char_image)

            # Use pytesseract to extract text from the image
            char_text = pytesseract.image_to_string(pil_image, config='--psm 8 -c tessedit_char_whitelist=0123456789MH')

            text += char_text

        extracted_texts.append(text)

    return extracted_texts


# Process each detected square
for idx, (x, y, w, h) in enumerate(detected_squares):
    square_image = image[y:y+h, x:x+w]
    amount = extract_amount(square_image)
    print(f'Square {idx}: {amount}')
# Show the result
cv2.imshow('Detected Squares', image)
cv2.waitKey(0)
cv2.destroyAllWindows()
