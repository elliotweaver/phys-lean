import Phys.Algebra.LorentzContinuumSO9UnconditionalClosure
import Mathlib.LinearAlgebra.Determinant

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- reuse from probe2 (inline minimal)
def parityLin : Module.End Cut STVC :=
  LinearMap.prodMap (LinearMap.id : Cut →ₗ[Cut] Cut)
    (LinearMap.prodMap (-(LinearMap.id) : Cut →ₗ[Cut] Cut) (-(LinearMap.id) : O Cut →ₗ[Cut] O Cut))
def timeRevLin : Module.End Cut STVC :=
  LinearMap.prodMap (-(LinearMap.id) : Cut →ₗ[Cut] Cut)
    (LinearMap.id : (Cut × O Cut) →ₗ[Cut] (Cut × O Cut))
@[simp] theorem parityLin_apply (p : STVC) : parityLin p = (p.1, -p.2.1, -p.2.2) := rfl
@[simp] theorem timeRevLin_apply (p : STVC) : timeRevLin p = (-p.1, p.2.1, p.2.2) := rfl

theorem det_negId_Cut : LinearMap.det (-(LinearMap.id) : Cut →ₗ[Cut] Cut) = -1 := by
  rw [show (-(LinearMap.id) : Cut →ₗ[Cut] Cut) = (-1 : Cut) • LinearMap.id from (neg_one_smul _ _).symm,
    LinearMap.det_smul, LinearMap.det_id, Module.finrank_self]; ring
theorem det_negId_OCut : LinearMap.det (-(LinearMap.id) : O Cut →ₗ[Cut] O Cut) = 1 := by
  rw [show (-(LinearMap.id) : O Cut →ₗ[Cut] O Cut) = (-1 : Cut) • LinearMap.id from (neg_one_smul _ _).symm,
    LinearMap.det_smul, LinearMap.det_id, finrank_O_eq_eight_Cut]; norm_num
theorem det_parityLin : LinearMap.det parityLin = -1 := by
  rw [parityLin, LinearMap.det_prodMap, LinearMap.det_id, one_mul, LinearMap.det_prodMap,
    det_negId_Cut, det_negId_OCut]; ring
theorem det_timeRevLin : LinearMap.det timeRevLin = -1 := by
  rw [timeRevLin, LinearMap.det_prodMap, det_negId_Cut, LinearMap.det_id, mul_one]
theorem isQvIsomC_parityLin : IsQvIsomC (parityLin : STVC → STVC) := by
  intro p; obtain ⟨t, x, v⟩ := p
  show QvC (t, -x, -v) = QvC (t, x, v)
  unfold QvC QformC gFormC; simp only [star_neg, neg_mul_neg]; ring
theorem isQvIsomC_timeRevLin : IsQvIsomC (timeRevLin : STVC → STVC) := by
  intro p; obtain ⟨t, x, v⟩ := p
  show QvC (-t, x, v) = QvC (t, x, v)
  unfold QvC QformC; ring

/-! ## Orthochronicity signs: (P e₀).1 = 1 ≥ 0, (T e₀).1 = -1 < 0. -/

theorem parityLin_e0_time : (parityLin ((1:Cut), (0:Cut), (0:O Cut))).1 = 1 := by
  rw [parityLin_apply]
theorem timeRevLin_e0_time : (timeRevLin ((1:Cut), (0:Cut), (0:O Cut))).1 = -1 := by
  rw [timeRevLin_apply]

/-! ## det of a product (det multiplicative over Module.End). -/
-- check det_mul name
example (a b : Module.End Cut STVC) : LinearMap.det (a * b) = LinearMap.det a * LinearMap.det b :=
  LinearMap.det_mul a b

/-! ## THE REDUCTION — det p = 1 ∨ det p = -1, orthochronous or not ⟹ a discrete witness
     lands p in the identity component. The 4 cases:
     - det = 1, ortho:        p ∈ Id (N172 directly)
     - det = 1, non-ortho:    timeRev * p is det = -1... wait. Need care. -/

-- A QvC-isometry preserves QvC(e₀) = 1 > 0, so (p e₀) is "timelike"; its time component is nonzero.
-- Orthochronous means (p e₀).1 ≥ 0. If not orthochronous, (p e₀).1 ≤ 0 (≠ 0 by timelike), so < 0,
-- and (timeRev * p) has time component -(p e₀).1 ≥ 0... let me check timeRev∘p e₀ .1.
-- (timeRev (p e₀)).1 = -(p e₀).1. So if (p e₀).1 < 0 then -(p e₀).1 > 0 ⟹ orthochronous.
-- det(timeRev * p) = (-1)*det p.

-- The clean target: characterize O(1,9) membership as det = ±1, and reduce.
-- I'll do the reduction assuming hortho : 0 ≤ (p e₀).1 ∨ (p e₀).1 ≤ 0  (a tautology via le_total).

end

end Phys.Algebra
