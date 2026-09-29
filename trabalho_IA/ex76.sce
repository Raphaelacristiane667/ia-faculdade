// =============================================================================
// ex76.sce — R(theta)=C[(a-b cotg theta)/r1^4 + b cossec theta/r2^4].
// (b) Minimo: cos theta = (r2/r1)^4; (c) r2=(2/3)r1 => cos theta=16/81.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

a = 1
b = 1
r1 = 1
r2 = 2/3

function c = f_ex76(x)
    th = x(1)
    st = sin(th)
    if st <= 0 then
        c = 1e9
    else
        c = (a - b/tan(th))/r1^4 + b/st/r2^4
    end
endfunction

[th_ag, R_ag, hist76] = ag(f_ex76, 0.01, 1.5, "min", 50, 100, %f, "Ex. 76 — R minimo")

th_ana = acos((r2/r1)^4)
erro76 = abs(th_ag - th_ana)

disp("========================================")
disp("EXERCICIO 76 - Resistencia R(theta)")
disp("========================================")
disp("RESULTADO FINAL — item (c)")
disp(["theta (graus):" string(th_ag*180/%pi)])
disp(["R minimo:" string(R_ag)])
disp(" ")
disp("Valor analitico:")
disp(["cos(theta)=16/81, theta~78.6 graus (~79)"])
disp(["Erro em theta (rad):" string(erro76)])

RESUMO_ROTULO76 = "Angulo otimo"
RESUMO_EX76 = [th_ag, th_ana, erro76]
