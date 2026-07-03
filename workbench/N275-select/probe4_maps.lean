import Phys.Algebra.OctonionJordanFamilySymmetry
import Phys.Algebra.OctonionJordanGenerationCoupling
import Mathlib.Tactic

/-!
PROBE 4 for N275 SELECT — read off the TRUE slot-image maps (no guessing), then confirm the
even-preserve / odd-conjugate pattern of the coupling value. Uses `decide`-free fin_cases + simp.

Strategy: for each generator σ ∈ {swap01, swap02, swap12, cyc1, cyc2}, compute framePerm σ on
slotA/B/C by fin_cases, and express as slot? of (a or star a). Then compose with jb_slot laws.
We display via `example ... := by ...; done`-style checks with the RHS we EXPECT; if wrong, the
error tells the truth.
-/

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

noncomputable def cyc1 : Equiv.Perm (Fin 3) := Equiv.swap 0 1 * Equiv.swap 1 2
noncomputable def cyc2 : Equiv.Perm (Fin 3) := Equiv.swap 1 2 * Equiv.swap 0 1

-- N273 banked framePerm_swap12_slotA/B/C. Let me confirm swap 0 1 maps (guessing corrected):
-- slotA = Xz a 0 0 at (0,1); swap 0 1 conjugation sends entry (i,j)↦(σi,σj). Xz a 0 0 has a at (0,1).
-- submatrix σ σ at (i,j) = M (σ i)(σ j). New (0,1) entry = M (σ0)(σ1) = M 1 0 = 0. The a at (0,1)
-- moves to where (σi,σj)=(0,1) i.e. (σ⁻¹0, σ⁻¹1)=(1,0). So new matrix has a at (1,0) = star-slot?
-- Xz's structure is Hermitian: (0,1)=a, (1,0)=star a. Let me just let simp decide with candidate slotB (star a)... test:

example (a : O ℚ) : framePerm (Equiv.swap 0 1) (slotA a) = slotA (star a) := by
  unfold framePerm slotA
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.submatrix_apply, Equiv.swap_apply_def]

end Phys.Algebra.HJ
