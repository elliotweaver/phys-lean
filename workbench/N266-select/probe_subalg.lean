import Phys.Algebra.TowerGatherUniqueColourFixedAxis
import Phys.Algebra.DerivationUpperBound
import Phys.Algebra.DerivationStabilizer
import Phys.Algebra.OctonionCrossProductContraction
import Phys.Algebra.DerivationFinrank

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

theorem span_one_u1_mul_mem {x y : O ℚ}
    (hx : x ∈ Submodule.span ℚ {(1:O ℚ), u1}) (hy : y ∈ Submodule.span ℚ {(1:O ℚ), u1}) :
    x * y ∈ Submodule.span ℚ {(1:O ℚ), u1} := by
  rw [Submodule.mem_span_pair] at hx hy
  obtain ⟨a, b, hxab⟩ := hx
  obtain ⟨c, d, hycd⟩ := hy
  rw [← hxab, ← hycd, Submodule.mem_span_pair]
  refine ⟨a*c - b*d, a*d + b*c, ?_⟩
  have h1 : (u1:O ℚ) * u1 = -1 := complexUnit_sq
  have e1 : (a • (1:O ℚ)) * (c • (1:O ℚ)) = (a*c) • (1:O ℚ) := by
    rw [qsmul_mul_left, qsmul_mul_right, mul_one, smul_smul]
  have e2 : (a • (1:O ℚ)) * (d • u1) = (a*d) • u1 := by
    rw [qsmul_mul_left, qsmul_mul_right, one_mul, smul_smul]
  have e3 : (b • u1) * (c • (1:O ℚ)) = (b*c) • u1 := by
    rw [qsmul_mul_left, qsmul_mul_right, mul_one, smul_smul]
  have e4 : (b • u1) * (d • u1) = (b*d) • (-1 : O ℚ) := by
    rw [qsmul_mul_left, qsmul_mul_right, h1, smul_smul]
  rw [add_mul, mul_add, mul_add, e1, e2, e3, e4]
  module

#print axioms span_one_u1_mul_mem

end Phys.Algebra
