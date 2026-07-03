import Phys.Algebra.OctonionJordanThreeMatterSlots
import Phys.Algebra.DerivationRep7
import Mathlib.Tactic

/-!
PROBE 2 (N268 SELECT candidate A'): the DEEP headline — the entrywise gauge action `jAct D`
is a DERIVATION of the matrix product (hence of the Jordan bracket `jb`), i.e. the derived
gauge acts on the maximal matter arena J₃(O ℚ) BY JORDAN-ALGEBRA DERIVATIONS. And ℚ-linearity
of jAct in the matrix argument. Measures whether "the gauge is a symmetry of the arena" is a
light, foundations-only theorem.
-/

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

/-- The entrywise gauge action: apply `D` to each octonion entry. -/
noncomputable def jAct (D : Module.End ℚ (O ℚ)) (M : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    Matrix (Fin 3) (Fin 3) (O ℚ) := M.map (fun x => D x)

/-- `jAct D` is additive in the matrix argument. -/
theorem jAct_add (D : Module.End ℚ (O ℚ)) (M N : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    jAct D (M + N) = jAct D M + jAct D N := by
  apply Matrix.ext; intro i j
  simp [jAct, Matrix.map_apply, Matrix.add_apply, map_add]

/-- ★★ THE DEEP HEADLINE — `jAct D` IS A DERIVATION OF THE MATRIX PRODUCT.
    For a Leibniz derivation `D` of `O ℚ`, the entrywise lift satisfies the matrix Leibniz law:
    `jAct D (M * N) = jAct D M * N + M * jAct D N`. Because each matrix-product entry is a SUM of
    octonion products, and `D` is additive + Leibniz on each product term. -/
theorem jAct_mul (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D)
    (M N : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    jAct D (M * N) = jAct D M * N + M * jAct D N := by
  apply Matrix.ext; intro i j
  simp only [jAct, Matrix.map_apply, Matrix.mul_apply, Matrix.add_apply, map_sum]
  rw [← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro k _
  exact hD (M i k) (N k j)

/-- ★★★ THE GAUGE ACTS BY JORDAN DERIVATIONS. `jAct D` is a derivation of the symmetric
    (Jordan) bracket `jb A B = A*B + B*A` of the maximal matter arena:
    `jAct D (jb A B) = jb (jAct D A) B + jb A (jAct D B)`. So the derived gauge Der(O ℚ) acts on
    J₃(O ℚ) by Jordan-algebra derivations — a genuine symmetry of the arena's algebraic structure. -/
theorem jAct_jb (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D)
    (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    jAct D (jb A B) = jb (jAct D A) B + jb A (jAct D B) := by
  unfold jb
  rw [jAct_add, jAct_mul D hD, jAct_mul D hD]
  abel

end Phys.Algebra.HJ

#print axioms Phys.Algebra.HJ.jAct_mul
#print axioms Phys.Algebra.HJ.jAct_jb
