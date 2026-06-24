import Phys.Foundation.Continuum
import Mathlib.Tactic

namespace Phys.Foundation

structure Cut where
  S : ℚ → Prop
  isG : IsGather S

namespace Cut
theorem ext' {x y : Cut} (h : ∀ q, x.S q ↔ y.S q) : x = y := by
  obtain ⟨xS, xG⟩ := x; obtain ⟨yS, yG⟩ := y
  have hS : xS = yS := funext fun q => propext (h q)
  subst hS; rfl
def le (x y : Cut) : Prop := ∀ q, x.S q → y.S q
instance : LE Cut := ⟨le⟩
instance : LT Cut := ⟨fun x y => x ≤ y ∧ ¬ y ≤ x⟩
end Cut

def sqrt2 : Cut := ⟨sqrtTwoGather, sqrtTwoGather_isGather⟩

-- COSTUME CANDIDATE B: the completion still has the √2 hole (negation of completeness
-- at the canonical gap). Bogus claim someone smuggling ℝ might assert.
theorem candB : sqrt2.S (3/2) := by
  show sqrtTwoGather (3/2)
  unfold sqrtTwoGather
  norm_num

end Phys.Foundation
