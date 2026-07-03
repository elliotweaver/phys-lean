import Phys.Algebra.OctonionJordanFamilySymmetry
import Phys.Algebra.OctonionJordanFormallyReal
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

/-! PROBE 1 — the arena Jordan multiplication operator L_A and the inner-commutator germ. -/

noncomputable def Lmul (A : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    Matrix (Fin 3) (Fin 3) (O ℚ) →ₗ[ℚ] Matrix (Fin 3) (Fin 3) (O ℚ) where
  toFun X := jb A X
  map_add' X Y := by unfold jb; rw [mul_add, add_mul]; abel
  map_smul' r X := by
    unfold jb
    simp only [Matrix.mul_smul, Matrix.smul_mul, smul_add, RingHom.id_apply]

noncomputable def innerJ (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    Matrix (Fin 3) (Fin 3) (O ℚ) →ₗ[ℚ] Matrix (Fin 3) (Fin 3) (O ℚ) :=
  Lmul A ∘ₗ Lmul B - Lmul B ∘ₗ Lmul A

-- unfold to raw jb form for entry computation
theorem innerJ_apply (A B X : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    innerJ A B X = jb A (jb B X) - jb B (jb A X) := rfl

-- CONCRETE GERM at entry (1,1): does the inner commutator MOVE the diagonal?
-- With A = slotA a, B = slotB b, X = E1 (Dg 0 1 0), compute entry (1,1).
theorem germ_entry (a b : O ℚ) :
    (innerJ (slotA a) (slotB b) (Dg 0 1 0)) 1 1
      = (jb (slotA a) (jb (slotB b) (Dg 0 1 0))
         - jb (slotB b) (jb (slotA a) (Dg 0 1 0))) 1 1 := rfl

-- Now evaluate that (1,1) entry fully:
theorem germ_val (a b : O ℚ) :
    (innerJ (slotA a) (slotB b) (Dg 0 1 0)) 1 1 = 0 := by
  show (jb (slotA a) (jb (slotB b) (Dg 0 1 0))
         - jb (slotB b) (jb (slotA a) (Dg 0 1 0))) 1 1 = 0
  simp only [jb, slotA, slotB, Dg, Xz, Matrix.sub_apply, Matrix.add_apply, Matrix.mul_apply,
    Fin.sum_univ_three, Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero,
    Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two, Matrix.tail_cons,
    Matrix.empty_val', Matrix.cons_val_fin_one, Matrix.head_fin_const]
  ring

end Phys.Algebra.HJ
