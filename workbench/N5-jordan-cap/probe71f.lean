/- PROBE 71f (W9.7, trunk route): the BIADDITIVE polar decomposition of jdef in the first
   arg. PURE jb-biadditivity (jb_add_left/right BANKED) + abel — NO mul-distribution, NO
   nuclearity, squares OPAQUE. Free-model residual 0 (pieceB_biadditive.py). -/
import Phys.Algebra.HermitianJordan.Linear
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Tactic

namespace Probe71f
open Phys.Algebra Phys.Algebra.HJ Matrix

variable {S : Type*} [NonAssocRing S] {n : ℕ}

set_option maxHeartbeats 1600000 in
theorem jdef_polar (D X Y : Matrix (Fin n) (Fin n) S) :
    jdef (D + X) Y
      = jdef X Y + jdef D Y
        + ( jb (jb D Y) (jb D X) + jb (jb D Y) (jb X D) + jb (jb D Y) (jb X X)
            + jb (jb X Y) (jb D D) + jb (jb X Y) (jb D X) + jb (jb X Y) (jb X D)
            - jb D (jb Y (jb D X)) - jb D (jb Y (jb X D)) - jb D (jb Y (jb X X))
            - jb X (jb Y (jb D D)) - jb X (jb Y (jb D X)) - jb X (jb Y (jb X D)) ) := by
  unfold jdef
  simp only [jb_add_left, jb_add_right]
  abel

end Probe71f
