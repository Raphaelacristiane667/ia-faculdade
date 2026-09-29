// =============================================================================
// ex77.sce — Energia E(x)=1.4*sqrt(25+x^2)+(13-x), x = distancia de B (km).
// E'(x)=0 => x/sqrt(25+x^2)=L/W; no item (a) W/L=1.4 => x ~ 5.10 km.
// (b) condicao de minimo: x/sqrt(25+x^2)=L/W.
// (c) voo direto D: W/L=sqrt(194)/13~1.071; (d) C a 4 km de B: W/L=sqrt(41)/4~1.601.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

WL_a = 1.4

function c = f_ex77(x)
    xx = x(1)
    c = WL_a*sqrt(25 + xx^2) + (13 - xx)
endfunction

[x_ag, E_ag, hist77] = ag(f_ex77, 0, 13, "min", 50, 100, %f, "Ex. 77 — Energia minima do voo")

// WL_a*x/sqrt(25+x^2)=1 => x/sqrt(25+x^2)=1/WL_a = L/W
x_ana = 25/sqrt(24)
E_ana = WL_a*sqrt(25 + x_ana^2) + (13 - x_ana)
erro77 = abs(x_ag - x_ana)

LW_otimo = x_ana/sqrt(25 + x_ana^2)
WL_c = sqrt(194)/13
WL_d = sqrt(41)/4

disp("========================================")
disp("EXERCICIO 77 - Energia (pato / voo)")
disp("========================================")
disp("RESULTADO FINAL — item (a)")
disp(["W/L (custo voo/praia) =" string(WL_a)])
disp(["x (km de B):" string(x_ag) " (~ 5.10 km)"])
disp(["E minima:" string(E_ag)])
disp(["Conferencia x/sqrt(25+x^2) = L/W:" string(LW_otimo) " (1/WL_a =" string(1/WL_a) ")"])
disp(" ")
disp("Item (b) — condicao de minimo:")
disp("x/sqrt(25+x^2) = L/W")
disp("Interpretacao: W/L grande => passaro pousa mais perto de D (voa mais direto para a praia);")
disp("W/L pequeno => voa mais direto para D (pousa mais longe na praia).")
disp(" ")
disp("Itens (c) e (d) — razoes W/L:")
disp(["(c) voo direto para D:" string(WL_c) " (~ 1.0714)"])
disp(["(d) ponto C (4 km de B):" string(WL_d) " (~ 1.601)"])
disp(" ")
disp("Valor analitico (a):")
disp(["x = 25/sqrt(24) ~ 5.10 km"])
disp(["Erro em x:" string(erro77)])

RESUMO_ROTULO77 = "Distancia x (km)"
RESUMO_EX77 = [x_ag, x_ana, erro77]
