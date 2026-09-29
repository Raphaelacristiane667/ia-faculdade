// =============================================================================
// ex52.sce — Reta por (3,5) com interceptos a,b>0, area do 1o quadrante ab/2 MIN?
// (Problema: area MINIMA positiva com 3/a+5/b=1 => a=6, b=10, y=-(5/3)x+10, area 30.)
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex52(x)
    aa = x(1)
    if aa <= 3 then
        c = 1e9
    else
        bb = 5*aa/(aa - 3)
        c = aa*bb/2
    end
endfunction

[a_ag, A_ag, hist52] = ag(f_ex52, 3.01, 30, "min", 50, 100, %f, "Ex. 52 — Area minima")

a_ana = 6
b_ana = 10
A_ana = 30
erro52 = abs(A_ag - A_ana)

disp("========================================")
disp("EXERCICIO 52 - Reta por (3,5), triangulo no 1o quadrante")
disp("========================================")
disp("RESULTADO FINAL")
disp(["Intercepto x:" string(a_ag)])
disp(["Intercepto y:" string(5*a_ag/(a_ag-3))])
disp(["Area:" string(A_ag)])
disp(" ")
disp("Valor analitico:")
disp(["y = -(5/3)x + 10, area 30"])
disp(["Erro:" string(erro52)])

RESUMO_ROTULO52 = "Area minima"
RESUMO_EX52 = [A_ag, A_ana, erro52]
