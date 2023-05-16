merge into public.dm_teste dt
using
	(
		select distinct 
			id,
			nome,
			email,
			genero,
			ip
			from dblink('host=localhost user=postgres password=postgres dbname=teste',
			$$
			select id,nome,email,genero,ip from teste 
			$$) as loja 
				(id int,
				nome varchar,
				email varchar,
				genero varchar,
				ip varchar)
			order by 1
		
	) MERGE_SUBQUERY
on (
		dt.novo_id = MERGE_SUBQUERY.id
	)
when not matched then 

insert
		(
				novo_id,
				nome,
				email,
				genero,
				ip
		)
values  (
				MERGE_SUBQUERY.id,
				MERGE_SUBQUERY.nome,
				MERGE_SUBQUERY.email,
				MERGE_SUBQUERY.genero,
				MERGE_SUBQUERY.ip
		)
		
when matched then

update set
		novo_id  =	MERGE_SUBQUERY.id,
		nome     =	MERGE_SUBQUERY.nome,
		email    =	MERGE_SUBQUERY.email,
		genero   =	MERGE_SUBQUERY.genero,
		ip       =	MERGE_SUBQUERY.ip;


select * from dm_teste;