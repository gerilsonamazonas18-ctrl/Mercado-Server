PRAGMA foreign_keys = ON;

CREATE TABLE cargos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    descricao TEXT
);

CREATE TABLE usuarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL UNIQUE,
    senha_hash TEXT NOT NULL,
    cargo_id INTEGER,
    ativo INTEGER DEFAULT 1,
    criado_em TEXT DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (cargo_id)
    REFERENCES cargos(id)
);

CREATE TABLE funcionarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    cpf TEXT UNIQUE,
    telefone TEXT,
    endereco TEXT,
    usuario_id INTEGER,

    FOREIGN KEY (usuario_id)
    REFERENCES usuarios(id)
);

CREATE TABLE clientes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    cpf TEXT UNIQUE,
    telefone TEXT,
    endereco TEXT,
    email TEXT
);

CREATE TABLE fornecedores (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    razao_social TEXT NOT NULL,
    cnpj TEXT UNIQUE,
    telefone TEXT,
    endereco TEXT,
    email TEXT
);

CREATE TABLE categorias (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    descricao TEXT
);

CREATE TABLE produtos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    codigo_barras TEXT UNIQUE,
    categoria_id INTEGER,
    fornecedor_id INTEGER,
    preco_custo REAL NOT NULL,
    preco_venda REAL NOT NULL,
    unidade TEXT NOT NULL,
    ativo INTEGER DEFAULT 1,
    criado_em TEXT DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (categoria_id)
    REFERENCES categorias(id),

    FOREIGN KEY (fornecedor_id)
    REFERENCES fornecedores(id)
);

CREATE TABLE estoque (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    produto_id INTEGER,
    quantidade REAL NOT NULL,
    estoque_minimo REAL DEFAULT 0,
    ultima_atualizacao TEXT DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (produto_id)
    REFERENCES produtos(id)
);

CREATE TABLE movimentacoes_estoque (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    produto_id INTEGER,
    tipo TEXT NOT NULL,
    quantidade REAL NOT NULL,
    motivo TEXT,
    usuario_id INTEGER,
    criado_em TEXT DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (produto_id)
    REFERENCES produtos(id),

    FOREIGN KEY (usuario_id)
    REFERENCES usuarios(id)
);

CREATE TABLE vendas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cliente_id INTEGER,
    funcionario_id INTEGER,
    valor_total REAL NOT NULL,
    desconto REAL DEFAULT 0,
    status TEXT DEFAULT 'ABERTA',
    data_venda TEXT DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (cliente_id)
    REFERENCES clientes(id),

    FOREIGN KEY (funcionario_id)
    REFERENCES funcionarios(id)
);

CREATE TABLE itens_venda (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    venda_id INTEGER,
    produto_id INTEGER,
    quantidade REAL NOT NULL,
    preco_unitario REAL NOT NULL,
    subtotal REAL NOT NULL,

    FOREIGN KEY (venda_id)
    REFERENCES vendas(id),

    FOREIGN KEY (produto_id)
    REFERENCES produtos(id)
);

CREATE TABLE pagamentos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    venda_id INTEGER,
    metodo TEXT NOT NULL,
    valor REAL NOT NULL,
    status TEXT DEFAULT 'PENDENTE',
    data_pagamento TEXT DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (venda_id)
    REFERENCES vendas(id)
);

CREATE TABLE notas_fiscais (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    venda_id INTEGER,
    numero_nf TEXT UNIQUE,
    chave_acesso TEXT UNIQUE,
    status TEXT DEFAULT 'PENDENTE',
    xml_path TEXT,
    emitida_em TEXT,

    FOREIGN KEY (venda_id)
    REFERENCES vendas(id)
);

CREATE TABLE comprovantes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    venda_id INTEGER,
    caminho_pdf TEXT NOT NULL,
    emitido_em TEXT DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (venda_id)
    REFERENCES vendas(id)
);

CREATE TABLE relatorios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    tipo TEXT NOT NULL,
    caminho_arquivo TEXT NOT NULL,
    gerado_por INTEGER,
    criado_em TEXT DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (gerado_por)
    REFERENCES usuarios(id)
);
