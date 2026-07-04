import Phys.Algebra.OctonionJordanFamilyRotationSo3Closure
import Mathlib.Tactic

/-
  N290 PROBE v2 — the ENTRY LEMMA that makes the ⊆ crux rational-linear.
  Since ocR r * z = r • z (qMod smul_def) and z * ocR r = r • z (ocR_comm),
  the collapsed generator entry `(adE (ocRM K) M) i j` is a PURE ℚ-linear combo
  of M's entries.  Confirm the scalar-action rewrites, then the (0,2)-entry extraction.
-/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod
set_option maxHeartbeats 1200000

-- The scalar-action identities on the central embedding.
example (r : ℚ) (z : O ℚ) : ocR r * z = r • z := rfl
example (r : ℚ) (z : O ℚ) : z * ocR r = r • z := by rw [← ocR_comm]; rfl

-- The collapsed-generator entry as a rational-linear expression:
-- (adE (ocRM K) M) i j = ∑ k, K i k • M k j - ∑ k, K k j • M i k.
theorem adE_ocRM_entry (K : Matrix (Fin 3) (Fin 3) ℚ)
    (M : Matrix (Fin 3) (Fin 3) (O ℚ)) (i j : Fin 3) :
    (adE (ocRM K) M) i j
      = (∑ k, K i k • M k j) - (∑ k, K k j • M i k) := by
  simp only [adE_apply, Matrix.sub_apply, Matrix.mul_apply, ocRM_apply]
  congr 1
  · apply Finset.sum_congr rfl; intro k _; rfl
  · apply Finset.sum_congr rfl; intro k _; rw [← ocR_comm]; rfl

end Phys.Algebra.HJ
