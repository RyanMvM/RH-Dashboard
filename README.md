
# RH-Dashboard com SQL + Power BI

<img width="2000" height="1353" alt="Image" src="https://github.com/user-attachments/assets/8969536a-a931-43c3-bbc7-fc53a7bbd295" />

## Dados e Ferramentas usadas

**Dados** - Dados de Recursos Humanos com 22000 linhas dos anos 2000 á 2020  

**Limpeza de dados e análise** - MYSQL WorkBanch

**Visualização de dados** - PowerBI + Figma ( para design ) 

## Consultas de Negócio (Queries 1 a 11)

1. *Gênero*: Conta funcionários ativos (idade > 18 e sem data de demissão).

2. *Raça*: Distribuição étnica ordenada pela maioria.

3. *Faixa Etária*: Agrupa funcionários em baldes de idade (18-24, 25-34, etc.) por gênero.

4. *Localização*: Compara quem trabalha remoto vs. presencial.

5. *Tempo de Casa*: Calcula a média de anos que um funcionário ficou na empresa antes de ser demitido.

6. *Cargos por Departamento*: Distribuição de gênero cruzada com departamentos.

7. *Títulos*: Lista todos os cargos existentes.

8. *Turnover (Rotatividade)*: Calcula a taxa de demissão por departamento (Demitidos / Total).

9. *Geografia*: Distribuição de funcionários por estado.

10. *Crescimento Líquido*: Mostra por ano quantos entraram, quantos saíram e o percentual de mudança.

11. *Tenure (Permanência)*: Tempo médio de permanência em cada departamento.

## Resumo das análises feitas

- Há mais funcionários do sexo masculino. 
- O funcionário mais jovem tem 23 anos e o mais velho, 60 anos. 
- Foram criados 5 grupos etários (18-24, 25-34, 35-44, 45-54, 55-64). 
- Um grande número de funcionários trabalha na sede, em vez de remotamente. 
- O tempo médio de serviço para funcionários demitidos é de 8 anos.
- Um grande número de funcionários é originário do estado de Ohio.
- O saldo líquido de funcionários aumentou ao longo dos anos.
