-- Gerado por Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   em:        2023-03-06 15:34:11 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE rlc_log (
    tb_produto_cd_produto     NUMBER NOT NULL,
    tb_logistica_cd_logistica NUMBER NOT NULL,
    tb_logistica_cd_clientes  NUMBER NOT NULL
);

ALTER TABLE rlc_log
    ADD CONSTRAINT rlc_log_pk PRIMARY KEY ( tb_produto_cd_produto,
                                            tb_logistica_cd_logistica,
                                            tb_logistica_cd_clientes );

CREATE TABLE tb_cliente (
    cd_clientes NUMBER NOT NULL,
    nm_nome     VARCHAR2(50) NOT NULL,
    dt_nasc     DATE NOT NULL,
    dt_atualiz  DATE NOT NULL
);

ALTER TABLE tb_cliente ADD CONSTRAINT tb_cliente_pk PRIMARY KEY ( cd_clientes );

CREATE TABLE tb_fornecedor (
    cd_fornecedor NUMBER NOT NULL,
    nm_nome       VARCHAR2(50) NOT NULL,
    ds_ender      VARCHAR2(50) NOT NULL,
    nr_tel        VARCHAR2(50) NOT NULL,
    ds_email      VARCHAR2(50) NOT NULL,
    dt_cad        DATE NOT NULL,
    dt_modif      DATE NOT NULL
);

ALTER TABLE tb_fornecedor ADD CONSTRAINT tb_fornecedor_pk PRIMARY KEY ( cd_fornecedor );

CREATE TABLE tb_logistica (
    cd_logistica           NUMBER NOT NULL,
    nm_endereco            VARCHAR2(50) NOT NULL,
    nm_transp              VARCHAR2(50) NOT NULL,
    dt_entrega             DATE NOT NULL,
    dt_despacho            DATE NOT NULL,
    tb_cliente_cd_clientes NUMBER NOT NULL
);

ALTER TABLE tb_logistica ADD CONSTRAINT tb_logistica_pk PRIMARY KEY ( cd_logistica,
                                                                      tb_cliente_cd_clientes );

CREATE TABLE tb_produto (
    cd_produto                  NUMBER NOT NULL,
    nm_produto                  VARCHAR2(100) NOT NULL,
    vl_preco                    NUMBER NOT NULL,
    dt_validade                 DATE NOT NULL,
    dt_cad                      DATE NOT NULL,
    dt_modif                    DATE NOT NULL,
    tb_cliente_cd_clientes      NUMBER NOT NULL,
    tb_fornecedor_cd_fornecedor NUMBER NOT NULL
);

ALTER TABLE tb_produto ADD CONSTRAINT tb_produto_pk PRIMARY KEY ( cd_produto );

ALTER TABLE rlc_log
    ADD CONSTRAINT rlc_log_tb_logistica_fk FOREIGN KEY ( tb_logistica_cd_logistica,
                                                         tb_logistica_cd_clientes )
        REFERENCES tb_logistica ( cd_logistica,
                                  tb_cliente_cd_clientes );

ALTER TABLE rlc_log
    ADD CONSTRAINT rlc_log_tb_produto_fk FOREIGN KEY ( tb_produto_cd_produto )
        REFERENCES tb_produto ( cd_produto );

ALTER TABLE tb_logistica
    ADD CONSTRAINT tb_logistica_tb_cliente_fk FOREIGN KEY ( tb_cliente_cd_clientes )
        REFERENCES tb_cliente ( cd_clientes );

ALTER TABLE tb_produto
    ADD CONSTRAINT tb_produto_tb_cliente_fk FOREIGN KEY ( tb_cliente_cd_clientes )
        REFERENCES tb_cliente ( cd_clientes );

ALTER TABLE tb_produto
    ADD CONSTRAINT tb_produto_tb_fornecedor_fk FOREIGN KEY ( tb_fornecedor_cd_fornecedor )
        REFERENCES tb_fornecedor ( cd_fornecedor );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                             10
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
