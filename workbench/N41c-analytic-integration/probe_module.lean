import Phys.Cascade.OctonionTopology
open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ
noncomputable section
attribute [local instance] CD.narCD CD.srCD
-- Is O Cut a NonUnitalNonAssocSemiring (for the Cauchy product)?
example : NonUnitalNonAssocSemiring (O Cut) := inferInstance
-- Build Module Cut (Dbl Cut): the Dbl smul is r•z = ⟨r*z.re, r*z.im⟩
def dblModuleCut : Module Cut (Dbl Cut) where
  one_smul z := by ext <;> simp [Dbl.smul_re]
  mul_smul a b z := by ext <;> simp [Dbl.smul_re] <;> ring
  smul_zero a := by ext <;> simp [Dbl.smul_re]
  smul_add a x y := by ext <;> simp [Dbl.smul_re] <;> ring
  add_smul a b z := by ext <;> simp [Dbl.smul_re] <;> ring
  zero_smul z := by ext <;> simp [Dbl.smul_re]
end
