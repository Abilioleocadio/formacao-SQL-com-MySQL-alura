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

-- Inserir dados em uma tabela exemplo na tabela de Produtos
INSERT INTO tbProduto (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) 
VALUES ('1040107', 'Light - 350 ml - Melância', 'Lata', '350 ml', 'Melância', 4.56);

-- Selecionar os registros da tabela de Produtos
SELECT * FROM tbProduto;

-- Inserir inumeros registros juntos 
INSERT INTO tbProduto (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) 
VALUES ('1037797', 'Clean - 2 Litros - Laranja', 'PET', '2 Litros', 'Laranja', 16.01);
INSERT INTO tbProduto (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) 
VALUES ('1000889', 'Sabor da Montanha - 700 ml - Uva', 'Garrafa', '700 ml', 'Uva', 6.31);
INSERT INTO tbProduto (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA) 
VALUES ('1004327', 'Videira do Campo - 1,5 Litros - Melância', 'PET', '1,5 Litros', 'Melância', 19.51);


-- Atualiza dados da tabela 
-- Na realização do Update no Mysql precisa de uma chave primaria para utilizar o comando update sem a chave primaria tem que 
-- 		desabilitar essa função do MySQL em Preference -> SQL Editor.
UPDATE tbProduto SET EMBALAGEM = 'Lata',  PRECO_LISTA = 2.46 WHERE PRODUTO = '544931';
UPDATE tbProduto SET EMBALAGEM = 'Garrafa' WHERE PRODUTO = '1078680';

-- Deleta um registro da tabela
-- Na realização do Delte no Mysql precisa de uma chave primaria para utilizar o comando update sem a chave primaria tem que 
-- 		desabilitar essa função do MySQL em Preference -> SQL Editor.
DELETE FROM tbProduto WHERE PRODUTO = '1078680';

-- Alter Table é um comando para alterar alguma informação da tabela 
-- Neste caso estamos adicionando uma chave primaria para o campo PRODUTO assim o mesmo não poderá ter informações repetidas
ALTER TABLE tbProduto ADD PRIMARY KEY (PRODUTO);

-- Informação de como utilizar o SELECT
select * from tbcliente;

select CPF, NOME, ENDERECO1, ENDERECO2, BAIRRO, CIDADE, ESTADO, CEP, DATA_NASCIMENTO,
IDADE, SEXO, LIMITE_CREDITO, VOLUME_COMPRA, PRIMEIRA_COMPRA
FROM tbcliente;

SELECT CPF, NOME FROM tbcliente;

SELECT CPF, NOME FROM tbcliente LIMIT 5;

SELECT CPF AS CPF_CLIENTE, NOME AS NOME_CLIENTE FROM tbcliente;

SELECT NOME, CPF, SEXO, IDADE, DATA_NASCIMENTO FROM tbcliente;

-- Seleções com filtros Simples
SELECT * FROM tbproduto
WHERE PRODUTO = '544931';

SELECT * FROM tbcliente
WHERE CIDADE = 'Rio de Janeiro';

SELECT * FROM tbproduto 
WHERE SABOR = 'Cítricos';

UPDATE tbproduto SET SABOR = 'Cítricos'
WHERE SABOR = 'Limão';

SELECT * FROM TABELA_DE_VENDEDORES
WHERE NOME = 'Cláudia Morais';

-- Seleções com filtros Númericos
select * from tbcliente where idade = 22;

select * from tbcliente where idade > 22;

select * from tbcliente where idade <= 22;

select * from tbcliente where idade <> 22;

-- Seleção de pessoas com o Nome 'F' para frente
select * from tbcliente where nome >= 'Fernando Cavalcante';

select * from tbcliente where nome <> 'Fernando Cavalcante';

-- Igual ou diferente no Double não consegue utilizar
select * from tbproduto
where PRECO_LISTA < 16.008;

-- Para conseguir o campo especifico deve utilizar o between
select * from tbproduto
where PRECO_LISTA BETWEEN 16.007 and 16.009;

select * from TABELA_DE_VENDEDORES
where percentual_comissao > 0.10;

-- Seleção com filtros de Datas
select * from tbcliente 
where DATA_NASCIMENTO = '1995-01-13';

select * from tbcliente 
where DATA_NASCIMENTO > '1995-01-13';

select * from tbcliente 
where DATA_NASCIMENTO <= '1995-01-13';

select * from tbcliente 
where YEAR(DATA_NASCIMENTO) = 1995;

select * from tbcliente 
where MONTH(DATA_NASCIMENTO) = 10;

select * from TABELA_DE_VENDEDORES
where YEAR(DATA_ADMISSAO) >= 2016;

-- Seleção com filtros Compostos
select * from tbproduto 
where preco_lista between 16.007 and 16.008;

select * from tbproduto where preco_lista >= 16.007;
select * from tbproduto where preco_lista <= 16.007;

select * from tbproduto
where PRECO_LISTA >= 16.0007
and PRECO_LISTA <= 16.009;

select * from tbcliente
where idade >= 18 and idade <= 22
and sexo = 'M';

select * from tbcliente
where cidade = 'Rio de Janeiro'
or bairro = 'Jardins';

select * from tbcliente
where ( idade >= 18 and idade <= 22
and sexo = 'M') or (cidade = 'Rio de Janeiro'
or bairro = 'Jardins');

select * from TABELA_DE_VENDEDORES
where DE_FERIAS = 1 and YEAR(DATA_ADMISSAO) < 2016;
