// =============================================================================
// ex56.sce — Triangulo no 1o quadrante tangente a y = 4 - x^2 em x = a > 0.
// Area A(a) = (a^2 + 4)^2 / (4*a). Minimo: a = 2/sqrt(3), A = 32*sqrt(3)/9.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex56(x)
    aa = x(1)
    c = (aa^2 + 4)^2/(4*aa)
endfunction

[a_ag, A_ag, hist56] = ag(f_ex56, 0.2, 3, "min", 50, 100, %f, "Ex. 56 — Area minima")

a_ana = 2/sqrt(3)
A_ana = 32*sqrt(3)/9
erro56 = abs(A_ag - A_ana)

disp("========================================")
disp("EXERCICIO 56 - Triangulo tangente a parabola")
disp("========================================")
disp("RESULTADO FINAL")
disp(["a:" string(a_ag)])
disp(["Area minima:" string(A_ag)])
disp(" ")
disp("Valor analitico:")
disp(["a = 2/sqrt(3) ~ 1.155, area = 32*sqrt(3)/9 ~ 6.158"])
disp(["Erro:" string(erro56)])

RESUMO_ROTULO56 = "Area maxima"
RESUMO_EX56 = [A_ag, A_ana, erro56]
