import Phys.Algebra.OctonionJordanThreeMatterSlots
import Phys.Algebra.TowerWorldMapColourNeutralCore
import Phys.Algebra.DerivationRep7
import Mathlib.Tactic

/-!
PROBE 1b (N268 SELECT candidate A'): the entrywise gauge action on J₃(O ℚ), and the
FORCED slot-equivariance — under the GLOBAL instModuleQO (NO qMod override; importers
see the global instance, so the derivation lemmas typecheck).
-/

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

-- Ring instances for O ℚ = CD (H ℚ); NO `qMod` — use the ambient global `instModuleQO`
-- (so the derivation lemmas `derivQ_one`/`derivQ_maps_im` typecheck).
attribute [local instance] CD.narCD CD.srCD

/-- A derivation commutes with conjugation on `O ℚ`: `D (star a) = star (D a)`. -/
theorem derivQ_star_comm (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) (a : O ℚ) :
    D (star a) = star (D a) := by
  have htr : a + star a = (2 * reQ a) • (1 : O ℚ) := trace_id a
  have hstar_a : star a = (2 * reQ a) • (1 : O ℚ) - a := by
    rw [eq_sub_iff_add_eq, add_comm]; exact htr
  have h1 : D 1 = 0 := derivQ_one D hD
  have hmap : star (D a) = - D a := derivQ_maps_im D hD a
  rw [hstar_a, map_sub, map_smul, h1, smul_zero, zero_sub, hmap]

/-- The entrywise gauge action: apply `D` to each octonion entry. -/
noncomputable def jAct (D : Module.End ℚ (O ℚ)) (M : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    Matrix (Fin 3) (Fin 3) (O ℚ) := M.map (fun x => D x)

/-- ★ SLOT EQUIVARIANCE (0,1): `jAct D (slotA a) = slotA (D a)`. -/
theorem jAct_slotA (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) (a : O ℚ) :
    jAct D (slotA a) = slotA (D a) := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [jAct, slotA, Xz, Matrix.map_apply, derivQ_star_comm D hD, map_zero]

/-- ★ SLOT EQUIVARIANCE (0,2). -/
theorem jAct_slotB (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) (b : O ℚ) :
    jAct D (slotB b) = slotB (D b) := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [jAct, slotB, Xz, Matrix.map_apply, derivQ_star_comm D hD, map_zero]

/-- ★ SLOT EQUIVARIANCE (1,2). -/
theorem jAct_slotC (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) (c : O ℚ) :
    jAct D (slotC c) = slotC (D c) := by
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [jAct, slotC, Xz, Matrix.map_apply, derivQ_star_comm D hD, map_zero]

/-- ★ THE DIAGONAL IS GAUGE-FIXED: `jAct D (Dg d0 d1 d2) = 0`. -/
theorem jAct_Dg (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) (d0 d1 d2 : ℚ) :
    jAct D (Dg d0 d1 d2) = 0 := by
  have h1 : D 1 = 0 := derivQ_one D hD
  have hkill : ∀ r : ℚ, D (ocR r) = 0 := by
    intro r
    have hr : ocR r = r • (1 : O ℚ) := by ext <;> simp [ocR]
    rw [hr, map_smul, h1, smul_zero]
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [jAct, Dg, Matrix.map_apply, Matrix.diagonal_apply, hkill, map_zero]

/-- ★ THE FULL EQUIVARIANT DECOMPOSITION: the entrywise gauge action on the general maximal
    self-adjoint element sends the diagonal to 0 and each slot to its D-image:
    `jAct D (Hm d0 d1 d2 a b c) = slotA (D a) + slotB (D b) + slotC (D c)`. -/
theorem jAct_Hm (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D)
    (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    jAct D (Hm d0 d1 d2 a b c)
      = slotA (D a) + slotB (D b) + slotC (D c) := by
  have h1 : D 1 = 0 := derivQ_one D hD
  have hkill : ∀ r : ℚ, D (ocR r) = 0 := by
    intro r
    have hr : ocR r = r • (1 : O ℚ) := by ext <;> simp [ocR]
    rw [hr, map_smul, h1, smul_zero]
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [jAct, Hm, Dg, slotA, slotB, slotC, Xz, Matrix.map_apply, Matrix.add_apply,
      Matrix.diagonal_apply, hkill, derivQ_star_comm D hD, map_zero]

end Phys.Algebra.HJ

-- Foundations-only audit
#print axioms Phys.Algebra.HJ.derivQ_star_comm
#print axioms Phys.Algebra.HJ.jAct_slotA
#print axioms Phys.Algebra.HJ.jAct_Dg
#print axioms Phys.Algebra.HJ.jAct_Hm
