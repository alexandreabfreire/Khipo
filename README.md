# Khipo (Teste para processo de seleção) - Simples aplicação para controle de estoque em Delphi MVC com injeção de dependência utilizando melhoramento de UI/UX sem componentes externos.  

**CRUD versão 1.0**

**Regra de Negócio**

A aplicação permite cadastrar produtos para entrada e venda de mercadorias. Foram implementadas as seguintes funcionalidades:

*Inclusão, alteração, exclusão e listagem de produtos*

*Entrada e saída de produtos com atualização do saldo*

*Banco de dados com as tabelas de produtos, entradas, vendas e usuários*

Os campos para produtos são identificação, descrição, código, categoria, preço, unidade de venda, unidade de compra e quantidade de conversão. É possível controlar dos tipos de unidades para cada produto, uma para venda e outra para compra. Isso permite controlar o estoque também nos casos quando a compra é feita por caixa e a venda por unidade e é feita a conversão da unidade de compra para a unidade de venda com base na quantidade de conversão cadastrada para o produto. 

Exemplo: Supondo o saldo de um determinado produto igual a zero. Na compra de duas caixas do produto e cada caixa contendo 48 unidades, um lançamento feito informando a quantidade 2 referente a cada caixa, o saldo será de 96 unidades após o lançamento. Depois, na venda de 5 unidades do mesmo produto, o saldo será atualizado para 91.

**Dados técnicos do desenvolvimento** 

Liguagem: *Delphi 11.3*
Sistema operacional: *Windows 10*
Banco de dados: *Interbase 14*

**Banco de Dados**

Tabelas 

tbl_product
tbl_sale (chave estrangeira)
tbl_entry (chave estrangeira)
tbl_user


**Intruções para instalação sem compilar**

O arquivo executável (Project1.exe) e o banco de dados (DBESTOQUE.IB) também foi salvo no diretório. Ambos arquivos devem ser copiados para a mesma pasta.

*Dados de acesso*
Usuário: admin
Senha: admin 


*Query para criação das tabelas e relacionamento do banco de dados*

CREATE TABLE tbl_product
(
id VARCHAR(38) NOT NULL PRIMARY KEY,
code VARCHAR(14) NOT NULL,
productName VARCHAR(100) NOT NULL,
status BOOLEAN NOT NULL,
unitTypeEntry VARCHAR(20) NOT NULL,
unitTypeSale VARCHAR(20) NOT NULL,
packageQuantity FLOAT NOT NULL,
createdDate TIMESTAMP NOT NULL,
lastModifiedDate TIMESTAMP,
balance FLOAT NOT NULL,
price FLOAT NOT NULL,
category VARCHAR(100) NOT NULL
);

CREATE TABLE tbl_entry
(
id VARCHAR(38) NOT NULL PRIMARY KEY,
productId VARCHAR(38) NOT NULL,
unitType VARCHAR(20) NOT NULL,
packageQuantity FLOAT NOT NULL,
quantity FLOAT NOT NULL,
amount FLOAT NOT NULL,
createdDate TIMESTAMP NOT NULL
);

Alter Table tbl_entry	
Add Foreign Key (PRODUCTID ) References tbl_product(id);

CREATE TABLE tbl_sale
(
id VARCHAR(38) NOT NULL PRIMARY KEY,
productId VARCHAR(38) NOT NULL,
unitType VARCHAR(20) NOT NULL,
quantity FLOAT NOT NULL,
price FLOAT NOT NULL,
createdDate TIMESTAMP NOT NULL
);

Alter Table tbl_sale
Add Foreign Key (PRODUCTID ) References tbl_product(id);

CREATE TABLE tbl_user
(
id VARCHAR(38) NOT NULL PRIMARY KEY,
userName VARCHAR(100) NOT NULL,
userPassword VARCHAR(32) NOT NULL,
createdDate TIMESTAMP NOT NULL
);

**Nota**

*Não foram implementados*

Testes automatizados
Documentação completa


