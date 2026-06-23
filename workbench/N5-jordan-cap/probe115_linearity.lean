/- PROBE 115: the ℚ-LINEARITY of polarCross1 in its first argument D, via the qMod
   scalar action. Risky/novel structural pieces only (all matrix-level, no octonion
   coordinate expansion → should be FAST). KILL 120s.
   Tests: IsScalarTower/SMulCommClass instances, jb_smul_left/right, polarCross1
   homogeneity + additivity in D, and Dg = d0•Du0 + d1•Du1 + d2•Du2. -/
import Phys.Algebra.HermitianJordan.PieceBdeg2
import Phys.Algebra.HermitianJordan.PolarFirst
import Mathlib.Tactic

namespace Probe115
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

-- scalar-tower / comm instances from the banked transport lemmas
instance : IsScalarTower ℚ (O ℚ) (O ℚ) := ⟨fun r x y => tr_sl r x y⟩
instance : SMulCommClass ℚ (O ℚ) (O ℚ) := ⟨fun r x y => (tr_sr r x y).symm⟩

variable {n : ℕ}

theorem jb_smul_left (r : ℚ) (A B : Matrix (Fin n) (Fin n) (O ℚ)) :
    jb (r • A) B = r • jb A B := by
  unfold jb; rw [Matrix.smul_mul, Matrix.mul_smul, smul_add]

theorem jb_smul_right (r : ℚ) (A B : Matrix (Fin n) (Fin n) (O ℚ)) :
    jb A (r • B) = r • jb A B := by
  unfold jb; rw [Matrix.mul_smul, Matrix.smul_mul, smul_add]

theorem pc1_smul_left (r : ℚ) (D X Y : Matrix (Fin n) (Fin n) (O ℚ)) :
    polarCross1 (r • D) X Y = r • polarCross1 D X Y := by
  unfold polarCross1
  simp only [jb_smul_left, jb_smul_right, smul_add, smul_sub]

theorem pc1_add_left (D D' X Y : Matrix (Fin n) (Fin n) (O ℚ)) :
    polarCross1 (D + D') X Y = polarCross1 D X Y + polarCross1 D' X Y := by
  unfold polarCross1 jb
  simp only [Matrix.add_mul, Matrix.mul_add]
  abel

-- the unit diagonals
noncomputable def Du0 : Matrix (Fin 3) (Fin 3) (O ℚ) := Matrix.diagonal ![1, 0, 0]
noncomputable def Du1 : Matrix (Fin 3) (Fin 3) (O ℚ) := Matrix.diagonal ![0, 1, 0]
noncomputable def Du2 : Matrix (Fin 3) (Fin 3) (O ℚ) := Matrix.diagonal ![0, 0, 1]

-- Dg as a ℚ-linear combination of the unit diagonals (eliminates opaque ocR d_k)
theorem Dg_eq_smul (d0 d1 d2 : ℚ) :
    Dg d0 d1 d2 = d0 • Du0 + d1 • Du1 + d2 • Du2 := by
  unfold Dg Du0 Du1 Du2
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp only [Matrix.diagonal, Matrix.add_apply, Matrix.smul_apply, Matrix.of_apply,
      Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.cons_val_fin_one, Matrix.empty_val', Matrix.cons_val_two, Matrix.tail_cons,
      Matrix.head_fin_const, qsmul_def] <;>
    simp [ocR_zero, ocR_one_mul, mul_zero, smul_zero, ← ocR_mul] <;>
    rw [qsmul_def] <;> simp [ocR, mul_one]

end Probe115
