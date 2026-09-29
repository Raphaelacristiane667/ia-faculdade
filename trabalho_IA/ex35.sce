// =============================================================================
// ex35.sce — Fio 10 m: quadrado (lado s) + triangulo equilatero (lado t).
// 4s + 3t = 10. (a) tudo no quadrado: s=2.5, A=6.25.
// (b) area total MINIMA: A(s) = s^2 + (sqrt(3)/4)*((10-4s)/3)^2.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex35(x)
    ss = x(1)
    tt = (10 - 4*ss)/3
    if tt < 0 then
        c = 1e9
    else
        c = ss^2 + (sqrt(3)/4)*tt^2
    end
endfunction

[s_ag, Amin_ag, hist35] = ag(f_ex35, 0, 2.5, "min", 50, 100, %f, "Ex. 35 — Area minima (fio 10 m)")

// s otimo (b): 2s = (sqrt(3)/9)*(10-4s) => s = 10*sqrt(3)/(9+4*sqrt(3))
s_ana_b = 10*sqrt(3)/(9 + 4*sqrt(3))
t_ana_b = (10 - 4*s_ana_b)/3
Amin_ana = s_ana_b^2 + (sqrt(3)/4)*t_ana_b^2
erro35 = abs(Amin_ag - Amin_ana)

disp("========================================")
disp("EXERCICIO 35 - Fio 10 m: quadrado + triangulo")
disp("========================================")
disp("(a) Tudo no quadrado: s=2.5, area=6.25")
disp(" ")
disp("RESULTADO FINAL — item (b) area MINIMA")
disp(["Lado do quadrado:" string(s_ag)])
disp(["Fio no quadrado (4s):" string(4*s_ag)])
disp(["Area total:" string(Amin_ag)])
disp(" ")
disp("Valor analitico (b):")
disp(["4s ~ 4.35 m, area ~ 2.72"])
disp(["Erro:" string(erro35)])

RESUMO_ROTULO35 = "Area minima"
RESUMO_EX35 = [Amin_ag, Amin_ana, erro35]
