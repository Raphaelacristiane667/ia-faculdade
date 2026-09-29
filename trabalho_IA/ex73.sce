// =============================================================================
// ex73.sce — Maximizar angulo theta; P em AB vertical (comprimento 3).
// Distancia horizontal: 2 na altura de B, 5 na altura de A.
// x = |AP|, 0<=x<=3: theta(x)=atan((3-x)/2)+atan(x/5).
// =============================================================================

clc
if ~isdef("RODANDO_MAIN") then clear; clc; end
if ~isdef("ag") then exec("ag_generico.sci", -1); end

AB = 3
hA = 5
hB = 2

function c = f_ex73(x)
    xx = x(1)
    c = atan((AB - xx)/hB) + atan(xx/hA)
endfunction

[x_ag, th_ag, hist73] = ag(f_ex73, 0, AB, "max", 50, 100, %f, "Ex. 73 — Angulo maximo na vertical")

x_ana = 5 - 2*sqrt(5)
th_ana = f_ex73(x_ana)
erro73 = abs(th_ag - th_ana)

disp("========================================")
disp("EXERCICIO 73 - Angulo maximo (AB vertical)")
disp("========================================")
disp("theta(x)=atan((3-x)/2)+atan(x/5), x=AP a partir de A")
disp("RESULTADO FINAL")
disp(["P com AP =" string(x_ag) " m (a partir de A)"])
disp(["theta max (rad):" string(th_ag) " (~" string(th_ag*180/%pi) " graus)"])
disp(" ")
disp("Valor analitico:")
disp(["x = 5-2*sqrt(5) ~" string(x_ana) ", theta ~57 graus"])
disp(["theta analitico:" string(th_ana)])
disp(["Erro |theta_AG - theta_ana|:" string(erro73)])

RESUMO_ROTULO73 = "Angulo maximo"
RESUMO_EX73 = [th_ag, th_ana, erro73]
