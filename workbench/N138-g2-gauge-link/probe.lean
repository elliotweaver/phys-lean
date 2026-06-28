import Phys.Algebra.LorentzContinuumOctStabilizerGauge
import Phys.Algebra.DerivationOAutomorphism

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

open scoped BigOperators

noncomputable section

/-- Cut-side: the Born self-overlap is a real scalar `x · star x = (gFormC x x) • 1`. -/
theorem selfMulC_eq_smul (x : O Cut) : x * star x = (gFormC x x) • (1 : O Cut) := by
  have hsc : star (x * star x) = x * star x := by rw [star_mul, star_star]
  have h := octRefl_selfconj_eq_smul hsc
  rw [h]; rfl

/-- Cut-side: the monic quadratic every element satisfies,
    `x · x = (2 reQC x) • x − (gFormC x x) • 1`. -/
theorem octo_quadraticC (x : O Cut) :
    x * x = (2 * reQC x) • x - (gFormC x x) • (1 : O Cut) := by
  have hst : star x = (2 * reQC x) • (1 : O Cut) - x := by
    have ht := octRefl_trace_id x; linear_combination (norm := abel) ht
  have hsm : x * star x = (gFormC x x) • (1 : O Cut) := selfMulC_eq_smul x
  rw [hst, mul_sub, smulCompat_oCut.hr, mul_one] at hsm
  linear_combination (norm := abel) -hsm

@[simp] theorem reQC_one' : reQC (1 : O Cut) = 1 := reQC_one

/-- Cut-side: the quadratic difference identity for an automorphism. -/
theorem autC_quad_diff {φ : O Cut ≃ₗ[Cut] O Cut} (h : IsAlgAutCut φ) (x : O Cut) :
    (2 * (reQC x - reQC (φ x))) • (φ x)
      = (gFormC x x - gFormC (φ x) (φ x)) • (1 : O Cut) := by
  obtain ⟨hmul, hone⟩ := h
  have hL : φ (x * x) = φ x * φ x := hmul x x
  have hQ := octo_quadraticC x
  have hφQ : φ (x * x) = (2 * reQC x) • (φ x) - (gFormC x x) • (1 : O Cut) := by
    rw [hQ]; simp [map_sub, map_smul, hone]
  have hQ' := octo_quadraticC (φ x)
  rw [hL, hQ'] at hφQ
  linear_combination (norm := module) -hφQ

/-- ★ Cut-side: an automorphism PRESERVES THE REAL PART `reQC (φ x) = reQC x`. -/
theorem autC_reQC {φ : O Cut ≃ₗ[Cut] O Cut} (h : IsAlgAutCut φ) (x : O Cut) :
    reQC (φ x) = reQC x := by
  set a : Cut := 2 * (reQC x - reQC (φ x)) with ha
  have hkey := autC_quad_diff h x
  have hreQ : a * reQC (φ x) = (gFormC x x - gFormC (φ x) (φ x)) := by
    have := congrArg reQC hkey
    rw [reQC_smul, reQC_smul, reQC_one, mul_one] at this
    exact this
  rw [← hreQ] at hkey
  have hzero : a • ((φ x) - reQC (φ x) • (1 : O Cut)) = 0 := by
    rw [smul_sub, hkey, smul_smul, sub_self]
  rcases smul_eq_zero.mp hzero with ha0 | hw0
  · have h2 : (2 : Cut) * (reQC x - reQC (φ x)) = 0 := ha0
    have : reQC x - reQC (φ x) = 0 := by
      rcases mul_eq_zero.mp h2 with h2a | h2b
      · exact absurd h2a (by norm_num)
      · exact h2b
    linarith [this]
  · have hφscalar : φ x = reQC (φ x) • (1 : O Cut) := by rw [sub_eq_zero] at hw0; exact hw0
    have hxscalar : x = reQC (φ x) • (1 : O Cut) := by
      have hsymm : φ.symm (reQC (φ x) • (1 : O Cut)) = reQC (φ x) • (1 : O Cut) := by
        apply φ.injective
        rw [φ.apply_symm_apply, map_smul, h.2]
      have h1 : φ.symm (φ x) = φ.symm (reQC (φ x) • (1 : O Cut)) := congrArg φ.symm hφscalar
      rw [φ.symm_apply_apply, hsymm] at h1
      exact h1
    have hr := congrArg reQC hxscalar
    rw [reQC_smul, reQC_one, mul_one] at hr
    exact hr.symm

/-- Cut-side: an automorphism COMMUTES with conjugation `φ (star x) = star (φ x)`. -/
theorem autC_star {φ : O Cut ≃ₗ[Cut] O Cut} (h : IsAlgAutCut φ) (x : O Cut) :
    φ (star x) = star (φ x) := by
  have hsx : star x = (2 * reQC x) • (1 : O Cut) - x := by
    have ht := octRefl_trace_id x; linear_combination (norm := abel) ht
  have hsφx : star (φ x) = (2 * reQC (φ x)) • (1 : O Cut) - φ x := by
    have ht := octRefl_trace_id (φ x); linear_combination (norm := abel) ht
  rw [hsx, map_sub, map_smul, h.2, hsφx, autC_reQC h x]

/-- ★★ Cut-side: an automorphism PRESERVES THE BORN SELF-OVERLAP FORM `gFormC (φ x)(φ y) = gFormC x y`. -/
theorem autC_gFormC {φ : O Cut ≃ₗ[Cut] O Cut} (h : IsAlgAutCut φ) (x y : O Cut) :
    gFormC (φ x) (φ y) = gFormC x y := by
  show reQC (φ x * star (φ y)) = reQC (x * star y)
  rw [← autC_star h y, ← h.1 x (star y), autC_reQC h (x * star y)]

/-- An automorphism (as a linear map) is a `gFormC`-isometry. -/
theorem autC_isGFormCIsom {φ : O Cut ≃ₗ[Cut] O Cut} (h : IsAlgAutCut φ) :
    IsGFormCIsom (φ : O Cut →ₗ[Cut] O Cut) :=
  fun u v => autC_gFormC h u v

/-- ★ THE GAUGE INCLUSION (G₂ = Aut(O) ⊂ SO(8) ⊂ observer-plane stabilizer): the octonion-block
    embedding of an octonion algebra-automorphism lands in the gauge stabilizer `octStab`. -/
theorem octBlockEndC_autC_mem_octStab {φ : O Cut ≃ₗ[Cut] O Cut} (h : IsAlgAutCut φ) :
    IsOctStab (octBlockEndC (φ : O Cut →ₗ[Cut] O Cut)) :=
  octBlockEndC_mem_octStab (autC_isGFormCIsom h)

/-- W8 non-vacuity: the identity automorphism `expOEquiv 0` lands in the stabilizer. -/
theorem octBlockEndC_id_mem_octStab :
    IsOctStab (octBlockEndC ((expOEquiv (0 : Module.End Cut (O Cut))) : O Cut →ₗ[Cut] O Cut)) :=
  octBlockEndC_autC_mem_octStab expOEquiv_zero_isAlgAut

/-- W8 anchor: an automorphism preserves the unit's self-overlap, `gFormC (φ 1) (φ 1) = 1`. -/
theorem autC_gFormC_one {φ : O Cut ≃ₗ[Cut] O Cut} (h : IsAlgAutCut φ) :
    gFormC (φ 1) (φ 1) = 1 := by
  rw [autC_gFormC h, gFormC_one]

end

end Phys.Algebra
