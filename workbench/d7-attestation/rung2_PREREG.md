# PREREG — D7 NARROWING RUNG 2 (t_db0153ae)

## FRONT (theory-native, SEED_DIGITS §D5 "as many rungs as it takes")
Sharpen the three DERIVED edge logs (cutLog mass0, cutLog mass2, cutLog mbRatioDerived)
from rung1's ~1e-7 to ~1e-12, wire in the banked sharp L_m01 (1e-11) + κ ext6, re-assemble
the recomposedEndpoint bracket AS 1/α(0). Endpoint is a DERIVED closed real of Cut; its digits
are a pair of theorems (lo ≤ x ≤ hi). No fit, no new axiom.

## ONE-LAW RE-DIAGNOSIS (checked the banked platform, not re-derived)
recomposedEndpoint = 2425/18 + κ·(2·L_m01 + (7/3)·L_mb + (11/3)·L_b0 − (5/3)·L_b2), κ=(1/cutPi)/3.
Numeric (mpmath) endpoint width contributions AFTER edge logs pushed to 1e-12:
  - κ=1/cutPi ext6 width 2.03e-12 → k_width×C ≈ 1.0e-11  [DOMINANT]
  - L_m01 width 1e-11 (NB11 s6 cap) → 2·k·1e-11 ≈ 2.1e-12  [second]
  - L_mb 2e-12, L_b0 1e-12, L_b2 1e-12 → each ~ 2-5e-12 in C → ~3-5e-13 in endpoint
  ⇒ assembled endpoint width ≈ 1.33e-11 ⇒ clean bracket [1363071881405/1e10, 1363071881406/1e10]
    = 136.3071881405 … 136.3071881406, ≈ 12 SIGNIFICANT DIGITS (up from rung1's 9).
The ticket's "~14 digits from edge logs alone" is OPTIMISTIC — after the edge logs, κ and L_m01
cap the endpoint at ~12 digits. Reaching the ⛔ ≥15-digit floor requires deepening κ (1/cutPi
ext7, NarrowedBracket13 pattern) AND the mass grid s7 for L_m01 — the NEXT rung.

## VERIFIED TARGETS (mpmath, exact ℚ; certification inequalities all TRUE)
- cutLog mass0 ∈ [1733728794954/1e12, 1733728794955/1e12]  (width 1e-12)
    from banked mass0 clean [5661726012625402/1e15, 5661726012625422/1e15]
    LOWER exp cert N=21, UPPER exp cert N=22
- cutLog mass2 ∈ [−1088723725224/1e12, −1088723725223/1e12]  (width 1e-12)
    via 1/mass2 ∈ [1e15/336645872281298, 1e15/336645872281286] from mass2 clean s6
    (mass2 = b2², b2 = 1 − (wB·pB − wB·rB)/2 from NB4 sharp products)
    cutLog(1/mass2) ∈ [1088723725223/1e12, 1088723725224/1e12], LOWER N=17, UPPER N=18
- cutLog mbRatioDerived ∈ [−4089306640008/1e12, −4089306640006/1e12]  (width 2e-12)
    q pushed to [7071067811865/1e13, 7071067811866/1e13] via q²=1/2 (q_lo²<0.5<q_hi²)
    mbRatio = (1−q)²/(3(1+q)) ∈ clean [16750843898049/1e15, 16750843898062/1e15]
    1/mbRatio ∈ [1e15/16750843898062, 1e15/16750843898049]
    cutLog(1/mbRatio) ∈ [4089306640006/1e12, 4089306640008/1e12], LOWER N=29, UPPER N=30
- L_m01 wired from NB11 (banked, 1e-11); κ from D7CompositionAttestation.kappa_bracket (ext6)

## RE-ASSEMBLED (endpoint_core_s2, W9 abstract arithmetic core — transcendentals OUT)
  1363071881405/1e10 ≤ recomposedEndpoint ≤ 1363071881406/1e10  (width 1e-10, ≈12 sig digits)
  recomposedEndpoint < 137 (fold's prediction, bracket strictly below measured 1/α(0)≈137.036,
  removable prose, NO-FIT).

## W9 COST BUDGET / KILL
Each exp cert uses `set_option maxHeartbeats 2000000 in` (banked NB11 convention). The 13-digit
rational partialExp sums have large numerators. KILL: any single cert obligation blowing the 2M
ceiling ⇒ STOP, push N lower / decompose. MEASURE the deepest (mb N=29/30) in a bounded probe FIRST.
The endpoint assembly stays in an opaque-variable abstract core (nlinarith on the combination,
never on unfolded cutLog/cutPi).

## HONEST GRADE
THEOREM-EXACT / CERTIFIED: the 3 sharpened edge logs (1e-12) + re-assembled ≈12-sig-digit bracket
+ prediction, foundations-only.
ROUTE-NOT-YET-FOUND (NAMED, ONE directed successor): the ⛔ ≥15-sig-digit floor via rung 3 —
push 1/cutPi ext7 (deeper cutCos grid) + L_m01 s7 (deeper mass grid).

## FORK GUARD: exactly ONE directed successor (rung 3). NO generic SELECT before D8.
