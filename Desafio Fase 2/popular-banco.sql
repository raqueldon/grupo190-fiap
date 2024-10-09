-- a) Popular 3 departamentos

INSERT INTO mc_depto (nm_depto,st_depto)
    VALUES ('Comercial', 'A');
    
INSERT INTO mc_depto (nm_depto,st_depto)
    VALUES ('Financeiro', 'A');
    
INSERT INTO mc_depto (nm_depto,st_depto)
    VALUES ('Sac', 'A');
    
SELECT * FROM mc_depto;

-- b) Popular 3 funcionários

INSERT INTO mc_funcionario (cd_depto,nm_funcionario,dt_nascimento,
                            fl_sexo_biologico,ds_cargo,st_func,dt_cadastramento)
    VALUES ('2','Rafaela Dias Azevedo',
            TO_DATE ('01/11/1990'),'F','Analista','A',
            TO_DATE ('08/10/2024'));
            
INSERT INTO mc_funcionario (cd_depto,nm_funcionario,dt_nascimento,
                            fl_sexo_biologico,ds_cargo,st_func,dt_cadastramento)
    VALUES ('1','Giovana Sousa Ferreira',
            TO_DATE ('21/10/1994'),'F','Engenheira de Dados','A',
            TO_DATE ('08/10/2024'));
            
INSERT INTO mc_funcionario (cd_depto,nm_funcionario,dt_nascimento,
                            fl_sexo_biologico,ds_cargo,st_func,dt_cadastramento)
    VALUES ('1','Igor Sousa Pereira',
            TO_DATE ('01/11/1990'),'M','Coordenador de Vendas','A',
            TO_DATE ('08/10/2024'));
            
SELECT * FROM mc_funcionario;

-- c) Popular 2 Estados; Associar 2 cidades, 1 bairro para cada cidade e 2 
-- endereços para cada bairro

-- Estados
INSERT INTO mc_estado (sg_estado,nm_estado)
    VALUES ('SP','São Paulo');
    
INSERT INTO mc_estado (sg_estado,nm_estado)
    VALUES ('MG','Minas Gerais');
    
SELECT * FROM mc_estado;

-- Cidades
INSERT INTO mc_cidade (sg_estado,nm_cidade,cd_ibge,nr_ddd)
    VALUES ('SP','São Paulo','3550308','11');
    
INSERT INTO mc_cidade (sg_estado,nm_cidade,cd_ibge,nr_ddd)
    VALUES ('SP','Santo Andre','3547809','11');
    
INSERT INTO mc_cidade (sg_estado,nm_cidade,cd_ibge,nr_ddd)
    VALUES ('MG','Belo Horizonte','3106200','31');
    
INSERT INTO mc_cidade (sg_estado,nm_cidade,cd_ibge,nr_ddd)
    VALUES ('MG','Itajubá','3132404','31');
    
SELECT * FROM mc_cidade;
    
-- Bairros
INSERT INTO mc_bairro (cd_cidade,nm_bairro,nm_zona_bairro)
    VALUES ('1','Cambuci','Centro');
    
INSERT INTO mc_bairro (cd_cidade,nm_bairro,nm_zona_bairro)
    VALUES ('2','Jardim','Centro');
    
INSERT INTO mc_bairro (cd_cidade,nm_bairro,nm_zona_bairro)
    VALUES ('3','Savassi','Centro');
    
INSERT INTO mc_bairro (cd_cidade,nm_bairro,nm_zona_bairro)
    VALUES ('4','Prado','Zona Oeste');
    
SELECT * FROM mc_bairro;

-- Endereços
INSERT INTO mc_logradouro (cd_bairro,nm_logradouro,nr_cep)
    VALUES ('1','Avenida Lacerda Franco','01536000');
    
INSERT INTO mc_logradouro (cd_bairro,nm_logradouro,nr_cep)
    VALUES ('1','Rua Gama Cerqueira','01539010');

INSERT INTO mc_logradouro (cd_bairro,nm_logradouro,nr_cep)
    VALUES ('2','Rua das Cerejeiras','09090070');
    
INSERT INTO mc_logradouro (cd_bairro,nm_logradouro,nr_cep)
    VALUES ('2','Rua Jaguari','09090080');
    
INSERT INTO mc_logradouro (cd_bairro,nm_logradouro,nr_cep)
    VALUES ('3','Praça Júlio Garcia','30140125');
    
INSERT INTO mc_logradouro (cd_bairro,nm_logradouro,nr_cep)
    VALUES ('3','Rua Professor Moraes','30150370');
    
INSERT INTO mc_logradouro (cd_bairro,nm_logradouro,nr_cep)
    VALUES ('4','Rua Aristides Duarte','30411160');
    
INSERT INTO mc_logradouro (cd_bairro,nm_logradouro,nr_cep)
    VALUES ('4','Rua Atenas','30411230');
    
SELECT * FROM mc_logradouro;

-- d) Cadastrar endereços de 2 funcionários

INSERT INTO mc_end_func (cd_funcionario,cd_logradouro,nr_end,ds_complemento_end,dt_inicio,st_end)
    VALUES ('1','2','433','apto 32', TO_DATE('01/01/2019'),'A');
    
INSERT INTO mc_end_func (cd_funcionario,cd_logradouro,nr_end,ds_complemento_end,dt_inicio,st_end)
    VALUES ('3','4','78','apto 57', TO_DATE('01/01/2020'),'A');
    
SELECT * FROM mc_end_func;

-- e) Cadastrar 2 PF e 1 PJ com 1 endereço para cada

INSERT INTO mc_cliente (nm_cliente,nm_login,ds_senha)
    VALUES ('Tiago Santos Araujo','thiago.santos','thiago123');
    
INSERT INTO mc_cliente (nm_cliente,nm_login,ds_senha)
    VALUES ('Danilo Ferreira Almeida','danilo.ferreira','danilo123');
    
INSERT INTO mc_cliente (nm_cliente,nm_login,ds_senha)
    VALUES ('Nicole Carvalho Silva','nicole.silva','nicole123');
    
SELECT * FROM mc_cliente;

INSERT INTO mc_cli_fisica (nr_cliente,dt_nascimento,fl_sexo_biologico,nr_cpf)
    VALUES ('1','09/08/1889','M','574.021.140-90');

INSERT INTO mc_cli_fisica (nr_cliente,dt_nascimento,fl_sexo_biologico,nr_cpf)
    VALUES ('2','13/05/1885','M','928.859.160-52');
    
SELECT * FROM mc_cli_fisica;
    
INSERT INTO mc_cli_juridica (nr_cliente,nr_cnpj)
    VALUES ('3','27.632.415/0001-34');
    
SELECT * FROM mc_cli_juridica;
    







    