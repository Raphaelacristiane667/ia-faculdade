// =============================================================================
// ex10.sce
// Stewart 4.7 — P = 100*I / (I^2 + I + 4), achar I que MAXIMIZA P.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then
    clear
    clc
end

if ~isdef("ag") then
    exec("ag_generico.sci", -1)
end

function c = f_ex10(x)
    I = x(1)
    c = 100 * I / (I^2 + I + 4)
endfunction

[I_ag, P_ag, hist10] = ag(f_ex10, 0.01, 20, "max", 50, 100, %f, "Ex. 10 — Maximo de P = 100 I/(I^2+I+4)")

// Numerador da derivada: 100 * (4 - I^2)
// P' = 0  =>  I^2 = 4  =>  I = 2 (I > 0)
// P = 100*2 / (4+2+4) = 200/10 = 20
I_ana = 2
P_ana = 20
erro10 = abs(P_ag - P_ana)

disp("========================================")
disp("EXERCICIO 10 - Maximizar P = 100 I/(I^2+I+4)")
disp("========================================")
disp("RESULTADO FINAL")
disp(["I:" string(I_ag)])
disp(["P maximo:" string(P_ag)])
disp(" ")
disp("Solucao analitica (derivada):")
disp(["I = 2, P = 20"])
disp(["Erro absoluto (P):" string(erro10)])

RESUMO_ROTULO10 = "P maximo"
RESUMO_EX10 = [P_ag, P_ana, erro10]
