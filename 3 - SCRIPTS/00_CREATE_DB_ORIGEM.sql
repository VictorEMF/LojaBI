create table setor(
	id_setor serial primary key,
	nome_setor varchar(50)
);

create table cargo(
	id_cargo serial primary key,
	id_setor int,
	nome_cargo varchar(50),
	salario decimal(7,2),
	foreign key(id_setor) references setor(id_setor)
);


 create table funcionario(
	 id_funcionario serial primary key,
	 id_cargo int,
	 nome_funcionario varchar(100),
	 cpf char(15),
	 foreign key(id_cargo) references cargo(id_cargo)
);

create table loja(
	id_loja serial primary key,
	data_abertura timestamp
);
 
create table enderecoLoja(
	id_edrecoLoja serial primary key,
	id_loja int,
	rua varchar(100),
	numero int,
	latitude varchar(50),
	longitude varchar(50)
);

create table aluguel(
	id_aluguel serial primary key,
	id_loja int,
	valor_aluguel decimal(10,2),
	foreign key(id_loja) references loja(id_loja)
);

create table produto(
	id_produto serial primary key,
	nome_produto varchar(100),
	tipo_produto varchar(50),
	valor decimal(10,3)
);

 create table estoque(
 	id_estoque serial primary key,
 	id_loja int,
 	id_produto int,
 	qtd int,
 	valor_final decimal(10,3),
 	foreign key(id_loja) references loja(id_loja),
 	foreign key(id_produto) references produto(id_produto)
 );
 
create table venda(
	id_venda serial primary key,
	id_funcionario int,
	id_loja int,
	id_produto int,
	qtd int,
	valor decimal(10,3),
	data_venda timestamp,
	tipo_venda varchar(10),
	foreign key(id_loja) references loja(id_loja),
 	foreign key(id_produto) references produto(id_produto),
 	foreign key(id_funcionario) references funcionario(id_funcionario)
);

-- TRIGGER PARA CALCULAR O VALOR FINAL DO PRODUTO NO ESTOQUE --

create function tri_preco_final()
returns trigger as
$$
declare
f_valor float;
begin
	select valor into f_valor from produto where id_produto = new.id_produto;
	update estoque set valor_final = qtd * f_valor where id_produto = new.id_produto;
	return new;
end;
$$
LANGUAGE plpgsql;

create trigger atualizar_preco
after insert on estoque
for each row 
execute procedure tri_preco_final();

-- TRIGGER PARA CALCULAR O VALOR FINAL NA VENDA --

create function tri_preco_final_venda()
returns trigger as
$$
declare
f_valor float;
begin
	select valor into f_valor from produto where id_produto = new.id_produto;
	update venda set valor = qtd * f_valor where id_produto = new.id_produto;
	return new;
end;
$$
LANGUAGE plpgsql;

create trigger atualizar_preco_venda
after insert on venda
for each row 
execute procedure tri_preco_final_venda();