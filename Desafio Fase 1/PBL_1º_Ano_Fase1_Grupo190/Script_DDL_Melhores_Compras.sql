-- Gerado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   em:        2024-09-13 17:31:33 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE mc_bairro CASCADE CONSTRAINTS;

DROP TABLE mc_categoria_prod CASCADE CONSTRAINTS;

DROP TABLE mc_cidade CASCADE CONSTRAINTS;

DROP TABLE mc_cli_fisica CASCADE CONSTRAINTS;

DROP TABLE mc_cli_juridica CASCADE CONSTRAINTS;

DROP TABLE mc_cliente CASCADE CONSTRAINTS;

DROP TABLE mc_depto CASCADE CONSTRAINTS;

DROP TABLE mc_end_cli CASCADE CONSTRAINTS;

DROP TABLE mc_end_func CASCADE CONSTRAINTS;

DROP TABLE mc_estado CASCADE CONSTRAINTS;

DROP TABLE mc_funcionario CASCADE CONSTRAINTS;

DROP TABLE mc_logradouro CASCADE CONSTRAINTS;

DROP TABLE mc_produto CASCADE CONSTRAINTS;

DROP TABLE mc_sgv_video_produto CASCADE CONSTRAINTS;

DROP TABLE mc_sgv_sac CASCADE CONSTRAINTS;

DROP TABLE mc_sgv_tipo_video CASCADE CONSTRAINTS;

DROP TABLE mc_sgv_visualizacao CASCADE CONSTRAINTS;

DROP SEQUENCE SQ_DLL_MC_CATEGORIA_PROD;

DROP SEQUENCE SQ_DLL_MC_PRODUTO;

DROP SEQUENCE SQ_DLL_SGV_SAC;


-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE mc_bairro (
    cd_bairro      NUMBER(8) NOT NULL,
    cd_cidade      NUMBER(8) NOT NULL,
    nm_bairro      VARCHAR2(45),
    nm_zona_bairro VARCHAR2(20)
);

COMMENT ON COLUMN mc_bairro.cd_bairro IS
    'Esta coluna irá receber o codigo do bairro e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_bairro.nm_bairro IS
    'Esta coluna ira receber o nome do Bairro. Esse conteúdo é obrigatório.';

COMMENT ON COLUMN mc_bairro.nm_zona_bairro IS
    'Esta coluna irá receber a localização da zona onde se encontra o bairro. Alguns exemplos: Zona Norte, Zona Sul, Zona Leste, Zona Oeste, Centro.'
    ;

ALTER TABLE mc_bairro ADD CONSTRAINT mc_bairro_pk PRIMARY KEY ( cd_bairro );

CREATE SEQUENCE SQ_DLL_MC_CATEGORIA_PROD
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 99999999999
    NOCACHE
    NOCYCLE;

CREATE TABLE mc_categoria_prod (
    cd_categoria NUMBER(10) DEFAULT SQ_DLL_MC_CATEGORIA_PROD.NEXTVAL NOT NULL,
    ds_categoria VARCHAR2(500) NOT NULL,
    tp_categoria CHAR(1) NOT NULL,
    dt_inicio    DATE NOT NULL,
    dt_termino   DATE,
    st_categoria CHAR(1) NOT NULL
);

COMMENT ON COLUMN mc_categoria_prod.cd_categoria IS
    'Essa coluna irá armazenar a chave primária da tabela de categoria de produtos da Melhorees Compras. Cada categoria nova cadastrada  será acionada a Sequence  SQ_MC_CATEGORIA que se encarregará de gerar o próximo número único da categoria..'
    ;

COMMENT ON COLUMN mc_categoria_prod.ds_categoria IS
    'Essa coluna irá armazenar descrição da categoria de produtos da Melhorees Compras. Cada categoria tem uma  descrição única e serve para organizar os produtos em categorias simliares, melhorando a tomada de decisão.'
    ;

COMMENT ON COLUMN mc_categoria_prod.tp_categoria IS
    'Nessa  coluna  será  armazenada o tipo de categoria que poderá  ser (V)ídeo ou (P)rodudto. Seu conteúdo deve ser obrigatório.';

COMMENT ON COLUMN mc_categoria_prod.dt_inicio IS
    'Essa coluna irá receber  a data de início da categoria. Seu formato é dd/mm/yyyy e seu conteúdo deve ser sempre  obrigatório.';

COMMENT ON COLUMN mc_categoria_prod.dt_termino IS
    'Essa coluna irá receber  a data de encerramento  da categoria. Seu formato é dd/mm/yyyy e seu conteúdo deve ser sempre  opcional. Conteúdo obrigatório significa que a categoria foi encerrada a partir da data término. Já o conteúdo opcional indica que a categoria está ativa e operante.'
    ;

COMMENT ON COLUMN mc_categoria_prod.st_categoria IS
    'Essa coluna irá armazenar o stauts da categoria da Melhorees Compras. Os valores permitidos aqui são: A(tivo) e I(nativo).';

ALTER TABLE mc_categoria_prod ADD CONSTRAINT mc_categoria_prod_pk PRIMARY KEY ( cd_categoria );

ALTER TABLE mc_categoria_prod ADD CONSTRAINT un_mc_cat_prod_ds_prod UNIQUE ( ds_categoria );

CREATE TABLE mc_cidade (
    cd_cidade NUMBER(8) NOT NULL,
    sg_estado CHAR(2) NOT NULL,
    nm_cidade VARCHAR2(60) NOT NULL,
    cd_ibge   NUMBER(8),
    nr_ddd    NUMBER(3)
);

COMMENT ON COLUMN mc_cidade.cd_cidade IS
    'Esta coluna irá receber o codigo da cidade e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_cidade.nm_cidade IS
    'Esta coluna ira receber o nome da Cidade. Esse conteúdo é obrigatório.';

COMMENT ON COLUMN mc_cidade.cd_ibge IS
    'Esta coluna irá receber o código do IBGE que fornece informações para geração da NFe.';

COMMENT ON COLUMN mc_cidade.nr_ddd IS
    'Esta coluna irá receber o número do DDD da cidade para ser utilizado no contato telefônico. Seu conteudo é opcional.';

ALTER TABLE mc_cidade ADD CONSTRAINT mc_cidade_pk PRIMARY KEY ( cd_cidade );

CREATE TABLE mc_cli_fisica (
    nr_cliente        NUMBER(10) NOT NULL,
    dt_nascimento     DATE NOT NULL,
    fl_sexo_biologico CHAR(1) NOT NULL,
    ds_genero         VARCHAR2(100),
    nr_cpf            VARCHAR2(14) NOT NULL
);

COMMENT ON COLUMN mc_cli_fisica.dt_nascimento IS
    'Essa coluna irá armazenar a data de nascimento do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório. '
    ;

COMMENT ON COLUMN mc_cli_fisica.fl_sexo_biologico IS
    'Essa coluna irá armazenar o sexo biológico do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.. '
    ;

COMMENT ON COLUMN mc_cli_fisica.ds_genero IS
    'Genero do sexo do Cliente. Seu conteúdo deve ser obrigatório.';

COMMENT ON COLUMN mc_cli_fisica.nr_cpf IS
    'Essa coluna irá armazenar o número do CPF do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório. '
    ;

ALTER TABLE mc_cli_fisica ADD CONSTRAINT mc_cli_fisica_pk PRIMARY KEY ( nr_cliente );

CREATE TABLE mc_cli_juridica (
    nr_cliente   NUMBER(10) NOT NULL,
    dt_fundacao  DATE NOT NULL,
    nr_cnpj      VARCHAR2(20),
    nr_inscr_est VARCHAR2(15)
);

COMMENT ON COLUMN mc_cli_juridica.dt_fundacao IS
    'Essa coluna irá armazenar data  de fundação do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.'
    ;

COMMENT ON COLUMN mc_cli_juridica.nr_cnpj IS
    'Essa coluna irá armazenar o  numero do CNPJ do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.'
    ;

COMMENT ON COLUMN mc_cli_juridica.nr_inscr_est IS
    'Essa coluna irá armazenar o  numero da Inscrição Estadual  do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser opcional'
    ;

ALTER TABLE mc_cli_juridica ADD CONSTRAINT mc_cli_juridica_pk PRIMARY KEY ( nr_cliente );

CREATE TABLE mc_cliente (
    nr_cliente      NUMBER(10) NOT NULL,
    nm_cliente      VARCHAR2(160) NOT NULL,
    qt_estrelas     NUMBER(1),
    vl_medio_compra NUMBER(10, 2),
    st_cliente      CHAR(1) NOT NULL,
    ds_email        VARCHAR2(100),
    nr_telefone     VARCHAR2(20),
    nm_login        VARCHAR2(50) NOT NULL,
    ds_senha        VARCHAR2(50) NOT NULL,
    tp_cliente      CHAR(1) NOT NULL
);

COMMENT ON COLUMN mc_cliente.nr_cliente IS
    'Essa coluna irá armazenar o código único do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório, único e preenhcido a  parrtir da chamada de sequence  SQ_MC_CLIENTE, a qual terá sempre o número disponivel para uso.'
    ;

COMMENT ON COLUMN mc_cliente.nm_cliente IS
    'Essa coluna irá armazenar o nome do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.';

COMMENT ON COLUMN mc_cliente.qt_estrelas IS
    'Essa coluna irá armazenar a quantiade de estrelas do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório e ser possível de estar entre 1 e 5 estrelas.'
    ;

COMMENT ON COLUMN mc_cliente.vl_medio_compra IS
    'Essa coluna irá armazenar o valor  médio de gastos f eito pelo cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório e deve ser calculado diariamente.'
    ;

COMMENT ON COLUMN mc_cliente.st_cliente IS
    'Essa coluna irá armazenar o stauts do cliente da Melhorees Compras. Os valores permitidos aqui são: A(tivo) e I(nativo).';

COMMENT ON COLUMN mc_cliente.ds_email IS
    'Essa coluna irá armazenar o email  do cliente da Melhorees Compras. No minimo é esperado um email contendo o caractere (@) em seu conteúdo.'
    ;

COMMENT ON COLUMN mc_cliente.nr_telefone IS
    'Essa coluna irá armazenar o número do cliente da Melhorees Compras. A mascara de armazenamento deve ser: (<nr_ddd>) 99999-9999 e  deve ser utilizada pré definida.'
    ;

COMMENT ON COLUMN mc_cliente.nm_login IS
    'Essa coluna irá armazenar o login de cada cliente na plataforma ecommerce da Melhores Compras. Seu conteúdo deve ser obrigatório e  único para cada cliente.'
    ;

COMMENT ON COLUMN mc_cliente.ds_senha IS
    'Essa coluna irá armazenar a senha de cada cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.'
    ;

ALTER TABLE mc_cliente
    ADD CONSTRAINT ck_mc_cliente_st CHECK ( st_cliente IN ( 'A', 'I' ) );

ALTER TABLE mc_cliente ADD CONSTRAINT mc_cliente_pk PRIMARY KEY ( nr_cliente );

CREATE TABLE mc_depto (
    cd_depto NUMBER(3) NOT NULL,
    nm_depto VARCHAR2(100) NOT NULL,
    st_depto CHAR(1) NOT NULL
);

COMMENT ON COLUMN mc_depto.cd_depto IS
    'Esta coluna irá receber o codigo do departamento  e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_depto.nm_depto IS
    'Esta coluna irá receber o nome do  departamento  e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_depto.st_depto IS
    'Esta coluna irá receber o status do  departamento  e seu conteúdo é obrigatório. Os valores possíveis são: (A)tivo e (I)nativo.'
    ;

ALTER TABLE mc_depto ADD CONSTRAINT mc_depto_pk PRIMARY KEY ( cd_depto );

CREATE TABLE mc_end_cli (
    cd_logradouro      NUMBER(10) NOT NULL,
    nr_cliente         NUMBER(10) NOT NULL,
    nr_end             NUMBER(8) NOT NULL,
    ds_complemento_end VARCHAR2(80),
    dt_inicio          DATE,
    dt_termino         DATE,
    st_end             CHAR(1)
);

COMMENT ON COLUMN mc_end_cli.nr_end IS
    'Número do Endereço do Cliente. O número da Rua/Localidade onde o cliente está associado.';

COMMENT ON COLUMN mc_end_cli.ds_complemento_end IS
    'Esta coluna irá receber o complemento do endereço do cliente e seu conteúdo pode ser opcional.';

COMMENT ON COLUMN mc_end_cli.dt_inicio IS
    'Data de início do endereço associado ao cliente.';

COMMENT ON COLUMN mc_end_cli.dt_termino IS
    'Data de término do endereço associado ao cliente.';

COMMENT ON COLUMN mc_end_cli.st_end IS
    'Status do endereço. (A)itvo ou (I)nativo.';

ALTER TABLE mc_end_cli ADD CONSTRAINT mc_end_cli_pk PRIMARY KEY ( nr_cliente,
                                                                  cd_logradouro );

CREATE TABLE mc_end_func (
    cd_logradouro      NUMBER(10) NOT NULL,
    cd_funcionario     NUMBER(10) NOT NULL,
    nr_end             NUMBER(8) NOT NULL,
    ds_complemento_end VARCHAR2(80),
    dt_inicio          DATE NOT NULL,
    dt_termino         DATE,
    st_end             CHAR(1) NOT NULL
);

COMMENT ON COLUMN mc_end_func.nr_end IS
    'Número do Endereço do Cliente. O número da Rua/Localidade onde o cliente está associado.';

COMMENT ON COLUMN mc_end_func.dt_inicio IS
    'Data de início do endereço associado ao cliente.';

COMMENT ON COLUMN mc_end_func.dt_termino IS
    'Data de término do endereço associado ao cliente.';

ALTER TABLE mc_end_func ADD CONSTRAINT mc_end_func_pk PRIMARY KEY ( cd_logradouro,
                                                                    cd_funcionario );

CREATE TABLE mc_estado (
    sg_estado CHAR(2) NOT NULL,
    nm_estado VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN mc_estado.sg_estado IS
    'Esta coluna ira receber a siga do Estado. Esse conteúdo é obrigatório.';

COMMENT ON COLUMN mc_estado.nm_estado IS
    'Esta coluna irá receber o nome do estado';

ALTER TABLE mc_estado ADD CONSTRAINT mc_estado_pk PRIMARY KEY ( sg_estado );

CREATE TABLE mc_funcionario (
    cd_funcionario    NUMBER(10) NOT NULL,
    cd_funcionario1   NUMBER(10),
    cd_depto          NUMBER(3) NOT NULL,
    nm_funcionario    VARCHAR2(160) NOT NULL,
    dt_nascimento     DATE NOT NULL,
    fl_sexo_biologico CHAR(1),
    ds_genero         VARCHAR2(100),
    ds_cargo          VARCHAR2(80) NOT NULL,
    vl_salario        NUMBER(10, 2),
    ds_email          VARCHAR2(80) NOT NULL,
    st_func           CHAR(1),
    dt_cadastramento  DATE,
    dt_desligamento   DATE,
    nr_telefone       NUMBER(15) NOT NULL,
    nr_cpf_func       NUMBER(14)
);

COMMENT ON COLUMN mc_funcionario.cd_funcionario IS
    'Esta coluna irá receber o codigo do funcionário e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_funcionario.nm_funcionario IS
    'Esta coluna irá receber o nome do funcionário e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_funcionario.dt_nascimento IS
    'Esta coluna irá receber a data de nascimento  do funcionário e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_funcionario.fl_sexo_biologico IS
    'Esta coluna irá receber o sexo biológico do funcionário e seu conteúdo é obrigatório.Os valores permitidos aqui seriam: (F)eminino; (M)asculino ou (Hermafrodita)'
    ;

COMMENT ON COLUMN mc_funcionario.ds_genero IS
    'Esta coluna irá receber o genero atribuido ao funcionário e seu conteúdo é opcional.';

COMMENT ON COLUMN mc_funcionario.ds_cargo IS
    'Esta coluna irá receber o cargo do funcionário e seu conteúdo é opcional.';

COMMENT ON COLUMN mc_funcionario.vl_salario IS
    'Esta coluna irá receber o valor do salário do funcionário e seu conteúdo é opcional.';

COMMENT ON COLUMN mc_funcionario.ds_email IS
    'Esta coluna irá receber o email do funcionário e seu conteúdo é opcional.';

COMMENT ON COLUMN mc_funcionario.st_func IS
    'Essa coluna irá armazenar o stauts do funcionário da Melhorees Compras. Os valores permitidos aqui são: A(tivo) e I(nativo).';

COMMENT ON COLUMN mc_funcionario.dt_cadastramento IS
    'Data de cadastramento do Funcionario';

COMMENT ON COLUMN mc_funcionario.dt_desligamento IS
    'Data de desligamento  do Funcionario. Seu conteúdo é opcional.';

ALTER TABLE mc_funcionario ADD CONSTRAINT mc_funcionario_pk PRIMARY KEY ( cd_funcionario );

ALTER TABLE mc_funcionario ADD CONSTRAINT un_mc_funcionario_cpf UNIQUE ( nr_cpf_func );

CREATE TABLE mc_logradouro (
    cd_logradouro NUMBER(10) NOT NULL,
    cd_bairro     NUMBER(8) NOT NULL,
    nm_logradouro VARCHAR2(160) NOT NULL,
    nr_cep        NUMBER(8)
);

COMMENT ON COLUMN mc_logradouro.cd_logradouro IS
    'Esta coluna irá receber o código do logradouro e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_logradouro.nm_logradouro IS
    'Esta coluna irá receber o nome do logradouro e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_logradouro.nr_cep IS
    'Esta coluna irá receber o numero do CEP do Logradouro e seu conteúdo é obrigatório.';

ALTER TABLE mc_logradouro ADD CONSTRAINT mc_logradouro_pk PRIMARY KEY ( cd_logradouro );

CREATE SEQUENCE SQ_DLL_MC_PRODUTO
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999999999
    NOCACHE
    NOCYCLE;

CREATE TABLE mc_produto (
    cd_produto        NUMBER(10) DEFAULT SQ_DLL_MC_PRODUTO.NEXTVAL NOT NULL,
    cd_categoria      NUMBER NOT NULL,
    ds_produto        VARCHAR2(80) NOT NULL,
    nr_cd_barras_prod VARCHAR2(50),
    vl_unitario       NUMBER(8, 2) NOT NULL,
    tp_embalagem      VARCHAR2(15),
    st_produto        CHAR(1),
    vl_perc_lucro     NUMBER(8, 2),
    ds_completa_prod  VARCHAR2(4000) NOT NULL
);

COMMENT ON COLUMN mc_produto.cd_produto IS
    'Essa coluna irá armazenar a chave primária da tabela de produtos da Melhorees Compras. A cada produto cadastrado será acionada a Sequence  SQ_MC_PRODUTO que se encarregará de gerar o próximo número único do produto.'
    ;

COMMENT ON COLUMN mc_produto.ds_produto IS
    'Essa coluna irá armazenar a descrição principal do produto. Seu conteúdo deve ser  obrigatorio.';

COMMENT ON COLUMN mc_produto.nr_cd_barras_prod IS
    'Essa coluna irá armazenar o número do codigo de barras  do produto. Seu conteúdo deve ser opcional.';

COMMENT ON COLUMN mc_produto.vl_unitario IS
    'Essa coluna irá armazenar o valor unitário do produto. Seu conteúdo deve ser > 0 ';

COMMENT ON COLUMN mc_produto.tp_embalagem IS
    'Essa coluna irá armazenar o tipo de embalagem do produto. Seu conteúdo pode ser opcional.';

COMMENT ON COLUMN mc_produto.st_produto IS
    'Essa coluna irá armazenar o stauts do produto da Melhorees Compras. Os valores permitidos aqui são: A(tivo) e I(nativo).';

COMMENT ON COLUMN mc_produto.vl_perc_lucro IS
    'Essa coluna irá armazenar o percentual  do lucro médio para cada produto. Seu conteúdo deve ser opcional.';

COMMENT ON COLUMN mc_produto.ds_completa_prod IS
    'Essa coluna irá armazenar a descrição completa do produto. Seu conteúdo deve ser  obrigatorio.';

ALTER TABLE mc_produto ADD CONSTRAINT mc_produto_pk PRIMARY KEY ( cd_produto );

ALTER TABLE mc_produto ADD CONSTRAINT un_mc_prod_ds_prod UNIQUE ( ds_produto );

CREATE TABLE mc_sgv_video_produto (
    cd_video    NUMBER(10) NOT NULL,
    cd_tipo     NUMBER(10) NOT NULL,
    cd_produto  NUMBER(10) NOT NULL,
    st_video    CHAR(1) NOT NULL,
    dt_cadastro DATE NOT NULL
);

ALTER TABLE mc_sgv_video_produto
    ADD CONSTRAINT ck_mc_sgv_video_prod_st_video CHECK ( st_video IN ( 'A', 'I' ) );

ALTER TABLE mc_sgv_video_produto ADD CONSTRAINT mc_sgv_video_produto_pk PRIMARY KEY ( cd_video );

CREATE SEQUENCE SQ_DLL_SGV_SAC
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999999999
    NOCACHE
    NOCYCLE;

CREATE TABLE mc_sgv_sac (
    nr_sac                   NUMBER(10) DEFAULT SQ_DLL_SGV_SAC.NEXTVAL NOT NULL,
    nr_cliente               NUMBER(10) NOT NULL,
    cd_funcionario           NUMBER(10) NOT NULL,
    cd_produto               NUMBER(10) NOT NULL,
    ds_detalhada_sac         CLOB NOT NULL,
    dt_abertura_sac          DATE NOT NULL,
    hr_abertura_sac          NUMBER(2) NOT NULL,
    dt_atendimento           DATE,
    hr_atendimento_sac       NUMBER(2),
    nr_tempo_total_sac       NUMBER GENERATED ALWAYS AS ((hr_atendimento_sac - hr_abertura_sac) * 24),
    ds_detalhada_retorno_sac CLOB,
    tp_sac                   CHAR(1) NOT NULL,
    st_sac                   CHAR(1) NOT NULL,
    nr_indice_satisfacao     NUMBER(2)
);

COMMENT ON COLUMN mc_sgv_sac.nr_sac IS
    'Essa coluna irá armazenar a chave primária da tabela de SAC de vídeo  da Melhorees Compras. A cada SAC cadastrado pelo cliente será acionada a Sequence  SQ_MC_SGV_SAC que se encarregará de gerar o próximo número único do chamado SAC feito pelo Cliente.'
    ;

COMMENT ON COLUMN mc_sgv_sac.ds_detalhada_sac IS
    'Essa coluna  irá  receber a descrição completa do SAC aberto pelo cliente. Seu conteudo deve ser obrigatório.';

COMMENT ON COLUMN mc_sgv_sac.dt_abertura_sac IS
    'Essa coluna  irá  receber a data e horário do SAC aberto pelo cliente. Seu conteudo deve ser obrigatório.';

COMMENT ON COLUMN mc_sgv_sac.hr_abertura_sac IS
    'Essa coluna  irá  receber a hora do SAC aberto pelo cliente. Seu conteudo deve ser obrigatório.';

COMMENT ON COLUMN mc_sgv_sac.dt_atendimento IS
    'Essa coluna  irá  receber a data e horário do atendmiento SAC feita pelo funcionário da Melhores Compras. Seu conteudo deve ser opcional..'
    ;

COMMENT ON COLUMN mc_sgv_sac.hr_atendimento_sac IS
    'Essa coluna  irá  receber a hora do SAC do atendimento  feito  pelo funcionario da Melhores Compras. Seu conteudo deve ser opcional.'
    ;

COMMENT ON COLUMN mc_sgv_sac.nr_tempo_total_sac IS
    'Essa coluna  irá  receber o tempo total em horas  (HH24) computado desde a abertura até a conclusão dele. A unidade de medida é horas, ou seja, em quantas horas o chamado foi concluído desde a sua abertura.'
    ;

COMMENT ON COLUMN mc_sgv_sac.ds_detalhada_retorno_sac IS
    'Essa coluna  irá  receber a descrição detalhada do retorno feito pelo funcionário a partir da solicitação do cliente. Seu conteúdo deve ser opcional e preenchido pelo funcionário.'
    ;

COMMENT ON COLUMN mc_sgv_sac.tp_sac IS
    'Essa coluna  irá  receber o TIPO  do chamado SAC aberto pelo cliente.  Seu conteúdo deve ser  obrigatório e os possíveis valores são: (S)ugestão; (D)úvida ou  (E)logio.'
    ;

COMMENT ON COLUMN mc_sgv_sac.st_sac IS
    'Essa coluna  irá  receber o STATUS  do chamado SAC aberto pelo cliente.  Seu conteúdo deve ser  obrigatório e os possíveis valores são: (E)m Atendimento; (C)ancelado; (F)echado ou (X)Fechado com Insatisfação do cliente.'
    ;

COMMENT ON COLUMN mc_sgv_sac.nr_indice_satisfacao IS
    'Essa coluna  irá  receber o índice de satisfação, , computado como um valor simples de 1 a 10, onde 1 refere-se ao cliente menos satisfeito e 10 o cliente mais satisfeito. Esse índice de satisfação é opcional e informado pelo cliente ao final do atendimento.'
    ;

ALTER TABLE mc_sgv_sac
    ADD CONSTRAINT ck_mc_sgv_sac_st_sac CHECK ( st_sac IN ( 'A', 'E', 'C', 'F', 'X' ) );

ALTER TABLE mc_sgv_sac
    ADD CONSTRAINT ck_mc_sgv_sac_satisf CHECK ( nr_indice_satisfacao BETWEEN 1 AND 10 );

ALTER TABLE mc_sgv_sac
    ADD CONSTRAINT ck_mc_sgv_sac_tp CHECK ( tp_sac IN ( 'Sugestão', 'Reclamação' ) );

ALTER TABLE mc_sgv_sac ADD CONSTRAINT mc_sgv_sac_pk PRIMARY KEY ( nr_sac );

CREATE TABLE mc_sgv_tipo_video (
    cd_tipo NUMBER(10) NOT NULL,
    ds_tipo VARCHAR2(150) NOT NULL
);

ALTER TABLE mc_sgv_tipo_video ADD CONSTRAINT mc_sgv_tipo_produto_pk PRIMARY KEY ( cd_tipo );

CREATE TABLE mc_sgv_visualizacao (
    cd_visualizacao NUMBER(10) NOT NULL,
    cd_video        NUMBER(10) NOT NULL,
    nr_cliente      NUMBER(10),
    dt_visualizacao DATE NOT NULL
);

ALTER TABLE mc_sgv_visualizacao ADD CONSTRAINT mc_sgv_visualizacao_pk PRIMARY KEY ( cd_visualizacao );

ALTER TABLE mc_sgv_sac
    ADD CONSTRAINT atender FOREIGN KEY ( cd_funcionario )
        REFERENCES mc_funcionario ( cd_funcionario );

ALTER TABLE mc_produto
    ADD CONSTRAINT categorizar FOREIGN KEY ( cd_categoria )
        REFERENCES mc_categoria_prod ( cd_categoria );

ALTER TABLE mc_sgv_video_produto
    ADD CONSTRAINT classificar FOREIGN KEY ( cd_tipo )
        REFERENCES mc_sgv_tipo_video ( cd_tipo );

ALTER TABLE mc_end_cli
    ADD CONSTRAINT morar FOREIGN KEY ( nr_cliente )
        REFERENCES mc_cliente ( nr_cliente );

ALTER TABLE mc_end_func
    ADD CONSTRAINT morarv2 FOREIGN KEY ( cd_logradouro )
        REFERENCES mc_logradouro ( cd_logradouro );

ALTER TABLE mc_end_func
    ADD CONSTRAINT morarv3 FOREIGN KEY ( cd_funcionario )
        REFERENCES mc_funcionario ( cd_funcionario );

ALTER TABLE mc_funcionario
    ADD CONSTRAINT pertencer FOREIGN KEY ( cd_depto )
        REFERENCES mc_depto ( cd_depto );

ALTER TABLE mc_sgv_video_produto
    ADD CONSTRAINT possuir FOREIGN KEY ( cd_produto )
        REFERENCES mc_produto ( cd_produto );

ALTER TABLE mc_sgv_visualizacao
    ADD CONSTRAINT possuirv2 FOREIGN KEY ( cd_video )
        REFERENCES mc_sgv_video_produto ( cd_video );

ALTER TABLE mc_sgv_sac
    ADD CONSTRAINT possuirv3 FOREIGN KEY ( cd_produto )
        REFERENCES mc_produto ( cd_produto );

ALTER TABLE mc_cli_fisica
    ADD CONSTRAINT ser FOREIGN KEY ( nr_cliente )
        REFERENCES mc_cliente ( nr_cliente );

ALTER TABLE mc_cli_juridica
    ADD CONSTRAINT serv2 FOREIGN KEY ( nr_cliente )
        REFERENCES mc_cliente ( nr_cliente );

ALTER TABLE mc_funcionario
    ADD CONSTRAINT serv3 FOREIGN KEY ( cd_funcionario1 )
        REFERENCES mc_funcionario ( cd_funcionario );

ALTER TABLE mc_sgv_sac
    ADD CONSTRAINT solicitar FOREIGN KEY ( nr_cliente )
        REFERENCES mc_cliente ( nr_cliente );

ALTER TABLE mc_end_cli
    ADD CONSTRAINT ter FOREIGN KEY ( cd_logradouro )
        REFERENCES mc_logradouro ( cd_logradouro );

ALTER TABLE mc_cidade
    ADD CONSTRAINT terv2 FOREIGN KEY ( sg_estado )
        REFERENCES mc_estado ( sg_estado );

ALTER TABLE mc_bairro
    ADD CONSTRAINT terv3 FOREIGN KEY ( cd_cidade )
        REFERENCES mc_cidade ( cd_cidade );

ALTER TABLE mc_logradouro
    ADD CONSTRAINT terv4 FOREIGN KEY ( cd_bairro )
        REFERENCES mc_bairro ( cd_bairro );

ALTER TABLE mc_sgv_visualizacao
    ADD CONSTRAINT visualizar FOREIGN KEY ( nr_cliente )
        REFERENCES mc_cliente ( nr_cliente );

CREATE OR REPLACE TRIGGER arc_arc_2_mc_cli_juridica BEFORE
    INSERT OR UPDATE OF nr_cliente ON mc_cli_juridica
    FOR EACH ROW
DECLARE
    d CHAR(1);
BEGIN
    SELECT
        a.tp_cliente
    INTO d
    FROM
        mc_cliente a
    WHERE
        a.nr_cliente = :new.nr_cliente;

    IF ( d IS NULL OR d <> 'J' ) THEN
        raise_application_error(-20223, 'FK SERv2 in Table MC_CLI_JURIDICA violates Arc constraint on Table MC_CLIENTE - discriminator column TP_CLIENTE doesn''t have value ''J'''
        );
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/

CREATE OR REPLACE TRIGGER arc_arc_2_mc_cli_fisica BEFORE
    INSERT OR UPDATE OF nr_cliente ON mc_cli_fisica
    FOR EACH ROW
DECLARE
    d CHAR(1);
BEGIN
    SELECT
        a.tp_cliente
    INTO d
    FROM
        mc_cliente a
    WHERE
        a.nr_cliente = :new.nr_cliente;

    IF ( d IS NULL OR d <> 'F' ) THEN
        raise_application_error(-20223, 'FK SER in Table MC_CLI_FISICA violates Arc constraint on Table MC_CLIENTE - discriminator column TP_CLIENTE doesn''t have value ''F'''
        );
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;




-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            17
-- CREATE INDEX                             0
-- ALTER TABLE                             44
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           2
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
