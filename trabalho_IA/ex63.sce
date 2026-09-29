// =============================================================================
// ex63.sce — Perimetro 12: triangulo de area maxima e equilatero (lados 4).
// AG em triangulo isosceles a=b=x, c=12-2x, area de Heron.
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex63(x)
    aa = x(1)
    bb = aa
    cc = 12 - 2*aa
    if cc <= 0 | aa <= 0 then
        c = -1e9
    else
        ss = (aa + bb + cc)/2
        c = sqrt(ss*(ss - aa)*(ss - bb)*(ss - cc))
    end
endfunction

[a_ag, A_ag, hist63] = ag(f_ex63, 0.1, 5.9, "max", 50, 100, %f, "Ex. 63 — Area maxima (P=12)")

A_ana = sqrt(3)/4*16
erro63 = abs(A_ag - A_ana)

disp("========================================")
disp("EXERCICIO 63 - Triangulo perimetro 12")
disp("========================================")
disp("RESULTADO FINAL")
disp(["Lado (isosceles AG):" string(a_ag)])
disp(["Terceiro lado:" string(12 - 2*a_ag)])
disp(["Area maxima:" string(A_ag)])
disp(" ")
disp("Valor analitico:")
disp(["equilatero 4,4,4, area ~ 6.93"])
disp(["Erro:" string(erro63)])

RESUMO_ROTULO63 = "Area maxima"
RESUMO_EX63 = [A_ag, A_ana, erro63]
