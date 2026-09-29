// ex22.sce — Ponto de y = sen(x) mais proximo de (4, 2).
// Minimizar d^2 = (x-4)^2 + (sin(x)-2)^2. Conferencia por malha fina.

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex22(x)
    xx = x(1)
    c = (xx - 4)^2 + (sin(xx) - 2)^2
endfunction

[x_ag, d2_ag, hist22] = ag(f_ex22, 0, 10, "min", 50, 100, %f, "Ex. 22 — Distancia minima a sen(x)")
y_ag = sin(x_ag)
dist_ag = sqrt(d2_ag)

// malha fina (referencia numerica)
x_malha = 0
d2_m = %inf
passo = 0.0001
for xi = 0:passo:10
    d2i = (xi - 4)^2 + (sin(xi) - 2)^2
    if d2i < d2_m then
        d2_m = d2i
        x_malha = xi
    end
end
y_malha = sin(x_malha)
dist_malha = sqrt(d2_m)

x_ana = x_malha
y_ana = y_malha
dist_ana = dist_malha
erro22 = abs(dist_ag - dist_ana)

disp("========================================")
disp("EXERCICIO 22 - Ponto de y=sen(x) mais proximo de (4,2)")
disp("========================================")
disp("RESULTADO FINAL")
disp(["x (2 casas):" string(round(x_ag, 2))])
disp(["y (2 casas):" string(round(y_ag, 2))])
disp(["Distancia minima:" string(dist_ag)])
disp(" ")
disp("Malha fina (referencia):")
disp(["x:" string(round(x_malha, 2)) " y:" string(round(y_malha, 2))])
disp(["Erro (AG vs malha):" string(erro22)])

RESUMO_ROTULO22 = "Distancia minima"
RESUMO_EX22 = [dist_ag, dist_ana, erro22]
