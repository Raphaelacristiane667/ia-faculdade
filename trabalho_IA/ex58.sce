// =============================================================================
// ex58.sce — Item (b). C(x)=16000+500*x-1.6*x^2+0.004*x^3, p(x)=1700-7*x.
// Lucro L(x) = x*p(x) - C(x). L'(x)=0 => x = 100.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex58(x)
    xx = x(1)
    px = 1700 - 7*xx
    Cx = 16000 + 500*xx - 1.6*xx^2 + 0.004*xx^3
    c = xx*px - Cx
endfunction

[x_ag, L_ag, hist58] = ag(f_ex58, 0, 300, "max", 50, 100, %f, "Ex. 58 — Lucro maximo")

x_ana = 100
L_ana = 100*(1700 - 700) - (16000 + 50000 - 16000 + 4000)
erro58 = abs(L_ag - L_ana)

disp("========================================")
disp("EXERCICIO 58 - Lucro (item b)")
disp("========================================")
disp("Item (a): demonstracao — ver grupo B.")
disp(" ")
disp("RESULTADO FINAL")
disp(["x otimo:" string(x_ag)])
disp(["Lucro maximo:" string(L_ag)])
disp(" ")
disp("Valor analitico:")
disp(["x = 100"])
disp(["Erro:" string(erro58)])

RESUMO_ROTULO58 = "Lucro maximo"
RESUMO_EX58 = [L_ag, L_ana, erro58]
