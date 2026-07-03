import Phys.Algebra.OctonionJordanInnerMultiplication
import Phys.Algebra.OctonionJordanFamilySymmetry
import Mathlib.Tactic

/-!
PROBE 7 for N275 — THE CEILING, SHARP. Does the family symmetry carry leg1 to leg3 EXACTLY,
so the three inner-multiplication couplings are ONE orbit (transitive), proving no root is
distinguished (no posit-free choice of a texture-breaking direction)?

The family cyc: Dg d0 d1 d2 ↦ Dg d1 d2 d0 (probe6). framePerm is a jb-automorphism (framePerm_jb).
So framePerm cyc (innerMul A B M) = innerMul (framePerm cyc A)(framePerm cyc B)(framePerm cyc M),
because innerMul is built from jb. framePerm cyc slotA a = slotB (star a) (N273 framePerm_cyc_slotA).
Need: framePerm cyc slotB, framePerm cyc slotC. Then leg1 maps to leg2 maps to leg3 under cyc.
-/

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

noncomputable def cyc : Equiv.Perm (Fin 3) := Equiv.swap 0 1 * Equiv.swap 1 2

-- The cyc slot maps (A→B→C→A, with star), from probe2/3.
theorem cyc_slotA (a : O ℚ) : framePerm cyc (slotA a) = slotB (star a) := by
  unfold framePerm cyc slotA slotB; apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.submatrix_apply, Equiv.swap_apply_def, Equiv.Perm.mul_apply]

theorem cyc_slotB (b : O ℚ) : framePerm cyc (slotB b) = slotC (star b) := by
  unfold framePerm cyc slotB slotC; apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.submatrix_apply, Equiv.swap_apply_def, Equiv.Perm.mul_apply]

theorem cyc_slotC (c : O ℚ) : framePerm cyc (slotC c) = slotA c := by
  unfold framePerm cyc slotC slotA; apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.submatrix_apply, Equiv.swap_apply_def, Equiv.Perm.mul_apply]

theorem cyc_Dg (d0 d1 d2 : ℚ) :
    framePerm cyc (Dg d0 d1 d2) = Dg d1 d2 d0 := by
  unfold framePerm cyc Dg; apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Matrix.submatrix_apply, Equiv.swap_apply_def, Equiv.Perm.mul_apply, Matrix.diagonal]

-- framePerm distributes over subtraction (submatrix is linear).
theorem framePerm_sub' (σ : Equiv.Perm (Fin 3)) (M N : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    framePerm σ (M - N) = framePerm σ M - framePerm σ N := by
  unfold framePerm; apply Matrix.ext; intro i j; simp [Matrix.submatrix_apply, Matrix.sub_apply]

-- innerMul commutes with the family symmetry (both built from jb, framePerm_jb an automorphism).
theorem framePerm_innerMul (σ : Equiv.Perm (Fin 3)) (A B M : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    framePerm σ (innerMul A B M)
      = innerMul (framePerm σ A) (framePerm σ B) (framePerm σ M) := by
  rw [innerMul_apply, innerMul_apply, framePerm_sub', framePerm_jb, framePerm_jb,
      framePerm_jb, framePerm_jb]

end Phys.Algebra.HJ
