// Atividade 2 — PMC (Perceptron Multicamadas)
// Arquitetura: 3 entradas → 2 neurônios escondidos → 2 saídas

clear
clc

dados=[-1 0 0 0 0
       -1 0 1 0 1
       -1 1 0 0 1
       -1 1 1 1 0];

n=0.6;
nn=2;
ns=2;
ne=3;

we=[];
for i=1:ne
    for j=1:nn
        we(i,j)=rand();
    end
end

ws=[];
for i=1:nn+1
    for j=1:ns
        ws(i,j)=rand();
    end
end

na=size(dados,1);

for epoca=1:100

    for am=1:na

        xn=dados(am,1:ne);
        tg=dados(am,ne+1:ne+ns);

        yn=xn*we;

        // função de ativação da camada escondida
        for i=1:nn
            yn(i)=1/(1+exp(-yn(i)));
        end

        // derivada da função sigmoide
        ynd=[];
        for i=1:nn
            ynd(i)=yn(i)*(1-yn(i));
        end

        ynd=ynd';

        // acrescentando bias
        ynb=[-1 yn];

        // camada de saída
        ys=ynb*ws;

        // função de ativação da saída
        for i=1:ns
            ys(i)=1/(1+exp(-ys(i)));
        end

        // derivada da saída
        ysd=[];
        for i=1:ns
            ysd(i)=ys(i)*(1-ys(i));
        end

        ysd=ysd';

        // erro
        Do=tg-ys;

        // propagação do erro
        D1=Do*ws(2:nn+1,:)';

        // ajuste dos pesos da camada de saída
        wsd=[-1 yn]'*(n*(ysd.*Do));

        ws=ws+wsd;

        // ajuste dos pesos da camada escondida
        wed=xn'*(n*(ynd.*D1));

        we=we+wed;

        yplot(am,:)=ys;

    end

end

disp(yplot)
