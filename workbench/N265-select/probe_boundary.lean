import Phys.Algebra.LorentzIsometry
import Phys.Algebra.DerivationAutGroup
import Phys.Algebra.TowerWorldMapCliffordModule
import Phys.Cascade.Sedenion

open scoped Classical
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

noncomputable section
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- (from probe_nozerodiv, re-stated)
theorem probe_nzd {x y : O ℚ} (hxy : x * y = 0) (hx : x ≠ 0) : y = 0 := by
  have hcomp := gForm_comp x y
  rw [hxy] at hcomp
  rw [(gForm_self_eq_zero).mpr rfl] at hcomp
  have hxx : gForm x x ≠ 0 := fun h => hx (gForm_self_eq_zero.mp h)
  exact gForm_self_eq_zero.mp ((mul_eq_zero.mp hcomp.symm).resolve_left hxx)

theorem probe_mul_ne_zero {x y : O ℚ} (hx : x ≠ 0) (hy : y ≠ 0) : x * y ≠ 0 :=
  fun h => hy (probe_nzd h hx)

-- THE ONE-CAUSE BOUNDARY (mirrors forced_stop_boundary, for the DIVISION property):
-- no zero divisors at O, zero divisors at S.
theorem probe_division_boundary :
    (∀ x y : O ℚ, x ≠ 0 → y ≠ 0 → x * y ≠ 0) ∧
    (∃ x y : S ℚ, x ≠ 0 ∧ y ≠ 0 ∧ x * y = 0) :=
  ⟨fun _ _ hx hy => probe_mul_ne_zero hx hy, Phys.Cascade.has_zero_divisor⟩

-- W8 non-vacuity: leftReg is not the zero map (leftReg u1 ≠ 0, since it maps 1 ↦ u1 ≠ 0)
theorem probe_leftReg_nonvacuous : leftReg ⟨u1, u1_mem_ImO⟩ ≠ 0 := by
  intro h
  have : leftReg ⟨u1, u1_mem_ImO⟩ (1 : O ℚ) = 0 := by rw [h]; rfl
  simp only [leftReg, LeftMul, LinearMap.coe_mk, AddHom.coe_mk, mul_one] at this
  exact u1_ne_zero this

#print axioms probe_division_boundary
#print axioms probe_leftReg_nonvacuous

end
end Phys.Algebra
