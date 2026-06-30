import Phys.Algebra.DerivationColourIsospinMeet
import Phys.Algebra.DerivationHIntoO
import Mathlib.Algebra.Lie.Normalizer
import Mathlib.Tactic

open Phys.Cascade

namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- 1. DI ∈ colour
theorem DI_mem_colour : DI ∈ colourCentralizer := by
  rw [mem_colourCentralizer]
  exact (commutes_JO_iff (isDerivQ_of_mem DI)).mpr DI_u1

-- helper: hJ ≠ 0  (from four_hJ_ne_zero)
theorem hJ_ne_zero' : hJ ≠ (0 : H ℚ) := by
  intro h
  apply four_hJ_ne_zero
  rw [h, smul_zero]

-- 2. DK ∉ colour  (DK_u1 = ιO(2•hJ) ≠ 0)
theorem DK_not_mem_colour : DK ∉ colourCentralizer := by
  rw [mem_colourCentralizer]
  intro h
  have hu1 : (DK : Module.End ℚ (O ℚ)) u1 = 0 := (commutes_JO_iff (isDerivQ_of_mem DK)).mp h
  rw [DK_u1] at hu1
  have h2 : ((2:ℚ) • hJ) = 0 :=
    iotaO_injective (a₁ := (2:ℚ)•hJ) (a₂ := 0) (by rw [hu1]; ext <;> simp [iotaO])
  have hJ0 : hJ = (0 : H ℚ) := by
    have h2' : (2:ℚ) ≠ 0 := by norm_num
    exact (smul_eq_zero.mp h2).resolve_left h2'
  exact hJ_ne_zero' hJ0

end Phys.Algebra
