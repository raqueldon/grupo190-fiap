# Guia de Entrega — PBL TSCO 2º Ano Fase 5 — Melhores Compras

## Status geral

| Entregável | Arquivo | Status |
|---|---|---|
| `componentes.txt` | — | ❌ Precisa de info do grupo |
| Desafio 1 — Dashboard Word | `Desafio1_Dashboard.docx` | ❌ Precisa de prints do BI |
| Desafio 2 — Análise de Dados Word | `Desafio2_Analise_Dados.docx` | ✅ Gerado |
| Desafio 3 — Notebook regressão | `Analise_ROI.ipynb` | ✅ Gerado |
| ZIP final | `<nome_grupo>_PBL_TSCO_2o_Ano_Fase5.zip` | ❌ Depende dos acima |

---

## ✅ Desafio 3 — `Analise_ROI.ipynb` (PRONTO)

O notebook está completo. Para validar, execute todas as células:

```bash
cd c:/FIAP/Fase5
jupyter notebook Analise_ROI.ipynb
```

O que o notebook produz:
- **Etapa 1–2:** Importações e carregamento do CSV
- **Etapa 3:** Pivot table + dummies para variável `Tipo de Midia`
- **Etapa 4:** Matriz de correlação (responde item a do Desafio 3)
- **Etapa 5:** Gráficos de dispersão (responde item b)
- **Etapa 6:** 3 modelos de regressão linear comparados → maior R²
- **Etapa 7:** Análise explicativa para o time de marketing (responde item c)
- **Etapa 8:** Conclusão com tabela de ROI por canal

---

## ✅ Desafio 2 — `Desafio2_Analise_Dados.docx` (PRONTO)

Gerado pelo script `gerar_desafio2.py`. As respostas foram produzidas com análise real do CSV.

### O que cada pergunta responde

| Pergunta | Resposta resumida | Como foi obtido |
|---|---|---|
| **P1 – Estratégia treino/teste/validação** | Proporção 70/20/10, justificada pelo volume (250.059 linhas) e boas práticas do Cap. 10 | Decisão metodológica |
| **P2 – Variáveis numéricas vs. categóricas** | 6 numéricas (valor, quantidade, valor_total_bruto, valor_comissao, lucro_liquido, cod_pedido) e 8 categóricas | `df.dtypes` + análise de domínio |
| **P3 – Importância do cod_pedido** | É identificador técnico — deve ser **excluído** como feature. Há 25.141 duplicatas (mesmo pedido, itens diferentes). | `df.cod_pedido.nunique()` e `.duplicated().sum()` |
| **P4 – Outliers identificados** | **27.431 registros (11,0%)** com pelo menos uma variável fora do IQR | Método IQR aplicado às 5 colunas numéricas |
| **P5 – Estratégia de tratamento** | Investigar → remover erros (qty negativa) → winsorizar P1/P99 → transformação log se necessário | Decisão metodológica |

### Para reproduzir a análise do Desafio 2

```python
# Execute em Python na pasta c:/FIAP/Fase5
python gerar_desafio2.py
```

O script gera o arquivo `Desafio2_Analise_Dados.docx` automaticamente com os dados reais.

---

## ❌ Desafio 1 — Dashboard Word (PRECISA DE VOCÊ)

### O que fazer

1. Abra o arquivo `assets/vendas_linha_petshop_2020_2024.csv` no **Power BI** ou **Tableau**
2. Crie um painel estratégico com pelo menos 3–4 gráficos. Sugestões baseadas no dataset:
   - Gráfico de barras: **Faturamento total por categoria de produto** (`categoriaprod`)
   - Gráfico de linhas: **Evolução mensal das vendas 2020–2024** (`data` + `valor_total_bruto`)
   - Gráfico de pizza: **Participação por forma de pagamento** (`formapagto`)
   - Mapa ou barras: **Vendas por região do país** (`regiao_pais`)
   - Ranking: **Top 10 produtos por lucro líquido** (`lucro_liquido`)
3. Tire prints do dashboard
4. Cole os prints em um arquivo Word e adicione os comentários abaixo

### Comentários obrigatórios no Word (conforme o enunciado)

Para cada imagem incluída, responda:

1. **Tema principal** do dashboard — qual insight central você quis comunicar?
2. **Como o painel foi dividido?** — justifique a escolha de seções/abas
3. **Informação em destaque** — qual métrica você colocou em evidência e por quê?
4. **Gráficos combinados** — quais tipos foram usados e por que combinam com os dados?

### Dicas de boas práticas (Cap. 09 FIAP)

- Usar paleta de cores consistente (evitar mais de 5 cores diferentes)
- Colocar títulos descritivos em cada gráfico
- Ordenar barras de forma decrescente para facilitar comparação
- Usar granularidade de mês (não dia) para séries temporais longas

---

## ❌ `componentes.txt` (PRECISA DE VOCÊ)

Crie um arquivo `componentes.txt` com o seguinte formato:

```
Grupo: <Nome do Grupo>

RM: <RM1> - <Nome Completo 1>
RM: <RM2> - <Nome Completo 2>
...
```

**Regra:** nomes em ordem alfabética pelo sobrenome (conforme norma FIAP).

Exemplo:
```
Grupo: DataDriven

RM: 559875 - Almeida, Marcos Antonio Vieira de
RM: 560001 - Oliveira, Ana Paula
```

---

## ❌ ZIP final (PRECISA DE TODOS OS ACIMA)

Após concluir todos os entregáveis, execute:

```bash
cd c:/FIAP/Fase5
# Substitua <nome_grupo> pelo nome real do grupo
zip -r <nome_grupo>_PBL_TSCO_2o_Ano_Fase5.zip \
  componentes.txt \
  Desafio1_Dashboard.docx \
  Desafio2_Analise_Dados.docx \
  Analise_ROI.ipynb \
  assets/
```

Ou no Windows Explorer: selecione os 4 arquivos + pasta assets → botão direito → Compactar.

---

## Estrutura esperada do ZIP

```
<nome_grupo>_PBL_TSCO_2o_Ano_Fase5.zip
├── componentes.txt
├── Desafio1_Dashboard.docx
├── Desafio2_Analise_Dados.docx
├── Analise_ROI.ipynb
└── assets/
    ├── vendas_linha_petshop_2020_2024.csv
    ├── Gastos_Publicidade_MelhoresCompras.csv
    └── (gráficos gerados pelo notebook .png)
```
