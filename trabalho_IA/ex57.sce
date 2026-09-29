// =============================================================================
// ex57.sce — Item (b) apenas. C(x) = 16000 + 200*x + 4*x^(3/2).
// Custo medio CM(x) = C(x)/x = 16000/x + 200 + 4*sqrt(x).
// CM'(x) = 0 => x^(3/2) = 8000 => x = 400, CM_min = 320.
// Em x=1000: C=342491, CM~342.49, C'(1000)~389.74.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex57(x)
    xx = x(1)
    if xx <= 0 then
        c = 1e9
    else
        c = 16000/xx + 200 + 4*sqrt(xx)
    end
endfunction

[x_ag, CM_ag, hist57] = ag(f_ex57, 1, 2000, "min", 50, 100, %f, "Ex. 57 — Custo medio minimo")

x_ana = 400
CM_ana = 320
erro57 = abs(CM_ag - CM_ana)

x1 = 1000
C1 = 16000 + 200*x1 + 4*x1^(3/2)
CM1 = C1/x1
marg1 = 200 + 6*sqrt(x1)

disp("========================================")
disp("EXERCICIO 57 - Custo (item b)")
disp("========================================")
disp("Item (a): demonstracao — ver grupo B no enunciado.")
disp(" ")
disp("RESULTADO FINAL")
disp(["x que minimiza custo medio (AG):" string(x_ag)])
disp(["Custo medio minimo:" string(CM_ag)])
disp(" ")
disp(["Em x=1000: C =" string(C1)])
disp(["Custo medio ~" string(CM1)])
disp(["Custo marginal ~" string(marg1)])
disp(" ")
disp("Valor analitico:")
disp(["x=400, CM_min=320; x=1000: C=342491, CM~342.49, C'~389.74"])
disp(["Erro (CM min):" string(erro57)])

RESUMO_ROTULO57 = "Custo medio min."
RESUMO_EX57 = [CM_ag, CM_ana, erro57]
