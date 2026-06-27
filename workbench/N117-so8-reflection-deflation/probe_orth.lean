import Phys.Algebra.LorentzContinuumGenerationExhaustionAssembly

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut
noncomputable section

example : gFormC (CD.e2 : O Cut) (je2 : O Cut) = 0 := by
  show reQC ((CD.e2 : O Cut) * star (je2 : O Cut)) = 0
  rw [je2_imag, mul_neg (CD.e2 : O Cut) (je2 : O Cut), reQC_neg]
  show -((CD.e2 : O Cut) * (je2 : O Cut)).re.re.re = 0
  simp [CD.e2, CD.iota]

end
end Phys.Algebra
