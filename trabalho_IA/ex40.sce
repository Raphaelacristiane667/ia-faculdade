// =============================================================================
// ex40.sce — Copo conico V=27 cm^3, minimizar area do papel (lateral).
// V = pi*r^2*h/3 = 27 => h = 81/(pi*r^2). S = pi*r*sqrt(r^2+h^2).
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex40(x)
    rr = x(1)
    hh = 81/(%pi*rr^2)
    c = %pi*rr*sqrt(rr^2 + hh^2)
endfunction

[r_ag, S_ag, hist40] = ag(f_ex40, 0.5, 5, "min", 50, 100, %f, "Ex. 40 — Papel minimo")

// r^6 = 6561/(2*pi^2)  (derivada da area lateral com V=27)
r_ana = (6561/(2*%pi^2))^(1/6)
h_ana = 81/(%pi*r_ana^2)
S_ana = %pi*r_ana*sqrt(r_ana^2 + h_ana^2)
erro40 = abs(S_ag - S_ana)

disp("========================================")
disp("EXERCICIO 40 - Copo V=27, papel MINIMO")
disp("========================================")
disp("RESULTADO FINAL")
disp(["Raio:" string(r_ag)])
disp(["Altura:" string(81/(%pi*r_ag^2))])
disp(["Area lateral:" string(S_ag)])
disp(" ")
disp("Valor analitico:")
disp(["r ~ 2.632, h ~ 3.722"])
disp(["Erro:" string(erro40)])

RESUMO_ROTULO40 = "Area lateral min."
RESUMO_EX40 = [S_ag, S_ana, erro40]
