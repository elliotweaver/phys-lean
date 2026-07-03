import Phys.Algebra.OctonionJordanFamilySymmetry
import Phys.Algebra.OctonionJordanWeightDiagram
import Phys.Algebra.DerivationFinrank
import Phys.Algebra.HermitianJordan.PieceBfinal
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

-- Mirror N272's EXACT instance setup (qMod, the ℚ-module override that lets simp close octonion arith)
attribute [local instance] qMod

noncomputable def Lmul' (A : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    Matrix (Fin 3) (Fin 3) (O ℚ) →ₗ[ℚ] Matrix (Fin 3) (Fin 3) (O ℚ) where
  toFun X := jb A X
  map_add' X Y := by unfold jb; rw [mul_add, add_mul]; abel
  map_smul' r X := by
    unfold jb
    simp only [RingHom.id_apply, smul_add]
    constructor

end Phys.Algebra.HJ
