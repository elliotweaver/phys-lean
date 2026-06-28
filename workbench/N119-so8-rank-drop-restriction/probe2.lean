import Phys.Algebra.LorentzContinuumGenerationSO8ReflectionInvolution

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- the block-level fix: vTwoPlane e₂ je2 FIXES ke2je2
theorem vTwoPlane_e2je2_fixes_ke2je2 :
    vTwoPlane (CD.e2 : O Cut) (je2 : O Cut) (ke2je2 : O Cut) = (ke2je2 : O Cut) := by
  have h := block1_fixes_ke2je2
  have h2 : (biMulFun (je2 : O Cut) (je2 : O Cut)
      (biMulFun (CD.e2 : O Cut) (CD.e2 : O Cut) ((0 : Cut), (0 : Cut), (ke2je2 : O Cut)))).2.2
      = (ke2je2 : O Cut) := by rw [h]
  -- relate biMulFun composite .2.2 to vTwoPlane
  rw [vTwoPlane_apply]
  simpa [biMulFun, biMulV_apply] using h2

end

end Phys.Algebra
