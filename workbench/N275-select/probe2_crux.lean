import Phys.Algebra.OctonionJordanFamilySymmetry
import Phys.Algebra.OctonionJordanGenerationCoupling
import Mathlib.Tactic

/-!
PROBE 2 for N275 SELECT — THE CRUX of the leading candidate.

CANDIDATE (theory-native ★5 beat): the octonion NON-COMMUTATIVITY of the coupling ORIENTS the
generation triangle, breaking the family S₃ (N273) down to the orientation-preserving cyclic Z₃ =
A₃, DERIVED not posited. N273 banked the NEGATIVE half (coupling_orbit_reverses: a transposition
REVERSES the coupling product). The UNTESTED positive half: does the 3-cycle PRESERVE the coupling
orientation (map one cyclic law to another, product order intact)?

If YES → the family symmetry of the ORIENTED coupling is exactly Z₃ (the residual, derived), the
first posit-free distinguished structure in the family sector.

Test the 3-cycle c on the A-B coupling. framePerm σ M = M.submatrix σ σ.
The banked 3-cycle in N273 is (swap 0 1 * swap 1 2), with framePerm_cyc_slotA: (slotA a) ↦ slotB (star a).
-/

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

noncomputable def cyc : Equiv.Perm (Fin 3) := Equiv.swap 0 1 * Equiv.swap 1 2

-- What does framePerm cyc do to slotB? and slotC? (need all three to track the coupling)
example (b : O ℚ) : framePerm cyc (slotB b) = slotC (star b) := by
  unfold framePerm cyc slotB slotC
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.submatrix_apply, Equiv.swap_apply_def, Equiv.Perm.mul_apply]

example (c : O ℚ) : framePerm cyc (slotC c) = slotA (star c) := by
  unfold framePerm cyc slotC slotA
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.submatrix_apply, Equiv.swap_apply_def, Equiv.Perm.mul_apply]

-- THE CRUX: framePerm cyc applied to the A-B coupling jb(slotA a)(slotB b) = slotC(star a*b).
-- framePerm is a Jordan automorphism, so framePerm cyc (jb (slotA a)(slotB b))
--   = jb (framePerm cyc (slotA a)) (framePerm cyc (slotB b))
--   = jb (slotB (star a)) (slotC (star b))
--   = slotA ((star a) * star (star b))   [by jb_slotB_slotC: jb(slotB x)(slotC y) = slotA(x * star y)]
--   = slotA (star a * b).
-- Compare: the CYCLIC image law (N272) jb_slotB_slotC gives slotA(...). Is the product ORDER preserved
-- (star a * b, matching the A-B law's star a*b up to the cyclic slot shift) — NO reversal?
example (a b : O ℚ) :
    framePerm cyc (jb (slotA a) (slotB b)) = slotA (star a * b) := by
  rw [framePerm_jb]
  -- reduce the two slot images
  have hA : framePerm cyc (slotA a) = slotB (star a) := by
    unfold framePerm cyc slotA slotB
    apply Matrix.ext; intro i j
    fin_cases i <;> fin_cases j <;>
      simp [Xz, Matrix.submatrix_apply, Equiv.swap_apply_def, Equiv.Perm.mul_apply]
  have hB : framePerm cyc (slotB b) = slotC (star b) := by
    unfold framePerm cyc slotB slotC
    apply Matrix.ext; intro i j
    fin_cases i <;> fin_cases j <;>
      simp [Xz, Matrix.submatrix_apply, Equiv.swap_apply_def, Equiv.Perm.mul_apply]
  rw [hA, hB, jb_slotB_slotC]
  -- goal: slotA (star a * star (star b)) = slotA (star a * b)
  rw [star_star]

end Phys.Algebra.HJ
