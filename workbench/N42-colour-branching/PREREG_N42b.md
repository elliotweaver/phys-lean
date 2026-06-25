# N42b — THE DIMENSION dim stabLieQ = 8 = dim su(3) — PREREG ADDENDUM (frozen before compute)

## THE TARGET
`Module.finrank ℚ stabLieQ.toSubmodule = 8`, DERIVED (rank–nullity on the banked
`evalU1`), NOT a posited `dim su(3) = 8`, NOT Mathlib ℝ as content, NOT a bridge.

## WHAT IS BANKED (grep-verified against the built tree, run 188; W6 re-verify)
- N42a (`Phys/Algebra/DerivationStabilizer.lean`):
  - `evalU1 : derivationLieQ →ₗ[ℚ] O ℚ`, `evalU1 D = (D : Module.End ℚ (O ℚ)) u1` (`evalU1_apply`).
  - `stabLieQ : LieSubalgebra ℚ derivationLieQ`, `stabLieQ_toSubmodule_eq_ker : stabLieQ.toSubmodule = ker evalU1`.
- `Phys/Algebra/DerivationPerfect.lean`:
  - `bL : Fin 14 → derivationLieQ`, `bL_coe : (bL i : Module.End ℚ (O ℚ)) = ![D0E..D13E] i` (rfl).
  - `bLbasis : Module.Basis (Fin 14) ℚ derivationLieQ` (`= derivBasis.map toLieEquiv`), `bLbasis_eq : bLbasis i = bL i`.
  - `bL_span_top : Submodule.span ℚ (Set.range bL) = ⊤`.
- `Phys/Algebra/DerivationBracket.lean`: `finrank_derivationQ_eq_14`; `derivationLieQ.toSubmodule` is
  DEFEQ to `derivationQ` (DerivationIrreducibleFull.lean:269 assigns `finrank ℚ derivationLieQ.toSubmodule = 14 := finrank_derivationQ_eq_14`).
- `Phys/Algebra/DerivationCompact.lean`: `coordO : O ℚ ≃ₗ[ℚ] (Fin 8 → ℚ)`, `bO : Module.Basis (Fin 8) ℚ (O ℚ)`.
- `Phys/Algebra/DerivationLowerBound.lean`: `c0..c7`, `D0E..D13E`, `u1 = e₁` (DerivationUpperBound.lean).
- Mathlib: `LinearMap.finrank_range_add_finrank_ker`, `LinearMap.range_eq_map`, `Submodule.map_span`,
  `finrank_span_eq_card`, `Submodule.finrank_le`.

## THE MEASURED ROUTE (the proof skeleton to MEASURE then WRITE)
Step A. `range evalU1 = span ℚ { evalU1 (bL i) | i }`.
  Since `span (range bL) = ⊤` (bL_span_top), `range evalU1 = map evalU1 ⊤ = map evalU1 (span (range bL))
  = span (evalU1 '' range bL) = span (range (evalU1 ∘ bL))`. (LinearMap.range_eq_map + Submodule.map_span +
  Set.image_comp / range comp.)
Step B. The 14 images `imgVec i := evalU1 (bL i) = D_iE u1` compute EXACTLY (MEASURED run 187):
  D0E,D1E,D2E,D13E ↦ 0 ; D7E↦e2, D11E↦−e2 ; D6E,D12E↦e3 ; D5E↦−e4, D9E↦e4 ; D4E,D10E↦−e5 ; D3E↦e6 ; D8E↦e7.
  ⟹ `range (evalU1 ∘ bL) = {0, e2, −e2, e3, −e4, e4, −e5, e6, e7}` whose span = span{e2,e3,e4,e5,e6,e7}.
Step C. `finrank (span{e2,e3,e4,e5,e6,e7}) = 6`: the 6 octonion units e2..e7 are linearly independent
  (image of 6 distinct standard basis vectors under `coordO.symm`, or: `coordO`-images are 6 distinct
  `Pi.single` vectors, independent). Then `finrank_span_eq_card` on a `Fin 6`-indexed independent family.
Step D. Rank–nullity: `finrank (range evalU1) + finrank (ker evalU1) = finrank derivationLieQ = 14`
  (`LinearMap.finrank_range_add_finrank_ker evalU1`). With `finrank (range evalU1) = 6` and
  `stabLieQ_toSubmodule_eq_ker`: `finrank stabLieQ.toSubmodule = 14 − 6 = 8`.

## GO / NO-GO / KILL (frozen)
- GO: the four steps compile clean over ℚ, foundations-only, costume C72 bites a WRONG dimension.
- COMPILE-COST KILL: any SINGLE obligation > 60s in a bounded probe ⟹ INSTRUMENT failure (W9):
  MEASURE → DECOMPOSE (each step its own banked lemma/olean) → reframe; NEVER inflate maxHeartbeats.
  The 14 image computations are `ext <;> simp [DiE,u1,ci]` — each ≤ a few s (measured N42a). The
  span-equality + 6-independence are the steps most likely to be heavy; MEASURE them FIRST.
- TURN CHECKPOINT: ~50% turns → STOP feature work, FINALIZE (commit + complete/child) with turns to spare.
  BANK-AS-YOU-GO (W9.8): each clean lemma → production + commit before chasing the full theorem.
- LIKELY DECOMPOSITION if heavy: bank `range_evalU1_eq_span6` (Steps A–C, finrank range = 6) as its own
  olean; the rank–nullity assembly (Step D) as its own. If Step C is the genuine hard core after
  measure+reframe → W1 dissolution ticket + block.

## COSTUME C72 (W8 anti-vacuity) — MUST BITE
A WRONG dimension: `finrank ℚ stabLieQ.toSubmodule = 14` (whole algebra) or `= 6` — must FAIL to compile,
refuted by the real `= 8`. Reuse the banked `stabLieQ`.

## STANDARD (the second gate)
UNBROKEN: evalU1/stabLieQ (N42a), bLbasis/bL_span_top (N23 DerivationPerfect), finrank_derivationQ_eq_14
(N20), coordO/bO (DerivationCompact) — all banked; Module.finrank / rank–nullity / span are MACHINERY.
NOTHING posited; NO Mathlib ℝ (pure algebra over ℚ); NO posited SU(3)/G₂/su(3)/g₂/dim. PHYSICS-WORDS-
REMOVABLE: delete "colour/SU(3)/G₂/triplet" → the dimension of the kernel of the evaluation-at-a-vector
map on the 14-dim derivation Lie algebra of the CD double of a double of a double of ℚ is 8. NO bridge.
