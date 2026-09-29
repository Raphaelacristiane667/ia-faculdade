// =============================================================================
// ex33.sce — Pôster: area impressa fixa 384 (in^2), margens 4 (lados) e 6 (cima/baixo).
// Minimizar area do cartaz (w+8)*(h+12) com w*h = 384, h = 384/w.
// Otimo: impresso 16 x 24, cartaz 24 x 36.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex33(x)
    ww = x(1)
    c = (ww + 8)*(384/ww + 12)
endfunction

[w_ag, poster_ag, hist33] = ag(f_ex33, 1, 384, "min", 50, 100, %f, "Ex. 33 — Cartaz minimo")

w_ana = 16
h_imp_ana = 24
poster_ana = 24*36
erro33 = abs(poster_ag - poster_ana)

disp("========================================")
disp("EXERCICIO 33 - Pôster (area impressa 384)")
disp("========================================")
disp("RESULTADO FINAL")
disp(["Pôster (larg x alt, cm):" string(w_ag+8) "x" string(384/w_ag+12)])
disp(["Area impressa (larg x alt, cm):" string(w_ag) "x" string(384/w_ag)])
disp(["Area do cartaz (cm^2):" string(poster_ag)])
disp(" ")
disp("Valor analitico:")
disp(["Pôster 24 x 36; impresso 16 x 24; area cartaz 864"])
disp(["Erro (area cartaz):" string(erro33)])

RESUMO_ROTULO33 = "Area do cartaz"
RESUMO_EX33 = [poster_ag, poster_ana, erro33]
