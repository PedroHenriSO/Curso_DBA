/*calcular saldo medio*/

CALL calcular_saldo_medio_cliente(client_id, @saldo_medio);
SELECT @saldo_medio;

DELIMITER //
CREATE PROCEDURE calcular_saldo_medio_cliente(IN client_id INT, OUT saldo_medio DECIMAL(20, 2))
BEGIN
    DECLARE total_saldo DECIMAL(20, 2);
    DECLARE total_contas INT;

    SELECT SUM(CAST(REPLACE(saldo, 'R$', '') AS DECIMAL(20, 2))) INTO total_saldo
    FROM tb_conta
    WHERE statu = 'ativo' AND (id_cliente_juridico = client_id OR id_cliente_fisico = client_id);

    SELECT COUNT(*) INTO total_contas
    FROM tb_conta
    WHERE statu = 'ativo' AND (id_cliente_juridico = client_id OR id_cliente_fisico = client_id);

    IF total_contas > 0 THEN
        SET saldo_medio = total_saldo / total_contas;
    ELSE
        SET saldo_medio = 0.00;
    END IF;
END;
//
DELIMITER ;