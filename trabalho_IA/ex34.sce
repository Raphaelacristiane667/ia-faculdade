// =============================================================================
// ex34.sce — Cartaz 900 cm^2; margens 3 (base e lados) e 5 (topo).
// Cartaz (w+6)*(h+8) = 900, maximizar area impressa w*h.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex34(x)
    ww = x(1)
    hh = 900/(ww + 6) - 8
    if hh <= 0 then
        c = -1e9
    else
        c = ww*hh
    end
endfunction

[w_ag, Aimp_ag, hist34] = ag(f_ex34, 0.1, 200, "max", 50, 100, %f, "Ex. 34 — Area impressa maxima")

w_ana = sqrt(675) - 6
h_imp_ana = 900/(w_ana + 6) - 8
poster_larg_ana = sqrt(675)
poster_alt_ana = 900/sqrt(675)
A_ana = w_ana*h_imp_ana
erro34 = abs(Aimp_ag - A_ana)

disp("========================================")
disp("EXERCICIO 34 - Cartaz 900 cm^2, impresso MAX")
disp("========================================")
disp("RESULTADO FINAL")
disp(["Pôster (larg x alt, cm):" string(w_ag+6) "x" string(900/(w_ag+6))])
disp(["Area impressa (larg x alt, cm):" string(w_ag) "x" string(900/(w_ag+6)-8)])
disp(["Area impressa (cm^2):" string(Aimp_ag)])
disp(" ")
disp("Valor analitico:")
disp(["Pôster ~ 25.98 x 34.64; impresso ~ 20 x 26.64; area ~ 532.3"])
disp(["Erro (area impressa):" string(erro34)])

RESUMO_ROTULO34 = "Area impressa"
RESUMO_EX34 = [Aimp_ag, A_ana, erro34]
