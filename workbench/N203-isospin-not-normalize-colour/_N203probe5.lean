import Phys.Algebra.DerivationColourIsospinMeet
import Phys.Algebra.DerivationHIntoO
import Mathlib.Algebra.Lie.Normalizer
import Mathlib.Tactic

open Phys.Cascade

namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- assume the banked decls from earlier probes (paste minimal versions)
theorem DI_mem_colour : DI ∈ colourCentralizer := by
  rw [mem_colourCentralizer]; exact (commutes_JO_iff (isDerivQ_of_mem DI)).mpr DI_u1

theorem hJ_ne_zero' : hJ ≠ (0 : H ℚ) := by
  intro h; apply four_hJ_ne_zero; rw [h, smul_zero]

theorem DK_not_mem_colour : DK ∉ colourCentralizer := by
  rw [mem_colourCentralizer]; intro h
  have hu1 : (DK : Module.End ℚ (O ℚ)) u1 = 0 := (commutes_JO_iff (isDerivQ_of_mem DK)).mp h
  rw [DK_u1] at hu1
  have h2 : ((2:ℚ) • hJ) = 0 :=
    iotaO_injective (a₁ := (2:ℚ)•hJ) (a₂ := 0) (by rw [hu1]; ext <;> simp [iotaO])
  exact hJ_ne_zero' ((smul_eq_zero.mp h2).resolve_left (by norm_num))

theorem bracket_DI_DJ_eq : (⁅DI, DJ⁆ : derivationLieQ) = (2:ℚ) • DK := by
  apply Subtype.ext
  show ((⁅DI, DJ⁆ : derivationLieQ) : Module.End ℚ (O ℚ)) = (((2:ℚ) • DK : derivationLieQ) : Module.End ℚ (O ℚ))
  have hbr : ((⁅DI, DJ⁆ : derivationLieQ) : Module.End ℚ (O ℚ))
      = (DI : Module.End ℚ (O ℚ)) * (DJ : Module.End ℚ (O ℚ))
        - (DJ : Module.End ℚ (O ℚ)) * (DI : Module.End ℚ (O ℚ)) := rfl
  have hrhs : (((2:ℚ) • DK : derivationLieQ) : Module.End ℚ (O ℚ)) = (2:ℚ) • (innerDerivQ hK) := rfl
  rw [hbr, hrhs]
  refine LinearMap.ext fun z => ?_
  simp only [LinearMap.sub_apply, Module.End.mul_apply, LinearMap.smul_apply]
  show (innerDeriv (hI:H ℚ)) ((innerDeriv hJ) z) - (innerDeriv hJ) ((innerDeriv hI) z)
      = (2:ℚ) • (innerDeriv hK) z
  have hz : (innerDeriv (hI:H ℚ)) ((innerDeriv hJ) z) - (innerDeriv hJ) ((innerDeriv hI) z)
      = (2:ℤ) • (innerDeriv hK) z := by
    have h := congrArg (fun (f : Module.End ℤ (O ℚ)) => f z) struct_ij
    simpa [Ring.lie_def, sub_eq_iff_eq_add] using h
  rw [hz, show ((2:ℤ) • (innerDeriv hK) z) = (innerDeriv hK) z + (innerDeriv hK) z by rw [two_zsmul],
      show ((2:ℚ) • (innerDeriv hK) z) = (innerDeriv hK) z + (innerDeriv hK) z by rw [two_smul]]

-- ============ NEW decls under test ============

-- 4. ⁅DI, DJ⁆ ≠ 0 : the factors don't commute (W8 teeth)
theorem bracket_DI_DJ_ne_zero : (⁅DI, DJ⁆ : derivationLieQ) ≠ 0 := by
  rw [bracket_DI_DJ_eq]
  intro h
  -- (2:ℚ)•DK = 0 → DK = 0 → DK ∈ colour (since 0 ∈ colour) contradiction with DK_not_mem_colour? 
  -- Actually DK = 0 contradicts DK ∉ colour because 0 ∈ colour. Cleaner: DK ≠ 0.
  have hDK0 : DK = 0 := (smul_eq_zero.mp h).resolve_left (by norm_num)
  -- DK = 0 → DK ∈ colour (0 ∈ colour), contradiction
  exact DK_not_mem_colour (hDK0 ▸ (colourCentralizer.zero_mem))

-- 5. ⁅DJ, DI⁆ ∉ colour  (= −⁅DI,DJ⁆ = −2•DK ∉ colour)
theorem bracket_DJ_DI_not_mem_colour : (⁅DJ, DI⁆ : derivationLieQ) ∉ colourCentralizer := by
  intro h
  -- ⁅DJ,DI⁆ = -⁅DI,DJ⁆ = -(2•DK) = (-2)•DK ; if in colour then (-2)•DK ∈ colour → DK ∈ colour
  have hlie : (⁅DJ, DI⁆ : derivationLieQ) = -(2:ℚ) • DK := by
    have : (⁅DJ, DI⁆ : derivationLieQ) = -(⁅DI, DJ⁆ : derivationLieQ) := by
      rw [← lie_skew DI DJ, neg_neg]
    rw [this, bracket_DI_DJ_eq, neg_smul]
  rw [hlie] at h
  -- (-2)•DK ∈ colour → DK ∈ colour (scale by -1/2)
  have : DK ∈ colourCentralizer := by
    have := colourCentralizer.smul_mem (-(1:ℚ)/2) h
    rwa [smul_smul, show (-(1:ℚ)/2) * (-2) = 1 by norm_num, one_smul] at this
  exact DK_not_mem_colour this

-- 6. HEADLINE: DJ does not normalize colour (witness DI ∈ colour, ⁅DJ,DI⁆ ∉ colour)
theorem isospin_not_normalize_colour : DJ ∉ colourCentralizer.normalizer := by
  rw [LieSubalgebra.mem_normalizer_iff]
  intro h
  exact bracket_DJ_DI_not_mem_colour (h DI DI_mem_colour)

-- 7. colour is not an ideal of g₂ : normalizer ≠ ⊤
theorem colour_normalizer_ne_top : colourCentralizer.normalizer ≠ ⊤ := by
  intro h
  apply isospin_not_normalize_colour
  rw [h]; exact LieSubalgebra.mem_top DJ

end Phys.Algebra

#print axioms Phys.Algebra.bracket_DI_DJ_eq
#print axioms Phys.Algebra.bracket_DI_DJ_ne_zero
#print axioms Phys.Algebra.bracket_DJ_DI_not_mem_colour
#print axioms Phys.Algebra.isospin_not_normalize_colour
#print axioms Phys.Algebra.colour_normalizer_ne_top
#print axioms Phys.Algebra.DI_mem_colour
#print axioms Phys.Algebra.DK_not_mem_colour
