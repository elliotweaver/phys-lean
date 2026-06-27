import Phys.Algebra.LorentzContinuumSpin9Product
namespace Counterexamples
open Phys.Cascade Phys.Algebra Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
noncomputable section
-- check (1:O Cut).re.re.re
example : (1 : O Cut).re.re.re = 1 := by simp
-- and via the fixed image
example : (biMulFun (je2 : O Cut) (je2 : O Cut)
      (biMulFun (CD.e2 : O Cut) (CD.e2 : O Cut) ((0:Cut),(0:Cut),(1:O Cut)))).2.2.re.re.re = 1 := by
  rw [biMulComp_e2_je2_fixes_one]
  simp
end
end Counterexamples
