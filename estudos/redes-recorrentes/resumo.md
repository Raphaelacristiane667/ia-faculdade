# Resumo para prova: Redes Recorrentes (RNN)
*Fonte: slides Prof. Paulo Martins Engel: Processamento Temporal por Redes Recorrentes Dirigidas Dinamicamente*

## O que é uma rede recorrente?
- MLP com **realimentação** (feedback) da saída ou neurônios ocultos para a entrada.
- A rede responde **temporalmente** ao sinal de entrada → saída dirigida dinamicamente.
- Realimentação permite representar **estado** e reduz exigências de memória.

## Arquiteturas principais

| Modelo | Descrição |
|--------|-----------|
| **NARX** (Modelo Recorrente de Entrada-Saída) | MLP + linha de atraso na saída; entradas exógenas u(n) + saídas atrasadas y(n) |
| **Espaço de Estados** | x(n+1) = Ax(n) + Bu(n), y(n) = Cx(n); útil quando se conhece a estrutura do sistema |
| **Rede de Elman (RRS)** | x(n+1) = F(x(n), u(n)), y(n) = G(x(n)); F e G não-lineares, **sem** banco de atrasos na saída |
| **RMLP** | Perceptron de Múltiplas Camadas Recorrente; cada camada tem realimentação própria |

### NARX em detalhes
- y(n+1) = F(y(n), …, y(k−q+1), u(n), …, u(n−q+1))
- **NARX para regressão** (aprendizado por imposição do professor): usa saídas reais do sistema, sem realimentação de erros.
- **Modelo NOE** (Nonlinear Output Error): usa predições passadas em vez de saídas medidas → rede recorrente "pura".

### Equivalência NARX ↔ Espaço de Estados
Se a rede recorrente é **observável**, o modelo NARX pode simular o espaço de estados.

## Algoritmos de Treinamento

### Redes estáticas (referência)
- Modo por lote e modo seqüencial.

### Redes recorrentes
- **Treinamento por época**: a rede parte de um estado inicial e é reinicializada a cada época.
- **Treinamento contínuo**: sem reinicialização; a rede aprende enquanto processa.
- **BPTT** (Backpropagation Through Time): principal algoritmo.
- **ARTR**: estimativa instantânea do gradiente.

## BPTT: Backpropagation Through Time
1. **"Desdobrar"** a rede no tempo: cada passo de tempo vira uma camada (pesos compartilhados = cópias).
2. Versão **por época**: intervalo (n₀, n₁); função de custo E_total = ½ Σ Σ eⱼ²(n).
3. Passo para frente: propagar o padrão temporal completo.
4. Passo para trás: calcular gradientes locais δⱼ(n) de n₁ até n₀.

### Fórmula do gradiente local, sem camada de saída
- n = n₁: δⱼ(n) = φ'(vⱼ(n)) · eⱼ(n)
- n₀ < n < n₁: δⱼ(n) = φ'(vⱼ(n)) · [eⱼ(n) + Σₖ wⱼₖ δₖ(n+1)]  ← **erro atual + erro no futuro**

### Ajuste dos pesos
Δwⱼᵢ = η Σ δⱼ(n) · xᵢ(n−1)  (somatório de n₀+1 até n₁)

## Rede de Elman: exemplo prático
- Usada no paper *"Finding Structure in Time"* (Elman, 1990).
- Tarefa: XOR seqüencial (reconhecer padrões temporais relativos).
- Resultado: erro de predição cai especialmente nas vogais (a, i, u); consoantes permanecem com erro maior.

## Previsão de série temporal
- Treinar a rede de Elman para prever x(n+1) a partir de x(n) e do estado atual.
- Exemplo: x(n) = sen(n + sen(n²)), sinal de freqüência modulada.
- Treinamento: 200 tempos; teste: 100 tempos (50 superpostos).
- Configuração usada: GDX, 1000 passos, 10 unidades ocultas; teste nos tempos 150 a 250. A saída obtida acompanha bem a desejada no treino e generaliza razoavelmente no teste.

## Pontos-chave para a prova
1. NARX = realimentação da **saída** (via linha de atraso); Elman = realimentação do **estado interno**.
2. BPTT desdobra a rede no tempo → pesos **compartilhados** entre as camadas desdobradas.
3. δⱼ(n) para n < n₁ inclui o **erro futuro** (Σ wⱼₖ δₖ(n+1)), diferença do BP padrão.
4. Modelo NOE (recorrente) ≠ NARX para regressão (não-recorrente na prática).
5. Espaço de estados linear: x(n+1) = Ax + Bu, y = Cx. Não-linear: F(·) substitui A e B.
