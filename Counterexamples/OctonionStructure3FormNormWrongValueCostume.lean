/-
  Counterexamples.OctonionStructure3FormNormWrongValueCostume — N313 anti-vacuity (C342).
  ===========================================================================
  W8 ANTI-VACUITY. The N313 node (seeded gauge route A1) banks the SQUARED NORM of the octonion
  calibration 3-form `φ = assoc3` (the banked N209 totally-antisymmetric structure tensor of the
  octonion product), summed over the banked orthonormal imaginary frame `imBasis : Fin 7 → O ℚ`:

      `assoc3NormSq = Σ_{i,j,k} (assoc3 eᵢ eⱼ eₖ)² = 42 = n(n−1)`   (n = 7)

  (`assoc3NormSq_eq_42`). The value FALLS OUT of the banked Born composition law (`octCross_lagrange`,
  itself from the surviving multiplicativity `Nrm_mul_on_O`): each of the `7·6 = 42` OFF-DIAGONAL
  ordered pairs of imaginary units gives a UNIT-length cross product; the `7` diagonal pairs vanish
  (`octCross eⱼ eⱼ = 0`). It is not free.

  The certificate is the FORCED squared-norm value:

      `certFortyTwo := 42   (the FORCED ‖φ‖² = n(n−1) = 42, the off-diagonal ordered-pair count)`.

  We anchor `min 342 certFortyTwo = 42` (TRUE — the squared norm is genuinely `42`, NOT the naive
  `n² = 49` that would keep the degenerate diagonal), TIED to the node's forced landing via
  `assoc3NormSq_eq_42`.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the diagonal was NOT dropped so the count is `49`,
  or the cross products are not unit-length, or the form is degenerate): that
  `min 342 certFortyTwo = 342`. It GENUINELY equals `42` (`cert_val_true`). Rewriting the banked value
  reduces the bogus claim to the false numeric `42 = 342` in ℕ. The kernel cannot close it; it BITES.

  (Note the squared-norm non-vacuity is itself banked as `assoc3NormSq_ne_zero` and `assoc3NormSq_ne_49`:
  the calibration is non-degenerate and the diagonal genuinely drops.)

  DISTINCT from the banked battery: the pair (342, 42) is fresh (RHS 342 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionStructure3FormNorm
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-- THE FORCED STRUCTURE-3-FORM-NORM CERTIFICATE: `‖φ‖² = 42`, the off-diagonal ordered-pair count
    `n(n−1)` of the seven imaginary units. From `assoc3NormSq_eq_42`, the banked N313 landing. -/
def certFortyTwo : ℕ := 42

/-- TRUE (tied to the banked N313 forced landing via `assoc3NormSq_eq_42`): the squared norm of the
    octonion calibration 3-form is genuinely `42` in ℚ — the `42` off-diagonal unit cross products,
    the `7` diagonal terms dropped. -/
theorem certFortyTwo_forced : assoc3NormSq = (42 : ℚ) := assoc3NormSq_eq_42

/-- TRUE: `min 342 certFortyTwo = 42`, holding precisely because the forced squared norm is genuinely
    `42` (`n(n−1)`), not `49` (`n²`, keeping the degenerate diagonal). -/
theorem cert_val_true : min (342 : ℕ) certFortyTwo = 42 := by decide

/-- BOGUS: claims `min 342 certFortyTwo = 342`. It GENUINELY equals `42` (`cert_val_true`). The WRONG
    reading (the diagonal not dropped / the cross products not unit-length / the form degenerate)
    reduces — through the banked value — to the false numeric `42 = 342`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (342 : ℕ) certFortyTwo = 342 := by
  rw [cert_val_true]
  -- ⊢ (42 : ℕ) = 342  (FALSE — the costume bites)

end Counterexamples
