// =============================================================================
// ex62.sce — 100 apartamentos a $800; cada +$10 no aluguel perde 1 inquilino.
// n = 100 - k, r = 800 + 10*k, receita R(k) = (100-k)(800+10*k).
// R' = 200 - 20*k = 0 => k=10, r=900, n=90, R=81000.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex62(x)
    kk = x(1)
    if kk < 0 | kk > 100 then
        c = -1e9
    else
        nn = 100 - kk
        rr = 800 + 10*kk
        c = nn*rr
    end
endfunction

[k_ag, Rev_ag, hist62] = ag(f_ex62, 0, 100, "max", 50, 100, %f, "Ex. 62 — Receita de alugueis")

k_ana = 10
Rev_ana = 81000
erro62 = abs(Rev_ag - Rev_ana)

disp("========================================")
disp("EXERCICIO 62 - Alugueis")
disp("========================================")
disp("RESULTADO FINAL")
disp(["Aumento k ($10 cada):" string(k_ag)])
disp(["Aluguel:" string(800 + 10*k_ag)])
disp(["Apartamentos ocupados:" string(100 - k_ag)])
disp(["Receita total:" string(Rev_ag)])
disp(" ")
disp("Valor analitico:")
disp(["aluguel $900, 90 aptos, receita $81000"])
disp(["Erro:" string(erro62)])

RESUMO_ROTULO62 = "Receita maxima"
RESUMO_EX62 = [Rev_ag, Rev_ana, erro62]
