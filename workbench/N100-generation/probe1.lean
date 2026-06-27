import Phys.Algebra.LorentzContinuumEndBridge
import Phys.Algebra.LorentzContinuumSpin9Product

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

def genTwoPlaneLin (u w : O Cut) : Module.End Cut STVC := biMulLin w w * biMulLin u u

theorem probe_apply (u w : O Cut) (p : STVC) :
    (endToFunEnd (genTwoPlaneLin u w)) p = biMulFun w w (biMulFun u u p) := rfl

theorem probe_real_coord :
    ((endToFunEnd (genTwoPlaneLin (CD.e2 : O Cut) (je2 : O Cut))
        ((0 : Cut), (0 : Cut), (1 : O Cut))).2.2).re.re.re = (1 : Cut) := by
  rw [probe_apply, biMulComp_e2_je2_fixes_one]; rfl

end

end Phys.Algebra
