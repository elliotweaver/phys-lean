import Mathlib.LinearAlgebra.Prod
import Mathlib.Algebra.Ring.Commute
import Mathlib.Tactic
import Phys.Foundation.Fold
import Phys.Cascade.ComplexUnit
import Phys.Quantum.PrimitiveFibre

namespace Phys.Quantum.Probe

open Phys.Foundation Phys.Cascade Phys.Quantum Module
open Phys.Foundation.ContinuumQ

/-- The axis-exchange operator with return sign σ: (a,b) ↦ (σ·b, a). -/
noncomputable def Jexch (σ : ContinuumQ.Cut) : StateFibre →ₗ[ContinuumQ.Cut] StateFibre where
  toFun p := (σ * p.2, p.1)
  map_add' p q := Prod.ext (by simp; ring) (by simp)
  map_smul' r p := Prod.ext (by simp; ring) (by simp)

@[simp] theorem Jexch_apply (σ : ContinuumQ.Cut) (p : StateFibre) :
    Jexch σ p = (σ * p.2, p.1) := rfl

-- sends eInward to eOutward
theorem Jexch_eInward (σ : ContinuumQ.Cut) : Jexch σ eInward = eOutward := by
  simp [eInward, eOutward]

-- sends eOutward to σ • eInward
theorem Jexch_eOutward (σ : ContinuumQ.Cut) : Jexch σ eOutward = σ • eInward := by
  simp [eInward, eOutward, Prod.smul_mk, smul_eq_mul]

-- the square is σ • id
theorem Jexch_sq (σ : ContinuumQ.Cut) (p : StateFibre) :
    Jexch σ (Jexch σ p) = σ • p := by
  simp [Prod.smul_mk, smul_eq_mul]; constructor <;> ring

-- + sign has a nonzero fixed point (1,1)
theorem eInwOut_ne_zero : eInward + eOutward ≠ (0 : StateFibre) := by
  intro h
  have : (1 : ContinuumQ.Cut) = 0 := by
    have := congrArg Prod.fst h; simpa [eInward, eOutward] using this
  exact one_ne_zero this

theorem Jexch_plus_fixed : Jexch 1 (eInward + eOutward) = eInward + eOutward := by
  simp [eInward, eOutward]

-- self-blindness forces the sign to -1 among unit-square signs
theorem self_blind_forces_sign (σ : ContinuumQ.Cut) (hunit : σ * σ = 1)
    (hsb : ∀ p, Jexch σ p = p → p = 0) : σ = -1 := by
  rcases mul_self_eq_one_iff.mp hunit with h1 | hm1
  · exfalso
    subst h1
    exact eInwOut_ne_zero (hsb (eInward + eOutward) Jexch_plus_fixed)
  · exact hm1

-- fold-root route: forces σ = -1 with NO unit premise
theorem Jexch_isFoldRoot_iff (σ : ContinuumQ.Cut) :
    IsFoldRoot (fun p => Jexch σ p) ↔ σ = -1 := by
  rw [isFoldRoot_iff]
  constructor
  · intro h
    have he := h eInward
    rw [Jexch_sq] at he
    have : σ * (1 : ContinuumQ.Cut) = -1 := by
      have := congrArg Prod.fst he
      simpa [eInward, Prod.smul_mk, smul_eq_mul] using this
    simpa using this
  · intro h p
    rw [Jexch_sq, h]
    simp [Prod.neg_mk]

-- Jexch (-1) = J₂
theorem Jexch_neg_one_eq_J₂ : Jexch (-1) = J₂ := by
  ext p <;> simp [J₂]

-- the forced complex structure squares to -id
theorem complex_structure_forced (p : StateFibre) :
    Jexch (-1) (Jexch (-1) p) = -p := by
  rw [Jexch_sq]; simp [Prod.neg_mk]

end Phys.Quantum.Probe
