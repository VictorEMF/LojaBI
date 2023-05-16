BEGIN;
MERGE INTO public.dm_enderecoloja de
USING
	(
		SELECT DISTINCT 
					ID_EDRECOLOJA,
					ID_LOJA,
					RUA,
					NUMERO,
					LATITUDE,
					LONGITUDE
		from dblink('host=localhost user=postgres password=postgres dbname=lojabi',
		$$
			SELECT 	
					ID_EDRECOLOJA,
					ID_LOJA,
					RUA,
					NUMERO,
					LATITUDE,
					LONGITUDE
		FROM enderecoloja
		$$) AS cargo
					(ID_EDRECOLOJA INT,
					ID_LOJA INT,
					RUA VARCHAR(100),
					NUMERO INT,
					LATITUDE VARCHAR(50),
					LONGITUDE VARCHAR(50))
		ORDER BY 1
	) MERGE_SUBQUERY
ON (
		de.NK_ID_ENDERECOLOJA = MERGE_SUBQUERY.ID_EDRECOLOJA
	)
WHEN NOT MATCHED THEN 

INSERT 
		(
			NK_ID_ENDERECOLOJA,
			SK_ID_LOJA,
			RUA,
			NUMERO,
			LATITUDE,
			LONGITUDE
		)
VALUES 
		(
			MERGE_SUBQUERY.ID_ENDERECOLOJA,
			MERGE_SUBQUERY.ID_LOJA,
			MERGE_SUBQUERY.RUA,
			MERGE_SUBQUERY.NUMERO,
			MERGE_SUBQUERY.LATITUDE,
			MERGE_SUBQUERY.LONGITUDE
		)
WHEN MATCHED THEN 

UPDATE SET 
			NK_ID_ENDERECOLOJA		=	MERGE_SUBQUERY.ID_ENDERECOLOJA,
			SK_ID_LOJA				=	MERGE_SUBQUERY.ID_LOJA,
			RUA						=	MERGE_SUBQUERY.RUA,
			NUMERO					=	MERGE_SUBQUERY.NUMERO,
			LATITUDE				=	MERGE_SUBQUERY.LATITUDE,
			LONGITUDE				=	MERGE_SUBQUERY.LONGITUDE;
commit;

