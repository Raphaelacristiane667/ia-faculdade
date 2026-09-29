// =============================================================================
// ex39.sce — Copo conico cortado de disco raio 1: volume MAXIMO.
// Base r, altura h = sqrt(1-r^2), V = pi*r^2*h/3.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex39(x)
    rr = x(1)
    if rr <= 0 | rr >= 1 then
        c = -1e9
    else
        hh = sqrt(1 - rr^2)
        c = %pi*rr^2*hh/3
    end
endfunction

[r_ag, V_ag, hist39] = ag(f_ex39, 0.01, 0.99, "max", 50, 100, %f, "Ex. 39 — Volume do copo")

r_ana = sqrt(2/3)
V_ana = %pi*r_ana^2*sqrt(1 - r_ana^2)/3
erro39 = abs(V_ag - V_ana)

disp("========================================")
disp("EXERCICIO 39 - Copo conico (disco R=1)")
disp("========================================")
disp("RESULTADO FINAL")
disp(["Raio da base:" string(r_ag)])
disp(["Volume maximo:" string(V_ag)])
disp(" ")
disp("Valor analitico:")
disp(["r = sqrt(2/3), V ~ 0.4031"])
disp(["Erro:" string(erro39)])

RESUMO_ROTULO39 = "Volume do copo"
RESUMO_EX39 = [V_ag, V_ana, erro39]
