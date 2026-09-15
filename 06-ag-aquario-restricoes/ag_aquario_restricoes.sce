// Atividade 6 — Algoritmo genético com restrições
// Aquário: volume ≈ 100.000 cm³ e comprimento ≈ 2,5 × altura

clear;
clc;


npop = 50;
nvars = 3;
epocas = 2000;


minimo = [60 30 25];
maximo = [100 50 40];

pop = zeros(npop, nvars);

for i = 1:npop
    for j = 1:nvars
        pop(i,j) = minimo(j) + rand() * (maximo(j) - minimo(j));
    end
end

melhor = zeros(1,nvars);
menor = %inf;


for epoca = 1:epocas

    custo = zeros(npop,1);

    for i = 1:npop

        comprimento = pop(i,1);
        largura = pop(i,2);
        altura = pop(i,3);

        volume = comprimento * largura * altura;


        erro = abs(100000 - volume);


        proporcao = abs(comprimento/altura - 2.5);

        custo(i) = erro + proporcao * 1000;

        if custo(i) < menor then
            menor = custo(i);
            melhor = pop(i,:);
        end
    end


    nova_pop = zeros(npop,nvars);

    for i = 1:npop

        t1 = grand(1,1,"uin",1,npop);
        t2 = grand(1,1,"uin",1,npop);

        while t1 == t2
            t2 = grand(1,1,"uin",1,npop);
        end

        if custo(t1) < custo(t2) then
            nova_pop(i,:) = pop(t1,:);
        else
            nova_pop(i,:) = pop(t2,:);
        end
    end


    filhos = nova_pop;

    for i = 1:2:npop-1

        u = rand();

        if u <= 0.5 then
            beta = sqrt(2*u);
        else
            beta = sqrt(1/(2*(1-u)));
        end

        for j = 1:nvars

            c1 = 0.5 * ((1-beta)*nova_pop(i,j) + ...
                        (1+beta)*nova_pop(i+1,j));

            c2 = 0.5 * ((1+beta)*nova_pop(i,j) + ...
                        (1-beta)*nova_pop(i+1,j));

            filhos(i,j) = max(minimo(j), min(maximo(j),c1));
            filhos(i+1,j) = max(minimo(j), min(maximo(j),c2));

        end
    end

    for i = 1:npop

        if rand() < 0.05 then

            j = grand(1,1,"uin",1,nvars);

            filhos(i,j) = minimo(j) + ...
                          rand() * (maximo(j) - minimo(j));

        end
    end

    pop = filhos;


    pos = grand(1,1,"uin",1,npop);
    pop(pos,:) = melhor;

end


vol_final = melhor(1) * melhor(2) * melhor(3);
erro_final = abs(100000 - vol_final);

mprintf("\n--- MELHOR AQUARIO ENCONTRADO ---\n");

mprintf("Comprimento: %.2f cm\n", melhor(1));
mprintf("Largura: %.2f cm\n", melhor(2));
mprintf("Altura: %.2f cm\n", melhor(3));

mprintf("Volume: %.2f cm³\n", vol_final);
mprintf("Volume: %.2f litros\n", vol_final/1000);

mprintf("Erro: %.2f cm³\n", erro_final);
