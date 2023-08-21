/*Ver detalhes da transferencia*/

SELECT * FROM vw_detalhes_transferencia;

CREATE VIEW vw_detalhes_transferencia AS
SELECT
    t.id_transferencia,
    t.conta_saida,
    t.conta_destino,
    t.valor,
    tt.descricao AS tipo_transferencia
FROM
    tb_transferencia t
JOIN
    tb_tipo_transferencia tt ON t.id_tipo = tt.id_tipo_transferencia;


/*Ver detalhes dos clientes*/

SELECT * FROM vw_detalhes_clientes;

CREATE VIEW vw_detalhes_clientes AS
SELECT
    cf.id_cliente_fisico AS id_cliente,
    CONCAT(cf.nome, ' ', cf.sobrenome) AS nome_completo,
    'Pessoa Física' AS tipo_cliente,
    cf.email,
    cf.dt_nascimento AS data_nascimento,
    cf.CPF AS identificacao,
    e.CEP,
    e.numero_casa AS numero_endereco,
    t.numero AS telefone
FROM
    tb_cliente_fisico cf
JOIN
    tb_endereco e ON cf.id_endereco = e.id_endereco
LEFT JOIN
    tb_cliente_telefone ct ON cf.id_cliente_fisico = ct.id_cliente_fisico
LEFT JOIN
    tb_telefone t ON ct.id_telefone = t.id_telefone
UNION
SELECT
    cj.id_cliente_juridico AS id_cliente,
    CONCAT(cj.nome, ' ', cj.sobrenome) AS nome_completo,
    'Pessoa Jurídica' AS tipo_cliente,
    cj.email,
    cj.dt_nascimento AS data_nascimento,
    cj.CNPJ AS identificacao,
    e.CEP,
    e.numero_casa AS numero_endereco,
    t.numero AS telefone
FROM
    tb_cliente_juridico cj
JOIN
    tb_endereco e ON cj.id_endereco = e.id_endereco
LEFT JOIN
    tb_cliente_telefone ct ON cj.id_cliente_juridico = ct.id_cliente_juridico
LEFT JOIN
    tb_telefone t ON ct.id_telefone = t.id_telefone;


/*ver transacoes dos clientes*/

SELECT * FROM vw_transacoes_clientes;

CREATE VIEW vw_transacoes_clientes AS
SELECT
    cf.id_cliente_fisico AS id_cliente,
    CONCAT(cf.nome, ' ', cf.sobrenome) AS nome_completo,
    cf.CPF AS identificacao,
    'Pessoa Física' AS tipo_cliente,
    t.id_transferencia,
    t.conta_saida,
    t.conta_destino,
    t.valor,
    tt.descricao AS tipo_transferencia
FROM
    tb_cliente_fisico cf
LEFT JOIN
    tb_conta c ON cf.id_cliente_fisico = c.id_cliente_fisico
LEFT JOIN
    tb_transferencia t ON c.id_transferencia = t.id_transferencia
LEFT JOIN
    tb_tipo_transferencia tt ON t.id_tipo = tt.id_tipo_transferencia
UNION
SELECT
    cj.id_cliente_juridico AS id_cliente,
    CONCAT(cj.nome, ' ', cj.sobrenome) AS nome_completo,
    cj.CNPJ AS identificacao,
    'Pessoa Jurídica' AS tipo_cliente,
    t.id_transferencia,
    t.conta_saida,
    t.conta_destino,
    t.valor,
    tt.descricao AS tipo_transferencia
FROM
    tb_cliente_juridico cj
LEFT JOIN
    tb_conta c ON cj.id_cliente_juridico = c.id_cliente_juridico
LEFT JOIN
    tb_transferencia t ON c.id_transferencia = t.id_transferencia
LEFT JOIN
    tb_tipo_transferencia tt ON t.id_tipo = tt.id_tipo_transferencia;