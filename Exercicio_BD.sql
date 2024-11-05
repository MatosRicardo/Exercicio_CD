CREATE DATABASE Db_cds;
use Db_cds;

CREATE TABLE Artista (
	cod_artista  int not null auto_increment primary key,
    nome_artista varchar(100)
);

CREATE TABLE Gravadora (
	Cod_Grav int not null auto_increment primary key,
    Nome_Grav varchar(50) not null
);

CREATE TABLE Categoeria (
	Cod_Cat int not null auto_increment primary key,
    Nome_Cat varchar(50) not null 
);

CREATE TABLE Estado (
 sigla_Est char(2) not null primary key,
 nome_Est char(50) not null
);

CREATE TABLE Cidade (
	Cod_Cid int not null auto_increment primary key,
    Nome_Cid varchar(100) not null,
    sigla_Est char(2),
    FOREIGN KEY (sigla_Est) REFERENCES Estado(sigla_Est)
);

CREATE TABLE Cliente (
	Cod_Cli int not null auto_increment primary key,
    Cod_Cid int not null,
	FOREIGN KEY (Cod_CID) REFERENCES Cidade(Cod_CID),
    Nome_Cli varchar(100) not null,
    End_Cli varchar(200) not null,
    Renda_Cli decimal(10,2) not null default 0,
    Sexo_Cli enum("F", "M")
);

CREATE TABLE Conjuge (
	Cod_Cli int not null auto_increment primary key,
    Cod_clii int not null,
	FOREIGN KEY (Cod_clii) REFERENCES Cliente(Cod_Cli),   
    Nome_Conj Varchar(100),
    Renda_Conj Decimal(10,2) Default 0,
    Sexo_Conj enum("F", "M")
);

CREATE TABLE Funcionario (
	Cod_Func int not null auto_increment primary key,
    Nome_Func Varchar(100) NOT NULL,
    End_Func Varchar(200) NOT NULL,
    Sal_Func Decimal(10,2) NOT NULL,
    Sexo_Func enum("F", "M")
);

CREATE TABLE Dependente (
	Cod_Dep Int NOT NULL,
    Cod_Func Int NOT NULL,
	FOREIGN KEY (Cod_Func) REFERENCES Funcionario(Cod_Func), 
    Nome_Dep Varchar(100) NOT NULL,
    Sexo_Dep enum("F", "M")
);

CREATE TABLE Titulo (
	Cod_Tit int not null auto_increment primary key,
    Cod_Cat int not null,
	FOREIGN KEY (Cod_CAT) REFERENCES Categoeria(Cod_Cat),
    Cod_Grav int not null,
    Nome_CD Varchar(100) NOT NULL,
    Val_CD  Decimal(10,2) NOT NULL,
    Qtd_Estq Int Not NULL
);

CREATE TABLE Pedido (
	Num_Ped int not null auto_increment primary key,
    Cod_Cli int not null,
	FOREIGN KEY (Cod_Cli) REFERENCES Cliente(Cod_Cli),
    Cod_Func int not null,
	FOREIGN KEY (Cod_Func) REFERENCES Funcionario(Cod_Func),
    Data_Ped datetime NOT NULL,
    Val_Ped Decimal(10,2) NOT NULL default 0
);

CREATE TABLE Titulo_Pedido (
    Num_Ped INT NOT NULL,
    Cod_Tit INT NOT NULL,
    Qtd_CD INT NOT NULL CHECK (Qtd_CD >= 1),
    Val_CD DECIMAL(10,2) NOT NULL CHECK (Val_CD > 0),
    PRIMARY KEY (Num_Ped, Cod_Tit),
    FOREIGN KEY (Num_Ped) REFERENCES Pedido(Num_Ped),
    FOREIGN KEY (Cod_Tit) REFERENCES Titulo(Cod_Tit)
);

CREATE TABLE Titulo_Artista (
    Cod_Tit INT NOT NULL,
    cod_artista INT NOT NULL,
    PRIMARY KEY (Cod_Tit, cod_artista),
    FOREIGN KEY (Cod_Tit) REFERENCES Titulo(Cod_Tit),
    FOREIGN KEY (cod_artista) REFERENCES Artista(cod_artista)
);






