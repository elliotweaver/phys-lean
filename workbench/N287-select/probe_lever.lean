import Phys.Algebra.OctonionJordanInnerDerivationLeibniz

/-! N287 scratch — DE-RISK the coordinate-free gauge-neutrality lever.
    Goal: ⁅jActL D, innerMul A B⁆ = innerMul (jAct D A) B + innerMul A (jAct D B)
    then specialize to A=slotA 1, B=slotB 1 (jAct D (slotA 1)=slotA (D 1)=0). -/

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

variable (D : Module.End ℚ (O ℚ))

-- Step 1: [jActL D, Lmul A] = Lmul (jAct D A) as operators, from jAct_jb.
-- Lmul A X = jb A X ; jActL D X = jAct D X.
example (hD : IsDerivQ D) (A X : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    (jActL D) (Lmul A X) - (Lmul A) (jActL D X) = Lmul (jAct D A) X := by
  simp only [jActL_apply, Lmul_apply]
  rw [jAct_jb D hD A X]
  simp only [jb]
  abel

-- Step 2: THE LEVER via direct expansion (avoid Jacobi machinery, expand innerMul).
-- innerMul A B = Lmul A ∘ Lmul B - Lmul B ∘ Lmul A.
-- ⁅jActL D, innerMul A B⁆ X = jActL D (innerMul A B X) - innerMul A B (jActL D X).
example (hD : IsDerivQ D) (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    ⁅jActL D, innerMul A B⁆
      = innerMul (jAct D A) B + innerMul A (jAct D B) := by
  rw [show (⁅jActL D, innerMul A B⁆ :
      Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)))
        = jActL D * innerMul A B - innerMul A B * jActL D from
      Ring.lie_def _ _]
  apply LinearMap.ext; intro X
  simp only [LinearMap.sub_apply, LinearMap.add_apply, Module.End.mul_apply,
    innerMul_apply, jActL_apply]
  -- LHS: jAct D (jb A (jb B X) - jb B (jb A X)) - (jb A (jb B (jAct D X)) - jb B (jb A (jAct D X)))
  -- push jAct D through jb via jAct_jb (three layers)
  rw [show jAct D (jb A (jb B X) - jb B (jb A X))
        = jAct D (jb A (jb B X)) - jAct D (jb B (jb A X)) from
      map_sub (jActL D) _ _]
  rw [jAct_jb D hD A (jb B X), jAct_jb D hD B X, jAct_jb D hD B (jb A X), jAct_jb D hD A X]
  -- RHS unfolds to jb (jAct D A) (jb B X) - jb B (jb (jAct D A) X) + jb A (jb (jAct D B) X) - jb (jAct D B) (jb A X)
  simp only [jb, mul_add, add_mul, mul_sub, sub_mul, map_add, map_sub]
  abel

end Phys.Algebra.HJ
