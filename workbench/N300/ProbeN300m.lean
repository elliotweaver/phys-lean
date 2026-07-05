import Phys.Algebra.OctonionJordanHermTraceCommutator
import Mathlib.Tactic

/-! N300 PROBE M — pconj trace-invariance + E_ii idempotents (last unverified mechanisms). -/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

noncomputable def pconj (σ : Equiv.Perm (Fin 3)) (X : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    Matrix (Fin 3) (Fin 3) (O ℚ) := X.submatrix σ σ
theorem pconj_jb (σ : Equiv.Perm (Fin 3)) (C X : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    pconj σ (jb C X) = jb (pconj σ C) (pconj σ X) := by
  unfold pconj jb; rw [Matrix.submatrix_mul_equiv, Matrix.submatrix_mul_equiv]; rfl
theorem pconj_invol (σ : Equiv.Perm (Fin 3)) (hσ : σ * σ = 1) (X : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    pconj σ (pconj σ X) = X := by
  unfold pconj; rw [Matrix.submatrix_submatrix]
  have : (σ ∘ σ : Fin 3 → Fin 3) = id := by
    funext i; simp only [Function.comp_apply]
    have := Equiv.Perm.mul_apply σ σ i; rw [hσ] at this; simpa using this.symm
  rw [this, Matrix.submatrix_id_id]
theorem pconj_herm (σ : Equiv.Perm (Fin 3)) {X : Matrix (Fin 3) (Fin 3) (O ℚ)} (hX : Xᴴ = X) :
    (pconj σ X)ᴴ = pconj σ X := by unfold pconj; rw [Matrix.conjTranspose_submatrix, hX]

noncomputable def pconjL (σ : Equiv.Perm (Fin 3)) : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)) where
  toFun := pconj σ
  map_add' X Y := by unfold pconj; rfl
  map_smul' r X := by unfold pconj; rfl
@[simp] theorem pconjL_apply (σ) (X) : pconjL σ X = pconj σ X := rfl
theorem pconj_mapsTo (σ : Equiv.Perm (Fin 3)) : ∀ X ∈ hermSub, pconj σ X ∈ hermSub :=
  fun X hX => by rw [mem_hermSub] at hX ⊢; exact pconj_herm σ hX
theorem pconjR_invol (σ : Equiv.Perm (Fin 3)) (hσ : σ * σ = 1) :
    Function.Involutive ((pconjL σ).restrict (pconj_mapsTo σ)) := by
  intro X; apply Subtype.ext
  simp only [LinearMap.restrict_coe_apply, pconjL_apply]; exact pconj_invol σ hσ X
noncomputable def pconjE (σ : Equiv.Perm (Fin 3)) (hσ : σ * σ = 1) : hermSub ≃ₗ[ℚ] hermSub :=
  LinearEquiv.ofInvolutive ((pconjL σ).restrict (pconj_mapsTo σ)) (pconjR_invol σ hσ)
@[simp] theorem pconjE_apply (σ) (hσ) (X : hermSub) :
    ((pconjE σ hσ X : hermSub) : Matrix (Fin 3) (Fin 3) (O ℚ)) = pconj σ (X : Matrix (Fin 3) (Fin 3) (O ℚ)) := rfl
@[simp] theorem pconjE_symm_apply (σ) (hσ) (X : hermSub) :
    (((pconjE σ hσ).symm X : hermSub) : Matrix (Fin 3) (Fin 3) (O ℚ)) = pconj σ (X : Matrix (Fin 3) (Fin 3) (O ℚ)) := by
  have : (pconjE σ hσ).symm X = (pconjE σ hσ) X := by
    apply (pconjE σ hσ).injective
    rw [LinearEquiv.apply_symm_apply]; apply Subtype.ext
    simp only [pconjE_apply]; exact (pconj_invol σ hσ (X : Matrix (Fin 3) (Fin 3) (O ℚ))).symm
  rw [this, pconjE_apply]

theorem trace_pconj_eq (σ : Equiv.Perm (Fin 3)) (hσ : σ * σ = 1)
    {C : Matrix (Fin 3) (Fin 3) (O ℚ)} (hC : Cᴴ = C) :
    LinearMap.trace ℚ hermSub ((Lmul (pconj σ C)).restrict (lmul_mapsTo (pconj_herm σ hC)))
      = LinearMap.trace ℚ hermSub ((Lmul C).restrict (lmul_mapsTo hC)) := by
  rw [← LinearMap.trace_conj' ((Lmul C).restrict (lmul_mapsTo hC)) (pconjE σ hσ)]
  congr 1
  apply LinearMap.ext; intro X; apply Subtype.ext
  rw [LinearEquiv.conj_apply_apply]
  simp only [pconjE_apply, pconjE_symm_apply, LinearMap.restrict_coe_apply, Lmul_apply]
  rw [pconj_jb σ, pconj_invol σ hσ]

#print axioms trace_pconj_eq
end Phys.Algebra.HJ
