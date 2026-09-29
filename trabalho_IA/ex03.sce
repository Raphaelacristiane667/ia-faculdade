// =============================================================================
// ex03.sce
// Stewart 4.7 — Dois números POSITIVOS com produto 100 e soma MÍNIMA.
// Restrição eliminada: y = 100/x
// Objetivo: minimizar f(x) = x + 100/x,  x > 0
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then
    clear
    clc
end

if ~isdef("ag") then
    exec("ag_generico.sci", -1)
end

function c = f_ex03(x)
    xx = x(1)
    yy = 100 / xx
    c = xx + yy
endfunction

// x > 0 para não dividir por zero. O mínimo está em x = 10.
[x_ag, soma_ag, hist03] = ag(f_ex03, 0.1, 100, "min", 50, 100, %f, "Ex. 3 — Soma minima")
y_ag = 100 / x_ag

// f(x) = x + 100/x
// f'(x) = 1 - 100/x^2 = 0  =>  x^2 = 100  =>  x = 10 (positivo)
// y = 10, soma = 20
x_ana = 10
y_ana = 10
soma_ana = 20
erro03 = abs(soma_ag - soma_ana)

disp("========================================")
disp("EXERCICIO 3 - Produto 100, soma MINIMA")
disp("========================================")
disp("RESULTADO FINAL")
disp(["Primeiro numero:" string(x_ag)])
disp(["Segundo numero:" string(y_ag)])
disp(["Soma minima:" string(soma_ag)])
disp(" ")
disp("Solucao analitica (derivada):")
disp(["x = 10, y = 10, soma = 20"])
disp(["Erro absoluto (soma):" string(erro03)])

RESUMO_ROTULO03 = "Soma minima"
RESUMO_EX03 = [soma_ag, soma_ana, erro03]
