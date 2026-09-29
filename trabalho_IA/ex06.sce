// =============================================================================
// ex06.sce
// Stewart 4.7 — Distância vertical MÍNIMA entre y = x^2+1 e y = x-x^2.
// d(x) = (x^2+1) - (x-x^2) = 2x^2 - x + 1
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then
    clear
    clc
end

if ~isdef("ag") then
    exec("ag_generico.sci", -1)
end

function c = f_ex06(x)
    xx = x(1)
    c = 2*xx^2 - xx + 1
endfunction

[x_ag, d_ag, hist06] = ag(f_ex06, -2, 2, "min", 50, 100, %f, "Ex. 6 — Distancia vertical minima")

// d'(x) = 4x - 1 = 0  =>  x = 0.25
// d(0.25) = 2*(0.0625) - 0.25 + 1 = 0.875 = 7/8
x_ana = 0.25
d_ana = 0.875
erro06 = abs(d_ag - d_ana)

disp("========================================")
disp("EXERCICIO 6 - Distancia vertical MINIMA (duas parabolas)")
disp("========================================")
disp("RESULTADO FINAL")
disp(["x:" string(x_ag)])
disp(["Distancia minima:" string(d_ag)])
disp(" ")
disp("Solucao analitica (derivada):")
disp(["x = 0.25, distancia = 0.875 (7/8)"])
disp(["Erro absoluto (distancia):" string(erro06)])

RESUMO_ROTULO06 = "Distancia minima"
RESUMO_EX06 = [d_ag, d_ana, erro06]
