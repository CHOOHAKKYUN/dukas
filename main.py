import selenium
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome import service as fs

CHROMEDRIVER = './chromedriver'
URL = 'www.naver.com'

options = Options()
options.add_argument('--headless')  
options.add_argument('--no-sandbox')
options.add_argument('--disable-dev-shm-usage')

chrome_service = fs.Service(executable_path=CHROMEDRIVER) 
driver = webdriver.Chrome(service=chrome_service, options=options)
driver.get(URL)
html = driver.page_source
print(html)
