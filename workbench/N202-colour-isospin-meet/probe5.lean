import Phys.Algebra.DerivationColourIsospinCommutator
import Phys.Algebra.DerivationColourCentralizer
import Phys.Algebra.DerivationStabilizer
import Phys.Algebra.DerivationHIntoO
import Mathlib.Algebra.Module.LinearMap.Rat
import Mathlib.Tactic

open Phys.Cascade
namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable def innerDerivQ (q : H ℚ) : Module.End ℚ (O ℚ) :=
  ((innerDeriv q).toAddMonoidHom).toRatLinearMap
theorem innerDerivQ_isDerivQ (q : H ℚ) (hq : star q = -q) : IsDerivQ (innerDerivQ q) := by
  intro x y
  show (innerDeriv q) (x * y) = (innerDeriv q) x * y + x * (innerDeriv q) y
  exact innerDeriv_isDeriv q hq x y
noncomputable def DI : derivationLieQ := ⟨innerDerivQ hI, innerDerivQ_isDerivQ hI hI_imag⟩
noncomputable def DJ : derivationLieQ := ⟨innerDerivQ hJ, innerDerivQ_isDerivQ hJ hJ_imag⟩
noncomputable def DK : derivationLieQ := ⟨innerDerivQ hK, innerDerivQ_isDerivQ hK hK_imag⟩
theorem DI_u1 : (DI : Module.End ℚ (O ℚ)) u1 = 0 := innerDeriv_hI_u1
theorem DJ_u1 : (DJ : Module.End ℚ (O ℚ)) u1 = iotaO (-(2:ℚ) • hK) := innerDeriv_hJ_u1
theorem DK_u1 : (DK : Module.End ℚ (O ℚ)) u1 = iotaO ((2:ℚ) • hJ) := by
  show (innerDeriv hK) u1 = iotaO ((2 : ℚ) • hJ)
  rw [innerDeriv_u1, adHom_apply, hK_hI, hI_hK]
  congr 1; show hJ - -hJ = (2 : ℚ) • hJ; module
theorem comb_u1 (a b c : ℚ) :
    ((a • DI + b • DJ + c • DK : derivationLieQ) : Module.End ℚ (O ℚ)) u1
      = iotaO ((-(2:ℚ)*b) • hK + ((2:ℚ)*c) • hJ) := by
  have hcoe : ((a • DI + b • DJ + c • DK : derivationLieQ) : Module.End ℚ (O ℚ))
      = a • (DI : Module.End ℚ (O ℚ)) + b • (DJ : Module.End ℚ (O ℚ))
        + c • (DK : Module.End ℚ (O ℚ)) := rfl
  rw [hcoe]
  simp only [LinearMap.add_apply, LinearMap.smul_apply, DI_u1, DJ_u1, DK_u1]
  rw [smul_zero, zero_add, ← map_smul, ← map_smul, ← map_add]
  congr 1; rw [smul_smul, smul_smul]; module
theorem hJK_indep (x y : ℚ) (h : x • hK + y • hJ = 0) : x = 0 ∧ y = 0 := by
  constructor
  · have := congrArg (fun w : H ℚ => w.im.im) h
    simpa [hK, hJ, hI, CD.iota, CD.e2, Dbl.J, Dbl.smul_re, Dbl.smul_im, cd_qsmul_re, cd_qsmul_im,
      CD.add_re, CD.add_im] using this
  · have := congrArg (fun w : H ℚ => w.im.re) h
    simpa [hK, hJ, hI, CD.iota, CD.e2, Dbl.J, Dbl.smul_re, Dbl.smul_im, cd_qsmul_re, cd_qsmul_im,
      CD.add_re, CD.add_im] using this
theorem comb_mem_colour_iff (a b c : ℚ) :
    ((a • DI + b • DJ + c • DK : derivationLieQ) : Module.End ℚ (O ℚ)) u1 = 0 ↔ b = 0 ∧ c = 0 := by
  rw [comb_u1]
  constructor
  · intro h
    have h0 : ((-(2:ℚ)*b) • hK + ((2:ℚ)*c) • hJ) = 0 :=
      iotaO_injective (a₁ := (-(2:ℚ)*b) • hK + ((2:ℚ)*c) • hJ) (a₂ := 0)
        (by rw [h]; ext <;> simp [iotaO])
    obtain ⟨h1, h2⟩ := hJK_indep _ _ h0
    exact ⟨by linarith, by linarith⟩
  · rintro ⟨rfl, rfl⟩
    simp only [mul_zero, zero_smul, add_zero]
    ext <;> simp [iotaO]

/-! ## The isospin span and the meet. -/

noncomputable def isospinSpan : Submodule ℚ derivationLieQ := Submodule.span ℚ {DI, DJ, DK}

-- THE HEADLINE: isospinSpan ⊓ colourCentralizer.toSubmodule = ℚ ∙ DI
theorem meet_eq_span_DI :
    isospinSpan ⊓ (colourCentralizer.toSubmodule) = Submodule.span ℚ {DI} := by
  apply le_antisymm
  · rintro x ⟨hxspan, hxcol⟩
    -- x ∈ span{DI,DJ,DK}: write x = a•DI + b•DJ + c•DK
    rw [SetLike.mem_coe, isospinSpan, Submodule.mem_span_triple] at hxspan
    obtain ⟨a, b, c, rfl⟩ := hxspan
    -- the colour condition forces b = c = 0
    have hcol : ((a • DI + b • DJ + c • DK : derivationLieQ) : Module.End ℚ (O ℚ)) u1 = 0 := by
      have hmem : (a • DI + b • DJ + c • DK : derivationLieQ) ∈ colourCentralizer :=
        (LieSubalgebra.mem_toSubmodule _).mp hxcol
      exact (commutes_JO_iff (isDerivQ_of_mem _)).mp (mem_colourCentralizer.mp hmem)
    obtain ⟨rfl, rfl⟩ := (comb_mem_colour_iff a b c).mp hcol
    simp only [zero_smul, add_zero]
    exact Submodule.mem_span_singleton.mpr ⟨a, rfl⟩
  · rw [Submodule.span_singleton_le_iff_mem]
    refine ⟨?_, ?_⟩
    · exact Submodule.subset_span (by simp [isospinSpan])
    · rw [SetLike.mem_coe, LieSubalgebra.mem_toSubmodule, mem_colourCentralizer]
      exact (commutes_JO_iff (isDerivQ_of_mem DI)).mpr DI_u1

#print axioms meet_eq_span_DI
