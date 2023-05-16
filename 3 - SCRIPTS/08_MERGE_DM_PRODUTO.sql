BEGIN;
MERGE INTO public.dm_produto dp
USING
	(
		SELECT DISTINCT 
					ID_PRODUTO,
					NOME_PRODUTO,
					TIPO_PRODUTO,
					VALOR
		from dblink('host=localhost user=postgres password=postgres dbname=lojabi',
		$$
			SELECT 	
					ID_PRODUTO,
					NOME_PRODUTO,
					TIPO_PRODUTO,
					VALOR
		FROM produto
		$$) AS produto
					(ID_PRODUTO INT,
					NOME_PRODUTO VARCHAR(100),
					TIPO_PRODUTO VARCHAR(50),
					VALOR NUMERIC(10,3))
		ORDER BY 1
	) MERGE_SUBQUERY
ON (
		dp.NK_ID_PRODUTO = MERGE_SUBQUERY.ID_PRODUTO
	)
WHEN NOT MATCHED THEN 

INSERT 
		(
			NK_ID_PRODUTO,
			NOME_PRODUTO,
			TIPO_PRODUTO,
			VALOR
		)
VALUES 
		(
			MERGE_SUBQUERY.ID_PRODUTO,
			MERGE_SUBQUERY.NOME_PRODUTO,
			MERGE_SUBQUERY.TIPO_PRODUTO,
			MERGE_SUBQUERY.VALOR
		)
WHEN MATCHED THEN 

UPDATE SET 
			NK_ID_PRODUTO 		=	MERGE_SUBQUERY.ID_PRODUTO,
			NOME_PRODUTO		=	MERGE_SUBQUERY.NOME_PRODUTO,
			TIPO_PRODUTO		=	MERGE_SUBQUERY.TIPO_PRODUTO,
			VALOR				=	MERGE_SUBQUERY.VALOR;
commit;