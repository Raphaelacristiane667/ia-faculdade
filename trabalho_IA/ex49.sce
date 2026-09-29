// =============================================================================
// ex49.sce — Custo C(x) = 400*x + 800*sqrt(4+(6-x)^2), 0<=x<=6 (milhares $).
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex49(x)
    xx = x(1)
    c = 400*xx + 800*sqrt(4 + (6 - xx)^2)
endfunction

[x_ag, C_ag, hist49] = ag(f_ex49, 0, 6, "min", 50, 100, %f, "Ex. 49 — Custo oleoduto")

x_ana = 4.845288452884529
C_ana = 400*x_ana + 800*sqrt(4 + (6 - x_ana)^2)
erro49 = abs(C_ag - C_ana)

disp("========================================")
disp("EXERCICIO 49 - Custo C(x)")
disp("========================================")
disp("RESULTADO FINAL")
disp(["x otimo:" string(x_ag)])
disp(["Custo minimo:" string(C_ag)])
disp(" ")
disp("Valor analitico:")
disp(["x ~ 4.845, C ~ 3785.6"])
disp(["Erro:" string(erro49)])

RESUMO_ROTULO49 = "Custo minimo"
RESUMO_EX49 = [C_ag, C_ana, erro49]
