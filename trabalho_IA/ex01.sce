// =============================================================================
// ex01.sce
// Stewart 4.7 — Dois números com soma 23 e produto MÁXIMO.
// Restrição eliminada: y = 23 - x
// Objetivo: maximizar f(x) = x*(23-x)
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then
    clear
    clc
end

if ~isdef("ag") then
    exec("ag_generico.sci", -1)
end

// Função objetivo (produto). x é o primeiro número.
function c = f_ex01(x)
    xx = x(1)
    yy = 23 - xx
    c = xx * yy
endfunction

// ----- AG INTEIRO (estilo do exercício já feito: 12 e 11) -----
[x_int, prod_int, hist01i] = ag(f_ex01, 0, 23, "max", 50, 100, %t, "Ex. 1 — Produto maximo (inteiro)")
y_int = 23 - x_int

// ----- AG REAL (para comparar com a derivada) -----
[x_real, prod_real, hist01r] = ag(f_ex01, 0, 23, "max", 50, 100, %f, "Ex. 1 — Produto maximo (real)")
y_real = 23 - x_real

// ----- solução ANALÍTICA -----
// f(x) = 23x - x^2
// f'(x) = 23 - 2x = 0  =>  x = 11.5, y = 11.5
// f(11.5) = 132.25
x_ana = 11.5
y_ana = 11.5
prod_ana = 132.25
erro01 = abs(prod_real - prod_ana)

disp("========================================")
disp("EXERCICIO 1 - Soma 23, produto MAXIMO")
disp("========================================")
disp("RESULTADO FINAL")
disp(["Primeiro numero:" string(x_int)])
disp(["Segundo numero:" string(y_int)])
disp(["Produto maximo:" string(prod_int)])
disp(" ")
disp("AG com numeros reais:")
disp(["Primeiro numero:" string(x_real)])
disp(["Segundo numero:" string(y_real)])
disp(["Produto maximo:" string(prod_real)])
disp(" ")
disp("Solucao analitica (derivada):")
disp(["x = 11.5, y = 11.5, produto = 132.25"])
disp(["Erro absoluto (produto real):" string(erro01)])

RESUMO_ROTULO01 = "Produto maximo"
RESUMO_EX01 = [prod_real, prod_ana, erro01]
