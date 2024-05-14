# Descrição do Projeto

Este projeto consiste em um conjunto de scripts SQL para criar e popular tabelas de um banco de dados relacionado a um sistema de gerenciamento de alunos, turmas, facilitadores, cursos e módulos. As tabelas estão organizadas no esquema `pj_md2`.

## Tabelas

1. **Alunos**: Armazena informações sobre os alunos, incluindo nome, CPF, data de nascimento, e-mail e ID da turma à qual estão associados.
2. **Facilitadores**: Contém informações sobre os facilitadores, como nome, CPF, e-mail e ID do módulo ao qual estão atribuídos.
3. **Turmas**: Registra informações sobre as turmas, como nome, datas de início e término, ID do curso associado, ID do facilitador responsável e ID do aluno vinculado.
4. **Módulos**: Mantém os detalhes dos módulos relacionados a cada turma, incluindo descrição, carga horária e ID da turma correspondente.
5. **Cursos**: Descreve os cursos disponíveis, contendo nome e descrição.

## Scripts SQL

Os scripts SQL fornecidos incluem:

- **Criação das tabelas**: Define a estrutura das tabelas utilizando o esquema `pj_md2`.
- **Adição de restrições de chave estrangeira**: Garante a integridade referencial entre as tabelas.
- **Inserção de dados nas tabelas**: Preenche as tabelas com dados de exemplo para ilustrar o funcionamento do sistema.
- **Consultas para recuperar informações específicas**: Demonstram como realizar consultas para obter informações relevantes, como a quantidade de alunos por turma, os facilitadores associados a cada turma, entre outros.

## Como Usar

1. **Execução dos Scripts SQL**: Execute os scripts SQL em seu servidor de banco de dados PostgreSQL para criar as tabelas e adicionar os dados iniciais.
2. **Consulta aos Dados**: Utilize as consultas SQL fornecidas para recuperar informações específicas conforme necessário para análise ou exibição no sistema.

## Pré-requisitos

- Banco de dados PostgreSQL: Certifique-se de ter um servidor PostgreSQL configurado e acessível para executar os scripts SQL.

## Perguntas e Respostas

1. **Qual foi a maior dificuldade da empresa para organizar o banco de dados?**
   A maior dificuldade do empresa( grupo), foi a questão das cardinalidades e a porcentagem de evasão das turmas.
   
2. **O que foi feito para otimizar a porcentagem de evasão das turmas?**
   Desenvolvemos uma visualização que extrai o nome da turma e o renomeia como 'nome_turma'. Além disso, calcula o número de alunos que abandonaram a turma (com status igual a 0) e determina a porcentagem de evasão na turma, arredondando para 2 casas decimais.
   
3. **O que vai ser feito se eu perder (apagar ele sem querer ) um dado?**
   Colocamos um procedimento conhecido como trigger, onde são armazenados todos os dados do banco, conta o número total de registros encontrados na consulta, representando o total de alunos na turma.
   
4. **Como foi feito o processo de junção de 3 entidades?**
   Utilizamos as chaves estrangeiras de forma estratégica para poder realizar o inner join e obter o resultado desejado.
   
5. **Qual foi a maior dificuldade do modelo conceitual?**
   A maior complicação do modelo foi a questão da cardinalidade, as variáveis que ficam bastante confusas e acabam deixando a mente perturbada.
   
6. **Quais foram as estratégias implementadas para garantir a integridade dos dados durante o processo de junção das entidades?**
   - Uso de chaves estrangeiras: Garantir que as chaves estrangeiras estejam corretamente definidas e relacionadas entre as entidades para manter a consistência dos dados.
   - Validação dos dados: Realizar uma validação completa dos dados antes e depois do processo de junção para identificar inconsistências e erros.
   - Backup dos dados: Fazer backup dos dados antes de realizar a junção das entidades para garantir a recuperação em caso de problemas.

---

## Exemplo de Diagrama de Banco de Dados

![Diagrama de Banco de Dados](link_para_sua_imagem)

## Exemplo de Insert e Consulta SQL
 ```sql
INSERT INTO "PJ_md2".facilitadores (nome, cpf, email) VALUES
('Ana Silva', '123.456.789-00', 'ana.silva@example.com'),
('Carlos Oliveira', '987.654.321-00', 'carlos.oliveira@example.com'),
('Mariana Santos', '111.222.333-44', 'mariana.santos@example.com'),
('Pedro Costa', '555.666.777-88', 'pedro.costa@example.com'),
('Camila Souza', '999.888.777-66', 'camila.souza@example.com'),
('João Pereira', '444.333.222-11', 'joao.pereira@example.com')
```
## Exemplo de Consulta SQL
```sql
SELECT COUNT(f.nome) as turma,f.nome FROM "PJ_md2".matricula as mt
INNER JOIN "PJ_md2".facilitadores as f
ON f.facilitador_id = mt.facilitador_id
GROUP BY f.nome
HAVING COUNT(f.nome) >=2
```
## Exemplo de Chamada da View

```sql
Select."PJ_md2".evasao_por_turma

```
# Autores :rocket:

| [<img src="https://avatars.githubusercontent.com/u/113541135?v=4" width=115><br><sub>Airton Guedes</sub>](https://github.com/AirtonSGuedes) | [<img src="https://avatars.githubusercontent.com/u/117066982?v=4" width=100><br><sub>Martha Lucena</sub>](https://github.com/MarthaLucena) | [<img src="https://avatars.githubusercontent.com/u/114114763?v=4" width=115><br><sub>Sergio Henrique</sub>](https://github.com/Sergin03) | [<img src="https://avatars.githubusercontent.com/u/113257053?v=4" width=115><br><sub>Guilherme Sousa</sub>](https://github.com/GuilhermeASousa) |
|---|---|---|---|





