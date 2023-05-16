BEGIN;
MERGE INTO public.dm_estoque des
USING
	(
		SELECT DISTINCT 
					ID_ESTOQUE,
					ID_LOJA,
					ID_PRODUTO,
					QTD,
					VALOR_FINAL
		from dblink('host=localhost user=postgres password=postgres dbname=lojabi',
		$$
			SELECT 	
					ID_ESTOQUE,
					ID_LOJA,
					ID_PRODUTO,
					QTD,
					VALOR_FINAL
		FROM estoque
		$$) AS estoque
					(ID_ESTOQUE INT,
					ID_LOJA INT,
					ID_PRODUTO INT,
					QTD INT,
					VALOR_FINAL NUMERIC(10,3))
		ORDER BY 1
	) MERGE_SUBQUERY
ON (
		des.NK_ID_ESTOQUE = MERGE_SUBQUERY.ID_ESTOQUE
	)
WHEN NOT MATCHED THEN 

INSERT 
		(
			SK_ID_PRODUTO,
			SK_ID_LOJA,
			NK_ID_ESTOQUE,
			QTD,
			VALOR_FINAL
		)
VALUES 
		(
			MERGE_SUBQUERY.ID_PRODUTO,
			MERGE_SUBQUERY.ID_LOJA,
			MERGE_SUBQUERY.ID_ESTOQUE,
			MERGE_SUBQUERY.QTD,
			MERGE_SUBQUERY.VALOR_FINAL
		)
WHEN MATCHED THEN 

UPDATE SET 
			SK_ID_PRODUTO		=	MERGE_SUBQUERY.ID_PRODUTO,
			SK_ID_LOJA			=	MERGE_SUBQUERY.ID_LOJA,
			NK_ID_ESTOQUE		=	MERGE_SUBQUERY.ID_ESTOQUE,
			QTD					=	MERGE_SUBQUERY.QTD,
			VALOR_FINAL			=	MERGE_SUBQUERY.VALOR_FINAL;
commit;