// =============================================================================
// ex14.sce
// Stewart 4.7 — Caixa base quadrada sem tampa, volume V = 32000 cm^3.
// V = x^2 * h  =>  h = 32000/x^2
// Material (area) S = x^2 + 4*x*h = x^2 + 128000/x  (minimizar).
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then
    clear
    clc
end

if ~isdef("ag") then
    exec("ag_generico.sci", -1)
end

function c = f_ex14(x)
    xx = x(1)
    hh = 32000 / (xx^2)
    c = xx^2 + 4*xx*hh
endfunction

[x_ag, S_ag, hist14] = ag(f_ex14, 1, 200, "min", 50, 100, %f, "Ex. 14 — Material minimo")
h_ag = 32000 / (x_ag^2)

// S'(x) = 2x - 128000/x^2 = 0  =>  x^3 = 64000  =>  x = 40
// h = 20, S = 1600 + 3200 = 4800
x_ana = 40
h_ana = 20
S_ana = 4800
erro14 = abs(S_ag - S_ana)

disp("========================================")
disp("EXERCICIO 14 - V=32000 cm^3, material MINIMO")
disp("========================================")
disp("RESULTADO FINAL")
disp(["Lado da base:" string(x_ag)])
disp(["Altura:" string(h_ag)])
disp(["Area de material:" string(S_ag)])
disp(" ")
disp("Valor analitico:")
disp(["base 40 x 40, h = 20, area = 4800 cm^2"])
disp(["Erro:" string(erro14)])

RESUMO_ROTULO14 = "Material minimo"
RESUMO_EX14 = [S_ag, S_ana, erro14]
