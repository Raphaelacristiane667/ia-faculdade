// Atividade 3 — LVQ (Learning Vector Quantization)
// Classificação de animais: mamífero, anfíbio, réptil

clear;
clc;

// =============================================
// DADOS
// =============================================

// entradas:
// 1 = 4 patas
// 2 = 2 patas
// 3 = pelo
// 4 = alimentação
// 5 = habitat

dados=[
1 0 1 3 1;   // cachorro
1 0 1 1 1;   // gato
1 0 1 2 1;   // vaca
1 0 1 2 1;   // cavalo
1 0 0 1 2;   // sapo
1 0 0 3 2;   // tartaruga
0 0 0 1 1;   // cobra
1 0 1 2 1;   // coelho
1 0 1 1 2    // ornitorrinco
];

// classes:
// 1 = mamífero
// 2 = anfíbio
// 3 = réptil

classe=[
1;
1;
1;
1;
2;
3;
3;
1;
1
];

nomes=[
"cachorro";
"gato";
"vaca";
"cavalo";
"sapo";
"tartaruga";
"cobra";
"coelho";
"ornitorrinco"
];

// =============================================
// CONFIGURAÇÃO
// =============================================

na=size(dados,1);
ne=size(dados,2);
nc=3;

n=0.1;

// =============================================
// PESOS ALEATÓRIOS
// =============================================

w=[];

for i=1:ne

    for j=1:nc

        w(i,j)=rand();

    end

end

// =============================================
// TREINAMENTO LVQ
// =============================================

for epoca=1:500

    for am=1:na

        xn=dados(am,:);

        dist=[];

        // -----------------------------
        // calcula distância
        // -----------------------------

        for j=1:nc

            soma=0;

            for i=1:ne

                soma=soma+(w(i,j)-xn(i))^2;

            end

            dist(j)=sqrt(soma);

        end

        // -----------------------------
        // encontra menor distância
        // -----------------------------

        menor=min(dist);

        endmenor=1;

        for j=1:nc

            if dist(j)<=menor then

                endmenor=j;

            end

        end

        // -----------------------------
        // aprendizagem LVQ
        // -----------------------------

        if endmenor==classe(am) then

            // acertou: aproxima

            for i=1:ne

                w(i,endmenor)=w(i,endmenor)+...
                n*(xn(i)-w(i,endmenor));

            end

        else

            // errou: afasta

            for i=1:ne

                w(i,endmenor)=w(i,endmenor)-...
                n*(xn(i)-w(i,endmenor));

            end

        end

    end

    n=n*0.99;

end

// =============================================
// TESTE DA REDE
// =============================================

for am=1:na

    xn=dados(am,:);

    dist=[];

    for j=1:nc

        soma=0;

        for i=1:ne

            soma=soma+(w(i,j)-xn(i))^2;

        end

        dist(j)=sqrt(soma);

    end

    menor=min(dist);

    vencedor=1;

    for j=1:nc

        if dist(j)<=menor then

            vencedor=j;

        end

    end

    mprintf("%s -> classe %d\n",nomes(am),vencedor);

end
