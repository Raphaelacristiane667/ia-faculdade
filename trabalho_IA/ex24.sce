// ex24.sce — Retangulo inscrito na elipse x^2/9 + y^2/4 = 1 (a=3, b=2).
// y = 2*sqrt(1 - x^2/9). Area A = 4*x*y = 8*x*sqrt(1 - x^2/9).

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex24(x)
    xx = x(1)
    c = 8*xx*sqrt(1 - xx^2/9)
endfunction

[x_ag, A_ag, hist24] = ag(f_ex24, 0.01, 2.99, "max", 50, 100, %f, "Ex. 24 — Area maxima na elipse")

A_ana = 12
erro24 = abs(A_ag - A_ana)

disp("========================================")
disp("EXERCICIO 24 - Retangulo na elipse a=3, b=2")
disp("========================================")
disp("RESULTADO FINAL")
disp(["x (1o quadrante):" string(x_ag)])
disp(["Area maxima:" string(A_ag)])
disp(" ")
disp("Valor analitico:")
disp(["area = 2ab = 12"])
disp(["Erro:" string(erro24)])

RESUMO_ROTULO24 = "Area maxima"
RESUMO_EX24 = [A_ag, A_ana, erro24]
