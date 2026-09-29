// ex25.sce — Retangulo inscrito em triangulo equilatero de lado L=1 (base na aresta).
// Altura H = sqrt(3)/2. Area A(b) = b*H*(1 - b/L) = (sqrt(3)/2)*b*(1-b).

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex25(x)
    bb = x(1)
    c = (sqrt(3)/2)*bb*(1 - bb)
endfunction

[b_ag, A_ag, hist25] = ag(f_ex25, 0.01, 0.99, "max", 50, 100, %f, "Ex. 25 — Area no triangulo equilatero")
h_ag = (sqrt(3)/2)*(1 - b_ag)

b_ana = 0.5
h_ana = sqrt(3)/4
A_ana = sqrt(3)/8
erro25 = abs(A_ag - A_ana)

disp("========================================")
disp("EXERCICIO 25 - Retangulo em triangulo equilatero L=1")
disp("========================================")
disp("RESULTADO FINAL")
disp(["Base b:" string(b_ag)])
disp(["Altura:" string(h_ag)])
disp(["Area maxima:" string(A_ag)])
disp(" ")
disp("Valor analitico:")
disp(["b = 0.5, h = 0.433, area = 0.2165 (sqrt(3)/8)"])
disp(["Erro:" string(erro25)])

RESUMO_ROTULO25 = "Area maxima"
RESUMO_EX25 = [A_ag, A_ana, erro25]
