// =============================================================================
// ex09.sce
// Stewart 4.7 — Y = k*N / (1 + N^2), achar N que MAXIMIZA Y.
// Usamos k = 1, então Y = N / (1 + N^2). N > 0.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then
    clear
    clc
end

if ~isdef("ag") then
    exec("ag_generico.sci", -1)
end

k = 1

function c = f_ex09(x)
    N = x(1)
    c = 1 * N / (1 + N^2)   // k = 1
endfunction

[N_ag, Y_ag, hist09] = ag(f_ex09, 0.01, 10, "max", 50, 100, %f, "Ex. 9 — Maximo de Y = kN/(1+N^2)")

// Y = k N / (1+N^2)
// Y' = k (1 - N^2) / (1+N^2)^2 = 0  =>  N = 1 (N > 0)
// Y = k/2 = 0.5
N_ana = 1
Y_ana = k / 2
erro09 = abs(Y_ag - Y_ana)

disp("========================================")
disp("EXERCICIO 9 - Maximizar Y = kN/(1+N^2), k=1")
disp("========================================")
disp("RESULTADO FINAL")
disp(["N:" string(N_ag)])
disp(["Y maximo:" string(Y_ag)])
disp(" ")
disp("Solucao analitica (derivada):")
disp(["N = 1, Y = k/2 = 0.5"])
disp(["Erro absoluto (Y):" string(erro09)])

RESUMO_ROTULO09 = "Valor maximo de Y"
RESUMO_EX09 = [Y_ag, Y_ana, erro09]
