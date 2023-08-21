/*atualizar saldo*/

DELIMITER //
CREATE TRIGGER transacao_entre_contas
AFTER INSERT ON tb_transferencia
FOR EACH ROW
BEGIN
    DECLARE conta_saida INT;
    DECLARE conta_destino INT;
    
    -- Obtém os IDs das contas envolvidas na transação
    SELECT id_conta INTO conta_saida FROM tb_conta WHERE numero = NEW.conta_saida;
    SELECT id_conta INTO conta_destino FROM tb_conta WHERE numero = NEW.conta_destino;
    
    -- Atualiza os saldos das contas
    UPDATE tb_conta SET saldo = saldo - NEW.valor WHERE id_conta = conta_saida;
    UPDATE tb_conta SET saldo = saldo + NEW.valor WHERE id_conta = conta_destino;
    
    -- Registra as transações nas contas
    INSERT INTO tb_transferencia (conta_saida, conta_destino, valor, id_tipo)
    VALUES (NEW.conta_destino, NEW.conta_saida, NEW.valor, NEW.id_tipo);
    
    -- Atualiza a data e hora da última transação nas contas
    UPDATE tb_conta SET ultima_transacao = NOW() WHERE id_conta = conta_saida;
    UPDATE tb_conta SET ultima_transacao = NOW() WHERE id_conta = conta_destino;
END;
//
DELIMITER ;
