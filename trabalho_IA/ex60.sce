// =============================================================================
// ex60.sce — (a) p(x)=20-x/2. (b) Custo $6/un, lucro pi = x*(20-x/2) - 6*x.
// pi' = 14 - x = 0 => x=14, p=13, lucro=98.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex60(x)
    xx = x(1)
    c = xx*(20 - xx/2) - 6*xx
endfunction

[x_ag, pi_ag, hist60] = ag(f_ex60, 0, 50, "max", 50, 100, %f, "Ex. 60 — Lucro maximo")

x_ana = 14
pi_ana = 98
erro60 = abs(pi_ag - pi_ana)

disp("========================================")
disp("EXERCICIO 60 - Lucro com custo fixo por unidade")
disp("========================================")
disp("(a) p(x) = 20 - x/2")
disp(" ")
disp("RESULTADO FINAL — item (b)")
disp(["Unidades:" string(x_ag)])
disp(["Preco:" string(20 - x_ag/2)])
disp(["Lucro maximo:" string(pi_ag)])
disp(" ")
disp("Valor analitico:")
disp(["p = $13, x = 14, lucro = $98"])
disp(["Erro:" string(erro60)])

RESUMO_ROTULO60 = "Lucro maximo"
RESUMO_EX60 = [pi_ag, pi_ana, erro60]
