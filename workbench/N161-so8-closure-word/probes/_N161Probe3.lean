import Phys.Algebra.LorentzContinuumOctBlockSO8Exhaustion

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- probe: normalize a nonzero-norm vector to a unit vector with the SAME houseHolder
theorem houseHolder_smul_probe (a : O Cut) (t : Cut) (ht : t ≠ 0) :
    houseHolder (t • a) = houseHolder a := by
  apply LinearMap.ext; intro v
  rw [houseHolder_apply, houseHolder_apply, gFormC_smul_left, gFormC_smul_right,
      gFormC_smul_left, mul_inv, smul_smul]
  congr 1; field_simp

-- ★ the unit normalizer: for nonzero-norm a, the rescaled vector is unit and shares houseHolder
theorem normalize_unit_probe (a : O Cut) (ha : gFormC a a ≠ 0) :
    ∃ u : O Cut, gFormC u u = 1 ∧ houseHolder u = houseHolder a := by
  have hpos : 0 < gFormC a a := lt_of_le_of_ne (gFormC_nonneg a) (Ne.symm ha)
  set n : Cut := cutSqrt (gFormC a a) with hn
  have hnpos : 0 < n := cutSqrt_pos hpos
  have hnne : n ≠ 0 := ne_of_gt hnpos
  have hnn : n * n = gFormC a a := cutSqrt_sq (le_of_lt hpos)
  refine ⟨n⁻¹ • a, ?_, ?_⟩
  · rw [gFormC_smul_left, gFormC_smul_right]
    field_simp
    nlinarith [hnn]
  · exact houseHolder_smul_probe a n⁻¹ (inv_ne_zero hnne)

end
end Phys.Algebra
