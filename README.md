# SQL-Basic-School-Schedule
Projeto da disciplina Gerenciamento de Dados e Informação que consiste em uma simulação de banco de dados de uma agenda acadêmica básica, permitindo dois tipos de registro (professor ou aluno).
Link do script no Oracle Sever (onde é possível ver as tabelas resultantes das consultas): https://livesql.oracle.com/apex/livesql/s/gukp5i7esvdp17ns50x1am0wu
# Minimundo:
Aplicativo que permite fazer dois tipos de registro: professor ou aluno. 

Haverá cinco entidades: Pessoa, Conta, Aluno, Professor e Disciplina.

Pessoa deve ter como atributos CPF (único, o mesmo CPF não pode ser usado mais de uma vez), nome, sexo, data de nascimento e nacionalidade.

Conta deve ter como atributos email (único, o mesmo email não pode ser usado mais de uma vez), instituição de ensino e senha.
Aluno é especialização de Conta e deve ter como atributos curso, período, ano de entrada e turma.

Professor é especialização de Conta e deve ter como atributos título, ano que foi contratado e ano do fim do contrato.

Disciplina deve ter como atributos COD (código único, o mesmo código não pode ser usado mais de uma vez), nome, prazos compostos de descrição e data (pode haver mais de um prazo), horários compostos de dia da semana e hora (pode haver mais de um horário).

Cada Pessoa só pode possuir uma Conta e vice-versa.

Uma Disciplina só pode ser lecionada por um Professor, mas um Professor pode lecionar várias Disciplinas.

Um Aluno pode frequentar várias Disciplinas e Disciplinas pode ser frequentada por vários Alunos. Deve-se guardar as notas dos alunos e suas faltas.

Como aluno, a pessoa/usuário poderá registrar as disciplinas que está matriculado, notas e faltas de cada disciplina, consultar se está na final e registrar e consultar datas importantes, como provas e trabalhos.

Como professor, a pessoa/usuário poderá consultar a presença dos alunos, que alunos reprovaram, que alunos estão na final e registrar e consultar datas importantes da disciplina.
