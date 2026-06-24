import Phys.Algebra.DerivationUpperBound
import Mathlib.Tactic

namespace Phys.Algebra.ScratchN20asm
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- coordinate-vanishing ⟹ zero, for `O ℚ`. -/
theorem oct_ext_zero (x : O ℚ)
    (h0 : x.re.re.re = 0) (h1 : x.re.re.im = 0)
    (h2 : x.re.im.re = 0) (h3 : x.re.im.im = 0)
    (h4 : x.im.re.re = 0) (h5 : x.im.re.im = 0)
    (h6 : x.im.im.re = 0) (h7 : x.im.im.im = 0) : x = 0 := by
  ext
  · exact h0
  · exact h1
  · exact h2
  · exact h3
  · exact h4
  · exact h5
  · exact h6
  · exact h7

/-- THE 14-PIVOT COORDINATE MAP. -/
def coordMap : Module.End ℚ (O ℚ) →ₗ[ℚ] (Fin 14 → ℚ) where
  toFun D := ![
    (D u1).re.im.re, (D u1).re.im.im, (D u1).im.re.re, (D u1).im.re.im, (D u1).im.im.re, (D u1).im.im.im,
    (D u2).re.im.im, (D u2).im.re.re, (D u2).im.re.im, (D u2).im.im.re, (D u2).im.im.im,
    (D u4).im.re.im, (D u4).im.im.re, (D u4).im.im.im ]
  map_add' D D' := by
    funext i
    fin_cases i <;>
      simp [LinearMap.add_apply, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im]
  map_smul' q D := by
    funext i
    fin_cases i <;>
      simp [LinearMap.smul_apply, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im]

end Phys.Algebra.ScratchN20asm
