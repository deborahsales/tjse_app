import os
import dotenv
import psycopg2
import pandas as pd

dotenv.load_dotenv()
url = os.getenv('URL')
connection = psycopg2.connect(url)
cursor = connection.cursor()

# Manipulação do banco de dados
CREATE_TABLE = (''' CREATE SCHEMA IF NOT EXISTS tjse;
                    CREATE TABLE IF NOT EXISTS tjse.folha( nome VARCHAR, cargo VARCHAR, lotacao VARCHAR,
                                                           remun_paradigma DECIMAL, vant_pessoais DECIMAL,
                                                           subsidio DECIMAL, indenizacoes DECIMAL,
                                                           vant_eventuais DECIMAL, gratificacoes DECIMAl,
                                                           total_creditos DECIMAL, prev_publica DECIMAL,
                                                           imposto_renda DECIMAL, descontos DECIMAL,
                                                           retencao DECIMAL, total_debitos DECIMAL,
                                                           rend_liquido DECIMAL, remun_origem DECIMAL,
                                                           diarias DECIMAL, ano INT NOT NULL, mes VARCHAR NOT NULL);''')

INSERT_QUERY = f'''INSERT INTO tjse.folha (nome, cargo, lotacao, remun_paradigma, vant_pessoais,
            subsidio, indenizacoes, vant_eventuais, gratificacoes, total_creditos, prev_publica,
            imposto_renda, descontos, retencao, total_debitos, rend_liquido, remun_origem, diarias, ano, mes) VALUES 
            (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)'''

def post(valor):
    try:
        with connection:
            with connection.cursor() as cursor:
                cursor.execute(CREATE_TABLE)
                valores = valor.values.tolist()                                
                cursor.executemany(INSERT_QUERY, valores)
    except psycopg2.IntegrityError as e:
        print(f'Erro de integridade: {e}')
    except psycopg2.Error as e:
        print(f'Erro no banco de dados: {e}')
    except Exception as e:
        print(f'Erro inesperado: {e}')


meses = ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho',
         'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro']

# Lista arquivos na pasta
pasta = '.xlsx'
arquivos = os.listdir(pasta)

# Para cada arquivo
for i, arquivo in enumerate(arquivos):
    # Abre a planilha
    df = pd.read_excel(f'{pasta}/{arquivo}')

    # Extrai ano e mês do nome do arquivo
    ano = int(arquivo.split("_")[1][:4])
    mes = int(arquivo.split("_")[1][4:])

    # Adiciona colunas "ano" e "mês"
    df['ano'] = int(ano)
    df['mes'] = meses[mes-1]
    
    # Lista de colunas a serem modificadas
    colunas_para_modificar = ['Remuneração Paradigma', 'Vantagens Pessoais', 'Subsídio, Diferença de Subsídio',
                              'Função de Confiança ou Cargo em Comissão', 'Indenizações', 'Vantagens Eventuais',
                              'Gratificações', 'Total de Créditos', 'Previdência Pública', 'Imposto de Renda',
                              'Descontos Diversos', 'Retenção por Teto constitucional', 'Total de débitos',
                              'Rendimento Líquido', 'Remuneração do Órgão de origem', 'Diárias']

    # Corrige a formatação dos valores
    for coluna in colunas_para_modificar:
        df[coluna] = df[coluna].str.replace('.', '').str.replace(',', '.').astype(float)
    
    post(df)
    print(f'{arquivo} cadastrado!')

# Fecha a conexão com o banco de dados
cursor.close()
connection.close()

# Exibe mensagem de finalização
print('Todos os dados foram inseridos com sucesso!')