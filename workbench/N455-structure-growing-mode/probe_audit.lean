/-
  N455 PROBE — the gravitational growing mode / instability of the smooth state.
  The sign-mirror of the banked N383 fate (CosmicFateEternalApproach).
  De-risk every load-bearing piece BEFORE production. All foundations-only.
-/
import Phys.Algebra.CosmicFateEternalApproach      -- coherenceGap, cutHasDerivAt_const_mul (N383)
import Phys.Foundation.ContinuumSphereFlux          -- gaussSphereSolidAngle (N328)

namespace N455Probe

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra
open Phys.Algebra.MaxEnt

noncomputable section

/-! ## The growth rate: ω² = 4π-flux · density, ω the derived positive square root. -/

/-- ω² = (banked Gauss-sphere flux 4π, N328) · (Born-positive density). The geometric factor is
    the SAME banked `gaussSphereSolidAngle` in the 8πG coupling (N359). -/
noncomputable def growthRateSq (ρ : Cut) : Cut := gaussSphereSolidAngle * ρ

theorem growthRateSq_pos (ρ : Cut) (hρ : 0 < ρ) : 0 < growthRateSq ρ :=
  mul_pos gaussSphereSolidAngle_pos hρ

/-- ω = the DERIVED positive square root via the fold's own exp/log — NO Mathlib sqrt, NO posited root. -/
noncomputable def growthRate (ρ : Cut) : Cut := cutExp (2⁻¹ * cutLog (growthRateSq ρ))

theorem growthRate_pos (ρ : Cut) : 0 < growthRate ρ := cutExp_pos _

/-- ★ ω² = the flux·density: the derived root genuinely squares back. -/
theorem growthRate_sq (ρ : Cut) (hρ : 0 < ρ) : growthRate ρ * growthRate ρ = growthRateSq ρ := by
  unfold growthRate
  rw [cutExp_add]
  have h2 : (2⁻¹ * cutLog (growthRateSq ρ)) + (2⁻¹ * cutLog (growthRateSq ρ))
      = cutLog (growthRateSq ρ) := by ring
  rw [h2, cutExp_cutLog (growthRateSq_pos ρ hρ)]

/-! ## The growing mode — sign-mirror of N383's coherenceGap. -/

/-- δ(t) = δ₀·cutExp(+ω·t): the growing branch of the fold's exponential (C6's OTHER branch;
    N383's decaying gap is δ₀·cutExp(−ω·t)). -/
noncomputable def growingMode (δ₀ ω t : Cut) : Cut := δ₀ * cutExp (ω * t)

/-- The perturbation never vanishes (cutExp_pos). Sign-mirror of `heat_death_never_reached`. -/
theorem growingMode_pos (δ₀ ω t : Cut) (hδ : 0 < δ₀) : 0 < growingMode δ₀ ω t :=
  mul_pos hδ (cutExp_pos _)

/-- ★ THE GROWTH: strictly INCREASING in t for ω>0 (cutExp_strictMono). Sign-mirror of
    `gap_strictly_decreasing`. This IS the gravitational instability. -/
theorem growingMode_strictly_increasing (δ₀ ω t₁ t₂ : Cut)
    (hδ : 0 < δ₀) (hω : 0 < ω) (ht : t₁ < t₂) :
    growingMode δ₀ ω t₁ < growingMode δ₀ ω t₂ := by
  unfold growingMode
  apply mul_lt_mul_of_pos_left _ hδ
  apply cutExp_strictMono
  exact mul_lt_mul_of_pos_left ht hω

/-- ★ THE GROWTH LAW δ'=+ω·δ (analytic fold, N369 + N383 const-mul rule). -/
theorem flow_velocity_eq (δ₀ ω t : Cut) (hω : ω ≠ 0) :
    CutHasDerivAt (growingMode δ₀ ω) (δ₀ * (ω * cutExp (ω * t))) t := by
  have hbase : CutHasDerivAt (fun y => cutExp (ω * y)) (ω * cutExp (ω * t)) t :=
    cutExp_scale_hasDerivAt ω t hω
  have := cutHasDerivAt_const_mul (f := fun y => cutExp (ω * y)) δ₀ hbase
  unfold growingMode
  exact this

/-- ★ THE VELOCITY IS POSITIVE — δ=0 is FLED, not approached (mirror of `fixed_point_unreachable`). -/
theorem flow_velocity_pos (δ₀ ω t : Cut) (hδ : 0 < δ₀) (hω : 0 < ω) :
    0 < δ₀ * (ω * cutExp (ω * t)) :=
  mul_pos hδ (mul_pos hω (cutExp_pos _))

/-! ## ★★ THE SIGN-DUALITY WELD to the banked N383 fate flow. -/

/-- ★★ THE CONSERVED PRODUCT: the growing mode times the banked N383 decaying `coherenceGap`
    (same ω) is TIME-INDEPENDENT (= δ₀·δ₁). The two C6 branches are reciprocal — a Wronskian-like
    invariant. Statable from NEITHER branch alone; cites the banked N383 `coherenceGap`. -/
theorem growing_decaying_product_conserved (δ₀ δ₁ ω t : Cut) :
    growingMode δ₀ ω t * coherenceGap δ₁ ω t = δ₀ * δ₁ := by
  unfold growingMode coherenceGap
  have hkey : cutExp (ω * t) * cutExp (-ω * t) = 1 := by
    have : (-ω * t) = -(ω * t) := by ring
    rw [this, cutExp_mul_neg]
  calc δ₀ * cutExp (ω * t) * (δ₁ * cutExp (-ω * t))
      = δ₀ * δ₁ * (cutExp (ω * t) * cutExp (-ω * t)) := by ring
    _ = δ₀ * δ₁ * 1 := by rw [hkey]
    _ = δ₀ * δ₁ := by ring

/-! ## ★ THE INSTABILITY — the smooth state is fled without bound. -/

/-- ★ THE SMOOTH STATE IS UNSTABLE: the growing mode exceeds EVERY bound B at some finite t.
    Structure grows without bound in the linear regime. Uses banked `one_add_lt_cutExp_pos`. -/
theorem smooth_state_unstable (δ₀ ω : Cut) (hδ : 0 < δ₀) (hω : 0 < ω) :
    ∀ B : Cut, ∃ t : Cut, B < growingMode δ₀ ω t := by
  intro B
  by_cases hB : B ≤ 0
  · -- any t works; take t = 0 (growingMode = δ₀ > 0 ≥ B)
    refine ⟨0, ?_⟩
    have hpos : 0 < growingMode δ₀ ω 0 := growingMode_pos δ₀ ω 0 hδ
    linarith
  · push_neg at hB
    refine ⟨B / (δ₀ * ω), ?_⟩
    unfold growingMode
    have hδω : 0 < δ₀ * ω := mul_pos hδ hω
    have harg : ω * (B / (δ₀ * ω)) = B / δ₀ := by field_simp
    have hargpos : 0 < ω * (B / (δ₀ * ω)) := by rw [harg]; exact div_pos hB hδ
    have hlin : 1 + ω * (B / (δ₀ * ω)) < cutExp (ω * (B / (δ₀ * ω))) :=
      one_add_lt_cutExp_pos _ hargpos
    have hstep : δ₀ * (1 + ω * (B / (δ₀ * ω))) < δ₀ * cutExp (ω * (B / (δ₀ * ω))) :=
      mul_lt_mul_of_pos_left hlin hδ
    have hval : δ₀ * (1 + ω * (B / (δ₀ * ω))) = δ₀ + B := by rw [harg]; field_simp
    rw [hval] at hstep
    linarith

/-! ## W8 non-vacuity for C480. -/

/-- W8: the growing mode GENUINELY exceeds its initial value — `growingMode 1 1 1 > 1`. -/
theorem growingMode_concrete_gt : (1 : Cut) < growingMode 1 1 1 := by
  unfold growingMode
  have h : (1 : Cut) + 1 < cutExp (1 * 1) := by
    have := one_add_lt_cutExp_pos (1 : Cut) (by norm_num)
    simpa using this
  have : cutExp ((1:Cut) * 1) = 1 * cutExp (1 * 1) := by ring
  rw [this] at *
  linarith

end

end N455Probe

open N455Probe
#print axioms growingMode_pos
#print axioms growingMode_strictly_increasing
#print axioms flow_velocity_eq
#print axioms flow_velocity_pos
#print axioms growthRate_sq
#print axioms growing_decaying_product_conserved
#print axioms smooth_state_unstable
#print axioms growingMode_concrete_gt
