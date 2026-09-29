// =============================================================================
// ex08.sce
// Stewart 4.7 — Retângulo de área 1000 com perímetro MÍNIMO.
// L*W = 1000  =>  W = 1000/L
// P(L) = 2*(L + 1000/L)
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then
    clear
    clc
end

if ~isdef("ag") then
    exec("ag_generico.sci", -1)
end

function c = f_ex08(x)
    L = x(1)
    W = 1000 / L
    c = 2 * (L + W)
endfunction

[L_ag, peri_ag, hist08] = ag(f_ex08, 1, 1000, "min", 50, 100, %f, "Ex. 8 — Perimetro minimo do retangulo")
W_ag = 1000 / L_ag

// P'(L) = 2*(1 - 1000/L^2) = 0  =>  L^2 = 1000  =>  L = sqrt(1000)
// L = W ≈ 31.6227766,  P ≈ 126.491106
L_ana = sqrt(1000)
W_ana = L_ana
peri_ana = 2 * (L_ana + W_ana)
erro08 = abs(peri_ag - peri_ana)

disp("========================================")
disp("EXERCICIO 8 - Area 1000, perimetro MINIMO")
disp("========================================")
disp("RESULTADO FINAL")
disp(["Comprimento:" string(L_ag)])
disp(["Largura:" string(W_ag)])
disp(["Perimetro minimo:" string(peri_ag)])
disp(" ")
disp("Solucao analitica (derivada):")
disp(["lado = sqrt(1000) ≈ 31.622776, perimetro ≈ 126.491106"])
disp(["Erro absoluto (perimetro):" string(erro08)])

RESUMO_ROTULO08 = "Perimetro minimo"
RESUMO_EX08 = [peri_ag, peri_ana, erro08]
