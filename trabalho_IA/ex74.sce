// =============================================================================
// ex74.sce — Pintura: maximizar angulo visual theta(x)=atan((d+h)/x)-atan(d/x).
// theta'(x)=0 => x^2 = d*(d+h). Com h=2, d=1: x = sqrt(3) ~ 1.732 m.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

h = 2
d = 1

function c = f_ex74(x)
    xx = x(1)
    if xx <= 0 then
        c = -1e9
    else
        c = atan((d + h)/xx) - atan(d/xx)
    end
endfunction

[x_ag, th_ag, hist74] = ag(f_ex74, 0.1, 10, "max", 50, 100, %f, "Ex. 74 — Distancia pintura")

x_ana = sqrt(d*(d + h))
erro74 = abs(x_ag - x_ana)

disp("========================================")
disp("EXERCICIO 74 - Pintura (h=2, d=1)")
disp("========================================")
disp("RESULTADO FINAL")
disp(["Distancia x (m):" string(x_ag)])
disp(["Angulo visual maximo (rad):" string(th_ag)])
disp(" ")
disp("Valor analitico:")
disp(["x = sqrt(d(d+h)) = sqrt(3) ~ 1.732 m"])
disp(["Erro:" string(erro74)])

RESUMO_ROTULO74 = "Distancia x"
RESUMO_EX74 = [x_ag, x_ana, erro74]
