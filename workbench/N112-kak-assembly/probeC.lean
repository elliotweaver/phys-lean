import Phys.Algebra.LorentzContinuumGenerationNinthRotationCircle
import Phys.Algebra.LorentzContinuumGenerationSO8RankInduction

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- clean coordinate apply for biMulLin (avoid defeq blowup)
theorem biMulLin_apply' (u u' : O Cut) (t x : Cut) (v : O Cut) :
    biMulLin u u' (t, x, v) = (t, x, u * (v * u')) := rfl

-- genTwoPlaneLin direct (non-bridge) coordinate apply
theorem genTwoPlaneLin_apply' (u w : O Cut) (t x : Cut) (v : O Cut) :
    genTwoPlaneLin u w (t, x, v) = (t, x, w * ((u * (v * u)) * w)) := by
  rw [genTwoPlaneLin, Module.End.mul_apply, biMulLin_apply', biMulLin_apply']

-- the v-block fixes 1 (imaginary Born units): w·((u·(1·u))·w) = 1
theorem genTwoPlaneLin_fixes_realaxis (u w : O Cut) (hu : u * u = -1) (hw : w * w = -1) :
    genTwoPlaneLin u w (0, 0, (1 : O Cut)) = (0, 0, (1 : O Cut)) := by
  rw [genTwoPlaneLin_apply']
  refine Prod.ext rfl (Prod.ext rfl ?_)
  rw [one_mul, hu, neg_one_mul, mul_neg, hw]
  norm_num

end

end Phys.Algebra
