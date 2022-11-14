create table produto(
	id_produto serial primary key,
	nome_produto varchar(100),
	tipo_produto varchar(9),
	valor numeric(4,2),
	dat_validade date
);---

create table cargo(
	id_cargo serial primary key,
	nome_cargo varchar(100),
	salario numeric(4,2)
);---

create table enderecoF(
	id_endereco serial primary key,
	pais varchar(50),
	cidade varchar(100),
	estado varchar(100),
	numero char(5),
	rua varchar(100)
);---

create table funcionario(
	id_funcionario serial primary key,
	id_enderecoF int,
	id_cargo int,
	nome_funcionario varchar(100),
	FOREIGN KEY (id_enderecoF) references enderecoF(id_enderecoF),
	FOREIGN KEY (id_cargo) references cargo(id_cargo),
	
);---

create table lojas(
	id_loja seria primary key,
	pais varchar(50),
	cidade varchar(100),
	estado varchar(100),
	numero char(5),
	rua varchar(100),
	latitude varchar(50),
	longitude varchar(50)
);---

create table estoque(
	id_item_estoque serial primary key,
	id_produto int,
	id_loja int,
	qtd int,
	valor numeric(8,2),
	FOREIGN KEY (id_loja) references lojas(id_loja),
	FOREIGN KEY (id_loja) references lojas(id_loja),
);---

create table venda(
	id_venda serial primary key,
	id_funcionario int,
	id_loja int,
	id_produto int,
	qtd int,
	valor number(8,2),
	FOREIGN KEY (id_funcionario) references funcionario(id_funcionario),
	FOREIGN KEY (id_loja) references lojas(id_loja),
	FOREIGN KEY (id_produto) references produto(id_produto),
	
);

--- PROCEDURE

create or replace procedure att_estoque(loja int,produto int ,V_qtd int)
language plpgsql
as $$
DECLARE
V_valor_produto number(8,2);
begin 

	select valor into V_valor_produto from produto where id_produto = produto;
	
	insert into estoque(id_produto, id_loja, qtd_valor, valor) values(produto, loja, V_qtd, V_valor_produto * V_qtd);
	commit;
end;$$

---

create or replace procedure venda(funcionario int, loja int, produto int, V_qtd int)
language plpgsql
as $$
DECLARE
V_valor_produto number(8,2);
V_qtd_valida int;
BEGIN
	
	select qtd into V_qtd_valida from estoque where id_produto = produto;
	
	if V_qtd_valida - V_qtd > 0 then
		insert into venda(id_funcionario, id_loja, id_produto, qtd, valor) values (funcionario, loja, produto, V_qtd);
		update estoque set qtd = qtd - V_qtd where id_produto = produto;
	else
		raise notice 'A quantidade que você deseja não esta disponivel no estoque!';
	commit;
end;$$