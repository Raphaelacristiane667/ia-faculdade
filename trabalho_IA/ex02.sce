// =============================================================================
// ex02.sce
// Stewart 4.7 — Dois números com diferença 100 e produto MÍNIMO.
// Restrição eliminada: y = x - 100
// Objetivo: minimizar f(x) = x*(x-100)
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then
    clear
    clc
end

if ~isdef("ag") then
    exec("ag_generico.sci", -1)
end

function c = f_ex02(x)
    xx = x(1)
    yy = xx - 100
    c = xx * yy
endfunction

// x precisa poder ser 50 (y = -50). Intervalo amplo, mas contendo o mínimo.
[x_ag, prod_ag, hist02] = ag(f_ex02, -200, 300, "min", 50, 100, %f, "Ex. 2 — Produto minimo")
y_ag = x_ag - 100

// f(x) = x^2 - 100x
// f'(x) = 2x - 100 = 0  =>  x = 50, y = -50
// f(50) = -2500
x_ana = 50
y_ana = -50
prod_ana = -2500
erro02 = abs(prod_ag - prod_ana)

disp("========================================")
disp("EXERCICIO 2 - Diferenca 100, produto MINIMO")
disp("========================================")
disp("RESULTADO FINAL")
disp(["Primeiro numero:" string(x_ag)])
disp(["Segundo numero:" string(y_ag)])
disp(["Produto minimo:" string(prod_ag)])
disp(" ")
disp("Solucao analitica (derivada):")
disp(["x = 50, y = -50, produto = -2500"])
disp(["Erro absoluto (produto):" string(erro02)])

RESUMO_ROTULO02 = "Produto minimo"
RESUMO_EX02 = [prod_ag, prod_ana, erro02]
