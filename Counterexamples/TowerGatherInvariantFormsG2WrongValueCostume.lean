/-
  Counterexamples.TowerGatherInvariantFormsG2WrongValueCostume — N235 anti-vacuity (C266).
  ===========================================================================
  W8 ANTI-VACUITY. The N235 node banks the g₂-INVARIANT-FORM GENERATOR TOOLKIT: the metric
  δ = `gForm`, the associative 3-form φ = `assoc3`, and the coassociative 4-form ψ = `coassoc4`
  are all g₂-invariant (invariant under every derivation `D ∈ derivationLieQ`). An invariance
  identity `... = 0` is vacuously true of the ZERO form, so the node's teeth are the NON-VACUITY
  anchor: the associative 3-form φ takes a GENUINE nonzero value on the derived orthonormal triple
  `(u1, u2, u1×u2)`:

      assoc3 u1 u2 (octCross u1 u2) = 1     (`invariantForms_nonvacuity`, via the banked N209
                                             witness `assoc3_witness_swapped`),

  so φ is NOT the zero form and its g₂-invariance is genuine content — not the vacuous invariance
  of `0`.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: φ vanishes on the witness triple / the form is
  degenerate / the witness value is anything other than 1): that this value equals (266 : ℚ).
  Rewriting the banked value shows the bogus claim reduces to the false numeric `1 = 266` in ℚ. The
  kernel cannot close it; the costume BITES (lean leaves the unsolved false goal, exit 1).

  The bite is name-independent: delete every comment and for the octonion shape O ℚ = CD (H ℚ), the
  3-form `assoc3` genuinely takes the value `1` on `(u1, u2, u1×u2)` (banked
  `invariantForms_nonvacuity`), so claiming this equals 266 is genuinely FALSE (1 ≠ 266).

  DISTINCT from the banked battery (... C264 = 27=264, C265 = 49=265): the pair (266, 1) is fresh
  (RHS 266 distinct from every prior right-hand value).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherInvariantFormsG2

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE: the associative 3-form φ = `assoc3` takes the genuine nonzero value `1` on the derived
    orthonormal witness triple `(u1, u2, u1×u2)` (banked `invariantForms_nonvacuity`). -/
theorem invariantForms_witness_true : assoc3 u1 u2 (octCross u1 u2) = 1 :=
  invariantForms_nonvacuity

/-- BOGUS: claims the witness value is `266`. It GENUINELY equals `1` (`invariantForms_witness_true`).
    The WRONG claim (φ vanishes / degenerate / the witness value is not 1) reduces — through the
    banked value — to the false numeric `1 = 266`, so this must NOT compile. -/
theorem invariantForms_witness_wrong_BOGUS : assoc3 u1 u2 (octCross u1 u2) = 266 := by
  rw [invariantForms_witness_true]
  -- ⊢ (1 : ℚ) = 266  (FALSE — the costume bites)

end Counterexamples
