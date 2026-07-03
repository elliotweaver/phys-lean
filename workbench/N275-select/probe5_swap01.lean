import Phys.Algebra.OctonionJordanFamilySymmetry
import Phys.Algebra.OctonionJordanGenerationCoupling
import Mathlib.Tactic

/-!
PROBE 5 — confirm swap 0 1 (odd) CONJUGATES the coupling value, completing the sign pattern.
swap 0 1 fixes slot A (=(0,1)) with conjugation: slotA a ↦ slotA (star a) [probe4].
It must map slot B=(0,2) ↦ slot C=(1,2) or similar; let simp find it, then compose.
-/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

-- swap 0 1 on slotB: positions (0,2). σ swaps 0,1. New entry at (i,j)=M(σi,σj).
-- b at (0,2) → appears where (σi,σj)=(0,2) → (i,j)=(1,2) = slot C. Guess slotC b:
example (b : O ℚ) : framePerm (Equiv.swap 0 1) (slotB b) = slotC b := by
  unfold framePerm slotB slotC
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;> simp [Xz, Matrix.submatrix_apply, Equiv.swap_apply_def]

-- Now the full coupling under swap 0 1:
-- framePerm(swap01)(jb(slotA a)(slotB b)) = jb(slotA (star a))(slotC b)
--   = jb(slotC b)(slotA (star a))   [jb symmetric]
--   = slotB ((star a) * b)          [jb_slotC_slotA: jb(slotC c)(slotA a) = slotB (a*c) with a:=star a, c:=b]
-- Wait: jb_slotC_slotA c a = slotB (a * c). So jb(slotC b)(slotA (star a)) = slotB ((star a) * b).
-- Un-permuted A-B coupling value is (star a * b) landing in slot C. Under swap01 it lands in slot B
-- with value (star a * b) — but is it conjugated? star a * b vs the "orbit" value.
-- Compare to the transposition-conjugation claim: for swap 1 2 we got slotC(star b * a)=slotC(star(star a*b)).
-- For swap 0 1 we get slotB(star a * b). The VALUE star a * b is the SAME as un-permuted (not conjugated)!
-- So swap 0 1 does NOT conjugate the value — it just SHIFTS the slot. Let me verify:
example (a b : O ℚ) :
    framePerm (Equiv.swap 0 1) (jb (slotA a) (slotB b)) = slotB (star a * b) := by
  rw [framePerm_jb]
  have hA : framePerm (Equiv.swap 0 1) (slotA a) = slotA (star a) := by
    unfold framePerm slotA; apply Matrix.ext; intro i j
    fin_cases i <;> fin_cases j <;> simp [Xz, Matrix.submatrix_apply, Equiv.swap_apply_def]
  have hB : framePerm (Equiv.swap 0 1) (slotB b) = slotC b := by
    unfold framePerm slotB slotC; apply Matrix.ext; intro i j
    fin_cases i <;> fin_cases j <;> simp [Xz, Matrix.submatrix_apply, Equiv.swap_apply_def]
  rw [hA, hB]
  have hsymm : jb (slotA (star a)) (slotC b) = jb (slotC b) (slotA (star a)) := by
    unfold jb; rw [add_comm]
  rw [hsymm, jb_slotC_slotA]

end Phys.Algebra.HJ
