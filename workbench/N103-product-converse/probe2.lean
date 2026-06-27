import Phys.Algebra.LorentzContinuumGenerationConverseCompact

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- imports the proven core from probe1; here we just test the W8 teeth reading.
-- The compact part = genTwoPlaneLin itself, which is endToFunEnd-bridged to the N95 composite
-- biMulFun w w (biMulFun u u p). At (0,0,1) the e₂,ιe₂ product FIXES the real axis
-- (genTwoPlaneLin_e2je2_fixes_one), so the compact part reads re.re.re = 1.

-- The compact part applied (as a Module.End) at (0,0,1): need the *linear* operator's value.
-- genTwoPlaneLin u w (0,0,1) = biMulLin w w (biMulLin u u (0,0,1)).
-- We test directly: ((genTwoPlaneLin e2 je2) (0,0,1)).2.2.re.re.re = 1.
theorem probe_teeth :
    (((genTwoPlaneLin (CD.e2 : O Cut) (je2 : O Cut)) ((0 : Cut), (0 : Cut), (1 : O Cut))).2.2).re.re.re
      = (1 : Cut) := by
  have h : (endToFunEnd (genTwoPlaneLin (CD.e2 : O Cut) (je2 : O Cut)))
        ((0 : Cut), (0 : Cut), (1 : O Cut))
      = ((0 : Cut), (0 : Cut), (1 : O Cut)) := genTwoPlaneLin_e2je2_fixes_one
  rw [endToFunEnd_apply] at h
  rw [h]
  rfl

end

end Phys.Algebra
