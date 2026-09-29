// =============================================================================
// ex16.sce
// Stewart 4.7 — Conteiner 10 m^3, tampa aberta, comprimento = 2 * largura (x).
// V = 2*x^2*h = 10  =>  h = 5/x^2
// Custo: base 10 $/m^2 (area 2x^2) + lados 6 $/m^2 (area lateral 6xh).
// C(x) = 20x^2 + 36xh = 20x^2 + 180/x  (minimizar).
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then
    clear
    clc
end

if ~isdef("ag") then
    exec("ag_generico.sci", -1)
end

function c = f_ex16(x)
    xx = x(1)
    c = 20*xx^2 + 180/xx
endfunction

[x_ag, custo_ag, hist16] = ag(f_ex16, 0.5, 4, "min", 50, 100, %f, "Ex. 16 — Custo minimo (aberto)")
h_ag = 5 / (x_ag^2)
L_ag = 2 * x_ag

// C'(x) = 40x - 180/x^2 = 0  =>  x^3 = 4.5
x_ana = (4.5)^(1/3)
h_ana = 5 / (x_ana^2)
L_ana = 2 * x_ana
custo_ana = 20*x_ana^2 + 180/x_ana
erro16 = abs(custo_ag - custo_ana)

disp("========================================")
disp("EXERCICIO 16 - Conteiner 10 m^3, custo MINIMO (tampa aberta)")
disp("========================================")
disp("RESULTADO FINAL")
disp(["Largura:" string(x_ag)])
disp(["Comprimento:" string(L_ag)])
disp(["Altura:" string(h_ag)])
disp(["Custo minimo:" string(custo_ag)])
disp(" ")
disp("Valor analitico:")
disp(["largura ~ 1.651, comprimento ~ 3.302, altura ~ 1.834 m"])
disp(["custo ~ 163.54 (altura 1.834 com V=10; conferir PDF se aparecer outro valor)"])
disp(["Erro (custo):" string(erro16)])

RESUMO_ROTULO16 = "Custo minimo"
RESUMO_EX16 = [custo_ag, custo_ana, erro16]
