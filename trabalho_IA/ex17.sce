// =============================================================================
// ex17.sce
// Stewart 4.7 — Igual ao 16, mas com TAMPA (mesmo material dos lados, 6 $/m^2).
// V = 2x^2*h = 10  =>  h = 5/x^2
// C(x) = 10*(2x^2) + 6*(2x^2 + 6xh) = 32x^2 + 180/x  (minimizar).
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then
    clear
    clc
end

if ~isdef("ag") then
    exec("ag_generico.sci", -1)
end

function c = f_ex17(x)
    xx = x(1)
    c = 32*xx^2 + 180/xx
endfunction

[x_ag, custo_ag, hist17] = ag(f_ex17, 0.5, 4, "min", 50, 100, %f, "Ex. 17 — Custo minimo (com tampa)")
h_ag = 5 / (x_ag^2)
L_ag = 2 * x_ag

// C'(x) = 64x - 180/x^2 = 0  =>  x^3 = 45/16
x_ana = (45/16)^(1/3)
h_ana = 5 / (x_ana^2)
custo_ana = 32*x_ana^2 + 180/x_ana
erro17 = abs(custo_ag - custo_ana)

disp("========================================")
disp("EXERCICIO 17 - Conteiner 10 m^3, custo MINIMO (com tampa)")
disp("========================================")
disp("RESULTADO FINAL")
disp(["Largura:" string(x_ag)])
disp(["Comprimento:" string(L_ag)])
disp(["Altura:" string(h_ag)])
disp(["Custo minimo:" string(custo_ag)])
disp(" ")
disp("Valor analitico:")
disp(["largura ~ 1.411, custo ~ 191.3"])
disp(["Erro:" string(erro17)])

RESUMO_ROTULO17 = "Custo minimo"
RESUMO_EX17 = [custo_ag, custo_ana, erro17]
