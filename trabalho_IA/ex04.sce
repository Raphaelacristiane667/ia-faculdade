// =============================================================================
// ex04.sce
// Stewart 4.7 — Dois números POSITIVOS com soma 16 e soma dos quadrados MÍNIMA.
// Restrição eliminada: y = 16 - x
// Objetivo: minimizar f(x) = x^2 + (16-x)^2
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then
    clear
    clc
end

if ~isdef("ag") then
    exec("ag_generico.sci", -1)
end

function c = f_ex04(x)
    xx = x(1)
    yy = 16 - xx
    c = xx^2 + yy^2
endfunction

// números positivos: x em (0, 16)
[x_ag, sq_ag, hist04] = ag(f_ex04, 0.01, 15.99, "min", 50, 100, %f, "Ex. 4 — Soma dos quadrados minima")
y_ag = 16 - x_ag

// f(x) = x^2 + (16-x)^2 = 2x^2 - 32x + 256
// f'(x) = 4x - 32 = 0  =>  x = 8, y = 8
// 8^2 + 8^2 = 128
x_ana = 8
y_ana = 8
sq_ana = 128
erro04 = abs(sq_ag - sq_ana)

disp("========================================")
disp("EXERCICIO 4 - Soma 16, soma dos quadrados MINIMA")
disp("========================================")
disp("RESULTADO FINAL")
disp(["Primeiro numero:" string(x_ag)])
disp(["Segundo numero:" string(y_ag)])
disp(["Soma dos quadrados minima:" string(sq_ag)])
disp(" ")
disp("Solucao analitica (derivada):")
disp(["x = 8, y = 8, soma dos quadrados = 128"])
disp(["Erro absoluto:" string(erro04)])

RESUMO_ROTULO04 = "Soma de quadrados"
RESUMO_EX04 = [sq_ag, sq_ana, erro04]
