// =============================================================================
// ex45.sce — Area S(theta), s=1, h=2:
//   S = 6sh - (3/2)s^2 cotg(theta) + (3s^2*sqrt(3)/2) cossec(theta)
//     = 12 - (3/2)cot(theta) + (3*sqrt(3)/2)cossec(theta).
// dS/dtheta = (3/2)s^2 cossec^2(theta) - (3*sqrt(3)/2)s^2 cossec(theta)cotg(theta)
//           = (3/2)s^2 cossec(theta)*(cossec(theta) - sqrt(3)*cotg(theta)).
// Zero => cos(theta) = 1/sqrt(3) => theta ~ 54.74 graus.
// S_min = 6sh + (3*sqrt(2)/2)s^2 = 12 + 3*sqrt(2)/2 ~ 14.121.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex45(x)
    th = x(1)
    st = sin(th)
    if st <= 0 then
        c = 1e9
    else
        c = 12 - (3/2)/tan(th) + (3*sqrt(3)/2)/st
    end
endfunction

[th_ag, S_ag, hist45] = ag(f_ex45, 0.3, 1.4, "min", 50, 100, %f, "Ex. 45 — Superficie minima")

th_ana = acos(1/sqrt(3))
S_ana = 12 + (3*sqrt(2)/2)
erro45 = abs(S_ag - S_ana)

disp("========================================")
disp("EXERCICIO 45 - Angulo theta (area minima)")
disp("========================================")
disp("RESULTADO FINAL")
disp(["theta (graus):" string(th_ag*180/%pi)])
disp(["Area minima S:" string(S_ag)])
disp(" ")
disp("Valor analitico:")
disp(["cos(theta)=1/sqrt(3), theta~54.74 deg"])
disp(["S = 12 + 3*sqrt(2)/2 ~ 14.121"])
disp(["Erro:" string(erro45)])

RESUMO_ROTULO45 = "Area minima S"
RESUMO_EX45 = [S_ag, S_ana, erro45]
