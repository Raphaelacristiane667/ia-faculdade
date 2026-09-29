// =============================================================================
// ex71.sce — tan(theta) = 2*x/(1+3*x^2). Maximizar theta (x > 0).
// d/dx[2x/(1+3x^2)] = 0 => x = 1/sqrt(3), theta_max = arctan(1/sqrt(3)) = pi/6.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex71(x)
    xx = x(1)
    c = atan(2*xx/(1 + 3*xx^2))
endfunction

[x_ag, th_ag, hist71] = ag(f_ex71, 0.01, 5, "max", 50, 100, %f, "Ex. 71 — Angulo maximo")

x_ana = 1/sqrt(3)
th_ana = %pi/6
erro71 = abs(th_ag - th_ana)

disp("========================================")
disp("EXERCICIO 71 - tan(theta) = 2x/(1+3x^2)")
disp("========================================")
disp("RESULTADO FINAL")
disp(["x:" string(x_ag)])
disp(["theta (rad):" string(th_ag)])
disp(["theta (graus):" string(th_ag*180/%pi)])
disp(" ")
disp("Valor analitico:")
disp(["x = 1/sqrt(3), theta = pi/6 (30 graus)"])
disp(["Erro:" string(erro71)])

RESUMO_ROTULO71 = "Angulo maximo"
RESUMO_EX71 = [th_ag, th_ana, erro71]
