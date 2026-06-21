import Phys.Algebra.Operator
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic

open Phys.Cascade
open Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

-- Does Matrix multiplication resolve over the octonion shape (NonAssocRing, not Ring)?
section Test
variable {B : Type*} [CommRing B] [StarRing B]

-- need AddCommMonoid + Mul on entries for Matrix.mul; Fintype on index
example (M N : Matrix (Fin 3) (Fin 3) (CD (CD B))) : Matrix (Fin 3) (Fin 3) (CD (CD B)) := M * N

-- addition
example (M N : Matrix (Fin 3) (Fin 3) (CD (CD B))) : Matrix (Fin 3) (Fin 3) (CD (CD B)) := M + N

-- can we expand a product entry over Fin 3?
example (M N : Matrix (Fin 3) (Fin 3) (CD (CD B))) (i k : Fin 3) :
    (M * N) i k = M i 0 * N 0 k + M i 1 * N 1 k + M i 2 * N 2 k := by
  simp [Matrix.mul_apply, Fin.sum_univ_three]

end Test
