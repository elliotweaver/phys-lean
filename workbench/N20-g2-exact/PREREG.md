# N20 — PREREG (frozen before Lean compute)

## TARGET
(U) `Module.finrank ℚ derivationQ ≤ 14` derived FORWARD, then with banked
`finrank_derivationQ_ge_14` ⟹ `= 14` (`le_antisymm`). Then g₂ structure (or child).

## THE ROUTE (reconnaissance frozen — workbench/N20-g2-exact/recon.py, recon2.py)
W6 re-verified on the EXACT-RATIONAL faithful model: Leibniz system rank 50 / nullity 14
⟹ dim_ℚ Der(O ℚ) = 14. Generation: e3=e1·e2, e5=e1·e4, e6=e2·e4, e7=(e1·e2)·e4.

The map ρ : D ↦ (D e1, D e2, D e4) ∈ (O ℚ)³ is INJECTIVE on Der (measured: killing
De1,De2,De4 forces nullity 0). The image satisfies EXACTLY 7 independent linear
constraints (cokernel of the 14×21 image matrix), cutting the generic 21 (= 3 imaginary
copies of dim 7) down to 14:
  C0: (D e1).c1 = 0                              (diagonal skew, e1²=−1)
  C1: (D e1).c2 + (D e2).c1 = 0                  (off-diag skew)
  C2: (D e2).c2 = 0                              (diagonal skew, e2²=−1)
  C3: (D e1).c4 + (D e4).c1 = 0                  (off-diag skew)
  C4: (D e2).c4 + (D e4).c2 = 0                  (off-diag skew)
  C5: (D e1).c6 − (D e2).c5 + (D e4).c3 = 0      (the OCTONIONIC constraint)
  C6: (D e4).c4 = 0                              (diagonal skew, e4²=−1)
where (D ei).cj = coordinate-j of D(ei). The 14 PIVOT (free) coords are
  De1.{c2,c3,c4,c5,c6,c7}, De2.{c3,c4,c5,c6,c7}, De4.{c5,c6,c7}.

## ARCHITECTURE (production)
1. `deriv_determined_by_gens` : IsDerivQ D → D e1 = 0 → D e2 = 0 → D e4 = 0 → D = 0.
   PURE LEIBNIZ: e3,e5,e6,e7 generated; D 1 = 0 (deriv_one ℚ); ℚ-linearity over basis.
2. The 7 constraint lemmas C0..C6 — each a coordinate consequence of IsDerivQ (Leibniz
   at basis products + banked trace-free). Skew ones from e_i²=−1 + cross relations.
3. `upperBoundMap : derivationQ →ₗ[ℚ] (Fin 14 → ℚ)` reading the 14 pivot coords.
   INJECTIVE: TD=0 ⟹ (14 pivots zero) + C0..C6 ⟹ De1=De2=De4 all coords zero ⟹
   (deriv_determined_by_gens) D=0.
4. `finrank_derivationQ_le_14` via `LinearMap.finrank_le_finrank_of_injective` +
   `finrank (Fin 14 → ℚ) = 14`.
5. `finrank_derivationQ_eq_14 := le_antisymm (≤14) (≥14 banked)`.

## GO / NO-GO
GO if: (U) `finrank ≤ 14` proved forward, foundations-only ⊆ {propext, Classical.choice,
Quot.sound}, NO posited G₂; ⟹ `= 14`; gate D0–D6 green; new costume bites a WRONG count
(dim=15 or ≤13 must fail). g₂ STRUCTURE childed if it fights (legitimate W3).
NO-GO / DECOMPOSE if the constraints or assembly fight: bank determination lemma +
whatever constraints + scaffold that compile clean, child the remainder onto the chain
tail (W3). The upper bound (U) alone is a legitimate bankable node.

## KILL BUDGET (W9 — PRIME RISK)
- Compile-cost KILL: 90s / obligation. If any single lemma exceeds 90s, STOP — it is an
  instrument failure: restructure (smaller named steps), do NOT inflate maxHeartbeats
  past default (200000), do NOT `decide`/`ring` a 512×64 kernel (MEASURED DEAD N16).
- MEASURE determination + one constraint in SCRATCH before committing to all.
- bank-as-you-go (W9.8): commit each lemma the instant it elaborates clean.
- TURN-BUDGET CHECKPOINT: at ~55–60% of turns, FINALIZE (commit + child + complete) with
  turns to spare. A clean board beats a richer board that times out mid-lifecycle.

## ANTI-VACUITY (W8)
New costume MUST bite a WRONG count: `finrank ≤ 13` (collides with banked ≥14) or
`finrank = 15` must FAIL to compile. Reuse banked derivationQ + the explicit basis.

## PHYSICS-WORDS-REMOVABLE
Delete "gauge / g₂ / automorphism": theorems remain a complete proof that the
Leibniz-derivation ℚ-submodule of the Cayley–Dickson double of a double of a double has
dimension exactly 14. No theorem STATEMENT needs a physics word.
