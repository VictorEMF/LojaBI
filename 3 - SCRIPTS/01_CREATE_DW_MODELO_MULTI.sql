
CREATE SEQUENCE public.dm_produto_sk_id_produto_seq;

CREATE TABLE public.dm_produto (
                sk_id_produto INTEGER NOT NULL DEFAULT nextval('public.dm_produto_sk_id_produto_seq'),
                nk_id_produto INTEGER NOT NULL,
                nome_produto VARCHAR(100) NOT NULL,
                tipo_produto VARCHAR(50) NOT NULL,
                valor NUMERIC(10,3) NOT NULL,
                dado_versao INTEGER DEFAULT 1 NOT NULL,
                data_primeiro_dado TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
                data_ultimo_dado TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
                CONSTRAINT dm_produto_pk PRIMARY KEY (sk_id_produto)
);


ALTER SEQUENCE public.dm_produto_sk_id_produto_seq OWNED BY public.dm_produto.sk_id_produto;

CREATE SEQUENCE public.dm_loja_sk_id_loja_seq;

CREATE TABLE public.dm_loja (
                sk_id_loja INTEGER NOT NULL DEFAULT nextval('public.dm_loja_sk_id_loja_seq'),
                nk_id_loja INTEGER NOT NULL,
                data_abertura TIMESTAMP NOT NULL,
                dado_versao INTEGER DEFAULT 1 NOT NULL,
                data_primeiro_dado TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
                data_ultimo_dado TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
                CONSTRAINT dm_loja_pk PRIMARY KEY (sk_id_loja)
);


ALTER SEQUENCE public.dm_loja_sk_id_loja_seq OWNED BY public.dm_loja.sk_id_loja;

CREATE SEQUENCE public.dm_aluguel_sk_id_aluguel_seq;

CREATE TABLE public.dm_aluguel (
                sk_id_aluguel INTEGER NOT NULL DEFAULT nextval('public.dm_aluguel_sk_id_aluguel_seq'),
                sk_id_loja INTEGER NOT NULL,
                nk_id_aluguel INTEGER NOT NULL,
                valor_aluguel NUMERIC(10,2) NOT NULL,
                dado_versao INTEGER DEFAULT 1 NOT NULL,
                data_primeiro_dado TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
                data_ultimo_dado TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
                CONSTRAINT dm_aluguel_pk PRIMARY KEY (sk_id_aluguel)
);


ALTER SEQUENCE public.dm_aluguel_sk_id_aluguel_seq OWNED BY public.dm_aluguel.sk_id_aluguel;

CREATE SEQUENCE public.dm_estoque_sk_id_estoque_seq;

CREATE TABLE public.dm_estoque (
                sk_id_estoque INTEGER NOT NULL DEFAULT nextval('public.dm_estoque_sk_id_estoque_seq'),
                sk_id_produto INTEGER NOT NULL,
                sk_id_loja INTEGER NOT NULL,
                nk_id_estoque INTEGER NOT NULL,
                qtd INTEGER NOT NULL,
                valor_final NUMERIC(10,3) NOT NULL,
                dado_versao INTEGER DEFAULT 1 NOT NULL,
                data_primeiro_dado TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
                data_ultimo_dado TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
                CONSTRAINT dm_estoque_pk PRIMARY KEY (sk_id_estoque)
);


ALTER SEQUENCE public.dm_estoque_sk_id_estoque_seq OWNED BY public.dm_estoque.sk_id_estoque;

CREATE SEQUENCE public.dm_enderecoloja_sk_id_enderecoloja_seq;

CREATE TABLE public.dm_enderecoLoja (
                sk_id_enderecoLoja INTEGER NOT NULL DEFAULT nextval('public.dm_enderecoloja_sk_id_enderecoloja_seq'),
                nk_id_enderecoLoja INTEGER NOT NULL,
                sk_id_loja INTEGER NOT NULL,
                rua VARCHAR(100) NOT NULL,
                numero INTEGER NOT NULL,
                latitude VARCHAR(50) NOT NULL,
                longitude VARCHAR(50) NOT NULL,
                dado_versao INTEGER DEFAULT 1 NOT NULL,
                data_primeiro_dado TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
                data_ultimo_dado TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
                CONSTRAINT dm_enderecoloja_pk PRIMARY KEY (sk_id_enderecoLoja)
);


ALTER SEQUENCE public.dm_enderecoloja_sk_id_enderecoloja_seq OWNED BY public.dm_enderecoLoja.sk_id_enderecoLoja;

CREATE SEQUENCE public.dm_setor_sk_id_setor_seq;

CREATE TABLE public.dm_setor (
                sk_id_setor INTEGER NOT NULL DEFAULT nextval('public.dm_setor_sk_id_setor_seq'),
                nk_id_setor INTEGER NOT NULL,
                nome_setor VARCHAR(50) NOT NULL,
                dado_versao INTEGER DEFAULT 1 NOT NULL,
                data_primeiro_dado TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
                data_ultimo_dado TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
                CONSTRAINT dm_setor_pk PRIMARY KEY (sk_id_setor)
);


ALTER SEQUENCE public.dm_setor_sk_id_setor_seq OWNED BY public.dm_setor.sk_id_setor;

CREATE SEQUENCE public.dm_cargo_sk_id_cargo_seq;

CREATE TABLE public.dm_cargo (
                sk_id_cargo INTEGER NOT NULL DEFAULT nextval('public.dm_cargo_sk_id_cargo_seq'),
                sk_id_setor INTEGER NOT NULL,
                nk_id_cargo INTEGER NOT NULL,
                nome_cargo VARCHAR(50) NOT NULL,
                salario NUMERIC(7,2) NOT NULL,
                dado_versao INTEGER DEFAULT 1 NOT NULL,
                data_primeiro_dado TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
                data_ultimo_dado TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
                CONSTRAINT dm_cargo_pk PRIMARY KEY (sk_id_cargo)
);


ALTER SEQUENCE public.dm_cargo_sk_id_cargo_seq OWNED BY public.dm_cargo.sk_id_cargo;

CREATE SEQUENCE public.dm_funcionario_sk_id_funcionario_seq;

CREATE TABLE public.dm_funcionario (
                sk_id_funcionario INTEGER NOT NULL DEFAULT nextval('public.dm_funcionario_sk_id_funcionario_seq'),
                sk_id_cargo INTEGER NOT NULL,
                nk_id_funcionario INTEGER NOT NULL,
                nome_funcionario VARCHAR(100) NOT NULL,
                cpf VARCHAR(15) NOT NULL,
                dado_versao INTEGER DEFAULT 1 NOT NULL,
                data_primeiro_dado TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
                data_ultimo_dado TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
                CONSTRAINT dm_funcionario_pk PRIMARY KEY (sk_id_funcionario)
);


ALTER SEQUENCE public.dm_funcionario_sk_id_funcionario_seq OWNED BY public.dm_funcionario.sk_id_funcionario;

CREATE TABLE public.ft_venda (
				cod_venda INTEGER PRIMARY KEY,
                sk_id_funcionario INTEGER,
                sk_id_produto INTEGER NOT NULL,
                sk_id_loja INTEGER NOT NULL,
                qtd INTEGER NOT NULL,
                valor NUMERIC(10,3) NOT NULL,
                data_venda TIMESTAMP NOT NULL,
                tipo_venda VARCHAR(10) NOT NULL,
                dado_versao INTEGER DEFAULT 1 NOT NULL,
                data_primeiro_dado TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
                data_ultimo_dado TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.dm_estoque ADD CONSTRAINT dm_produto_dm_estoque_fk
FOREIGN KEY (sk_id_produto)
REFERENCES public.dm_produto (sk_id_produto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_venda ADD CONSTRAINT dm_produto_ft_venda_fk
FOREIGN KEY (sk_id_produto)
REFERENCES public.dm_produto (sk_id_produto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.dm_enderecoLoja ADD CONSTRAINT dm_loja_dm_enderecoloja_fk
FOREIGN KEY (sk_id_loja)
REFERENCES public.dm_loja (sk_id_loja)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.dm_estoque ADD CONSTRAINT dm_loja_dm_estoque_fk
FOREIGN KEY (sk_id_loja)
REFERENCES public.dm_loja (sk_id_loja)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_venda ADD CONSTRAINT dm_loja_ft_venda_fk
FOREIGN KEY (sk_id_loja)
REFERENCES public.dm_loja (sk_id_loja)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.dm_aluguel ADD CONSTRAINT dm_loja_dm_aluguel_fk
FOREIGN KEY (sk_id_loja)
REFERENCES public.dm_loja (sk_id_loja)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.dm_aluguel ADD CONSTRAINT dm_loja_dm_aluguel_fk1
FOREIGN KEY (sk_id_loja)
REFERENCES public.dm_loja (sk_id_loja)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.dm_cargo ADD CONSTRAINT dm_setor_dm_cargo_fk
FOREIGN KEY (sk_id_setor)
REFERENCES public.dm_setor (sk_id_setor)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.dm_funcionario ADD CONSTRAINT dm_cargo_dm_funcionario_fk
FOREIGN KEY (sk_id_cargo)
REFERENCES public.dm_cargo (sk_id_cargo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_venda ADD CONSTRAINT dm_funcionario_ft_venda_fk
FOREIGN KEY (sk_id_funcionario)
REFERENCES public.dm_funcionario (sk_id_funcionario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;