// =============================================================================
// carregar_ag.sci — Garante pasta trabalho_IA e carrega ag_generico.sci
// =============================================================================

if ~isdef("ag") then
    pasta = ""
    try
        pasta = get_absolute_file_path("")
    catch
        pasta = ""
    end
    if pasta == "" then
        pasta = get_absolute_file_path("carregar_ag.sci")
    end
    if pasta ~= "" then
        chdir(pasta)
    end

    if isempty(fileinfo("ag_generico.sci")) then
        disp("========================================")
        disp("ERRO: nao encontrei ag_generico.sci")
        disp(["Pasta atual do Scilab:" pwd()])
        disp(" ")
        disp("Use a pasta trabalho_IA INTEIRA (com ag_generico.sci).")
        disp("Scilab: File -> Change current directory... -> trabalho_IA")
        disp("Depois: exec(""ex02.sce"", -1)")
        disp("========================================")
        error("Falta ag_generico.sci na pasta de trabalho.")
    end

    exec("ag_generico.sci", -1)
end
