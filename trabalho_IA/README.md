# Trabalho IA — Stewart 4.7 + Algoritmo Genético (Scilab)

Otimização da seção **4.7** do Stewart com **AG** e comparação com a **solução analítica**.

## Estrutura (como no enunciado do trabalho)

```text
trabalho_IA/
├── ag_generico.sci      # função ag(...) — usada por todos os exercícios
├── ex01.sce … ex78.sce  # um script por exercício
├── main.sce             # roda ex01..ex78 e tabela-resumo
├── resultados.txt       # saída para o Word (gerado pelo main no Scilab)
├── explicacoes.md       # modelagem + derivada
├── OBSERVACOES.md       # notas (sem pendências de implementação)
├── validar_ag.py        # checagem local do AG (opcional, fora do Scilab)
└── README.md
```

## Como rodar

1. Scilab → **File → Change current directory...** → pasta `trabalho_IA`
2. Tudo: `exec("main.sce", -1)`
3. Um exercício: `exec("ex01.sce", -1)`

## O que já está pronto

| Arquivos | Status |
|----------|--------|
| **`ex01.sce` … `ex78.sce`** (+ **`ex57a.sce`**, **`ex58a.sce`**) | **Implementados** (AG ou verificação numérica) |
| **Ex. 66** | `c(v)` **aproximada** só para ilustrar o gráfico |
| **Ex. 64, 69, 73** | Modelagem conforme figuras do PDF (ver `explicacoes.md`) |

O **Ex. 1** é soma 23 com **produto máximo** (dois números, restrição `y = 23 - x`).

## Parâmetros do AG (`ag_generico.sci`)

- `npop = 50`, `nger = 100`
- Torneio, cruzamento aritmético (0,8), mutação gaussiana (0,1), elitismo
- `rand("seed", 1)` — resultados reproduzíveis
- Tolerância na tabela: erro **≤ 1e-2** → status **OK** (ex. **50**: compara **x** e/ou erro relativo em **C**, com **200 gerações** no script)

## Estilo dos scripts

Variáveis `pop`, `npop`, `custo`, comentários em português, bloco **RESULTADO FINAL**, **Valor analítico** e **Erro** (conforme o Ex. 1).

Legendas da tabela-resumo (`RESUMO_ROTULO*`) em linguagem clara; para reaplicar o padrão: `python humanizar_legendas.py`.

## Próximos passos

1. Rodar `exec("main.sce", -1)` no Scilab e colar a saída real em `resultados.txt`.
2. Rodar `python validar_ag.py` (opcional) para checar o AG.
