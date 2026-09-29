// =============================================================================
// ex11.sce
// Stewart 4.7 — 300 m de cerca, retângulo dividido em 4 partes com cercas
// paralelas a um lado. Restrição: 2x + 5y = 300.
// Área total A = x * y  (maximizar).
// Eliminando y: y = (300 - 2x)/5 = 60 - 0.4x
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then
    clear
    clc
end

if ~isdef("ag") then
    exec("ag_generico.sci", -1)
end

function c = f_ex11(x)
    xx = x(1)
    yy = 60 - 0.4 * xx
    c = xx * yy
endfunction

// x > 0 e y > 0  =>  60 - 0.4x > 0  =>  x < 150
[x_ag, area_ag, hist11] = ag(f_ex11, 0.1, 149.9, "max", 50, 100, %f, "Ex. 11 — Area maxima da cerca")
y_ag = 60 - 0.4 * x_ag

// A(x) = x*(60 - 0.4x) = 60x - 0.4 x^2
// A'(x) = 60 - 0.8x = 0  =>  x = 75
// y = 60 - 0.4*75 = 30
// A = 75*30 = 2250
x_ana = 75
y_ana = 30
area_ana = 2250
erro11 = abs(area_ag - area_ana)

disp("========================================")
disp("EXERCICIO 11 - Cerca 300 m, 4 partes, area MAXIMA")
disp("========================================")
disp("RESULTADO FINAL")
disp(["x:" string(x_ag)])
disp(["y:" string(y_ag)])
disp(["Area maxima:" string(area_ag)])
disp(" ")
disp("Valor analitico:")
disp(["x = 75, y = 30, area = 2250"])
disp(["Erro:" string(erro11)])

RESUMO_ROTULO11 = "Area maxima"
RESUMO_EX11 = [area_ag, area_ana, erro11]
