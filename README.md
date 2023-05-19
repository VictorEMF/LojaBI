# Loja_BI
 
Uma empresa possui varias lojas e eles começaram a crescer então decidiram atualizar a área de dados da empresa, já que toda a gestão de dados era feita por excel junto com a amostragem dos dados, com isso um time de BI e de Banco de dados foi criado com o intuito de criar um DATABASE (DB) para ter mais autonomia e garantia dos próprios dados. Com isso a equipe de BI teve como primeiro projeto verificar a vendas de todas as lojas e verificar quais lojas estão tendo mais vendas, se essas vendas são feitas mais pelo aplicativo ou pela loja, o produto mais vendido, o lucro e qual funcionário vende mais. Pois feito o levantamento de requisitos o modelo das loja para as vendas é esse:

![modelo_transacional](https://github.com/VictorEMF/LojaBI/assets/70483515/7c07c66b-3c3c-4fa2-a5e6-5f6f464870e7)

Logo após isso houve a criação do modelo multidimensional e a criação do DATA WAREHOUSE (DW)

![modelo_multidimensional](https://github.com/VictorEMF/LojaBI/assets/70483515/acb356bb-a1c7-4f48-b68d-2f523fa61c16)

com isso houve toda a criação do ETL que foi feito no SQL Server Integration Services (SSIS) que funciona no Microsoft Visual Studio 2019, o primeiro projeto no SSIS foi apenas para puxar os primeiros dados do DB para o DW, logo após isso houve o deploy do projeto para o SQL Server Management Studio (SSMS) onde haverá a criação dos JOB para atualizar o DW mensalmente.

![SSMS](https://github.com/VictorEMF/LojaBI/assets/70483515/db6cc7f8-d16d-43a8-81c5-e1faa0f715e8)

jOBS e o Agendamento :

![jobs_agendamento](https://github.com/VictorEMF/LojaBI/assets/70483515/c9cf3a60-b43c-4490-9d68-b58988766f1c)
