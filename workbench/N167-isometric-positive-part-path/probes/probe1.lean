import Phys.Algebra.LorentzContinuumPositivePartDissolution

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-- PROBE 1: the reciprocal / metric characterization of a self-adjoint isometry.
    `p` EvC-self-adjoint + `QvC`-isometry ⟹ `p ∘ J ∘ p = J`. -/
theorem evCSymm_isQvIsomC_recip {p : Module.End Cut STVC}
    (hsymm : IsEvCSymm p) (hisom : IsQvIsomC (p : STVC → STVC)) :
    p.comp (sigOpC.comp p) = sigOpC :=
  (isQvIsom_iff_metric_condition (g := p) (h := p) hsymm).mp hisom

/-- PROBE 2: the J-conjugation inverts p: `(J ∘ p ∘ J) ∘ p = id`, i.e. `J p J = p⁻¹`. -/
theorem evCSymm_isQvIsomC_Jconj_inv {p : Module.End Cut STVC}
    (hsymm : IsEvCSymm p) (hisom : IsQvIsomC (p : STVC → STVC)) :
    (sigOpC.comp (p.comp sigOpC)).comp p = LinearMap.id := by
  have hmc := evCSymm_isQvIsomC_recip hsymm hisom
  apply LinearMap.ext; intro v
  simp only [LinearMap.comp_apply, LinearMap.id_apply]
  -- p (sigOpC (p v)) = sigOpC v  from the metric condition
  have hpoint : p (sigOpC (p v)) = sigOpC v := by
    have := congrArg (fun (f : Module.End Cut STVC) => f v) hmc
    simpa only [LinearMap.comp_apply] using this
  rw [hpoint, ← LinearMap.comp_apply, sigOpC_comp_self, LinearMap.id_apply]

/-- PROBE 3: APPLICATION — the positive-part factor `p` of the converse polar decomposition of an
    arbitrary BvC-isometry satisfies the reciprocal characterization `p ∘ J ∘ p = J`. -/
theorem bvIsomLin_polar_part_recip {S : Module.End Cut STVC} (hS : IsBvIsomLin S) :
    ∃ (k p : Module.End Cut STVC),
      IsQvIsomC (k : STVC → STVC) ∧ IsEvCSymm p ∧ (∀ q, 0 ≤ EvC (p q) q) ∧
      IsQvIsomC (p : STVC → STVC) ∧ k * p = S ∧
      p.comp (sigOpC.comp p) = sigOpC := by
  obtain ⟨k, p, hk, hsymm, hpos, hpisom, hkp⟩ := bvIsomLin_polar_part_isQvIsomC hS
  exact ⟨k, p, hk, hsymm, hpos, hpisom, hkp, evCSymm_isQvIsomC_recip hsymm hpisom⟩

/-- PROBE 4: W8 NON-VACUITY — the positive part of the concrete boost (5/3,4/3) satisfies the
    reciprocal characterization with a genuine non-identity operator. -/
theorem polarPart_recip_nonvac :
    ∃ (k p : Module.End Cut STVC),
      IsQvIsomC (p : STVC → STVC) ∧ k * p = boostEndC ((5:Cut)/3) ((4:Cut)/3) ∧
      p.comp (sigOpC.comp p) = sigOpC := by
  have hab : ((5:Cut)/3) ^ 2 - ((4:Cut)/3) ^ 2 = 1 := by ring
  obtain ⟨k, p, _, _, _, hpisom, hkp, hrecip⟩ :=
    bvIsomLin_polar_part_recip (boostEndC_isBvIsomLin hab)
  exact ⟨k, p, hpisom, hkp, hrecip⟩

end

end Phys.Algebra
