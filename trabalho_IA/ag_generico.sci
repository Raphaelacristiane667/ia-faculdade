// =============================================================================
// ag_generico.sci
// Algoritmo Genético genérico para os problemas de otimização (Stewart 4.7)
// Representação REAL (padrão) ou INTEIRA.
// Compatível com Scilab 5.5 / 6 (sem funções de MATLAB/Octave).
//
// trabalho_IA/
//   ag_generico.sci
//   ex01.sce ... ex78.sce
//   main.sce
//   explicacoes.md
//   OBSERVACOES.md
//   resultados.txt
// =============================================================================

// -----------------------------------------------------------------------------
// ag_randn
// Sorteia um número da distribuição Normal(0, 1) pelo método de Box-Muller.
// Usa apenas rand(), para a semente rand("seed", 1) controlar TUDO.
// -----------------------------------------------------------------------------
function z = ag_randn()
    // Dois uniformes em (0, 1]; evita log(0)
    u1 = rand()
    u2 = rand()
    if u1 < 1e-12 then
        u1 = 1e-12
    end
    z = sqrt(-2 * log(u1)) * cos(2 * %pi * u2)
endfunction

// -----------------------------------------------------------------------------
// ag_torneio
// Seleção por torneio de 2 indivíduos.
// Escolhemos torneio (e não roleta) porque o custo pode ser NEGATIVO
// (ex.: produto mínimo = -2500). A roleta quebraria com valores negativos.
// -----------------------------------------------------------------------------
function ind = ag_torneio(custo, tipo, npop)
    a = floor(rand() * npop) + 1
    b = floor(rand() * npop) + 1

    if tipo == "max" then
        // maximizar: fica o de MAIOR custo
        if custo(a) >= custo(b) then
            ind = a
        else
            ind = b
        end
    else
        // minimizar: fica o de MENOR custo
        if custo(a) <= custo(b) then
            ind = a
        else
            ind = b
        end
    end
endfunction

// -----------------------------------------------------------------------------
// ag_melhor_que
// Compara dois custos de acordo com o tipo (max / min).
// -----------------------------------------------------------------------------
function ok = ag_melhor_que(c_novo, c_velho, tipo)
    if tipo == "max" then
        ok = (c_novo >= c_velho)
    else
        ok = (c_novo <= c_velho)
    end
endfunction

// -----------------------------------------------------------------------------
// ag_recorte
// Garante que cada variável fique dentro de [lim_inf, lim_sup].
// -----------------------------------------------------------------------------
function x = ag_recorte(x, lim_inf, lim_sup, nvars)
    for v = 1:nvars
        if x(v) < lim_inf(v) then
            x(v) = lim_inf(v)
        end
        if x(v) > lim_sup(v) then
            x(v) = lim_sup(v)
        end
    end
endfunction

// -----------------------------------------------------------------------------
// ag
// Função principal do Algoritmo Genético.
//
// Entrada:
//   f_custo  - função objetivo: c = f_custo(x), x é vetor linha 1 x nvars
//   lim_inf  - limite inferior (escalar ou vetor)
//   lim_sup  - limite superior (escalar ou vetor)
//   tipo     - "max" ou "min"
//   npop     - tamanho da população          (padrão 50)
//   nger     - número de gerações            (padrão 100)
//   inteiro  - %t representação inteira, %f real (padrão %f)
//   titulo   - título do gráfico de convergência
//
// Saída:
//   melhor_x     - melhor indivíduo (variáveis de decisão)
//   melhor_custo - valor da função objetivo desse indivíduo
//   hist         - melhor custo de cada geração (para o gráfico)
// -----------------------------------------------------------------------------
function [melhor_x, melhor_custo, hist] = ag(f_custo, lim_inf, lim_sup, tipo, npop, nger, inteiro, titulo)

    // ----- argumentos opcionais (Scilab: argn) -----
    [lhs, rhs] = argn(0)
    if rhs < 5 then
        npop = 50
    end
    if rhs < 6 then
        nger = 100
    end
    if rhs < 7 then
        inteiro = %f
    end
    if rhs < 8 then
        titulo = "Convergencia do AG"
    end

    if tipo <> "max" & tipo <> "min" then
        error("ag: tipo deve ser ""max"" ou ""min""")
    end

    // ----- parâmetros do AG (fixos e fáceis de explicar) -----
    taxa_cruz = 0.8   // probabilidade de cruzamento aritmético
    taxa_mut  = 0.1   // probabilidade de mutação gaussiana por variável

    // ----- semente fixa: o mesmo resultado em qualquer computador -----
    rand("seed", 1)

    // ----- número de variáveis -----
    lim_inf = lim_inf(:)'
    lim_sup = lim_sup(:)'
    nvars = length(lim_inf)
    if length(lim_sup) <> nvars then
        error("ag: lim_inf e lim_sup devem ter o mesmo tamanho")
    end

    // desvio da mutação: 10% da amplitude de cada variável
    sigma = 0.1 * (lim_sup - lim_inf)

    // -------------------------------------------------------------------------
    // 1) POPULAÇÃO INICIAL aleatória dentro dos limites
    // -------------------------------------------------------------------------
    pop = zeros(npop, nvars)
    for i = 1:npop
        for v = 1:nvars
            pop(i, v) = lim_inf(v) + rand() * (lim_sup(v) - lim_inf(v))
            if inteiro then
                pop(i, v) = round(pop(i, v))
            end
        end
        pop(i, :) = ag_recorte(pop(i, :), lim_inf, lim_sup, nvars)
    end

    // elitismo: guarda o melhor de TODAS as gerações
    hist = zeros(nger, 1)
    melhor_x = pop(1, :)
    melhor_custo = f_custo(melhor_x)

    // -------------------------------------------------------------------------
    // 2) LOOP DAS GERAÇÕES
    // -------------------------------------------------------------------------
    for g = 1:nger

        // ----- 2.1 AVALIAÇÃO: custo de cada indivíduo -----
        custo = zeros(npop, 1)
        for i = 1:npop
            custo(i) = f_custo(pop(i, :))
        end

        // ----- 2.2 ELITISMO: atualiza o melhor global -----
        if tipo == "max" then
            [c_ger, pos] = max(custo)
        else
            [c_ger, pos] = min(custo)
        end

        if g == 1 then
            melhor_custo = c_ger
            melhor_x = pop(pos, :)
        elseif ag_melhor_que(c_ger, melhor_custo, tipo) then
            melhor_custo = c_ger
            melhor_x = pop(pos, :)
        end
        hist(g) = melhor_custo

        // última geração: não precisa gerar filhos
        if g == nger then
            break
        end

        // ----- 2.3 NOVA POPULAÇÃO -----
        nova = zeros(npop, nvars)

        // o primeiro lugar é do elite (nunca perde o melhor)
        nova(1, :) = melhor_x

        for i = 2:npop

            // ----- SELEÇÃO por torneio -----
            i1 = ag_torneio(custo, tipo, npop)
            i2 = ag_torneio(custo, tipo, npop)
            p1 = pop(i1, :)
            p2 = pop(i2, :)

            // ----- CRUZAMENTO ARITMÉTICO -----
            // filho = alfa*p1 + (1-alfa)*p2, com alfa em [0, 1]
            // (média ponderada dos pais; para reais funciona muito bem)
            if rand() <= taxa_cruz then
                alfa = rand()
                filho = alfa * p1 + (1 - alfa) * p2
            else
                filho = p1
            end

            // ----- MUTAÇÃO GAUSSIANA (não uniforme) -----
            // Soma ruído Normal(0, sig). O desvio DIMINUI com as gerações:
            // no começo o AG explora; no fim ele afina o valor.
            // Isso evita "pular" longe da solução nos problemas com intervalo grande
            // (ex.: retângulo de área 1000, L entre 1 e 1000).
            for v = 1:nvars
                if rand() <= taxa_mut then
                    sig_g = sigma(v) * (1 - (g - 1) / nger)
                    if sig_g < 1e-8 then
                        sig_g = 1e-8
                    end
                    filho(v) = filho(v) + ag_randn() * sig_g
                end
            end

            // representação inteira: arredonda depois do cruzamento/mutação
            if inteiro then
                for v = 1:nvars
                    filho(v) = round(filho(v))
                end
            end

            filho = ag_recorte(filho, lim_inf, lim_sup, nvars)
            nova(i, :) = filho
        end

        pop = nova
    end

    // -------------------------------------------------------------------------
    // 3) GRÁFICO DE CONVERGÊNCIA
    // -------------------------------------------------------------------------
    scf()
    clf()
    plot(1:nger, hist)
    xtitle(titulo, "Geracao", "Melhor valor encontrado")
    xgrid()

endfunction
