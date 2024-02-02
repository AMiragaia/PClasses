import cv2

def draw_roi(image, roi):
    x, y, w, h = roi
    cv2.rectangle(image, (x, y), (x+w, y+h), (0, 255, 0), 2)

# Load a square image
square_image = cv2.imread('/squares/square_0.png', cv2.IMREAD_COLOR)

# Define the ROI
roi1 = (67, 85, 40, 20)

# Draw the ROI on the image
draw_roi(square_image, roi1)

# Display the image with the ROI
cv2.imshow('Square Image with ROI', square_image)
cv2.waitKey(0)
cv2.destroyAllWindows()
