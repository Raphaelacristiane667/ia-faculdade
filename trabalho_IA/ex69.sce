// =============================================================================
// ex69.sce — Papel 30 cm (largura) x 20 cm (altura); canto superior direito
// dobrado ate a borda inferior. x = cateto vertical do triangulo (borda direita),
// y = comprimento do vinco. y^2 = x^3/(x-10), 10 < x <= 20.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex69(x)
    xx = x(1)
    if xx <= 10 | xx > 20 then
        c = 1e9
        return
    end
    c = sqrt(xx^3/(xx - 10))
endfunction

[x_ag, y_ag, hist69] = ag(f_ex69, 10.01, 20, "min", 50, 100, %f, "Ex. 69 — Comprimento minimo do vinco")

x_ana = 15
y_ana = 15*sqrt(3)
erro69 = abs(y_ag - y_ana)

disp("========================================")
disp("EXERCICIO 69 - Dobra de papel 30x20 cm")
disp("========================================")
disp("y^2 = x^3/(x-10), x cateto vertical na borda direita")
disp("RESULTADO FINAL")
disp(["x (cateto vertical):" string(x_ag) " cm"])
disp(["y (vinco minimo):" string(y_ag) " cm"])
disp(" ")
disp("Valor analitico:")
disp(["x = 15 cm, y = 15*sqrt(3) ~" string(y_ana) " cm"])
disp(["Erro |y_AG - y_ana|:" string(erro69)])

RESUMO_ROTULO69 = "Vinco minimo"
RESUMO_EX69 = [y_ag, y_ana, erro69]
