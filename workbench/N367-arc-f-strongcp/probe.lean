import Phys.Algebra.OctonionJordanGaugeSpectrumInvariant
import Phys.Algebra.OctonionAssociative3Form

/- PROBE N367: does the F2 strong-CP flavor-half route compile on banked objects?
   Crux facts to confirm:
   (1) The Hermitian-arena reduced determinant jN is ℚ-valued (real by construction).
   (2) Its octonion embedding ocR (jN ...) is self-adjoint (no phase): star = itself.
   (3) The imaginary/phase part of the embedded determinant vanishes.
   (4) jN_aut_invariant: F₄ = Aut(O ℚ) leaves the determinant unchanged (no-RH-rotation).
   (5) The CP-source associator assoc3 is NONZERO (phase is present in the arena).
-/

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra

attribute [local instance] CD.narCD CD.srCD

-- (1) jN is ℚ-valued (its type). Trivial sanity.
example (d0 d1 d2 : ℚ) (a b c : O ℚ) : jN d0 d1 d2 a b c = jN d0 d1 d2 a b c := rfl

-- (2) the embedded determinant is self-adjoint (no phase / arg = 0)
example (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    star (ocR (jN d0 d1 d2 a b c)) = ocR (jN d0 d1 d2 a b c) := ocR_star _

-- (3) the imaginary (phase) part of the embedded determinant is zero
--     imPart z := z - ocR (reQ z);  imPart (ocR r) = 0
example (r : ℚ) : (ocR r) - ocR (reQ (ocR r)) = 0 := by
  rw [ocR_reQ]; ring

-- (4) F₄ / no-RH-rotation: any algebra automorphism leaves the determinant unchanged
example {φ : O ℚ ≃ₗ[ℚ] O ℚ} (h : IsAlgAut φ) (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    jN d0 d1 d2 (φ a) (φ b) (φ c) = jN d0 d1 d2 a b c := jN_aut_invariant h d0 d1 d2 a b c

-- (5) the CP-source associator is nonzero (phase present in the arena)
example : assoc3 u2 u1 (octCross u1 u2) ≠ 0 := assoc3_witness_ne_zero

end Phys.Algebra.HJ
