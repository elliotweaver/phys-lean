import Phys.Algebra.ProtonStabilitySelectionRule
import Phys.Algebra.StrongCPTheta
import Phys.Algebra.MaxEntArrowOfTime
import Mathlib.Tactic

open Phys.Foundation.ContinuumQ
open Phys.Algebra
open Phys.Algebra.MaxEnt

noncomputable section

namespace ProbeBaryo

/-! CRUX 1: casts ℤ→Cut and ℚ→Cut land on the expected values. -/

-- B-violation factor cast to derived ℝ
def bViolationRate (k : ℤ) : Cut := ((baryonShift (Module.finrank ℚ Uhol) k : ℤ) : Cut)

theorem bViolationRate_eq (k : ℤ) : bViolationRate k = ((3 * k : ℤ) : Cut) := by
  unfold bViolationRate
  rw [baryon_violation_quantum]

theorem bViolationRate_one : bViolationRate 1 = 3 := by
  rw [bViolationRate_eq]; push_cast; ring

theorem bViolationRate_zero : bViolationRate 0 = 0 := by
  rw [bViolationRate_eq]; push_cast; ring

theorem bViolationRate_ne_zero {k : ℤ} (hk : k ≠ 0) : bViolationRate k ≠ 0 := by
  rw [bViolationRate_eq]
  have : (3 * k : ℤ) ≠ 0 := by
    intro h; apply hk; omega
  exact_mod_cast this

-- CP source cast to derived ℝ (banked value = -1)
def cpSource : Cut := ((assoc3 u2 u1 (octCross u1 u2) : ℚ) : Cut)

theorem cpSource_eq : cpSource = -1 := by
  unfold cpSource
  rw [assoc3_witness]; push_cast; ring

theorem cpSource_ne_zero : cpSource ≠ 0 := by
  rw [cpSource_eq]; norm_num

theorem cpSource_neg : cpSource < 0 := by
  rw [cpSource_eq]; norm_num

/-! CRUX 2: nonEq factor = relInfo (already Cut); the product mechanics. -/

def nonEqMeasure {n : ℕ} (p q : Fin n → Cut) : Cut := relInfo p q

def baryonAsymmetry {n : ℕ} (k : ℤ) (p q : Fin n → Cut) : Cut :=
  bViolationRate k * cpSource * nonEqMeasure p q

-- Sakharov NECESSITY: a nonzero asymmetry requires all three factors nonzero.
theorem sakharov_necessity {n : ℕ} (k : ℤ) (p q : Fin n → Cut)
    (h : baryonAsymmetry k p q ≠ 0) :
    bViolationRate k ≠ 0 ∧ cpSource ≠ 0 ∧ nonEqMeasure p q ≠ 0 := by
  unfold baryonAsymmetry at h
  refine ⟨?_, ?_, ?_⟩
  · intro hb; apply h; rw [hb]; ring
  · intro hc; apply h; rw [hc]; ring
  · intro hn; apply h; rw [hn]; ring

-- equilibrium kills it (3rd Sakharov necessary)
theorem asymmetry_zero_at_equilibrium {n : ℕ} (k : ℤ) (q : Fin n → Cut) :
    baryonAsymmetry k q q = 0 := by
  unfold baryonAsymmetry nonEqMeasure
  rw [relInfo_self]; ring

-- no B-violation kills it (1st Sakharov necessary)
theorem asymmetry_zero_no_bviolation {n : ℕ} (p q : Fin n → Cut) :
    baryonAsymmetry 0 p q = 0 := by
  unfold baryonAsymmetry
  rw [bViolationRate_zero]; ring

/-! CRUX 3: the witness — all three present ⇒ nonzero AND definite sign. -/

theorem asymmetry_witness_eq : baryonAsymmetry 1 pWit qWit = -3 * relInfo pWit qWit := by
  unfold baryonAsymmetry nonEqMeasure
  rw [bViolationRate_one, cpSource_eq]; ring

theorem asymmetry_witness_neg : baryonAsymmetry 1 pWit qWit < 0 := by
  rw [asymmetry_witness_eq]
  have hpos : 0 < relInfo pWit qWit := maxent_deviation_pos
  nlinarith [hpos]

theorem asymmetry_witness_ne_zero : baryonAsymmetry 1 pWit qWit ≠ 0 :=
  ne_of_lt asymmetry_witness_neg

-- W8-style: off-equilibrium differs from equilibrium (out-of-eq load-bearing)
theorem asymmetry_offeq_ne_eq : baryonAsymmetry 1 pWit qWit ≠ baryonAsymmetry 1 qWit qWit := by
  rw [asymmetry_zero_at_equilibrium]
  exact asymmetry_witness_ne_zero

end ProbeBaryo
end
