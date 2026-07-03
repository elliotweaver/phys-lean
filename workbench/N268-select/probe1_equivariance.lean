import Phys.Algebra.OctonionJordanThreeMatterSlots
import Phys.Algebra.TowerWorldMapColourNeutralCore
import Phys.Algebra.DerivationRep7
import Mathlib.Tactic

/-!
PROBE 1 (N268 SELECT candidate A'): the entrywise gauge action on J₃(O ℚ), and the
FORCED slot-equivariance. Measures:
  (1) derivQ_star_comm: a derivation commutes with conjugation, D (star a) = star (D a).
  (2) jAct D (slotA a) = slotA (D a)  — the (0,1) slot intertwines the entrywise action.
  (3) the diagonal Dg is gauge-fixed: jAct D (Dg d0 d1 d2) = 0.
All EXIT 0 foundations-only ⟹ candidate A' cruxes clear.
-/

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

/-- A derivation commutes with conjugation on `O ℚ`: `D (star a) = star (D a)`.
    Route: `a + star a = (2 reQ a)•1` (trace_id), `D 1 = 0` (derivQ_one), `star (D a) = -D a`
    (derivQ_maps_im). -/
theorem derivQ_star_comm (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) (a : O ℚ) :
    D (star a) = star (D a) := by
  have htr : a + star a = (2 * reQ a) • (1 : O ℚ) := trace_id a
  have hstar_a : star a = (2 * reQ a) • (1 : O ℚ) - a := by
    rw [← htr]; ring
  have h1 : D 1 = 0 := derivQ_one D hD
  have hmap : star (D a) = - D a := derivQ_maps_im D hD a
  rw [hstar_a, map_sub, map_smul, h1, smul_zero, zero_sub, hmap]

/-- The entrywise gauge action: apply the derivation `D` to each octonion entry of a matrix. -/
noncomputable def jAct (D : Module.End ℚ (O ℚ)) (M : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    Matrix (Fin 3) (Fin 3) (O ℚ) := M.map (fun x => D x)

/-- ★ SLOT EQUIVARIANCE (0,1): the entrywise action commutes with the first slot embedding.
    `jAct D (slotA a) = slotA (D a)`. The (0,1) entry maps `a ↦ D a`; the (1,0) entry maps
    `star a ↦ D (star a) = star (D a)` (derivQ_star_comm); zeros stay zero (D 0 = 0). -/
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

/-- ★ THE DIAGONAL IS GAUGE-FIXED: `jAct D (Dg d0 d1 d2) = 0`. Each diagonal entry is a
    central scalar `ocR dᵢ`; a derivation kills scalars (`D 1 = 0` ⟹ `D (ocR d) = 0`). -/
theorem jAct_Dg (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) (d0 d1 d2 : ℚ) :
    jAct D (Dg d0 d1 d2) = 0 := by
  have h1 : D 1 = 0 := derivQ_one D hD
  have hkill : ∀ r : ℚ, D (ocR r) = 0 := by
    intro r
    have : ocR r = r • (1 : O ℚ) := by rw [qsmul_def, mul_one]
    rw [this, map_smul, h1, smul_zero]
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [jAct, Dg, Matrix.map_apply, Matrix.diagonal_apply, hkill, map_zero]

end Phys.Algebra.HJ
