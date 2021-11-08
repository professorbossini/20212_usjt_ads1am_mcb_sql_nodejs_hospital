CREATE DATABASE IF NOT EXISTS 20212_usjt_ads1ammcb_hospital;

USE 20212_usjt_ads1ammcb_hospital;


CREATE TABLE IF NOT EXISTS tb_medico (
	crm INT PRIMARY KEY,
	nome VARCHAR(200) NOT NULL
);

CREATE TABLE IF NOT EXISTS tb_paciente (
	cpf BIGINT PRIMARY KEY,
	nome VARCHAR (200) NOT NULL,
	idade SMALLINT NOT NULL
);

CREATE TABLE IF NOT EXISTS tb_consulta (
	crm INT NOT NULL,
	cpf BIGINT NOT NULL,
	data_hora DATETIME NOT NULL,
	PRIMARY KEY (crm, cpf, data_hora),
	CONSTRAINT fk_medico FOREIGN KEY (crm) REFERENCES tb_medico(crm),
	CONSTRAINT fk_paciente FOREIGN KEY (cpf) REFERENCES tb_paciente(cpf)
);

-- medicos
-- (1, Jose)
-- (2, Maria)

-- pacientes
-- (1000, Joao, 22)
-- (1001, Cristina, 30)

-- consultas
-- (1, 1000, 22h00)
-- (3, 1000, 22h01)
-- (2, 1002, 22h03)

INSERT INTO tb_medico (crm, nome) VALUES (12345, 'José');

INSERT INTO tb_paciente (cpf, nome, idade) VALUES (998877, 'Maria', 22);

INSERT INTO tb_paciente (cpf, nome, idade) VALUES (11111111, 'Antônio', 30);

INSERT INTO tb_consulta (crm, cpf, data_hora) VALUES (12345, 998877,
'2021-10-12 13:53:00');

INSERT INTO tb_consulta (crm, cpf, data_hora) VALUES (12345, 998877,
'2021-10-13 18:00:00');

INSERT INTO tb_consulta (crm, cpf, data_hora) VALUES (12345, 11111111,
'2021-10-17 22:00:00');

-- todos os médicos
SELECT * FROM tb_medico;
-- apenas crm de todos os médicos
SELECT crm FROM tb_medico;
-- todos os pacientes
SELECT * FROM tb_paciente;
-- somente cpf e nome de todos os pacientes
SELECT cpf, nome FROM tb_paciente;
-- todas as consultas
SELECT * FROM tb_consulta;
-- todas as datas/horas de todas as consultas
SELECT data_hora FROM tb_consulta;

-- todas as colunas de todas as consultas, ordenando por data
SELECT * FROM tb_consulta ORDER BY data_hora ASC;

-- todas as colunas de todas as consultas, ordenando por data (decrescente)
SELECT * FROM tb_consulta ORDER BY data_hora DESC;

-- todas as colunas de todas as consultas
-- ordenando por cpf e depois por data
SELECT * FROM tb_consulta ORDER BY cpf, data_hora;

-- todos os médicos associados a suas consultas
SELECT m.crm, nome, data_hora
FROM tb_medico m INNER JOIN tb_consulta c
ON m.crm = c.crm;

SELECT m.crm, m.nome, c.data_hora
FROM tb_medico m, tb_consulta c
WHERE m.crm = c.crm;

SELECT m.crm, m.nome as nome_medico, data_hora, p.cpf, p.nome as nome_paciente
FROM tb_medico m INNER JOIN tb_consulta c
ON m.crm = c.crm
INNER JOIN tb_paciente p
ON c.cpf = p.cpf;

SELECT m.crm, m.nome AS nome_medico, data_hora, p.cpf, p.nome AS nome_paciente
FROM
tb_medico m, tb_consulta c, tb_paciente p
WHERE m.crm = c.crm AND c.cpf = p.cpf;

SELECT c.data_hora, p.cpf, COUNT(*) as total_consultas
FROM tb_paciente p INNER JOIN tb_consulta c
ON p.cpf = c.cpf
GROUP BY p.cpf;

INSERT INTO tb_medico (crm, nome) VALUES (332211, 'Jaqueline');

SELECT * FROM tb_medico;






