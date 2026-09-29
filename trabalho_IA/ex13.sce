// =============================================================================
// ex13.sce
// Stewart 4.7 — Area 15000 m^2, retangulo dividido ao meio (cerca paralela).
// xy = 15000  =>  y = 15000/x
// Cerca total proporcional a 3x + 2y (minimizar).
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then
    clear
    clc
end

if ~isdef("ag") then
    exec("ag_generico.sci", -1)
end

function c = f_ex13(x)
    xx = x(1)
    yy = 15000 / xx
    c = 3*xx + 2*yy
endfunction

[x_ag, C_ag, hist13] = ag(f_ex13, 1, 500, "min", 50, 100, %f, "Ex. 13 — Cerca minima")
y_ag = 15000 / x_ag

// C(x) = 3x + 30000/x
// C'(x) = 3 - 30000/x^2 = 0  =>  x = 100, y = 150
// C = 300 + 300 = 600
x_ana = 100
y_ana = 150
C_ana = 600
erro13 = abs(C_ag - C_ana)

disp("========================================")
disp("EXERCICIO 13 - Area 15000 m^2, cerca MINIMA")
disp("========================================")
disp("RESULTADO FINAL")
disp(["x:" string(x_ag)])
disp(["y:" string(y_ag)])
disp(["Comprimento total da cerca:" string(C_ag)])
disp(" ")
disp("Valor analitico:")
disp(["x = 100, y = 150, cerca = 600 m"])
disp(["Erro:" string(erro13)])

RESUMO_ROTULO13 = "Area da cerca"
RESUMO_EX13 = [C_ag, C_ana, erro13]
