// =============================================================================
// main.sce
// Stewart 4.7 (exercicios 1 a 78) — roda os scripts existentes e resume.
//
// Como usar:
//   1) File -> Change current directory...  (pasta trabalho_IA)
//   2) exec("main.sce", -1)
// =============================================================================

clear
clc
lines(0)

RODANDO_MAIN = %t
TOLER = 1e-2

try
    chdir(get_absolute_file_path("main.sce"))
catch
end

exec("ag_generico.sci", -1)

if ~isempty(fileinfo("resultados.txt")) then
    mdelete("resultados.txt")
end
diary("resultados.txt")

disp("==========================================================")
disp("TRABALHO IA — Stewart 4.7 (exercicios 1 a 78)")
disp("Algoritmo genetico: 50 individuos, 100 geracoes,")
disp("cruzamento 80%, mutacao 10%, elitismo, semente fixa (1)")
disp("==========================================================")
disp(" ")

// ----- executa ex01.sce ... ex78.sce (se o arquivo existir) -----
for num = 1:78
    arq = sprintf("ex%02d.sce", num)
    if isempty(fileinfo(arq)) then
        mprintf("-- Exercicio %02d: falta o arquivo %s\n", num, arq)
    else
        mprintf("-- Executando %s\n", arq)
        exec(arq, -1)
    end
    disp(" ")
end

// ----- grupo B: scripts com sufixo (ex57a, ex58a) -----
grupo_b_extra = ["ex57a.sce", "ex58a.sce"]
for i = 1:size(grupo_b_extra, "*")
    arq = grupo_b_extra(i)
    if isempty(fileinfo(arq)) then
        mprintf("-- %s: arquivo nao encontrado\n", arq)
    else
        mprintf("-- Executando %s\n", arq)
        exec(arq, -1)
    end
    disp(" ")
end

// ----- tabela-resumo (exercicios implementados) -----
function st = ag_status(erro, tol)
    if erro <= tol then
        st = "OK"
    else
        st = "ATENCAO"
    end
endfunction

function st = ag_status_ex50(erro_x, erro_rel_c, tol)
    if erro_x <= tol | erro_rel_c <= tol then
        st = "OK"
    else
        st = "ATENCAO"
    end
endfunction

disp("==========================================================")
disp("RESUMO — comparacao AG x calculo manual")
disp("==========================================================")
mprintf("%-6s %-22s %14s %14s %12s %8s\n", "Ex.", "O que medimos", "AG", "Manual", "Diferenca", "Confere")
mprintf("%s\n", "--------------------------------------------------------------------------------")

if exists("RESUMO_EX01") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 1, RESUMO_ROTULO01, RESUMO_EX01(1), RESUMO_EX01(2), RESUMO_EX01(3), ag_status(RESUMO_EX01(3), TOLER))
end
if exists("RESUMO_EX02") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 2, RESUMO_ROTULO02, RESUMO_EX02(1), RESUMO_EX02(2), RESUMO_EX02(3), ag_status(RESUMO_EX02(3), TOLER))
end
if exists("RESUMO_EX03") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 3, RESUMO_ROTULO03, RESUMO_EX03(1), RESUMO_EX03(2), RESUMO_EX03(3), ag_status(RESUMO_EX03(3), TOLER))
end
if exists("RESUMO_EX04") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 4, RESUMO_ROTULO04, RESUMO_EX04(1), RESUMO_EX04(2), RESUMO_EX04(3), ag_status(RESUMO_EX04(3), TOLER))
end
if exists("RESUMO_EX05") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 5, RESUMO_ROTULO05, RESUMO_EX05(1), RESUMO_EX05(2), RESUMO_EX05(3), ag_status(RESUMO_EX05(3), TOLER))
end
if exists("RESUMO_EX06") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 6, RESUMO_ROTULO06, RESUMO_EX06(1), RESUMO_EX06(2), RESUMO_EX06(3), ag_status(RESUMO_EX06(3), TOLER))
end
if exists("RESUMO_EX07") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 7, RESUMO_ROTULO07, RESUMO_EX07(1), RESUMO_EX07(2), RESUMO_EX07(3), ag_status(RESUMO_EX07(3), TOLER))
end
if exists("RESUMO_EX08") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 8, RESUMO_ROTULO08, RESUMO_EX08(1), RESUMO_EX08(2), RESUMO_EX08(3), ag_status(RESUMO_EX08(3), TOLER))
end
if exists("RESUMO_EX09") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 9, RESUMO_ROTULO09, RESUMO_EX09(1), RESUMO_EX09(2), RESUMO_EX09(3), ag_status(RESUMO_EX09(3), TOLER))
end
if exists("RESUMO_EX10") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 10, RESUMO_ROTULO10, RESUMO_EX10(1), RESUMO_EX10(2), RESUMO_EX10(3), ag_status(RESUMO_EX10(3), TOLER))
end
if exists("RESUMO_EX11") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 11, RESUMO_ROTULO11, RESUMO_EX11(1), RESUMO_EX11(2), RESUMO_EX11(3), ag_status(RESUMO_EX11(3), TOLER))
end
if exists("RESUMO_EX12") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 12, RESUMO_ROTULO12, RESUMO_EX12(1), RESUMO_EX12(2), RESUMO_EX12(3), ag_status(RESUMO_EX12(3), TOLER))
end
if exists("RESUMO_EX13") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 13, RESUMO_ROTULO13, RESUMO_EX13(1), RESUMO_EX13(2), RESUMO_EX13(3), ag_status(RESUMO_EX13(3), TOLER))
end
if exists("RESUMO_EX14") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 14, RESUMO_ROTULO14, RESUMO_EX14(1), RESUMO_EX14(2), RESUMO_EX14(3), ag_status(RESUMO_EX14(3), TOLER))
end
if exists("RESUMO_EX15") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 15, RESUMO_ROTULO15, RESUMO_EX15(1), RESUMO_EX15(2), RESUMO_EX15(3), ag_status(RESUMO_EX15(3), TOLER))
end
if exists("RESUMO_EX16") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 16, RESUMO_ROTULO16, RESUMO_EX16(1), RESUMO_EX16(2), RESUMO_EX16(3), ag_status(RESUMO_EX16(3), TOLER))
end
if exists("RESUMO_EX17") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 17, RESUMO_ROTULO17, RESUMO_EX17(1), RESUMO_EX17(2), RESUMO_EX17(3), ag_status(RESUMO_EX17(3), TOLER))
end
if exists("RESUMO_EX19") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 19, RESUMO_ROTULO19, RESUMO_EX19(1), RESUMO_EX19(2), RESUMO_EX19(3), ag_status(RESUMO_EX19(3), TOLER))
end
if exists("RESUMO_EX20") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 20, RESUMO_ROTULO20, RESUMO_EX20(1), RESUMO_EX20(2), RESUMO_EX20(3), ag_status(RESUMO_EX20(3), TOLER))
end
if exists("RESUMO_EX21") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 21, RESUMO_ROTULO21, RESUMO_EX21(1), RESUMO_EX21(2), RESUMO_EX21(3), ag_status(RESUMO_EX21(3), TOLER))
end
if exists("RESUMO_EX22") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 22, RESUMO_ROTULO22, RESUMO_EX22(1), RESUMO_EX22(2), RESUMO_EX22(3), ag_status(RESUMO_EX22(3), TOLER))
end
if exists("RESUMO_EX23") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 23, RESUMO_ROTULO23, RESUMO_EX23(1), RESUMO_EX23(2), RESUMO_EX23(3), ag_status(RESUMO_EX23(3), TOLER))
end
if exists("RESUMO_EX24") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 24, RESUMO_ROTULO24, RESUMO_EX24(1), RESUMO_EX24(2), RESUMO_EX24(3), ag_status(RESUMO_EX24(3), TOLER))
end
if exists("RESUMO_EX25") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 25, RESUMO_ROTULO25, RESUMO_EX25(1), RESUMO_EX25(2), RESUMO_EX25(3), ag_status(RESUMO_EX25(3), TOLER))
end
if exists("RESUMO_EX26") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 26, RESUMO_ROTULO26, RESUMO_EX26(1), RESUMO_EX26(2), RESUMO_EX26(3), ag_status(RESUMO_EX26(3), TOLER))
end
if exists("RESUMO_EX27") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 27, RESUMO_ROTULO27, RESUMO_EX27(1), RESUMO_EX27(2), RESUMO_EX27(3), ag_status(RESUMO_EX27(3), TOLER))
end
if exists("RESUMO_EX28") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 28, RESUMO_ROTULO28, RESUMO_EX28(1), RESUMO_EX28(2), RESUMO_EX28(3), ag_status(RESUMO_EX28(3), TOLER))
end
if exists("RESUMO_EX29") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 29, RESUMO_ROTULO29, RESUMO_EX29(1), RESUMO_EX29(2), RESUMO_EX29(3), ag_status(RESUMO_EX29(3), TOLER))
end
if exists("RESUMO_EX30") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 30, RESUMO_ROTULO30, RESUMO_EX30(1), RESUMO_EX30(2), RESUMO_EX30(3), ag_status(RESUMO_EX30(3), TOLER))
end
if exists("RESUMO_EX31") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 31, RESUMO_ROTULO31, RESUMO_EX31(1), RESUMO_EX31(2), RESUMO_EX31(3), ag_status(RESUMO_EX31(3), TOLER))
end
if exists("RESUMO_EX32") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 32, RESUMO_ROTULO32, RESUMO_EX32(1), RESUMO_EX32(2), RESUMO_EX32(3), ag_status(RESUMO_EX32(3), TOLER))
end
if exists("RESUMO_EX33") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 33, RESUMO_ROTULO33, RESUMO_EX33(1), RESUMO_EX33(2), RESUMO_EX33(3), ag_status(RESUMO_EX33(3), TOLER))
end
if exists("RESUMO_EX34") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 34, RESUMO_ROTULO34, RESUMO_EX34(1), RESUMO_EX34(2), RESUMO_EX34(3), ag_status(RESUMO_EX34(3), TOLER))
end
if exists("RESUMO_EX35") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 35, RESUMO_ROTULO35, RESUMO_EX35(1), RESUMO_EX35(2), RESUMO_EX35(3), ag_status(RESUMO_EX35(3), TOLER))
end
if exists("RESUMO_EX36") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 36, RESUMO_ROTULO36, RESUMO_EX36(1), RESUMO_EX36(2), RESUMO_EX36(3), ag_status(RESUMO_EX36(3), TOLER))
end
if exists("RESUMO_EX37") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 37, RESUMO_ROTULO37, RESUMO_EX37(1), RESUMO_EX37(2), RESUMO_EX37(3), ag_status(RESUMO_EX37(3), TOLER))
end
if exists("RESUMO_EX38") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 38, RESUMO_ROTULO38, RESUMO_EX38(1), RESUMO_EX38(2), RESUMO_EX38(3), ag_status(RESUMO_EX38(3), TOLER))
end
if exists("RESUMO_EX39") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 39, RESUMO_ROTULO39, RESUMO_EX39(1), RESUMO_EX39(2), RESUMO_EX39(3), ag_status(RESUMO_EX39(3), TOLER))
end
if exists("RESUMO_EX40") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 40, RESUMO_ROTULO40, RESUMO_EX40(1), RESUMO_EX40(2), RESUMO_EX40(3), ag_status(RESUMO_EX40(3), TOLER))
end
if exists("RESUMO_EX42") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 42, RESUMO_ROTULO42, RESUMO_EX42(1), RESUMO_EX42(2), RESUMO_EX42(3), ag_status(RESUMO_EX42(3), TOLER))
end
if exists("RESUMO_EX43") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 43, RESUMO_ROTULO43, RESUMO_EX43(1), RESUMO_EX43(2), RESUMO_EX43(3), ag_status(RESUMO_EX43(3), TOLER))
end
if exists("RESUMO_EX44") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 44, RESUMO_ROTULO44, RESUMO_EX44(1), RESUMO_EX44(2), RESUMO_EX44(3), ag_status(RESUMO_EX44(3), TOLER))
end
if exists("RESUMO_EX45") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 45, RESUMO_ROTULO45, RESUMO_EX45(1), RESUMO_EX45(2), RESUMO_EX45(3), ag_status(RESUMO_EX45(3), TOLER))
end
if exists("RESUMO_EX46") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 46, RESUMO_ROTULO46, RESUMO_EX46(1), RESUMO_EX46(2), RESUMO_EX46(3), ag_status(RESUMO_EX46(3), TOLER))
end
if exists("RESUMO_EX47") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 47, RESUMO_ROTULO47, RESUMO_EX47(1), RESUMO_EX47(2), RESUMO_EX47(3), ag_status(RESUMO_EX47(3), TOLER))
end
if exists("RESUMO_EX48") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 48, RESUMO_ROTULO48, RESUMO_EX48(1), RESUMO_EX48(2), RESUMO_EX48(3), ag_status(RESUMO_EX48(3), TOLER))
end
if exists("RESUMO_EX49") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 49, RESUMO_ROTULO49, RESUMO_EX49(1), RESUMO_EX49(2), RESUMO_EX49(3), ag_status(RESUMO_EX49(3), TOLER))
end
if exists("RESUMO_EX50") == 1 then
    rel50 = 0
    if exists("RESUMO_EX50_REL") == 1 then
        rel50 = RESUMO_EX50_REL
    end
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 50, RESUMO_ROTULO50, RESUMO_EX50(1), RESUMO_EX50(2), RESUMO_EX50(3), ag_status_ex50(RESUMO_EX50(3), rel50, TOLER))
end
if exists("RESUMO_EX51") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 51, RESUMO_ROTULO51, RESUMO_EX51(1), RESUMO_EX51(2), RESUMO_EX51(3), ag_status(RESUMO_EX51(3), TOLER))
end
if exists("RESUMO_EX52") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 52, RESUMO_ROTULO52, RESUMO_EX52(1), RESUMO_EX52(2), RESUMO_EX52(3), ag_status(RESUMO_EX52(3), TOLER))
end
if exists("RESUMO_EX53") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 53, RESUMO_ROTULO53, RESUMO_EX53(1), RESUMO_EX53(2), RESUMO_EX53(3), ag_status(RESUMO_EX53(3), TOLER))
end
if exists("RESUMO_EX54") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 54, RESUMO_ROTULO54, RESUMO_EX54(1), RESUMO_EX54(2), RESUMO_EX54(3), ag_status(RESUMO_EX54(3), TOLER))
end
if exists("RESUMO_EX55") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 55, RESUMO_ROTULO55, RESUMO_EX55(1), RESUMO_EX55(2), RESUMO_EX55(3), ag_status(RESUMO_EX55(3), TOLER))
end
if exists("RESUMO_EX56") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 56, RESUMO_ROTULO56, RESUMO_EX56(1), RESUMO_EX56(2), RESUMO_EX56(3), ag_status(RESUMO_EX56(3), TOLER))
end
if exists("RESUMO_EX57") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 57, RESUMO_ROTULO57, RESUMO_EX57(1), RESUMO_EX57(2), RESUMO_EX57(3), ag_status(RESUMO_EX57(3), TOLER))
end
if exists("RESUMO_EX58") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 58, RESUMO_ROTULO58, RESUMO_EX58(1), RESUMO_EX58(2), RESUMO_EX58(3), ag_status(RESUMO_EX58(3), TOLER))
end
if exists("RESUMO_EX59") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 59, RESUMO_ROTULO59, RESUMO_EX59(1), RESUMO_EX59(2), RESUMO_EX59(3), ag_status(RESUMO_EX59(3), TOLER))
end
if exists("RESUMO_EX60") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 60, RESUMO_ROTULO60, RESUMO_EX60(1), RESUMO_EX60(2), RESUMO_EX60(3), ag_status(RESUMO_EX60(3), TOLER))
end
if exists("RESUMO_EX61") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 61, RESUMO_ROTULO61, RESUMO_EX61(1), RESUMO_EX61(2), RESUMO_EX61(3), ag_status(RESUMO_EX61(3), TOLER))
end
if exists("RESUMO_EX62") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 62, RESUMO_ROTULO62, RESUMO_EX62(1), RESUMO_EX62(2), RESUMO_EX62(3), ag_status(RESUMO_EX62(3), TOLER))
end
if exists("RESUMO_EX70") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 70, RESUMO_ROTULO70, RESUMO_EX70(1), RESUMO_EX70(2), RESUMO_EX70(3), ag_status(RESUMO_EX70(3), TOLER))
end
if exists("RESUMO_EX71") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 71, RESUMO_ROTULO71, RESUMO_EX71(1), RESUMO_EX71(2), RESUMO_EX71(3), ag_status(RESUMO_EX71(3), TOLER))
end
if exists("RESUMO_EX72") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 72, RESUMO_ROTULO72, RESUMO_EX72(1), RESUMO_EX72(2), RESUMO_EX72(3), ag_status(RESUMO_EX72(3), TOLER))
end
if exists("RESUMO_EX74") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 74, RESUMO_ROTULO74, RESUMO_EX74(1), RESUMO_EX74(2), RESUMO_EX74(3), ag_status(RESUMO_EX74(3), TOLER))
end
if exists("RESUMO_EX75") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 75, RESUMO_ROTULO75, RESUMO_EX75(1), RESUMO_EX75(2), RESUMO_EX75(3), ag_status(RESUMO_EX75(3), TOLER))
end
if exists("RESUMO_EX77") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 77, RESUMO_ROTULO77, RESUMO_EX77(1), RESUMO_EX77(2), RESUMO_EX77(3), ag_status(RESUMO_EX77(3), TOLER))
end
if exists("RESUMO_EX78") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 78, RESUMO_ROTULO78, RESUMO_EX78(1), RESUMO_EX78(2), RESUMO_EX78(3), ag_status(RESUMO_EX78(3), TOLER))
end
if exists("RESUMO_EX18A") == 1 then
    mprintf("%-6s %-22s %14.6f %14.6f %12.6f %8s\n", "18a", RESUMO_ROTULO18A, RESUMO_EX18A(1), RESUMO_EX18A(2), RESUMO_EX18A(3), ag_status(RESUMO_EX18A(3), TOLER))
end
if exists("RESUMO_EX18B") == 1 then
    mprintf("%-6s %-22s %14.6f %14.6f %12.6f %8s\n", "18b", RESUMO_ROTULO18B, RESUMO_EX18B(1), RESUMO_EX18B(2), RESUMO_EX18B(3), ag_status(RESUMO_EX18B(3), TOLER))
end
if exists("RESUMO_EX41") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 41, RESUMO_ROTULO41, RESUMO_EX41(1), RESUMO_EX41(2), RESUMO_EX41(3), ag_status(RESUMO_EX41(3), TOLER))
end
if exists("RESUMO_EX57A") == 1 then
    mprintf("%-6s %-22s %14.6f %14.6f %12.6f %8s\n", "57a", RESUMO_ROTULO57A, RESUMO_EX57A(1), RESUMO_EX57A(2), RESUMO_EX57A(3), ag_status(RESUMO_EX57A(3), TOLER))
end
if exists("RESUMO_EX58A") == 1 then
    mprintf("%-6s %-22s %14.6f %14.6f %12.6f %8s\n", "58a", RESUMO_ROTULO58A, RESUMO_EX58A(1), RESUMO_EX58A(2), RESUMO_EX58A(3), ag_status(RESUMO_EX58A(3), TOLER))
end
if exists("RESUMO_EX63") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 63, RESUMO_ROTULO63, RESUMO_EX63(1), RESUMO_EX63(2), RESUMO_EX63(3), ag_status(RESUMO_EX63(3), TOLER))
end
if exists("RESUMO_EX64") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 64, RESUMO_ROTULO64, RESUMO_EX64(1), RESUMO_EX64(2), RESUMO_EX64(3), ag_status(RESUMO_EX64(3), TOLER))
end
if exists("RESUMO_EX65") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 65, RESUMO_ROTULO65, RESUMO_EX65(1), RESUMO_EX65(2), RESUMO_EX65(3), ag_status(RESUMO_EX65(3), TOLER))
end
if exists("RESUMO_EX66") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 66, RESUMO_ROTULO66, RESUMO_EX66(1), RESUMO_EX66(2), RESUMO_EX66(3), ag_status(RESUMO_EX66(3), TOLER))
end
if exists("RESUMO_EX67") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 67, RESUMO_ROTULO67, RESUMO_EX67(1), RESUMO_EX67(2), RESUMO_EX67(3), ag_status(RESUMO_EX67(3), TOLER))
end
if exists("RESUMO_EX68") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 68, RESUMO_ROTULO68, RESUMO_EX68(1), RESUMO_EX68(2), RESUMO_EX68(3), ag_status(RESUMO_EX68(3), TOLER))
end
if exists("RESUMO_EX69") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 69, RESUMO_ROTULO69, RESUMO_EX69(1), RESUMO_EX69(2), RESUMO_EX69(3), ag_status(RESUMO_EX69(3), TOLER))
end
if exists("RESUMO_EX73") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 73, RESUMO_ROTULO73, RESUMO_EX73(1), RESUMO_EX73(2), RESUMO_EX73(3), ag_status(RESUMO_EX73(3), TOLER))
end
if exists("RESUMO_EX76") == 1 then
    mprintf("%-6d %-22s %14.6f %14.6f %12.6f %8s\n", 76, RESUMO_ROTULO76, RESUMO_EX76(1), RESUMO_EX76(2), RESUMO_EX76(3), ag_status(RESUMO_EX76(3), TOLER))
end

disp(" ")
disp("Notas do trabalho: OBSERVACOES.md")
disp("Derivadas e modelagem: explicacoes.md")
disp("==========================================================")

diary(0)
disp("Arquivo resultados.txt gravado nesta pasta.")
