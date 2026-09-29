// ex26.sce — Trapezio isosceles inscrito no circulo r=1, base inferior = diametro (2).
// Base superior 2a, altura h, com a^2 + h^2 = 1. Area = (a+1)*h.

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex26(x)
    aa = x(1)
    hh = sqrt(1 - aa^2)
    c = (aa + 1)*hh
endfunction

[a_ag, A_ag, hist26] = ag(f_ex26, 0.01, 0.99, "max", 50, 100, %f, "Ex. 26 — Area do trapezio")
h_ag = sqrt(1 - a_ag^2)

A_ana = 3*sqrt(3)/4
erro26 = abs(A_ag - A_ana)

disp("========================================")
disp("EXERCICIO 26 - Trapezio no circulo (base = diametro)")
disp("========================================")
disp("RESULTADO FINAL")
disp(["Semi-base superior a:" string(a_ag)])
disp(["Altura:" string(h_ag)])
disp(["Area maxima:" string(A_ag)])
disp(" ")
disp("Valor analitico:")
disp(["area = 3*sqrt(3)/4 ~ 1.299"])
disp(["Erro:" string(erro26)])

RESUMO_ROTULO26 = "Area do trapezio"
RESUMO_EX26 = [A_ag, A_ana, erro26]
