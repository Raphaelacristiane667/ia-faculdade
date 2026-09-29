# -*- coding: utf-8 -*-
"""Atualiza RESUMO_ROTULO e titulos do ag() nos ex*.sce (pasta trabalho_IA)."""
from __future__ import annotations

import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent

ROTULOS: dict[str, str] = {
    "RESUMO_ROTULO01": "Produto maximo",
    "RESUMO_ROTULO02": "Produto minimo",
    "RESUMO_ROTULO03": "Soma minima",
    "RESUMO_ROTULO04": "Soma de quadrados",
    "RESUMO_ROTULO05": "Distancia maxima",
    "RESUMO_ROTULO06": "Distancia minima",
    "RESUMO_ROTULO07": "Area maxima",
    "RESUMO_ROTULO08": "Perimetro minimo",
    "RESUMO_ROTULO09": "Valor maximo de Y",
    "RESUMO_ROTULO10": "P maximo",
    "RESUMO_ROTULO11": "Area maxima",
    "RESUMO_ROTULO12": "Volume maximo",
    "RESUMO_ROTULO13": "Area da cerca",
    "RESUMO_ROTULO14": "Material minimo",
    "RESUMO_ROTULO15": "Volume maximo",
    "RESUMO_ROTULO16": "Custo minimo",
    "RESUMO_ROTULO17": "Custo minimo",
    "RESUMO_ROTULO18A": "Perimetro minimo",
    "RESUMO_ROTULO18B": "Area maxima",
    "RESUMO_ROTULO19": "Distancia minima",
    "RESUMO_ROTULO20": "Distancia minima",
    "RESUMO_ROTULO21": "Distancia maxima",
    "RESUMO_ROTULO22": "Distancia minima",
    "RESUMO_ROTULO23": "Area maxima",
    "RESUMO_ROTULO24": "Area maxima",
    "RESUMO_ROTULO25": "Area maxima",
    "RESUMO_ROTULO26": "Area do trapezio",
    "RESUMO_ROTULO27": "Area maxima",
    "RESUMO_ROTULO28": "Area maxima",
    "RESUMO_ROTULO29": "Volume maximo",
    "RESUMO_ROTULO30": "Volume maximo",
    "RESUMO_ROTULO31": "Superficie maxima",
    "RESUMO_ROTULO32": "Area da janela",
    "RESUMO_ROTULO33": "Area do cartaz",
    "RESUMO_ROTULO34": "Area impressa",
    "RESUMO_ROTULO35": "Area minima",
    "RESUMO_ROTULO36": "Area minima",
    "RESUMO_ROTULO37": "Area da lata",
    "RESUMO_ROTULO38": "Compr. escada",
    "RESUMO_ROTULO39": "Volume do copo",
    "RESUMO_ROTULO40": "Area lateral min.",
    "RESUMO_ROTULO41": "Altura otima",
    "RESUMO_ROTULO42": "Forca minima",
    "RESUMO_ROTULO43": "Potencia maxima",
    "RESUMO_ROTULO44": "Energia minima",
    "RESUMO_ROTULO45": "Area minima S",
    "RESUMO_ROTULO46": "Tempo minimo",
    "RESUMO_ROTULO47": "Tempo minimo",
    "RESUMO_ROTULO48": "Tempo minimo",
    "RESUMO_ROTULO49": "Custo minimo",
    "RESUMO_ROTULO50": "Coordenada x",
    "RESUMO_ROTULO51": "Intensidade min.",
    "RESUMO_ROTULO52": "Area minima",
    "RESUMO_ROTULO53": "Comprimento min.",
    "RESUMO_ROTULO54": "Inclinacao max.",
    "RESUMO_ROTULO55": "Comprimento min.",
    "RESUMO_ROTULO56": "Area maxima",
    "RESUMO_ROTULO57": "Custo medio min.",
    "RESUMO_ROTULO57A": "Cp igual a Cm",
    "RESUMO_ROTULO58": "Lucro maximo",
    "RESUMO_ROTULO58A": "Rp igual a Cp",
    "RESUMO_ROTULO59": "Receita maxima",
    "RESUMO_ROTULO60": "Lucro maximo",
    "RESUMO_ROTULO61": "Lucro maximo",
    "RESUMO_ROTULO62": "Receita maxima",
    "RESUMO_ROTULO63": "Area maxima",
    "RESUMO_ROTULO64": "Area da pipa",
    "RESUMO_ROTULO65": "Cabos: L minimo",
    "RESUMO_ROTULO66": "Velocidade v*",
    "RESUMO_ROTULO67": "Lei de Snell",
    "RESUMO_ROTULO68": "Compr. da corda",
    "RESUMO_ROTULO69": "Vinco minimo",
    "RESUMO_ROTULO70": "Compr. do cano",
    "RESUMO_ROTULO71": "Angulo maximo",
    "RESUMO_ROTULO72": "Area da calha",
    "RESUMO_ROTULO73": "Angulo maximo",
    "RESUMO_ROTULO74": "Distancia x",
    "RESUMO_ROTULO75": "Area maxima",
    "RESUMO_ROTULO76": "Angulo otimo",
    "RESUMO_ROTULO77": "Distancia x (km)",
    "RESUMO_ROTULO78": "Intensidade min.",
}

AG_TITULO_FIXES: list[tuple[str, str]] = [
    ("Ex.65 - Comprimento minimo dos cabos", "Ex. 65 — Comprimento minimo dos cabos"),
    ("Ex.73 - Angulo maximo", "Ex. 73 — Angulo maximo na vertical"),
    ("Ex.69 - Vinco minimo", "Ex. 69 — Comprimento minimo do vinco"),
    ("Ex.64 - Area maxima da pipa", "Ex. 64 — Area maxima da pipa"),
    ("Ex.77 - Energia minima", "Ex. 77 — Energia minima do voo"),
    ("minimo", "minimo"),
    ("maximo", "maximo"),
    ("maxima", "maxima"),
]

XTITLE_FIXES = [
    ('xtitle("Ex.65 — L(x)"', 'xtitle("Ex. 65 — Comprimento total L(x)"'),
    ('xtitle("Ex.65 — dL/dx"', 'xtitle("Ex. 65 — Derivada dL/dx"'),
    ('xtitle("Ex.66 — c(v) APROXIMADA (ilustrativa)"', 'xtitle("Ex. 66 — Consumo c(v) (modelo ilustrativo)"'),
    ('xtitle("Ex.66 — G(v)=c(v)/v"', 'xtitle("Ex. 66 — Custo por km G = c/v"'),
    ('xtitle("Ex.78 - Intensidade I(x)"', 'xtitle("Ex. 78 — Intensidade I(x)"'),
    ('xtitle("Ex.44 - E(v) = v^3/(v-1)"', 'xtitle("Ex. 44 — Energia E(v)"'),
]


def main() -> None:
    n = 0
    for path in sorted(ROOT.glob("ex*.sce")):
        text = path.read_text(encoding="utf-8")
        orig = text
        for var, legenda in ROTULOS.items():
            pat = rf"{var}\s*=\s*\"[^\"]*\""
            repl = f'{var} = "{legenda}"'
            text, c = re.subn(pat, repl, text)
            if c:
                n += c
        for old, new in AG_TITULO_FIXES[:5]:
            text = text.replace(old, new)
        for old, new in XTITLE_FIXES:
            text = text.replace(old, new)
        # Padronizar titulos ag: "Ex.NN - " -> "Ex. NN — "
        text = re.sub(
            r'(ag\([^)]*")Ex\.(\d+)\s*-\s*',
            r'\1Ex. \2 — ',
            text,
        )
        if text != orig:
            path.write_text(text, encoding="utf-8", newline="\n")
            print("atualizado:", path.name)
    print(f"Rotulos ajustados (substituicoes): {n}")


if __name__ == "__main__":
    main()
