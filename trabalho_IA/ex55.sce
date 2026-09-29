// =============================================================================
// ex55.sce — Tangente a y = 3/x no 1o quadrante em (a, 3/a).
// Interceptos (2a, 0) e (0, 6/a). L^2 = 4*a^2 + 36/a^2.
// Minimo: a^4 = 9 => a = sqrt(3), L = 2*sqrt(6).
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex55(x)
    aa = x(1)
    c = sqrt(4*aa^2 + 36/aa^2)
endfunction

[a_ag, L_ag, hist55] = ag(f_ex55, 0.5, 5, "min", 50, 100, %f, "Ex. 55 — Comprimento minimo")

a_ana = sqrt(3)
L_ana = 2*sqrt(6)
erro55 = abs(L_ag - L_ana)

disp("========================================")
disp("EXERCICIO 55 - Segmento tangente a y=3/x")
disp("========================================")
disp("RESULTADO FINAL")
disp(["a:" string(a_ag)])
disp(["Comprimento L:" string(L_ag)])
disp(" ")
disp("Valor analitico:")
disp(["a = sqrt(3), L = 2*sqrt(6) ~ 4.899"])
disp(["Erro:" string(erro55)])

RESUMO_ROTULO55 = "Comprimento min."
RESUMO_EX55 = [L_ag, L_ana, erro55]
