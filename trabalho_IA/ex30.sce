// ex30.sce — Cilindro inscrito no cone (h=1, r=1), volume MAXIMO.
// Raio do cilindro x = 1 - h (cone unitario). V = pi*x^2*h = pi*h*(1-h)^2.

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex30(x)
    hh = x(1)
    rr = 1 - hh
    c = %pi*rr^2*hh
endfunction

[h_ag, V_ag, hist30] = ag(f_ex30, 0.01, 0.99, "max", 50, 100, %f, "Ex. 30 — Volume do cilindro no cone")
r_ag = 1 - h_ag

V_ana = 4*%pi/27
erro30 = abs(V_ag - V_ana)

disp("========================================")
disp("EXERCICIO 30 - Cilindro no cone h=1, r=1, volume MAXIMO")
disp("========================================")
disp("RESULTADO FINAL")
disp(["Altura do cilindro:" string(h_ag)])
disp(["Raio do cilindro:" string(r_ag)])
disp(["Volume maximo:" string(V_ag)])
disp(" ")
disp("Valor analitico:")
disp(["V = 4*pi/27 ~ 0.4654"])
disp(["Erro:" string(erro30)])

RESUMO_ROTULO30 = "Volume maximo"
RESUMO_EX30 = [V_ag, V_ana, erro30]
