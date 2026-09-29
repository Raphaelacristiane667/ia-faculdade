// =============================================================================
// ex18.sce — Grupo B: verificacao numerica (demonstracao em explicacoes.md).
// (a) Area 100 -> perimetro minimo: quadrado 10x10, P=40.
// (b) Perimetro 100 -> area maxima: quadrado 25x25, A=625.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex18a(x)
    xx = x(1)
    c = 2*(xx + 100/xx)
endfunction

function c = f_ex18b(x)
    xx = x(1)
    c = xx*(50 - xx)
endfunction

[xa_ag, Pa_ag, h18a] = ag(f_ex18a, 1, 99, "min", 50, 100, %f, "Ex.18a - Perimetro minimo")
[xb_ag, Ab_ag, h18b] = ag(f_ex18b, 0.1, 49.9, "max", 50, 100, %f, "Ex.18b - Area maxima")

Pa_ana = 40
Ab_ana = 625
erro18a = abs(Pa_ag - Pa_ana)
erro18b = abs(Ab_ag - Ab_ana)

disp("========================================")
disp("EXERCICIO 18 - Quadrado vs retangulo (grupo B)")
disp("========================================")
disp("RESULTADO FINAL")
disp("(a) Area fixa 100 — perimetro minimo")
disp(["Largura x:" string(xa_ag) ", altura:" string(100/xa_ag)])
disp(["Perimetro:" string(Pa_ag)])
disp(" ")
disp("(b) Perimetro fixo 100 — area maxima")
disp(["Largura x:" string(xb_ag) ", altura:" string(50 - xb_ag)])
disp(["Area:" string(Ab_ag)])
disp(" ")
disp("Valor analitico:")
disp(["(a) 10x10, P=40; (b) 25x25, A=625"])
disp(["Erro (a):" string(erro18a) ", Erro (b):" string(erro18b)])

RESUMO_ROTULO18A = "Perimetro minimo"
RESUMO_EX18A = [Pa_ag, Pa_ana, erro18a]
RESUMO_ROTULO18B = "Area maxima"
RESUMO_EX18B = [Ab_ag, Ab_ana, erro18b]
