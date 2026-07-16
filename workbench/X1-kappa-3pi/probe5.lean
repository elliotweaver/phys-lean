import Phys.Algebra.FineStructureLoopNormalization
namespace Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ
noncomputable section
-- test the exact goal after rw[kappaLeading_eq]
example : (1 : Cut) / (3 * cutPi) ≠ 1 / cutPi := by
  have hpi := cutPi_pos
  have hne : cutPi ≠ 0 := ne_of_gt hpi
  intro h
  rw [div_eq_div_iff (by positivity) hpi] at h
  nlinarith [hpi]
end
end Phys.Algebra
