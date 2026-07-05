import Phys.Algebra.OctonionJordanHermTraceCommutator
import Mathlib.Tactic

/-! N300 PROBE J2 — φ additive, careful with subtype coercions (avoid expensive `show`). -/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

noncomputable def phi (C : hermSub) : ℚ :=
  LinearMap.trace ℚ hermSub ((Lmul (C : Matrix (Fin 3) (Fin 3) (O ℚ))).restrict
    (lmul_mapsTo ((mem_hermSub).1 C.2)))

-- key: Lmul is additive/smul in the MATRIX arg; the restrict of Lmul(C+D) equals sum of restricts.
theorem lmul_restrict_add (C D : hermSub) :
    (Lmul ((C : Matrix (Fin 3) (Fin 3) (O ℚ)) + (D : Matrix (Fin 3) (Fin 3) (O ℚ)))).restrict
        (lmul_mapsTo ((mem_hermSub).1 (C + D).2))
      = (Lmul (C : Matrix (Fin 3) (Fin 3) (O ℚ))).restrict (lmul_mapsTo ((mem_hermSub).1 C.2))
        + (Lmul (D : Matrix (Fin 3) (Fin 3) (O ℚ))).restrict (lmul_mapsTo ((mem_hermSub).1 D.2)) := by
  apply LinearMap.ext; intro X; apply Subtype.ext
  simp only [LinearMap.restrict_coe_apply, LinearMap.add_apply, Submodule.coe_add, Lmul_apply, jb]
  rw [add_mul, mul_add]; abel

theorem phi_add (C D : hermSub) : phi (C + D) = phi C + phi D := by
  unfold phi
  rw [show ((Lmul ((C + D : hermSub) : Matrix (Fin 3) (Fin 3) (O ℚ))).restrict
        (lmul_mapsTo ((mem_hermSub).1 (C + D).2)))
      = (Lmul ((C : Matrix (Fin 3) (Fin 3) (O ℚ)) + (D : Matrix (Fin 3) (Fin 3) (O ℚ)))).restrict
        (lmul_mapsTo ((mem_hermSub).1 (C + D).2)) from by rw [Submodule.coe_add]]
  rw [lmul_restrict_add C D, LinearMap.map_add]

end Phys.Algebra.HJ
