// =============================================================================
// ex32.sce — Janela normanda: semicirculo + retangulo, perimetro 10 (max area).
// Largura 2r, altura do retangulo h, P = 2r + 2h + pi*r = 10.
// A(r) = 2*r*h + pi*r^2/2, com h = (10 - r*(2+pi))/2.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex32(x)
    rr = x(1)
    hh = (10 - rr*(2 + %pi)) / 2
    if hh < 0 then
        c = -1e9
    else
        c = 2*rr*hh + %pi*rr^2/2
    end
endfunction

r_max = 10/(2 + %pi) - 0.01
[r_ag, A_ag, hist32] = ag(f_ex32, 0.01, r_max, "max", 50, 100, %f, "Ex. 32 — Janela normanda")

r_ana = 10/(4 + %pi)
h_ana = r_ana
A_ana = r_ana*(10 - r_ana*(2 + %pi)) + %pi*r_ana^2/2
erro32 = abs(A_ag - A_ana)

disp("========================================")
disp("EXERCICIO 32 - Janela normanda (perimetro 10)")
disp("========================================")
disp("RESULTADO FINAL")
disp(["Raio:" string(r_ag)])
disp(["Largura (2r):" string(2*r_ag)])
disp(["Altura do retangulo:" string((10 - r_ag*(2+%pi))/2)])
disp(["Area maxima:" string(A_ag)])
disp(" ")
disp("Valor analitico:")
disp(["r = 10/(4+pi) ~ 1.400, h = r, area ~ 7.001"])
disp(["Erro:" string(erro32)])

RESUMO_ROTULO32 = "Area da janela"
RESUMO_EX32 = [A_ag, A_ana, erro32]
