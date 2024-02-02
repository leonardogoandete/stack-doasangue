-- Criando o banco de dados cadastrodb
CREATE DATABASE IF NOT EXISTS cadastrodb;

-- Muda para o banco de dados recém-criado
USE cadastrodb;

-- Create cadastro table
CREATE TABLE IF NOT EXISTS cadastro (
    id BIGINT NOT NULL AUTO_INCREMENT,
    DTYPE VARCHAR(31) NOT NULL,
    cnpj VARCHAR(255),
    cpf VARCHAR(255),
    email VARCHAR(255),
    endereco VARCHAR(255),
    nome VARCHAR(255),
    role ENUM('ADMIN', 'INSTITUICAO', 'USUARIO'),
    senha VARCHAR(255),
    PRIMARY KEY (id)
);

-- Create cadastro_SEQ table
CREATE TABLE IF NOT EXISTS cadastro_SEQ (
    next_val BIGINT
);

-- Insert initial value into cadastro_SEQ
INSERT INTO cadastro_SEQ VALUES (1);

-- Concede privilégios ao usuário cadastro_run para o banco de dados cadastrodb
GRANT ALL PRIVILEGES ON cadastrodb.* TO 'app_cadastro'@'%';
FLUSH PRIVILEGES;