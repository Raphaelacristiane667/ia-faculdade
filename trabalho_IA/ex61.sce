// =============================================================================
// ex61.sce — p(x)=550-x/10. (b) R max => x=2750, p=275. (c) C=68000+150x,
// lucro max => x=2000, p=350.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex61b(x)
    xx = x(1)
    c = xx*(550 - xx/10)
endfunction

function c = f_ex61c(x)
    xx = x(1)
    c = xx*(550 - xx/10) - 68000 - 150*xx
endfunction

[xb_ag, R_ag, hist61b] = ag(f_ex61b, 0, 6000, "max", 50, 100, %f, "Ex.61b - Receita")
[xc_ag, pi_ag, hist61c] = ag(f_ex61c, 0, 6000, "max", 50, 100, %f, "Ex.61c - Lucro")

R_ana = 2750*(550 - 275)
pi_ana = 2000*(550 - 200) - 68000 - 150*2000
erro61 = abs(pi_ag - pi_ana)

disp("========================================")
disp("EXERCICIO 61 - Preco de lista $450")
disp("========================================")
disp("(a) p(x) = 550 - x/10")
disp(" ")
disp("RESULTADO FINAL — item (b) receita maxima")
disp(["x:" string(xb_ag) ", p:" string(550 - xb_ag/10)])
disp(["Receita:" string(R_ag) ", desconto ~$" string(450 - (550 - xb_ag/10))])
disp(" ")
disp("Item (c) lucro maximo")
disp(["x:" string(xc_ag) ", p:" string(550 - xc_ag/10)])
disp(["Lucro:" string(pi_ag) ", desconto ~$" string(450 - (550 - xc_ag/10))])
disp(" ")
disp("Valor analitico:")
disp(["(b) x=2750, p=275; (c) x=2000, p=350, descontos 175 e 100"])
disp(["Erro (lucro item c):" string(erro61)])

RESUMO_ROTULO61 = "Lucro maximo"
RESUMO_EX61 = [pi_ag, pi_ana, erro61]
