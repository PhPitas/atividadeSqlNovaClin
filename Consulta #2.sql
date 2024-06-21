SHOW TABLES
SELECT * FROM
 
CREATE TABLE recepcionista(
idRecepcionista INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nomeRecepcionista VARCHAR(50) NOT NULL,
loginRecepcionsita VARCHAR(20) NOT NULL,
senha CHAR(6) NOT NULL,
celular CHAR(11)  NULL,
cpf CHAR(11) NOT NULL
);

CREATE TABLE paciente(
idPaciente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
cel CHAR(11) NOT NULL,
dataNascimento DATETIME NOT NULL,
email VARCHAR(50) NULL,
logradouro VARCHAR (30) NOT NULL,
numero VARCHAR(6) NOT NULL,
complemento VARCHAR(10) NULL,
cidade VARCHAR(20) NOT NULL,
cep CHAR(8) NULL,
observações VARCHAR(100)
);
 
CREATE TABLE especialidade(
idEspecialidade INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nomeEspecialidade VARCHAR(30) NOT NULL
);
 
 
CREATE TABLE medico(
idMedico INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
IdEspecialidade INT NOT NULL,
nome VARCHAR(50) NOT NULL,
crm CHAR(8) NOT NULL,
login VARCHAR(20) NOT NULL,
senha CHAR(6) NOT NULL,
CONSTRAINT Fk_MedicoEspecialidade FOREIGN KEY(idEspecialidade)
REFERENCES especialidade(idEspecialidade)
);
 
CREATE TABLE consulta(
idConsulta INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
idPaciente INT NOT NULL,
idRecepcionista INT NOT NULL,
idMedico INT NOT NULL,
dataHoraConsulta DATETIME NOT NULL,
sintomas VARCHAR(200) NULL,
prescricao VARCHAR(200) NULL,
CONSTRAINT Fk_ConsultaPaciente FOREIGN KEY(idPaciente)
REFERENCES paciente(idPaciente),
CONSTRAINT Fk_ConsultaRecepcionista FOREIGN KEY(idRecepcionista)
REFERENCES recepcionista(idRecepcionista),
CONSTRAINT Fk_ConsultaMedico FOREIGN KEY(idMedico)
REFERENCES medico(idMedico)
);
 
CREATE TABLE exame(
idExame INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
idConsulta INT NOT NULL,
dataHoraExame DATETIME NOT NULL,
nomeExame VARCHAR(30) NOT NULL,
statusExame VARCHAR(10) NOT NULL,
resultado VARCHAR(200) NULL,
dataRetiradaExane DATETIME NULL,
dataPrevisaoEntrega DATETIME NULL,
CONSTRAINT Fk_exameconsulta FOREIGN KEY(idConsulta)
REFERENCES consulta(idConsulta)
);
ALTER TABLE paciente 
ADD estado CHAR(2);
ALTER TABLE paciente 
MODIFY COLUMN estado CHAR(2) NOT NULL;
SELECT * FROM recepcionista
SELECT * FROM paciente
/*1.Inserir de forma implícita 8 pacientes*/
INSERT INTO paciente 
VALUES (10,'Donald','12345678901','11234456789','1604-04-21 12:16','donaldGames@gmail.com','Rua GamesBrazil','20','Apto','Santos','11000245','ta meio triste','SP'),
(11,'Margarida','19876543211','22134567890','1902-01-11 12:56','MargaridaGames@gmail.com','Avenida Seu Jorge','21','Casa','São Vicente','54367890','esse caba e bisonho','SP'),
(12,'Patinhas','11847356472','12345678593','1753-06-11 21:15','patinhasfofas@gmail.com','Rua Roogerio Cavalcante','14','Apto','Santos','12345678','ela ta bem da fofa','SP'),
(13,'Huginho','21847850472','12242672593','1207-04-30 19:36','huginhograndinho@gmail.com','Rua Rubbens','9','Casa','Cubatão','33345678','que cara grandinho','SP'),
(14,'Luizinho','65847353472','56748678593','2059-01-01 07:26','luizojogos@gmail.com','Rua Guerreirinho','12','Apto','Praia Grande','12349978','ele tentou me vender jogos:]','SP'),
(15,'Zezinho','11847358879','31245678593','1456-04-21 11:37','zezinhodaspingas@gmail.com','Rua ZoioPegadas','11','Casa','São João del Rei','55445678','ele ta querendo beber ate morrer','MG'),
(16,'Mickey','88897356472','12345678987','1964-06-11 02:57','mickeymouse@gmail.com','Rua Bluezao','84','Casa','Rio de Janeiro','12995078','o mikey mora na rua do bluzao','RJ'),
(17,'Minie','11843316452','11145678541','1964-06-11 02:57','minieshield@gmail.com','Rua','24','Casa','São Paulo','98085678','a minie ta usando minie em x1 noob','SP');

/*2.Inserir de forma explícita 3 recepcionistas*/

INSERT INTO recepcionista 
VALUES (1,'Chico Bento','chicobento.senaclin','chicobentonoshopping','11334422556','33447788995'), 
(2,'Franjinha','franjinha.senaclin','franjaslindas','22114422556','12345688995'),
(3,'Cebolinha','cebolinha.senaclin','cebolasgames','55534452556','33444444444');

/*3.Inserir de forma explícita 5 especialidades*/

INSERT INTO especialidade (nomeEspecialidade)
VALUES 
('Cardiologista'),
('Otorrinolaringologista'),
('Clínico Geral'),
('Gastroenterologista'),
('Ortopedista');

/*4.Inserir de forma implícita 5 médicos*/

INSERT INTO medico (IdEspecialidade, nome, crm, login, senha)
VALUES 
(1, 'Pardal', '765544SP', 'pardal_med.senaclin', '654321'),
(5, 'Mônica', '768880SP', 'monica_med.senaclin', '444456'),
(3, 'Zé Carioca', '165544RJ', 'zeca_med.senaclin', '225656'),
(4, 'Magali', '265544SP', 'magali_med.senaclin', '123777'),
(2, 'Horácio', '365544MG', 'horacio_med.senaclin', '123886');

/*5.Inserir de forma explícita uma consulta para cada médico Dados conforme abaixo, demais dados livres. Atenção para colocar datas de consultas posteriores a data de hoje.*/
INSERT INTO consulta (idPaciente, idRecepcionista, idMedico, dataHoraConsulta, sintomas, prescricao)
VALUES 
(1, 1, 1, '2024-06-25 10:00', 'Febre', 'Repouso'),
(2, 1, 2, '2024-06-26 11:00', 'Dor no joelho', 'Anti-inflamatório'),
(3, 1, 3, '2024-06-27 12:23', 'Dor abdominal', 'Exames'),
(7, 2, 4, '2024-06-28 13:35', 'Dor de estômago', 'Dieta'),
(8, 2, 5, '2024-06-29 14:45', 'Dor de ouvido', 'Medicação');

/*6.Inserir mais duas consultas ao Patinhas Dados conforme abaixo, demais dados livres. Atenção para colocar datas de consultas posteriores a data de hoje.*/

INSERT INTO consulta (idPaciente, idRecepcionista, idMedico, dataHoraConsulta, sintomas, prescricao)
VALUES 
(4, 1, 1, '2024-08-25 12:30:00', 'Morrendo do coracon', 'Eletrocardiograma'),
(4, 1, 5, '2024-07-21 11:30:00', 'Cancer', 'Raio-X coluna');

/*7.Inserir um exame para cada consulta do Patinhas criada no item anterior (6)*/
INSERT INTO exame (idConsulta, dataHoraExame, nomeExame, statusExame)
VALUES 
(3, '2024-08-25 12:30:00', 'Eletrocardiograma', 'Pendente'),
(5, '2024-07-21 11:30:00', 'Raio-X Coluna', 'Pendente');

/*8.Remarcar (Atualizar) a consulta do Donald para a mesma data porém, 2hs mais tarde.*/
UPDATE consulta
SET dataHoraConsulta = DATE_ADD(dataHoraConsulta, INTERVAL 2 HOUR)
WHERE idConsulta = 1;

/*9.A Minie mudou de endereço mas não mudou de cidade (logradouro, numero e
complemento). Realize a alteração dos dados.*/
UPDATE paciente
SET logradouro = 'rua aleatoria', numero = '5', complemento = 'apto'
WHERE nome = 'Minie';

/*10.O Mickey mudou o celular, realize a alteração.*/
UPDATE paciente
SET cel = '12665678987'
WHERE nome = 'Mickey';

/*11.O Patinhas não poderá comparecer na consulta com o Ze Carioca. Realize a exclusão da
mesma no sistema. Foi possível? Justifique.*/
DELETE FROM consulta
WHERE idPaciente = 3 AND idMedico = 3;
/*Esta operação pode falhar devido a uma restrição de chave estrangeira. A consulta do Patinhas com Zé Carioca pode estar referenciada em outras tabelas (por exemplo, na tabela exame através da chave estrangeira idConsulta). Antes de excluir, seria necessário remover as dependências nesses registros relacionados*/

/*12.Realize a exclusão da Dr Mônica da tabela Medico. Foi possível? Justifique.*/
DELETE FROM medico
WHERE nome = 'Mônica';
/*Não é possível excluir a médica Mônica diretamente devido a restrições de chave estrangeira. Ela pode estar associada a consultas na tabela consulta ou a exames na tabela exame. Para excluir, primeiro seria necessário remover todas as dependências relacionadas a ela nessas tabelas.*/

/*13.Exibir a data de todas as consultas em ordem cronológica, da que está mais próxima para a
que está mais longe.*/
SELECT dataHoraConsulta
FROM consulta
ORDER BY dataHoraConsulta;

/*14.Exibir todos os dados da tabela médico.*/
SELECT * FROM medico;

/*15.Exibir apenas as cidades em que a clínica possui pacientes, em ordem alfabética.*/
SELECT DISTINCT cidade
FROM paciente
ORDER BY cidade;

/*16.Exibir nome, celular e e-mail de todos os pacientes da clínica, em ordem alfabética.*/
SELECT nome, cel, email
FROM paciente
ORDER BY nome;

/*17.Atualizar apenas o CRM do Dr.Pardal que foi cadastrado errado no sistema.*/
UPDATE medico
SET crm = '765544SP'
WHERE nome = 'Pardal';

/*18.Resetar a senha de todos os médicos do sistema para o padrão "DOCTOR".*/
UPDATE medico
SET senha = 'DOCTOR';

/*19.Exibir apenas o nome do médico e seu CRM, dos médicos registrados em SP, tudo isto em
ordem alfabética.*/
SELECT nome, crm
FROM medico
WHERE crm LIKE '%SP%'
ORDER BY nome;

/*20.Exibir nome e celular de todos os pacientes que vivem em Santos e possuem nome
iniciando com a letra P.*/
SELECT nome, cel
FROM paciente
WHERE cidade = 'Santos' AND nome LIKE 'P%'
ORDER BY nome;

/*desafio. Exibir o nome, logradouro, numero e cidade de todos os pacientes que moram em
casa, em ordem alfabética.*/
SELECT nome, logradouro, numero, cidade
FROM paciente
WHERE logradouro LIKE '%casa%'
ORDER BY nome;