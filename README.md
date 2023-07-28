# Loja_BI
 
Uma empresa possui varias lojas e eles começaram a crescer então decidiram atualizar a área de dados da empresa, já que toda a gestão de dados era feita por excel junto com a amostragem dos dados, com isso um time de BI e de Banco de dados foi criado com o intuito de criar um DATABASE (DB) para ter mais autonomia e garantia dos próprios dados. Com isso a equipe de BI teve como primeiro projeto verificar a vendas de todas as lojas e verificar quais lojas estão tendo mais vendas, se essas vendas são feitas mais pelo aplicativo ou pela loja, o produto mais vendido, o lucro e qual funcionário vende mais. Pois feito o levantamento de requisitos o modelo das loja para as vendas é esse:

![modelo_transacional](https://github.com/VictorEMF/LojaBI/assets/70483515/7c07c66b-3c3c-4fa2-a5e6-5f6f464870e7)

Logo após isso houve a criação do modelo multidimensional e a criação do DATA WAREHOUSE (DW).
O esquema que foi adotado nele foi o Snow Flake, já que os Stakeholders queria que todas as tabelas estivesse no DW. 

![modelo_multidimensional](https://github.com/VictorEMF/LojaBI/assets/70483515/acb356bb-a1c7-4f48-b68d-2f523fa61c16)

com isso houve toda a criação do ETL que foi feito no SQL Server Integration Services (SSIS) que funciona no Microsoft Visual Studio 2019, o primeiro projeto no SSIS foi apenas para puxar os primeiros dados do DB para o DW, logo após isso houve o deploy do projeto para o SQL Server Management Studio (SSMS) onde haverá a criação dos JOB para atualizar o DW mensalmente.

![SSMS](https://github.com/VictorEMF/LojaBI/assets/70483515/db6cc7f8-d16d-43a8-81c5-e1faa0f715e8)

jOBS e o Agendamento :

![jobs_agendamento](https://github.com/VictorEMF/LojaBI/assets/70483515/c9cf3a60-b43c-4490-9d68-b58988766f1c)

Após o trabalho da equipe de BI ser finalizado o DASHBOARD foi finalizado e o CEO pode ter uma idea melhor e esse foi o resulto da equipe.

Tela Principal:
Ela possui um resumo variado sobre a empresa, desde lucro ate qual funcionario vende mais.

![Tela Principal](https://github.com/VictorEMF/LojaBI/assets/70483515/429c47c2-0999-464c-877f-e9e912816596)

Tela de Lojas:
Ela detalha melhor quanto cada loja esta tendo de lucro junto com qual produto é, qual loja vende mais, se as vendas são por APP ou Presenciais.

![Tela de Lojas](https://github.com/VictorEMF/LojaBI/assets/70483515/33b61f09-e80d-491b-b566-3431e3b90e84)

Tela de Financeiro Mensal:
Serve para mostrar o salario dos cargos e o total deles, junto com isso tem o lucro bruto e líquido de cada loja, dividida por mês e ano

![Tela de Financeiro](https://github.com/VictorEMF/LojaBI/assets/70483515/8a340d60-51b0-4e7e-aa1b-98627ff52377)

Organização do Projeto:

![Organização](https://github.com/VictorEMF/LojaBI/assets/70483515/bf7e5ae7-b395-42e4-8947-a29386139aba)
