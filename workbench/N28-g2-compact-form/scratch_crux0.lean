import Mathlib.LinearAlgebra.ExteriorPower.Basis
import Mathlib.LinearAlgebra.Alternating.Basic
import Mathlib.LinearAlgebra.BilinearForm.Properties
import Mathlib.LinearAlgebra.BilinearForm.Orthogonal
import Mathlib.LinearAlgebra.SesquilinearForm.Basic
import Mathlib.Tactic

open LinearMap (BilinForm)
noncomputable section

variable {V : Type*} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]

-- CRUX MEASURE: dim of skew-adjoint operators of a symmetric nondegenerate form ≤ C(dim V, 2).
-- Step 1: from a skew-adjoint D build an alternating Fin-2 map  v ↦ Φ (D (v 0)) (v 1).

-- Build the Fin-2 multilinear map from a bilinear form precomposed with D on the first slot,
-- using the existing bilinear-to-multilinear helper if any. Try MultilinearMap construction.

example (Φ : BilinForm ℚ V) (hsymm : Φ.IsSymm) (D : Module.End ℚ V)
    (hD : Φ.IsSkewAdjoint D) :
    True := by
  -- The bilinear map (x, y) ↦ Φ (D x) y
  let B : V →ₗ[ℚ] V →ₗ[ℚ] ℚ := (Φ.compl₁₂ D LinearMap.id)
  -- alternating: Φ (D x) x = 0  (skew-adjoint + symmetric)
  have halt : ∀ x : V, Φ (D x) x = 0 := by
    intro x
    have h := hD x x          -- Φ (D x) x = Φ x (-(D x))? check the spelling
    sorry
  trivial

end
