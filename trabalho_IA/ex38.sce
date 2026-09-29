// =============================================================================
// ex38.sce — Escada sobre cerca 2 m, a 1 m do predio. Comprimento MINIMO.
// Pe da escada a x m do predio (x>1), passa por (1,2): H = 2x/(x-1).
// L(x) = sqrt(x^2 + (2x/(x-1))^2).
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex38(x)
    xx = x(1)
    if xx <= 1 then
        c = 1e9
    else
        hh = 2*xx/(xx - 1)
        c = sqrt(xx^2 + hh^2)
    end
endfunction

[x_ag, L_ag, hist38] = ag(f_ex38, 1.01, 10, "min", 50, 100, %f, "Ex. 38 — Escada minima")

// x = 2^(2/3) + 1 ou solucao de 2x^3 - 3x^2 - 1 = 0 ... ~ 2.587
x_ana = 2.587359583595836
h_ana = 2*x_ana/(x_ana - 1)
L_ana = sqrt(x_ana^2 + h_ana^2)
erro38 = abs(L_ag - L_ana)

disp("========================================")
disp("EXERCICIO 38 - Escada sobre a cerca")
disp("========================================")
disp("RESULTADO FINAL")
disp(["Distancia do predio (pe):" string(x_ag)])
disp(["Comprimento da escada:" string(L_ag)])
disp(" ")
disp("Valor analitico:")
disp(["L ~ 4.162 m"])
disp(["Erro:" string(erro38)])

RESUMO_ROTULO38 = "Compr. escada"
RESUMO_EX38 = [L_ag, L_ana, erro38]
