import Phys.Algebra.LorentzContinuumCompactPart

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-- The signature involution operator `J : (t,x,v) ↦ (t,-x,-v)`. -/
def sigOpC : Module.End Cut STVC where
  toFun p := (p.1, -p.2.1, -p.2.2)
  map_add' p q := by
    refine Prod.ext (by simp) (Prod.ext (by simp) ?_)
    show -(p.2.2 + q.2.2) = -p.2.2 + -q.2.2
    rw [neg_add]
  map_smul' c p := by
    refine Prod.ext (by simp) (Prod.ext (by simp) ?_)
    show -(c • p.2.2) = c • -p.2.2
    rw [smul_neg]

theorem sigOpC_apply (p : STVC) : sigOpC p = (p.1, -p.2.1, -p.2.2) := rfl

/-- J∘J = id (involution). -/
theorem sigOpC_comp_self : sigOpC.comp sigOpC = LinearMap.id := by
  apply LinearMap.ext; intro p
  simp only [LinearMap.comp_apply, LinearMap.id_coe, id_eq, sigOpC_apply, neg_neg]

/-- J is its own EvC-adjoint (EvC-self-adjoint). -/
theorem sigOpC_isEvCAdjoint_self : IsEvCAdjoint sigOpC sigOpC := by
  intro p q
  obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', v'⟩ := q
  show t * t' + (-x) * x' + gFormC (-v) v' = t * t' + x * (-x') + gFormC v (-v')
  rw [gFormC_neg_left, show gFormC v (-v') = - gFormC v v' by
        rw [gFormC_symm v (-v'), gFormC_neg_left, gFormC_symm v' v]]
  ring

/-- THE METRIC-OPERATOR BRIDGE: `BvC p q = EvC p (J q)`. -/
theorem BvC_eq_EvC_sigOpC (p q : STVC) : BvC p q = EvC p (sigOpC q) := by
  obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', v'⟩ := q
  show t * t' - x * x' - gFormC v v' = t * t' + x * (-x') + gFormC v (-v')
  rw [show gFormC v (-v') = - gFormC v v' by
        rw [gFormC_symm v (-v'), gFormC_neg_left, gFormC_symm v' v]]
  ring

/-- THE POLARIZATION of the Born form: `QvC (p+q) = QvC p + QvC q + 2·BvC p q`. -/
theorem QvC_polariz (p q : STVC) : QvC (p + q) = QvC p + QvC q + 2 * BvC p q := by
  obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', v'⟩ := q
  show QformC (t + t') (x + x') (v + v') = QformC t x v + QformC t' x' v' + 2 * (t * t' - x * x' - gFormC v v')
  unfold QformC
  rw [gFormC_add_left, gFormC_add_right, gFormC_add_right, gFormC_symm v' v]
  ring

/-- EvC is nondegenerate in the right slot: `(∀ p, EvC p X = EvC p Y) → X = Y`. -/
theorem EvC_right_nondegen {X Y : STVC} (h : ∀ p, EvC p X = EvC p Y) : X = Y := by
  have hz : EvC (X - Y) (X - Y) = 0 := by
    rw [EvC_sub_right, EvC_symm (X - Y) X, EvC_symm (X - Y) Y, h X, h Y]
    rw [EvC_sub_right, EvC_sub_right]
    ring
  have := (EvC_eq_zero_iff (X - Y)).mp hz
  exact sub_eq_zero.mp this

/-- A LINEAR isometry preserves the polarized Minkowski form: `BvC (g p)(g q) = BvC p q`. -/
theorem linIsom_BvC_preserved {g : Module.End Cut STVC} (hg : IsQvIsomC g) (p q : STVC) :
    BvC (g p) (g q) = BvC p q := by
  have h2 : (2 : Cut) * BvC (g p) (g q) = 2 * BvC p q := by
    have h1 := QvC_polariz (g p) (g q)
    have hadd : g (p + q) = g p + g q := map_add g p q
    rw [← hadd, hg (p + q), hg p, hg q] at h1
    have h0 := QvC_polariz p q
    linarith [h1, h0]
  exact mul_left_cancel₀ (two_ne_zero) h2

/-- ★ THE OPERATOR LORENTZ METRIC CONDITION `gᵀ J g = J`: for a LINEAR isometry `g`
    (`IsQvIsomC g`) with EvC-adjoint `h`, `h ∘ J ∘ g = J`. -/
theorem linIsom_metric_condition {g h : Module.End Cut STVC}
    (hg : IsQvIsomC g) (H : IsEvCAdjoint g h) :
    h.comp (sigOpC.comp g) = sigOpC := by
  apply LinearMap.ext; intro q
  apply EvC_right_nondegen
  intro p
  simp only [LinearMap.comp_apply]
  -- LHS: EvC p (h (sigOpC (g q))) ; RHS: EvC p (sigOpC q)
  rw [← H p (sigOpC (g q))]
  -- now: EvC (g p) (sigOpC (g q)) = EvC p (sigOpC q)
  rw [← BvC_eq_EvC_sigOpC (g p) (g q), ← BvC_eq_EvC_sigOpC p q]
  exact linIsom_BvC_preserved hg p q

/-- The boost as a `Module.End`. -/
def boostEndC (a b : Cut) : Module.End Cut STVC where
  toFun p := (a * p.1 + b * p.2.1, b * p.1 + a * p.2.1, p.2.2)
  map_add' p q := by
    refine Prod.ext ?_ (Prod.ext ?_ ?_)
    · show a * (p.1 + q.1) + b * (p.2.1 + q.2.1) = (a * p.1 + b * p.2.1) + (a * q.1 + b * q.2.1); ring
    · show b * (p.1 + q.1) + a * (p.2.1 + q.2.1) = (b * p.1 + a * p.2.1) + (b * q.1 + a * q.2.1); ring
    · show p.2.2 + q.2.2 = p.2.2 + q.2.2; rfl
  map_smul' c p := by
    refine Prod.ext ?_ (Prod.ext ?_ ?_)
    · show a * (c • p.1) + b * (c • p.2.1) = c • (a * p.1 + b * p.2.1)
      simp only [smul_eq_mul]; ring
    · show b * (c • p.1) + a * (c • p.2.1) = c • (b * p.1 + a * p.2.1)
      simp only [smul_eq_mul]; ring
    · show p.2.2 = c • p.2.2 → True; intro; trivial

theorem boostEndC_apply (a b : Cut) (p : STVC) :
    boostEndC a b p = (a * p.1 + b * p.2.1, b * p.1 + a * p.2.1, p.2.2) := rfl

/-- The boost is a QvC-isometry when `a² − b² = 1`. -/
theorem boostEndC_isQvIsomC {a b : Cut} (hab : a ^ 2 - b ^ 2 = 1) :
    IsQvIsomC (boostEndC a b) := by
  intro p
  show QvC (boostFunC a b p) = QvC p
  exact boostC_isom hab p

/-- The boost is its OWN EvC-adjoint. -/
theorem boostEndC_isEvCAdjoint_self (a b : Cut) :
    IsEvCAdjoint (boostEndC a b) (boostEndC a b) := by
  intro p q
  obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', v'⟩ := q
  show (a * t + b * x) * t' + (b * t + a * x) * x' + gFormC v v'
      = t * (a * t' + b * x') + x * (b * t' + a * x') + gFormC v v'
  ring

/-- ★ NON-VACUITY (W8): a CONCRETE boost (`a² − b² = 1`) satisfies the operator Lorentz
    metric condition `gᵀ J g = J`. -/
theorem boostEndC_metric_condition {a b : Cut} (hab : a ^ 2 - b ^ 2 = 1) :
    (boostEndC a b).comp (sigOpC.comp (boostEndC a b)) = sigOpC :=
  linIsom_metric_condition (boostEndC_isQvIsomC hab) (boostEndC_isEvCAdjoint_self a b)

end

end Phys.Algebra
