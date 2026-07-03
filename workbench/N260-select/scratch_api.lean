import Phys.Algebra.TowerGatherSharedIsospinCartan
import Phys.Algebra.TowerGatherIsometry

open scoped BigOperators
open LieSubalgebra

namespace Phys
namespace TowerGatherGenerateSo7Scratch

/-! Scratch: de-risk the lieSpan API + the so7 bridge + the ⊇ engine mechanics. -/

-- so7 as a LieSubalgebra; its toSubmodule is the banked skewAdjointSubmodule.
noncomputable abbrev so7L : LieSubalgebra ℚ (Module.End ℚ ImO) := skewAdjointLieSubalgebra bornBil

example : (so7L).toSubmodule = (bornBil).skewAdjointSubmodule := rfl

-- L := lieSpan of the fundamental-7 tear
noncomputable abbrev L : LieSubalgebra ℚ (Module.End ℚ ImO) :=
  LieSubalgebra.lieSpan ℚ (Module.End ℚ ImO) (↑(LinearMap.range crossEmb))

-- (1) L ≤ so7:  range crossEmb ⊆ so7 (as a set), then lieSpan_le.
example : L ≤ so7L := by
  apply LieSubalgebra.lieSpan_le.mpr
  intro x hx
  -- hx : x ∈ ↑(LinearMap.range crossEmb)
  have hx' : x ∈ LinearMap.range crossEmb := hx
  -- goal x ∈ so7L, i.e. x ∈ (bornBil).skewAdjointSubmodule
  exact crossEmb_range_le_so7' hx'

-- generators ⊆ L
example : (LinearMap.range crossEmb : Submodule ℚ (Module.End ℚ ImO)) ≤ L.toSubmodule := by
  intro x hx
  exact LieSubalgebra.subset_lieSpan (hx : x ∈ (↑(LinearMap.range crossEmb) : Set _))

-- so7 ≤ L would follow from range imRepL ≤ L ∧ range crossEmb ≤ L via sup_eq_so7.
-- Check sup_eq_so7 shape:
#check @sup_eq_so7
#check @finrank_so7_eq_21
#check @imRepL_range_no_proper_invariant
#check @proj14_equivariant
#check @proj7_add_proj14
#check @proj14_apply_mem
#check @proj7_apply_mem
#check @crossOp_imRep_intertwine
#check @Submodule.eq_of_le_of_finrank_le

end TowerGatherGenerateSo7Scratch
end Phys
