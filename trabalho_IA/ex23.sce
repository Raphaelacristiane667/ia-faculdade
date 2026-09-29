// ex23.sce — Retangulo de area maxima inscrito em circulo de raio 1.
// A(x) = 4*x*sqrt(1-x^2), 0 < x < 1.

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex23(x)
    xx = x(1)
    c = 4*xx*sqrt(1 - xx^2)
endfunction

[x_ag, A_ag, hist23] = ag(f_ex23, 0.01, 0.99, "max", 50, 100, %f, "Ex. 23 — Area maxima no circulo")

x_ana = sqrt(2)/2
A_ana = 2
erro23 = abs(A_ag - A_ana)

disp("========================================")
disp("EXERCICIO 23 - Retangulo inscrito no circulo r=1")
disp("========================================")
disp("RESULTADO FINAL")
disp(["Semi-largura x:" string(x_ag)])
disp(["Area maxima:" string(A_ag)])
disp(" ")
disp("Valor analitico:")
disp(["quadrado, area = 2"])
disp(["Erro:" string(erro23)])

RESUMO_ROTULO23 = "Area maxima"
RESUMO_EX23 = [A_ag, A_ana, erro23]
