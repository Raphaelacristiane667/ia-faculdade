// =============================================================================
// ex46.sce — Distancia ao quadrado minima: D^2 = 400*t^2 + 225*(t-1)^2.
// d(D^2)/dt = 800t + 450(t-1) = 0 => t = 0.36 h (14h 21min 36s).
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex46(x)
    tt = x(1)
    c = 400*tt^2 + 225*(tt - 1)^2
endfunction

[t_ag, D2_ag, hist46] = ag(f_ex46, 0, 1, "min", 50, 100, %f, "Ex. 46 — t otimo")

t_ana = 0.36
D2_ana = 400*t_ana^2 + 225*(t_ana - 1)^2
erro46 = abs(t_ag - t_ana)

disp("========================================")
disp("EXERCICIO 46 - Tempo t (distancia minima)")
disp("========================================")
disp("RESULTADO FINAL")
disp(["t (horas):" string(t_ag)])
disp(["D^2:" string(D2_ag)])
disp(" ")
disp("Valor analitico:")
disp(["t = 0.36 h = 14h 21min 36s"])
disp(["Erro em t:" string(erro46)])

RESUMO_ROTULO46 = "Tempo minimo"
RESUMO_EX46 = [t_ag, t_ana, erro46]
