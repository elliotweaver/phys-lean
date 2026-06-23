/- PROBE 79C: scaling levers (fixed) + ATTEMPT pc2 entries via the scaling discipline.
   Each pc2 monomial is ocR(scalar)*(single product of two free octonions) -- NO associativity.
   Test whether one entry closes with a bounded tactic. MEASURE ONLY. KILL 85s. -/
import Phys.Algebra.HermitianJordan.PolarFirst
import Phys.Algebra.HermitianJordan.Reduction
import Mathlib.Tactic

namespace Probe79C
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD

theorem ocR_add (r s : ℚ) : ocR r + ocR s = ocR (r + s) := by
  simp only [ocR]; ext <;> simp [Dbl.add_re, Dbl.add_im]

-- THE HADAMARD-SCALING FORM (fixed): jb Dg M scales entry (i,j) by central ocR(d_i+d_j).
theorem jbDg_scale (d0 d1 d2 : ℚ) (M : Matrix (Fin 3) (Fin 3) (O ℚ)) (i j : Fin 3) :
    (jb (Dg d0 d1 d2) M) i j = ocR (![d0,d1,d2] i + ![d0,d1,d2] j) * M i j := by
  unfold jb Dg
  rw [Matrix.add_apply, Matrix.diagonal_mul, Matrix.mul_diagonal,
      ← ocR_comm (![d0,d1,d2] j) (M i j), ← add_mul, ocR_add]

-- pc2 (0,1) entry. polarCross2 expands; the jb-Dg subterms (jb D Y, jb D X, jb D D) scale,
-- the jb-X/Y subterms expand to single products. Try: unfold, expand entries, scale, push.
set_option maxHeartbeats 1000000 in
theorem pc2_01 (d0 d1 d2 : ℚ) (a b c p q r : O ℚ) :
    (polarCross2 (Dg d0 d1 d2) (Xz a b c) (Xz p q r)) 0 1 = 0 := by
  unfold polarCross2
  simp only [Matrix.add_apply, Matrix.sub_apply]
  trace_state
  sorry

end Probe79C
