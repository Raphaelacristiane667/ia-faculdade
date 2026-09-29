// =============================================================================
// ex12.sce
// Stewart 4.7 — Caixa sem tampa: chapa quadrada 3 m, corta quadrado x nos cantos.
// Volume V(x) = x * (3 - 2x)^2, x > 0 e 3 - 2x > 0  =>  0 < x < 1.5
// Objetivo: maximizar V.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then
    clear
    clc
end

if ~isdef("ag") then
    exec("ag_generico.sci", -1)
end

function c = f_ex12(x)
    xx = x(1)
    c = xx * (3 - 2*xx)^2
endfunction

[x_ag, V_ag, hist12] = ag(f_ex12, 0.01, 1.49, "max", 50, 100, %f, "Ex. 12 — Volume maximo da caixa")

// V(x) = x(3-2x)^2
// V' = (3-2x)^2 + x*2(3-2x)(-2) = (3-2x)(3-6x) = 0
// x = 0.5 (interior) ou x = 1.5 (borda, V = 0)
x_ana = 0.5
V_ana = 2
erro12 = abs(V_ag - V_ana)

disp("========================================")
disp("EXERCICIO 12 - Caixa sem tampa (chapa 3 m)")
disp("========================================")

// ----- item (a): tabela de valores como no livro -----
disp("Tabela (item a) - varios x:")
disp("   x        V(x)")
for i = 1:14
    xt = 0.1 * i
    if xt < 1.5 then
        mprintf(" %5.1f   %8.4f\n", xt, xt*(3-2*xt)^2)
    end
end

disp(" ")
disp("RESULTADO FINAL")
disp(["x (corte nos cantos):" string(x_ag)])
disp(["Volume maximo:" string(V_ag)])
disp(" ")
disp("Valor analitico:")
disp(["x = 0.5, V = 2 m^3"])
disp(["Erro:" string(erro12)])

RESUMO_ROTULO12 = "Volume maximo"
RESUMO_EX12 = [V_ag, V_ana, erro12]
