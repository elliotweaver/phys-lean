import Phys.Algebra.OctonionJordanHermTraceCommutator
import Mathlib.Tactic

/-! N300 PROBE J — φ as a ℚ-linear functional on hermSub, and its additivity. -/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

-- φ(C) := trace_H((Lmul C)|_H) as a function on the subtype hermSub.
noncomputable def phi (C : hermSub) : ℚ :=
  LinearMap.trace ℚ hermSub ((Lmul (C : Matrix (Fin 3) (Fin 3) (O ℚ))).restrict
    (lmul_mapsTo ((mem_hermSub).1 C.2)))

-- Is φ additive on hermSub? Lmul is linear in its matrix argument, restrict distributes... test.
theorem phi_add (C D : hermSub) : phi (C + D) = phi C + phi D := by
  unfold phi
  rw [← LinearMap.map_add (LinearMap.trace ℚ hermSub)]
  congr 1
  apply LinearMap.ext; intro X; apply Subtype.ext
  simp only [LinearMap.restrict_coe_apply, LinearMap.add_apply, Submodule.coe_add, Lmul_apply]
  -- (jb (C+D) X) = jb C X + jb D X
  show jb ((C:Matrix _ _ _) + (D:Matrix _ _ _)) (X:Matrix _ _ _)
       = jb (C:Matrix _ _ _) (X:Matrix _ _ _) + jb (D:Matrix _ _ _) (X:Matrix _ _ _)
  unfold jb; rw [add_mul, mul_add]; abel

theorem phi_smul (r : ℚ) (C : hermSub) : phi (r • C) = r * phi C := by
  unfold phi
  rw [← smul_eq_mul, ← LinearMap.map_smul (LinearMap.trace ℚ hermSub)]
  congr 1
  apply LinearMap.ext; intro X; apply Subtype.ext
  simp only [LinearMap.restrict_coe_apply, LinearMap.smul_apply, SetLike.val_smul, Lmul_apply]
  show jb (r • (C:Matrix _ _ _)) (X:Matrix _ _ _) = r • jb (C:Matrix _ _ _) (X:Matrix _ _ _)
  unfold jb; rw [mat_smul_mul, mat_mul_smul, smul_add]

end Phys.Algebra.HJ
