// =============================================================================
// ex68.sce — Corda entre postes (0,a) e (d,b); comprimento minimo quando theta1=theta2.
// L(x)=sqrt(x^2+a^2)+sqrt((d-x)^2+b^2). a=2, b=3, d=5.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

a = 2
b = 3
d = 5

function c = f_ex68(x)
    xx = x(1)
    c = sqrt(xx^2 + a^2) + sqrt((d - xx)^2 + b^2)
endfunction

[x_ag, L_ag, hist68] = ag(f_ex68, 0.01, d - 0.01, "min", 50, 100, %f, "Ex. 68 — Comprimento minimo")

x_ana = a*d/(a + b)
L_ana = sqrt(x_ana^2 + a^2) + sqrt((d - x_ana)^2 + b^2)
erro68 = abs(L_ag - L_ana)

th1 = atan(a/x_ag)
th2 = atan(b/(d - x_ag))
erro_ang = abs(th1 - th2)

disp("========================================")
disp("EXERCICIO 68 - Corda PRS")
disp("========================================")
disp("RESULTADO FINAL")
disp(["x:" string(x_ag) " (analitico:" string(x_ana) ")"])
disp(["Comprimento L:" string(L_ag)])
disp(["theta1, theta2 (rad):" string(th1) "," string(th2)])
disp(" ")
disp("Valor analitico:")
disp(["theta1=theta2, L=5*sqrt(2)~7.071"])
disp(["Erro L:" string(erro68) ", |th1-th2|:" string(erro_ang)])

RESUMO_ROTULO68 = "Compr. da corda"
RESUMO_EX68 = [L_ag, L_ana, erro68]
