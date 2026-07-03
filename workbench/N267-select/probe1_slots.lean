import Phys.Algebra.HermitianJordan.PieceBfinal
import Phys.Algebra.JordanTower
import Mathlib.Tactic

/-! PROBE 1 (N267 candidate A): the three off-diagonal matter-carrier slots of J₃(O).
    Measure: slot injections O ℚ → H₃, injectivity, position-disjointness, nonzero witness. -/

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD
open Matrix

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

/-- slot A: octonion at (0,1). -/
noncomputable def slotA (a : O ℚ) : Matrix (Fin 3) (Fin 3) (O ℚ) := Xz a 0 0
/-- slot B: octonion at (0,2). -/
noncomputable def slotB (b : O ℚ) : Matrix (Fin 3) (Fin 3) (O ℚ) := Xz 0 b 0
/-- slot C: octonion at (1,2). -/
noncomputable def slotC (c : O ℚ) : Matrix (Fin 3) (Fin 3) (O ℚ) := Xz 0 0 c

-- CRUX 1: each slot recovers its octonion at a matrix entry (⟹ injective).
theorem slotA_entry (a : O ℚ) : (slotA a) 0 1 = a := by
  simp [slotA, Xz]
theorem slotB_entry (b : O ℚ) : (slotB b) 0 2 = b := by
  simp [slotB, Xz]
theorem slotC_entry (c : O ℚ) : (slotC c) 1 2 = c := by
  simp [slotC, Xz]

-- CRUX 2: injectivity (from the entry recovery).
theorem slotA_inj : Function.Injective slotA := by
  intro a a' h
  have := congrArg (fun M => M 0 1) h
  simpa [slotA_entry] using this

-- CRUX 3: position-disjointness — slotA and slotB agree only at 0.
theorem slotA_eq_slotB_imp (a b : O ℚ) (h : slotA a = slotB b) : a = 0 ∧ b = 0 := by
  constructor
  · have := congrArg (fun M => M 0 1) h
    simpa [slotA, slotB, Xz] using this
  · have := congrArg (fun M => M 0 2) h
    have h2 : (0 : O ℚ) = b := by simpa [slotA, slotB, Xz] using this
    exact h2.symm

-- W8: a nonzero octonion gives a nonzero slot.
theorem slotA_ne_zero {a : O ℚ} (ha : a ≠ 0) : slotA a ≠ 0 := by
  intro h
  apply ha
  have := congrArg (fun M => M 0 1) h
  simpa [slotA, Xz] using this

#print axioms slotA_entry
#print axioms slotA_inj
#print axioms slotA_eq_slotB_imp
#print axioms slotA_ne_zero
