import Phys.Algebra.OctonionJordanGenerationCharges
open Phys.Algebra Phys.Cascade Phys.Cascade.CD Matrix
attribute [local instance] CD.narCD CD.srCD
example : (u1 : O ℚ).re.re.im = 1 := by simp [u1]
example : ((2:ℚ) • (u1 : O ℚ)).re.re.im = 2 := by
  simp [u1, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im]
