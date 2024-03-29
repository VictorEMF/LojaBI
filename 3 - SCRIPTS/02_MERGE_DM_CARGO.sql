BEGIN;
MERGE INTO public.dm_cargo dc 
USING
	(
		SELECT DISTINCT 
					ID_CARGO,
					ID_SETOR,
					NOME_CARGO,
					SALARIO
		from dblink('host=localhost user=postgres password=postgres dbname=lojabi',
		$$
			SELECT 	
					ID_CARGO, 
					ID_SETOR, 
					NOME_CARGO,
					SALARIO
		FROM cargo
		$$) AS cargo
					(ID_CARGO INT,
					ID_SETOR INT,
					NOME_CARGO VARCHAR(50),
					SALARIO NUMERIC(7,2))
		ORDER BY 1
	) MERGE_SUBQUERY
ON (
		dc.NK_ID_CARGO = MERGE_SUBQUERY.ID_CARGO
	)
WHEN NOT MATCHED THEN 

INSERT 
		(
			SK_ID_SETOR,
			NK_ID_CARGO,
			NOME_CARGO,
			SALARIO
		)
VALUES 
		(
			MERGE_SUBQUERY.ID_SETOR,
			MERGE_SUBQUERY.ID_CARGO,
			MERGE_SUBQUERY.NOME_CARGO,
			MERGE_SUBQUERY.SALARIO
		)
WHEN MATCHED THEN 

UPDATE SET 
			SK_ID_SETOR 	=	MERGE_SUBQUERY.ID_SETOR,
			NK_ID_CARGO		=	MERGE_SUBQUERY.ID_CARGO,
			NOME_CARGO		=	MERGE_SUBQUERY.NOME_CARGO,
			SALARIO			=	MERGE_SUBQUERY.SALARIO; 
commit;