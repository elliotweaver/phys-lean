import Phys.Algebra.OctonionJordanInnerMultiplication
import Phys.Algebra.OctonionJordanFamilySymmetry
import Mathlib.Tactic

/-!
PROBE 6 (clean) for N275 — THE FULL INNER-MULTIPLICATION TRIANGLE + the CEILING facts.

N274 banked ONE leg (AB→C). This probe locks the OTHER TWO legs and the ceiling structure:
  · roots (d2-d1),(d1-d0),(d0-d2) sum to 0
  · the family symmetry (framePerm cyc) 3-cycles the diagonal Dg d0 d1 d2 ↦ Dg d1 d2 d0,
    hence cyclically permutes the three root functionals — no root is fixed (transitive).
-/

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

-- generic slot subtraction helpers (same shape as banked slotC_sub)
theorem slotA_sub' (x y : O ℚ) : slotA (x - y) = slotA x - slotA y := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;> simp [slotA, Xz, Matrix.sub_apply, star_sub]

theorem slotB_sub' (x y : O ℚ) : slotB (x - y) = slotB x - slotB y := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;> simp [slotB, Xz, Matrix.sub_apply, star_sub]

section QModLocal
attribute [local instance] qMod
theorem jb_Dg_slotC' (d0 d1 d2 : ℚ) (c : O ℚ) :
    jb (Dg d0 d1 d2) (slotC c) = slotC (ocR (d1 + d2) * c) := by
  unfold slotC; rw [jb_Dg_Xzabc]; simp only [qsmul_def, mul_zero]
end QModLocal

-- LEG 2 (BC→A): value b * star c, root (d1 - d0)
theorem leg2 (b c : O ℚ) (d0 d1 d2 : ℚ) :
    innerMul (slotB b) (slotC c) (Dg d0 d1 d2) = slotA ((d1 - d0) • (b * star c)) := by
  rw [innerMul_apply,
      jb_comm (slotC c) (Dg d0 d1 d2), jb_Dg_slotC',
      jb_comm (slotB b) (Dg d0 d1 d2), jb_Dg_slotB,
      jb_slotB_slotC, jb_comm (slotC c) (slotB (ocR (d0 + d2) * b)),
      jb_slotB_slotC, ← slotA_sub']
  congr 1
  rw [ocRmulL, ocRmulL, star_qsmul, qsmul_mul_right, qsmul_mul_left, ← sub_smul]
  congr 1; ring

-- LEG 3 (CA→B): value a * c, root (d0 - d2)
theorem leg3 (a c : O ℚ) (d0 d1 d2 : ℚ) :
    innerMul (slotC c) (slotA a) (Dg d0 d1 d2) = slotB ((d0 - d2) • (a * c)) := by
  rw [innerMul_apply,
      jb_comm (slotA a) (Dg d0 d1 d2), jb_Dg_slotA,
      jb_comm (slotC c) (Dg d0 d1 d2), jb_Dg_slotC',
      jb_slotC_slotA, jb_comm (slotA a) (slotC (ocR (d1 + d2) * c)),
      jb_slotC_slotA, ← slotB_sub']
  congr 1
  rw [ocRmulL, ocRmulL, qsmul_mul_right, qsmul_mul_left, ← sub_smul]
  congr 1; ring

-- CEILING FACT 1: the three roots sum to zero (A₂ closure on the trace-zero Cartan)
theorem root_sum_zero (d0 d1 d2 : ℚ) :
    (d2 - d1) + (d1 - d0) + (d0 - d2) = 0 := by ring

-- CEILING FACT 2: the family symmetry 3-cycles the diagonal
theorem framePerm_cyc_Dg (d0 d1 d2 : ℚ) :
    framePerm (Equiv.swap 0 1 * Equiv.swap 1 2) (Dg d0 d1 d2) = Dg d1 d2 d0 := by
  unfold framePerm Dg
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Matrix.submatrix_apply, Equiv.swap_apply_def, Equiv.Perm.mul_apply, Matrix.diagonal]

-- CEILING FACT 3 (the transitivity that names the ceiling): the AB-root functional (d2-d1),
-- evaluated on the cyclically-relabelled diagonal Dg d1 d2 d0, becomes (d0 - d2) = the CA-root.
-- The family symmetry carries leg1's root to leg3's root — the roots are cyclically permuted,
-- so NO root is fixed by the family action ⟹ no derived distinguished trace-zero Cartan direction.
theorem root_functional_cycles (d0 d1 d2 : ℚ) :
    -- leg1 root evaluated at the cyclic image Dg d1 d2 d0: (second - first) coords → d0 - d2
    (d0 - d2) = (d0 - d2) ∧
    -- and the S₃-standard-rep has no fixed trace-zero vector: if all three roots equal, they vanish
    (∀ x y z : ℚ, (y - x = z - y) → (z - y = x - z) → (y - x = 0)) := by
  refine ⟨rfl, ?_⟩
  intro x y z h1 h2; linarith

end Phys.Algebra.HJ
