import Phys.Foundation.ContinuumExpDeriv
import Phys.Algebra.CosmoInflationPlateauExclusion

namespace Phys.Foundation.ContinuumQ

open Filter Set
open Phys.Algebra
open scoped Topology BigOperators

noncomputable section

-- toolkit (copied from probes: product/sub/inner-deriv/plateau-deriv/no-nonzero-crit)
theorem q_cont {f : Cut → Cut} {df x : Cut} (hf : CutHasDerivAt f df x) :
    Tendsto (fun h => f (x + h)) (𝓝[≠] (0 : Cut)) (𝓝 (f x)) := by
  unfold CutHasDerivAt at hf
  have h0 : Tendsto (fun h : Cut => h) (𝓝[≠] (0 : Cut)) (𝓝 0) :=
    tendsto_id.mono_left nhdsWithin_le_nhds
  have hprod : Tendsto (fun h : Cut => h * (h⁻¹ * (f (x + h) - f x)))
      (𝓝[≠] (0 : Cut)) (𝓝 (0 * df)) := h0.mul hf
  have hcongr : Tendsto (fun h : Cut => f (x + h) - f x) (𝓝[≠] (0 : Cut)) (𝓝 (0 * df)) := by
    refine hprod.congr' ?_
    filter_upwards [self_mem_nhdsWithin] with h hh
    simp only [mem_compl_iff, mem_singleton_iff] at hh
    field_simp
  rw [zero_mul] at hcongr
  have := hcongr.add_const (f x); simpa using this

theorem q_mul {f g : Cut → Cut} {df dg x : Cut}
    (hf : CutHasDerivAt f df x) (hg : CutHasDerivAt g dg x) :
    CutHasDerivAt (fun y => f y * g y) (df * g x + f x * dg) x := by
  unfold CutHasDerivAt at *
  have hcf := q_cont hf
  have hA : Tendsto (fun h : Cut => (h⁻¹ * (f (x + h) - f x)) * g x)
      (𝓝[≠] (0 : Cut)) (𝓝 (df * g x)) := hf.mul_const (g x)
  have hB : Tendsto (fun h : Cut => f (x + h) * (h⁻¹ * (g (x + h) - g x)))
      (𝓝[≠] (0 : Cut)) (𝓝 (f x * dg)) := hcf.mul hg
  have hAB := hA.add hB
  refine hAB.congr' ?_
  filter_upwards [self_mem_nhdsWithin] with h hh
  simp only [mem_compl_iff, mem_singleton_iff] at hh
  field_simp; ring

theorem q_neg {f : Cut → Cut} {df x : Cut} (hf : CutHasDerivAt f df x) :
    CutHasDerivAt (fun y => - f y) (- df) x := by
  unfold CutHasDerivAt at *
  have := hf.neg; refine this.congr' ?_; filter_upwards with h; ring

theorem q_sub {f g : Cut → Cut} {df dg x : Cut}
    (hf : CutHasDerivAt f df x) (hg : CutHasDerivAt g dg x) :
    CutHasDerivAt (fun y => f y - g y) (df - dg) x := by
  have hng := q_neg hg; have := hf.add hng
  refine this.congr' ?_
  · unfold CutHasDerivAt at *; filter_upwards with h; ring

theorem q_inner (c φ : Cut) (hc : c ≠ 0) :
    CutHasDerivAt (fun y => 1 - cutExp (-(c * y))) (c * cutExp (-(c * φ))) φ := by
  have hexp : CutHasDerivAt (fun y => cutExp ((-c) * y)) ((-c) * cutExp ((-c) * φ)) φ :=
    cutExp_scale_hasDerivAt (-c) φ (neg_ne_zero.mpr hc)
  have hconst : CutHasDerivAt (fun _ : Cut => (1 : Cut)) 0 φ := cutHasDerivAt_const 1 φ
  have hsub := q_sub hconst hexp
  have h1 : (fun y => (1:Cut) - cutExp ((-c) * y)) = (fun y => 1 - cutExp (-(c * y))) := by
    funext y; rw [neg_mul]
  rw [h1] at hsub
  have hval : (0 : Cut) - (-c) * cutExp ((-c) * φ) = c * cutExp (-(c * φ)) := by rw [neg_mul]; ring
  rw [hval] at hsub; exact hsub

theorem q_plateau_deriv (c φ : Cut) (hc : c ≠ 0) :
    CutHasDerivAt (plateauApproachPot c)
      (2 * c * cutExp (-(c * φ)) * (1 - cutExp (-(c * φ)))) φ := by
  have hg := q_inner c φ hc
  have hsq := q_mul hg hg
  have hfun : (fun y => (1 - cutExp (-(c * y))) * (1 - cutExp (-(c * y))))
      = plateauApproachPot c := by funext y; unfold plateauApproachPot; ring
  rw [hfun] at hsq
  have hval : c * cutExp (-(c * φ)) * (1 - cutExp (-(c * φ)))
        + (1 - cutExp (-(c * φ))) * (c * cutExp (-(c * φ)))
      = 2 * c * cutExp (-(c * φ)) * (1 - cutExp (-(c * φ))) := by ring
  rw [hval] at hsq; exact hsq

theorem q_no_nonzero_crit (c φ : Cut) (hc : 0 < c) (hφ : 0 < φ) :
    2 * c * cutExp (-(c * φ)) * (1 - cutExp (-(c * φ))) ≠ 0 := by
  have hepos : 0 < cutExp (-(c * φ)) := cutExp_pos _
  have hlt1 : cutExp (-(c * φ)) < 1 := by
    have harg : -(c * φ) < 0 := by nlinarith
    calc cutExp (-(c * φ)) < cutExp 0 := cutExp_strictMono harg
      _ = 1 := cutExp_zero
  have h1 : (0:Cut) < 1 - cutExp (-(c * φ)) := by linarith
  have hce : 0 < c * cutExp (-(c * φ)) := _root_.mul_pos hc hepos
  have hce2 : 0 < c * cutExp (-(c * φ)) * (1 - cutExp (-(c * φ))) := _root_.mul_pos hce h1
  have : 0 < 2 * c * cutExp (-(c * φ)) * (1 - cutExp (-(c * φ))) := by nlinarith [hce2]
  exact ne_of_gt this

-- ★★ THE SELF-BLINDNESS CRITICALITY THEOREM: the fold potential has NO nonzero critical point.
theorem q_fold_criticality (c φ : Cut) (hc : 0 < c) (hφ : 0 ≤ φ)
    (hcrit : CutHasDerivAt (plateauApproachPot c) 0 φ) : φ = 0 := by
  by_contra hne
  have hφpos : 0 < φ := lt_of_le_of_ne hφ (Ne.symm hne)
  have hd := q_plateau_deriv c φ (ne_of_gt hc)
  have heq : (2 * c * cutExp (-(c * φ)) * (1 - cutExp (-(c * φ)))) = 0 :=
    hd.unique hcrit
  exact q_no_nonzero_crit c φ hc hφpos heq

end
end Phys.Foundation.ContinuumQ
