import cv2
import pytesseract
import re
import os

total_power = 0

# Loop through all images in the screenshots folder
for i in range(1000):
    if os.path.exists(f"screenshots/screenshot_{i}.jpeg"):
        image = cv2.imread(f"screenshots/screenshot_{i}.jpeg")

        # Define the coordinates for the two columns
        column_1 = (640, 250, 960, 1100)
        column_2 = (1500, 250, 1790, 1100)

        # Crop the two columns
        crop_1 = image[column_1[1]:column_1[3], column_1[0]:column_1[2]]
        crop_2 = image[column_2[1]:column_2[3], column_2[0]:column_2[2]]

        # Perform image processing on the cropped images
        gray_1 = cv2.cvtColor(crop_1, cv2.COLOR_BGR2GRAY)
        thresh_1 = cv2.threshold(gray_1, 150, 255, cv2.THRESH_BINARY_INV+cv2.THRESH_OTSU)
        kernel = cv2.getStructuringElement(cv2.MORPH_RECT, (3, 3))
        opening = cv2.morphologyEx(crop_1, cv2.MORPH_OPEN, kernel, iterations=1)

        gray_2 = cv2.cvtColor(crop_2, cv2.COLOR_BGR2GRAY)
        thresh_2 = cv2.threshold(gray_2, 150, 255, cv2.THRESH_BINARY_INV+cv2.THRESH_OTSU)
        kernel = cv2.getStructuringElement(cv2.MORPH_RECT, (3, 3))
        opening = cv2.morphologyEx(crop_2, cv2.MORPH_OPEN, kernel, iterations=1)

        # OCR the cropped images
        text_1 = pytesseract.image_to_string(crop_1, lang="eng", config="--psm 6")
        text_2 = pytesseract.image_to_string(crop_2, lang="eng", config="--psm 6")

        # Remove non-alphanumeric characters
        text_1 = re.sub(r'[^\w\s]', '', text_1)
        text_2 = re.sub(r'[^\w\s]', '', text_2)

        # Print the OCR results
        for line in text_2.splitlines():
            line = line.strip() # Remove any leading/trailing whitespace
            if line and all(char.isdigit() for char in line):
                print(line)
                total_power += int(line)



print(f"Total power of the kingdom is: {total_power}")
