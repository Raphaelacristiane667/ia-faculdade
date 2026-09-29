// =============================================================================
// ex59.sce — (a) p(x) = 19 - x/3000. (b) Receita R(x) = x*p(x) = 19*x - x^2/3000.
// R'(x) = 19 - x/1500 = 0 => x = 28500, p = 9.50.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex59(x)
    xx = x(1)
    c = 19*xx - xx^2/3000
endfunction

[x_ag, R_ag, hist59] = ag(f_ex59, 0, 60000, "max", 50, 100, %f, "Ex. 59 — Receita maxima")

x_ana = 28500
R_ana = 19*x_ana - x_ana^2/3000
p_ana = 19 - x_ana/3000
erro59 = abs(R_ag - R_ana)

disp("========================================")
disp("EXERCICIO 59 - Preco-demanda")
disp("========================================")
disp("(a) p(x) = 19 - x/3000")
disp(" ")
disp("RESULTADO FINAL — item (b)")
disp(["x (unidades):" string(x_ag)])
disp(["Receita maxima:" string(R_ag)])
disp(["Preco:" string(19 - x_ag/3000)])
disp(" ")
disp("Valor analitico:")
disp(["x = 28500, p = $9.50"])
disp(["Erro (receita):" string(erro59)])

RESUMO_ROTULO59 = "Receita maxima"
RESUMO_EX59 = [R_ag, R_ana, erro59]
