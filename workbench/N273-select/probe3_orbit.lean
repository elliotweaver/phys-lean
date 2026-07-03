import Phys.Algebra.OctonionJordanGaugeUniversality
import Phys.Algebra.OctonionJordanGenerationCoupling
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

noncomputable def framePerm (σ : Equiv.Perm (Fin 3)) (M : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    Matrix (Fin 3) (Fin 3) (O ℚ) := M.submatrix σ σ

-- MEASURE how each slot maps under the two generating transpositions and a 3-cycle.
-- swap 1 2 : (measured) slotA a -> slotB a, slotB b -> slotA b, slotC c -> slotC (star c)
example (c : O ℚ) : framePerm (Equiv.swap 1 2) (slotC c) = slotC (star c) := by
  unfold framePerm slotC
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;> simp [Xz, Matrix.submatrix_apply, Equiv.swap_apply_def]

-- swap 0 1 : slotA a -> slotA (star a)? , slotB <-> slotC?  measure
example (a : O ℚ) : framePerm (Equiv.swap 0 1) (slotA a) = slotA (star a) := by
  unfold framePerm slotA
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;> simp [Xz, Matrix.submatrix_apply, Equiv.swap_apply_def]

example (b : O ℚ) : framePerm (Equiv.swap 0 1) (slotB b) = slotC b := by
  unfold framePerm slotB slotC
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;> simp [Xz, Matrix.submatrix_apply, Equiv.swap_apply_def]

-- THE COUPLING-ORBIT HEADLINE: applying framePerm to a coupling law yields another coupling law.
-- framePerm(swap12)(jb (slotA a)(slotB b)) = jb (slotB a)(slotA b) = slotC(star b * a) [by coupling]
-- and it should equal framePerm(swap12)(slotC(star a*b)) = slotC(star(star a*b)) = slotC(star b * a).
example (a b : O ℚ) :
    framePerm (Equiv.swap 1 2) (jb (slotA a) (slotB b)) = slotC (star b * a) := by
  rw [jb_slotA_slotB]
  unfold framePerm slotC
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.submatrix_apply, Equiv.swap_apply_def, StarMul.star_mul, star_star]

-- consistency: jb(framePerm slotA)(framePerm slotB) under swap12 = jb(slotB a)(slotA b) = slotC(star b * a)
example (a b : O ℚ) :
    jb (framePerm (Equiv.swap 1 2) (slotA a)) (framePerm (Equiv.swap 1 2) (slotB b))
      = slotC (star b * a) := by
  have h1 : framePerm (Equiv.swap 1 2) (slotA a) = slotB a := by
    unfold framePerm slotA slotB; apply Matrix.ext; intro i j
    fin_cases i <;> fin_cases j <;> simp [Xz, Matrix.submatrix_apply, Equiv.swap_apply_def]
  have h2 : framePerm (Equiv.swap 1 2) (slotB b) = slotA b := by
    unfold framePerm slotA slotB; apply Matrix.ext; intro i j
    fin_cases i <;> fin_cases j <;> simp [Xz, Matrix.submatrix_apply, Equiv.swap_apply_def]
  rw [h1, h2]
  -- jb (slotB a) (slotA b) = jb (slotA b) (slotB a) = slotC (star b * a)
  rw [jb_comm, jb_slotA_slotB]

end Phys.Algebra.HJ
