// =============================================================================
// ex41.sce — Grupo B: cone/copo altura H=1, volume maximo do solido interno
// (cilindro/corte em h) modelado por V(h)=pi*h*(1-h)^2, 0<h<1.
// Maximo em h=1/3 (Stewart 4.7 #41).
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex41(x)
    hh = x(1)
    if hh <= 0 | hh >= 1 then
        c = -1e9
    else
        c = %pi*hh*(1 - hh)^2
    end
endfunction

[h_ag, V_ag, hist41] = ag(f_ex41, 0.01, 0.99, "max", 50, 100, %f, "Ex. 41 — Volume maximo (H=1)")

h_ana = 1/3
V_ana = %pi/27*4
erro41 = abs(h_ag - h_ana)

disp("========================================")
disp("EXERCICIO 41 - Volume interno (H=1)")
disp("========================================")
disp("RESULTADO FINAL")
disp(["h otimo:" string(h_ag)])
disp(["Volume maximo:" string(V_ag)])
disp(" ")
disp("Valor analitico:")
disp(["h = 1/3, V = 4*pi/27"])
disp(["Erro em h:" string(erro41)])

RESUMO_ROTULO41 = "Altura otima"
RESUMO_EX41 = [h_ag, h_ana, erro41]
