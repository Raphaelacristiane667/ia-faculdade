// ex27.sce — Triangulo isosceles inscrito no circulo r=1, area MAXIMA.
// Vertice no topo (0,1), base em (sin(a), -cos(a)) e (-sin(a), -cos(a)).
// Area = sin(a)*(1 + cos(a)), 0 < a < pi.

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex27(x)
    aa = x(1)
    c = sin(aa)*(1 + cos(aa))
endfunction

[a_ag, A_ag, hist27] = ag(f_ex27, 0.01, %pi - 0.01, "max", 50, 100, %f, "Ex. 27 — Triangulo isosceles")

A_ana = 3*sqrt(3)/4
erro27 = abs(A_ag - A_ana)

disp("========================================")
disp("EXERCICIO 27 - Triangulo isosceles no circulo r=1")
disp("========================================")
disp("RESULTADO FINAL")
disp(["Parametro a (rad):" string(a_ag)])
disp(["Area maxima:" string(A_ag)])
disp(" ")
disp("Valor analitico:")
disp(["triangulo equilatero, area = 3*sqrt(3)/4 ~ 1.299"])
disp(["Erro:" string(erro27)])

RESUMO_ROTULO27 = "Area maxima"
RESUMO_EX27 = [A_ag, A_ana, erro27]
