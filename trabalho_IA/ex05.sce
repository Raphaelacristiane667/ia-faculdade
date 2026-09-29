// =============================================================================
// ex05.sce
// Stewart 4.7 — Distância vertical MÁXIMA entre y = x+2 e y = x^2,
// com -1 <= x <= 2.
// d(x) = (x+2) - x^2   (a reta fica acima da parábola nesse intervalo)
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then
    clear
    clc
end

if ~isdef("ag") then
    exec("ag_generico.sci", -1)
end

function c = f_ex05(x)
    xx = x(1)
    c = (xx + 2) - xx^2
endfunction

[x_ag, d_ag, hist05] = ag(f_ex05, -1, 2, "max", 50, 100, %f, "Ex. 5 — Distancia vertical maxima")

// d(x) = -x^2 + x + 2
// d'(x) = -2x + 1 = 0  =>  x = 1/2 = 0.5
// d(0.5) = 0.5 + 2 - 0.25 = 2.25
x_ana = 0.5
d_ana = 2.25
erro05 = abs(d_ag - d_ana)

disp("========================================")
disp("EXERCICIO 5 - Distancia vertical MAXIMA (reta e parabola)")
disp("========================================")
disp("RESULTADO FINAL")
disp(["x:" string(x_ag)])
disp(["Distancia maxima:" string(d_ag)])
disp(" ")
disp("Solucao analitica (derivada):")
disp(["x = 0.5, distancia = 2.25"])
disp(["Erro absoluto (distancia):" string(erro05)])

RESUMO_ROTULO05 = "Distancia maxima"
RESUMO_EX05 = [d_ag, d_ana, erro05]
