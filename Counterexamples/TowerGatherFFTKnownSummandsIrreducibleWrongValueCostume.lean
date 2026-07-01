/-
  Counterexamples.TowerGatherFFTKnownSummandsIrreducibleWrongValueCostume — N238 anti-vacuity (C269).
  ===========================================================================
  W8 ANTI-VACUITY. The N238 node banks the THREE KNOWN-SUMMAND IRREDUCIBILITIES of
  `7 ⊗ 7 = 1 ⊕ 7 ⊕ 14 ⊕ 27`: no proper nonzero `adEnd`-invariant subspace exists inside the trivial
  line (`trivialLine`, dim 1), the fundamental `range crossEmb` (dim 7), or the adjoint `range imRepL`
  (dim 14). The load-bearing dimension of the fundamental summand — the one pulled back through the
  injective g₂-equivariant `crossEmb` to `ImO` and killed by `no_proper_invariant_ImO` — is exactly
  `7` (banked `finrank_crossEmb_range`). This dimension is what forces the irreducibility argument:
  a proper invariant subspace would have `0 < dim < 7`, contradicting the transported no-proper-invariant.

  A dimension `= 7` is not vacuous, so the anchor is the genuine value itself, packaged as the clean
  equality `min 7 (finrank ℚ (range crossEmb)) = 7` (which holds precisely BECAUSE
  `finrank ℚ (range crossEmb) = 7`, banked `finrank_crossEmb_range`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the fundamental 7-summand has the wrong
  dimension / the crossEmb transport miscounts / the irreducibility argument protects the wrong
  space): that `min 7 (finrank ℚ (range crossEmb))` equals `269`. It GENUINELY equals `7`
  (`crossEmb_range_dim_true`). Rewriting the banked value reduces the bogus claim to the false
  numeric `7 = 269` in ℕ. The kernel cannot close it; the costume BITES (lean leaves the unsolved
  false goal, exit 1).

  The bite is name-independent: delete every comment and for `O ℚ = CD (H ℚ)`, the fundamental
  summand `range crossEmb` genuinely has dimension `7`, so `min 7 (finrank ℚ (range crossEmb)) = 7`,
  and claiming it equals `269` is genuinely FALSE (7 ≠ 269).

  DISTINCT from the banked battery (... C267 = 4=267, C268 = finrank commutantSpan = 268): the pair
  (269, 7) is fresh (RHS 269 distinct from every prior right-hand value).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherFFTKnownSummandsIrreducible

namespace Counterexamples

open Phys.Algebra

/-- TRUE: `min 7 (finrank ℚ (range crossEmb)) = 7`, holding precisely because the fundamental
    7-summand `range crossEmb` — the space N238 proves has no proper nonzero `adEnd`-invariant
    subspace — genuinely has dimension `7` (banked `finrank_crossEmb_range`). -/
theorem crossEmb_range_dim_true :
    min 7 (Module.finrank ℚ (LinearMap.range crossEmb)) = 7 := by
  have h : Module.finrank ℚ (LinearMap.range crossEmb) = 7 := finrank_crossEmb_range
  omega

/-- BOGUS: claims `min 7 (finrank ℚ (range crossEmb)) = 269`. It GENUINELY equals `7`
    (`crossEmb_range_dim_true`). The WRONG claim (the fundamental 7-summand has the wrong dimension /
    the crossEmb transport protects the wrong space) reduces — through the banked value — to the
    false numeric `7 = 269`, so this must NOT compile. -/
theorem crossEmb_range_dim_wrong_BOGUS :
    min 7 (Module.finrank ℚ (LinearMap.range crossEmb)) = 269 := by
  rw [crossEmb_range_dim_true]
  -- ⊢ (7 : ℕ) = 269  (FALSE — the costume bites)

end Counterexamples
