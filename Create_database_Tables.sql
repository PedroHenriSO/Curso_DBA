CREATE DATABASE IF NOT EXISTS db_fintech COLLATE utf8mb4_general_ci CHARSET utf8mb4;
USE db_fintech;

CREATE TABLE IF NOT EXISTS tb_endereco(
id_endereco INTEGER(5) PRIMARY KEY NOT NULL AUTO_INCREMENT,
CEP VARCHAR(35) NOT NULL,
numero_casa INT(5) NOT NULL
);

CREATE TABLE IF NOT EXISTS tb_cliente_fisico(
id_cliente_fisico INTEGER(5) PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome CHAR(25) NOT NULL,
sobrenome CHAR(21) NOT NULL,
email VARCHAR(30) NOT NULL,
dt_nascimento DATE,
CPF VARCHAR(11) NOT NULL,
statu CHAR(30) NOT NULL,
id_endereco INT NOT NULL,
CONSTRAINT fk_id_endereco FOREIGN KEY (id_endereco) REFERENCES tb_endereco(id_endereco)
);

CREATE TABLE IF NOT EXISTS tb_cliente_juridico(
id_cliente_juridico INTEGER(5) PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome CHAR(25) NOT NULL,
sobrenome CHAR(21) NOT NULL,
email VARCHAR(30) NOT NULL,
dt_nascimento DATE,
CNPJ VARCHAR(20) NOT NULL,
statu CHAR(30) NOT NULL,
id_endereco INT NOT NULL,
CONSTRAINT fk_id_endereco1 FOREIGN KEY (id_endereco) REFERENCES tb_endereco(id_endereco)
);

CREATE TABLE IF NOT EXISTS tb_tipo_telefone(
id_tipo_telefone INTEGER(5) PRIMARY KEY NOT NULL AUTO_INCREMENT,
descricao CHAR(25) NOT NULL
);

CREATE TABLE IF NOT EXISTS tb_telefone(
id_telefone INTEGER(5) PRIMARY KEY NOT NULL AUTO_INCREMENT,
DDD INTEGER(3) NOT NULL,
numero VARCHAR(11) NOT NULL,
id_tipo INT NOT NULL,
CONSTRAINT fk_id_tipo FOREIGN KEY (id_tipo) REFERENCES tb_tipo_telefone(id_tipo_telefone)
);

CREATE TABLE IF NOT EXISTS tb_cliente_telefone(
id_cliente_telefone INTEGER(5) PRIMARY KEY NOT NULL AUTO_INCREMENT,
id_cliente_fisico INT NOT NULL,
id_cliente_juridico INT NOT NULL,
id_telefone INT NOT NULL,
CONSTRAINT fk_id_cliente_fisico FOREIGN KEY (id_cliente_fisico) REFERENCES tb_cliente_fisico(id_cliente_fisico),
CONSTRAINT fk_id_cliente_juridico2 FOREIGN KEY (id_cliente_juridico) REFERENCES tb_cliente_juridico(id_cliente_juridico),
CONSTRAINT fk_id_telefone FOREIGN KEY (id_telefone) REFERENCES tb_telefone(id_telefone)
);

CREATE TABLE IF NOT EXISTS tb_tipo_transferencia(
id_tipo_transferencia INTEGER(5) PRIMARY KEY NOT NULL AUTO_INCREMENT,
descricao CHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS tb_transferencia(
id_transferencia INTEGER(5) PRIMARY KEY NOT NULL AUTO_INCREMENT,
conta_saida VARCHAR(255) NOT NULL,
conta_destino VARCHAR(255) NOT NULL,
valor VARCHAR(30),
id_tipo INT NOT NULL,
CONSTRAINT fk_id_tipo2 FOREIGN KEY (id_tipo) REFERENCES tb_tipo_transferencia(id_tipo_transferencia)
);

CREATE TABLE IF NOT EXISTS tb_tipo_conta(
id_tipo_conta INTEGER(5) PRIMARY KEY NOT NULL AUTO_INCREMENT,
descricao VARCHAR(25) NOT NULL
);

CREATE TABLE IF NOT EXISTS tb_conta(
id_conta INTEGER(5) PRIMARY KEY NOT NULL AUTO_INCREMENT,
numero VARCHAR(15) NOT NULL,
agencia VARCHAR(15) NOT NULL,
saldo VARCHAR(20),
statu CHAR(25) NOT NULL,
id_cliente_juridico INT NOT NULL,
id_cliente_fisico INT NOT NULL,
id_tipo INT NOT NULL,
id_transferencia INT NOT NULL,
CONSTRAINT fk_id_cliente_juridico1 FOREIGN KEY (id_cliente_juridico) REFERENCES tb_cliente_juridico(id_cliente_juridico),
CONSTRAINT fk_id_cliente_fisico1 FOREIGN KEY (id_cliente_fisico) REFERENCES tb_cliente_fisico(id_cliente_fisico),
CONSTRAINT fk_id_tipo3 FOREIGN KEY (id_tipo) REFERENCES tb_tipo_conta(id_tipo_conta),
CONSTRAINT fk_id_transferencia FOREIGN KEY (id_transferencia) REFERENCES tb_transferencia(id_transferencia)
);