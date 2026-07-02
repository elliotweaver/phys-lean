import Phys.Algebra.LorentzContinuumPositivePartReciprocal

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-- PROBE: the general-axis boost in the t–ŵ plane, ŵ = (wx, wv) a spatial direction in
    (Cut × O Cut). σ = wx·x + gFormC v wv (ŵ-component of the spatial part), δ = b·t + (a−1)·σ. -/
def genBoostLin (wx : Cut) (wv : O Cut) (a b : Cut) : Module.End Cut STVC where
  toFun p := (a * p.1 + b * (wx * p.2.1 + gFormC p.2.2 wv),
              p.2.1 + (b * p.1 + (a - 1) * (wx * p.2.1 + gFormC p.2.2 wv)) * wx,
              p.2.2 + (b * p.1 + (a - 1) * (wx * p.2.1 + gFormC p.2.2 wv)) • wv)
  map_add' p q := by
    refine Prod.ext ?_ (Prod.ext ?_ ?_)
    · show a * (p.1 + q.1) + b * (wx * (p.2.1 + q.2.1) + gFormC (p.2.2 + q.2.2) wv)
          = (a * p.1 + b * (wx * p.2.1 + gFormC p.2.2 wv))
            + (a * q.1 + b * (wx * q.2.1 + gFormC q.2.2 wv))
      rw [gFormC_add_left]; ring
    · show (p.2.1 + q.2.1)
            + (b * (p.1 + q.1) + (a - 1) * (wx * (p.2.1 + q.2.1) + gFormC (p.2.2 + q.2.2) wv)) * wx
          = (p.2.1 + (b * p.1 + (a - 1) * (wx * p.2.1 + gFormC p.2.2 wv)) * wx)
            + (q.2.1 + (b * q.1 + (a - 1) * (wx * q.2.1 + gFormC q.2.2 wv)) * wx)
      rw [gFormC_add_left]; ring
    · show (p.2.2 + q.2.2)
            + (b * (p.1 + q.1) + (a - 1) * (wx * (p.2.1 + q.2.1) + gFormC (p.2.2 + q.2.2) wv)) • wv
          = (p.2.2 + (b * p.1 + (a - 1) * (wx * p.2.1 + gFormC p.2.2 wv)) • wv)
            + (q.2.2 + (b * q.1 + (a - 1) * (wx * q.2.1 + gFormC q.2.2 wv)) • wv)
      rw [gFormC_add_left]
      rw [show (b * (p.1 + q.1) + (a - 1) * (wx * (p.2.1 + q.2.1) + (gFormC p.2.2 wv + gFormC q.2.2 wv)))
            = (b * p.1 + (a - 1) * (wx * p.2.1 + gFormC p.2.2 wv))
              + (b * q.1 + (a - 1) * (wx * q.2.1 + gFormC q.2.2 wv)) by ring]
      rw [add_smul]; abel
  map_smul' r p := by
    refine Prod.ext ?_ (Prod.ext ?_ ?_)
    · show a * (r • p.1) + b * (wx * (r • p.2.1) + gFormC (r • p.2.2) wv)
          = r • (a * p.1 + b * (wx * p.2.1 + gFormC p.2.2 wv))
      rw [gFormC_smul_left]; simp only [smul_eq_mul]; ring
    · show (r • p.2.1) + (b * (r • p.1) + (a - 1) * (wx * (r • p.2.1) + gFormC (r • p.2.2) wv)) * wx
          = r • (p.2.1 + (b * p.1 + (a - 1) * (wx * p.2.1 + gFormC p.2.2 wv)) * wx)
      rw [gFormC_smul_left]; simp only [smul_eq_mul]; ring
    · show (r • p.2.2) + (b * (r • p.1) + (a - 1) * (wx * (r • p.2.1) + gFormC (r • p.2.2) wv)) • wv
          = r • (p.2.2 + (b * p.1 + (a - 1) * (wx * p.2.1 + gFormC p.2.2 wv)) • wv)
      rw [gFormC_smul_left, smul_add, smul_smul]
      rw [show b * (r • p.1) + (a - 1) * (wx * (r • p.2.1) + r * gFormC p.2.2 wv)
            = r * (b * p.1 + (a - 1) * (wx * p.2.1 + gFormC p.2.2 wv)) by
              simp only [smul_eq_mul]; ring]

theorem genBoostLin_apply (wx : Cut) (wv : O Cut) (a b : Cut) (p : STVC) :
    genBoostLin wx wv a b p
      = (a * p.1 + b * (wx * p.2.1 + gFormC p.2.2 wv),
         p.2.1 + (b * p.1 + (a - 1) * (wx * p.2.1 + gFormC p.2.2 wv)) * wx,
         p.2.2 + (b * p.1 + (a - 1) * (wx * p.2.1 + gFormC p.2.2 wv)) • wv) := rfl

/-- At ŵ = (1, 0) the general-axis boost IS the t–x boost `boostEndC a b`. -/
theorem genBoostLin_eq_boostEndC (a b : Cut) :
    genBoostLin (1 : Cut) (0 : O Cut) a b = boostEndC a b := by
  apply LinearMap.ext; intro p
  rw [genBoostLin_apply, boostEndC_apply]
  refine Prod.ext ?_ (Prod.ext ?_ ?_)
  · show a * p.1 + b * (1 * p.2.1 + gFormC p.2.2 0) = a * p.1 + b * p.2.1
    rw [gFormC_zero_right']; ring
  · show p.2.1 + (b * p.1 + (a - 1) * (1 * p.2.1 + gFormC p.2.2 0)) * 1 = b * p.1 + a * p.2.1
    rw [gFormC_zero_right']; ring
  · show p.2.2 + (b * p.1 + (a - 1) * (1 * p.2.1 + gFormC p.2.2 0)) • (0 : O Cut) = p.2.2
    rw [smul_zero, add_zero]

/-- The general-axis boost is a QvC-isometry for a UNIT spatial direction ŵ (wx²+gFormC wv wv=1)
    and a²−b²=1. -/
theorem genBoostLin_isQvIsomC (wx : Cut) (wv : O Cut)
    (hw : wx ^ 2 + gFormC wv wv = 1) {a b : Cut} (hab : a ^ 2 - b ^ 2 = 1) :
    IsQvIsomC (genBoostLin wx wv a b) := by
  intro p
  obtain ⟨t, x, v⟩ := p
  rw [genBoostLin_apply]
  show QvC (a * t + b * (wx * x + gFormC v wv),
            x + (b * t + (a - 1) * (wx * x + gFormC v wv)) * wx,
            v + (b * t + (a - 1) * (wx * x + gFormC v wv)) • wv) = QvC (t, x, v)
  unfold QvC QformC
  simp only
  rw [gFormC_add_axis_self wv v (b * t + (a - 1) * (wx * x + gFormC v wv))]
  linear_combination (t ^ 2 - (wx * x + gFormC v wv) ^ 2) * hab
    - (b * t + (a - 1) * (wx * x + gFormC v wv)) ^ 2 * hw

/-! ## The cutSqrt-steered hyperbolic path of general-axis boosts. -/

/-- The general-axis hyperbolic boost path: `genBoostLin wx wv (cutSqrt(1+m²)) m`. -/
def genBoostPath (wx : Cut) (wv : O Cut) (m : Cut) : Module.End Cut STVC :=
  genBoostLin wx wv (cutSqrt (1 + m ^ 2)) m

theorem genBoostPath_iso (m : Cut) : (cutSqrt (1 + m ^ 2)) ^ 2 - m ^ 2 = 1 := by
  nlinarith [cutSqrt_sq (show (0:Cut) ≤ 1 + m^2 by positivity)]

theorem genBoostPath_zero (wx : Cut) (wv : O Cut) : genBoostPath wx wv 0 = 1 := by
  rw [genBoostPath, show (1:Cut) + (0:Cut)^2 = 1 by ring, cutSqrt_one]
  apply LinearMap.ext; intro p
  rw [genBoostLin_apply]
  show ((1:Cut) * p.1 + (0:Cut) * (wx * p.2.1 + gFormC p.2.2 wv),
        p.2.1 + ((0:Cut) * p.1 + ((1:Cut) - 1) * (wx * p.2.1 + gFormC p.2.2 wv)) * wx,
        p.2.2 + ((0:Cut) * p.1 + ((1:Cut) - 1) * (wx * p.2.1 + gFormC p.2.2 wv)) • wv) = p
  simp only [one_mul, zero_mul, sub_self, zero_add, add_zero, zero_smul]

theorem genBoostPath_isQvIsomC (wx : Cut) (wv : O Cut)
    (hw : wx ^ 2 + gFormC wv wv = 1) (m : Cut) :
    IsQvIsomC (genBoostPath wx wv m) :=
  genBoostLin_isQvIsomC wx wv hw (genBoostPath_iso m)

theorem genBoostPath_reaches (wx : Cut) (wv : O Cut) {a b : Cut}
    (hab : a ^ 2 - b ^ 2 = 1) (ha : 0 < a) :
    genBoostPath wx wv b = genBoostLin wx wv a b := by
  rw [genBoostPath]
  have hr : cutSqrt (1 + b ^ 2) = a := by
    have h1b : (1:Cut) + b ^ 2 = a ^ 2 := by nlinarith [hab]
    rw [h1b]
    exact (cutSqrt_unique (le_of_lt ha) (by ring)).symm
  rw [hr]

theorem genBoostPath_cont (wx : Cut) (wv : O Cut) : Continuous (genBoostPath wx wv) := by
  rw [endOpC_continuous_iff]
  intro v
  have hrw : (fun m => (genBoostPath wx wv m) v)
      = (fun m => ((cutSqrt (1 + m ^ 2) * v.1 + m * (wx * v.2.1 + gFormC v.2.2 wv),
          v.2.1 + (m * v.1 + (cutSqrt (1 + m ^ 2) - 1) * (wx * v.2.1 + gFormC v.2.2 wv)) * wx,
          v.2.2 + (m * v.1 + (cutSqrt (1 + m ^ 2) - 1) * (wx * v.2.1 + gFormC v.2.2 wv)) • wv) : STVC)) := by
    funext m
    rw [genBoostPath, genBoostLin_apply]
  rw [hrw]
  have hcs : Continuous (fun m : Cut => cutSqrt (1 + m ^ 2)) := cutSqrt_one_add_sq_cont
  apply Continuous.prodMk
  · exact (hcs.mul continuous_const).add (continuous_id.mul continuous_const)
  apply Continuous.prodMk
  · exact continuous_const.add
      (((continuous_id.mul continuous_const).add
        ((hcs.sub continuous_const).mul continuous_const)).mul continuous_const)
  · apply Continuous.add continuous_const
    apply Continuous.smul _ continuous_const
    exact (continuous_id.mul continuous_const).add
      ((hcs.sub continuous_const).mul continuous_const)

theorem genBoostPath_image_preconnected (wx : Cut) (wv : O Cut) (m : Cut) :
    IsPreconnected (genBoostPath wx wv '' (Set.uIcc 0 m)) :=
  (isPreconnected_uIcc).image _ (genBoostPath_cont wx wv).continuousOn

/-- ★★ THE GENERAL-AXIS BOOST FACTOR is the NON-VACUOUS `JoinedIdQvC` (unit ŵ, a²−b²=1, 0<a). -/
theorem joinedIdQvC_genBoostLin (wx : Cut) (wv : O Cut)
    (hw : wx ^ 2 + gFormC wv wv = 1) {a b : Cut} (hab : a ^ 2 - b ^ 2 = 1) (ha : 0 < a) :
    JoinedIdQvC (genBoostLin wx wv a b) := by
  refine ⟨genBoostPath wx wv '' (Set.uIcc 0 b), ?_,
    genBoostPath_image_preconnected wx wv b, ?_, ?_⟩
  · rintro x ⟨m, _, rfl⟩
    exact genBoostPath_isQvIsomC wx wv hw m
  · exact ⟨0, Set.left_mem_uIcc, genBoostPath_zero wx wv⟩
  · exact ⟨b, Set.right_mem_uIcc, genBoostPath_reaches wx wv hab ha⟩

end

end Phys.Algebra
