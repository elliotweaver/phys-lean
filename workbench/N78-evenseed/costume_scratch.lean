import Phys.Algebra.LorentzContinuumEvenSeed

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

def v0 : STVC := ((1:Cut), (0:Cut), (0:O Cut))

-- TRUE value check: with g=1 (EvC-self-adjoint), b=3, c=5 (disc 9<20, negative), v0=(1,0,0):
-- EvC ((1*1 + 3•1 + 5•1) v0) v0 = 1 + 3 + 5 = 9.
example :
    EvC (((1:Module.End Cut STVC)*1 + (3:Cut)•(1:Module.End Cut STVC)
          + (5:Cut)•(1:Module.End Cut STVC)) v0) v0 = (9:Cut) := by
  rw [selfadj_negDisc_quad_apply_form (g := (1:Module.End Cut STVC))
        (by intro p q; simp [Module.End.one_apply]) 3 5 v0]
  simp only [Module.End.one_apply]
  rw [show EvC v0 v0 = (1:Cut) from by
        show (1:Cut)*1 + (0:Cut)*0 + gFormC (0:O Cut) 0 = 1
        rw [gFormC_zero_left]; ring]
  norm_num

end

end Counterexamples
