import Phys.Algebra.LorentzIsometry
import Phys.Algebra.DerivationAutGroup
import Phys.Cascade.Sedenion

open scoped Classical
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

noncomputable section
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/- PROBE α: the no-zero-divisor CORE of O ℚ, read off the banked composition law. -/

theorem probe_no_zero_divisors {x y : O ℚ} (hxy : x * y = 0) (hx : x ≠ 0) : y = 0 := by
  have hcomp := gForm_comp x y            -- gForm (x*y)(x*y) = gForm x x * gForm y y
  rw [hxy] at hcomp
  have hz : gForm (0 : O ℚ) 0 = 0 := (gForm_self_eq_zero).mpr rfl
  rw [hz] at hcomp                        -- 0 = gForm x x * gForm y y
  have hxx : gForm x x ≠ 0 := fun h => hx (gForm_self_eq_zero.mp h)
  have hyy : gForm y y = 0 := by
    rcases mul_eq_zero.mp hcomp.symm with h | h
    · exact absurd h hxx
    · exact h
  exact gForm_self_eq_zero.mp hyy

theorem probe_mul_ne_zero {x y : O ℚ} (hx : x ≠ 0) (hy : y ≠ 0) : x * y ≠ 0 := by
  intro h
  exact hy (probe_no_zero_divisors h hx)

#print axioms probe_no_zero_divisors
#print axioms probe_mul_ne_zero

end
end Phys.Algebra
