BEGIN;
MERGE INTO public.ft_venda fv
USING
	(
		SELECT DISTINCT 
					ID_VENDA,
					ID_FUNCIONARIO,
					ID_LOJA,
					ID_PRODUTO,
					QTD,
					VALOR,
					DATA_VENDA,
					TIPO_VENDA
		from dblink('host=localhost user=postgres password=postgres dbname=lojabi',
		$$
			SELECT 	
					ID_VENDA,
					ID_FUNCIONARIO,
					ID_LOJA,
					ID_PRODUTO,
					QTD,
					VALOR,
					DATA_VENDA,
					TIPO_VENDA
			FROM venda
		$$) AS venda
					(ID_VENDA INT,
					ID_FUNCIONARIO INT,
					ID_LOJA INT,
					ID_PRODUTO INT,
					QTD INT,
					VALOR numeric(10,3),
					DATA_VENDA TIMESTAMP,
					TIPO_VENDA VARCHAR(10))
		order by 1
	) MERGE_SUBQUERY
ON (
		fv.COD_VENDA = MERGE_SUBQUERY.ID_VENDA
	)
WHEN NOT MATCHED THEN 

INSERT 
		(
			COD_VENDA,
			SK_ID_FUNCIONARIO,
			SK_ID_PRODUTO,
			SK_ID_LOJA,
			QTD,
			VALOR,
			DATA_VENDA,
			TIPO_VENDA
		)
VALUES 
		(
			MERGE_SUBQUERY.ID_VENDA,
			MERGE_SUBQUERY.ID_FUNCIONARIO,
			MERGE_SUBQUERY.ID_PRODUTO,
			MERGE_SUBQUERY.ID_LOJA,
			MERGE_SUBQUERY.QTD,
			MERGE_SUBQUERY.VALOR,
			MERGE_SUBQUERY.DATA_VENDA,
			MERGE_SUBQUERY.TIPO_VENDA
		)
WHEN MATCHED THEN 

UPDATE SET 
			COD_VENDA			=	MERGE_SUBQUERY.ID_VENDA,
			SK_ID_FUNCIONARIO		=	MERGE_SUBQUERY.ID_FUNCIONARIO,
			SK_ID_PRODUTO		=	MERGE_SUBQUERY.ID_PRODUTO,
			SK_ID_LOJA			=	MERGE_SUBQUERY.ID_LOJA,
			QTD				=	MERGE_SUBQUERY.QTD,
			VALOR				=	MERGE_SUBQUERY.VALOR,
			DATA_VENDA			=	MERGE_SUBQUERY.DATA_VENDA,
			TIPO_VENDA			=	MERGE_SUBQUERY.TIPO_VENDA;
COMMIT;









