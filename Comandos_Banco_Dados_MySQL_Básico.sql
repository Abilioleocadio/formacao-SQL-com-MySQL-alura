			Comandos de Banco de Dados MySQL Básico

-- Criar um Schema no banco de dados
CREATE SCHEMA sucos;

-- Deleta um Schema do banco de dados
DROP SCHEMA sucos;

-- Utiliza o Schema informado 
USE sucos;

-- Cria uma tabela os seus valores de colunas tem que serem informados
CREATE TABLE tbCliente
(CPF VARCHAR(11),
NOME VARCHAR(100),
ENDERECO1 VARCHAR(150),
ENDERECO2 VARCHAR(150),
BAIRRO VARCHAR(50),
CIDADE VARCHAR(50),
ESTADO VARCHAR(50),
CEP VARCHAR(8),
IDADE SMALLINT,
SEXO VARCHAR(1),
LIMITE_CREDITO FLOAT,
VOLUME_COMPRA FLOAT,
PRIMEIRA_COMPRA BIT(1));

CREATE TABLE TABELA_DE_VENDEDORES
(MATRICULA VARCHAR(5),
NOME VARCHAR(100),
PERCENTUAL_COMISSAO FLOAT);

-- Deleta uma tabela do banco de dados
DROP TABLE sucos.TABELA_DE_VENDEDORES;