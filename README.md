TP3: Implementação e Manipulação de Banco de Dados com SQL

Fala, meus queridos. Parabéns a todos que chegaram ao TP3! Assim como no mundo real, cada um de vocês modelou e criou as tabelas conforme os requisitos levantados nos TPs anteriores. Porém, nem tudo são flores: o cliente acabou de lembrar que precisa adicionar mais uma tabela ao sistema que vocês estão desenvolvendo. A ideia deste TP é que vocês pensem em mais uma tabela que possa fazer parte do escopo do sistema que estão modelando.

🔴Sinal Vermelho: Todas as partes deste trabalho devem ser da autoria do aluno. Qualquer uso de ferramentas generativas de IA, como ChatGPT, é proibido. O uso de IA generativa será considerado má conduta acadêmica e estará sujeito à aplicação do código disciplinar, pois as tarefas deste trabalho foram elaboradas para desafiar o aluno a desenvolver conhecimentos de base, pensamento crítico e habilidades de resolução de problemas. O uso da tecnologia de IA limitaria sua capacidade de desenvolver essas competências e de atingir os objetivos de aprendizagem desta disciplina.

Lista de exercícios:
Crie tabelas e objetos em um banco de dados utilizando SQL. 
Implemente a nova tabela no banco de dados do seu negócio escolhido.
Verifique se essa tabela tem algum relacionamento com outra tabela, ou se não é necessário. 
Identifique as potenciais chaves candidatas e escolha uma para ser a chave primária, ou criar uma chave primária artificial para a tabela.
Inclua quaisquer restrições necessárias (NOT NULL, UNIQUE, etc.).
Exemplo:
CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY,

    nome VARCHAR(100) NOT NULL,

    email VARCHAR(100) UNIQUE NOT NULL,

    telefone VARCHAR(20),

    endereco VARCHAR(200)

);

Faça queries que modifiquem tabelas, colunas e dados. Considere os subitens abaixo:
Insira dados: utilize INSERT INTO para adicionar novos registros.
Insira dados reais em todas as suas tabelas (no mínimo 5 em cada tabela).
Use ALTER TABLE para adicionar ou remover colunas, ou alterar propriedades das colunas existentes.
Altere pelo menos dois nomes de atributos das suas tabelas.
Altere o tipo de pelo menos um campo.
Atualize dados: use UPDATE para modificar registros existentes e atualize, no mínimo, 3 dados de sua tabela.
Exclua dados: utilize DELETE para remover registros específicos e remova pelo menos 2 dados de cada tabela (pelo id). Use o comando DELETE com cláusulas WHERE para remover registros que atendam a determinadas condições.
Use o comando DROP TABLE para remover uma tabela. Tenha cuidado ao usar este comando, pois ele não pode ser desfeito e todos os dados serão perdidos.
Exemplos:
ALTER TABLE Clientes ADD COLUMN data_nascimento DATE;

INSERT INTO Clientes (cliente_id, nome, email) VALUES (1, 'João Silva', 'joao@example.com');

UPDATE Clientes SET telefone = '9999-8888' WHERE cliente_id = 1;

DELETE FROM Clientes WHERE cliente_id = 2;

DELETE FROM Pedidos WHERE data_pedido < '2023-01-01';

DROP TABLE UsuariosInativos;

Reflita sobre o Processo de Implementação:
Descreva os desafios enfrentados, como:
Conflitos de chave estrangeira ao excluir registros.
Dificuldades ao alterar tipos de dados.
Problemas de desempenho ao manipular grandes volumes de dados.
Explique detalhadamente como superou esses desafios e o que aprendeu com eles.
Com suas próprias palavras, explique as diferenças entre Comandos solicitados abaixo:
Diferença entre DELETE e DROP TABLE
Diferença entre ALTER TABLE e UPDATE
