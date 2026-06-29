import Phys.Algebra.LorentzContinuumGenuineSO9Peel
import Phys.Algebra.LorentzContinuumGenerationBoostRotationSplit
import Phys.Algebra.LorentzContinuumGenerationSO8GlobalExhaustion
import Phys.Algebra.LorentzContinuumGeneralAxisRotationPath
import Phys.Algebra.LorentzContinuumGenerationSO8ReflectionDeflation

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

def octPlaneRot (e f : O Cut) (c s : Cut) : O Cut →ₗ[Cut] O Cut where
  toFun v := v + ((c - 1) * gFormC v e - s * gFormC v f) • e
               + (s * gFormC v e + (c - 1) * gFormC v f) • f
  map_add' v w := by
    simp only [gFormC_add_left]
    rw [show ((c - 1) * (gFormC v e + gFormC w e) - s * (gFormC v f + gFormC w f))
          = ((c - 1) * gFormC v e - s * gFormC v f) + ((c - 1) * gFormC w e - s * gFormC w f) by ring,
        show (s * (gFormC v e + gFormC w e) + (c - 1) * (gFormC v f + gFormC w f))
          = (s * gFormC v e + (c - 1) * gFormC v f) + (s * gFormC w e + (c - 1) * gFormC w f) by ring,
        add_smul, add_smul]
    abel
  map_smul' a v := by
    simp only [gFormC_smul_left, RingHom.id_apply, smul_add]
    rw [show ((c - 1) * (a * gFormC v e) - s * (a * gFormC v f))
          = a * ((c - 1) * gFormC v e - s * gFormC v f) by ring,
        show (s * (a * gFormC v e) + (c - 1) * (a * gFormC v f))
          = a * (s * gFormC v e + (c - 1) * gFormC v f) by ring,
        smul_smul, smul_smul]

theorem octPlaneRot_apply (e f : O Cut) (c s : Cut) (v : O Cut) :
    octPlaneRot e f c s v
      = v + ((c - 1) * gFormC v e - s * gFormC v f) • e
          + (s * gFormC v e + (c - 1) * gFormC v f) • f := rfl

theorem octPlaneRot_one_zero (e f : O Cut) : octPlaneRot e f 1 0 = LinearMap.id := by
  apply LinearMap.ext; intro v; rw [octPlaneRot_apply]; simp

theorem gFormC_twoaxis_expand (e f v w : O Cut) (α β γ δ : Cut)
    (hee : gFormC e e = 1) (hff : gFormC f f = 1) (hef : gFormC e f = 0) :
    gFormC (v + α • e + β • f) (w + γ • e + δ • f)
      = gFormC v w + γ * gFormC v e + δ * gFormC v f
        + α * gFormC w e + β * gFormC w f + α * γ + β * δ := by
  have hfe : gFormC f e = 0 := by rw [gFormC_symm]; exact hef
  simp only [gFormC_add_left, gFormC_add_right, gFormC_smul_left, gFormC_smul_right,
    hee, hff, hef, hfe]
  rw [gFormC_symm e w, gFormC_symm f w]; ring

theorem octPlaneRot_isGFormCIsom (e f : O Cut) (c s : Cut)
    (hee : gFormC e e = 1) (hff : gFormC f f = 1) (hef : gFormC e f = 0)
    (hcs : c ^ 2 + s ^ 2 = 1) :
    IsGFormCIsom (octPlaneRot e f c s) := by
  intro v w
  rw [octPlaneRot_apply, octPlaneRot_apply]
  rw [gFormC_twoaxis_expand e f v w
        ((c - 1) * gFormC v e - s * gFormC v f) (s * gFormC v e + (c - 1) * gFormC v f)
        ((c - 1) * gFormC w e - s * gFormC w f) (s * gFormC w e + (c - 1) * gFormC w f)
        hee hff hef]
  linear_combination (gFormC v e * gFormC w e + gFormC v f * gFormC w f) * hcs

/-! ## T3: the lift is a QvC-isometry fixing time and x. -/

/-- the lifted generator `octBlockEndC (octPlaneRot e f c s)` is a `QvC`-isometry. -/
theorem isQvIsomC_octBlockEndC_octPlaneRot (e f : O Cut) (c s : Cut)
    (hee : gFormC e e = 1) (hff : gFormC f f = 1) (hef : gFormC e f = 0)
    (hcs : c ^ 2 + s ^ 2 = 1) :
    IsQvIsomC (octBlockEndC (octPlaneRot e f c s)) := by
  intro p
  have hbv := octBlockEndC_isBvIsomLin (octPlaneRot_isGFormCIsom e f c s hee hff hef hcs) p p
  rw [BvC_self, BvC_self] at hbv
  exact hbv

/-! ## T4: the path. -/

/-- the cayley-steered path of lifted octonion-block plane rotations. -/
def octPlaneRotPath (e f : O Cut) (m : Cut) : Module.End Cut STVC :=
  octBlockEndC (octPlaneRot e f (cayleyC m) (cayleyS m))

theorem octPlaneRotPath_zero (e f : O Cut) : octPlaneRotPath e f 0 = 1 := by
  rw [octPlaneRotPath, cayleyC_zero, cayleyS_zero, octPlaneRot_one_zero]
  apply LinearMap.ext; intro p
  rw [octBlockEndC_apply]; rfl

theorem octPlaneRotPath_isQvIsomC (e f : O Cut)
    (hee : gFormC e e = 1) (hff : gFormC f f = 1) (hef : gFormC e f = 0) (m : Cut) :
    IsQvIsomC (octPlaneRotPath e f m) :=
  isQvIsomC_octBlockEndC_octPlaneRot e f (cayleyC m) (cayleyS m) hee hff hef (cayley_on_circle m)

theorem octPlaneRotPath_reaches (e f : O Cut) (c s : Cut)
    (h : c ^ 2 + s ^ 2 = 1) (hc : 1 + c ≠ 0) :
    octPlaneRotPath e f (s / (1 + c)) = octBlockEndC (octPlaneRot e f c s) := by
  obtain ⟨hC, hS⟩ := cayley_surj c s h hc
  rw [octPlaneRotPath, hC, hS]

theorem octPlaneRotPath_cont (e f : O Cut) : Continuous (octPlaneRotPath e f) := by
  rw [endOpC_continuous_iff]
  intro v
  have hrw : (fun m => (octPlaneRotPath e f m) v)
      = (fun m => ((v.1, v.2.1,
          v.2.2 + ((cayleyC m - 1) * gFormC v.2.2 e - cayleyS m * gFormC v.2.2 f) • e
            + (cayleyS m * gFormC v.2.2 e + (cayleyC m - 1) * gFormC v.2.2 f) • f) : STVC)) := by
    funext m
    rw [octPlaneRotPath, octBlockEndC_apply, octPlaneRot_apply]
  rw [hrw]
  apply Continuous.prodMk continuous_const
  apply Continuous.prodMk continuous_const
  apply Continuous.add
  apply Continuous.add continuous_const
  · apply Continuous.smul _ continuous_const
    exact ((cayleyC_continuous.sub continuous_const).mul continuous_const).sub
      (cayleyS_continuous.mul continuous_const)
  · apply Continuous.smul _ continuous_const
    exact (cayleyS_continuous.mul continuous_const).add
      ((cayleyC_continuous.sub continuous_const).mul continuous_const)

theorem octPlaneRotPath_image_preconnected (e f : O Cut) (m : Cut) :
    IsPreconnected (octPlaneRotPath e f '' (Set.uIcc 0 m)) :=
  (isPreconnected_uIcc).image _ (octPlaneRotPath_cont e f).continuousOn

/-! ## T5: THE CORE — the lifted generator is JoinedIdQvC (non-vacuous). -/

/-- ★★ T5 — the lifted octonion-block plane rotation `octBlockEndC (octPlaneRot e f c s)`
    (x-fixing, time-fixing) is `JoinedIdQvC` (non-vacuously). -/
theorem joinedIdQvC_octBlockEndC_octPlaneRot (e f : O Cut) (c s : Cut)
    (hee : gFormC e e = 1) (hff : gFormC f f = 1) (hef : gFormC e f = 0)
    (hcs : c ^ 2 + s ^ 2 = 1) (hc : 1 + c ≠ 0) :
    JoinedIdQvC (octBlockEndC (octPlaneRot e f c s)) := by
  refine ⟨octPlaneRotPath e f '' (Set.uIcc 0 (s / (1 + c))), ?_,
    octPlaneRotPath_image_preconnected e f _, ?_, ?_⟩
  · rintro x ⟨m, _, rfl⟩
    exact octPlaneRotPath_isQvIsomC e f hee hff hef m
  · exact ⟨0, Set.left_mem_uIcc, octPlaneRotPath_zero e f⟩
  · exact ⟨s / (1 + c), Set.right_mem_uIcc, octPlaneRotPath_reaches e f c s hcs hc⟩

end
end Phys.Algebra
