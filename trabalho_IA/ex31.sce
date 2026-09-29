// ex31.sce — Cilindro inscrito na esfera r=1, superficie TOTAL maxima.
// S = 2*pi*x*(h + x), com h = 2*sqrt(1-x^2).

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex31(x)
    xx = x(1)
    hh = 2*sqrt(1 - xx^2)
    c = 2*%pi*xx*(hh + xx)
endfunction

[x_ag, S_ag, hist31] = ag(f_ex31, 0.01, 0.99, "max", 50, 100, %f, "Ex. 31 — Superficie maxima do cilindro")

S_ana = %pi*(1 + sqrt(5))
erro31 = abs(S_ag - S_ana)

disp("========================================")
disp("EXERCICIO 31 - Cilindro na esfera, superficie MAXIMA")
disp("========================================")
disp("RESULTADO FINAL")
disp(["Raio do cilindro:" string(x_ag)])
disp(["Superficie maxima:" string(S_ag)])
disp(" ")
disp("Valor analitico:")
disp(["S = pi*(1+sqrt(5)) ~ 10.166"])
disp(["Erro:" string(erro31)])

RESUMO_ROTULO31 = "Superficie maxima"
RESUMO_EX31 = [S_ag, S_ana, erro31]
