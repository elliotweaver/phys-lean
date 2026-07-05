import Phys.Algebra.OctonionJordanSpectrumMovingSectorGrading
import Phys.Algebra.OctonionAssociative3Form
import Phys.Algebra.OctonionJordanDerivationAlgebra
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

noncomputable def rtr (M : Matrix (Fin 3) (Fin 3) (O ℚ)) : ℚ := reQ (jTr M)

theorem rtr_expand (M : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    rtr M = reQ (M 0 0) + reQ (M 1 1) + reQ (M 2 2) := by
  unfold rtr jTr
  rw [Matrix.trace]; simp only [Fin.sum_univ_three, Matrix.diag_apply]; rw [reQ_add, reQ_add]

theorem rtr_add (M N : Matrix (Fin 3) (Fin 3) (O ℚ)) : rtr (M + N) = rtr M + rtr N := by
  simp only [rtr_expand, Matrix.add_apply, reQ_add]; ring

theorem reQ_sub (a b : O ℚ) : reQ (a - b) = reQ a - reQ b := by
  rw [sub_eq_add_neg, reQ_add, reQ_neg, ← sub_eq_add_neg]

theorem rtr_sub (M N : Matrix (Fin 3) (Fin 3) (O ℚ)) : rtr (M - N) = rtr M - rtr N := by
  simp only [rtr_expand, Matrix.sub_apply, reQ_sub]; ring

theorem rtr_mul_comm (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) : rtr (A * B) = rtr (B * A) := by
  rw [rtr_expand, rtr_expand]
  simp only [Matrix.mul_apply, Fin.sum_univ_three, reQ_add]
  rw [reQ_mul_comm (A 0 0) (B 0 0), reQ_mul_comm (A 0 1) (B 1 0), reQ_mul_comm (A 0 2) (B 2 0),
      reQ_mul_comm (A 1 0) (B 0 1), reQ_mul_comm (A 1 1) (B 1 1), reQ_mul_comm (A 1 2) (B 2 1),
      reQ_mul_comm (A 2 0) (B 0 2), reQ_mul_comm (A 2 1) (B 1 2), reQ_mul_comm (A 2 2) (B 2 2)]
  ring

theorem rtr_mul_assoc (A B C : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    rtr ((A * B) * C) = rtr (A * (B * C)) := by
  rw [rtr_expand, rtr_expand]
  simp only [Matrix.mul_apply, Fin.sum_univ_three, add_mul, mul_add, reQ_add]
  rw [reQ_mul_assoc3 (A 0 0) (B 0 0) (C 0 0), reQ_mul_assoc3 (A 0 0) (B 0 1) (C 1 0),
      reQ_mul_assoc3 (A 0 0) (B 0 2) (C 2 0), reQ_mul_assoc3 (A 0 1) (B 1 0) (C 0 0),
      reQ_mul_assoc3 (A 0 1) (B 1 1) (C 1 0), reQ_mul_assoc3 (A 0 1) (B 1 2) (C 2 0),
      reQ_mul_assoc3 (A 0 2) (B 2 0) (C 0 0), reQ_mul_assoc3 (A 0 2) (B 2 1) (C 1 0),
      reQ_mul_assoc3 (A 0 2) (B 2 2) (C 2 0),
      reQ_mul_assoc3 (A 1 0) (B 0 0) (C 0 1), reQ_mul_assoc3 (A 1 0) (B 0 1) (C 1 1),
      reQ_mul_assoc3 (A 1 0) (B 0 2) (C 2 1), reQ_mul_assoc3 (A 1 1) (B 1 0) (C 0 1),
      reQ_mul_assoc3 (A 1 1) (B 1 1) (C 1 1), reQ_mul_assoc3 (A 1 1) (B 1 2) (C 2 1),
      reQ_mul_assoc3 (A 1 2) (B 2 0) (C 0 1), reQ_mul_assoc3 (A 1 2) (B 2 1) (C 1 1),
      reQ_mul_assoc3 (A 1 2) (B 2 2) (C 2 1),
      reQ_mul_assoc3 (A 2 0) (B 0 0) (C 0 2), reQ_mul_assoc3 (A 2 0) (B 0 1) (C 1 2),
      reQ_mul_assoc3 (A 2 0) (B 0 2) (C 2 2), reQ_mul_assoc3 (A 2 1) (B 1 0) (C 0 2),
      reQ_mul_assoc3 (A 2 1) (B 1 1) (C 1 2), reQ_mul_assoc3 (A 2 1) (B 1 2) (C 2 2),
      reQ_mul_assoc3 (A 2 2) (B 2 0) (C 0 2), reQ_mul_assoc3 (A 2 2) (B 2 1) (C 1 2),
      reQ_mul_assoc3 (A 2 2) (B 2 2) (C 2 2)]
  ring

theorem jb_comm' (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) : jb A B = jb B A := by
  unfold jb; abel

/-! ## PAYOFF 1: trace-form associativity. -/

theorem rtr_jb_assoc (A B C : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    rtr (jb (jb A B) C) = rtr (jb A (jb B C)) := by
  unfold jb
  simp only [add_mul, mul_add, rtr_add]
  -- reduce every triple to E := rtr(A*(B*C)) or Odd := rtr(A*(C*B))
  have hE1 : rtr (A * B * C) = rtr (A * (B * C)) := rtr_mul_assoc A B C
  have hE2 : rtr (C * (A * B)) = rtr (A * (B * C)) := by
    rw [rtr_mul_comm C (A * B), rtr_mul_assoc A B C]
  have hE3 : rtr (B * C * A) = rtr (A * (B * C)) := by
    rw [rtr_mul_comm (B * C) A]
  have hO1 : rtr (B * A * C) = rtr (A * (C * B)) := by
    rw [rtr_mul_assoc B A C, rtr_mul_comm B (A * C), rtr_mul_assoc A C B]
  have hO2 : rtr (C * (B * A)) = rtr (A * (C * B)) := by
    rw [rtr_mul_comm C (B * A), rtr_mul_assoc B A C, rtr_mul_comm B (A * C), rtr_mul_assoc A C B]
  have hO3 : rtr (C * B * A) = rtr (A * (C * B)) := by
    rw [rtr_mul_comm (C * B) A]
  rw [hE1, hE2, hE3, hO1, hO2, hO3]

/-! ## PAYOFF 2: innerMul (the f₄-generators) kill jTr. -/

theorem innerMul_kills_rtr (A B M : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    rtr (innerMul A B M) = 0 := by
  rw [innerMul_apply, rtr_sub]
  -- rtr (jb A (jb B M)) = rtr (jb B (jb A M)) via assoc + jb symmetry
  rw [← rtr_jb_assoc A B M, ← rtr_jb_assoc B A M, jb_comm' B A]
  ring

/-! ## PAYOFF 3: jActL D (the entrywise g₂-derivations) kill jTr. -/

theorem jActL_kills_rtr (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D)
    (M : Matrix (Fin 3) (Fin 3) (O ℚ)) : rtr (jActL D M) = 0 := by
  rw [rtr_expand]
  simp only [jActL_apply, jAct, Matrix.map_apply]
  rw [show reQ (D (M 0 0)) = 0 from derivQ_reQ_zero D hD (M 0 0),
      show reQ (D (M 1 1)) = 0 from derivQ_reQ_zero D hD (M 1 1),
      show reQ (D (M 2 2)) = 0 from derivQ_reQ_zero D hD (M 2 2)]
  ring

end Phys.Algebra.HJ
