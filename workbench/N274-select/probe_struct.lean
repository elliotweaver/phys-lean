import Phys.Algebra.OctonionJordanFamilySymmetry
import Phys.Algebra.OctonionJordanWeightDiagram
import Phys.Algebra.DerivationFinrank
import Phys.Algebra.HermitianJordan.PieceBfinal
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

-- helper 1: jb symmetric
theorem jb_comm' (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) : jb A B = jb B A := by
  unfold jb; rw [add_comm]

-- probe the individual structural rewrites
example (b : O ℚ) (d0 d1 d2 : ℚ) :
    jb (slotB b) (Dg d0 d1 d2) = slotB ((d0 + d2) • b) := by
  rw [jb_comm']
  unfold slotB
  rw [jb_Dg_Xzabc]
  rw [smul_zero, smul_zero]

example (a : O ℚ) (d0 d1 d2 : ℚ) :
    jb (slotA a) (Dg d0 d1 d2) = slotA ((d0 + d1) • a) := by
  rw [jb_comm']
  unfold slotA
  rw [jb_Dg_Xzabc]
  rw [smul_zero, smul_zero]

-- star_smul test
example (c : ℚ) (a : O ℚ) : star (c • a) = c • star a := by
  rw [star_smul]; rfl

-- slotC linearity (sub)
example (x y : O ℚ) : slotC (x - y) = slotC x - slotC y := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [slotC, Xz, Matrix.sub_apply, star_sub]

end Phys.Algebra.HJ
