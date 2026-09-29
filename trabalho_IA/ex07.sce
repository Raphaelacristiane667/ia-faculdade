// =============================================================================
// ex07.sce
// Stewart 4.7 — Retângulo de perímetro 100 com área MÁXIMA.
// 2(L + W) = 100  =>  L + W = 50  =>  W = 50 - L
// A(L) = L*(50-L)
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then
    clear
    clc
end

if ~isdef("ag") then
    exec("ag_generico.sci", -1)
end

function c = f_ex07(x)
    L = x(1)
    W = 50 - L
    c = L * W
endfunction

// lados positivos: L em (0, 50)
[L_ag, area_ag, hist07] = ag(f_ex07, 0.01, 49.99, "max", 50, 100, %f, "Ex. 7 — Area maxima do retangulo")
W_ag = 50 - L_ag

// A(L) = 50L - L^2
// A'(L) = 50 - 2L = 0  =>  L = 25, W = 25
// A = 625  (quadrado)
L_ana = 25
W_ana = 25
area_ana = 625
erro07 = abs(area_ag - area_ana)

disp("========================================")
disp("EXERCICIO 7 - Perimetro 100, area MAXIMA")
disp("========================================")
disp("RESULTADO FINAL")
disp(["Comprimento:" string(L_ag)])
disp(["Largura:" string(W_ag)])
disp(["Area maxima:" string(area_ag)])
disp(" ")
disp("Solucao analitica (derivada):")
disp(["25 x 25, area = 625"])
disp(["Erro absoluto (area):" string(erro07)])

RESUMO_ROTULO07 = "Area maxima"
RESUMO_EX07 = [area_ag, area_ana, erro07]
