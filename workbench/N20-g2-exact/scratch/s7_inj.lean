import Phys.Algebra.DerivationUpperBound
import Mathlib.Tactic

namespace Phys.Algebra.ScratchN20inj
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

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

-- C5/octonionic: we need (D u3).c4 in terms of De1,De2 via Leibniz on e1*e2=e3.
-- But the FINDINGS cascade uses: De3 = D(e1*e2) = De1*e2 + e1*De2 (Leibniz). When
-- De1=De2=0 already established ⟹ De3=0. So C5 cut (cut_e34_c0) gives De4.c3 once De3=0.

/-- The pivot-vanishing reading: if `coordMap D = 0` then the 14 pivot coords vanish. -/
theorem pivots_zero (D : Module.End ℚ (O ℚ)) (hker : coordMap D = 0) :
    (D u1).re.im.re = 0 ∧ (D u1).re.im.im = 0 ∧ (D u1).im.re.re = 0 ∧ (D u1).im.re.im = 0 ∧
    (D u1).im.im.re = 0 ∧ (D u1).im.im.im = 0 ∧
    (D u2).re.im.im = 0 ∧ (D u2).im.re.re = 0 ∧ (D u2).im.re.im = 0 ∧ (D u2).im.im.re = 0 ∧
    (D u2).im.im.im = 0 ∧
    (D u4).im.re.im = 0 ∧ (D u4).im.im.re = 0 ∧ (D u4).im.im.im = 0 := by
  have h := fun i => congrFun hker i
  refine ⟨?_,?_,?_,?_,?_,?_,?_,?_,?_,?_,?_,?_,?_,?_⟩
  · simpa using h 0
  · simpa using h 1
  · simpa using h 2
  · simpa using h 3
  · simpa using h 4
  · simpa using h 5
  · simpa using h 6
  · simpa using h 7
  · simpa using h 8
  · simpa using h 9
  · simpa using h 10
  · simpa using h 11
  · simpa using h 12
  · simpa using h 13

end Phys.Algebra.ScratchN20inj
