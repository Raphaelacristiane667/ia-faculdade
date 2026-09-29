"""
Replica o AG de ag_generico.sci (semente 1) para conferir ex01..ex17, ex19..ex66, ex69, ex70-73, ex74-75, ex77-78.
Uso: python validar_ag.py
Requer: numpy
Notas do trabalho (ex.43, 64, 66): OBSERVACOES.md
Ex.77: E(x)=1.4*sqrt(25+x^2)+(13-x); minimo com x/sqrt(25+x^2)=L/W e W/L=1.4 => x~5.10
"""

from __future__ import annotations

import math
import random
from typing import Callable

import numpy as np

NPOP = 50
NGER = 100
TAXA_CRUZ = 0.8
TAXA_MUT = 0.1
TOL = 1e-2


def _ex65_L_ref() -> float:
    def dL(x: float) -> float:
        u = 5.0 - x
        return 1.0 - u / math.sqrt(u * u + 4.0) - u / math.sqrt(u * u + 9.0)

    lo, hi = 0.0, 5.0
    for _ in range(80):
        mid = (lo + hi) / 2.0
        if dL(mid) > 0.0:
            hi = mid
        else:
            lo = mid
    x = (lo + hi) / 2.0
    return x + math.sqrt((5.0 - x) ** 2 + 4.0) + math.sqrt((5.0 - x) ** 2 + 9.0)


def _ex73_theta_ref() -> float:
    x = 5.0 - 2.0 * math.sqrt(5.0)
    return math.atan((3.0 - x) / 2.0) + math.atan(x / 5.0)


def _ex69_y(x: float) -> float:
    if x <= 10.0 or x > 20.0:
        return 1e9
    return math.sqrt(x**3 / (x - 10.0))


def _ex69_y_ref() -> float:
    return 15.0 * math.sqrt(3.0)


def _ex22_malha_ref() -> float:
    best_d2 = float("inf")
    for xi in np.linspace(0.0, 10.0, 100_001):
        d2 = (xi - 4.0) ** 2 + (math.sin(xi) - 2.0) ** 2
        if d2 < best_d2:
            best_d2 = float(d2)
    return math.sqrt(best_d2)


def ag_randn() -> float:
    u1 = max(random.random(), 1e-12)
    u2 = random.random()
    return math.sqrt(-2.0 * math.log(u1)) * math.cos(2.0 * math.pi * u2)


def ag(
    f_custo: Callable[[np.ndarray], float],
    lim_inf: float,
    lim_sup: float,
    tipo: str,
    inteiro: bool = False,
    nger: int | None = None,
) -> tuple[float, float]:
    """Retorna (melhor_x, melhor_custo). x é escalar (1 variável)."""
    random.seed(1)
    n_ger = nger if nger is not None else NGER
    sigma = 0.1 * (lim_sup - lim_inf)

    pop = np.array(
        [lim_inf + random.random() * (lim_sup - lim_inf) for _ in range(NPOP)],
        dtype=np.float64,
    )
    if inteiro:
        pop = np.round(pop)
    pop = np.clip(pop, lim_inf, lim_sup)

    melhor_x = float(pop[0])
    melhor_c = f_custo(np.array([melhor_x], dtype=np.float64))

    for g in range(n_ger):
        custo = np.array(
            [f_custo(np.array([float(x)], dtype=np.float64)) for x in pop],
            dtype=np.float64,
        )
        pos = int(np.argmax(custo) if tipo == "max" else np.argmin(custo))
        c_ger = float(custo[pos])
        if g == 0 or (c_ger >= melhor_c if tipo == "max" else c_ger <= melhor_c):
            melhor_c = c_ger
            melhor_x = float(pop[pos])

        if g == n_ger - 1:
            break

        nova = np.empty(NPOP, dtype=np.float64)
        nova[0] = melhor_x

        for i in range(1, NPOP):
            i1 = random.randrange(NPOP)
            i2 = random.randrange(NPOP)
            p1 = float(pop[i1])
            p2 = float(pop[i2])

            if random.random() <= TAXA_CRUZ:
                alfa = random.random()
                filho = alfa * p1 + (1.0 - alfa) * p2
            else:
                filho = p1

            if random.random() <= TAXA_MUT:
                sig_g = sigma * (1.0 - g / n_ger)
                sig_g = max(sig_g, 1e-8)
                filho += ag_randn() * sig_g

            if inteiro:
                filho = round(filho)
            nova[i] = np.clip(filho, lim_inf, lim_sup)

        pop = nova

    return melhor_x, melhor_c


def main() -> None:
    tests: list[tuple[str, Callable[[np.ndarray], float], float, float, str, float]] = [
        ("01", lambda x: float(x[0] * (23.0 - x[0])), 0.0, 23.0, "max", 132.25),
        ("02", lambda x: float(x[0] * (x[0] - 100.0)), -200.0, 300.0, "min", -2500.0),
        ("03", lambda x: float(x[0] + 100.0 / x[0]), 0.1, 100.0, "min", 20.0),
        ("04", lambda x: float(x[0] ** 2 + (16.0 - x[0]) ** 2), 0.01, 15.99, "min", 128.0),
        ("05", lambda x: float((x[0] + 2.0) - x[0] ** 2), -1.0, 2.0, "max", 2.25),
        ("06", lambda x: float(2.0 * x[0] ** 2 - x[0] + 1.0), -2.0, 2.0, "min", 0.875),
        ("07", lambda x: float(x[0] * (50.0 - x[0])), 0.01, 49.99, "max", 625.0),
        ("08", lambda x: float(2.0 * (x[0] + 1000.0 / x[0])), 1.0, 1000.0, "min", 126.491106),
        ("09", lambda x: float(x[0] / (1.0 + x[0] ** 2)), 0.01, 10.0, "max", 0.5),
        ("10", lambda x: float(100.0 * x[0] / (x[0] ** 2 + x[0] + 4.0)), 0.01, 20.0, "max", 20.0),
        ("11", lambda x: float(x[0] * (60.0 - 0.4 * x[0])), 0.1, 149.9, "max", 2250.0),
        ("12", lambda x: float(x[0] * (3.0 - 2.0 * x[0]) ** 2), 0.01, 1.49, "max", 2.0),
        ("13", lambda x: float(3.0 * x[0] + 30000.0 / x[0]), 1.0, 500.0, "min", 600.0),
        ("14", lambda x: float(x[0] ** 2 + 128000.0 / x[0]), 1.0, 200.0, "min", 4800.0),
        ("15", lambda x: float(x[0] * (1200.0 - x[0] ** 2) / 4.0), 0.1, 34.6, "max", 4000.0),
        ("16", lambda x: float(20.0 * x[0] ** 2 + 180.0 / x[0]), 0.5, 4.0, "min", 163.54085335489256),
        ("17", lambda x: float(32.0 * x[0] ** 2 + 180.0 / x[0]), 0.5, 4.0, "min", 191.27854245287),
        (
            "19",
            lambda x: math.sqrt(float(x[0] ** 2 + (2.0 * x[0] + 3.0) ** 2)),
            -5.0,
            5.0,
            "min",
            math.sqrt(1.8),
        ),
        (
            "20",
            lambda x: math.sqrt(float((x[0] - 3.0) ** 2 + x[0])),
            0.0,
            10.0,
            "min",
            math.sqrt(2.75),
        ),
        (
            "21",
            lambda x: math.sqrt(float((x[0] - 1.0) ** 2 + 4.0 * (1.0 - x[0] ** 2))),
            -0.99,
            0.99,
            "max",
            math.sqrt(16.0 / 3.0),
        ),
        (
            "22",
            lambda x: math.sqrt(float((x[0] - 4.0) ** 2 + (math.sin(x[0]) - 2.0) ** 2)),
            0.0,
            10.0,
            "min",
            _ex22_malha_ref(),
        ),
        ("23", lambda x: float(4.0 * x[0] * math.sqrt(1.0 - x[0] ** 2)), 0.01, 0.99, "max", 2.0),
        ("24", lambda x: float(8.0 * x[0] * math.sqrt(1.0 - x[0] ** 2 / 9.0)), 0.01, 2.99, "max", 12.0),
        ("25", lambda x: float(math.sqrt(3) / 2.0 * x[0] * (1.0 - x[0])), 0.01, 0.99, "max", math.sqrt(3) / 8.0),
        (
            "26",
            lambda x: float((x[0] + 1.0) * math.sqrt(1.0 - x[0] ** 2)),
            0.01,
            0.99,
            "max",
            3.0 * math.sqrt(3) / 4.0,
        ),
        (
            "27",
            lambda x: float(math.sin(x[0]) * (1.0 + math.cos(x[0]))),
            0.01,
            math.pi - 0.01,
            "max",
            3.0 * math.sqrt(3) / 4.0,
        ),
        ("28", lambda x: float(x[0] * (4.0 - 4.0 * x[0] / 3.0)), 0.01, 2.99, "max", 3.0),
        (
            "29",
            lambda x: float(2.0 * math.pi * x[0] ** 2 * math.sqrt(1.0 - x[0] ** 2)),
            0.01,
            0.99,
            "max",
            4.0 * math.pi / (3.0 * math.sqrt(3.0)),
        ),
        ("30", lambda x: float(math.pi * (1.0 - x[0]) ** 2 * x[0]), 0.01, 0.99, "max", 4.0 * math.pi / 27.0),
        (
            "31",
            lambda x: float(
                2.0
                * math.pi
                * x[0]
                * (2.0 * math.sqrt(1.0 - x[0] ** 2) + x[0])
            ),
            0.01,
            0.99,
            "max",
            math.pi * (1.0 + math.sqrt(5.0)),
        ),
        (
            "32",
            lambda x: (
                lambda r, h: 2.0 * r * h + math.pi * r**2 / 2.0
            )(
                x[0],
                (10.0 - x[0] * (2.0 + math.pi)) / 2.0,
            )
            if (10.0 - x[0] * (2.0 + math.pi)) / 2.0 >= 0
            else -1e9,
            0.01,
            10.0 / (2.0 + math.pi) - 0.01,
            "max",
            10.0 / (4.0 + math.pi) * (10.0 - 10.0 / (4.0 + math.pi) * (2.0 + math.pi))
            + math.pi / 2.0 * (10.0 / (4.0 + math.pi)) ** 2,
        ),
        ("33", lambda x: float((x[0] + 8.0) * (384.0 / x[0] + 12.0)), 1.0, 384.0, "min", 864.0),
        (
            "34",
            lambda x: float(x[0] * (900.0 / (x[0] + 6.0) - 8.0))
            if 900.0 / (x[0] + 6.0) - 8.0 > 0
            else -1e9,
            0.1,
            200.0,
            "max",
            (math.sqrt(675.0) - 6.0) * (900.0 / math.sqrt(675.0) - 8.0),
        ),
        (
            "35",
            lambda x: float(x[0] ** 2 + (math.sqrt(3) / 4.0) * ((10.0 - 4.0 * x[0]) / 3.0) ** 2)
            if (10.0 - 4.0 * x[0]) / 3.0 >= 0
            else 1e9,
            0.0,
            2.5,
            "min",
            (
                lambda s: s**2
                + (math.sqrt(3) / 4.0) * ((10.0 - 4.0 * s) / 3.0) ** 2
            )(10.0 * math.sqrt(3.0) / (9.0 + 4.0 * math.sqrt(3.0))),
        ),
        (
            "36",
            lambda x: float(x[0] ** 2 + math.pi * ((10.0 - 4.0 * x[0]) / (2.0 * math.pi)) ** 2)
            if (10.0 - 4.0 * x[0]) / (2.0 * math.pi) >= 0
            else 1e9,
            0.0,
            2.5,
            "min",
            (
                lambda s: s**2 + math.pi * ((10.0 - 4.0 * s) / (2.0 * math.pi)) ** 2
            )(10.0 / (4.0 + math.pi)),
        ),
        (
            "37",
            lambda x: float(math.pi * x[0] ** 2 + 2000.0 / x[0]),
            0.1,
            20.0,
            "min",
            (
                lambda r: math.pi * r**2 + 2000.0 / r
            )((1000.0 / math.pi) ** (1.0 / 3.0)),
        ),
        (
            "38",
            lambda x: float(math.sqrt(x[0] ** 2 + (2.0 * x[0] / (x[0] - 1.0)) ** 2))
            if x[0] > 1.0
            else 1e9,
            1.01,
            10.0,
            "min",
            4.161938185951685,
        ),
        (
            "39",
            lambda x: float(math.pi / 3.0 * x[0] ** 2 * math.sqrt(1.0 - x[0] ** 2))
            if 0.0 < x[0] < 1.0
            else -1e9,
            0.01,
            0.99,
            "max",
            math.pi / 3.0 * (2.0 / 3.0) * math.sqrt(1.0 / 3.0),
        ),
        (
            "40",
            lambda x: float(
                math.pi
                * x[0]
                * math.sqrt(x[0] ** 2 + (81.0 / (math.pi * x[0] ** 2)) ** 2)
            ),
            0.5,
            5.0,
            "min",
            (
                lambda r: math.pi
                * r
                * math.sqrt(r**2 + (81.0 / (math.pi * r**2)) ** 2)
            )((6561.0 / (2.0 * math.pi**2)) ** (1.0 / 6.0)),
        ),
        (
            "42",
            lambda x: float(0.5 / (0.5 * math.sin(x[0]) + math.cos(x[0]))),
            0.01,
            1.5,
            "min",
            0.5 / (0.5 * math.sin(math.atan(0.5)) + math.cos(math.atan(0.5))),
        ),
        ("43", lambda x: float(144.0 * x[0] / (x[0] + 2.0) ** 2), 0.01, 20.0, "max", 18.0),
        (
            "44",
            lambda x: float(x[0] ** 3 / (x[0] - 1.0)) if x[0] > 1.0 else 1e9,
            1.01,
            5.0,
            "min",
            6.75,
        ),
        (
            "45",
            lambda x: float(
                12.0
                - 1.5 / math.tan(x[0])
                + 1.5 * math.sqrt(3.0) / math.sin(x[0])
            )
            if math.sin(x[0]) > 0
            else 1e9,
            0.3,
            1.4,
            "min",
            12.0 + (3.0 * math.sqrt(2.0)) / 2.0,
        ),
        (
            "46",
            lambda x: float(400.0 * x[0] ** 2 + 225.0 * (x[0] - 1.0) ** 2),
            0.0,
            1.0,
            "min",
            144.0,
        ),
        (
            "47",
            lambda x: float(math.sqrt(x[0] ** 2 + 25.0) / 6.0 + (5.0 - x[0]) / 8.0),
            0.0,
            5.0,
            "min",
            math.sqrt(50.0) / 6.0,
        ),
        (
            "48",
            lambda x: float((math.pi - x[0]) / 2.0 + 2.0 * math.sin(x[0] / 2.0)),
            0.0,
            math.pi,
            "min",
            math.pi / 2.0,
        ),
        (
            "49",
            lambda x: float(400.0 * x[0] + 800.0 * math.sqrt(4.0 + (6.0 - x[0]) ** 2)),
            0.0,
            6.0,
            "min",
            3785.640646070845,
        ),
        (
            "50",
            lambda x: float(400.0 * x[0] + 800.0 * math.sqrt(1.0 + (6.0 - x[0]) ** 2)),
            0.0,
            6.0,
            "min",
            3092.8203231834505,
        ),
        (
            "51",
            lambda x: float(3.0 / x[0] ** 2 + 1.0 / (4.0 - x[0]) ** 2)
            if 0.0 < x[0] < 4.0
            else 1e9,
            0.01,
            3.99,
            "min",
            (
                lambda x: 3.0 / x**2 + 1.0 / (4.0 - x) ** 2
            )(4.0 * 3.0 ** (1.0 / 3.0) / (1.0 + 3.0 ** (1.0 / 3.0))),
        ),
        (
            "52",
            lambda x: float(x[0] * (5.0 * x[0] / (x[0] - 3.0)) / 2.0) if x[0] > 3.0 else 1e9,
            3.01,
            30.0,
            "min",
            30.0,
        ),
        (
            "53",
            lambda x: float(
                math.sqrt(x[0] ** 2 + (2.0 * x[0] / (x[0] - 1.0)) ** 2)
            )
            if x[0] > 1.0
            else 1e9,
            1.01,
            10.0,
            "min",
            4.161938185951685,
        ),
        ("54", lambda x: float(120.0 * x[0] ** 2 - 15.0 * x[0] ** 4), 0.5, 3.0, "max", 240.0),
        (
            "55",
            lambda x: float(math.sqrt(4.0 * x[0] ** 2 + 36.0 / x[0] ** 2)),
            0.5,
            5.0,
            "min",
            2.0 * math.sqrt(6.0),
        ),
        (
            "56",
            lambda x: float((x[0] ** 2 + 4.0) ** 2 / (4.0 * x[0])),
            0.2,
            3.0,
            "min",
            32.0 * math.sqrt(3.0) / 9.0,
        ),
        (
            "57",
            lambda x: float(16000.0 / x[0] + 200.0 + 4.0 * math.sqrt(x[0]))
            if x[0] > 0
            else 1e9,
            1.0,
            2000.0,
            "min",
            320.0,
        ),
        (
            "58",
            lambda x: float(
                x[0] * (1700.0 - 7.0 * x[0])
                - (16000.0 + 500.0 * x[0] - 1.6 * x[0] ** 2 + 0.004 * x[0] ** 3)
            ),
            0.0,
            300.0,
            "max",
            46000.0,
        ),
        ("59", lambda x: float(19.0 * x[0] - x[0] ** 2 / 3000.0), 0.0, 60000.0, "max", 270750.0),
        ("60", lambda x: float(x[0] * (20.0 - x[0] / 2.0) - 6.0 * x[0]), 0.0, 50.0, "max", 98.0),
        (
            "61",
            lambda x: float(x[0] * (550.0 - x[0] / 10.0) - 68000.0 - 150.0 * x[0]),
            0.0,
            6000.0,
            "max",
            332000.0,
        ),
        (
            "62",
            lambda x: float((100.0 - x[0]) * (800.0 + 10.0 * x[0]))
            if 0.0 <= x[0] <= 100.0
            else -1e9,
            0.0,
            100.0,
            "max",
            81000.0,
        ),
        (
            "69",
            lambda x: _ex69_y(float(x[0])),
            10.01,
            20.0,
            "min",
            _ex69_y_ref(),
        ),
        (
            "70",
            lambda x: float(3.0 / math.sin(x[0]) + 2.0 / math.cos(x[0]))
            if math.sin(x[0]) > 0 and math.cos(x[0]) > 0
            else 1e9,
            0.01,
            1.55,
            "min",
            (3.0 ** (2.0 / 3.0) + 2.0 ** (2.0 / 3.0)) ** (3.0 / 2.0),
        ),
        (
            "71",
            lambda x: float(math.atan(2.0 * x[0] / (1.0 + 3.0 * x[0] ** 2))),
            0.01,
            5.0,
            "max",
            math.pi / 6.0,
        ),
        (
            "72",
            lambda x: float(100.0 * math.sin(x[0]) * (1.0 + math.cos(x[0]))),
            0.01,
            math.pi / 2.0,
            "max",
            75.0 * math.sqrt(3.0),
        ),
        (
            "73",
            lambda x: float(math.atan((3.0 - x[0]) / 2.0) + math.atan(x[0] / 5.0)),
            0.0,
            3.0,
            "max",
            _ex73_theta_ref(),
        ),
        (
            "74",
            lambda x: float(math.atan(3.0 / x[0]) - math.atan(1.0 / x[0]))
            if x[0] > 0
            else -1e9,
            0.1,
            10.0,
            "max",
            math.sqrt(3.0),
        ),
        (
            "75",
            lambda x: float((4.0 * math.cos(x[0]) + 3.0 * math.sin(x[0])) * (4.0 * math.sin(x[0]) + 3.0 * math.cos(x[0]))),
            0.0,
            math.pi / 2.0,
            "max",
            24.5,
        ),
        (
            "77",
            lambda x: float(1.4 * math.sqrt(25.0 + x[0] ** 2) + (13.0 - x[0])),
            0.0,
            13.0,
            "min",
            25.0 / math.sqrt(24.0),
        ),
        (
            "78",
            lambda x: float(1.0 / (25.0 + x[0] ** 2) + 1.0 / (25.0 + (10.0 - x[0]) ** 2)),
            0.0,
            10.0,
            "min",
            0.04,
        ),
        ("18a", lambda x: float(2.0 * (x[0] + 100.0 / x[0])), 1.0, 99.0, "min", 40.0),
        ("18b", lambda x: float(x[0] * (50.0 - x[0])), 0.1, 49.9, "max", 625.0),
        (
            "41",
            lambda x: float(math.pi * x[0] * (1.0 - x[0]) ** 2)
            if 0.0 < x[0] < 1.0
            else -1e9,
            0.01,
            0.99,
            "max",
            1.0 / 3.0,
        ),
        (
            "63",
            lambda x: (
                lambda a, c: (
                    lambda s: math.sqrt(max(0.0, s * (s - a) * (s - a) * (s - c)))
                )((2.0 * a + c) / 2.0)
            )(x[0], 12.0 - 2.0 * x[0])
            if 12.0 - 2.0 * x[0] > 0 and x[0] > 0
            else -1e9,
            0.1,
            5.9,
            "max",
            math.sqrt(3.0) / 4.0 * 16.0,
        ),
        (
            "67",
            lambda x: float(math.sqrt(x[0] ** 2 + 1.0) / 3.0 + math.sqrt((2.0 - x[0]) ** 2 + 1.0) / 2.0),
            0.0,
            2.0,
            "min",
            0.0,
        ),
        (
            "64",
            lambda x: float(5.0 * 12.0 * math.sin(x[0]))
            if 0.0 < x[0] < math.pi / 2.0
            else -1e9,
            0.01,
            math.pi / 2.0 - 0.01,
            "max",
            60.0,
        ),
        (
            "65",
            lambda x: float(
                x[0]
                + math.sqrt((5.0 - x[0]) ** 2 + 4.0)
                + math.sqrt((5.0 - x[0]) ** 2 + 9.0)
            ),
            0.0,
            5.0,
            "min",
            _ex65_L_ref(),
        ),
        (
            "68",
            lambda x: float(math.sqrt(x[0] ** 2 + 4.0) + math.sqrt((5.0 - x[0]) ** 2 + 9.0)),
            0.01,
            4.99,
            "min",
            5.0 * math.sqrt(2.0),
        ),
        (
            "76",
            lambda x: float((1.0 - 1.0 / math.tan(x[0])) + 1.0 / math.sin(x[0]) / (2.0 / 3.0) ** 4)
            if math.sin(x[0]) > 0
            else 1e9,
            0.01,
            1.5,
            "min",
            math.acos((2.0 / 3.0) ** 4),
        ),
    ]

    x50_ana = 6.0 - 1.0 / math.sqrt(3.0)
    x74_ana = math.sqrt(3.0)
    x77_ana = 25.0 / math.sqrt(24.0)

    print(f"{'Ex':<4} {'AG':>14} {'Analitico':>14} {'Erro':>12} {'Status':>8}")
    print("-" * 56)
    for num, f, lo, hi, tipo, ana in tests:
        nger_run = 200 if num == "50" else None
        x_ag, c = ag(f, lo, hi, tipo, nger=nger_run)
        if num == "50":
            err = abs(x_ag - x50_ana)
            err_rel_c = abs(c - ana) / ana
            status = "OK" if err <= TOL or err_rel_c <= TOL else "ATENCAO"
            print(
                f"{num:<4} {x_ag:14.6f} {x50_ana:14.6f} {err:12.6f} {status:>8}"
            )
            continue
        if num == "74":
            err = abs(x_ag - x74_ana)
            status = "OK" if err <= TOL else "ATENCAO"
            print(
                f"{num:<4} {x_ag:14.6f} {x74_ana:14.6f} {err:12.6f} {status:>8}"
            )
            continue
        if num == "77":
            err = abs(x_ag - x77_ana)
            status = "OK" if err <= TOL else "ATENCAO"
            print(
                f"{num:<4} {x_ag:14.6f} {x77_ana:14.6f} {err:12.6f} {status:>8}"
            )
            continue
        if num == "41":
            err = abs(x_ag - ana)
            status = "OK" if err <= TOL else "ATENCAO"
            print(f"{num:<4} {x_ag:14.6f} {ana:14.6f} {err:12.6f} {status:>8}")
            continue
        if num == "67":
            t = x_ag
            raz1 = (t / math.sqrt(t**2 + 1.0)) / 3.0
            raz2 = ((2.0 - t) / math.sqrt((2.0 - t) ** 2 + 1.0)) / 2.0
            err = abs(raz1 - raz2)
            status = "OK" if err <= TOL else "ATENCAO"
            print(f"{num:<4} {raz1:14.6f} {raz2:14.6f} {err:12.6f} {status:>8}")
            continue
        if num == "76":
            err = abs(x_ag - ana)
            status = "OK" if err <= TOL else "ATENCAO"
            print(f"{num:<4} {x_ag:14.6f} {ana:14.6f} {err:12.6f} {status:>8}")
            continue
        err = abs(c - ana)
        status = "OK" if err <= TOL else "ATENCAO"
        print(f"{num:<4} {c:14.6f} {ana:14.6f} {err:12.6f} {status:>8}")

    # Ex. 11 — dimensões esperadas
    x11, _ = ag(tests[10][1], tests[10][2], tests[10][3], tests[10][4])
    y11 = 60.0 - 0.4 * x11
    print()
    print(f"Ex.11 dimensoes: x={x11:.6f}, y={y11:.6f}, area={x11*y11:.6f} (esperado 75, 30, 2250)")


if __name__ == "__main__":
    main()
