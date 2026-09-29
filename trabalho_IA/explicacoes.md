# Explicações — Stewart 4.7 (AG + derivada)

Documento para o relatório. **Ex. 1–78** com scripts; **grupo B** (18, 41, 57a, 58a, 63, 67, 68, 76) com **demonstrações abaixo** e verificação nos `.sce`.  
Notas gerais: `OBSERVACOES.md`.

---

## Exercício 1 — Soma 23, produto máximo

- **Modelagem:** `y = 23 - x`, maximizar `f(x) = x(23-x)`.
- **Derivada:** `f'(x) = 23 - 2x = 0` → `x = 11,5`, `y = 11,5`, produto **132,25**.
- **Inteiros (item a):** testar `x = 1..22`; máximo em **12 e 11** → produto **132**.

## Exercício 2 — Diferença 100, produto mínimo

- `y = x - 100`, minimizar `f(x) = x(x-100)`.
- `f'(x) = 2x - 100 = 0` → **50** e **-50**, produto **-2500**.

## Exercício 3 — Produto 100, soma mínima

- `y = 100/x`, minimizar `f(x) = x + 100/x`, `x > 0`.
- `f'(x) = 1 - 100/x² = 0` → **10** e **10**, soma **20**.

## Exercício 4 — Soma 16, soma dos quadrados mínima

- `y = 16 - x`, minimizar `x² + (16-x)²`.
- `f'(x) = 4x - 32 = 0` → **8** e **8**, valor **128**.

## Exercício 5 — Distância vertical máxima

- Entre `y = x+2` e `y = x²`, `d(x) = x+2-x²`, `-1 ≤ x ≤ 2`.
- `d'(x) = 1 - 2x = 0` → **x = 0,5**, distância **2,25**.

## Exercício 6 — Distância vertical mínima

- `d(x) = (x²+1) - (x-x²) = 2x² - x + 1`.
- `d'(x) = 4x - 1 = 0` → **x = 0,25**, distância **0,875**.

## Exercício 7 — Perímetro 100, área máxima

- `2(L+W)=100` → `W = 50-L`, maximizar `L(50-L)`.
- **L = W = 25**, área **625**.

## Exercício 8 — Área 1000, perímetro mínimo

- `W = 1000/L`, minimizar `2(L + 1000/L)`.
- **L = W = √1000**, perímetro **≈ 126,49**.

## Exercício 9 — Y = kN/(1+N²), k = 1

- Maximizar `N/(1+N²)`, `N > 0`.
- **N = 1**, **Y = 0,5**.

## Exercício 10 — P = 100I/(I²+I+4)

- Derivada nula → **I = 2**, **P = 20**.

## Exercício 11 — Cerca 300 m, quatro compartimentos

- Restrição do enunciado completo: **2x + 5y = 300** → `y = 60 - 0,4x`.
- Área `A = xy` → `A'(x) = 60 - 0,8x = 0` → **x = 75**, **y = 30**, área **2250 m²**.
- Itens (a)–(f): comparar diagramas na tabela (a fazer quando o PDF estiver na pasta).

## Exercício 12 — Caixa sem tampa (chapa 3 m)

- `V(x) = x(3-2x)²`, `0 < x < 1,5`.
- `V' = (3-2x)(3-6x) = 0` → **x = 0,5**, **V = 2 m³**.
- Item (a): tabela de vários `x` no script.

## Exercício 13 — Área 15000 m², cerca mínima

- `xy = 15000`, minimizar `3x + 2y` → **x = 100**, **y = 150**, cerca **600 m**.

## Exercício 14 — Volume 32000 cm³, material mínimo

- `h = 32000/x²`, minimizar `x² + 4xh` → base **40×40**, **h = 20**, área **4800 cm²**.

## Exercício 15 — 1200 cm² de material, volume máximo

- `h = (1200-x²)/(4x)`, `V = x(1200-x²)/4` → **20×20×10**, **V = 4000 cm³**.

## Exercício 16 — Contêiner 10 m³, tampa aberta, custo mínimo

- Largura `x`, comprimento `2x`, `h = 5/x²`, `C = 20x² + 180/x`.
- `x³ = 4,5` → largura **≈ 1,651**, comprimento **≈ 3,302**, **altura ≈ 1,834 m**, custo **≈ 163,54**.
- **Atenção:** alguns resumos citam altura ≈ 3,67 m; com **V = 10 m³** e esta modelagem, a altura ótima é **≈ 1,83 m** (custo bate com 163,54). Conferir figura do livro.

## Exercício 19 — Distância à reta y = 2x + 3

- `d² = 5x² + 12x + 9` → mínimo em **x = −1,2**, **y = 0,6**, **d = √1,8 ≈ 1,342**.

## Exercício 20 — y = √x e ponto (3, 0)

- `d² = x² − 5x + 9` → **x = 2,5**, **y = √2,5 ≈ 1,581**.

## Exercício 21 — Elipse 4x² + y² = 4

- Maximizar distância a **(1, 0)** → **x = −1/3**, **y = ±4√2/3 ≈ ±1,886**.

## Exercício 22 — y = sen x e (4, 2)

- Mínimo de `d²` por **malha fina** (AG confere): **x ≈ 2,65**, **y ≈ 0,47** (2 casas), **d ≈ 2,04**.

## Exercícios 23–28 — Áreas

- **23:** quadrado no círculo **r = 1**, área **2**.
- **24:** elipse **a = 3**, **b = 2**, área **2ab = 12**.
- **25:** triângulo equilátero **L = 1**, **b = 0,5**, **h = √3/4**, área **√3/8**.
- **26–27:** trapézio / triângulo isósceles no círculo, área máx. **3√3/4 ≈ 1,299**.
- **28:** triângulo 3–4–5, retângulo **1,5 × 2**, área **3**.

## Exercícios 29–31 — Cilindro na esfera / cone

- **29:** volume máx. **4π/(3√3) ≈ 2,418**.
- **30:** cone **h = r = 1**, volume máx. **4π/27 ≈ 0,4654**.
- **31:** superfície total máx. **π(1 + √5) ≈ 10,166**.

## Exercício 17 — Com tampa (lados e tampa a 6 $/m²)

- `C = 32x² + 180/x`, `x³ = 45/16` → largura **≈ 1,411**, custo **≈ 191,3**.

## Exercícios 32–40 — Geometria e embalagens

- **32:** `P = 2r + 2h + πr = 10`, `A(r) = rh + πr²/2` → **r = h = 10/(4+π) ≈ 1,400**, largura **2,8**.
- **33:** impresso **16×24**, pôster **24×36**, área do cartaz **864** (mínima com área impressa 384).
- **34:** `(w+6)(h+8)=900`, máximo de `wh` → pôster **≈ 25,98×34,64**; impresso **≈ 20×26,64** (**≈ 532,3 cm²**).
- **35–36:** fio 10 m — (a) tudo numa figura; (b) **área mínima** com reparto (35: **4s ≈ 4,35**, **A ≈ 2,72**; 36: **4s ≈ 5,60**, **A ≈ 3,50**).
- **37:** lata aberta `r = h = (1000/π)^(1/3) ≈ 6,83`.
- **38:** escada **L ≈ 4,162 m** (mesma raiz que o ex. 53).
- **39:** disco `R=1`, `V = πr²h/3` → **V ≈ 0,4031**.
- **40:** `V=27`, área lateral mínima → **r ≈ 2,632**, **h ≈ 3,722**.

## Exercício 43 — Potência no resistor

- `P = E²R/(R+r)²`, `E=12`, `r=2`. O enunciado pede “mínimo”, mas **P > 0** e o ponto crítico é **máximo**: **R = 2 Ω**, **P = 18 W**.

## Exercícios 44–53 — Aplicações

- **44:** `E = v³/(v-1)` → **v = 1,5**, **E = 6,75** (gráfico no script).
- **45:** `S = 6sh − (3/2)s² cot θ + (3s²√3/2) csc θ` (`s=1`, `h=2`).  
  `dS/dθ = (3/2)s² csc²θ − (3√3/2)s² csc θ cot θ = 0` → **cos θ = 1/√3** (**≈ 54,74°**).  
  **Sₘᵢₙ = 6sh + (3√2/2)s² = 12 + 3√2/2 ≈ 14,121**.
- **46:** `t = 0,36 h` (mínimo de `D²`).
- **47:** crítico **x ≈ 5,67** fora de `[0,5]` → mínimo em **x = 5**, **T ≈ 1,179 h**.
- **48:** caminhar semicircunferência → **T = π/2 h**.
- **49–50:** oleoduto — **x ≈ 4,845** / **x = 6 − 1/√3 ≈ 5,423** (ex. 50: **200 gerações** no AG; tabela-resumo compara **x** e aceita **erro relativo** em **C**).
- **51:** `3/x² + 1/(4-x)²` → **x = 4·³√3/(1+³√3) ≈ 2,362 m**.
- **52:** reta por **(3,5)**, menor triângulo no 1º quadrante → **a = 6**, **b = 10**, área **30**.
- **53:** segmento mínimo pelo **(1,2)** → **L ≈ 4,162**.

## Exercícios 54–56 — Curvas e tangentes

- **54:** `y' = 120x² − 15x⁴` → máximo em **x = ±2**, **y' = 240**, pontos **(2, 225)** e **(−2, −223)**.
- **55:** tangente a **y = 3/x** → **a = √3**, **L = 2√6 ≈ 4,899**.
- **56:** área do triângulo tangente a **y = 4 − x²** → **a = 2/√3**, **A = 32√3/9 ≈ 6,158**.

## Exercícios 57–62 — Custo, receita, lucro

- **57(b):** `C(x) = 16000 + 200x + 4x^(3/2)`; custo médio mínimo **320** em **x = 400**; em **x = 1000**: **C = 342491**, **CM ≈ 342,49**, **C' ≈ 389,74**.
- **58(b):** lucro máximo em **x = 100** (`p = 1700 − 7x`, custo cúbico dado).
- **59:** `p = 19 − x/3000` → receita máx. **x = 28500**, **p = $9,50**.
- **60:** `p = 20 − x/2`, custo **$6** → **p = $13**, **14** unidades, lucro **$98**.
- **61:** receita máx. **x = 2750**, **p = 275**; lucro com **C = 68000 + 150x** → **x = 2000**, **p = 350**.
- **62:** aluguel **$900**, **90** apartamentos, receita **$81 000**.

## Exercícios 70–72, 74–75, 77–78

- **70:** `L(θ)=3/sen θ+2/cos θ` → mínimo **L=(3^(2/3)+2^(2/3))^(3/2)≈7,02 m** (maior cano).
- **71:** `tan θ=2x/(1+3x²)` → **x=1/√3**, **θₘₐₓ=π/6 (30°)**.
- **72:** `A=100 sen θ(1+cos θ)` → **θ=π/3**, **A≈129,9 cm²**.
- **74:** ângulo visual máximo → **x=√(d(d+h))=√3≈1,732 m** (`h=2`, `d=1`).
- **75:** retângulo **L=4**, **W=3** → **θ=π/4**, **A=24,5**.
- **77(a):** **E(x)=1,4√(25+x²)+(13−x)** → **x≈5,10 km**; **(c)** **W/L=√194/13≈1,071**; **(d)** **W/L=√41/4≈1,601**.
- **78:** **I(x)=1/(d²+x²)+1/(d²+(10−x)²)**; **d=5** mínimo em **x=5**; **d=10** máximo local em **x=5**; **d=5√3≈8,66** crítico (**I″(5)=0**).

---

## Grupo B — Demonstrações (passo a passo)

### Exercício 18 — Área fixa vs perímetro fixo

- **(a)** `xy=100` → minimizar `P=2(x+y)=2(x+100/x)`.  
  `P'(x)=2(1−100/x²)=0` ⇒ **x=10**, **y=10**, **Pₘᵢₙ=40**.
- **(b)** `2(x+y)=100` ⇒ `y=50−x`, maximizar `A=x(50−x)`.  
  `A'(x)=50−2x=0` ⇒ **x=25**, **Aₘₐₓ=625**.

### Exercício 41 — Volume com `H=1`

- Modelo do copo cônico: **V(h)=πh(1−h)²** (0&lt;h&lt;1).  
  `V'(h)=π(1−h)(1−3h)=0` ⇒ **h=1/3** (máximo interior).

### Exercício 57(a) — Custo médio mínimo ⇒ `C'(x)=c(x)`

- `c(x)=C(x)/x` ⇒ `c'(x)=(xC'(x)−C(x))/x²`.  
  Se **c** tem mínimo em **x&gt;0**, então **c'(x)=0** ⇒ **xC'(x)−C(x)=0** ⇒ **C'(x)=C(x)/x=c(x)**.  
- Com **C(x)=16000+200x+4x^(3/2)** em **x=400**: **c=320** e **C'=200+6√400=320**.

### Exercício 58(a) — Lucro máximo ⇒ `R'(x)=C'(x)`

- `P(x)=R(x)−C(x)`, **R(x)=x·p(x)**.  
  `P'(x)=R'(x)−C'(x)=0` ⇒ **R'(x)=C'(x)** no lucro máximo.  
- Ex. 58(b) em **x=100**: **R'=300**, **C'=300**.

### Exercício 63 — Perímetro 12

- Entre triângulos de perímetro fixo, a **área máxima** é a do **equilátero** (simetria / Heron).  
  **lados 4,4,4**, **A=√3/4·16≈6,93**.

### Exercício 67 — Snell

- Tempo **T(x)=d₁/v₁+d₂/v₂** com **d₁=√(x²+a²)**, **d₂=√((L−x)²+b²)**.  
  `T'(x)=0` ⇒ **(x/d₁)/v₁ = ((L−x)/d₂)/v₂** (ângulos com a normal).  
  Equivalente a **sen θ₁/v₁ = sen θ₂/v₂**. Verificado com **A=(0,1)**, **B=(2,−1)**, **v₁=3**, **v₂=2**.

### Exercício 68 — Corda `θ₁=θ₂`

- **L(x)=√(x²+a²)+√((d−x)²+b²)**.  
  `L'(x)=0` ⇒ **x/a=(d−x)/b** (ângulos iguais com o solo) ⇒ **x=ad/(a+b)**.  
  **a=2, b=3, d=5** → **x=2**, **L=5√2**.

### Exercício 76 — Resistência

- **R(θ)=C[(a−b cot θ)/r₁⁴ + b csc θ/r₂⁴]**.  
  `R'(θ)=0` ⇒ **cos θ=(r₂/r₁)⁴** (forma do enunciado).  
- **r₂=(2/3)r₁** ⇒ **cos θ=16/81**, **θ≈78,6°** (~79°).

### Exercício 64 — Pipa (lados a, a, b, b)

- A figura só indica **a** e **b**. Com **ângulo de 90°** entre um lado **a** e um lado **b**, a área do losango/pipa é **A = ab** (máximo de **ab·sen θ** em **θ = π/2**).  
- Diagonal entre vértices **(a,a)** e **(b,b)**: **√(a²+b²)**.  
- Outra diagonal (travessa): **2ab/√(a²+b²)**.  
- Exemplo **a=5**, **b=12**: **A=60**, diagonais **13** e **120/13**.

### Exercício 65 — Cabos em P sobre AD

- **L(x)=x+√((5−x)²+4)+√((5−x)²+9)**, **x=AP**.  
  `L'(x)=1−(5−x)/√((5−x)²+4)−(5−x)/√((5−x)²+9)=0` (único **x∈(0,5)**).

### Exercício 66 — G=c/v (modelo ilustrativo)

- Sem dados numéricos no livro: **c(v)** aproximada no script.  
- **G(v)=c(v)/v**; mínimo de **G** ⇔ reta pela origem **tangente** à curva **c(v)** (condição **c'(v)=c(v)/v**).  
- Leitura gráfica do livro: **v*≈80 km/h**.

### Exercício 69 — Dobra de papel 30×20 cm

- Folha **30 cm (largura) × 20 cm (altura)**; canto **superior direito** dobrado até a **borda inferior**.  
- **x** = cateto vertical do triângulo dobrado (na borda direita); **y** = comprimento do vinco.  
- Geometria: **y² = x³/(x−10)**, **10 &lt; x ≤ 20**.  
- `d/dx (y²)=0` ⇒ **x=15**, **y=15√3 ≈ 25,98 cm**.

### Exercício 73 — Ângulo máximo (leitura da figura)

- **AB** é **vertical**, comprimento **3** (**A** em cima, **B** embaixo).  
- Distância **horizontal** até o ponto de vista: **5** na altura de **A** e **2** na altura de **B**.  
- **P** em **AB**, **x = |AP|** (medido de **A** para baixo), **0 ≤ x ≤ 3**.  
- Os catetos horizontais vistos de **P** são **x/5** (em direção a A) e **(3−x)/2** (em direção a B), logo  
  **θ(x)=arctan(x/5)+arctan((3−x)/2)**.  
- `θ'(x)=0` ⇒ **x = 5−2√5 ≈ 0,528** (a partir de **A**), **θ ≈ 57°**.
