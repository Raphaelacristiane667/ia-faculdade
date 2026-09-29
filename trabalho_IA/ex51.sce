// =============================================================================
// ex51.sce — Intensidade I(x) = 3k/x^2 + k/(4-x)^2, 0<x<4, minimizar I.
// I'(x) = -6k/x^3 + 2k/(4-x)^3 = 0 => x/(4-x) = (1/3)^(1/3} ... x ~ 2.362 m.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex51(x)
    xx = x(1)
    if xx <= 0 | xx >= 4 then
        c = 1e9
    else
        c = 3/xx^2 + 1/(4 - xx)^2
    end
endfunction

[x_ag, I_ag, hist51] = ag(f_ex51, 0.01, 3.99, "min", 50, 100, %f, "Ex. 51 — Intensidade minima")

x_ana = 4*3^(1/3)/(1 + 3^(1/3))
I_ana = 3/x_ana^2 + 1/(4 - x_ana)^2
erro51 = abs(I_ag - I_ana)

disp("========================================")
disp("EXERCICIO 51 - Ponto de intensidade minima")
disp("========================================")
disp("RESULTADO FINAL")
disp(["x (m):" string(x_ag)])
disp(["I minima (proporcional a k):" string(I_ag)])
disp(" ")
disp("Valor analitico:")
disp(["x ~ 2.362 m da fonte mais forte"])
disp(["Erro:" string(erro51)])

RESUMO_ROTULO51 = "Intensidade min."
RESUMO_EX51 = [I_ag, I_ana, erro51]
