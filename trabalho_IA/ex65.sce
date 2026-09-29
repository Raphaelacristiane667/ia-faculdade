// =============================================================================
// ex65.sce — Cabos em P sobre AD (Stewart 4.7 #61, p.302).
// A a 5 m de D; B a 2 m e C a 3 m de D (D entre B e C na horizontal).
// L(x)=x+sqrt((5-x)^2+4)+sqrt((5-x)^2+9), x = AP (0<=x<=5). Minimizar L.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex65(x)
    xx = x(1)
    u = 5 - xx
    c = xx + sqrt(u^2 + 4) + sqrt(u^2 + 9)
endfunction

function d = dL_ex65(x)
    u = 5 - x
    d = 1 - u/sqrt(u^2 + 4) - u/sqrt(u^2 + 9)
endfunction

[x_ag, L_ag, hist65] = ag(f_ex65, 0, 5, "min", 50, 100, %f, "Ex. 65 — Comprimento minimo dos cabos")

// L'(x)=0 => conferencia numerica (fsolve)
function y = eq65(x)
    y = dL_ex65(x)
endfunction
x_ana = fsolve(eq65, 3.5)
L_ana = f_ex65(x_ana)
erro65 = abs(L_ag - L_ana)

// Graficos L e dL/dx
xv = linspace(0, 5, 200)
Lv = zeros(size(xv))
dLv = zeros(size(xv))
for i = 1:size(xv, "*")
    Lv(i) = f_ex65(xv(i))
    dLv(i) = dL_ex65(xv(i))
end
if ~isdef("RODANDO_MAIN") then
    clf
    subplot(2, 1, 1)
    plot(xv, Lv)
    xtitle("Ex. 65 — Comprimento total L(x)", "x (m)", "L (m)")
    subplot(2, 1, 2)
    plot(xv, dLv)
    xtitle("Ex. 65 — Derivada dL/dx", "x (m)", "dL/dx")
end

disp("========================================")
disp("EXERCICIO 65 - Cabos em P sobre AD")
disp("========================================")
disp("RESULTADO FINAL")
disp(["P a x =" string(x_ag) " m de A (distancia a D:" string(5 - x_ag) " m)"])
disp(["L minimo:" string(L_ag)])
disp(" ")
disp("Conferencia (L'=0):")
disp(["x analitico:" string(x_ana) ", L:" string(L_ana)])
disp(["Erro |L_AG - L_ana|:" string(erro65)])

RESUMO_ROTULO65 = "Cabos: L minimo"
RESUMO_EX65 = [L_ag, L_ana, erro65]
