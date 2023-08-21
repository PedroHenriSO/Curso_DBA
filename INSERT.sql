SELECT * FROM tb_endereco;
INSERT INTO tb_endereco
(id_endereco,CEP,numero_casa)
VALUES
	(1,12345,678),
    (2,54321,876),
    (3,98765,432),
    (4,98765,432),
    (5,23456,789),
    (6,87654,321),
    (7,34567,890),
    (8,78901,234),
    (9,45678,901),
    (10,89012,345),
    (11,56789,012),
    (12,90123,456),
    (13,67890,123);
    
SELECT * FROM tb_cliente_fisico;
INSERT INTO tb_cliente_fisico
(id_cliente_fisico,nome,sobrenome,email,dt_nascimento,CPF,statu,id_endereco)
VALUES
	(20, 'João', 'Silva', 'joao@email.com', '2001-03-15', '123.456.789-01','Ativo', 8),
    (21, 'Ana', 'Souza', 'ana@email.com', '2002-07-22', '987.654.321-02', 'Ativo', 9),
    (22, 'Pedro', 'Oliveira', 'pedro@email.com', '2003-11-10', '123.456.789-01', 'Nao ativo', 10),
    (23, 'Sofia', 'Pereira', 'sofia@email.com', '2001-09-18', '987.654.321-02', 'Nao ativo', 1),
    (24, 'Lucas', 'Costa', 'lucas@email.com', '2002-12-05', '123.456.789-01', 'Nao ativo', 12),
    (25, 'Isabela', 'Almeida', 'isabela@email.com', '2003-08-30', '987.654.321-02', 'Ativo', 13),
    (26, 'Mateus', 'Rodrigues', 'mateus@email.com', '2001-08-30', '123.456.789-01', 'Ativo', 11),
    (27, 'Laura', 'Carvalho', 'laura@email.com', '2001-06-25', '987.654.321-02', 'Ativo', 7);
    
    SELECT * FROM tb_cliente_juridico;
INSERT INTO tb_cliente_juridico
(id_cliente_juridico,nome,sobrenome,email,dt_nascimento,CNPJ,statu,id_endereco)
VALUES
	(31, 'Guilherme', 'Silva', 'gulherme@email.com', '2001-03-15', '12345678901234', 'Nao ativo', 1),
    (32, 'Alice', 'Rodrigues', 'alice@email.com', '2002-07-22', '23456789012345', 'Ativo', 2),
    (33, 'Gabriel', 'Costa', 'gabriel@email.com', '1994-11-10', '34567890123456', 'Nao tivo', 3),
    (34, 'Beatriz', 'Souza', 'bia@email.com', '1995-09-18', '45678901234567', 'Ativo', 4),
    (35, 'Rafael', 'Santos', 'rafa@email.com', '1996-12-05', '56789012345678', 'Ativo', 4),
    (36, 'Eduarda', 'Carvalho', 'duda@email.com', '1998-08-30', '67890123456789', 'Nao ativo', 5),
    (37, 'Daniel', 'Ferreira', 'dany@email.com', '2000-06-25', '78901234567890', 'Nao ativo', 6),
	(38, 'Julia', 'Pereira', 'juju@email.com', '1997-04-08', '89012345678901', 'Ativo', 7);
    
    SELECT * FROM tb_tipo_telefone;
INSERT INTO tb_tipo_telefone
	(id_tipo_telefone,descricao)
VALUES
	(41, 'Fax'),
    (42, 'Residencial'),
    (43, 'Celular'),
    (44, 'Comercial'),
    (45, 'Trabalho');
    
 SELECT * FROM tb_telefone;
INSERT INTO tb_telefone
	(id_telefone,DDD,numero,id_tipo)
VALUES
	(51,11, '98765-4321',41),
    (52,21, '91234-5678',42),
    (53,31, '99999-8888',43),
    (54,41, '98888-7777',44),
    (55,51, ' 97777-6666',45),
    (56,61, ' 96666-5555',42),
    (57,71, '95555-4444',43),
    (58,81, '94444-3333',44);
    
    SELECT * FROM tb_cliente_telefone;
INSERT INTO tb_cliente_telefone
	(id_cliente_telefone,id_cliente_fisico,id_cliente_juridico,id_telefone)
VALUES
	(61,20,31,51),
    (62,21,32,52),
    (63,22,33,53),
    (64,23,34,54),
    (65,24,35,55),
    (66,25,36,56),
    (67,26,37,57),
    (68,27,38,58);
    
   SELECT * FROM tb_tipo_transferencia;
INSERT INTO tb_tipo_transferencia
	(id_tipo_transferencia,descricao)
VALUES
	(71,'Transferência por PIX'),
    (72,'Transferência Bancária de Conta Poupança para Conta Corrente'),
    (73,'Transferência Eletrônica Disponível'),
    (74,'Documento de Ordem de Crédito'),
    (75,'Transferência entre Contas do Mesmo Banco'),
    (76,'Transferência Internacional'),
    (77,'Transferência Automática'),
    (78,'Débito Direto Autorizado'),
	(79,'Transferência entre Contas de Terceiros');
    
    SELECT * FROM tb_transferencia;
INSERT INTO tb_transferencia
	(id_transferencia,conta_saida,conta_destino,valor,id_tipo)
VALUES
	(81,'12345-6','87654-3','R$500,00',71),
    (82,'98765-4','65432-1','R$1.250,75',72),
    (83,'56789-0','12345-6','R$150,50',73),
    (84,'43210-9','13579-8','R$3.000,20',74),
    (85,'24680-2','24680-2','R$800,60',75),
    (86,'13579-8','43210-9','R$2.750,30',76),
    (87,'65432-1','56789-0','R$400,90',77),
    (88,'87654-3','98765-4','R$5.600,15',78),
	(89,'98765-1','12345-0','R$950,25',79);
    
SELECT * FROM tb_tipo_conta;
INSERT INTO tb_tipo_conta
	(id_tipo_conta,descricao)
VALUES
	(91,'Conta Corrente'),
    (92,'Conta Poupança'),
    (93,'Conta Salário'),
    (94,'Conta Universitária'),
    (95,'Conta Digital'),
    (96,'Conta Conjunta'),
    (97,'Conta Empresarial'),
    (98,'Conta Investimento'),
	(99,'Conta Internacional'),
    (100,'Conta de Pagamento');
    
SELECT * FROM tb_conta;
INSERT INTO tb_conta
	(id_conta,numero,agencia,saldo,statu,id_cliente_juridico,id_cliente_fisico,id_tipo,id_transferencia)
VALUES
	(110,'12345-6',1001,'R$1.250,00','ativo',31,20,91,81),
    (111,'98765-4',2002,'R$5.750,50','nao ativo',32,21,92,82),
	(112,'56789-0',3003,'R$800,25','ativo',33,22,91,83),
    (113,'43210-9',4004,'R$3.100,00','ativo',34,23,92,84),
    (114,'24680-2',5005,'R$2.450,75','ativo',35,24,93,85),
    (115,'13579-8',6006,'R$10.000,00','ativo',36,25,94,86),
    (116,'65432-1',7007,'R$350,50','nao ativo',37,26,94,87),
    (117,'87654-3',8008,'R$7.800,00','ativo',36,27,98,88),
	(118,'98765-1',1010,'R$1.500,00','ativo',32,26,98,89);