// =============================================================================
// ex78.sce — I(x)=1/(d^2+x^2)+1/(d^2+(10-x)^2), k=1.
// (b) d=5: minimo em x=5; (c) d=10: x=5 maximo local;
// (d) d_critico = 5*sqrt(3) ~ 8.66 (I''(5)=0).
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

function c = f_ex78(x)
    xx = x(1)
    d = 5
    c = 1/(d^2 + xx^2) + 1/(d^2 + (10 - xx)^2)
endfunction

[x_ag, I_ag, hist78] = ag(f_ex78, 0, 10, "min", 50, 100, %f, "Ex. 78 — Intensidade minima (d=5)")

x_ana = 5
I_ana = 2/(25 + 25)
erro78 = abs(I_ag - I_ana)

// Graficos I(x) para d = 5, 5*sqrt(3) e 10
xx_plot = linspace(0, 10, 201)
I5 = 1./(25 + xx_plot.^2) + 1./(25 + (10 - xx_plot).^2)
d3 = 5*sqrt(3)
I53 = 1./(d3^2 + xx_plot.^2) + 1./(d3^2 + (10 - xx_plot).^2)
I10 = 1./(100 + xx_plot.^2) + 1./(100 + (10 - xx_plot).^2)

if ~isdef("RODANDO_MAIN") then
    clf
    plot(xx_plot, I5, "b", xx_plot, I53, "r", xx_plot, I10, "g")
    legend("d=5", "d=5*sqrt(3)", "d=10")
    xtitle("Ex. 78 — Intensidade I(x)", "x", "I")
end

I5_em5 = 1/50 + 1/50
I10_em5 = 1/(100+25) + 1/(100+25)

disp("========================================")
disp("EXERCICIO 78 - Duas fontes de luz")
disp("========================================")
disp("RESULTADO FINAL — item (b), d=5")
disp(["x (minimo):" string(x_ag)])
disp(["I minima:" string(I_ag)])
disp(" ")
disp(["Em d=10, I(5)=" string(I10_em5) " (maximo local)"])
disp(["d critico 5*sqrt(3) ~" string(d3)])
disp(" ")
disp("Valor analitico:")
disp(["d=5: minimo em x=5, I=0.04"])
disp(["Erro:" string(erro78)])

RESUMO_ROTULO78 = "Intensidade min."
RESUMO_EX78 = [I_ag, I_ana, erro78]
