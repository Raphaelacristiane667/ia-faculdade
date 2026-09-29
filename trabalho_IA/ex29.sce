// ex29.sce — Cilindro inscrito na esfera r=1, volume MAXIMO.
// x = raio do cilindro, h = 2*sqrt(1-x^2). V = pi*x^2*h = 2*pi*x^2*sqrt(1-x^2).

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex29(x)
    xx = x(1)
    c = 2*%pi*xx^2*sqrt(1 - xx^2)
endfunction

[x_ag, V_ag, hist29] = ag(f_ex29, 0.01, 0.99, "max", 50, 100, %f, "Ex. 29 — Volume do cilindro na esfera")

V_ana = 4*%pi/(3*sqrt(3))
erro29 = abs(V_ag - V_ana)

disp("========================================")
disp("EXERCICIO 29 - Cilindro na esfera r=1, volume MAXIMO")
disp("========================================")
disp("RESULTADO FINAL")
disp(["Raio do cilindro:" string(x_ag)])
disp(["Volume maximo:" string(V_ag)])
disp(" ")
disp("Valor analitico:")
disp(["V = 4*pi/(3*sqrt(3)) ~ 2.418"])
disp(["Erro:" string(erro29)])

RESUMO_ROTULO29 = "Volume maximo"
RESUMO_EX29 = [V_ag, V_ana, erro29]
