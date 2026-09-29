// ex20.sce — Ponto de y = sqrt(x) mais proximo de (3, 0), x >= 0.
// d^2 = (x-3)^2 + (sqrt(x))^2 = x^2 - 5x + 9.

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex20(x)
    xx = x(1)
    c = (xx - 3)^2 + xx
endfunction

[x_ag, d2_ag, hist20] = ag(f_ex20, 0, 10, "min", 50, 100, %f, "Ex. 20 — Distancia minima a parabola")
y_ag = sqrt(x_ag)
dist_ag = sqrt(d2_ag)

x_ana = 2.5
y_ana = sqrt(2.5)
dist_ana = sqrt((2.5-3)^2 + 2.5)
erro20 = abs(dist_ag - dist_ana)

disp("========================================")
disp("EXERCICIO 20 - Ponto de y=sqrt(x) mais proximo de (3,0)")
disp("========================================")
disp("RESULTADO FINAL")
disp(["x:" string(x_ag)])
disp(["y:" string(y_ag)])
disp(["Distancia minima:" string(dist_ag)])
disp(" ")
disp("Valor analitico:")
disp(["x = 2.5, y = sqrt(2.5) ~ 1.581"])
disp(["Erro:" string(erro20)])

RESUMO_ROTULO20 = "Distancia minima"
RESUMO_EX20 = [dist_ag, dist_ana, erro20]
