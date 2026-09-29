// =============================================================================
// ex58a.sce — Grupo B: lucro maximo => R'(x)=C'(x). Verificar em x=100 (ex58b).
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end

x = 100
px = 1700 - 7*x
Rx = x*px
Rpx = 1700 - 14*x
Cx = 16000 + 500*x - 1.6*x^2 + 0.004*x^3
Cpx = 500 - 3.2*x + 0.012*x^2
diff58 = abs(Rpx - Cpx)

disp("========================================")
disp("EXERCICIO 58(a) - R'(x) = C'(x)")
disp("========================================")
disp("RESULTADO FINAL")
disp(["x:" string(x)])
disp(["R(x):" string(Rx)])
disp(["R'(x):" string(Rpx)])
disp(["C'(x):" string(Cpx)])
disp(["|R'(x)-C'(x)|:" string(diff58)])
disp(" ")
disp("Demonstracao: ver explicacoes.md")

RESUMO_ROTULO58A = "Rp igual a Cp"
RESUMO_EX58A = [Rpx, Cpx, diff58]
