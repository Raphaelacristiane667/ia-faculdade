// =============================================================================
// ex48.sce — Lago raio 3 km: caminha 6 km/h, rema 3 km/h.
// Parametro theta in [0,pi]: caminha arco (pi-theta)*3, rema 2*3*sin(theta/2).
// T(theta) = (pi-theta)/2 + 2*sin(theta/2); minimo em theta=0 => T = pi/2 h.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex48(x)
    th = x(1)
    c = (%pi - th)/2 + 2*sin(th/2)
endfunction

[th_ag, T_ag, hist48] = ag(f_ex48, 0, %pi, "min", 50, 100, %f, "Ex. 48 — Tempo minimo")

T_ana = %pi/2
erro48 = abs(T_ag - T_ana)

disp("========================================")
disp("EXERCICIO 48 - Lago (caminhar + remar)")
disp("========================================")
disp("RESULTADO FINAL")
disp(["theta otimo (rad):" string(th_ag)])
disp(["Tempo minimo (h):" string(T_ag)])
disp(" ")
disp("Valor analitico:")
disp(["caminhar semicircunferencia, T = pi/2 ~ 1.571 h"])
disp(["Erro:" string(erro48)])

RESUMO_ROTULO48 = "Tempo minimo"
RESUMO_EX48 = [T_ag, T_ana, erro48]
