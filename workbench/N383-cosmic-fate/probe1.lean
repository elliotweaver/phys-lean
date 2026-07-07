import Phys.Algebra.MaxEntArrowOfTime
import Phys.Foundation.ContinuumExpDeriv
import Phys.Foundation.ContinuumLog

namespace Probe383

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra.MaxEnt
open Filter Set
open scoped Topology

noncomputable section

/-- The relaxing coherence gap. -/
noncomputable def coherenceGap (g₀ lam t : Cut) : Cut := g₀ * cutExp (-lam * t)

/-- MACHINERY: const-mul rule for CutHasDerivAt (Mathlib lacks it on Cut). -/
theorem cutHasDerivAt_const_mul {f : Cut → Cut} {df x : Cut} (c : Cut)
    (hf : CutHasDerivAt f df x) :
    CutHasDerivAt (fun y => c * f y) (c * df) x := by
  unfold CutHasDerivAt at *
  have hsum := hf.const_mul c
  have hcongr : (fun h : Cut => c * (h⁻¹ * (f (x + h) - f x)))
      = (fun h : Cut => h⁻¹ * ((fun y => c * f y) (x + h) - (fun y => c * f y) x)) := by
    funext h; ring
  rw [hcongr] at hsum; exact hsum

/-- (a) heat death never reached: gap > 0 for all t. -/
theorem heat_death_never_reached (g₀ lam t : Cut) (hg : 0 < g₀) :
    0 < coherenceGap g₀ lam t := by
  unfold coherenceGap
  exact mul_pos hg (cutExp_pos _)

theorem gap_ne_zero (g₀ lam t : Cut) (hg : 0 < g₀) : coherenceGap g₀ lam t ≠ 0 :=
  ne_of_gt (heat_death_never_reached g₀ lam t hg)

/-- (c) strictly decreasing: the arrow. -/
theorem gap_strictly_decreasing (g₀ lam t₁ t₂ : Cut)
    (hg : 0 < g₀) (hl : 0 < lam) (ht : t₁ < t₂) :
    coherenceGap g₀ lam t₂ < coherenceGap g₀ lam t₁ := by
  unfold coherenceGap
  apply mul_lt_mul_of_pos_left _ hg
  apply cutExp_strictMono
  have : -lam * t₂ < -lam * t₁ := by
    have hneg : -lam < 0 := by linarith
    exact mul_lt_mul_of_neg_left ht hneg
  exact this

/-- (d) flow velocity g' = -lam * g via N369 chain rule + const_mul. -/
theorem flow_velocity_eq (g₀ lam t : Cut) (hl : lam ≠ 0) :
    CutHasDerivAt (coherenceGap g₀ lam)
      (g₀ * (-lam * cutExp (-lam * t))) t := by
  have hneg : (-lam) ≠ 0 := neg_ne_zero.mpr hl
  have hbase : CutHasDerivAt (fun y => cutExp (-lam * y)) (-lam * cutExp (-lam * t)) t :=
    cutExp_scale_hasDerivAt (-lam) t hneg
  have := cutHasDerivAt_const_mul (f := fun y => cutExp (-lam * y)) g₀ hbase
  unfold coherenceGap
  exact this

/-- (e) flow velocity never zero while gap positive. -/
theorem flow_velocity_ne_zero (g₀ lam t : Cut) (hg : 0 < g₀) (hl : 0 < lam) :
    g₀ * (-lam * cutExp (-lam * t)) ≠ 0 := by
  have hexp : 0 < cutExp (-lam * t) := cutExp_pos _
  have hneg : -lam < 0 := by linarith
  have : g₀ * (-lam * cutExp (-lam * t)) < 0 := by
    have h1 : -lam * cutExp (-lam * t) < 0 := mul_neg_of_neg_of_pos hneg hexp
    exact mul_neg_of_pos_of_neg hg h1
  exact ne_of_lt this

/-- (f) the KL tie: an off-equilibrium start relaxes but never reaches coincidence. -/
theorem kl_gap_never_reaches_coincidence {n : ℕ} (p q : Fin n → Cut)
    (hp : ∀ i, 0 < p i) (hq : ∀ i, 0 < q i)
    (hsp : ∑ i, p i = 1) (hsq : ∑ i, q i = 1) (hpq : p ≠ q)
    (lam t : Cut) :
    0 < coherenceGap (relInfo p q) lam t :=
  heat_death_never_reached (relInfo p q) lam t (gibbs_pos p q hp hq hsp hsq hpq)

/-- relInfo_zero_iff tie sanity: the coincidence IS relInfo=0 iff p=q. -/
theorem coincidence_iff {n : ℕ} (p q : Fin n → Cut)
    (hp : ∀ i, 0 < p i) (hq : ∀ i, 0 < q i)
    (hsp : ∑ i, p i = 1) (hsq : ∑ i, q i = 1) :
    relInfo p q = 0 ↔ p = q :=
  relInfo_zero_iff p q hp hq hsp hsq

/-- costume anchor: concrete gap ≠ 0. -/
theorem gap_concrete_ne_zero : coherenceGap 1 1 1 ≠ 0 :=
  gap_ne_zero 1 1 1 (by norm_num)

end

end Probe383
