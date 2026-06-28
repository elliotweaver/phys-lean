import Phys.Algebra.LorentzContinuumGenerationSO8ReflectionDeflation

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- PROBE: imaginary of normalized bisector. We need star n = -n where n = c • (e-w), c scalar,
-- and e-w is imaginary. Try the smulCompat / coordinate route.
example (c : Cut) (y : O Cut) (hy : star y = -y) : star (c • y) = -(c • y) := by
  rw [show star (c • y) = c • star y from ?_, hy, smul_neg]
  · rfl
  · -- star (c • y) = c • star y
    sorry

-- PROBE: what IS star on a Cut-smul? Try simp lemmas
example (c : Cut) (y : O Cut) : star (c • y) = c • star y := by
  simp only [smul_eq_mul]
  sorry

end
end Phys.Algebra
