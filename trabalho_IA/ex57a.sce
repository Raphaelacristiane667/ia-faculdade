// =============================================================================
// ex57a.sce — Grupo B: se c(x)=C(x)/x e minimo, entao C'(x)=c(x).
// Verificacao numerica com C do ex57b em x=400.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end

function C57(x)
    C57 = 16000 + 200*x + 4*x^(3/2)
endfunction

function Cp57(x)
    Cp57 = 200 + 6*sqrt(x)
endfunction

x = 400
Cx = C57(x)
CMx = Cx/x
Cpx = Cp57(x)
diff57 = abs(Cpx - CMx)

disp("========================================")
disp("EXERCICIO 57(a) - C'(x) = custo medio")
disp("========================================")
disp("RESULTADO FINAL")
disp(["x:" string(x)])
disp(["C(x):" string(Cx)])
disp(["Custo medio c(x)=C/x:" string(CMx)])
disp(["C'(x):" string(Cpx)])
disp(["|C'(x)-c(x)|:" string(diff57)])
disp(" ")
disp("Demonstracao (derivada): ver explicacoes.md")

RESUMO_ROTULO57A = "Cp igual a Cm"
RESUMO_EX57A = [Cpx, CMx, diff57]
