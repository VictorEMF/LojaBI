# Loja_BI
 
Uma empresa possui varias lojas e eles começaram a crescer então decidiram atualizar a área de dados da empresa, já que toda a gestão de dados era feita por excel junto com a amostragem dos dados, com isso um time de BI e de Banco de dados foi criado com o intuito de criar um DATABASE (DB) para ter mais autonomia e garantia dos próprios dados. Com isso a equipe de BI teve como primeiro projeto verificar a vendas de todas as lojas e verificar quais lojas estão tendo mais vendas, se essas vendas são feitas mais pelo aplicativo ou pela loja, o produto mais vendido, o lucro e qual funcionário vende mais. Pois feito o levantamento de requisitos o modelo das loja para as vendas é esse:

![modelo_transacional](https://github.com/VictorEMF/LojaBI/assets/70483515/0e02e322-bc15-4841-81f9-5cdab1011efc)

Logo após isso houve a criação do modelo multidimensional e a criação do DATA WAREHOUSE (DW)

![modelo_multidimensional](https://github.com/VictorEMF/LojaBI/assets/70483515/cd010b1e-0c9b-4d68-a475-d3f50b82482f)

com isso houve toda a criação do ETL que foi feito no SQL Server Integration Services (SSIS) que funciona no Microsoft Visual Studio 2019, o primeiro projeto no SSIS foi apenas para puxar os primeiros dados do DB para o DW, logo após isso houve o deploy do projeto para o SQL Server Management Studio (SSMS) onde haverá a criação dos JOB para atualizar o DW mensalmente.

![SSMS](https://github.com/VictorEMF/LojaBI/assets/70483515/477a4006-622f-4284-9a7f-ed0b65c98031)

jOBS e o Agendamento :

![jobs_agendamento](https://github.com/VictorEMF/LojaBI/assets/70483515/c8e863f4-743a-4354-ab06-cb0d2740f0e9)
