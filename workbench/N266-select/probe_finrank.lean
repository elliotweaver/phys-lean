import Phys.Algebra.TowerGatherUniqueColourFixedAxis
import Phys.Algebra.DerivationUpperBound
import Phys.Algebra.DerivationStabilizer
import Phys.Algebra.OctonionCrossProductContraction

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

theorem one_u1_linIndep : LinearIndependent ℚ ![(1 : O ℚ), u1] := by
  rw [LinearIndependent.pair_iff]
  intro s t hst
  have hru1 : reQ u1 = 0 := reQ_ImO_zero u1_mem_ImO
  have h := congrArg reQ hst
  rw [reQ_add, reQ_smul, reQ_smul, reQ_one, hru1, mul_zero, add_zero, mul_one] at h
  simp only [reQ] at h
  have hs : s = 0 := by simpa using h
  refine ⟨hs, ?_⟩
  rw [hs, zero_smul, zero_add] at hst
  rcases eq_or_ne t 0 with ht | ht
  · exact ht
  · exact absurd ((smul_eq_zero.mp hst).resolve_left ht) u1_ne_zero

theorem finrank_span_one_u1 :
    Module.finrank ℚ (Submodule.span ℚ {(1 : O ℚ), u1}) = 2 := by
  have h2 : Submodule.span ℚ {(1 : O ℚ), u1} = Submodule.span ℚ (Set.range ![(1 : O ℚ), u1]) := by
    congr 1
    rw [Matrix.range_cons_cons_empty]
  rw [h2, finrank_span_eq_card one_u1_linIndep, Fintype.card_fin]

#print axioms finrank_span_one_u1
end Phys.Algebra
