# N233 — THE CANONICAL INTERNAL DIRECT SUM (PREREG)

## TARGET (single, decided)
Bank `DirectSum.IsInternal` of the four g₂-submodules of `End ℚ ImO` (the 7⊗7 = 49 arena):
```
A : Fin 4 → Submodule ℚ (End ℚ ImO)
A 0 = trivialLine            (1)
A 1 = LinearMap.range crossEmb (7)
A 2 = LinearMap.range imRepL   (14)
A 3 = tracelessSym           (27)
```
`DirectSum.IsInternal A` — the internal g₂-equivariant direct sum `7⊗7 = 1 ⊕ 7 ⊕ 14 ⊕ 27`.

Plus:
- DIMENSION IDENTITY `1 + 7 + 14 + 27 = 49 = finrank (End ℚ ImO)` (independent consistency witness).
- EACH SUMMAND g₂-STABLE under `adEnd D` (decomposition of g₂-MODULES, not merely subspaces).
- Capstone bundling `IsInternal` + dimension identity + four g₂-stabilities.

## ROUTE (measured — all prerequisites banked, no missing structural fact)
`DirectSum.isInternal_submodule_of_iSupIndep_of_iSup_eq_top (hi : iSupIndep A) (hs : iSup A = ⊤)`
  (Mathlib `Algebra/DirectSum/Module.lean:504`, `section Ring` — ℚ Ring, End ℚ ImO AddCommGroup+Module ℚ).

- `iSup A = ⊤` — from the FOUR-WAY RESOLUTION `projTrivial X + proj27 X + proj7 X + proj14 X = X`
  (N232 `projTrivial_add_proj27_add_proj7_add_proj14`): each summand lands in one A i
  (`projTrivial_apply_mem`→A0, `proj7_apply_mem`→A1, `proj14_apply_mem`→A2, `proj27_apply_mem`→A3),
  so every X is a sum of members of the A i ⟹ ⨆ = ⊤.
- `iSupIndep A` — from the four banked idempotents. For each i: `Disjoint (A i) (⨆ j≠i, A j)`.
  A vector x ∈ A i ∩ (⨆ j≠i A j) is FIXED by the i-th projector P_i (x ∈ A i = range P_i idempotent)
  AND KILLED by P_i (⨆ j≠i A j ≤ ker P_i, since P_i kills each other summand) ⟹ x = P_i x = 0.
  fixFact (P_i fixes A_i) and killFact (P_i kills A_j, j≠i) are ALL banked N231/N232:
    projTrivial: fix trivialLine (projTrivial_apply_triv); kill crossEmb/imRepL (projTrivial_apply_skew
      ∘ crossEmb_range_le_so7'/imRep_range_le_so7), kill tracelessSym (projTrivial_apply_tracefree).
    proj7: fix crossEmb (proj7_apply_fun); kill trivialLine/tracelessSym (proj7_apply_self ∘
      trivialLine_le_selfAdj/tracelessSym_le_selfAdj), kill imRepL (proj7_apply_adj).
    proj14: fix imRepL (proj14_apply_adj); kill trivialLine/tracelessSym (proj14_apply_self ∘ …),
      kill crossEmb (proj14_apply_fun).
    proj27: fix tracelessSym (proj27_apply_tracefree); kill trivialLine (proj27_apply_triv),
      kill crossEmb/imRepL (proj27_apply_skew ∘ crossEmb_range_le_so7'/imRep_range_le_so7).

## DIMENSION IDENTITY
finrank_trivialLine (1) + finrank_crossEmb_range (7) + finrank_imRep_range (14)
  + finrank_tracelessSym_eq_27 (27) = 49 = finrank_end_eq_49.

## g₂-STABILITY of each summand under adEnd D
- trivialLine: trivialLine_adEnd_inv (N228).
- range crossEmb: adEnd_apply + crossEmb_range_g2_invariant (N224).
- range imRepL: adEnd_apply + imRep_range_g2_invariant (N225).
- tracelessSym: tracelessSym_adEnd_inv (N228).

## COST BUDGET / KILL
Pure structural assembly over banked idempotents; NO coordinate `ring`/`decide`, NO finrank recompute
(all four finranks + the =49 are banked). fin_cases over Fin 4 (×Fin 4 for killFact). Expected < 30s
standalone build. KILL: if any single obligation needs > 3 min or a maxHeartbeats proof-search raise,
STOP — it means the family/index bookkeeping is wrong (reframe), not grind.

## STANDARD
UNBROKEN: imports ONLY banked N232 (transitively the whole tower) + Mathlib DirectSum/iSupIndep MACHINERY.
COMPLETE: foundations-only, no sorry/axiom/native_decide, inherit only the synthInstance ceiling.
WORDS-REMOVABLE: `DirectSum.IsInternal ![trivialLine, range crossEmb, range imRepL, tracelessSym]` on
  derived End ℚ ImO — no physics word in any statement.
FREE-FLOATING: the TYPE mentions the banked tower objects trivialLine/crossEmb/imRepL/tracelessSym/
  adEnd/ImO/derivationLieQ — the CONCRETE four-way decomposition, not a carrier-agnostic direct sum.

## COSTUME (C265)
The dimension identity is a genuine 49 (`gather_finrank_sum`); a bogus value forces `49 = 265` in ℕ.
