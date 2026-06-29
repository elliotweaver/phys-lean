# N174 PREREG — cutExp over the derived ℝ `Cut` (the continuous exponential, number-tower sub-node)

FROZEN BEFORE COMPUTE (run 390).

## THE FRONT CHOSEN (MEASURE-FIRST verdict, W9)
Three fronts on the N174 frontier:
- (i) cutExp/cutLog → cutRpow over derived `Cut` — GENUINELY MISSING (grep: no def cutExp/cutLog/cutRpow/cutPow anywhere in Phys/). FORWARD-OPENING (a new number-tower primitive).
- (ii) discrete component-group ℤ/2×ℤ/2 / π₀=4 — W4.5 RE-PIN: the Klein-four relations (parityLin_sq, timeRevLin_sq, ptLin_sq=1, comm, ptLin_eq, four distinct) are ALREADY banked N173. An abstract group-iso mostly re-packages banked facts. → child as OPTIONAL.
- (iii) full G₂ 14-dim via expOEquiv — W9 HEAVY (operator-exp route).

VERDICT: build **(i) cutExp** — the smallest genuinely-missing forward sub-node. The analytic seed is BANKED:
`cut_summable_pow_div_factorial` (∑ cⁿ/n! summable, c≥0) and `cut_summable_mul_of_abs` (the Cauchy-product family) in ContinuumSummable.lean. The MATRIX exponential (expTerm→summable→expMap→expMap_zero→expMap_mul_of_commute→invertibility) is FULLY BANKED over `Cut` (DerivationAutExp.lean N39, DerivationAutExpHom.lean N40). The SCALAR cutExp over `Cut` is strictly simpler (no entrywise reduction, no matrix product, commutativity automatic). `Cut` is a complete `Field` (instCompleteSpaceCut N37) with `OrderTopology` + `ConditionallyCompleteLinearOrder` + `Archimedean`.

## NUMBER-TOWER GATE (STANDARD §3) — the binding constraint
cutExp MUST be DERIVED from the derived `Cut` via the banked exp power series `∑ xⁿ/n!`, summable by the
BANKED `cut_summable_pow_div_factorial` (itself derived from C6 order-completeness N33/N34). **NEVER** a
`Mathlib.Real.exp`/`Real.rpow` import as content. Imports: `Phys.Foundation.ContinuumSummable` +
`Mathlib.Topology.Algebra.InfiniteSum.Ring` (machinery on the DERIVED Cut). This is the METALANGUAGE
distinction: the Cauchy-product topology lemma is machinery operating on the DERIVED Cut; the OBJECT
(`Cut` and its exp) is DERIVED, not imported.

## GO / NO-GO
GO if ALL of:
1. `cutExp : Cut → Cut := ∑' n, xⁿ/n!` defined; summable for ALL x (absolute comparison via abs).
2. `cutExp_zero : cutExp 0 = 1` proved.
3. `cutExp_add : cutExp a * cutExp b = cutExp (a+b)` proved (Cauchy product + binomial crux).
4. `cutExp_mul_neg : cutExp x * cutExp (-x) = 1` (invertibility) proved.
5. `cutExp_pos : 0 < cutExp x` proved (x = x/2+x/2 ⟹ square ≠ 0).
6. foundations-only {propext, Classical.choice, Quot.sound}; costume C206 bites a WRONG cutExp claim (1=174).

## KILL (instrument-failure classification, not theory failure)
- If `tsum_mul_tsum_eq_tsum_sum_antidiagonal` does NOT synthesize `T3Space Cut`/`IsTopologicalSemiring Cut`
  (it MUST — the matrix file got these on Matrix…Cut from the Pi of Cut's instances): this is an INSTRUMENT
  question, resolved by probing the instance directly. If genuinely missing, build the instance (W1) — do NOT
  abandon the front.
- If the binomial crux field arithmetic fights: it is the SAME proof banked in expTerm_antidiagonal (matrix);
  port it verbatim (scalar is simpler). NOT a theory fight.
- COST BUDGET: each lemma should be < 5 s (scalar, no matrix entrywise). If any single obligation exceeds
  ~30 s, MEASURE the smallest sub-obligation (W9) — do NOT inflate maxHeartbeats.

## SCOPE / DECOMPOSITION
This run banks **cutExp** (the exponential + homomorphism + invertibility + positivity).
cutLog (the inverse on positives, needs surjectivity/IVT over Cut) and cutRpow (x^p := cutExp(p·cutLog x))
are the CHILD node N175, childed onto the chain tail.

## COSTUME (C206, W8)
Bite a WRONG cutExp claim reducing to a false numeric DISTINCT from the battery (C204 1=172, C205 1=173):
claim `cutExp 0 = (174 : Cut)`; `rw [cutExp_zero]` leaves `(1:Cut) = 174`, unsolved. NON-VACUOUS: cutExp_zero
genuinely = 1 (the n=0 term 0⁰/0! = 1 is the only survivor).
