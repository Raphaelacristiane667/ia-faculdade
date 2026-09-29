// =============================================================================
// ex70.sce — Cano no corredor 3 m que dobra para 2 m (maior comprimento que passa).
// L(theta) = 3/sin(theta) + 2/cos(theta), 0 < theta < pi/2.
// Minimo: L = (3^(2/3) + 2^(2/3))^(3/2) ~ 7.02 m.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex70(x)
    th = x(1)
    st = sin(th)
    ct = cos(th)
    if st <= 0 | ct <= 0 then
        c = 1e9
    else
        c = 3/st + 2/ct
    end
endfunction

[th_ag, L_ag, hist70] = ag(f_ex70, 0.01, 1.55, "min", 50, 100, %f, "Ex. 70 — Comprimento minimo do cano")

L_ana = (3^(2/3) + 2^(2/3))^(3/2)
erro70 = abs(L_ag - L_ana)

disp("========================================")
disp("EXERCICIO 70 - Cano no corredor")
disp("========================================")
disp("RESULTADO FINAL")
disp(["theta (graus):" string(th_ag*180/%pi)])
disp(["Comprimento maximo do cano L:" string(L_ag)])
disp(" ")
disp("Valor analitico:")
disp(["L = (3^(2/3)+2^(2/3))^(3/2) ~ 7.02 m"])
disp(["Erro:" string(erro70)])

RESUMO_ROTULO70 = "Compr. do cano"
RESUMO_EX70 = [L_ag, L_ana, erro70]
