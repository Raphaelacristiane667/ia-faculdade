// =============================================================================
// ex75.sce — Retangulo L=4, W=3 circunscrito, angulo theta.
// A(theta)=(L*cos(theta)+W*sin(theta))*(L*sin(theta)+W*cos(theta)).
// Maximo em theta=pi/4: A=(L+W)^2/2=24.5.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

L = 4
W = 3

function c = f_ex75(x)
    th = x(1)
    c = (L*cos(th) + W*sin(th))*(L*sin(th) + W*cos(th))
endfunction

[th_ag, A_ag, hist75] = ag(f_ex75, 0, %pi/2, "max", 50, 100, %f, "Ex. 75 — Area maxima")

th_ana = %pi/4
A_ana = (L + W)^2/2
erro75 = abs(A_ag - A_ana)

disp("========================================")
disp("EXERCICIO 75 - Retangulo circunscrito")
disp("========================================")
disp("RESULTADO FINAL")
disp(["theta (graus):" string(th_ag*180/%pi)])
disp(["Area maxima:" string(A_ag)])
disp(" ")
disp("Valor analitico:")
disp(["theta = 45 graus, A = (L+W)^2/2 = 24.5"])
disp(["Erro:" string(erro75)])

RESUMO_ROTULO75 = "Area maxima"
RESUMO_EX75 = [A_ag, A_ana, erro75]
