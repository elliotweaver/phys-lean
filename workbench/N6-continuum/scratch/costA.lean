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
theorem le_def {x y : Cut} : x ≤ y ↔ ∀ q, x.S q → y.S q := Iff.rfl
end Cut

def sqrtTwoGather' := sqrtTwoGather
def sqrt2 : Cut := ⟨sqrtTwoGather, sqrtTwoGather_isGather⟩
def Qcut (a : ℚ) : Cut :=
  ⟨fun q => q < a,
    { ne := ⟨a - 1, by linarith⟩
      proper := ⟨a, lt_irrefl a⟩
      down := fun hq hpq => lt_of_le_of_lt hpq hq
      nomax := fun q hq => ⟨(q + a) / 2, by linarith, by linarith⟩ }⟩

-- CANDIDATE A: sqrt2.S (3/2)  (3/2 ∈ √2's cut ⟺ (3/2)²<2, false)
theorem candA : sqrt2.S (3/2) := by
  show sqrtTwoGather (3/2)
  show (3/2:ℚ) ≤ 0 ∨ (3/2)^2 < 2
  norm_num

end Phys.Foundation
