/- PROBE (run 65, W9.2): measure pieceA crux. (a) Hm_split; (b) pieceA structural reduction
   skeleton via master identity; (c) the G_Hm1 off-diagonal (0,1) entry cost (alt-burden 1). -/
import Phys.Algebra.HermitianJordan.Reduction
import Phys.Algebra.HermitianJordan.SinglePair
import Phys.Algebra.Alternative
import Mathlib.Tactic

namespace ProbeA
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD

variable {B : Type*} [CommRing B] [StarRing B]

-- (a) Hm = Dg + Xz  (matrix split). Cheap structural.
set_option maxHeartbeats 400000 in
theorem Hm_split (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    Hm d0 d1 d2 a b c = Dg d0 d1 d2 + Xz a b c := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Hm, Dg, Xz, Matrix.diagonal, Matrix.add_apply, Matrix.of_apply, Matrix.cons_val',
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_fin_one,
      Matrix.empty_val', Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const]

end ProbeA
