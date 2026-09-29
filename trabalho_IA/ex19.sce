// ex19.sce — Ponto da reta y = 2x+3 mais proximo da origem (distancia MINIMA).
// Ponto generico (x, 2x+3). d^2 = x^2 + (2x+3)^2 = 5x^2 + 12x + 9.

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex19(x)
    xx = x(1)
    c = xx^2 + (2*xx + 3)^2
endfunction

[x_ag, d2_ag, hist19] = ag(f_ex19, -5, 5, "min", 50, 100, %f, "Ex. 19 — Distancia minima a reta")
y_ag = 2*x_ag + 3
dist_ag = sqrt(d2_ag)

x_ana = -1.2
y_ana = 0.6
dist_ana = sqrt(1.8)
erro19 = abs(dist_ag - dist_ana)

disp("========================================")
disp("EXERCICIO 19 - Ponto de y=2x+3 mais proximo da origem")
disp("========================================")
disp("RESULTADO FINAL")
disp(["x:" string(x_ag)])
disp(["y:" string(y_ag)])
disp(["Distancia minima:" string(dist_ag)])
disp(" ")
disp("Valor analitico:")
disp(["(-1.2, 0.6), distancia = sqrt(1.8) ~ 1.342"])
disp(["Erro:" string(erro19)])

RESUMO_ROTULO19 = "Distancia minima"
RESUMO_EX19 = [dist_ag, dist_ana, erro19]
