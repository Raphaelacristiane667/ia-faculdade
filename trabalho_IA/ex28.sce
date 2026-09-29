// ex28.sce — Retangulo em triangulo retangulo (catetos 3 e 4), lados nos catetos.
// Hipotenusa y = 4 - (4/3)*x. Area A = x*(4 - 4x/3).

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex28(x)
    xx = x(1)
    c = xx*(4 - 4*xx/3)
endfunction

[x_ag, A_ag, hist28] = ag(f_ex28, 0.01, 2.99, "max", 50, 100, %f, "Ex. 28 — Area no triangulo 3-4-5")
y_ag = 4 - 4*x_ag/3

x_ana = 1.5
y_ana = 2
A_ana = 3
erro28 = abs(A_ag - A_ana)

disp("========================================")
disp("EXERCICIO 28 - Retangulo no triangulo retangulo 3 e 4")
disp("========================================")
disp("RESULTADO FINAL")
disp(["Largura x:" string(x_ag)])
disp(["Altura y:" string(y_ag)])
disp(["Area maxima:" string(A_ag)])
disp(" ")
disp("Valor analitico:")
disp(["1.5 x 2, area = 3"])
disp(["Erro:" string(erro28)])

RESUMO_ROTULO28 = "Area maxima"
RESUMO_EX28 = [A_ag, A_ana, erro28]
