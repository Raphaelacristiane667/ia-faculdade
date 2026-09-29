// =============================================================================
// ex44.sce — E(v) = a*v^3*L/(v-u), a=L=u=1 => E = v^3/(v-1), v>1, minimizar E.
// E'(v) = v^2(2v-3)/(v-1)^2 = 0 => v = 3/2.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex44(x)
    vv = x(1)
    if vv <= 1 then
        c = 1e9
    else
        c = vv^3/(vv - 1)
    end
endfunction

[v_ag, E_ag, hist44] = ag(f_ex44, 1.01, 5, "min", 50, 100, %f, "Ex. 44 — Energia minima")

v_ana = 1.5
E_ana = 6.75
erro44 = abs(E_ag - E_ana)

// Grafico E(v) (item do enunciado)
vv_plot = linspace(1.05, 4, 200)
EE_plot = vv_plot.^3./(vv_plot - 1)
if ~isdef("RODANDO_MAIN") then
    clf
    plot(vv_plot, EE_plot)
    xtitle("Ex. 44 — Energia E(v)", "v", "E")
end

disp("========================================")
disp("EXERCICIO 44 - Energia E(v)")
disp("========================================")
disp("RESULTADO FINAL")
disp(["v otimo:" string(v_ag)])
disp(["E minima:" string(E_ag)])
disp(" ")
disp("Valor analitico:")
disp(["v = 1.5, E = 6.75"])
disp(["Erro:" string(erro44)])

RESUMO_ROTULO44 = "Energia minima"
RESUMO_EX44 = [E_ag, E_ana, erro44]
