import Phys.Algebra.DerivationSimpleCollapse
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)
open Matrix
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
attribute [local instance] derivationLieQ_semisimple
noncomputable section

-- generic skew_odd_det_zero (graduated form, will live in Collapse namespace)
set_option maxHeartbeats 800000 in
theorem skew_odd_det_zero {K W : Type*} [Field K] [AddCommGroup W] [Module K W]
    [FiniteDimensional K W]
    (B : BilinForm K W) (hB : B.Nondegenerate)
    (f : Module.End K W) (hf : B.IsSkewAdjoint f)
    (hodd : Odd (Module.finrank K W)) (h2 : (2 : K) ≠ 0) :
    LinearMap.det f = 0 := by
  classical
  let b := Module.finBasis K W
  have hcl : B.compLeft f = - B.compRight f := by
    ext x y
    have hxy : B (f x) y = B x ((-f) y) := hf x y
    simp only [LinearMap.BilinForm.compLeft_apply, BilinForm.neg_apply,
      LinearMap.BilinForm.compRight_apply]
    rw [hxy]; simp
  have hMl := LinearMap.BilinForm.toMatrix_compLeft b B f
  have hMr := LinearMap.BilinForm.toMatrix_compRight b B f
  have hMeq : (LinearMap.toMatrix b b f)ᵀ * LinearMap.BilinForm.toMatrix b B
      = - (LinearMap.BilinForm.toMatrix b B * LinearMap.toMatrix b b f) := by
    rw [← hMl, ← hMr, hcl]
    exact map_neg (LinearMap.BilinForm.toMatrix b) _
  have hdetcard : Fintype.card (Fin (Module.finrank K W)) = Module.finrank K W :=
    Fintype.card_fin _
  have h1 := congrArg Matrix.det hMeq
  rw [Matrix.det_mul, Matrix.det_transpose, Matrix.det_neg, Matrix.det_mul, hdetcard] at h1
  have hGdet : (LinearMap.BilinForm.toMatrix b B).det ≠ 0 :=
    (LinearMap.BilinForm.nondegenerate_iff_det_ne_zero b).mp hB
  have hsign : (-1 : K)^(Module.finrank K W) = -1 := Odd.neg_one_pow hodd
  rw [hsign] at h1
  set Fd := (LinearMap.toMatrix b b f).det with hFd
  set Gd := (LinearMap.BilinForm.toMatrix b B).det with hGd
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

-- (a) nondegeneracy of the full restricted Born form on ↥ImO
example : (gBil.restrict ImO).Nondegenerate := by
  refine ⟨?_, ?_⟩
  · intro x hx
    have h0 : gForm ((x : ImO) : O ℚ) ((x : ImO) : O ℚ) = 0 := by
      simpa [BilinForm.restrict, gBil_apply] using hx x
    exact Subtype.ext (gForm_self_eq_zero.mp h0)
  · intro y hy
    have h0 : gForm ((y : ImO) : O ℚ) ((y : ImO) : O ℚ) = 0 := by
      simpa [BilinForm.restrict, gBil_apply] using hy y
    exact Subtype.ext (gForm_self_eq_zero.mp h0)

-- (b) finrank ↥ImO = 7 is odd
example : Odd (Module.finrank ℚ ImO) := by rw [finrank_ImO]; decide

end
end Phys.Algebra
