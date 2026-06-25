import Mathlib

open LinearMap (BilinForm)
open Matrix
noncomputable section

variable {K V : Type*} [Field K] [AddCommGroup V] [Module K V] [FiniteDimensional K V]

set_option maxHeartbeats 800000 in
/-- A nonzero skew-adjoint operator for a nondegenerate bilinear form on an ODD-dimensional
    space over a field of characteristic ≠ 2 is singular: `det f = 0`. (`Fᵀ G = -(G F)` ⟹
    `det F · det G = (-1)^n det G · det F`; `n` odd, `2 ≠ 0`, `det G ≠ 0` force `det F = 0`.) -/
theorem skew_odd_det_zero (B : BilinForm K V) (hB : B.Nondegenerate)
    (f : Module.End K V) (hf : B.IsSkewAdjoint f)
    (hodd : Odd (Module.finrank K V)) (h2 : (2 : K) ≠ 0) :
    LinearMap.det f = 0 := by
  classical
  let b := Module.finBasis K V
  -- skew-adjoint: B.compLeft f = - B.compRight f
  have hcl : B.compLeft f = - B.compRight f := by
    ext x y
    have hxy : B (f x) y = B x ((-f) y) := hf x y
    simp only [LinearMap.BilinForm.compLeft_apply, BilinForm.neg_apply,
      LinearMap.BilinForm.compRight_apply]
    rw [hxy]; simp
  -- matrix forms: toMatrix compLeft = Fᵀ G, compRight = G F
  have hMl := LinearMap.BilinForm.toMatrix_compLeft b B f
  have hMr := LinearMap.BilinForm.toMatrix_compRight b B f
  -- Fᵀ G = - (G F)
  have hMeq : (LinearMap.toMatrix b b f)ᵀ * LinearMap.BilinForm.toMatrix b B
      = - (LinearMap.BilinForm.toMatrix b B * LinearMap.toMatrix b b f) := by
    rw [← hMl, ← hMr, hcl]
    exact map_neg (LinearMap.BilinForm.toMatrix b) _
  have hdetcard : Fintype.card (Fin (Module.finrank K V)) = Module.finrank K V :=
    Fintype.card_fin _
  -- take determinants of both sides
  have h1 := congrArg Matrix.det hMeq
  rw [Matrix.det_mul, Matrix.det_transpose, Matrix.det_neg, Matrix.det_mul, hdetcard] at h1
  -- h1 : det F * det G = (-1)^n * (det G * det F)
  have hGdet : (LinearMap.BilinForm.toMatrix b B).det ≠ 0 :=
    (LinearMap.BilinForm.nondegenerate_iff_det_ne_zero b).mp hB
  have hsign : (-1 : K)^(Module.finrank K V) = -1 := Odd.neg_one_pow hodd
  rw [hsign] at h1
  set Fd := (LinearMap.toMatrix b b f).det with hFd
  set Gd := (LinearMap.BilinForm.toMatrix b B).det with hGd
  -- h1 : Fd * Gd = -(Fd * Gd) ⟹ 2 * (Fd * Gd) = 0
  have h2eq : (2 : K) * (Fd * Gd) = 0 := by linear_combination h1
  have hFG : Fd * Gd = 0 := by
    rcases mul_eq_zero.mp h2eq with h | h
    · exact absurd h h2
    · exact h
  have hFdet : Fd = 0 := by
    rcases mul_eq_zero.mp hFG with h | h
    · exact h
    · exact absurd h hGdet
  rw [hFd] at hFdet
  rwa [← LinearMap.det_toMatrix b f]

end
