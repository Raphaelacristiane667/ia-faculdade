// ex21.sce — Elipse 4x^2 + y^2 = 4. Ponto mais DISTANTE de (1, 0).
// y = 2*sqrt(1 - x^2) (ramo superior). d^2 = (x-1)^2 + 4(1-x^2) = -3x^2 - 2x + 5.

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex21(x)
    xx = x(1)
    yy = 2*sqrt(1 - xx^2)
    c = (xx - 1)^2 + yy^2
endfunction

[x_ag, d2_ag, hist21] = ag(f_ex21, -0.99, 0.99, "max", 50, 100, %f, "Ex. 21 — Distancia maxima na elipse")
y_ag = 2*sqrt(1 - x_ag^2)
dist_ag = sqrt(d2_ag)

x_ana = -1/3
y_ana = 4*sqrt(2)/3
dist_ana = sqrt((x_ana - 1)^2 + y_ana^2)
erro21 = abs(dist_ag - dist_ana)

disp("========================================")
disp("EXERCICIO 21 - Elipse 4x^2+y^2=4, ponto mais distante de (1,0)")
disp("========================================")
disp("RESULTADO FINAL")
disp(["x:" string(x_ag)])
disp(["y:" string(y_ag)])
disp(["Distancia maxima:" string(dist_ag)])
disp(" ")
disp("Valor analitico:")
disp(["x = -1/3, y = +/- 4*sqrt(2)/3 ~ +/- 1.886"])
disp(["Erro:" string(erro21)])

RESUMO_ROTULO21 = "Distancia maxima"
RESUMO_EX21 = [dist_ag, dist_ana, erro21]
