import Phys.Algebra.LorentzContinuumGenerationSO8BoundedExhaustion

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-- THE OCTONION-BLOCK v-BLOCK of the bisector reflection `octDeflate e w = biMulLin n n`:
    `octReflBlock e w := biMulV n n` at the normalized bisector `n := r⁻¹•(e − w)`. -/
def octReflBlock (e w : O Cut) : O Cut →ₗ[Cut] O Cut :=
  biMulV ((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w))
         ((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w))

theorem octReflBlock_apply (e w v : O Cut) :
    octReflBlock e w v =
      ((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w)) *
        (v * ((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w))) := rfl

/-- (B) DIAGONAL `gFormC`-isometry: from `biMul_gFormC` + `octBisector_unit`. -/
theorem octReflBlock_gFormC_diag {e w : O Cut} (hne : e - w ≠ 0) (v : O Cut) :
    gFormC (octReflBlock e w v) (octReflBlock e w v) = gFormC v v := by
  rw [octReflBlock_apply, biMul_gFormC, octBisector_unit hne]
  ring

/-- (A) FIXES any imaginary axis `e₀` Born-orthogonal to the bisector `e − w` — the O-Cut-level
    mirror of N120's `octDeflate_fixes_orthogonal_axis`. -/
theorem octReflBlock_fixes_orthogonal {e w e₀ : O Cut}
    (he : star e = -e) (hw : star w = -w) (he₀ : star e₀ = -e₀)
    (hortho : gFormC e₀ (e - w) = 0) (hne : e - w ≠ 0) :
    octReflBlock e w e₀ = e₀ := by
  have hg : gFormC e₀ ((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w)) = 0 := by
    rw [gFormC_smul_right, hortho, mul_zero]
  rw [octReflBlock_apply, octRefl_reflect_imag (octBisector_imag he hw) he₀,
      octBisector_unit hne, hg, mul_zero, zero_smul, sub_zero, one_smul]

/-- (C1) MAPS `ePerp e₀` INTO `ePerp e₀` — instantiating N119's `isom_fixes_mapsTo_ePerp`. -/
theorem octReflBlock_mapsTo_ePerp {e w e₀ : O Cut}
    (he : star e = -e) (hw : star w = -w) (he₀ : star e₀ = -e₀)
    (hortho : gFormC e₀ (e - w) = 0) (hne : e - w ≠ 0) :
    ∀ p ∈ ePerp e₀, octReflBlock e w p ∈ ePerp e₀ :=
  isom_fixes_mapsTo_ePerp (octReflBlock e w)
    (fun v => octReflBlock_gFormC_diag hne v)
    (octReflBlock_fixes_orthogonal he hw he₀ hortho hne)

/-- (C2) THE RESTRICTED OPERATOR on the codim-1 complement `ePerp e₀`. -/
def octReflBlockRestrict {e w e₀ : O Cut}
    (he : star e = -e) (hw : star w = -w) (he₀ : star e₀ = -e₀)
    (hortho : gFormC e₀ (e - w) = 0) (hne : e - w ≠ 0) :
    Module.End Cut (ePerp e₀) :=
  isomRestrict (octReflBlock e w)
    (fun v => octReflBlock_gFormC_diag hne v)
    (octReflBlock_fixes_orthogonal he hw he₀ hortho hne)

/-- (C3) THE CLOSURE — the restriction is STILL a `gFormC`-isometry on `ePerp e₀`. -/
theorem octReflBlockRestrict_gFormC_isom {e w e₀ : O Cut}
    (he : star e = -e) (hw : star w = -w) (he₀ : star e₀ = -e₀)
    (hortho : gFormC e₀ (e - w) = 0) (hne : e - w ≠ 0) (p : ePerp e₀) :
    gFormC ((octReflBlockRestrict he hw he₀ hortho hne p : O Cut))
           ((octReflBlockRestrict he hw he₀ hortho hne p : O Cut))
      = gFormC ((p : O Cut)) ((p : O Cut)) :=
  isomRestrict_gFormC_isom (octReflBlock e w)
    (fun v => octReflBlock_gFormC_diag hne v)
    (octReflBlock_fixes_orthogonal he hw he₀ hortho hne) p

/-! ## W8 teeth -/

theorem octReflBlock_witness :
    octReflBlock (CD.e2 : O Cut) (je2 : O Cut) (ke2je2 : O Cut) = (ke2je2 : O Cut) :=
  octReflBlock_fixes_orthogonal e2_imag je2_imag ke2je2_imag
    twoaxis_witness_self_overlap octDeflate_witness_ne

theorem octReflBlock_witness_self_overlap :
    gFormC (octReflBlock (CD.e2 : O Cut) (je2 : O Cut) (ke2je2 : O Cut))
           (octReflBlock (CD.e2 : O Cut) (je2 : O Cut) (ke2je2 : O Cut)) = 1 := by
  rw [octReflBlock_witness]; exact ke2je2_gFormC_self

theorem octReflBlock_mapsTo_witness :
    ∀ p ∈ ePerp (ke2je2 : O Cut),
      octReflBlock (CD.e2 : O Cut) (je2 : O Cut) p ∈ ePerp (ke2je2 : O Cut) :=
  octReflBlock_mapsTo_ePerp e2_imag je2_imag ke2je2_imag
    twoaxis_witness_self_overlap octDeflate_witness_ne

end

end Phys.Algebra
