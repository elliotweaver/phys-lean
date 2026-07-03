import Phys.Algebra.TowerGatherIsospinMultiplet
import Phys.Algebra.TowerGatherUniqueIsospinFixedAxis
import Mathlib.Tactic
open Phys.Cascade Phys.Cascade.CD
namespace Phys.Algebra
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section
-- kappaO 1 coordinate: kappaO_one_coord says (κO 1).im.re.re = 1, i.e. c4 = 1.
-- e4O = ⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨1,0⟩,⟨0,0⟩⟩⟩ so e4O.im.re.re = 1. Are they equal as O ℚ?
example : (kappaO (1 : H ℚ) : O ℚ) = e4O := by
  apply CD.ext <;> simp [kappaO, e4O]
-- fallback: try unfolding kappaO fully
example : (kappaO (1 : H ℚ) : O ℚ) = e4O := by
  show (⟨(0:H ℚ), 1⟩ : O ℚ) = e4O
  rfl
end
end Phys.Algebra
