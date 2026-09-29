// =============================================================================
// ex43.sce — P = E^2*R/(R+r)^2, E=12, r=2. Enunciado pede "minimo", mas P>0
// e dP/dR=0 no interior da MAXIMIZACAO: R=r=2, P=18 W.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex43(x)
    RR = x(1)
    c = 144*RR/(RR + 2)^2
endfunction

[R_ag, P_ag, hist43] = ag(f_ex43, 0.01, 20, "max", 50, 100, %f, "Ex. 43 — Potencia maxima")

R_ana = 2
P_ana = 18
erro43 = abs(P_ag - P_ana)

disp("========================================")
disp("EXERCICIO 43 - Potencia no resistor R")
disp("========================================")
disp("NOTA: o enunciado diz minimo; o ponto critico e MAXIMO (R=2).")
disp(" ")
disp("RESULTADO FINAL")
disp(["R otimo:" string(R_ag)])
disp(["Potencia maxima:" string(P_ag)])
disp(" ")
disp("Valor analitico:")
disp(["R = 2 ohm, P = 18 W"])
disp(["Erro:" string(erro43)])

RESUMO_ROTULO43 = "Potencia maxima"
RESUMO_EX43 = [P_ag, P_ana, erro43]
