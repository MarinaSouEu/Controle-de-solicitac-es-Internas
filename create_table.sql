CREATE TABLE Departamentos (
    id_departamento INT PRIMARY KEY,
    nome_departamento VARCHAR(50) NOT NULL
);

CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    perfil VARCHAR(20),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES Departamentos(id_departamento)
);

CREATE TABLE Solicitacoes (
    id_solicitacao INT PRIMARY KEY,
    titulo VARCHAR(100),
    descricao VARCHAR(255),
    data_abertura DATE,
    prazo DATE,
    status VARCHAR(30),
    id_solicitante INT,
    id_responsavel INT,
    id_departamento INT,
    FOREIGN KEY (id_solicitante) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_responsavel) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_departamento) REFERENCES Departamentos(id_departamento)
);

CREATE TABLE Historico_Status (
    id_historico INT PRIMARY KEY,
    id_solicitacao INT,
    status_anterior VARCHAR(30),
    status_novo VARCHAR(30),
    data_alteracao DATE,
    id_usuario INT,
    FOREIGN KEY (id_solicitacao) REFERENCES Solicitacoes(id_solicitacao),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

INSERT INTO Departamentos VALUES
(1, 'RH'),
(2, 'Financeiro'),
(3, 'TI'),
(4, 'Administrativo');

INSERT INTO Usuarios VALUES
(1, 'Ana Souza', 'ana@empresa.com', 'Solicitante', 1),
(2, 'Carlos Lima', 'carlos@empresa.com', 'Atendente', 3),
(3, 'Marina Costa', 'marina@empresa.com', 'Solicitante', 2),
(4, 'João Pereira', 'joao@empresa.com', 'Atendente', 4);

INSERT INTO Solicitacoes VALUES
(1, 'Acesso ao sistema', 'Solicitação de acesso ao sistema interno', '2025-01-10', '2025-01-15', 'Concluída', 1, 2, 3),
(2, 'Reembolso', 'Reembolso de despesas', '2025-01-12', '2025-01-20', 'Em andamento', 3, 4, 2),
(3, 'Compra de material', 'Compra de materiais de escritório', '2025-01-18', '2025-01-22', 'Aberta', 1, NULL, 4);
