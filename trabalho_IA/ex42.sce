// =============================================================================
// ex42.sce — Forca F = mu*m*g/(mu*sin(theta)+cos(theta)), mu=0.5, minimizar F.
// F'(theta)=0 => tan(theta) = mu => theta = arctan(0.5) ~ 26.57 graus.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

mu = 0.5

function c = f_ex42(x)
    th = x(1)
    c = mu/(mu*sin(th) + cos(th))
endfunction

[th_ag, F_ag, hist42] = ag(f_ex42, 0.01, 1.5, "min", 50, 100, %f, "Ex. 42 — Forca minima")

th_ana = atan(mu)
F_ana = mu/(mu*sin(th_ana) + cos(th_ana))
erro42 = abs(F_ag - F_ana)

disp("========================================")
disp("EXERCICIO 42 - Forca minima (mu=0.5)")
disp("========================================")
disp("RESULTADO FINAL")
disp(["Angulo (rad):" string(th_ag)])
disp(["Angulo (graus):" string(th_ag*180/%pi)])
disp(["F/mg (sem unidade):" string(F_ag)])
disp(" ")
disp("Valor analitico:")
disp(["theta = arctan(mu) ~ 26.57 deg, F/mg ~ 0.447"])
disp(["Erro:" string(erro42)])

RESUMO_ROTULO42 = "Forca minima"
RESUMO_EX42 = [F_ag, F_ana, erro42]
