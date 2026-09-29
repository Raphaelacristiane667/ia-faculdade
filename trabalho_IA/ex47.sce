// =============================================================================
// ex47.sce — T(x) = sqrt(x^2+25)/6 + (5-x)/8, 0 <= x <= 5.
// T'(x)=0 => x ~ 5.67 (fora do dominio); minimo em x=5, T ~ 1.179 h.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex47(x)
    xx = x(1)
    c = sqrt(xx^2 + 25)/6 + (5 - xx)/8
endfunction

[x_ag, T_ag, hist47] = ag(f_ex47, 0, 5, "min", 50, 100, %f, "Ex. 47 — Tempo minimo")

x_ana = 5
T_ana = sqrt(50)/6
erro47 = abs(T_ag - T_ana)

disp("========================================")
disp("EXERCICIO 47 - Tempo de viagem T(x)")
disp("========================================")
disp("RESULTADO FINAL")
disp(["x otimo:" string(x_ag)])
disp(["T minimo (h):" string(T_ag)])
disp(" ")
disp("Valor analitico:")
disp(["x = 5, T = sqrt(50)/6 ~ 1.179 h"])
disp(["Erro:" string(erro47)])

RESUMO_ROTULO47 = "Tempo minimo"
RESUMO_EX47 = [T_ag, T_ana, erro47]
