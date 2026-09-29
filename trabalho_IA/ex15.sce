// =============================================================================
// ex15.sce
// Stewart 4.7 — 1200 cm^2 de material, caixa base quadrada sem tampa.
// x^2 + 4xh = 1200  =>  h = (1200 - x^2)/(4x)
// Volume V = x^2*h = x(1200 - x^2)/4  (maximizar), 0 < x < sqrt(1200).
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then
    clear
    clc
end

if ~isdef("ag") then
    exec("ag_generico.sci", -1)
end

function c = f_ex15(x)
    xx = x(1)
    c = xx * (1200 - xx^2) / 4
endfunction

[x_ag, V_ag, hist15] = ag(f_ex15, 0.1, 34.6, "max", 50, 100, %f, "Ex. 15 — Volume maximo")
h_ag = (1200 - x_ag^2) / (4*x_ag)

// V'(x) = (1200 - 3x^2)/4 = 0  =>  x = 20
// h = 10, V = 4000
x_ana = 20
h_ana = 10
V_ana = 4000
erro15 = abs(V_ag - V_ana)

disp("========================================")
disp("EXERCICIO 15 - 1200 cm^2, volume MAXIMO")
disp("========================================")
disp("RESULTADO FINAL")
disp(["Lado da base:" string(x_ag)])
disp(["Altura:" string(h_ag)])
disp(["Volume maximo:" string(V_ag)])
disp(" ")
disp("Valor analitico:")
disp(["base 20 x 20, h = 10, V = 4000 cm^3"])
disp(["Erro:" string(erro15)])

RESUMO_ROTULO15 = "Volume maximo"
RESUMO_EX15 = [V_ag, V_ana, erro15]
