// =============================================================================
// ex36.sce — Fio 10 m: quadrado (s) + circulo (r). 4s + 2*pi*r = 10.
// (a) tudo no circulo: A = 25/pi ~ 7.96. (b) area MINIMA com reparto.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex36(x)
    ss = x(1)
    rr = (10 - 4*ss)/(2*%pi)
    if rr < 0 then
        c = 1e9
    else
        c = ss^2 + %pi*rr^2
    end
endfunction

[s_ag, Amin_ag, hist36] = ag(f_ex36, 0, 2.5, "min", 50, 100, %f, "Ex. 36 — Area minima (fio 10 m)")

Amax_ana = 25/%pi
s_ana_b = 10/(4 + %pi)
r_ana_b = (10 - 4*s_ana_b)/(2*%pi)
Amin_ana = s_ana_b^2 + %pi*r_ana_b^2
erro36 = abs(Amin_ag - Amin_ana)

disp("========================================")
disp("EXERCICIO 36 - Fio 10 m: quadrado + circulo")
disp("========================================")
disp("(a) Tudo no circulo: area ~ 7.957")
disp(" ")
disp("RESULTADO FINAL — item (b) area MINIMA")
disp(["Lado do quadrado:" string(s_ag)])
disp(["Fio no quadrado (4s):" string(4*s_ag)])
disp(["Area total:" string(Amin_ag)])
disp(" ")
disp("Valor analitico (b):")
disp(["4s ~ 5.60 m, area ~ 3.50"])
disp(["Erro:" string(erro36)])

RESUMO_ROTULO36 = "Area minima"
RESUMO_EX36 = [Amin_ag, Amin_ana, erro36]
