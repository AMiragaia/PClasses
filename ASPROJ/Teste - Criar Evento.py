from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from webdriver_manager.chrome import ChromeDriverManager as CM
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
from selenium.webdriver.support.ui import Select
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.relative_locator import locate_with
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
from selenium.webdriver.support.ui import Select
import time
from datetime import date

# create a new Chrome browser instance
path = CM(path="data/driver").install()
CHROMEDRIVER = path
driver = webdriver.Chrome(executable_path=CHROMEDRIVER)

# navigate to the application home page
driver.get('http://127.0.0.1:5000/')
WebDriverWait(driver, 3).until(EC.element_to_be_clickable((By.XPATH, '/html/body/div/div[2]/div[2]/button[2]/a'))).click()
username_input = WebDriverWait(driver, 3).until(EC.element_to_be_clickable((By.XPATH, '/html/body/div/form/input[1]')))
username_input.send_keys('gestor')
password_input = WebDriverWait(driver, 3).until(EC.element_to_be_clickable((By.NAME, 'password')))
password_input.send_keys('password')
submit_button = WebDriverWait(driver, 3).until(EC.element_to_be_clickable((By.XPATH, '/html/body/div/form/button')))
submit_button.click()
print("Login Efetuado com Sucesso.")
driver.get("http://127.0.0.1:5000/criar_evento")
textarea = WebDriverWait(driver, 3).until(EC.element_to_be_clickable((By.XPATH, '/html/body/div/textarea')))
textarea.send_keys('This is a cultural event')
# Select checkbox
checkbox = WebDriverWait(driver, 3).until(EC.element_to_be_clickable((By.XPATH, '/html/body/div/div[14]/input')))
ActionChains(driver).move_to_element(checkbox).perform()
checkbox.click()
# Select any time
time_input = WebDriverWait(driver, 3).until(EC.element_to_be_clickable((By.XPATH, '/html/body/div/div[9]/input')))
ActionChains(driver).move_to_element(time_input).perform()
time_input.send_keys("10:00")
# Select today's date
date_input = WebDriverWait(driver, 3).until(EC.element_to_be_clickable((By.XPATH, '/html/body/div/div[8]/input')))
today = date.today().strftime("%Y-%m-%d")  # Modify this format as per the requirement of your website
ActionChains(driver).move_to_element(date_input).perform()
date_input.send_keys(today)
time.sleep(.5)
# Enter "15€"
price_input = WebDriverWait(driver, 3).until(EC.element_to_be_clickable((By.XPATH, '/html/body/div/input[2]')))
ActionChains(driver).move_to_element(price_input).perform()
price_input.send_keys("15€")
# Select and then deselect a checkbox
another_checkbox = WebDriverWait(driver, 3).until(EC.element_to_be_clickable((By.XPATH, '/html/body/div/div[13]/input')))
another_checkbox.click()
another_checkbox.click()  # Clicking again will deselect it
# Clear and re-enter "10€" in the price input
price_input.clear()
price_input.send_keys("10€")
# Add "palestrante" text
text_input = WebDriverWait(driver, 3).until(EC.element_to_be_clickable((By.XPATH, '/html/body/div/input[1]')))
ActionChains(driver).move_to_element(text_input).perform()
text_input.send_keys("palestrante")
print("Evento criado com sucesso.")
driver.get("http://127.0.0.1:5000/evento/1")
# close the browser window
driver.quit()