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

## Autor

Este projeto foi desenvolvido por [Seu Nome/Aplicativo] como parte do sistema de gerenciamento acadêmico da [Nome da Instituição/Empresa].
