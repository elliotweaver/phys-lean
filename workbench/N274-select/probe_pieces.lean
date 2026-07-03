import Phys.Algebra.OctonionJordanFamilySymmetry
import Phys.Algebra.OctonionJordanWeightDiagram
import Phys.Algebra.OctonionJordanGenerationCoupling
import Phys.Algebra.DerivationFinrank
import Phys.Algebra.HermitianJordan.PieceBfinal
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

-- What does (z - w).re unfold to? probe
example (z w : O ℚ) : (z - w).re = z.re - w.re := by
  rw [sub_eq_add_neg]; simp

-- final numeric identity closer, all-out componentwise
theorem numclose_c (v : O ℚ) (d0 d1 d2 : ℚ) :
    (d0 + d2) • v - (d0 + d1) • v = (d2 - d1) • v := by
  have h : ∀ (z w : O ℚ), z - w = z + (-1 : ℚ) • w := by
    intro z w
    rw [sub_eq_add_neg]; congr 1
    ext <;> simp [cd_qsmul_re, cd_qsmul_im]
  rw [h]
  ext <;> simp [cd_qsmul_re, cd_qsmul_im, add_re, add_im] <;> ring

end Phys.Algebra.HJ
