import Phys.Algebra.LorentzContinuumSO9UnconditionalClosure
import Mathlib.LinearAlgebra.Determinant

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

def parityLin : Module.End Cut STVC :=
  LinearMap.prodMap (LinearMap.id : Cut →ₗ[Cut] Cut)
    (LinearMap.prodMap (-(LinearMap.id) : Cut →ₗ[Cut] Cut) (-(LinearMap.id) : O Cut →ₗ[Cut] O Cut))
def timeRevLin : Module.End Cut STVC :=
  LinearMap.prodMap (-(LinearMap.id) : Cut →ₗ[Cut] Cut)
    (LinearMap.id : (Cut × O Cut) →ₗ[Cut] (Cut × O Cut))
def ptLin : Module.End Cut STVC :=
  LinearMap.prodMap (-(LinearMap.id) : Cut →ₗ[Cut] Cut)
    (LinearMap.prodMap (-(LinearMap.id) : Cut →ₗ[Cut] Cut) (-(LinearMap.id) : O Cut →ₗ[Cut] O Cut))
@[simp] theorem parityLin_apply (p : STVC) : parityLin p = (p.1, -p.2.1, -p.2.2) := rfl
@[simp] theorem timeRevLin_apply (p : STVC) : timeRevLin p = (-p.1, p.2.1, p.2.2) := rfl
@[simp] theorem ptLin_apply (p : STVC) : ptLin p = (-p.1, -p.2.1, -p.2.2) := rfl

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
theorem isQvIsomC_parityLin : IsQvIsomC (parityLin : STVC → STVC) := by
  intro p; obtain ⟨t, x, v⟩ := p
  show QvC (t, -x, -v) = QvC (t, x, v)
  unfold QvC QformC gFormC; simp only [star_neg, neg_mul_neg]; ring
theorem isQvIsomC_timeRevLin : IsQvIsomC (timeRevLin : STVC → STVC) := by
  intro p; obtain ⟨t, x, v⟩ := p
  show QvC (-t, x, v) = QvC (t, x, v)
  unfold QvC QformC; ring
theorem isQvIsomC_ptLin : IsQvIsomC (ptLin : STVC → STVC) := by
  intro p; obtain ⟨t, x, v⟩ := p
  show QvC (-t, -x, -v) = QvC (t, x, v)
  unfold QvC QformC gFormC; simp only [star_neg, neg_mul_neg]; ring

local notation "e₀C" => (((1:Cut), (0:Cut), (0:O Cut)) : STVC)

/-- ★★ THE FULL O(1,9) COMPONENT REDUCTION. -/
theorem joinedIdQvC_discreteReduce {p : Module.End Cut STVC}
    (hp : IsQvIsomC (p : STVC → STVC))
    (hdet : LinearMap.det p = 1 ∨ LinearMap.det p = -1) :
    JoinedIdQvC p ∨ JoinedIdQvC (parityLin * p) ∨ JoinedIdQvC (timeRevLin * p)
      ∨ JoinedIdQvC (ptLin * p) := by
  set a : Cut := (p e₀C).1 with ha
  rcases hdet with hd1 | hdm1
  · rcases le_or_gt 0 a with hpos | hneg
    · exact Or.inl (joinedIdQvC_of_proper_orthochronous hp hd1 hpos)
    · -- proper non-ortho: ptLin * p (det 1, ortho)
      right; right; right
      have hiso : IsQvIsomC ((ptLin * p : Module.End Cut STVC) : STVC → STVC) :=
        isQvIsomC_mul isQvIsomC_ptLin hp
      have hdet' : LinearMap.det (ptLin * p) = 1 := by
        rw [det_End_mul, det_ptLin, hd1]; ring
      have hortho : 0 ≤ ((ptLin * p) e₀C).1 := by
        rw [Module.End.mul_apply, ptLin_apply]; show 0 ≤ -a; linarith
      exact joinedIdQvC_of_proper_orthochronous hiso hdet' hortho
  · rcases le_or_gt 0 a with hpos | hneg
    · -- improper orthochronous: parityLin * p (det 1, ortho)
      right; left
      have hiso : IsQvIsomC ((parityLin * p : Module.End Cut STVC) : STVC → STVC) :=
        isQvIsomC_mul isQvIsomC_parityLin hp
      have hdet' : LinearMap.det (parityLin * p) = 1 := by
        rw [det_End_mul, det_parityLin, hdm1]; ring
      have hortho : 0 ≤ ((parityLin * p) e₀C).1 := by
        rw [Module.End.mul_apply, parityLin_apply]; show 0 ≤ a; exact hpos
      exact joinedIdQvC_of_proper_orthochronous hiso hdet' hortho
    · -- improper non-ortho: timeRevLin * p (det 1, ortho)
      right; right; left
      have hiso : IsQvIsomC ((timeRevLin * p : Module.End Cut STVC) : STVC → STVC) :=
        isQvIsomC_mul isQvIsomC_timeRevLin hp
      have hdet' : LinearMap.det (timeRevLin * p) = 1 := by
        rw [det_End_mul, det_timeRevLin, hdm1]; ring
      have hortho : 0 ≤ ((timeRevLin * p) e₀C).1 := by
        rw [Module.End.mul_apply, timeRevLin_apply]; show 0 ≤ -a; linarith
      exact joinedIdQvC_of_proper_orthochronous hiso hdet' hortho

end

end Phys.Algebra
