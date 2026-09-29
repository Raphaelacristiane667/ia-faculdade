// =============================================================================
// ex72.sce — Calha: A(theta) = 100*sin(theta)*(1+cos(theta)).
// A'(theta)=0 => cos(theta)=1/2 => theta=pi/3, A=75*sqrt(3) ~ 129.9 cm^2.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex72(x)
    th = x(1)
    c = 100*sin(th)*(1 + cos(th))
endfunction

[th_ag, A_ag, hist72] = ag(f_ex72, 0.01, %pi/2, "max", 50, 100, %f, "Ex. 72 — Area da calha")

th_ana = %pi/3
A_ana = 75*sqrt(3)
erro72 = abs(A_ag - A_ana)

disp("========================================")
disp("EXERCICIO 72 - Calha")
disp("========================================")
disp("RESULTADO FINAL")
disp(["theta (graus):" string(th_ag*180/%pi)])
disp(["Area maxima:" string(A_ag)])
disp(" ")
disp("Valor analitico:")
disp(["theta = 60 graus, A ~ 129.9 cm^2"])
disp(["Erro:" string(erro72)])

RESUMO_ROTULO72 = "Area da calha"
RESUMO_EX72 = [A_ag, A_ana, erro72]
