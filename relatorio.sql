-- Solicitações por departamento
SELECT d.nome_departamento, COUNT(s.id_solicitacao) AS total
FROM Solicitacoes s
JOIN Departamentos d ON s.id_departamento = d.id_departamento
GROUP BY d.nome_departamento;

-- Solicitações por status
SELECT status, COUNT(*) AS quantidade
FROM Solicitacoes
GROUP BY status;

-- Solicitações em atraso
SELECT titulo, prazo, status
FROM Solicitacoes
WHERE prazo < GETDATE()
AND status <> 'Concluída';

-- Tempo médio de atendimento (conceitual)
SELECT AVG(DATEDIFF(DAY, data_abertura, prazo)) AS tempo_medio_dias
FROM Solicitacoes;
