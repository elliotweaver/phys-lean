import Phys.Algebra.LorentzContinuumCliffordSpinCover

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- The even product ι a · ι b is a unit (Spin element membership at the two-generator level).
theorem even_isUnit_PROBE {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0) :
    IsUnit (CliffordAlgebra.ι QvCQuad a * CliffordAlgebra.ι QvCQuad b) :=
  (cliff_unit_isUnit ha).mul (cliff_unit_isUnit hb)

-- The single-generator cover lands in the vector module: conjugation by the unit ι a sends ι v
-- back into range ι (the defining property of the cover). Read off reflection_clifford_conj.
theorem conj_mem_range_PROBE {a : STVC} (ha : BvC a a ≠ 0) (v : STVC) :
    CliffordAlgebra.ι QvCQuad a * CliffordAlgebra.ι QvCQuad v * CliffordAlgebra.ι QvCQuad a
      ∈ LinearMap.range (CliffordAlgebra.ι QvCQuad) := by
  refine ⟨-(QvC a) • houseHolderM a v, ?_⟩
  rw [map_smul, reflection_clifford_conj ha v, smul_smul]
  have hq : QvC a ≠ 0 := by rw [← BvC_self a]; exact ha
  rw [show (-(QvC a) * -(QvC a)⁻¹) = (1 : Cut) by field_simp, one_smul]

end

end Phys.Algebra
