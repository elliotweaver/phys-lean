import Phys.Algebra.DerivationPerfect
import Mathlib.Algebra.Lie.TraceForm
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

def coordO : O ℚ ≃ₗ[ℚ] (Fin 8 → ℚ) where
  toFun z := ![c0 z, c1 z, c2 z, c3 z, c4 z, c5 z, c6 z, c7 z]
  invFun v := ⟨⟨⟨v 0, v 1⟩, ⟨v 2, v 3⟩⟩, ⟨⟨v 4, v 5⟩, ⟨v 6, v 7⟩⟩⟩
  map_add' a b := by
    funext i; fin_cases i <;>
      simp [c0,c1,c2,c3,c4,c5,c6,c7, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im]
  map_smul' q z := by
    funext i; fin_cases i <;>
      simp [c0,c1,c2,c3,c4,c5,c6,c7, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im]
  left_inv z := by
    obtain ⟨⟨⟨a,b⟩,⟨c,d⟩⟩,⟨⟨e,f⟩,⟨g,h⟩⟩⟩ := z
    rfl
  right_inv v := by funext i; fin_cases i <;> simp [c0,c1,c2,c3,c4,c5,c6,c7]

def bO : Module.Basis (Fin 8) ℚ (O ℚ) := Module.Basis.ofEquivFun coordO

/-- The Born symmetric form. -/
def gForm (v w : O ℚ) : ℚ := reQ (v * star w)

/-- positive form: g w w = sum of 8 coordinate squares. -/
theorem gForm_self_sum_sq (w : O ℚ) :
    gForm w w = (c0 w)^2+(c1 w)^2+(c2 w)^2+(c3 w)^2+(c4 w)^2+(c5 w)^2+(c6 w)^2+(c7 w)^2 := by
  simp only [gForm, reQ, c0,c1,c2,c3,c4,c5,c6,c7, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im]
  ring

/-- coord_eq_g for i=0 : c0 w = gForm w (bO 0). MEASURE cost. -/
theorem coord_eq_g0 (w : O ℚ) : c0 w = gForm w (bO 0) := by
  simp only [bO, Module.Basis.ofEquivFun_apply, gForm, reQ]
  simp only [coordO]
  simp [c0, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im,
    Dbl.neg_re, Dbl.neg_im, Pi.single_apply]

end

end Phys.Algebra
