-- Criação do banco de dados postagemdb
CREATE DATABASE postagemdb OWNER app_postagem;

-- Concede privilégios ao usuário app_postagem para o banco de dados postagemdb
GRANT ALL PRIVILEGES ON DATABASE postagemdb TO app_postagem;

-- Conectar ao banco de dados postagemdb
\c postagemdb;

-- Definição da tabela public.postagens
CREATE TABLE public.postagens (
    createdat timestamptz(6) NULL,
    id bigserial NOT NULL,
    updateat timestamptz(6) NULL,
    cnpj varchar(255) NULL,
    mensagem varchar(255) NULL,
    CONSTRAINT postagens_pkey PRIMARY KEY (id)
);

-- Concede privilégios ao usuário app_postagem para a tabela public.postagens
GRANT ALL PRIVILEGES ON TABLE public.postagens TO app_postagem;

-- Associa o usuário app_postagem como proprietário da tabela public.postagens
ALTER TABLE public.postagens OWNER TO app_postagem;