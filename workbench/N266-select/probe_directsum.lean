import Phys.Algebra.TowerGatherUniqueColourFixedAxis
import Phys.Algebra.DerivationUpperBound
import Phys.Algebra.DerivationStabilizer
import Phys.Algebra.OctonionCrossProductContraction
import Phys.Algebra.DerivationStabilizerSplit

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- finrank O ℚ = 8 ?
example : Module.finrank ℚ (O ℚ) = 8 := by
  sorry

-- matterColourNeutral = span{1,u1} disjoint from Vsub, sup = ⊤ (dim 2 + 6 = 8)
-- span{1,u1} ⊓ Vsub = ⊥ : Vsub ≤ ImO, 1 ∉ ImO ; and span{u1} ⊓ Vsub = singlet ⊓ Vsub = ⊥
theorem neutral_disj_Vsub : Disjoint (Submodule.span ℚ {(1:O ℚ), u1}) Vsub := by
  rw [Submodule.disjoint_def]
  intro x hx hxV
  -- x ∈ span{1,u1}: x = s•1 + t•u1
  rw [Submodule.mem_span_pair] at hx
  obtain ⟨s, t, hst⟩ := hx
  -- x ∈ Vsub ≤ ImO → reQ x = 0 → s = 0 ; and then t•u1 ∈ Vsub, but singlet ⊓ Vsub = ⊥
  have hxIm : x ∈ ImO := (Vsub_le_ImO) hxV
  have hrx : reQ x = 0 := reQ_ImO_zero hxIm
  rw [← hst, reQ_add, reQ_smul, reQ_smul, reQ_one, reQ_ImO_zero u1_mem_ImO,
    mul_zero, add_zero, mul_one] at hrx
  -- hrx : s = 0
  rw [hrx, zero_smul, zero_add] at hst
  -- x = t • u1, and x ∈ Vsub ; u1's span = singlet, singlet ⊓ Vsub = ⊥
  have hxsgl : x ∈ singlet := by rw [singlet, Submodule.mem_span_singleton]; exact ⟨t, hst⟩
  have := singlet_disj_Vsub.le_bot ⟨hxsgl, hxV⟩
  simpa using this

#print axioms neutral_disj_Vsub

end Phys.Algebra
