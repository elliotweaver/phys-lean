import Phys.Algebra.TowerGatherPhysicalState
import Phys.Algebra.TowerWorldMapIndivisible
import Phys.Algebra.DerivationRep7

namespace Phys.R1Probe
open Phys.Algebra Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-- A STANDPOINT: a LIVE (nonzero) globally-gluing state together with the view it opens. -/
structure Standpoint where
  loc : O ℚ
  live : loc ≠ 0
  glues : GluesGlobally loc

/-- (c-strict) LOCALITY / STRICT COMPOSITION: from a standpoint's own locus, world composition
    is strict against every other world — the homomorphism property held locally at the glued state. -/
theorem standpoint_strict (s : Standpoint) (b : O ℚ) :
    worldMap s.loc ∘ worldMap b = worldMap (s.loc * b) := s.glues b

/-- (c-faithful) the standpoint's view is FAITHFUL (injective): no two probes collapse. -/
theorem standpoint_faithful (s : Standpoint) : Function.Injective (worldMap s.loc) := by
  have h := worldMap_injective s.live
  intro x y hxy
  exact h (by simpa [worldMap, LeftMul_apply] using hxy)

/-- (a) the trivial standpoint exists (1 is live and glues globally). -/
def trivialStandpoint : Standpoint :=
  ⟨1, one_ne_zero_O, one_gluesGlobally⟩

example : (trivialStandpoint).loc = 1 := rfl

/-- (b) no TOTAL standpoint: not every state glues globally — the totality does not close. -/
example : ¬ ∀ a : O ℚ, GluesGlobally a := o_not_all_physical

-- capstone shape
theorem standpoint_stratum :
    (∃ s : Standpoint, s.loc = 1) ∧
    (¬ ∀ a : O ℚ, GluesGlobally a) ∧
    (∀ s : Standpoint, Function.Injective (worldMap s.loc)) ∧
    (∀ s : Standpoint, ∀ b : O ℚ,
        worldMap s.loc ∘ worldMap b = worldMap (s.loc * b)) :=
  ⟨⟨trivialStandpoint, rfl⟩, o_not_all_physical,
   fun s => standpoint_faithful s, fun s b => standpoint_strict s b⟩

end Phys.R1Probe
