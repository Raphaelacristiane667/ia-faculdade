// Atividade 5 — Algoritmo genético
// Otimiza as dimensões de um aquário (volume alvo ≈ 100.000 cm³)

clear;
clc;

npop = 10;
rmin = 10;
rmax = 100;

pop = rand(npop,3)*(rmax-rmin)+rmin;
melhor = [];
menor = %inf;

for epoca = 1:1000

    // Calcula o erro de cada aquário
    for i = 1:npop
        volume = pop(i,1)*pop(i,2)*pop(i,3);
        custo(i) = abs(100000-volume);
    end

    // Guarda o melhor
    [valor,pos] = min(custo);

    if valor < menor then
        menor = valor;
        melhor = pop(pos,:);
    end

    // Reprodução
    for i = 1:npop
        p1 = grand(1,1,"uin",1,npop);
        p2 = grand(1,1,"uin",1,npop);

        pop(i,:) = (pop(p1,:) + pop(p2,:))/2;

        // Mutação
        if rand() < 0.05 then
            pop(i,:) = pop(i,:) + rand(1,3)*10-5;
        end
    end
end

mprintf("Comprimento: %.2f cm\n", melhor(1));
mprintf("Largura: %.2f cm\n", melhor(2));
mprintf("Altura: %.2f cm\n", melhor(3));
mprintf("Volume: %.2f litros\n", ...
    melhor(1)*melhor(2)*melhor(3)/1000);
