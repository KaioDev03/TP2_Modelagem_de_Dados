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
