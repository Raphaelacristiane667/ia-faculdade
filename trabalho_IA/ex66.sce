// =============================================================================
// ex66.sce — Consumo c(v) (Stewart #62, p.302): grafico sem dados numericos no livro.
// Modelo APROXIMADO apenas para ilustrar a forma da curva (nao e dado do enunciado).
// G(v)=c(v)/v: minimo quando a reta pela origem e tangente a c(v).
// Estimativa do livro para v* ~ 80 km/h (leitura do grafico).
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

// c(v) aproximada (km/h): minimo perto de 50, sobe em baixas e altas velocidades
function c = c_aprox(v)
    c = 18 + 0.08*v + 1200/(v + 15)^2
endfunction

function g = G_ex66(x)
    vv = x(1)
    if vv <= 5 then
        g = 1e9
        return
    end
    g = c_aprox(vv)/vv
endfunction

[v_ag, G_ag, hist66] = ag(G_ex66, 10, 130, "min", 50, 100, %f, "Ex. 66 — G=c/v minimo")

v_ref = 80
G_ref = c_aprox(v_ref)/v_ref
erro66 = abs(v_ag - v_ref)

if ~isdef("RODANDO_MAIN") then
    vv = linspace(20, 120, 300)
    cc = zeros(size(vv))
    gg = zeros(size(vv))
    for i = 1:size(vv, "*")
        cc(i) = c_aprox(vv(i))
        gg(i) = cc(i)/vv(i)
    end
    clf
    subplot(2, 1, 1)
    plot(vv, cc)
    xtitle("Ex. 66 — Consumo c(v) (modelo ilustrativo)", "v (km/h)", "c")
    subplot(2, 1, 2)
    plot(vv, gg)
    xtitle("Ex. 66 — Custo por km G = c/v", "v (km/h)", "G")
end

disp("========================================")
disp("EXERCICIO 66 - Consumo e custo por km G=c/v")
disp("========================================")
disp("AVISO: c(v) e um modelo aproximado so para ilustrar o grafico do livro.")
disp("RESULTADO FINAL (AG sobre G):")
disp(["v* (km/h):" string(v_ag)])
disp(["G min:" string(G_ag)])
disp(" ")
disp("Ideia: G minimo <=> reta pela origem tangente a c(v).")
disp("Estimativa de leitura no livro: v* ~ 80 km/h")
disp(["G(80) no modelo:" string(G_ref)])
disp(["|v_AG - 80| (referencia grafica):" string(erro66)])

RESUMO_ROTULO66 = "Velocidade v*"
RESUMO_EX66 = [v_ag, v_ref, erro66]
