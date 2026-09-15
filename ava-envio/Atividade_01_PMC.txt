// Atividade 1 — PMC (Perceptron Multicamadas)
// Arquitetura: 3 entradas → 10 neurônios escondidos → 1 saída
// PMC David Xor

clear
clc
yplot=[];
//PMC David Xor;
dados=[-1 0 0 0.1
       -1 0 1 0.2
       -1 1 0 0.3
       -1 1 1 0.4];
n=0.6;
ne=3;
na=size(dados,1);
nn=10;
we=[];
for i=1:ne
    for j=1:nn
      we(i,j)=rand();
    end
end
ws=[];
for i=1:nn+1
    ws(i)=rand();
end

for epoca=1:10000
for am=1:na
x=dados(am,1:ne);
tg=dados(am,ne+1);
y=x*we;
//função de ativação
for i=1:nn
 y(i)=1/(1+exp(-y(i)));
end
//função derivada
yd=[];
for i=1:nn
 yd(i)=y(i)*(1-y(i));
end
yd=yd'
yn=[-1 y];
ys=yn*ws;
ys=1/(1+exp(-ys));
ysd=ys*(1-ys);
//erro
erro=tg-ys;
//ensinando camada de saída
wsd=(n*erro*ysd)*yn;
wsd=wsd';
ws=ws+wsd;
//propagar (delta)
Do=erro*ws(2:nn+1);
Do=Do';
wed=x'*(n*(Do.*yd))
we=we+wed;
yplot(am)=ys
end
//plot(1:4,dados(:,4),1:4,yplot)
disp(yplot)
end
