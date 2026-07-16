import Phys.Algebra.TowerGatherPhysicalState
import Phys.Algebra.TowerWorldMapIndivisible
import Phys.Algebra.DerivationRep7
import Phys.Algebra.TowerGatherCoherence

namespace Phys.R1Probe2
open Phys.Algebra Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

-- The non-gluing witness from o_worlds_not_glue is CD.iota (ιJ ℚ).
-- Is it nonzero?  Try several routes.
#check @CD.iota
#check @o_worlds_not_glue

-- route 1: CD.iota injective?
example : True := by
  trivial

-- probe nonzero-ness of the first component of o_worlds_not_glue witness
example : ∃ a b : O ℚ, ¬ WorldsGlue a b := o_worlds_not_glue

-- Can we get a LIVE non-gluing state?  Need a ≠ 0 with ¬ GluesGlobally a.
-- worldMap_injective needs a ≠ 0.  o_worlds_not_glue gives a with ¬WorldsGlue a b hence ¬GluesGlobally a.
-- If that a were 0 then worldMap 0 = 0-map, WorldsGlue 0 b would... let's check: 0 glues?  0*x=0.
-- Actually a=0: worldMap 0 ∘ worldMap b = 0, worldMap (0*b)=worldMap 0 = 0.  So 0 DOES glue.
-- Hence the non-gluing witness must be nonzero.  Prove it by contradiction.

theorem nonglue_is_live : ∃ a : O ℚ, a ≠ 0 ∧ ¬ GluesGlobally a := by
  obtain ⟨a, b, hab⟩ := o_worlds_not_glue
  refine ⟨a, ?_, ?_⟩
  · rintro rfl
    -- a = 0 glues with everything, contradicting ¬WorldsGlue 0 b
    apply hab
    -- WorldsGlue 0 b : worldMap 0 ∘ worldMap b = worldMap (0 * b)
    show worldMap (0 : O ℚ) ∘ worldMap b = worldMap ((0 : O ℚ) * b)
    funext x
    simp only [worldMap, Function.comp_apply, zero_mul]
  · intro hg
    exact hab (hg b)

-- and it is FAITHFUL (worldMap injective) because it is live:
theorem nonglue_live_faithful : ∃ a : O ℚ, a ≠ 0 ∧ Function.Injective (worldMap a) ∧ ¬ GluesGlobally a := by
  obtain ⟨a, hlive, hng⟩ := nonglue_is_live
  refine ⟨a, hlive, ?_, hng⟩
  have h := worldMap_injective hlive
  intro x y hxy
  exact h (by simpa [worldMap, LeftMul_apply] using hxy)

end Phys.R1Probe2
