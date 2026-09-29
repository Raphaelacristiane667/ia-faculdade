// =============================================================================
// ex64.sce — Moldura de pipa: lados externos a,a,b,b (figura so com letras).
// Angulo 90 graus entre lados a e b => area maxima A = a*b.
// Diagonal (a,a)-(b,b): sqrt(a^2+b^2); outra diagonal: 2ab/sqrt(a^2+b^2).
// Exemplo numerico: a=5, b=12 => A=60, diagonais 13 e 120/13.
// AG maximiza A(theta)=a*b*sin(theta), theta em (0, pi/2).
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

a = 5
b = 12

function c = f_ex64(x)
    tt = x(1)
    if tt <= 0 | tt >= %pi/2 then
        c = -1e9
        return
    end
    c = a*b*sin(tt)
endfunction

[th_ag, A_ag, hist64] = ag(f_ex64, 0.01, %pi/2 - 0.01, "max", 50, 100, %f, "Ex. 64 — Area maxima da pipa")

th_ana = %pi/2
A_ana = a*b
d1_ana = sqrt(a^2 + b^2)
d2_ana = 2*a*b/sqrt(a^2 + b^2)
erro64 = abs(A_ag - A_ana)

disp("========================================")
disp("EXERCICIO 64 - Moldura da pipa (parametros a, b)")
disp("========================================")
disp("RESULTADO FINAL (exemplo a=5, b=12)")
disp(["Angulo (AG, rad):" string(th_ag) " (analitico pi/2)"])
disp(["Area maxima A:" string(A_ag) " (analitico ab =" string(A_ana) ")"])
disp(["Diagonal sqrt(a^2+b^2):" string(d1_ana)])
disp(["Diagonal 2ab/sqrt(a^2+b^2):" string(d2_ana)])
disp(" ")
disp(["Erro |A_AG - ab|:" string(erro64)])

RESUMO_ROTULO64 = "Area da pipa"
RESUMO_EX64 = [A_ag, A_ana, erro64]
