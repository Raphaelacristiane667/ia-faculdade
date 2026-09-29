// =============================================================================
// ex67.sce — Lei de Snell: A=(0,1), B=(2,-1), interface y=0, v1=3, v2=2.
// Minimizar T(t)=sqrt(t^2+1)/v1+sqrt((2-t)^2+1)/v2. Comparar sen/v.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

v1 = 3
v2 = 2

function c = f_ex67(x)
    tt = x(1)
    c = sqrt(tt^2 + 1)/v1 + sqrt((2 - tt)^2 + 1)/v2
endfunction

[t_ag, T_ag, hist67] = ag(f_ex67, 0, 2, "min", 50, 100, %f, "Ex. 67 — Tempo minimo")

sin1 = t_ag/sqrt(t_ag^2 + 1)
sin2 = (2 - t_ag)/sqrt((2 - t_ag)^2 + 1)
raz1 = sin1/v1
raz2 = sin2/v2
erro67 = abs(raz1 - raz2)

disp("========================================")
disp("EXERCICIO 67 - Lei de Snell")
disp("========================================")
disp("RESULTADO FINAL")
disp(["Ponto na interface t:" string(t_ag)])
disp(["Tempo minimo T:" string(T_ag)])
disp(["sin1/v1:" string(raz1)])
disp(["sin2/v2:" string(raz2)])
disp(["Diferenca:" string(erro67)])
disp(" ")
disp("Demonstracao: ver explicacoes.md")

RESUMO_ROTULO67 = "Lei de Snell"
RESUMO_EX67 = [raz1, raz2, erro67]
