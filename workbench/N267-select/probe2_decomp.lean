import Phys.Algebra.HermitianJordan.PieceBfinal
import Phys.Algebra.HermitianJordan.Reduction
import Phys.Algebra.JordanTower
import Mathlib.Tactic

/-! PROBE 2 (N267 candidate A): the maximal-Jordan-order decomposition + the cap-forced count. -/

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD
open Matrix

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

noncomputable def slotA (a : O ℚ) : Matrix (Fin 3) (Fin 3) (O ℚ) := Xz a 0 0
noncomputable def slotB (b : O ℚ) : Matrix (Fin 3) (Fin 3) (O ℚ) := Xz 0 b 0
noncomputable def slotC (c : O ℚ) : Matrix (Fin 3) (Fin 3) (O ℚ) := Xz 0 0 c

/-- CRUX A: the off-diagonal core splits into the three matter-carrier slots. -/
theorem Xz_slot_decomp (a b c : O ℚ) :
    Xz a b c = slotA a + slotB b + slotC c := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [slotA, slotB, slotC, Xz, Matrix.add_apply]

/-- CRUX B: the general Hermitian element (maximal Jordan order) splits as
    (real diagonal) ⊕ (three matter-carrier slots). -/
theorem Hm_slot_decomp (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    Hm d0 d1 d2 a b c = Dg d0 d1 d2 + slotA a + slotB b + slotC c := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [slotA, slotB, slotC, Xz, Hm, Dg, Matrix.add_apply, ocR]

/-- Slot linearity (each slot is a linear injection O ℚ →ₗ H₃). -/
theorem slotA_add (a a' : O ℚ) : slotA (a + a') = slotA a + slotA a' := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;> simp [slotA, Xz, Matrix.add_apply, star_add]

/-- CRUX C (THE CAP-FORCED COUNT, re-exported as the maximal Jordan order): order 3 is
    Jordan but order 4 is NOT. So the maximal octonionic Hermitian Jordan order is 3, hence
    exactly C(3,2)=3 off-diagonal matter-carrier slots. Directly `jordan_cap_pinned_at_three`. -/
theorem maximal_order_three :
    (∀ (d0 d1 d2 : ℚ) (a b c : O ℚ) (e0 e1 e2 : ℚ) (p q r : O ℚ),
        jdef (Hm d0 d1 d2 a b c) (Hm e0 e1 e2 p q r) = 0)
    ∧ jdef Xwit Ywit ≠ 0 :=
  jordan_cap_pinned_at_three

#print axioms Xz_slot_decomp
#print axioms Hm_slot_decomp
#print axioms slotA_add
#print axioms maximal_order_three
