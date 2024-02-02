import time
import cv2
import pyautogui
import numpy as np
import os
import pytesseract

# Define the coordinates for the leaderboard
leaderboard = (0, 0, 1880, 1100)

# Set the scroll amount and delay time
scroll_amount = 160
delay_time = 3

# Scroll down and take screenshots until the end of the leaderboard is reached
while True:
    # Take a screenshot of the leaderboard
    screenshot = pyautogui.screenshot(region=leaderboard)
    screenshot = cv2.cvtColor(np.array(screenshot), cv2.COLOR_RGB2BGR)
    # Save the screenshot into the folder screenshots
    for i in range(1000):
        if not os.path.exists(f"screenshots/screenshot_{i}.jpeg"):
            cv2.imwrite(f"screenshots/screenshot_{i}.jpeg", screenshot)
            break
    # OCR the screenshot
    text = pytesseract.image_to_string(screenshot, lang="eng", config="--psm 6")

    # Process the OCR result

    # Scroll up
    pyautogui.scroll(-scroll_amount)

    # Wait for the leaderboard to load
    time.sleep(delay_time)
    #end of while loop
    
    


