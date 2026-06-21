import Phys.Cascade.ForcedStop
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Algebra.Star.Basic
import Mathlib.Tactic
open Phys.Cascade
abbrev M2 := Matrix (Fin 2) (Fin 2) ℚ
attribute [local instance] CD.narCD CD.srCD
-- bilin on CD M2 (non-central base). Concrete witness matrices.
noncomputable def ma : M2 := !![0,1;0,0]
noncomputable def mb : M2 := !![0,0;1,0]
noncomputable def mc : M2 := !![1,0;0,0]
noncomputable def uu : CD M2 := ⟨ma, 0⟩
noncomputable def vv : CD M2 := ⟨mb, 0⟩
noncomputable def ww : CD M2 := ⟨mc, 0⟩
-- adjoint claim: bilin (u*v) w = bilin v (star u * w) ; entry (0,0)
#check (CD.bilin (uu*vv) ww)
example : (CD.bilin (uu*vv) ww) 0 0 = (CD.bilin vv (star uu * ww)) 0 0 := by
  simp only [CD.bilin, uu, vv, ww, ma, mb, mc, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    CD.add_re]
  sorry
