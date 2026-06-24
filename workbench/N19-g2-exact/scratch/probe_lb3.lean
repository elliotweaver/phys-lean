import Phys.Algebra.DerivationFinrank
import Mathlib.Tactic

/-! W9.2 PROBE (run 121): measure the LOWER-BOUND architecture on 3 derivations
    {D0, D1, D13} before committing to all 14.
    - LinearMap construction cost (toFun + map_add' + map_smul')
    - IsDerivQ cost (expect ~8s from run-120 s5 probe)
    - the DIAGONAL-FUNCTIONAL independence idiom (the unmeasured risk) -/

namespace Phys.Algebra.ProbeLB
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- coordinate accessors (model.py layout, index = oct_im*4 + h_im*2 + dbl_im)
def c2 (z : O ℚ) : ℚ := z.re.im.re
def c3 (z : O ℚ) : ℚ := z.re.im.im
def c4 (z : O ℚ) : ℚ := z.im.re.re
def c5 (z : O ℚ) : ℚ := z.im.re.im
def c6 (z : O ℚ) : ℚ := z.im.im.re
def c7 (z : O ℚ) : ℚ := z.im.im.im

set_option maxHeartbeats 200000

-- D0: out2=-c5, out3=c4, out4=-c3, out5=c2
def D0E : Module.End ℚ (O ℚ) where
  toFun z := ⟨⟨⟨0, 0⟩, ⟨-c5 z, c4 z⟩⟩, ⟨⟨-c3 z, c2 z⟩, ⟨0, 0⟩⟩⟩
  map_add' a b := by
    ext <;> simp [c2, c3, c4, c5, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im] <;> ring
  map_smul' q z := by
    ext <;> simp [c2, c3, c4, c5, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

-- D1: out2=-c4, out3=-c5, out4=c2, out5=c3
def D1E : Module.End ℚ (O ℚ) where
  toFun z := ⟨⟨⟨0, 0⟩, ⟨-c4 z, -c5 z⟩⟩, ⟨⟨c2 z, c3 z⟩, ⟨0, 0⟩⟩⟩
  map_add' a b := by
    ext <;> simp [c2, c3, c4, c5, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im] <;> ring
  map_smul' q z := by
    ext <;> simp [c2, c3, c4, c5, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

-- D13: out2=-c3, out3=c2, out6=-c7, out7=c6
def D13E : Module.End ℚ (O ℚ) where
  toFun z := ⟨⟨⟨0, 0⟩, ⟨-c3 z, c2 z⟩⟩, ⟨⟨0, 0⟩, ⟨-c7 z, c6 z⟩⟩⟩
  map_add' a b := by
    ext <;> simp [c2, c3, c6, c7, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im] <;> ring
  map_smul' q z := by
    ext <;> simp [c2, c3, c6, c7, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

-- IsDerivQ cost measurement (one of them)
theorem D13E_isDerivQ : IsDerivQ D13E := by
  intro x y
  ext <;>
    simp [D13E, c2, c3, c6, c7, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,
      Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im] <;> ring

-- basis elements e5 (im.re.im=1), e7 (im.im.im=1)
def e5elt : O ℚ := ⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨0, 1⟩, ⟨0, 0⟩⟩⟩
def e7elt : O ℚ := ⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨0, 0⟩, ⟨0, 1⟩⟩⟩

-- THE DIAGONAL-FUNCTIONAL INDEPENDENCE (the unmeasured risk)
example : LinearIndependent ℚ ![D0E, D1E, D13E] := by
  rw [Fintype.linearIndependent_iff]
  intro g hg
  rw [Fin.sum_univ_three] at hg
  simp only [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
    Matrix.cons_val_two, Matrix.tail_cons] at hg
  -- g 0 via (· e5).re.im.re
  have h0 := congrArg (fun z => z.re.im.re) (LinearMap.congr_fun hg e5elt)
  -- g 1 via (· e5).re.im.im
  have h1 := congrArg (fun z => z.re.im.im) (LinearMap.congr_fun hg e5elt)
  -- g 2 via (· e7).im.im.re
  have h2 := congrArg (fun z => z.im.im.re) (LinearMap.congr_fun hg e7elt)
  simp only [LinearMap.add_apply, LinearMap.smul_apply, LinearMap.zero_apply,
    D0E, D1E, D13E, e5elt, e7elt, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk,
    AddHom.coe_mk, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
    cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] at h0 h1 h2
  intro i
  fin_cases i
  · simpa using h0
  · simpa using h1
  · simpa using h2

end Phys.Algebra.ProbeLB
