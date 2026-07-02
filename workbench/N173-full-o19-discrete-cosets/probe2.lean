import Phys.Algebra.LorentzContinuumSO9UnconditionalClosure
import Mathlib.LinearAlgebra.Determinant

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! ## The three discrete sign-flip witnesses. -/

/-- Parity: flip the 9 spatial directions (x and v), fix time t. -/
def parityLin : Module.End Cut STVC :=
  LinearMap.prodMap (LinearMap.id : Cut →ₗ[Cut] Cut)
    (LinearMap.prodMap (-(LinearMap.id) : Cut →ₗ[Cut] Cut) (-(LinearMap.id) : O Cut →ₗ[Cut] O Cut))

/-- Time reversal: flip time t, fix the 9 spatial directions. -/
def timeRevLin : Module.End Cut STVC :=
  LinearMap.prodMap (-(LinearMap.id) : Cut →ₗ[Cut] Cut)
    (LinearMap.id : (Cut × O Cut) →ₗ[Cut] (Cut × O Cut))

/-- PT: flip everything. -/
def ptLin : Module.End Cut STVC :=
  LinearMap.prodMap (-(LinearMap.id) : Cut →ₗ[Cut] Cut)
    (LinearMap.prodMap (-(LinearMap.id) : Cut →ₗ[Cut] Cut) (-(LinearMap.id) : O Cut →ₗ[Cut] O Cut))

@[simp] theorem parityLin_apply (p : STVC) : parityLin p = (p.1, -p.2.1, -p.2.2) := rfl
@[simp] theorem timeRevLin_apply (p : STVC) : timeRevLin p = (-p.1, p.2.1, p.2.2) := rfl
@[simp] theorem ptLin_apply (p : STVC) : ptLin p = (-p.1, -p.2.1, -p.2.2) := rfl

/-! ## Determinants. -/

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

theorem det_ptLin : LinearMap.det ptLin = 1 := by
  rw [ptLin, LinearMap.det_prodMap, det_negId_Cut, LinearMap.det_prodMap, det_negId_Cut,
    det_negId_OCut]; ring

/-! ## Isometries. -/

theorem isQvIsomC_parityLin : IsQvIsomC (parityLin : STVC → STVC) := by
  intro p; obtain ⟨t, x, v⟩ := p
  show QvC (t, -x, -v) = QvC (t, x, v)
  unfold QvC QformC gFormC
  simp only [star_neg, neg_mul_neg]
  ring

theorem isQvIsomC_timeRevLin : IsQvIsomC (timeRevLin : STVC → STVC) := by
  intro p; obtain ⟨t, x, v⟩ := p
  show QvC (-t, x, v) = QvC (t, x, v)
  unfold QvC QformC; ring

theorem isQvIsomC_ptLin : IsQvIsomC (ptLin : STVC → STVC) := by
  intro p; obtain ⟨t, x, v⟩ := p
  show QvC (-t, -x, -v) = QvC (t, x, v)
  unfold QvC QformC gFormC
  simp only [star_neg, neg_mul_neg]
  ring

/-! ## Klein-four relations. -/

theorem parityLin_sq : parityLin * parityLin = 1 := by
  apply LinearMap.ext; intro p; rw [Module.End.mul_apply]
  obtain ⟨t, x, v⟩ := p; simp

theorem timeRevLin_sq : timeRevLin * timeRevLin = 1 := by
  apply LinearMap.ext; intro p; rw [Module.End.mul_apply]
  obtain ⟨t, x, v⟩ := p; simp

theorem parity_timeRev_comm : parityLin * timeRevLin = timeRevLin * parityLin := by
  apply LinearMap.ext; intro p; rw [Module.End.mul_apply, Module.End.mul_apply]
  obtain ⟨t, x, v⟩ := p; simp

theorem ptLin_eq : ptLin = parityLin * timeRevLin := by
  apply LinearMap.ext; intro p; rw [Module.End.mul_apply]
  obtain ⟨t, x, v⟩ := p; simp

end

end Phys.Algebra
