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
import time

# create a new Chrome browser instance
path = CM(path="data/driver").install()
CHROMEDRIVER = path
driver = webdriver.Chrome(executable_path=CHROMEDRIVER)

# navigate to the application home page
driver.get('http://127.0.0.1:5000/')

WebDriverWait(driver, 3).until(EC.element_to_be_clickable((By.XPATH, '/html/body/div/div[2]/div[2]/button[2]/a'))).click()
time.sleep(1)
username_input = WebDriverWait(driver, 3).until(EC.element_to_be_clickable((By.XPATH, '/html/body/div/form/input[1]')))
username_input.send_keys('participante')
time.sleep(1)
password_input = WebDriverWait(driver, 3).until(EC.element_to_be_clickable((By.NAME, 'password')))
password_input.send_keys('password')
time.sleep(1)
print("Login efetuado com sucesso!")
submit_button = WebDriverWait(driver, 3).until(EC.element_to_be_clickable((By.XPATH, '/html/body/div/form/button')))
submit_button.click()
time.sleep(1)
driver.get("http://127.0.0.1:5000/evento/1")
time.sleep(3)
driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
print("Convite aceite com sucesso!")

# close the browser window
driver.quit()