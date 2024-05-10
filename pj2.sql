DROP TABLE IF EXISTS "pj_md2"."Alunos";

-- Aqui, é criada uma nova tabela chamada "Alunos" no esquema "pj_md2". A tabela possui colunas para ID_aluno, Nome, CPF, Data_de_Nascimento e Email.
CREATE TABLE "pj_md2"."Alunos" (
    ID_aluno SERIAL PRIMARY KEY,
    Nome VARCHAR(100),
    CPF VARCHAR(14),
    Data_de_Nascimento DATE,
    Email VARCHAR(100)
	
);
alter table "pj_md2"."Alunos"
add column id_turma int,
add constraint fk_Turma
	foreign key (id_turma)
	references "pj_md2"."Turmas"(id_turma);
	
-- 	
--  ============================================================================================

create table "pj_md2"."Alunos_Turma"(
	ID_alunos_turma serial primary key,
	ID_aluno int,
	ID_turma int,
	
	constraint fk_Turma
	foreign key (id_turma)
	references "pj_md2"."Turmas"(id_turma),
	
	CONSTRAINT fk_aluno
        FOREIGN KEY (ID_aluno)
        REFERENCES "pj_md2"."Alunos"(ID_aluno)
);
	
-- 	============================================================================================
 
-- Este comando remove a tabela "pj_md2.Facilitadores" se ela existir.
DROP TABLE IF EXISTS "pj_md2"."Facilitadores";

-- Aqui, é criada uma nova tabela chamada "Facilitadores" no esquema "pj_md2". A tabela possui colunas para ID_facilitador, Nome, CPF, Email e ID_módulo.
CREATE TABLE "pj_md2"."Facilitadores" (
    ID_facilitador SERIAL PRIMARY KEY,
    Nome VARCHAR(100),
    CPF VARCHAR(15),
    Email VARCHAR(100)
);

-- Este comando adiciona uma nova coluna chamada ID_módulo à tabela "Facilitadores". Também adiciona uma restrição de chave estrangeira (FOREIGN KEY) que referencia a tabela "Módulos".
ALTER TABLE "pj_md2"."Facilitadores"
    ADD COLUMN ID_módulo INT,
    ADD CONSTRAINT fk_módulo
    FOREIGN KEY (ID_módulo)
    REFERENCES "pj_md2"."Módulos"(ID_módulo);
-- 	=================================================
	create table "pj_md2"."Facilitadores_turma"(
	Fac_turma serial primary key,
	ID_turma INT,
		ID_facilitador INT,
    CONSTRAINT fk_turma
        FOREIGN KEY (ID_turma)
        REFERENCES "pj_md2"."Turmas"(ID_turma),
		
		CONSTRAINT fk_facilitador
        FOREIGN KEY (ID_facilitador)
        REFERENCES "pj_md2"."Facilitadores"(ID_facilitador)
	);
	
	INSERT INTO "pj_md2"."Facilitadores_turma" (ID_turma,ID_facilitador)
VALUES 
(1, 4),
(2,5),
(3,6),(2,7),(1,8);
	select * from "pj_md2"."Facilitadores_turma";
-- 	=======================
SELECT * FROM "pj_md2"."Turmas";

SELECT 
    F.Nome AS Nome_Facilitador,
    T.nome_turma AS Nome_Turma
FROM 
    "pj_md2"."Facilitadores" F
JOIN 
    "pj_md2"."Facilitadores_turma" AS FT ON F.ID_facilitador = FT.ID_facilitador
JOIN  
    "pj_md2"."Turmas" AS T ON T.ID_turma = FT.ID_turma
WHERE 
    F.ID_facilitador IN (
        SELECT 
            ID_facilitador
        FROM 
            "pj_md2"."Facilitadores_turma"
        GROUP BY 
            ID_facilitador
        HAVING 
            COUNT(DISTINCT ID_turma) > 1
    )
GROUP BY 
    F.ID_facilitador, F.Nome, T.nome_turma
ORDER BY 
    F.ID_facilitador;

-- =====================================
SELECT 
    T2.nome_turma,

	COUNT(FT.id_turma) as qtdturma

FROM 
    "pj_md2"."Facilitadores" F
JOIN 
    "pj_md2"."Facilitadores_turma" as FT 
	ON F.ID_facilitador = FT.ID_facilitador
	
JOIN  "pj_md2"."Turmas" as T2
ON T2.id_turma = FT.id_turma
	
GROUP BY 
    T2.id_turma,T2.nome_turma
HAVING 
    COUNT(FT.id_turma) > 1;
-- ==================
	
SELECT 
    T.nome_turma,
    F.Nome AS Nome_Facilitador,
    F.CPF AS CPF_Facilitador,
    F.Email AS Email_Facilitador
FROM 
    "pj_md2"."Facilitadores_turma" FT
INNER JOIN 
    "pj_md2"."Facilitadores" F ON FT.ID_facilitador = F.ID_facilitador
INNER JOIN 
    "pj_md2"."Turmas" T ON FT.ID_turma = T.ID_turma;
-- ============================================
-- Este comando remove a tabela "pj_md2.Turmas" se ela existir.
DROP TABLE IF EXISTS "pj_md2"."Turmas";

-- Aqui, é criada uma nova tabela chamada "Turmas" no esquema "pj_md2". A tabela possui colunas para ID_turma, nome_turma, data_inicio, data_fim, ID_curso, ID_facilitador e ID_aluno.
CREATE TABLE "pj_md2"."Turmas" (
    ID_turma SERIAL PRIMARY KEY,
    nome_turma VARCHAR(100),
    data_inicio DATE,
    data_fim DATE,
    ID_curso INT,
    ID_facilitador INT,
    ID_aluno INT,
    CONSTRAINT fk_curso
        FOREIGN KEY (ID_curso)
        REFERENCES "pj_md2"."Cursos"(ID_curso),
    CONSTRAINT fk_facilitador
        FOREIGN KEY (ID_facilitador)
        REFERENCES "pj_md2"."Facilitadores"(ID_facilitador),
    CONSTRAINT fk_aluno
        FOREIGN KEY (ID_aluno)
        REFERENCES "pj_md2"."Alunos"(ID_aluno)
);


INNER JOIN tabela3 ON tabela2.coluna = tabela3.coluna
        
-- Este comando remove a tabela "pj_md2.Módulos" se ela existir.
DROP TABLE IF EXISTS "pj_md2"."Módulos";

-- Aqui, é criada uma nova tabela chamada "Módulos" no esquema "pj_md2". A tabela possui colunas para ID_módulo, Descrição, Carga_Horária e ID_turma.
CREATE TABLE "pj_md2"."Módulos" (
    ID_Módulo SERIAL PRIMARY KEY,
    Descrição VARCHAR(255),
    Carga_Horária INT,
    ID_turma INT,
    CONSTRAINT fk_turma
        FOREIGN KEY (ID_turma)
        REFERENCES "pj_md2"."Turmas"(ID_turma)
);

-- Este comando remove a tabela "pj_md2.Cursos" se ela existir.
DROP TABLE IF EXISTS "pj_md2"."Cursos";

-- Aqui, é criada uma nova tabela chamada "Cursos" no esquema "pj_md2". A tabela possui colunas para ID_curso, Nome e Descrição.
CREATE TABLE "pj_md2"."Cursos" (
    ID_curso SERIAL PRIMARY KEY,
    Nome VARCHAR(100),
    Descrição TEXT
);
-- Inserção de dados na tabela Alunos
INSERT INTO "pj_md2"."Alunos" ("nome","cpf","data_de_nascimento","email","id_turma") VALUES
    ('Renan Silva', '111.456.789-01', '1990-01-01', 'renan.silva@example.com', 1),
    ('Amanda Souza', '222.654.321-09', '1992-05-15', 'amanda.souza@example.com', 2),
    ('Fábio Santos', '333.222.333-44', '1988-10-20', 'fabio.santos@example.com', 3),
    ('Laura Oliveira', '444.666.777-88', '1995-03-30', 'laura.oliveira@example.com', 1),
    ('Marcela Pereira', '555.888.777-66', '1998-12-25', 'marcela.pereira@example.com', 2),
    ('Rafael Costa', '666.888.999-00', '1994-07-12', 'rafael.costa@example.com', 3),
    ('Juliano Santos', '777.456.789-01', '1993-02-28', 'juliano.santos@example.com', 1),
    ('Elaine Oliveira', '888.654.321-09', '1991-09-05', 'elaine.oliveira@example.com', 2),
    ('Raphael Souza', '999.222.333-44', '1997-06-08', 'raphael.souza@example.com', 3),
    ('Camila Silva', '111.666.777-88', '1996-11-17', 'camila.silva@example.com', 1),
    ('Lucas Pereira', '222.888.777-66', '1999-04-22', 'lucas.pereira@example.com', 2),
    ('Patrícia Costa', '333.888.999-00', '1990-08-07', 'patricia.costa@example.com', 3),
    ('Felipe Oliveira', '444.456.789-01', '1992-01-09', 'felipe.oliveira@example.com', 1),
    ('Sandra Santos', '555.654.321-09', '1989-03-18', 'sandra.santos@example.com', 2),
    ('Carlos Souza', '666.222.333-44', '1994-05-25', 'carlos.souza@example.com', 3),
    ('Nathália Oliveira', '777.666.777-88', '1993-10-14', 'nathalia.oliveira@example.com', 1),
    ('Roberto Pereira', '888.888.777-66', '1998-11-03', 'roberto.pereira@example.com', 2),
    ('Carolina Costa', '999.888.999-00', '1991-07-26', 'carolina.costa@example.com', 3),
    ('Rogério Silva', '111.456.789-01', '1995-04-03', 'rogerio.silva@example.com', 1),
    ('Fernanda Souza', '222.654.321-09', '1996-09-19', 'fernanda.souza@example.com', 2),
    ('Bruno Santos', '333.222.333-44', '1990-12-28', 'bruno.santos@example.com', 3),
    ('Tatiana Oliveira', '444.666.777-88', '1992-03-07', 'tatiana.oliveira@example.com', 1),
    ('Ricardo Pereira', '555.888.777-66', '1994-08-16', 'ricardo.pereira@example.com', 2),
    ('Vanessa Costa', '666.888.999-00', '1999-01-31', 'vanessa.costa@example.com', 3),
    ('Fernando Silva', '777.456.789-01', '1997-06-02', 'fernando.silva@example.com', 1),
    ('Gabriela Souza', '888.654.321-09', '1998-10-21', 'gabriela.souza@example.com', 2),
    ('Paula Santos', '999.222.333-44', '1993-02-14', 'paula.santos@example.com', 3),
    ('Leandro Oliveira', '111.666.777-88', '1991-11-23', 'leandro.oliveira@example.com', 1),
    ('Sergio Pereira', '222.888.777-66', '1996-04-08', 'sergio.pereira@example.com', 2),
    ('Ana Costa', '333.888.999-00', '1995-07-17', 'ana.costa@example.com', 3),
    ('Alexandre Silva', '444.456.789-01', '1992-09-04', 'alexandre.silva@example.com', 1),
    ('Mariana Souza', '555.654.321-09', '1990-05-13', 'mariana.souza@example.com', 2),
    ('Juliano Santos', '666.222.333-44', '1994-11-20', 'juliano.santos@example.com', 3),
    ('Roberta Oliveira', '777.666.777-88', '1997-01-29', 'roberta.oliveira@example.com', 1),
    ('André Pereira', '888.888.777-66', '1999-03-18', 'andre.pereira@example.com', 2),
    ('Carla Costa', '999.888.999-00', '1996-08-07', 'carla.costa@example.com', 3),
    ('Rafaela Silva', '111.456.789-01', '1993-12-14', 'rafaela.silva@example.com', 1),
    ('José Souza', '222.654.321-09', '1991-04-23', 'jose.souza@example.com', 2),
    ('Diego Santos', '333.222.333-44', '1998-10-30', 'diego.santos@example.com', 3),
    ('Cristina Oliveira', '444.666.777-88', '1995-02-08', 'cristina.oliveira@example.com', 1),
    ('Ana Pereira', '555.888.777-66', '1990-07-17', 'ana.pereira@example.com', 2),
    ('Rodrigo Costa', '666.888.999-00', '1994-11-24', 'rodrigo.costa@example.com', 3),
    ('Lucas Silva', '777.456.789-01', '1997-01-05', 'lucas.silva@example.com', 1),
    ('Larissa Souza', '888.654.321-09', '1996-03-14', 'larissa.souza@example.com', 2),
    ('Gustavo Santos', '999.222.333-44', '1993-09-25', 'gustavo.santos@example.com', 3),
    ('Caroline Oliveira', '111.666.777-88', '1999-04-30', 'caroline.oliveira@example.com', 1),
    ('Marcos Pereira', '222.888.777-66', '1992-08-19', 'marcos.pereira@example.com', 2),
    ('Lucas Costa', '333.888.999-00', '1991-05-28', 'lucas.costa@example.com', 3),
	('João Silva', '111.456.789-01', '1990-01-01', 'joao.silva@example.com', 1),
    ('Maria Souza', '222.654.321-09', '1992-05-15', 'maria.souza@example.com', 2),
    ('Pedro Santos', '333.222.333-44', '1988-10-20', 'pedro.santos@example.com', 3),
    ('Ana Oliveira', '444.666.777-88', '1995-03-30', 'ana.oliveira@example.com', 1),
    ('Lucas Pereira', '555.888.777-66', '1998-12-25', 'lucas.pereira@example.com', 2),
    ('Juliana Costa', '666.888.999-00', '1994-07-12', 'juliana.costa@example.com', 3),
    ('Marcos Santos', '777.456.789-01', '1993-02-28', 'marcos.santos@example.com', 1),
    ('Fernanda Oliveira', '888.654.321-09', '1991-09-05', 'fernanda.oliveira@example.com', 2),
    ('Gabriel Souza', '999.222.333-44', '1997-06-08', 'gabriel.souza@example.com', 3),
    ('Carla Silva', '111.666.777-88', '1996-11-17', 'carla.silva@example.com', 1),
    ('Rafaela Pereira', '222.888.777-66', '1999-04-22', 'rafaela.pereira@example.com', 2),
    ('Mateus Oliveira', '333.888.999-00', '1990-08-07', 'mateus.oliveira@example.com', 3),
    ('André Costa', '444.456.789-01', '1992-01-09', 'andre.costa@example.com', 1),
    ('Luana Santos', '555.654.321-09', '1989-03-18', 'luana.santos@example.com', 2),
    ('Gustavo Souza', '666.222.333-44', '1994-05-25', 'gustavo.souza@example.com', 3),
    ('Aline Oliveira', '777.666.777-88', '1993-10-14', 'aline.oliveira@example.com', 1),
    ('Bruno Pereira', '888.888.777-66', '1998-11-03', 'bruno.pereira@example.com', 2),
    ('Mariana Costa', '999.888.999-00', '1991-07-26', 'mariana.costa@example.com', 3),
    ('Leonardo Silva', '111.456.789-01', '1995-04-03', 'leonardo.silva@example.com', 1),
    ('Camila Souza', '222.654.321-09', '1996-09-19', 'camila.souza@example.com', 2),
    ('Thiago Santos', '333.222.333-44', '1990-12-28', 'thiago.santos@example.com', 3),
    ('Bianca Oliveira', '444.666.777-88', '1992-03-07', 'bianca.oliveira@example.com', 1),
    ('Luisa Pereira', '555.888.777-66', '1994-08-16', 'luisa.pereira@example.com', 2),
    ('Vinicius Costa', '666.888.999-00', '1999-01-31', 'vinicius.costa@example.com', 3),
    ('Rodrigo Silva', '777.456.789-01', '1997-06-02', 'rodrigo.silva@example.com', 1),
    ('Nathalia Souza', '888.654.321-09', '1998-10-21', 'nathalia.souza@example.com', 2),
    ('Paulo Santos', '999.222.333-44', '1993-02-14', 'paulo.santos@example.com', 3),
    ('Isabela Oliveira', '111.666.777-88', '1991-11-23', 'isabela.oliveira@example.com', 1),
    ('Ricardo Pereira', '222.888.777-66', '1996-04-08', 'ricardo.pereira@example.com', 2),
    ('Letícia Costa', '333.888.999-00', '1995-07-17', 'leticia.costa@example.com', 3),
    ('Vanessa Silva', '444.456.789-01', '1992-09-04', 'vanessa.silva@example.com', 1),
    ('Fábio Souza', '555.654.321-09', '1990-05-13', 'fabio.souza@example.com', 2),
    ('Laura Santos', '666.222.333-44', '1994-11-20', 'laura.santos@example.com', 3),
    ('Miguel Oliveira', '777.666.777-88', '1997-01-29', 'miguel.oliveira@example.com', 1),
    ('Tatiane Pereira', '888.888.777-66', '1999-03-18', 'tatiane.pereira@example.com', 2),
    ('Luciana Costa', '999.888.999-00', '1996-08-07', 'luciana.costa@example.com', 3),
    ('Diego Silva', '111.456.789-01', '1993-12-14', 'diego.silva@example.com', 1),
    ('Carolina Souza', '222.654.321-09', '1991-04-23', 'carolina.souza@example.com', 2),
    ('Daniel Santos', '333.222.333-44', '1998-10-30', 'daniel.santos@example.com', 3),
    ('Fernando Oliveira', '444.666.777-88', '1995-02-08', 'fernando.oliveira@example.com', 1),
    ('Julia Pereira', '555.888.777-66', '1990-07-17', 'julia.pereira@example.com', 2),
    ('Guilherme Costa', '666.888.999-00', '1994-11-24', 'guilherme.costa@example.com', 3),
    ('Patricia Silva', '777.456.789-01', '1997-01-05', 'patricia.silva@example.com', 1),
    ('Roberto Souza', '888.654.321-09', '1996-03-14', 'roberto.souza@example.com', 2),
    ('Viviane Santos', '999.222.333-44', '1993-09-25', 'viviane.santos@example.com', 3),
    ('Thais Oliveira', '111.666.777-88', '1999-04-30', 'thais.oliveira@example.com', 1),
    ('Marcelo Pereira', '222.888.777-66', '1992-08-19', 'marcelo.pereira@example.com', 2),
    ('Jessica Costa', '333.888.999-00', '1991-05-28', 'jessica.costa@example.com', 3);
	
	
-- ___ inserçaõ na tabela alunos_turma
INSERT INTO "pj_md2"."Alunos_Turma" (ID_aluno, ID_turma)
VALUES 
(1, 1),(2,2),(3,3),
(4,1),(5,2),
(6,3),(7,1),(8,2),
(9,3),(10,1),(11,2),
(12,3),(13,1),(14,2),
(15,3),(16,1),(17,2),
(18,3),(19,1),(20,2),
(21,3),(22,1),(23,2),
(24,3),(25,1),(26,2),
(27,3),(28,1),(29,2),
(30,3),(31,1),(32,2),
(33,3),(34,1),(35,2),
(36,3),(37,1),(38,2),
(39,3),(40,1),(41,2),
(42,3),(43,1),(44,2),
(45,3),(46,1),(47,2),
(48,3),(49,1),(50,2),
(51,3),(52,1),(53,2),
(54,3),(55,1),(56,2),
(57,3),(58,1),(59,2),
(60,3),(61,1),(62,2),
(63,3),(64,1),(65,2),
(66,3),(67,1),(68,2),
(69,3),(70,1),(71,2),
(72,3),(73,1),(74,2),
(75,3),(76,1),(77,2),
(78,3),(79,1),(80,2),
(81,3),(82,1),(83,2),
(84,3),(85,1),(86,2),
(87,3),(88,1),(89,2),
(90,3),(91,1),(92,2),
(93,3),(94,1),(95,2),
(96,3);





-- Inserções na tabela Facilitadores
INSERT INTO "pj_md2"."Facilitadores" (Nome, CPF, Email, ID_módulo)
VALUES 
    ('Fernanda Oliveira', '123.456.789-00', 'fernanda@example.com', 1),
    ('Rafaela Lima', '987.654.321-00', 'rafaela@example.com', 2),
    ('Gabriel Pereira', '456.789.123-00', 'gabriel@example.com', 3);

INSERT INTO "pj_md2"."Facilitadores" (Nome, CPF, Email, ID_módulo)
VALUES 
    ('Maria Souza', '987.654.321-00', 'maria@example.com', 2),
    ('Pedro Santos', '456.789.123-00', 'pedro@example.com', 3);


-- Inserções na tabela Turmas
INSERT INTO "pj_md2"."Turmas" (nome_turma, data_inicio, data_fim)
VALUES 
    ('Turma A', '2024-05-01', '2024-06-01'),
    ('Turma B', '2024-05-15', '2024-07-15'),
    ('Turma C', '2024-06-01', '2024-08-01');

update "pj_md2"."Turmas" set ID_curso = 1 where ID_turma = 1
update "pj_md2"."Turmas" set ID_curso = 2 where ID_turma = 2
update "pj_md2"."Turmas" set ID_curso = 3 where ID_turma = 3

update "pj_md2"."Turmas" set ID_facilitador = 4 where ID_turma = 1
update "pj_md2"."Turmas" set ID_facilitador = 5 where ID_turma = 2
update "pj_md2"."Turmas" set ID_facilitador = 6 where ID_turma = 3
update "pj_md2"."Turmas" set ID_facilitador = 7 where ID_turma = 2
update "pj_md2"."Turmas" set ID_facilitador = 8 where ID_turma = 3



-- Inserções na tabela Módulos

INSERT INTO "pj_md2"."Módulos" (Descrição, Carga_Horária, ID_turma)
VALUES 
    ('Introdução à Programação', 40, 1),
    ('Estruturas de Dados', 60, 2),
    ('Algoritmos Avançados', 80, 3);
-- Inserções na tabela Cursos

INSERT INTO "pj_md2"."Cursos" (nome, descrição) VALUES
('Matemática Básica', 'Curso introdutório sobre conceitos fundamentais de matemática.'),
('Programação em Python', 'Curso abrangente sobre programação utilizando a linguagem Python.'),
('Ciência de Dados', 'Curso avançado sobre técnicas e ferramentas para análise de dados.');


-- Exibir todos os registros da tabela Alunos
-- 1. Selecionar a quantidade total de estudantes cadastrados no banco;

SELECT * FROM "pj_md2"."Alunos";

-- Exibir todos os registros da tabela Facilitadores
SELECT * FROM "pj_md2"."Facilitadores";

-- Exibir todos os registros da tabela Turmas
SELECT * FROM "pj_md2"."Turmas";

-- Exibir todos os registros da tabela Módulos
SELECT * FROM "pj_md2"."Módulos";

-- Exibir todos os registros da tabela Cursos
SELECT * FROM "pj_md2"."Cursos";

-- ver quais alunos estão na turma desejada

SELECT t.ID_turma, t.nome_turma, a.ID_aluno, a.Nome
FROM "pj_md2"."Turmas" t
JOIN "pj_md2"."Alunos_Turma" at ON t.ID_turma = at.ID_turma
JOIN "pj_md2"."Alunos" a ON at.ID_aluno = a.ID_aluno
WHERE t.ID_turma = 1; 
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++


SELECT t.ID_turma, t.nome_turma, a.ID_aluno, a.Nome
FROM "pj_md2"."Turmas" t
JOIN "pj_md2"."Alunos_Turma" at ON t.ID_turma = at.ID_turma
JOIN "pj_md2"."Alunos" a ON at.ID_aluno = a.ID_aluno;

select * from "pj_md2"."Alunos_Turma";


