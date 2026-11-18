// ==========================================================
// REDE NEURAL RECORRENTE (RNN) PARA TEXTO - SCILAB
// Transforma uma frase em numeros entre -1 e 1 (estado oculto
// com tanh), escolhe uma resposta e mostra o peso da resposta.
// ==========================================================
clc;
clear;
rand("seed", 0);   // resultados iguais a cada execucao

// ---------- 1. VOCABULARIO, RESPOSTAS E FRASES DE TREINO ----------
vocab = ["oi", "ola", "tudo", "bem", "qual", "seu", "nome", "tchau", "adeus", "amor"];

respostas = ["Ola, como posso ajudar?", ..
             "Estou bem, e voce?", ..
             "Meu nome e ScilabBot.", ..
             "Ate logo!", ..
             "Amor tambem!"];

// frase de treino e o numero da resposta certa para ela
frases_treino = ["oi", "ola", "tudo bem", "oi tudo bem", "bem", ..
                 "qual seu nome", "seu nome", "nome", "tchau", "adeus", "amor"];
alvos = [1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 5];

// ---------- 2. PARAMETROS DA REDE ----------
V = size(vocab, "*");       // tamanho do vocabulario (entrada)
S = size(respostas, "*");   // quantidade de respostas (saida)
H = 8;                      // neuronios da camada oculta (recorrente)
taxa = 0.1;                 // taxa de aprendizado
epocas = 500;

Wxh = 0.1 * rand(H, V, "normal");   // entrada -> oculta
Whh = 0.1 * rand(H, H, "normal");   // oculta -> oculta (recorrencia)
Why = 0.1 * rand(S, H, "normal");   // oculta -> saida
bh = zeros(H, 1);
by = zeros(S, 1);

// ---------- 3. FUNCOES ----------
function y = softmax(x)
    ex = exp(x - max(x));
    y = ex / sum(ex);
endfunction

// Converte o texto em uma lista de indices do vocabulario
// (palavras desconhecidas e pontuacao sao ignoradas)
function ids = texto_para_ids(texto, voc)
    texto = convstr(texto, "l");
    texto = strsubst(texto, "?", "");
    texto = strsubst(texto, "!", "");
    texto = strsubst(texto, ",", "");
    texto = strsubst(texto, ".", "");
    partes = tokens(texto, " ");          // separa as palavras
    ids = [];
    for i = 1:size(partes, "*")           // "*" conta todas as palavras
        for j = 1:size(voc, "*")
            if voc(j) == partes(i) then
                ids = [ids, j];
            end
        end
    end
endfunction

// Passa a frase pela RNN, palavra por palavra.
// hs(:, t+1) guarda o estado oculto depois da palavra t.
// Como usa tanh, todos os valores ficam entre -1 e 1.
function hs = rnn_frente(ids, Wxh, Whh, bh)
    T = size(ids, "*");
    nh = size(Whh, 1);
    hs = zeros(nh, T + 1);
    for t = 1:T
        x = zeros(size(Wxh, 2), 1);
        x(ids(t)) = 1;                    // one-hot da palavra
        hs(:, t + 1) = tanh(Wxh * x + Whh * hs(:, t) + bh);
    end
endfunction

// ---------- 4. TREINAMENTO (retropropagacao no tempo - BPTT) ----------
printf("Treinando a RNN...\n");
for ep = 1:epocas
    perda = 0;
    for k = 1:size(frases_treino, "*")
        ids = texto_para_ids(frases_treino(k), vocab);
        T = size(ids, "*");
        alvo = alvos(k);

        // ida
        hs = rnn_frente(ids, Wxh, Whh, bh);
        h = hs(:, T + 1);
        p = softmax(Why * h + by);
        perda = perda - log(p(alvo));

        // volta
        dy = p;
        dy(alvo) = dy(alvo) - 1;
        dWhy = dy * h';
        dby = dy;
        dh = Why' * dy;
        dWxh = zeros(H, V); dWhh = zeros(H, H); dbh = zeros(H, 1);
        for t = T:-1:1
            d = (1 - hs(:, t + 1) .^ 2) .* dh;   // derivada da tanh
            x = zeros(V, 1);
            x(ids(t)) = 1;
            dWxh = dWxh + d * x';
            dWhh = dWhh + d * hs(:, t)';
            dbh = dbh + d;
            dh = Whh' * d;
        end

        // atualiza os pesos
        Wxh = Wxh - taxa * dWxh;
        Whh = Whh - taxa * dWhh;
        Why = Why - taxa * dWhy;
        bh = bh - taxa * dbh;
        by = by - taxa * dby;
    end
    if modulo(ep, 100) == 0 then
        printf("Epoca %d - erro: %.4f\n", ep, perda);
    end
end
printf("Treino concluido.\n\n");

// ---------- 5. CONVERSA ----------
printf("--- SISTEMA RNN INICIADO ---\n");
printf("Digite sair para encerrar.\n\n");

while %t
    entrada = input("Digite uma palavra ou frase: ", "string");
    if convstr(entrada, "l") == "sair" then
        printf("Encerrando...\n");
        break;
    end

    ids = texto_para_ids(entrada, vocab);

    printf("\n--- RESULTADO ---\n");
    printf("Voce digitou: %s\n", entrada);

    if size(ids, "*") == 0 then
        printf("Resposta: Desculpe, nao conheco essas palavras.\n");
        printf("Peso da resposta: -1.0000\n");
    else
        hs = rnn_frente(ids, Wxh, Whh, bh);
        h = hs(:, $);                     // texto convertido em numeros [-1, 1]
        p = softmax(Why * h + by);
        [prob_max, melhor] = max(p);
        peso = 2 * prob_max - 1;          // confianca levada de [0,1] para [-1,1]

        vetor = "";
        for i = 1:H
            vetor = vetor + msprintf("%.3f ", h(i));
        end
        printf("Texto em numeros (-1 a 1): [ %s]\n", vetor);
        printf("Resposta: %s\n", respostas(melhor));
        printf("Peso da resposta: %.4f\n", peso);
    end
    printf("-----------------\n\n");
end
