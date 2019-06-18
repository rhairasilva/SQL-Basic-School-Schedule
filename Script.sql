REM   Script: Projeto Final GDI  4.0
REM   Aluna: Rhaíra Keitianne. 
REM   Link no Oracle Server (é possível ver as tabelas resultantes das consultas): https://livesql.oracle.com/apex/livesql/s/gukp5i7esvdp17ns50x1am0wu

create table Pessoa    
(CPF nvarchar2 (14) not null,    
Nome nvarchar2 (35) not null,    
Data_de_nascimento nvarchar2 (10),    
Nacionalidade nvarchar2 (20),    
Sexo char,    
constraint pessoa_pkey primary key (CPF),  
constraint sexo_valores check (Sexo in ('M', 'F')));

create table Conta   
(Email nvarchar2 (15) not null,   
Senha nvarchar2 (6) not null,   
Instituicao_de_ensino nvarchar2 (20) not null,   
CPF_Pes nvarchar2 (14) not null,   
constraint conta_pkey primary key (Email),   
constraint conta_fkey foreign key (CPF_Pes) references Pessoa(CPF),  
constraint senha_tam check (length(Senha)=6));

create table Aluno   
(Email_Conta nvarchar2 (15) not null,   
Ano_de_entrada nvarchar2 (6) not null,   
Curso nvarchar2 (15) not null,   
Turma nvarchar2 (15) not null,  
Periodo integer,  
constraint aluno_fkey foreign key (Email_Conta) references Conta(Email),   
constraint aluno_pkey primary key (Email_Conta));

create table Professor   
(Email_Conta nvarchar2 (15) not null,    
Ano_inicio_contrato nvarchar2 (6) not null,   
Ano_fim_contrato nvarchar2 (6),   
Titulo nvarchar2 (30) not null,  
constraint professor_fkey foreign key (Email_Conta) references Conta(Email),    
constraint professor_pkey primary key (Email_Conta));

create table Disciplina   
(COD nvarchar2 (10) not null,   
Nome nvarchar2 (30) not null,  
Email_Conta nvarchar2 (15) not null,  
constraint disciplina_fkey1 foreign key (Email_Conta) references Conta(Email),  
constraint disciplina_pkey primary key (COD));

create table Prazos   
(COD nvarchar2 (10),   
Data_ date,   
Descricao nvarchar2 (20),   
COD_Disc nvarchar2 (10) not null,   
constraint prazo_pkey primary key (COD),   
constraint prazo_fkey foreign key (COD_Disc) references Disciplina(COD));

create table Horarios   
(COD nvarchar2 (10),   
Dia_semana nvarchar2 (7),   
Hora nvarchar2 (5),   
COD_Disc nvarchar2 (10) not null,   
constraint horario_pkey primary key (COD),   
constraint horario_fkey foreign key (COD_Disc) references Disciplina(COD));

create table Frequenta    
(Email_Conta nvarchar2 (15) not null,    
COD_Disc nvarchar2 (10) not null,    
Nota1 number(4,2) not null,   
Nota2 number(4,2) not null,   
NotaFinal number(4,2),   
Faltas integer not null,  
constraint pertence_fkey1 foreign key (Email_Conta) references Conta(Email),    
constraint pertence_fkey2 foreign key (COD_Disc) references Disciplina(COD),    
constraint pertence_pkey1 primary key (Email_Conta, COD_Disc),   
constraint ch_nota1 check (Nota1 between 00.00 and 10.00),   
constraint ch_nota2 check (Nota2 between 00.00 and 10.00),   
constraint ch_notaf check (NotaFinal between 00.00 and 10.00));

insert into Pessoa(CPF, Nome, Data_de_nascimento, Nacionalidade, Sexo)   
values('808.381.063-07', 'Leonardo Davi Fogaca', '09/03/2000', 'Brasileiro(a)', 'M');

 insert into Pessoa(CPF, Nome, Data_de_nascimento, Nacionalidade, Sexo)   
values('274.059.051-29', 'Isadora Analu Assis', '12/06/2000', 'Brasileiro(a)', 'F');

 insert into Pessoa(CPF, Nome, Data_de_nascimento, Nacionalidade, Sexo)   
values('118.261.545-74', 'Alana Mota', '04/01/1998','Brasileiro(a)','F');

 insert into Pessoa(CPF, Nome, Data_de_nascimento, Nacionalidade, Sexo)   
values('682.877.668-26', 'Pietro Luan Barros', '01/04/1993', 'Brasileiro(a)', 'M');

 insert into Pessoa(CPF, Nome, Data_de_nascimento, Nacionalidade, Sexo)   
values('786.632.774-23', 'Hannah Campbell', '09/05/1998', 'Australiano(a)', 'F');

 insert into Pessoa(CPF, Nome, Data_de_nascimento, Nacionalidade, Sexo)   
values('814.920.947-65', 'John Watson', '01/04/1982', 'Canadense', 'M');

 insert into Pessoa(CPF, Nome, Data_de_nascimento, Nacionalidade, Sexo)   
values('118.466.516-89', 'Adriana Monteiro', '20/03/2000','Brasileiro(a)','F');

 insert into Pessoa(CPF, Nome, Data_de_nascimento, Nacionalidade, Sexo)   
values('915.459.416-29', 'Samuel Souza', '26/10/1996', 'Brasileiro(a)', 'M');

 insert into Pessoa(CPF, Nome, Data_de_nascimento, Nacionalidade, Sexo)   
values('011.986.661-70', 'Juan Garcia', '13/02/1996', 'Espanhol(a)', 'M');

 insert into Pessoa(CPF, Nome, Data_de_nascimento, Nacionalidade, Sexo)   
values('584.135.259-85', 'Geraldo Barros', '13/05/1987', 'Brasileiro(a)', 'M');

 insert into Pessoa(CPF, Nome, Data_de_nascimento, Nacionalidade, Sexo)   
values('604.450.783-16', 'Amanda Figueiredo', '11/08/1987','Brasileiro(a)','F');

 insert into Pessoa(CPF, Nome, Data_de_nascimento, Nacionalidade, Sexo)   
values('264.115.114-62', 'Marlene Oliveira', '01/03/1963','Brasileiro(a)','F');

 insert into Pessoa(CPF, Nome, Data_de_nascimento, Nacionalidade, Sexo)   
values('142.175.021-09', 'Sueli Pires', '17/04/1978','Brasileiro(a)','F');

 insert into Pessoa(CPF, Nome, Data_de_nascimento, Nacionalidade, Sexo)   
values('225.287.954-83', 'Arthur Dias', '04/09/1995', 'Brasileiro(a)', 'M');

 insert into Pessoa(CPF, Nome, Data_de_nascimento, Nacionalidade, Sexo)   
values('874.459.171-36', 'Lucas Campos', '09/08/1999', 'Brasileiro(a)', 'M');

 insert into Pessoa(CPF, Nome, Data_de_nascimento, Nacionalidade, Sexo)   
values('630.957.005-63', 'Renato Cunha', '11/03/1999', 'Brasileiro(a)', 'M');

 insert into Pessoa(CPF, Nome, Data_de_nascimento, Nacionalidade, Sexo)   
values('829.323.526-87', 'Joaquim Novaes', '11/05/1999', 'Brasileiro(a)', 'M');

 insert into Pessoa(CPF, Nome, Data_de_nascimento, Nacionalidade, Sexo)   
values('696.613.187-35', 'Breno Porto', '25/06/1998', 'Brasileiro(a)', 'M');

 insert into Pessoa(CPF, Nome, Data_de_nascimento, Nacionalidade, Sexo)   
values('964.966.000-31', 'Arthur Assis', '12/08/1998', 'Brasileiro(a)', 'M');

 insert into Pessoa(CPF, Nome, Data_de_nascimento, Nacionalidade, Sexo)   
values('153.204.479-81', 'Maria Fernandes', '12/12/1998','Brasileiro(a)','F');

 insert into Pessoa(CPF, Nome, Data_de_nascimento, Nacionalidade, Sexo)   
values('406.584.323-54', 'Isabela Britto', '01/08/1996','Brasileiro(a)','F');

 insert into Pessoa(CPF, Nome, Data_de_nascimento, Nacionalidade, Sexo)   
values('676.783.523-44', 'Rafaela Almeida', '06/04/1997','Brasileiro(a)','F');

 insert into Pessoa(CPF, Nome, Data_de_nascimento, Nacionalidade, Sexo)   
values('331.382.547-80', 'Isadora Peixoto', '09/09/1995','Brasileiro(a)','F');

 insert into Pessoa(CPF, Nome, Data_de_nascimento, Nacionalidade, Sexo)   
values('904.403.457-07', 'Aurora Santos', '01/02/1998', 'Brasileiro(a)','F');

 insert into Pessoa(CPF, Nome, Data_de_nascimento, Nacionalidade, Sexo)   
values('723.635.755-39', 'Luna Nascimento', '21/02/1998', 'Brasileiro(a)','F');

 insert into Pessoa(CPF, Nome, Data_de_nascimento, Nacionalidade, Sexo)   
values('949.864.506-03', 'Heitor Rocha', '26/02/1969', 'Brasileiro(a)', 'M');

 insert into Pessoa(CPF, Nome, Data_de_nascimento, Nacionalidade, Sexo)   
values('059.740.471-25', 'Edson Guedes', '02/07/1969', 'Brasileiro(a)', 'M');

 insert into Pessoa(CPF, Nome, Data_de_nascimento, Nacionalidade, Sexo)   
values('197.153.083-25', 'Raul Gomes', '05/05/1989', 'Brasileiro(a)', 'M');

 insert into Pessoa(CPF, Nome, Data_de_nascimento, Nacionalidade, Sexo)   
values('520.220.812-00', 'Eduarda Souza', '18/10/1985','Brasileiro(a)','F');

 insert into Pessoa(CPF, Nome, Data_de_nascimento, Nacionalidade, Sexo)   
values('002.616.815-40', 'Marie Dominy', '17/06/1985','Ingles(a)','F');

insert into Conta(Email, Senha, Instituicao_de_ensino, CPF_Pes)   
values('issis@gmail.com', 'pWJFYq', 'UFPE', '274.059.051-29');

insert into Conta(Email, Senha, Instituicao_de_ensino, CPF_Pes)   
values('amota@gmail.com', 'fkQYz4', 'UFPE', '118.261.545-74');

insert into Conta(Email, Senha, Instituicao_de_ensino, CPF_Pes)   
values('lbaro@gmail.com', 'bpFrj2', 'UFPE', '682.877.668-26');

insert into Conta(Email, Senha, Instituicao_de_ensino, CPF_Pes)   
values('hcamp@gmail.com', 'yUte8H', 'UFPE', '786.632.774-23');

insert into Conta(Email, Senha, Instituicao_de_ensino, CPF_Pes)   
values('jwats@gmail.com', 'UYfyTx', 'UFPE', '814.920.947-65');

insert into Conta(Email, Senha, Instituicao_de_ensino, CPF_Pes)   
values('adrim@gmail.com', 'ahIS7u', 'UFPE', '118.466.516-89');

insert into Conta(Email, Senha, Instituicao_de_ensino, CPF_Pes)   
values('jugar@gmail.com', 'tCp1Ch', 'UFRPE', '011.986.661-70');

insert into Conta(Email, Senha, Instituicao_de_ensino, CPF_Pes)   
values('samso@gmail.com', 'IQ6ppg', 'UFPE', '915.459.416-29');

insert into Conta(Email, Senha, Instituicao_de_ensino, CPF_Pes)   
values('gbaro@gmail.com', 'FTMhdj', 'UFPE', '584.135.259-85');

insert into Conta(Email, Senha, Instituicao_de_ensino, CPF_Pes)   
values('amfig@gmail.com', 'obasKS', 'UFPE', '604.450.783-16');

insert into Conta(Email, Senha, Instituicao_de_ensino, CPF_Pes)   
values('marol@gmail.com', 'tQEObN', 'UFPE', '264.115.114-62');

insert into Conta(Email, Senha, Instituicao_de_ensino, CPF_Pes)   
values('supir@gmail.com', 'KEYaMF', 'UFPE', '142.175.021-09');

insert into Conta(Email, Senha, Instituicao_de_ensino, CPF_Pes)   
values('adias@gmail.com', 'qDZOPN', 'UFRPE', '225.287.954-83');

 insert into Conta(Email, Senha, Instituicao_de_ensino, CPF_Pes)   
values('lcamp@gmail.com', 'kwhBMH', 'UFPE', '874.459.171-36');

insert into Conta(Email, Senha, Instituicao_de_ensino, CPF_Pes)   
values('renc@gmail.com', 'hgEPiH', 'UFPE', '630.957.005-63');

 insert into Conta(Email, Senha, Instituicao_de_ensino, CPF_Pes)   
values('jnova@gmail.com', '3IzyfG', 'UFPE', '829.323.526-87');

insert into Conta(Email, Senha, Instituicao_de_ensino, CPF_Pes)   
values('aassi@gmail.com', 'lcYOgZ', 'UFRPE', '964.966.000-31');

insert into Conta(Email, Senha, Instituicao_de_ensino, CPF_Pes)   
values('marfe@gmail.com', 'MJuJit', 'UFRPE', '153.204.479-81');

insert into Conta(Email, Senha, Instituicao_de_ensino, CPF_Pes)   
values('isabr@gmail.com', 'BmInMA', 'UFRPE', '406.584.323-54');

insert into Conta(Email, Senha, Instituicao_de_ensino, CPF_Pes)   
values('ralme@gmail.com', 'mrEBNR', 'UFRPE', '676.783.523-44');

insert into Conta(Email, Senha, Instituicao_de_ensino, CPF_Pes)   
values('ipeix@gmail.com', 'Rmsc9h', 'UFRPE', '331.382.547-80');

insert into Conta(Email, Senha, Instituicao_de_ensino, CPF_Pes)   
values('auror@gmail.com', 'aY0414', 'UFRPE', '904.403.457-07');

insert into Conta(Email, Senha, Instituicao_de_ensino, CPF_Pes)   
values('lnasc@gmail.com', 'fCC1ra', 'UFRPE', '723.635.755-39');

	insert into Conta(Email, Senha, Instituicao_de_ensino, CPF_Pes)   
values('hoch@gmail.com', 'xYicpY', 'UFRPE', '949.864.506-03');

insert into Conta(Email, Senha, Instituicao_de_ensino, CPF_Pes)   
values('egued@gmail.com', 'm1Qjkr', 'UFRPE', '059.740.471-25');

	insert into Conta(Email, Senha, Instituicao_de_ensino, CPF_Pes)   
values('rgom@gmail.com', 'HjP0qx', 'UFRPE', '197.153.083-25');

insert into Conta(Email, Senha, Instituicao_de_ensino, CPF_Pes)   
values('esouz@gmail.com', '2LR6ce', 'UFRPE', '520.220.812-00');

insert into Conta(Email, Senha, Instituicao_de_ensino, CPF_Pes)   
values('mardo@gmail.com', 'lZm1Dw', 'UFRPE', '002.616.815-40');

insert into Conta(Email, Senha, Instituicao_de_ensino, CPF_Pes)   
values('bport@gmail.com', 'XkuDR2', 'UFRPE', '696.613.187-35');

 insert into Aluno(Email_Conta, Ano_de_entrada, Curso, Periodo, Turma)   
values('issis@gmail.com', '2018', 'Matematica', '1', '1PMF');

 insert into Aluno(Email_Conta, Ano_de_entrada, Curso, Periodo, Turma)   
values('amota@gmail.com', '2018', 'Matematica', '1', '1PMF');

 insert into Aluno(Email_Conta, Ano_de_entrada, Curso, Periodo, Turma)   
values('lbaro@gmail.com', '2018', 'Matematica', '1', '1PMF');

 insert into Aluno(Email_Conta, Ano_de_entrada, Curso, Periodo, Turma)   
values('hcamp@gmail.com', '2018', 'Matematica', '1', '1PMF');

 insert into Aluno(Email_Conta, Ano_de_entrada, Curso, Periodo, Turma)   
values('adrim@gmail.com', '2017', 'Matematica', '2', '2PMF');

 insert into Aluno(Email_Conta, Ano_de_entrada, Curso, Periodo, Turma)   
values('samso@gmail.com', '2017', 'Matematica', '2', '2PMF');

 insert into Aluno(Email_Conta, Ano_de_entrada, Curso, Periodo, Turma)   
values('lcamp@gmail.com', '2017', 'Matematica', '2', '2PMF');

 insert into Aluno(Email_Conta, Ano_de_entrada, Curso, Periodo, Turma)   
values('renc@gmail.com', '2017', 'Matematica', '2', '2PMF');

 insert into Aluno(Email_Conta, Ano_de_entrada, Curso, Periodo, Turma)   
values('jnova@gmail.com', '2017', 'Matematica', '2', '2PMF');

 insert into Aluno(Email_Conta, Ano_de_entrada, Curso, Periodo, Turma)   
values('bport@gmail.com', '2018', 'Fisica', '1', '1PFR');

 insert into Aluno(Email_Conta, Ano_de_entrada, Curso, Periodo, Turma)   
values('aassi@gmail.com', '2018', 'Fisica', '1', '1PFR');

 insert into Aluno(Email_Conta, Ano_de_entrada, Curso, Periodo, Turma)   
values('marfe@gmail.com', '2018', 'Fisica', '1', '1PFR');

 insert into Aluno(Email_Conta, Ano_de_entrada, Curso, Periodo, Turma)   
values('ralme@gmail.com', '2018', 'Fisica', '1', '1PFR');

 insert into Aluno(Email_Conta, Ano_de_entrada, Curso, Periodo, Turma)   
values('isabr@gmail.com', '2018', 'Fisica', '1', '1PFR');

 insert into Aluno(Email_Conta, Ano_de_entrada, Curso, Periodo, Turma)   
values('jugar@gmail.com', '2017', 'Fisica', '3', '3PFR');

 insert into Aluno(Email_Conta, Ano_de_entrada, Curso, Periodo, Turma)   
values('adias@gmail.com', '2017', 'Fisica', '3', '3PFR');

 insert into Aluno(Email_Conta, Ano_de_entrada, Curso, Periodo, Turma)   
values('ipeix@gmail.com', '2017', 'Fisica', '3', '3PFR');

 insert into Aluno(Email_Conta, Ano_de_entrada, Curso, Periodo, Turma)   
values('lnasc@gmail.com', '2017', 'Fisica', '3', '3PFR');

 insert into Aluno(Email_Conta, Ano_de_entrada, Curso, Periodo, Turma)   
values('auror@gmail.com', '2017', 'Fisica', '3', '3PFR');

insert into Professor(Email_Conta, Ano_inicio_contrato, Ano_fim_contrato, Titulo)   
values('jwats@gmail.com', '2012', '2022', 'Doutor(a)');

 insert into Professor(Email_Conta, Ano_inicio_contrato, Ano_fim_contrato, Titulo)   
values('gbaro@gmail.com', '2016', '2024', 'Mestre');

 insert into Professor(Email_Conta, Ano_inicio_contrato, Ano_fim_contrato, Titulo)   
values('amfig@gmail.com', '2015', '2022', 'Mestre');

 insert into Professor(Email_Conta, Ano_inicio_contrato, Ano_fim_contrato, Titulo)   
values('marol@gmail.com', '2008', '2020', 'Doutor(a)');

 insert into Professor(Email_Conta, Ano_inicio_contrato, Ano_fim_contrato, Titulo)   
values('supir@gmail.com', '2008', '2020', 'Doutor(a)');

 insert into Professor(Email_Conta, Ano_inicio_contrato, Ano_fim_contrato, Titulo)   
values('hoch@gmail.com', '2010', '2030', 'Doutor(a)');

 insert into Professor(Email_Conta, Ano_inicio_contrato, Ano_fim_contrato, Titulo)   
values('egued@gmail.com', '2015', '2025', 'Doutor(a)');

 insert into Professor(Email_Conta, Ano_inicio_contrato, Ano_fim_contrato, Titulo)   
values('rgom@gmail.com', '2018', '2025', 'Mestre');

 insert into Professor(Email_Conta, Ano_inicio_contrato, Ano_fim_contrato, Titulo)   
values('esouz@gmail.com', '2015', '2022', 'Mestre');

 insert into Professor(Email_Conta, Ano_inicio_contrato, Ano_fim_contrato, Titulo)   
values('mardo@gmail.com', '2018', '2030', 'Doutor(a)');

insert into Disciplina(COD, Nome, Email_Conta)   
values('CALC1F', 'Calculo 1', 'jwats@gmail.com');

 insert into Disciplina(COD, Nome, Email_Conta)   
values('CALC2F', 'Calculo 2', 'gbaro@gmail.com');

 insert into Disciplina(COD, Nome, Email_Conta)   
values('CALC3R', 'Calculo 3', 'hoch@gmail.com');

 insert into Disciplina(COD, Nome, Email_Conta)   
values('CALC1R', 'Calculo 1', 'egued@gmail.com');

 insert into Disciplina(COD, Nome, Email_Conta)   
values('MAT1F', 'Matematica 1', 'amfig@gmail.com');

 insert into Disciplina(COD, Nome, Email_Conta)   
values('FIS1R', 'Fisica 1', 'rgom@gmail.com');

 insert into Disciplina(COD, Nome, Email_Conta)   
values('MAT2F', 'Matematica 2', 'marol@gmail.com');

 insert into Disciplina(COD, Nome, Email_Conta)   
values('FIS3R', 'Fisica 3', 'esouz@gmail.com');

 insert into Disciplina(COD, Nome, Email_Conta)   
values('PROG1F', 'Programacao 1', 'gbaro@gmail.com');

 insert into Disciplina(COD, Nome, Email_Conta)   
values('PROG1R', 'Programacao 1', 'egued@gmail.com');

 insert into Disciplina(COD, Nome, Email_Conta)   
values('GEAN23F', 'Geometria Analitica', 'supir@gmail.com');

 insert into Disciplina(COD, Nome, Email_Conta)   
values('GEAN23R', 'Geometria Analitica', 'mardo@gmail.com');

insert into Prazos(COD, Data_, Descricao, COD_Disc)   
values('01', to_date('09/04/2018', 'dd/mm/yyyy'), 'Prova 1', 'CALC1F');

 insert into Prazos(COD, Data_, Descricao, COD_Disc)   
values('02', to_date('09/05/2018','dd/mm/yyyy'), 'Prova 2', 'CALC1F');

 insert into Prazos(COD, Data_, Descricao, COD_Disc)   
values('03', to_date('29/06/2018','dd/mm/yyyy'), 'Prova Final', 'CALC1F');

 insert into Prazos(COD, Data_, Descricao, COD_Disc)   
values('04', to_date('21/05/2018','dd/mm/yyyy'), 'Prova 1', 'CALC1R');

 insert into Prazos(COD, Data_, Descricao, COD_Disc)   
values('05', to_date('25/06/2018','dd/mm/yyyy'), 'Prova 2', 'CALC1R');

 insert into Prazos(COD, Data_, Descricao, COD_Disc)   
values('06', to_date('26/07/2018','dd/mm/yyyy'), 'Prova Final', 'CALC1R');

 insert into Prazos(COD, Data_, Descricao, COD_Disc)   
values('07', to_date('09/04/2018','dd/mm/yyyy'), 'Prova 1', 'CALC2F');

 insert into Prazos(COD, Data_, Descricao, COD_Disc)   
values('08', to_date('09/05/2018','dd/mm/yyyy'), 'Prova 2', 'CALC2F');

 insert into Prazos(COD, Data_, Descricao, COD_Disc)   
values('09', to_date('29/06/2018','dd/mm/yyyy'), 'Prova Final', 'CALC2F');

 insert into Prazos(COD, Data_, Descricao, COD_Disc)   
values('10', to_date('21/05/2018','dd/mm/yyyy'), 'Prova 1', 'CALC3R');

 insert into Prazos(COD, Data_, Descricao, COD_Disc)   
values('11', to_date('25/06/2018','dd/mm/yyyy'), 'Prova 2', 'CALC3R');

 insert into Prazos(COD, Data_, Descricao, COD_Disc)   
values('12', to_date('26/07/2018','dd/mm/yyyy'), 'Prova Final', 'CALC3R');

 insert into Prazos(COD, Data_, Descricao, COD_Disc)   
values('13', to_date('10/04/2018','dd/mm/yyyy'), 'Prova 1', 'MAT1F');

 insert into Prazos(COD, Data_, Descricao, COD_Disc)   
values('14', to_date('10/05/2018','dd/mm/yyyy'), 'Prova 2', 'MAT1F');

 insert into Prazos(COD, Data_, Descricao, COD_Disc)   
values('15', to_date('11/06/2018','dd/mm/yyyy'), 'Prova Final', 'MAT1F');

 insert into Prazos(COD, Data_, Descricao, COD_Disc)   
values('16', to_date('11/04/2018','dd/mm/yyyy'), 'Prova 1', 'FIS1R');

 insert into Prazos(COD, Data_, Descricao, COD_Disc)   
values('17', to_date('11/05/2018','dd/mm/yyyy'), 'Prova 2', 'FIS1R');

 insert into Prazos(COD, Data_, Descricao, COD_Disc)   
values('18', to_date('11/06/2018','dd/mm/yyyy'), 'Prova Final', 'FIS1R');

 insert into Prazos(COD, Data_, Descricao, COD_Disc)   
values('19', to_date('10/04/2018','dd/mm/yyyy'), 'Prova 1', 'MAT2F');

 insert into Prazos(COD, Data_, Descricao, COD_Disc)   
values('20', to_date('10/05/2018','dd/mm/yyyy'), 'Prova 2', 'MAT2F');

 insert into Prazos(COD, Data_, Descricao, COD_Disc)   
values('21', to_date('11/06/2018','dd/mm/yyyy'), 'Prova Final', 'MAT2F');

 insert into Prazos(COD, Data_, Descricao, COD_Disc)   
values('22', to_date('11/04/2018','dd/mm/yyyy'), 'Prova 1', 'FIS3R');

 insert into Prazos(COD, Data_, Descricao, COD_Disc)   
values('23', to_date('11/05/2018','dd/mm/yyyy'), 'Prova 2', 'FIS3R');

 insert into Prazos(COD, Data_, Descricao, COD_Disc)   
values('24', to_date('11/06/2018','dd/mm/yyyy'), 'Prova Final', 'FIS3R');

 insert into Prazos(COD, Data_, Descricao, COD_Disc)   
values('25', to_date('23/05/2018','dd/mm/yyyy'), 'Prova 1', 'PROG1F');

 insert into Prazos(COD, Data_, Descricao, COD_Disc)   
values('26', to_date('25/06/2018','dd/mm/yyyy'), 'Prova 2', 'PROG1F');

 insert into Prazos(COD, Data_, Descricao, COD_Disc)   
values('27', to_date('11/07/2018','dd/mm/yyyy'), 'Prova Final', 'PROG1F');

 insert into Prazos(COD, Data_, Descricao, COD_Disc)   
values('28', to_date('12/04/2018','dd/mm/yyyy'), 'Prova 1', 'PROG1R');

 insert into Prazos(COD, Data_, Descricao, COD_Disc)   
values('29', to_date('15/05/2018','dd/mm/yyyy'), 'Prova 2', 'PROG1R');

 insert into Prazos(COD, Data_, Descricao, COD_Disc)   
values('30', to_date('21/06/2018','dd/mm/yyyy'), 'Prova Final', 'PROG1R');

 insert into Prazos(COD, Data_, Descricao, COD_Disc)   
values('31', to_date('30/04/2018','dd/mm/yyyy'), 'Prova 1', 'GEAN23F');

 insert into Prazos(COD, Data_, Descricao, COD_Disc)   
values('32', to_date('27/05/2018','dd/mm/yyyy'), 'Prova 2', 'GEAN23F');

 insert into Prazos(COD, Data_, Descricao, COD_Disc)   
values('34', to_date('03/04/2018','dd/mm/yyyy'), 'Prova 1', 'GEAN23R');

 insert into Prazos(COD, Data_, Descricao, COD_Disc)   
values('35', to_date('04/05/2018','dd/mm/yyyy'), 'Prova 2', 'GEAN23R');

 insert into Prazos(COD, Data_, Descricao, COD_Disc)   
values('36', to_date('06/06/2018','dd/mm/yyyy'), 'Prova Final', 'GEAN23R');

 insert into Prazos(COD, Data_, Descricao, COD_Disc)    
values('33', to_date('07/06/2018','dd/mm/yyyy'), 'Prova Final', 'GEAN23F');

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)   
values('issis@gmail.com', 'CALC1F', 07.00, 05.50, 0);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, NotaFinal, Faltas)   
values('issis@gmail.com', 'MAT1F', 05.00, 07.00, 5.3, 8);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)   
values('issis@gmail.com', 'PROG1F', 10.00, 09.80, 6);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)   
values('amota@gmail.com', 'CALC1F', 06.00, 04.50, 8);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, NotaFinal, Faltas)   
values('amota@gmail.com', 'MAT1F', 05.00, 05.00, 4.0, 12);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)   
values('amota@gmail.com', 'PROG1F', 06.00, 07.50, 6);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)   
values('lbaro@gmail.com', 'CALC1F', 08.00, 08.00, 4);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)   
values('lbaro@gmail.com', 'MAT1F', 07.50, 07.10, 6);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)   
values('lbaro@gmail.com', 'PROG1F', 09.00, 07.50, 20);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)   
values('hcamp@gmail.com', 'CALC1F', 07.20, 07.50, 0);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, NotaFinal, Faltas)   
values('hcamp@gmail.com', 'MAT1F', 03.00, 06.00, 03.50, 14);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)   
values('hcamp@gmail.com', 'PROG1F', 07.00, 09.50, 0);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2,NotaFinal, Faltas)   
values('bport@gmail.com', 'FIS1R', 07.00, 05.00, 08.00, 4);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)  
values('bport@gmail.com', 'CALC1R', 10.00, 10.00, 9);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)  
values('bport@gmail.com', 'PROG1R', 06.00, 07.00, 8);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)   
values('aassi@gmail.com', 'FIS1R', 10.00, 10.00, 0);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)   
values('aassi@gmail.com', 'CALC1R', 04.00, 05.00, 10);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)   
values('aassi@gmail.com', 'PROG1R', 06.00, 09.00, 12);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2,NotaFinal, Faltas)   
values('marfe@gmail.com', 'FIS1R', 04.00, 05.00, 08.00, 14);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)   
values('marfe@gmail.com', 'CALC1R', 04.00, 05.00, 8);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)   
values('marfe@gmail.com', 'PROG1R', 06.00, 08.00, 6);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2,NotaFinal, Faltas)  
values('ralme@gmail.com', 'FIS1R', 02.00, 03.00, 07.50, 7);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)   
values('ralme@gmail.com', 'CALC1R', 02.00, 02.00, 13);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)   
values('ralme@gmail.com', 'PROG1R', 10.00, 09.00, 4);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)   
values('isabr@gmail.com', 'FIS1R', 09.00, 08.00, 15);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2,Faltas)   
values('isabr@gmail.com', 'CALC1R', 06.00, 06.00, 25);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)   
values('isabr@gmail.com', 'PROG1R', 04.00, 10.00, 26);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)   
values('adrim@gmail.com', 'CALC2F', 10.00, 06.00, 4);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)  
values('adrim@gmail.com', 'MAT2F', 10.00, 10.00, 0);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)   
values('samso@gmail.com', 'CALC2F', 06.00, 07.50, 0);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, NotaFinal, Faltas)  
values('samso@gmail.com', 'MAT2F', 07.00, 4.00, 08.00, 2);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)   
values('lcamp@gmail.com', 'CALC2F', 04.00, 07.00, 8);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)  
values('lcamp@gmail.com', 'MAT2F', 07.00, 07.00, 8);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)   
values('renc@gmail.com', 'CALC2F', 08.00, 09.50, 0);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, NotaFinal, Faltas)  
values('renc@gmail.com', 'MAT2F', 6.00, 4.00, 04.00, 15);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)   
values('jnova@gmail.com', 'CALC2F', 06.00, 10.00, 8);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, NotaFinal, Faltas)  
values('jnova@gmail.com', 'MAT2F', 6.00, 6.00, 04.00, 0);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, NotaFinal, Faltas)   
values('jugar@gmail.com', 'FIS3R', 04.00, 02.00, 10.00, 0);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)   
values('jugar@gmail.com', 'CALC3R', 04.00, 09.00, 4);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, NotaFinal, Faltas)   
values('adias@gmail.com', 'FIS3R', 08.00, 03.00, 04.50, 10);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)  
values('adias@gmail.com', 'CALC3R', 08.00, 10.00, 13);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)   
values('ipeix@gmail.com', 'FIS3R', 07.00, 07.00, 0);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)   
values('ipeix@gmail.com', 'CALC3R', 04.00, 10.00, 0);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2,NotaFinal,Faltas)   
values('lnasc@gmail.com', 'FIS3R', 03.00,05.00,09.00,8);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)   
values('lnasc@gmail.com', 'CALC3R', 08.00,02.00,4);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2,NotaFinal,Faltas)   
values('auror@gmail.com', 'FIS3R', 01.00,08.00,05.50,4);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)   
values('auror@gmail.com', 'CALC3R', 06.00,08.00,2);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)  
values('adrim@gmail.com', 'GEAN23F', 06.00, 08.00, 0);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)  
values('lcamp@gmail.com', 'GEAN23F', 04.00, 05.50, 2);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, NotaFinal, Faltas)   
values('adias@gmail.com', 'GEAN23R', 06.00, 07.00, 08.00, 4);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2,NotaFinal,Faltas)   
values('ipeix@gmail.com', 'GEAN23R', 07.00, 06.00, 09.00, 20);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2,NotaFinal,Faltas)   
values('auror@gmail.com', 'GEAN23R', 04.00,04.00,10.00,1);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)  
values('samso@gmail.com', 'GEAN23F', 00.80, 03.70, 20);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)  
values('renc@gmail.com', 'GEAN23F', 06.50, 08.00, 4);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)  
values('jnova@gmail.com', 'GEAN23F', 08.50, 08.00, 4);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2,Faltas)   
values('jugar@gmail.com', 'GEAN23R', 10.00, 04.00, 5);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2,Faltas)   
values('lnasc@gmail.com', 'GEAN23R', 07.00,07.00,12);

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('01', 'Segunda','14:50','CALC1F');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('02', 'Sexta','14:00','CALC1F');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('03', 'Sexta','14:50','CALC1F');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('06', 'Quarta','14:00','PROG1F');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('07', 'Quarta','14:50','PROG1F');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('04', 'Segunda','16:00','PROG1F');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('05', 'Segunda','16:50','PROG1F');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('08', 'Quarta','16:00','MAT1F');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('09', 'Quarta','16:50','MAT1F');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('10', 'Sexta','16:00','MAT1F');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('11', 'Sexta','16:50','MAT1F');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('12', 'Segunda','14:00','MAT2F');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('13', 'Segunda','14:50','MAT2F');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('14', 'Segunda','16:00','CALC2F');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('15', 'Segunda','16:50','CALC2F');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('16', 'Quarta','14:00','CALC2F');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('17', 'Quarta','14:50','CALC2F');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('18', 'Quarta','16:00','GEAN23F');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('19', 'Quarta','16:50','GEAN23F');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('20', 'Sexta','14:00','MAT2F');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('21', 'Sexta','14:50','MAT2F');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('22', 'Sexta','16:00','GEAN23F');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('23', 'Sexta','16:50','GEAN23F');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('24', 'Segunda','14:00','FIS1R');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('25', 'Segunda','14:50','FIS1R');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('26', 'Segunda','16:00','PROG1R');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('27', 'Segunda','16:50','PROG1R');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('28', 'Quarta','14:00','CALC1R');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('29', 'Quarta','14:50','CALC1R');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('30', 'Quarta','16:00','FIS1R');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('31', 'Quarta','16:50','FIS1R');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('32', 'Sexta','14:00','CALC1R');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('33', 'Sexta','14:50','CALC1R');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('34', 'Sexta','16:00','PROG1R');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('35', 'Sexta','16:50','PROG1R');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('36', 'Segunda','14:00','GEAN23R');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('37', 'Segunda','14:50','GEAN23R');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('38', 'Segunda','16:00','CALC3R');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('39', 'Segunda','16:50','CALC3R');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('40', 'Quarta','14:00','GEAN23R');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('41', 'Quarta','14:50','GEAN23R');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('42', 'Quarta','16:00','FIS3R');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('43', 'Quarta','16:50','FIS3R');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('44', 'Sexta','14:00','FIS3R');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('45', 'Sexta','14:50','FIS3R');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('46', 'Sexta','16:00','CALC3R');

insert into Horarios(COD, dia_semana, Hora, COD_Disc)  
values('47', 'Sexta','16:50','CALC3R');

insert into Horarios(COD, dia_semana, Hora, COD_Disc) values('00','Segunda','14:00','CALC1F');

insert into Conta(Email, Senha, Instituicao_de_ensino, CPF_Pes)    
values('leofg@gmail.com', 'pWJFYq', 'UFPE', '274.059.051-29');

insert into Aluno(Email_Conta, Ano_de_entrada, Curso, Periodo, Turma)    
values('leofg@gmail.com', '2018', 'Matematica', '1', '1PMF');

insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)    
values('leofg@gmail.com', 'CALC1F', 08.00, 06.50, 2);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)    
values('leofg@gmail.com', 'PROG1F', 07.00, 07.00, 8);

 insert into Frequenta(Email_Conta, COD_Disc, Nota1, Nota2, Faltas)    
values('leofg@gmail.com', 'MAT1F', 08.00, 07.00, 2);

select C.Instituicao_de_ensino, D.Nome, F.COD_Disc, P.Nome, P.CPF, ((F.Nota1+F.Nota2)/2) as Media from Pessoa P, Frequenta F, Conta C, Disciplina D  
where P.CPF = C.CPF_Pes and C.Instituicao_de_ensino = 'UFPE' and F.Email_Conta = C.Email and F.COD_Disc = D.COD and ((F.Nota1+F.Nota2)/2) < 07.00 and F.NotaFinal is null order by D.Nome, P.Nome;

select C.Instituicao_de_ensino, D.Nome, F.COD_Disc, P.Nome, P.CPF, ((F.Nota1+F.Nota2)/2) as Media from Pessoa P, Frequenta F, Conta C, Disciplina D  
where P.CPF = C.CPF_Pes and C.Instituicao_de_ensino = 'UFRPE' and F.Email_Conta = C.Email and F.COD_Disc = D.COD and ((F.Nota1+F.Nota2)/2) < 07.00 and F.NotaFinal is null order by D.Nome, P.Nome;

select P.Nome, P.CPF, D.Nome, F.COD_Disc from Pessoa P, Frequenta F, Conta C, Disciplina D 
where P.CPF = C.CPF_Pes and F.Email_Conta = C.Email and D.COD = F.COD_Disc and F.COD_Disc='FIS1R' order by P.Nome;

select P.Nome, P.CPF, D.Nome, F.COD_Disc from Pessoa P, Frequenta F, Conta C, Disciplina D 
where P.CPF = C.CPF_Pes and F.Email_Conta = C.Email and D.COD = F.COD_Disc and F.COD_Disc='CALC1R' order by P.Nome;

select P.Nome, P.CPF, D.Nome, F.COD_Disc from Pessoa P, Frequenta F, Conta C, Disciplina D 
where P.CPF = C.CPF_Pes and F.Email_Conta = C.Email and D.COD = F.COD_Disc and F.COD_Disc='CALC1F' order by P.Nome;

select P.Nome, P.CPF, D.Nome, F.COD_Disc from Pessoa P, Frequenta F, Conta C, Disciplina D 
where P.CPF = C.CPF_Pes and F.Email_Conta = C.Email and D.COD = F.COD_Disc and F.COD_Disc='CALC2F' order by P.Nome;

select P.Nome, P.CPF, D.Nome, F.COD_Disc from Pessoa P, Frequenta F, Conta C, Disciplina D 
where P.CPF = C.CPF_Pes and F.Email_Conta = C.Email and D.COD = F.COD_Disc and F.COD_Disc='CALC3R' order by P.Nome;

select P.Nome, P.CPF, D.Nome, F.COD_Disc from Pessoa P, Frequenta F, Conta C, Disciplina D 
where P.CPF = C.CPF_Pes and F.Email_Conta = C.Email and D.COD = F.COD_Disc and F.COD_Disc='MAT1F' order by P.Nome;

select P.Nome, P.CPF, D.Nome, F.COD_Disc from Pessoa P, Frequenta F, Conta C, Disciplina D 
where P.CPF = C.CPF_Pes and F.Email_Conta = C.Email and D.COD = F.COD_Disc and F.COD_Disc='MAT2F' order by P.Nome;

select P.Nome, P.CPF, D.Nome, F.COD_Disc from Pessoa P, Frequenta F, Conta C, Disciplina D 
where P.CPF = C.CPF_Pes and F.Email_Conta = C.Email and D.COD = F.COD_Disc and F.COD_Disc='FIS3R' order by P.Nome;

select P.Nome, P.CPF, D.Nome, F.COD_Disc from Pessoa P, Frequenta F, Conta C, Disciplina D 
where P.CPF = C.CPF_Pes and F.Email_Conta = C.Email and D.COD = F.COD_Disc and F.COD_Disc='GEAN23F' order by P.Nome;

select P.Nome, P.CPF, D.Nome, F.COD_Disc from Pessoa P, Frequenta F, Conta C, Disciplina D 
where P.CPF = C.CPF_Pes and F.Email_Conta = C.Email and D.COD = F.COD_Disc and F.COD_Disc='GEAN23R' order by P.Nome;

select P.Nome, P.CPF, D.Nome, F.COD_Disc from Pessoa P, Frequenta F, Conta C, Disciplina D 
where P.CPF = C.CPF_Pes and F.Email_Conta = C.Email and D.COD = F.COD_Disc and F.COD_Disc='PROG1R' order by P.Nome;

select P.Nome, P.CPF, D.Nome, F.COD_Disc from Pessoa P, Frequenta F, Conta C, Disciplina D 
where P.CPF = C.CPF_Pes and F.Email_Conta = C.Email and D.COD = F.COD_Disc and F.COD_Disc='PROG1F' order by P.Nome;

select P.Nome, P.CPF, C.Instituicao_de_ensino, D.Nome, F.COD_Disc, F.Faltas from Pessoa P, Frequenta F, Conta C, Disciplina D 
where P.CPF = C.CPF_Pes and F.Email_Conta = C.Email and D.COD = F.COD_Disc and C.Instituicao_de_ensino = 'UFPE' and F.Faltas > 18 order by P.Nome;

select P.Nome, P.CPF, C.Instituicao_de_ensino, D.Nome, F.COD_Disc, F.Faltas from Pessoa P, Frequenta F, Conta C, Disciplina D 
where P.CPF = C.CPF_Pes and F.Email_Conta = C.Email and D.COD = F.COD_Disc and C.Instituicao_de_ensino = 'UFRPE' and F.Faltas > 18 order by P.Nome;

select P.Nome, P.CPF, C.Instituicao_de_ensino, D.Nome, F.COD_Disc, F.Faltas from Pessoa P, Frequenta F, Conta C, Disciplina D 
where P.CPF = C.CPF_Pes and F.Email_Conta = C.Email and D.COD = F.COD_Disc and C.Instituicao_de_ensino = 'UFPE' order by D.Nome, F.Faltas desc;

select P.Nome, P.CPF, C.Instituicao_de_ensino, D.Nome, F.COD_Disc, F.Faltas from Pessoa P, Frequenta F, Conta C, Disciplina D 
where P.CPF = C.CPF_Pes and F.Email_Conta = C.Email and D.COD = F.COD_Disc and C.Instituicao_de_ensino = 'UFRPE' order by D.Nome, F.Faltas desc;

select P.CPF, P.Nome, D.Nome, F.COD_Disc from Pessoa P, Frequenta F, Conta C, Disciplina D  
where D.COD = F.COD_Disc and P.CPF = C.CPF_Pes and F.Email_Conta = C.Email order by P.Nome, D.Nome;

select P.CPF, P.Nome, D.Nome, F.COD_Disc from Pessoa P, Frequenta F, Conta C, Disciplina D  
where D.COD = F.COD_Disc and P.CPF = C.CPF_Pes and F.Email_Conta = C.Email and ('Hannah Campbell') in P.Nome order by D.Nome;

select Nome, Nacionalidade, CPF from Pessoa where ('Brasileiro(a)') not in Nacionalidade order by Nome;

select Nome, Nacionalidade, CPF from Pessoa where ('Brasileiro(a)') in Nacionalidade order by Nome;

select Nome, CPF, Data_de_nascimento from Pessoa where Data_de_nascimento like ('%1998') order by Nome;

select C.Instituicao_de_ensino, P.Nome, P.CPF, S.Titulo from Pessoa P, Conta C, Professor S  
where S.Titulo = 'Doutor(a)' and P.CPF = C.CPF_Pes and S.Email_Conta = C.Email order by C.Instituicao_de_ensino, P.Nome;

select C.Instituicao_de_ensino, P.Nome, P.CPF, S.Titulo from Pessoa P, Conta C, Professor S  
where S.Titulo = 'Mestre' and P.CPF = C.CPF_Pes and S.Email_Conta = C.Email order by C.Instituicao_de_ensino, P.Nome;

select C.Instituicao_de_ensino, P.Nome, P.CPF, S.Ano_fim_contrato from Pessoa P, Conta C, Professor S  
where S.Ano_fim_contrato = '2022' and P.CPF = C.CPF_Pes and S.Email_Conta = C.Email order by C.Instituicao_de_ensino, P.Nome;

select C.Instituicao_de_ensino, P.Nome, P.CPF, S.Ano_inicio_contrato from Pessoa P, Conta C, Professor S  
where S.Ano_inicio_contrato = '2018' and P.CPF = C.CPF_Pes and S.Email_Conta = C.Email order by C.Instituicao_de_ensino, P.Nome;

select * from Pessoa where Sexo = 'F' order by Nome;

select C.Instituicao_de_ensino, D.Nome, D.COD, P.Nome, P.CPF from Pessoa P, Conta C, Disciplina D  
where P.CPF = C.CPF_Pes and Instituicao_de_ensino = 'UFPE' and D.Email_Conta = C.Email order by D.Nome, P.Nome;

select C.Instituicao_de_ensino, D.Nome, D.COD, P.Nome, P.CPF from Pessoa P, Conta C, Disciplina D  
where P.CPF = C.CPF_Pes and Instituicao_de_ensino = 'UFRPE' and D.Email_Conta = C.Email order by D.Nome, P.Nome;

select Dia_semana, Hora, COD_Disc from Horarios where COD_Disc like ('%F') and COD_Disc like ('%1%') and Dia_Semana = 'Segunda' order by Hora;

select Dia_semana, Hora, COD_Disc from Horarios where COD_Disc like ('%F') and COD_Disc like ('%1%') and Dia_Semana = 'Quarta' order by Hora;

select Dia_semana, Hora, COD_Disc from Horarios where COD_Disc like ('%F') and COD_Disc like ('%1%') and Dia_Semana = 'Sexta' order by Hora;

select Descricao,Data_,COD_Disc from Prazos where Data_ = CURRENT_DATE and COD_Disc = 'PROG1F';

select Descricao,Data_,COD_Disc from Prazos where COD_Disc = 'GEAN23R';

select C.Instituicao_de_ensino, D.Nome, F.COD_Disc,F.NotaFinal, P.Nome from Pessoa P, Frequenta F, Conta C, Disciplina D  
where P.CPF = C.CPF_Pes and Instituicao_de_ensino = 'UFPE' and F.Email_Conta = C.Email and F.COD_Disc = D.COD and NotaFinal < 05.00 and F.NotaFinal is not null order by D.Nome, P.Nome;

