// =============================================================================
// ex53.sce — Segmento no 1o quadrante (eixos) passando por (1,2): 1/a+2/b=1.
// Comprimento L = sqrt(a^2+b^2), b = 2a/(a-1), a>1.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex53(x)
    aa = x(1)
    if aa <= 1 then
        c = 1e9
    else
        bb = 2*aa/(aa - 1)
        c = sqrt(aa^2 + bb^2)
    end
endfunction

[a_ag, L_ag, hist53] = ag(f_ex53, 1.01, 10, "min", 50, 100, %f, "Ex. 53 — Segmento minimo")

a_ana = 2.587359583595836
b_ana = 2*a_ana/(a_ana - 1)
L_ana = sqrt(a_ana^2 + b_ana^2)
erro53 = abs(L_ag - L_ana)

disp("========================================")
disp("EXERCICIO 53 - Segmento minimo pelo (1,2)")
disp("========================================")
disp("RESULTADO FINAL")
disp(["Intercepto x:" string(a_ag)])
disp(["Comprimento:" string(L_ag)])
disp(" ")
disp("Valor analitico:")
disp(["L ~ 4.162 m (mesma geometria da escada, ex.38)"])
disp(["Erro:" string(erro53)])

RESUMO_ROTULO53 = "Comprimento min."
RESUMO_EX53 = [L_ag, L_ana, erro53]
