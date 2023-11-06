CREATE TABLE Cliente (
    id_cliente INTEGER PRIMARY KEY
);

CREATE TABLE Conta (
    id_conta INTEGER PRIMARY KEY,
    fk_cliente INTEGER
);

CREATE TABLE Imovel_Seguro (
    id_imovel INTEGER,
    id_seguro INTEGER,
    fk_sinistro INTEGER,
    fk_conta INTEGER,
    tipo_imovel VARCHAR,
    valor_imovel DECIMAL,
    logradouro VARCHAR,
    bairro VARCHAR,
    cidade VARCHAR,
    uf VARCHAR,
    cep VARCHAR,
    descricao_seguro VARCHAR,
    PRIMARY KEY (id_imovel, id_seguro)
);

CREATE TABLE Servico (
    id_servico INTEGER PRIMARY KEY,
    descricao_servico VARCHAR
);

CREATE TABLE Cobertura (
    id_cobertura INTEGER PRIMARY KEY,
    descricao_cobertura VARCHAR
);

CREATE TABLE Sinistro (
    id_sinistro INTEGER PRIMARY KEY,
    fk_seguro INTEGER,
    data_abertura DATE,
    assistencia_acionada VARCHAR,
    valor_indenizacao DECIMAL,
    data_finalizacao DATE
);

CREATE TABLE Sinistro_Cobertura (
    fk_sinistro INTEGER,
    fk_cobertura INTEGER
);

CREATE TABLE Sinistro_Servico (
    fk_sinistro INTEGER,
    fk_servico INTEGER
);

CREATE TABLE Parcelas (
    id_parcelas INTEGER PRIMARY KEY,
    numero_parcelas INTEGER,
    valor_total_contratado DECIMAL
);

CREATE TABLE Pagamento_Parcela (
    id_pagamento INTEGER PRIMARY KEY,
    fk_parcela INTEGER,
    fk_conta INTEGER,
    valor_pago DECIMAL,
    data_vencimento DATE,
    data_pagamento DATE
);

CREATE TABLE Cliente_Imovel (
    fk_imovel INTEGER,
    fk_cliente INTEGER
);

CREATE TABLE Parcelas_Seguro_Imovel (
    fk_parcelas INTEGER,
    fk_imovel INTEGER,
    fk_seguro INTEGER
);
 
ALTER TABLE Conta ADD CONSTRAINT FK_Conta_2
    FOREIGN KEY (fk_cliente)
    REFERENCES Cliente (id_cliente)
    ON DELETE CASCADE;
 
ALTER TABLE Imovel_Seguro ADD CONSTRAINT FK_Imovel_Seguro_2
    FOREIGN KEY (fk_sinistro)
    REFERENCES Sinistro (id_sinistro)
    ON DELETE CASCADE;
 
ALTER TABLE Imovel_Seguro ADD CONSTRAINT FK_Imovel_Seguro_3
    FOREIGN KEY (fk_conta)
    REFERENCES Conta (id_conta)
    ON DELETE CASCADE;
 
ALTER TABLE Sinistro ADD CONSTRAINT FK_Sinistro_2
    FOREIGN KEY (fk_seguro)
    REFERENCES Imovel_Seguro (id_seguro);
 
ALTER TABLE Sinistro_Cobertura ADD CONSTRAINT FK_Sinistro_Cobertura_1
    FOREIGN KEY (fk_sinistro)
    REFERENCES Sinistro (id_sinistro);
 
ALTER TABLE Sinistro_Cobertura ADD CONSTRAINT FK_Sinistro_Cobertura_2
    FOREIGN KEY (fk_cobertura)
    REFERENCES Cobertura (id_cobertura);
 
ALTER TABLE Sinistro_Servico ADD CONSTRAINT FK_Sinistro_Servico_1
    FOREIGN KEY (fk_sinistro)
    REFERENCES Sinistro (id_sinistro);
 
ALTER TABLE Sinistro_Servico ADD CONSTRAINT FK_Sinistro_Servico_2
    FOREIGN KEY (fk_servico)
    REFERENCES Servico (id_servico);
 
ALTER TABLE Pagamento_Parcela ADD CONSTRAINT FK_Pagamento_Parcela_2
    FOREIGN KEY (fk_Conta_id_conta???, fk_parcela)
    REFERENCES Parcelas (???, id_parcelas);
 
ALTER TABLE Pagamento_Parcela ADD CONSTRAINT FK_Pagamento_Parcela_3
    FOREIGN KEY (fk_Parcelas_id_parcelas???, fk_conta)
    REFERENCES Conta (???, id_conta);
 
ALTER TABLE Cliente_Imovel ADD CONSTRAINT FK_Cliente_Imovel_1
    FOREIGN KEY (fk_imovel)
    REFERENCES Imovel_Seguro (id_imovel)
    ON DELETE SET NULL;
 
ALTER TABLE Cliente_Imovel ADD CONSTRAINT FK_Cliente_Imovel_2
    FOREIGN KEY (fk_cliente)
    REFERENCES Cliente (id_cliente)
    ON DELETE SET NULL;
 
ALTER TABLE Parcelas_Seguro_Imovel ADD CONSTRAINT FK_Parcelas_Seguro_Imovel_1
    FOREIGN KEY (fk_parcelas)
    REFERENCES Parcelas (id_parcelas)
    ON DELETE RESTRICT;
 
ALTER TABLE Parcelas_Seguro_Imovel ADD CONSTRAINT FK_Parcelas_Seguro_Imovel_2
    FOREIGN KEY (fk_imovel, fk_seguro)
    REFERENCES Imovel_Seguro (id_imovel, id_seguro)
    ON DELETE RESTRICT;