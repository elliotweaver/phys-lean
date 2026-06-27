import Phys.Algebra.LorentzContinuumMetricCondition

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

variable {g h : Module.End Cut STVC}

/-- ITEM 1 — THE CONVERSE of N90: the operator metric condition `h∘J∘g = J` FORCES `g` to be a
    `QvC`-isometry. Same EvC↔BvC bridge run the other way. -/
theorem metric_condition_imp_isQvIsom
    (H : IsEvCAdjoint g h) (hmc : h.comp (sigOpC.comp g) = sigOpC) :
    IsQvIsomC g := by
  intro p
  have key : QvC (g p) = QvC p := by
    rw [← BvC_self (g p), ← BvC_self p]
    rw [BvC_eq_EvC_sigOpC (g p) (g p), BvC_eq_EvC_sigOpC p p]
    -- EvC (g p) (sigOpC (g p)) = EvC p (h (sigOpC (g p)))  by adjoint
    rw [H p (sigOpC (g p))]
    -- now: EvC p (h (sigOpC (g p))) = EvC p (sigOpC p)
    -- h (sigOpC (g p)) = (h∘J∘g) p = sigOpC p
    have : h (sigOpC (g p)) = sigOpC p := by
      have := congrArg (fun (f : Module.End Cut STVC) => f p) hmc
      simpa only [LinearMap.comp_apply] using this
    rw [this]
  exact key

/-- ITEM 2 — adjoint right-uniqueness via EvC right-nondegeneracy. -/
theorem isEvCAdjoint_right_unique {h₁ h₂ : Module.End Cut STVC}
    (H1 : IsEvCAdjoint g h₁) (H2 : IsEvCAdjoint g h₂) : h₁ = h₂ := by
  apply LinearMap.ext; intro q
  apply EvC_right_nondegen
  intro p
  rw [← H1 p q, ← H2 p q]

/-- `J = sigOpC` is injective (it is an involution). -/
theorem sigOpC_injective : Function.Injective (sigOpC : Module.End Cut STVC) := by
  intro p q hpq
  have := congrArg sigOpC hpq
  rw [← LinearMap.comp_apply, ← LinearMap.comp_apply, sigOpC_comp_self] at this
  simpa using this

/-- ITEM 3 — a linear isometry with an EvC-adjoint is injective (from `h∘J∘g = J` + `J` inj). -/
theorem linIsom_injective (hg : IsQvIsomC g) (H : IsEvCAdjoint g h) :
    Function.Injective g := by
  have hmc := linIsom_metric_condition hg H
  -- h∘J∘g = J ; J injective ; so J∘g injective ; so g injective
  intro p q hpq
  apply sigOpC_injective
  have e1 : (h.comp (sigOpC.comp g)) p = sigOpC p := by rw [hmc]
  have e2 : (h.comp (sigOpC.comp g)) q = sigOpC q := by rw [hmc]
  simp only [LinearMap.comp_apply] at e1 e2
  rw [← e1, ← e2, hpq]

/-- ITEM 4 — the full characterization for a linear `g` with EvC-adjoint `h`. -/
theorem isQvIsom_iff_metric_condition (H : IsEvCAdjoint g h) :
    IsQvIsomC g ↔ h.comp (sigOpC.comp g) = sigOpC :=
  ⟨fun hg => linIsom_metric_condition hg H, metric_condition_imp_isQvIsom H⟩

/-- ITEM 6 MEASURE — does FiniteDimensional Cut STVC resolve, enabling bijectivity? -/
example : Module.Finite Cut STVC := by infer_instance

end

end Phys.Algebra
