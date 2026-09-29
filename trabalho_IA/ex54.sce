// =============================================================================
// ex54.sce — y = 1 + 40*x^3 - 3*x^5. Inclinacao da tangente y' = 120*x^2 - 15*x^4.
// Maximizar y': y'' = 240*x - 60*x^3 = 0 => x = +/-2 (x=0 e minimo local).
// y'(2) = 240; pontos (2,225) e (-2,-223).
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex54(x)
    xx = x(1)
    c = 120*xx^2 - 15*xx^4
endfunction

[x_ag, slope_ag, hist54] = ag(f_ex54, 0.5, 3, "max", 50, 100, %f, "Ex. 54 — Inclinacao maxima")

slope_ana = 240
erro54 = abs(slope_ag - slope_ana)

y2 = 1 + 40*2^3 - 3*2^5
ym2 = 1 + 40*(-2)^3 - 3*(-2)^5

disp("========================================")
disp("EXERCICIO 54 - Tangente de maior inclinacao")
disp("========================================")
disp("RESULTADO FINAL")
disp(["x (AG, ramo positivo):" string(x_ag)])
disp(["y' maximo:" string(slope_ag)])
disp(["Ponto (2, y):" string(2) "," string(y2)])
disp(["Ponto (-2, y):" string(-2) "," string(ym2)])
disp(" ")
disp("Valor analitico:")
disp(["x = +/-2, y' = 240, (2,225) e (-2,-223)"])
disp(["Erro:" string(erro54)])

RESUMO_ROTULO54 = "Inclinacao max."
RESUMO_EX54 = [slope_ag, slope_ana, erro54]
