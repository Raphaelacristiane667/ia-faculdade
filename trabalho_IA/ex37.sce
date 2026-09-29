// =============================================================================
// ex37.sce — Lata sem tampa, volume 1000 (cm^3). Minimizar area.
// V = pi*r^2*h = 1000, S = pi*r^2 + 2*pi*r*h = pi*r^2 + 2000/r.
// Otimo: r = h = (1000/pi)^(1/3).
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex37(x)
    rr = x(1)
    c = %pi*rr^2 + 2000/rr
endfunction

[r_ag, S_ag, hist37] = ag(f_ex37, 0.1, 20, "min", 50, 100, %f, "Ex. 37 — Lata sem tampa")

r_ana = (1000/%pi)^(1/3)
S_ana = %pi*r_ana^2 + 2000/r_ana
erro37 = abs(S_ag - S_ana)

disp("========================================")
disp("EXERCICIO 37 - Lata sem tampa, V=1000")
disp("========================================")
disp("RESULTADO FINAL")
disp(["Raio:" string(r_ag)])
disp(["Altura:" string(1000/(%pi*r_ag^2))])
disp(["Area minima:" string(S_ag)])
disp(" ")
disp("Valor analitico:")
disp(["r = h ~ 6.828 cm"])
disp(["Erro:" string(erro37)])

RESUMO_ROTULO37 = "Area da lata"
RESUMO_EX37 = [S_ag, S_ana, erro37]
