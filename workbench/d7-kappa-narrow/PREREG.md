# PREREG — Node 5 (t_80a7e457): D7 endpoint narrowing RUNG 3 (κ=1/cutPi one grid deeper)

## Campaign context
Owner huc-derivation campaign node 5. Succeeds N580 (D7NarrowingRung2; endpoint at ~12 digits,
bare [136.3071881405, 136.3071881406], dressed [137.0996710997, 137.0996710998]). N580 handed
forward: after the three edge logs deepened to ~1e-13, the NEW dominant residual is κ=1/cutPi
(ext6, 1e11 grid, width ~2e-12), endpoint contribution ~1e-11. This node sharpens κ one grid
deeper (ext7, 1e12 grid) + wires in the PRESERVED-sound s7 L_m01 (width 4e-14), re-assembling the
endpoint at ~14 digits.

## MEASURE-FIRST (W9) — done, workbench/d7-kappa-narrow/measure.py
With N580's deepened edge logs (all ~1e-13), per-input endpoint-width contribution:
  kappa ext6   1.009e-11  (DOMINANT — confirmed)
  L_m01 s6     2.122e-12  (co-dominant, banked NB11 width 1e-11)
  L_b2         5.305e-14
  L_b0         3.890e-14
  L_mb         2.476e-14
Sharpen κ→ext7 (1e12): κ contribution → 1.009e-12. Then L_m01 s6 (2.1e-12) becomes co-dominant;
wire in the PRESERVED Lm01GridS7 (width 4e-14) → L_m01 contribution → 8.5e-15.
Result total endpoint width ≈ 1.13e-12 ⇒ ~14 sig digits.

## THE RUNG (deeper reads of the SAME derived objects — no fit)
### (A) κ = 1/cutPi ext7 — LIFT leastCosZero onto the 1e12 grid (SAME double-double-angle lever)
- LOWER (positivity): cutCos_gt_pi8_12: cutCos y > 9238795325113/1e13 for 0≤y<785398163397/2e12
  (near-π/8, well-conditioned, split@6, remainder factor 101/100); then cutCos_pos_of_lt_1570796326794
  via TWO cutCos_double, since C=9238795325113/1e13 has closure 2(2C²−1)²−1 ≈ 1.38e-13 > 0.
  ⇒ le_leastCosZero_1570796326794: 1570796326794/1e12 ≤ leastCosZero (integer floor of π/2·1e12).
- UPPER (negativity via DDA — the trunk-native mirror, keeps arithmetic near π/8 not the ill-conditioned
  split@10 on x~1.57): v=cutCos(314159265359/8e11)∈[9/10, R], R=923879532511277/1e15≤cos(π/8),
  so u=2v²−1∈(0, 2R²−1], closure(R)=2(2R²−1)²−1≈−1.02e-13<0 ⇒ cutCos(1570796326795/1e12)=2(2v²−1)²−1<0
  ⇒ leastCosZero ≤ 1570796326795/1e12 (integer ceil) via IVT (intermediate_value_Icc').
- cutPi=2·leastCosZero ∈ [785398163397/25e10, 314159265359/1e11]; 1/cutPi ∈ [100000000000/314159265359,
  250000000000/785398163397] (width 2.03e-13, ~10x narrower than ext6, nested strictly inside).
  κ=kappaLeading=(1/cutPi)/3 ∈ [(100000000000/314159265359)/3, (250000000000/785398163397)/3].
### (B) s7 L_m01 — inline the PRESERVED-sound Lm01GridS7 (standalone on NarrowedBracket11)
  cutLog(mass0/mass1) ∈ [815406111272599/1e14, 815406111272603/1e14] (width 4e-14), from split@7
  cutCos(2/9) → banked Born-square amplitude chain → m01 width 1e-11 → exp index 38. NESTED in banked s6.
### (C) edge logs — reuse N580's deepened cutLog_b0/b2/mb_deep (width ~1e-13) verbatim.

## LANDING (verified exact arithmetic — final_lock.py)
- BARE inner core [149379518556421/1e13, 149379518556434/1e13];
  recomposedEndpoint ∈ [1363071881405515/1e13, 1363071881405528/1e13] = [136.3071881405515,
  136.3071881405528] width 1.3e-12, ~13-14 sig digits, nested STRICTLY inside N580
  [136.3071881405, 136.3071881406], < 137.
- DRESSED inner core [224069277834632/1e13, 224069277834650/1e13];
  recomposedEndpointDressed ∈ [1370996710997162/1e13, 1370996710997180/1e13] = [137.0996710997162,
  137.0996710997180], nested STRICTLY inside N580 [137.0996710997, 137.0996710998], > 137.

## HONEST GRADE
~12→~14 sig-digit advance. NOT 15: after ext7, κ is AGAIN the dominant residual (needs ext8, a 1e13
grid) — the ≥15-digit floor is ROUTE-NOT-YET-FOUND, handed to ONE directed successor (sharpen 1/cutPi
one MORE grid deeper via the same double-double-angle lever + edge logs another rung). NOT the measured
1/α(0)≈137.036 (removable prose); no empirical number in any proof. Continue-the-hunt, not an arc exit.

## W9 COST BUDGET + KILL (measured, de-risked)
- LOWER instrument (cutCos_gt_pi8_12 + cutCos_pos_of_lt + le_leastCosZero): probe built 49s. maxHeartbeats 8000000.
- UPPER instrument (v_le_R_12 + v_ge_9_10_12 + cutCos_..._neg + leastCosZero_le): probe built 18s. maxHeartbeats 8000000/4000000.
- s7 L_m01 (PRESERVED): cos@7 ~14s, exp N=38 ~15-24s each, maxHeartbeats 4000000 — all banked at this cost before.
- endpoint cores: nlinarith on inner combo + two mul_le_mul, identical shape to endpoint_core_r2 (maxHeartbeats 2000000).
KILL: if any single obligation >90s, decompose. Abstract arithmetic cores keep transcendentals OUT.

## MODULE
Phys/Algebra/D7NarrowingRung3.lean, namespaces Phys.Foundation.ContinuumQ (instrument) +
Phys.Algebra.D7NarrowingRung3 (composition).
Imports: D7NarrowingRung2 (deepened edge logs cutLog_b0/b2/mb_deep, cores pattern), NarrowedBracket12
(the ext6 instrument + cutCos_double/cutCos_bracket/partialCos_six/seven/cosRemBound/leastCosZero/cutPi),
NarrowedBracket11 (s6, transitively), Mathlib.Tactic.
Costume C581. AxiomAudit: import line + #print axioms lines. Ledger N581 row.
