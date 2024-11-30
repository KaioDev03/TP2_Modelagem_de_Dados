CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    endereco TEXT,
    data_de_cadastro DATE NOT NULL
);

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    nome_produto VARCHAR(255) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL CHECK (preco > 0),
    estoque INT NOT NULL CHECK (estoque >= 0)
);

CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE NOT NULL,
    status_pedido VARCHAR(20) NOT NULL CHECK (status_pedido IN ('Pendente', 'Transição', 'Entregue')),
    valor_total DECIMAL(10, 2) NOT NULL CHECK (valor_total > 0),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE CASCADE
);

CREATE TABLE itens_pedido (
    id_item_pedido INT PRIMARY KEY,
    id_pedido INT,
    id_produto INT,
    quantidade INT NOT NULL CHECK (quantidade > 0),
    preco_unitario DECIMAL(10, 2) NOT NULL CHECK (preco_unitario > 0),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido) ON DELETE CASCADE,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto) ON DELETE CASCADE
);

CREATE TABLE pagamentos (
    id_pagamento INT PRIMARY KEY,
    id_pedido INT,
    metodo_pagamento VARCHAR(20) NOT NULL CHECK (metodo_pagamento IN ('Cartão de Crédito', 'Boleto', 'Pix', 'Transferência')),
    status_pagamento VARCHAR(20) NOT NULL CHECK (status_pagamento IN ('Pendente', 'Confirmado', 'Cancelado')),
    data_pagamento DATE,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido) ON DELETE CASCADE
);

CREATE TABLE categorias_produtos (
    id_categoria INT PRIMARY KEY,
    nome_categoria VARCHAR(255) NOT NULL
);

CREATE TABLE enderecos (
    id_endereco INT PRIMARY KEY,
    id_cliente INT,
    endereco_completo TEXT NOT NULL,
    tipo_endereco VARCHAR(20) NOT NULL CHECK (tipo_endereco IN ('Residencial', 'Comercial')),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE CASCADE
);

CREATE TABLE estoque (
    id_estoque INT PRIMARY KEY,
    id_produto INT,
    quantidade INT NOT NULL CHECK (quantidade >= 0),
    data_atualizacao DATE NOT NULL,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto) ON DELETE CASCADE,
    FOREIGN KEY (id_armazem) REFERENCES armazens(id_armazem) ON DELETE CASCADE
);

'''Faça queries que modifiquem tabelas, colunas e dados. Considere os subitens abaixo:
Insira dados: utilize INSERT INTO para adicionar novos registros.
Insira dados reais em todas as suas tabelas (no mínimo 5 em cada tabela).'''

INSERT INTO clientes (id_cliente, nome, email, telefone, endereco, data_de_cadastro)
VALUES
(1, 'Ana Silva', 'ana.silva@email.com', '1111-1111', 'Rua A, 123', '2024-01-15'),
(2, 'Carlos Oliveira', 'carlos.oliveira@email.com', '2222-2222', 'Rua B, 456', '2024-02-20'),
(3, 'Maria Souza', 'maria.souza@email.com', '3333-3333', 'Rua C, 789', '2024-03-30'),
(4, 'João Pereira', 'joao.pereira@email.com', '4444-4444', 'Rua D, 101', '2024-04-10'),
(5, 'Julia Costa', 'julia.costa@email.com', '5555-5555', 'Rua E, 202', '2024-05-25');

INSERT INTO produtos (id_produto, nome_produto, descricao, preco, estoque)
VALUES
(1, 'Câmera de Segurança', 'Câmera Full HD com visão noturna', 300.00, 100),
(2, 'Alarme Residencial', 'Alarme com sensor de movimento', 150.00, 200),
(3, 'Fechadura Eletrônica', 'Fechadura inteligente com senha', 400.00, 50),
(4, 'Detector de Fumaça', 'Detector de fumaça para ambientes internos', 100.00, 300),
(5, 'Interfone', 'Interfone com vídeo integrado', 250.00, 150);

INSERT INTO estoques (id_estoque, id_produto, quantidade, data_atualizacao)
VALUES
(1, 1, 100, '2024-11-27'),
(2, 2, 200, '2024-11-27'),
(3, 3, 50, '2024-11-27'),
(4, 4, 300, '2024-11-27'),
(5, 5, 150, '2024-11-27');

INSERT INTO pedidos (id_pedido, id_cliente, data_pedido, status_pedido, valor_total)
VALUES
(1, 1, '2024-11-01', 'Entregue', 600.00),
(2, 2, '2024-11-10', 'Entregue', 750.00),
(3, 3, '2024-11-15', 'Transição', 400.00),
(4, 4, '2024-11-20', 'Pendente', 300.00),
(5, 5, '2024-11-25', 'Pendente', 150.00);

INSERT INTO itens_pedido (id_item_pedido, id_pedido, id_produto, quantidade, preco_unitario)
VALUES
(1, 1, 1, 2, 300.00),
(2, 1, 2, 1, 150.00),
(3, 2, 3, 2, 400.00),
(4, 2, 4, 3, 100.00),
(5, 3, 1, 1, 300.00),
(6, 4, 5, 1, 250.00),
(7, 5, 4, 1, 100.00);

INSERT INTO pagamentos (id_pagamento, id_pedido, metodo_pagamento, status_pagamento, data_pagamento)
VALUES
(1, 1, 'Cartão de Crédito', 'Confirmado', '2024-11-02'),
(2, 2, 'Pix', 'Confirmado', '2024-11-11'),
(3, 3, 'Boleto', 'Pendente', NULL),
(4, 4, 'Transferência', 'Pendente', NULL),
(5, 5, 'Cartão de Crédito', 'Pendente', NULL);

INSERT INTO categorias_produtos (id_categoria, nome_categoria)
VALUES
(1, 'Segurança Residencial'),
(2, 'Monitoramento'),
(3, 'Acessórios de Segurança'),
(4, 'Controle de Acesso'),
(5, 'Sistemas de Alarme');

INSERT INTO enderecos (id_endereco, id_cliente, endereco_completo, tipo_endereco)
VALUES
(1, 1, 'Rua A, 123', 'Residencial'),
(2, 2, 'Rua B, 456', 'Residencial'),
(3, 3, 'Rua C, 789', 'Residencial'),
(4, 4, 'Rua D, 101', 'Comercial'),
(5, 5, 'Rua E, 202', 'Residencial');

'''Use ALTER TABLE para adicionar ou remover colunas, ou alterar propriedades das colunas existentes.'''

ALTER TABLE clientes
ADD COLUMN data_ultimo_pedido DATE;

ALTER TABLE produtos
ADD COLUMN sku VARCHAR(50) UNIQUE NOT NULL,
ADD COLUMN peso DECIMAL(5, 2) NOT NULL CHECK (peso > 0);

ALTER TABLE estoques
ADD COLUMN quantidade_minima INT NOT NULL DEFAULT 10 CHECK (quantidade_minima >= 0);

ALTER TABLE pedidos
ADD COLUMN data_entrega_prevista DATE;

ALTER TABLE itens_pedido
ADD COLUMN desconto DECIMAL(10, 2) NOT NULL DEFAULT 0 CHECK (desconto >= 0);

ALTER TABLE pagamentos
ADD COLUMN valor_pago DECIMAL(10, 2) NOT NULL DEFAULT 0 CHECK (valor_pago >= 0);

ALTER TABLE categorias_produtos
ADD COLUMN descricao_categoria TEXT;

ALTER TABLE enderecos
ADD COLUMN cep VARCHAR(10) NOT NULL;

'''Altere pelo menos dois nomes de atributos das suas tabelas.'''

ALTER TABLE clientes
RENAME COLUMN telefone TO numero_telefone,
RENAME COLUMN endereco TO endereco_residencial;

ALTER TABLE produtos
RENAME COLUMN descricao TO descricao_produto,
RENAME COLUMN estoque TO quantidade_estoque;

ALTER TABLE estoques
RENAME COLUMN quantidade TO quantidade_disponivel,
RENAME COLUMN id_produto TO produto_id;

ALTER TABLE pedidos
RENAME COLUMN id_cliente TO cliente_id,
RENAME COLUMN status_pedido TO situacao_pedido;

ALTER TABLE itens_pedido
RENAME COLUMN id_pedido TO pedido_id,
RENAME COLUMN preco_unitario TO valor_unitario;

ALTER TABLE pagamentos
RENAME COLUMN id_pedido TO pedido_id,
RENAME COLUMN metodo_pagamento TO forma_pagamento;

ALTER TABLE categorias_produtos
RENAME COLUMN nome_categoria TO titulo_categoria,
RENAME COLUMN descricao_categoria TO detalhes_categoria;

ALTER TABLE enderecos
RENAME COLUMN id_cliente TO cliente_id,
RENAME COLUMN endereco_completo TO logradouro_completo;

'''Altere o tipo de pelo menos um campo.'''

ALTER TABLE produtos
MODIFY COLUMN preco FLOAT;

'''Atualize dados: use UPDATE para modificar registros existentes e atualize, no mínimo, 3 dados de sua tabela.'''

UPDATE clientes
SET email = 'novoemail@exemplo.com'
WHERE id_cliente = 1;

UPDATE produtos
SET preco = 59.99
WHERE id_produto = 2;

UPDATE pedidos
SET situacao_pedido = 'Entregue'
WHERE id_pedido = 3;

'''Exclua dados: utilize DELETE para remover registros específicos e remova pelo menos 2 dados de cada tabela (pelo id). Use o comando DELETE com cláusulas WHERE para remover registros que atendam a determinadas condições.'''

DELETE FROM clientes
WHERE id_cliente IN (1, 3);

DELETE FROM produtos
WHERE id_produto IN (2, 4);

DELETE FROM estoques
WHERE id_estoque IN (1, 5);

DELETE FROM pedidos
WHERE id_pedido IN (2, 4);

DELETE FROM itens_pedido
WHERE id_item_pedido IN (3, 5);

DELETE FROM pagamentos
WHERE id_pagamento IN (1, 3);

DELETE FROM categorias_produtos
WHERE id_categoria IN (1, 2);

DELETE FROM enderecos
WHERE id_endereco IN (2, 3);

'''Use o comando DROP TABLE para remover uma tabela. Tenha cuidado ao usar este comando, pois ele não pode ser desfeito e todos os dados serão perdidos.'''

DROP TABLE estoques;
