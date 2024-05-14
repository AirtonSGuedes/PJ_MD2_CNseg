
SELECT COUNT(f.nome) as turma,f.nome FROM "PJ_md2".matricula as mt
INNER JOIN "PJ_md2".facilitadores as f
ON f.facilitador_id = mt.facilitador_id
GROUP BY f.nome
HAVING COUNT(f.nome) >=2


-- Guilherme
 select * from "PJ_md2".matricula  
CREATE TABLE "PJ_md2".matricula  
(  
 matricula_id serial PRIMARY KEY,   
 tipo varchar(15),   
 aluno_id INT NOT NULL,   
 facilitador_id INT NOT NULL,   
 turma_id INT NOT NULL,   
 FOREIGN KEY (aluno_id) REFERENCES "PJ_md2".alunos (aluno_id),
 FOREIGN KEY (facilitador_id) REFERENCES "PJ_md2".facilitadores (facilitador_id),
 FOREIGN KEY (turma_id) REFERENCES "PJ_md2".turma (turma_id)
); 

ALTER TABLE "PJ_md2".matricula 
ADD COLUMN aluno_id int,
ADD FOREIGN KEY (aluno_id) REFERENCES "PJ_md2".alunos (aluno_id),
ADD COLUMN facilitador_id int,
ADD FOREIGN KEY (facilitador_id) REFERENCES "PJ_md2".facilitadores (facilitador_id);

CREATE TABLE "PJ_md2".facilitadores  
(  
 facilitador_id  SERIAL PRIMARY KEY ,   
 nome VARCHAR(100) NOT NULL,   
 cpf VARCHAR(20) NOT NULL,   
 email VARCHAR(100) NOT NULL
);  

CREATE TABLE "PJ_md2".turma  
(  
 turma_id serial PRIMARY KEY,   
 nome VARCHAR(100) NOT NULL,   
 data_inicio DATE NOT NULL,   
 data_fim DATE NOT NULL,   
 cursos_id INT NOT NULL,
 FOREIGN KEY (cursos_id) REFERENCES "PJ_md2".cursos (cursos_id)
	
); 
CREATE TABLE "PJ_md2".alunos  
(  
 aluno_id serial PRIMARY KEY,   
 nome VARCHAR(100) NOT NULL,   
 cpf VARCHAR(20) NOT NULL,   
 status INT NOT NULL
);  

CREATE TABLE "PJ_md2".log  
(  
 log_id serial PRIMARY KEY,   
 aluno_id INT NOT NULL,   
 dado_novo INT NOT NULL,   
 dado_anterior INT NOT NULL,
 aluno INT,
 FOREIGN KEY (aluno) REFERENCES "PJ_md2".alunos (aluno_id)
);  
ALTER TABLE "PJ_md2".log 
DROP COLUMN aluno

CREATE TABLE "PJ_md2".cursos  
(  
 cursos_id serial PRIMARY KEY,   
 nome VARCHAR(100) NOT NULL
);  
 
CREATE TABLE "PJ_md2".modulos  
(  
 modulos_id serial  PRIMARY KEY,   
 nome VARCHAR(100) NOT NULL,   
 carga_horaria INT NOT NULL,
 cursos_id INT,
 FOREIGN KEY (cursos_id) REFERENCES "PJ_md2".cursos (cursos_id)
);  

-- ===================================INSERÇÃO DOS DADOS =================================

INSERT INTO "PJ_md2".facilitadores (nome, cpf, email) VALUES
('Ana Silva', '123.456.789-00', 'ana.silva@example.com'),
('Carlos Oliveira', '987.654.321-00', 'carlos.oliveira@example.com'),
('Mariana Santos', '111.222.333-44', 'mariana.santos@example.com'),
('Pedro Costa', '555.666.777-88', 'pedro.costa@example.com'),
('Camila Souza', '999.888.777-66', 'camila.souza@example.com'),
('João Pereira', '444.333.222-11', 'joao.pereira@example.com');

-- =================================== Curso =================================

INSERT INTO "PJ_md2".cursos (nome) VALUES
('Curso de Programação'),
('Curso de Design Gráfico'),
('Curso de Marketing Digital');

-- =================================== Modulos =================================

INSERT INTO "PJ_md2".modulos (nome, carga_horaria, cursos_id) VALUES
('Introdução à Programação', 20, 1),  -- Assumindo que os módulos para este curso começam no ID 1
('Estruturas de Dados', 30, 1),
('Algoritmos Avançados', 40, 1),
('Introdução ao Design Gráfico', 25, 2), -- Assumindo que os módulos para este curso começam no ID 4
('Ferramentas de Design', 35, 2),
('Design de Interface', 30, 2),
('Introdução ao Marketing Digital', 15, 3),
('SEO e Marketing de Conteúdo', 25, 3),
('Publicidade Online', 20, 3);

-- ============================================ alunos =====================================
-- Inserindo 100 alunos fictícios na tabela
INSERT INTO "PJ_md2".alunos (nome, cpf, status)
VALUES
('João Silva', '123.456.789-10', 0),
('Maria Santos', '987.654.321-00', 1),
('Pedro Oliveira', '234.567.890-11', 0),
('Ana Souza', '876.543.210-99', 1),
('Lucas Pereira', '345.678.901-22', 1),
('Mariana Costa', '765.432.109-88', 1),
('Gabriel Martins', '456.789.012-33', 1),
('Juliana Lima', '654.321.098-77', 1),
('Rafael Almeida', '567.890.123-44', 1),
('Camila Fernandes', '543.210.987-66', 1),
('Diego Santos', '678.901.234-55', 1),
('Carla Oliveira', '432.109.876-77', 1),
('Fernando Pereira', '789.012.345-66', 0),
('Amanda Costa', '321.098.765-88', 1),
('Gustavo Martins', '890.123.456-77', 1),
('Patrícia Lima', '210.987.654-99', 1),
('Vinícius Almeida', '901.234.567-88', 1),
('Beatriz Fernandes', '109.876.543-00', 1),
('Roberto Santos', '012.345.678-11', 1),
('Larissa Oliveira', '987.654.321-22', 1),
('André Pereira', '345.678.901-33', 1),
('Caroline Costa', '876.543.210-44', 1),
('Henrique Martins', '456.789.012-55', 1),
('Laura Lima', '654.321.098-66', 1),
('Thiago Almeida', '567.890.123-77', 1),
('Daniela Fernandes', '543.210.987-88', 1),
('José Santos', '678.901.234-99', 1),
('Isabela Oliveira', '432.109.876-00', 1),
('Bruno Pereira', '789.012.345-11', 0),
('Luana Costa', '321.098.765-22', 1),
('Ricardo Martins', '890.123.456-33', 1),
('Sara Lima', '210.987.654-44', 1),
('Felipe Almeida', '901.234.567-55', 1),
('Natália Fernandes', '109.876.543-66', 0),
('Carlos Santos', '012.345.678-77', 1),
('Lívia Oliveira', '987.654.321-88', 1),
('Lucas Pereira', '345.678.901-99', 1),
('Aline Costa', '876.543.210-00', 1),
('Rodrigo Martins', '456.789.012-11', 0),
('Renata Lima', '654.321.098-22', 1),
('Paulo Almeida', '567.890.123-33', 1),
('Tatiane Fernandes', '543.210.987-44', 1),
('Marcelo Santos', '678.901.234-55', 1),
('Mariana Oliveira', '432.109.876-66', 0),
('Fábio Pereira', '789.012.345-77', 1),
('Carolina Costa', '321.098.765-88', 1),
('Vinícius Martins', '890.123.456-99', 1),
('Fernanda Lima', '210.987.654-00', 1),
('Rafael Almeida', '901.234.567-11', 1),
('Amanda Fernandes', '109.876.543-22', 1),
('Gustavo Santos', '012.345.678-33', 1),
('Juliana Oliveira', '987.654.321-44', 1),
('Ricardo Pereira', '345.678.901-55', 1),
('Isabela Costa', '876.543.210-66', 1),
('Bruno Martins', '456.789.012-77', 1),
('Luana Lima', '654.321.098-88', 1),
('Thiago Almeida', '567.890.123-99', 1),
('Natália Fernandes', '543.210.987-00', 1),
('Carlos Santos', '678.901.234-11', 1),
('Lívia Oliveira', '432.109.876-22', 1),
('Lucas Pereira', '789.012.345-33', 0),
('Aline Costa', '321.098.765-44', 1),
('Rodrigo Martins', '890.123.456-55', 1),
('Renata Lima', '210.987.654-66', 1),
('Paulo Almeida', '901.234.567-77', 1),
('Tatiane Fernandes', '109.876.543-88', 1),
('Marcelo Santos', '012.345.678-99', 1),
('Mariana Oliveira', '987.654.321-00', 1),
('Fábio Pereira', '345.678.901-11', 1),
('Carolina Costa', '876.543.210-22', 1),
('Vinícius Martins', '456.789.012-33', 1),
('Fernanda Lima', '654.321.098-44', 1),
('Rafael Almeida', '567.890.123-55', 0),
('Amanda Fernandes', '543.210.987-66', 1),
('Gustavo Santos', '678.901.234-77', 1),
('Juliana Oliveira', '432.109.876-88', 0),
('Ricardo Pereira', '789.012.345-99', 1),
('Isabela Costa', '321.098.765-00', 1),
('Bruno Martins', '901.234.567-11', 1),
('Luana Lima', '109.876.543-22', 1),
('Thiago Almeida', '012.345.678-33', 1),
('Natália Fernandes', '987.654.321-44', 1),
('Carlos Santos', '345.678.901-55', 1),
('Lívia Oliveira', '567.890.123-66', 1),
('Lucas Pereira', '654.321.098-77', 1),
('Aline Costa', '890.123.456-88', 1),
('Rodrigo Martins', '210.987.654-99', 1),
('Renata Lima', '456.789.012-00', 1),
('Paulo Almeida', '321.098.765-11', 1),
('Tatiane Fernandes', '789.012.345-22', 1),
('Marcelo Santos', '098.765.432-33', 1),
('Mariana Oliveira', '234.567.890-44', 0),
('Fábio Pereira', '543.210.987-55', 1),
('Carolina Costa', '987.654.321-66', 1),
('Vinícius Martins', '876.543.210-77', 1),
('Fernanda Lima', '345.678.901-88', 1),
('Rafael Almeida', '654.321.098-99', 1),
('Amanda Fernandes', '901.234.567-00', 1),
('Gustavo Santos', '210.987.654-11', 1),
('Juliana Oliveira', '432.109.876-22', 1),
('Ricardo Pereira', '789.012.345-33', 0),
('Isabela Costa', '098.765.432-44', 1),
('Bruno Martins', '345.678.901-55', 1),
('Luana Lima', '654.321.098-66', 1),
('Thiago Almeida', '901.234.567-77', 1),
('Natália Fernandes', '210.987.654-88', 0),
('Carlos Santos', '432.109.876-99', 0),
('Lívia Oliveira', '789.012.345-00', 1),
('Lucas Pereira', '987.654.321-11', 1),
('Aline Costa', '210.987.654-22', 1),
('Rodrigo Martins', '543.210.987-33', 1),
('Renata Lima', '876.543.210-44', 1),
('Paulo Almeida', '109.876.543-55', 1),
('Tatiane Fernandes', '432.109.876-66', 0),
('Marcelo Santos', '765.432.109-77', 1),
('Mariana Oliveira', '098.765.432-88', 1),
('Fábio Pereira', '321.098.765-99', 0);

===================================== turmas ===================================== 

INSERT INTO "PJ_md2".turma (nome, data_inicio, data_fim, cursos_id) 
VALUES 
('Turma A', '2024-06-01', '2024-12-31', 1),
('Turma B', '2024-07-15', '2024-12-15', 2),
('Turma C', '2024-08-20', '2025-02-28', 3);


-- ===================================================================================
INSERT INTO "PJ_md2".matricula (tipo, aluno_id, turma_id)  VALUES 
('alunos', 1, 1),
('alunos', 2, 1),
('alunos', 3, 1),
('alunos', 4, 1),
('alunos', 5, 1),
('alunos', 6, 1),
('alunos', 7, 1),
('alunos', 8, 1),
('alunos', 9, 1),
('alunos', 10, 1),
('alunos', 11, 1),
('alunos', 12, 1),
('alunos', 13, 1),
('alunos', 14, 1),
('alunos', 15, 1),
('alunos', 16, 1),
('alunos', 17, 1),
('alunos', 18, 1),
('alunos', 19, 1),
('alunos', 20, 1),
('alunos', 21, 1),
('alunos', 22, 1),
('alunos', 23, 1),
('alunos', 24, 1),
('alunos', 25, 1),
('alunos', 26, 2),
('alunos', 27, 2),
('alunos', 28, 2),
('alunos', 29, 2),
('alunos', 30, 2),
('alunos', 31, 2),
('alunos', 32, 2),
('alunos', 33, 2),
('alunos', 34, 2),
('alunos', 35, 2),
('alunos', 36, 2),
('alunos', 37, 2),
('alunos', 38, 2),
('alunos', 39, 2),
('alunos', 40, 2),
('alunos', 41, 2),
('alunos', 42, 2),
('alunos', 43, 2),
('alunos', 44, 2),
('alunos', 45, 2),
('alunos', 46, 2),
('alunos', 47, 2),
('alunos', 48, 2),
('alunos', 49, 2),
('alunos', 50, 2),
('alunos', 51, 2),
('alunos', 52, 2),
('alunos', 53, 2),
('alunos', 54, 2),
('alunos', 55, 2),
('alunos', 56, 2),
('alunos', 57, 2),
('alunos', 58, 2),
('alunos', 59, 2),
('alunos', 60, 2),
('alunos', 61, 2),
('alunos', 62, 2),
('alunos', 63, 2),
('alunos', 64, 3),
('alunos', 65, 3),
('alunos', 66, 3),
('alunos', 67, 3),
('alunos', 68, 3),
('alunos', 69, 3),
('alunos', 70, 3),
('alunos', 71, 3),
('alunos', 72, 3),
('alunos', 73, 3),
('alunos', 74, 3),
('alunos', 75, 3),
('alunos', 76, 3),
('alunos', 77, 3),
('alunos', 78, 3),
('alunos', 79, 3),
('alunos', 80, 3),
('alunos', 81, 3),
('alunos', 82, 3),
('alunos', 83, 3),
('alunos', 84, 3),
('alunos', 85, 3),
('alunos', 86, 3),
('alunos', 87, 3),
('alunos', 88, 3),
('alunos', 89, 3),
('alunos', 90, 3),
('alunos', 91, 3),
('alunos', 92, 3),
('alunos', 93, 3),
('alunos', 94, 3),
('alunos', 95, 3),
('alunos', 96, 3),
('alunos', 97, 3),
('alunos', 98, 3),
('alunos', 99, 3),
('alunos', 100, 3),
('alunos', 101, 1),
('alunos', 102, 1),
('alunos', 103, 1),
('alunos', 104, 1),
('alunos', 105, 1),
('alunos', 106, 1),
('alunos', 107, 1),
('alunos', 108, 1),
('alunos', 109, 1),
('alunos', 110, 1),
('alunos', 111, 1),
('alunos', 112, 1),
('alunos', 113, 1),
('alunos', 114, 2),
('alunos', 115, 2),
('alunos', 116, 2),
('alunos', 117, 2);


INSERT INTO "PJ_md2".matricula  (tipo, facilitador_id, turma_id) VALUES

('facilitador',1,1),
('facilitador',2,1),
('facilitador',3,1),
('facilitador',4,2),
('facilitador',5,2),
('facilitador',6,3);

1. Selecionar a quantidade total de estudantes cadastrados no banco; feito

select * from "PJ_md2".alunos

2. Selecionar quais pessoas facilitadoras atuam em mais de uma turma;



SELECT COUNT(f.nome) as turma,f.nome FROM "PJ_md2".matricula as mt
INNER JOIN "PJ_md2".facilitadores as f
ON f.facilitador_id = mt.facilitador_id
GROUP BY f.nome
HAVING COUNT(f.nome) >=2



3. Crie uma view que selecione a porcentagem de estudantes com status de evasão
agrupados por turma;



4. Crie um trigger para ser disparado quando o atributo status de um estudante for atualizado
e inserir um novo dado em uma tabela de log.





5. Além disso, vocês deverão pensar em uma pergunta que deverá ser respondida por uma
consulta SQL que combine pelo menos 3 tabelas.

select * from "PJ_md2".matricula

-- ============= view ================

-- 3. Crie uma view que selecione a porcentagem de estudantes com status de evasão
-- agrupados por turma;
-- Este código cria ou substitui uma view chamada "evasao_por_turma" no banco de dados "PJ_md2",
-- que contém informações sobre evasão por turma.

CREATE OR REPLACE VIEW "PJ_md2".evasao_por_turma AS
-- Cria ou substitui a view "evasao_por_turma" no esquema "PJ_md2".
SELECT
    t.turma_id, -- Seleciona o ID da turma.
    t.nome AS nome_turma, -- Seleciona o nome da turma, renomeando a coluna como 'nome_turma'.
    COUNT(*) AS total_alunos, -- Conta o número total de registros encontrados na consulta, representando o total de alunos na turma.
    SUM(CASE WHEN a.status = 0 THEN 1 ELSE 0 END) AS evadidos, -- Calcula o número de alunos evadidos na turma (com status igual a 0).
    ROUND((SUM(CASE WHEN a.status = 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2) AS porcentagem_evasao
    -- Calcula a porcentagem de evasão na turma, arredondando para 2 casas decimais.
FROM
    "PJ_md2".turma t -- Seleciona dados da tabela "turma" (alias 't').
INNER JOIN
    "PJ_md2".matricula m ON t.turma_id = m.turma_id -- Realiza uma junção interna com a tabela "matricula" (alias 'm') usando o ID da turma.
INNER JOIN
    "PJ_md2".alunos a ON m.aluno_id = a.aluno_id -- Realiza uma junção interna com a tabela "alunos" (alias 'a') usando o ID do aluno.
GROUP BY
    t.turma_id, t.nome; -- Agrupa os resultados pela turma_id e pelo nome da turma.

-- ===========================================

CREATE OR REPLACE FUNCTION "PJ_md2".log_status_update()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO "PJ_md2".log (aluno_id, dado_novo, dado_anterior)
    VALUES (NEW.aluno_id, NEW.status, OLD.status);

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER status_update_trigger
AFTER UPDATE OF status ON "PJ_md2".alunos
FOR EACH ROW
EXECUTE FUNCTION "PJ_md2".log_status_update();



UPDATE "PJ_md2".alunos
SET status = 0
WHERE aluno_id = 15

select * from "PJ_md2".log

SELECT * FROM "PJ_md2".evasao_por_turma




SELECT facilitador_id, COUNT(DISTINCT turma_id) AS num_turmas
FROM "PJ_md2".matricula
WHERE tipo = 'facilitador'
GROUP BY facilitador_id
HAVING COUNT(DISTINCT turma_id) > 1;


--SELECT 
--   m.matricula_id,
--   f.facilitador_id,
--   f.nome as nome_facilitador,
--   a.aluno_id,
--   a.nome as nome_aluno
-- FROM 
--   "PJ_md2".matricula m
-- INNER JOIN 
--   "PJ_md2".facilitadores f ON m.facilitador_id = f.facilitador_id
-- INNER JOIN 
--  "PJ_md2".alunos a ON m.aluno_id = a.aluno_id;
