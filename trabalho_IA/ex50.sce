// =============================================================================
// ex50.sce — C(x) = 400*x + 800*sqrt(1+(6-x)^2), 0<=x<=6.
// C'(x)=0 => x = 6 - 1/sqrt(3) ~ 5.423. AG com 200 geracoes (mais preciso).
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex50(x)
    xx = x(1)
    c = 400*xx + 800*sqrt(1 + (6 - xx)^2)
endfunction

[x_ag, C_ag, hist50] = ag(f_ex50, 0, 6, "min", 50, 200, %f, "Ex. 50 — Custo oleoduto")

x_ana = 6 - 1/sqrt(3)
C_ana = 400*x_ana + 800*sqrt(1 + (6 - x_ana)^2)
erro_x50 = abs(x_ag - x_ana)
erro_rel_C50 = abs(C_ag - C_ana)/C_ana

disp("========================================")
disp("EXERCICIO 50 - Custo C(x)")
disp("========================================")
disp("RESULTADO FINAL")
disp(["x otimo:" string(x_ag)])
disp(["Custo minimo:" string(C_ag)])
disp(" ")
disp("Valor analitico:")
disp(["x = 6 - 1/sqrt(3) ~ 5.423"])
disp(["Erro em x:" string(erro_x50)])
disp(["Erro relativo em C:" string(erro_rel_C50)])

RESUMO_ROTULO50 = "Coordenada x"
RESUMO_EX50 = [x_ag, x_ana, erro_x50]
RESUMO_EX50_REL = erro_rel_C50
