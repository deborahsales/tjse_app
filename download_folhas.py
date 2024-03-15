from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import Select
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time


meses = ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho',
         'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro']

# Abrindo o navegador
driver = webdriver.Chrome()

# Acessando a página
driver.get('https://www.tjse.jus.br/transparencia-publico/inicio')

wait = WebDriverWait(driver, 10)
mes_select = Select(driver.find_element(By.ID, 'idmes'))
ano_select = Select(driver.find_element(By.ID, 'idano'))

# Loop para baixar os arquivos
for ano in range (2019,2024):
    for mes in meses:
        
        mes_select.select_by_visible_text(mes)
        ano_select.select_by_visible_text(str(ano))

        try:            
            download_button = WebDriverWait(driver, 10).until(
                EC.element_to_be_clickable((By.CSS_SELECTOR, ".btn.btn-primary.input-sm[type='button']")))
            download_button.click()
            print(f'Download realizado: {mes} {ano}')
            time.sleep(20)
        except Exception as e:
            print(f'{mes} {ano}')

# Fechando o navegador
driver.quit()
