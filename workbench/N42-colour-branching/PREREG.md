# N42 — SU(3) ⊂ G₂ / the 7 = 3 ⊕ 3̄ ⊕ 1 COLOUR BRANCHING — PREREG (frozen before compute)

## The target (large node — DECOMPOSE)
Over the DERIVED objects (O ℚ, ImO, derivationLieQ, ContinuumQ.Cut), DERIVE from the chain:
(a) the STABILIZER Lie subalgebra `stab = {D ∈ Der(𝕆) : D i = 0}` of a fixed unit imaginary
    octonion `i` (the banked complex unit), its dimension `8 = dim su(3)` (vs 14 = dim Der(𝕆));
(b) the BRANCHING `7 = 3 ⊕ 3̄ ⊕ 1` of Im(𝕆) under the complex structure `J = L_i`.

## WHAT IS BANKED (verified by grep against the source tree, run 187)
- `Phys.Algebra.derivationLieQ : LieSubalgebra ℚ (Module.End ℚ (O ℚ))` (DerivationBracket.lean),
  carrier `{D | IsDerivQ D}`, Lie subalgebra (commutator closes). `mem_derivationLieQ`.
- `finrank_derivationQ_eq_14 : Module.finrank ℚ derivationQ = 14` (DerivationUpperBound.lean);
  `derivationLieQ_carrier_eq` (carrier = derivationQ carrier, rfl).
- The 14 explicit derivations `D0E..D13E : Module.End ℚ (O ℚ)` (DerivationLowerBound.lean),
  each `DiE_isDerivQ`, `Dvec_linearIndependent` (the ![D0E..D13E] family lin-indep),
  `Dvec_mem` (each ∈ derivationQ).
- `ImO : Submodule ℚ (O ℚ) := ker(starL+1)` (DerivationRep7.lean), `mem_ImO` (star x = -x),
  `finrank_ImO = 7` (rank–nullity, range = ℚ·1). `derivQ_maps_im`, `derivLieQ_mapsTo`,
  `imRep : derivationLieQ →ₗ⁅ℚ⁆ Module.End ℚ ImO` (faithful 7-rep), `imRep_injective`.
- `u1, u2, u4 : O ℚ` (DerivationUpperBound.lean): u1 = e1, u2 = e2, u4 = e4. `u1_mem_ImO` etc.
- coordinate extractors `c0..c7 : O ℚ → ℚ` (DerivationLowerBound.lean).

## THE ROUTE (reframe through the trunk; NO Born form needed for the dimension)
Fix `i := u1` (the banked first imaginary generator, e1; `u1_mem_ImO`; verify `u1*u1 = -1`).
1. `stabLieQ := {D ∈ derivationLieQ : D u1 = 0}` — a `LieSubalgebra` (closure: D u1 = 0, E u1 = 0
   ⟹ ⁅D,E⁆ u1 = D(E u1) − E(D u1) = 0).
2. The evaluation map `evalU1 : derivationLieQ →ₗ[ℚ] O ℚ`, `D ↦ D.val u1`. Its kernel
   submodule = stabLieQ.toSubmodule.
3. CLEAN DIMENSION (explicit, NO Born form): the 14 `D_iE` form a BASIS of derivationLieQ
   (14 lin-indep elements in a 14-dim space). So `range evalU1 = span{evalU1 D0E .. D13E}`.
   Compute the 14 images explicitly:
     D0E,D1E,D2E,D13E ↦ 0 ;  D7E↦e2, D11E↦−e2 ; D6E,D12E↦e3 ; D5E↦−e4, D9E↦e4 ;
     D4E,D10E↦−e5 ; D3E↦e6 ; D8E↦e7.
   So `range evalU1 = span{e2,e3,e4,e5,e6,e7}`, `finrank = 6`.
   Rank–nullity: `finrank(stab) = 14 − 6 = 8`.   ← THE MOAT (8 = dim su(3)).
4. BRANCHING (likely a child): J = L_{u1} on `{u1}^⊥ ∩ ImO` (6-dim), J² = −1 (alternativity),
   split V⊗ℂ = V^{1,0} ⊕ V^{0,1} = 3 ⊕ 3̄; ⟨u1⟩ the singlet.

## DECOMPOSITION (aggressive, anti-timeout)
- **N42a (THIS run):** the stabilizer Lie subalgebra `stabLieQ` + the `evalU1` linear map +
  `ker evalU1 = stabLieQ` + non-vacuity (D0E ∈ stab, D3E ∉ stab) + `u1*u1 = -1`. Commit.
  THEN if turns remain, attack the dimension as a separate committed increment.
- **N42b (child if needed):** `finrank stabLieQ = 8` via the basis + explicit images + rank–nullity.
- **N42c (child):** the 7 = 3 ⊕ 3̄ ⊕ 1 branching (complex structure split).

## GO / NO-GO / KILL (frozen)
- GO: build stabLieQ + evalU1 + ker-eq + non-vacuity clean, foundations-only, costume bites.
- COMPILE-COST KILL: any SINGLE obligation > 60s in a bounded probe ⟹ INSTRUMENT failure
  (W9): MEASURE → DECOMPOSE → reframe; never inflate maxHeartbeats, never re-grind.
- TURN CHECKPOINT: at ~50% turns, STOP feature work, FINALIZE (commit + child + complete)
  with turns to spare. NEVER run out mid-task (auto-blocks). THREE N41g runs timed out — heed it.
- COSTUME C71 (W8 anti-vacuity): a WRONG stabilizer claim (e.g. D3E ∈ stab, i.e. D3E u1 = 0,
  which is FALSE since D3E u1 = e6 ≠ 0) MUST fail to compile. Later: wrong dimension (=14 or =6).

## STANDARD (the second gate)
UNBROKEN: every object derived (derivationLieQ N16–N21, ImO/u1, the explicit basis) or Mathlib
machinery (LieSubalgebra, LinearMap.ker, rank–nullity). NOTHING posited; NO Mathlib ℝ as content
(this node is over ℚ — pure algebra). NO posited SU(3)/G₂/su(3)/g₂. PHYSICS-WORDS-REMOVABLE:
delete "colour/SU(3)/G₂/triplet/gauge" → a proof about the stabilizer of a vector in the derivation
algebra of the 8-dim non-associative *-algebra + its dimension. NO bridge.
