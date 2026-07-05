import Phys.Algebra.OctonionJordanHermTraceCommutator
import Mathlib.Tactic

/-! N300 PROBE G — the TRACE-CONJUGATION crux (clean rewrite). -/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

noncomputable def csign (s : Fin 3 → ℚ) (X : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    Matrix (Fin 3) (Fin 3) (O ℚ) := Matrix.of (fun i j => (s i * s j) • X i j)

theorem csign_jb (s : Fin 3 → ℚ) (hs : ∀ i, s i * s i = 1) (C X : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    csign s (jb C X) = jb (csign s C) (csign s X) := by
  unfold csign jb
  apply Matrix.ext; intro i j
  simp only [Matrix.of_apply, Matrix.add_apply, Matrix.mul_apply, Matrix.of_apply,
    smul_add, Finset.smul_sum]
  congr 1 <;>
  · apply Finset.sum_congr rfl; intro k _
    rw [qsmul_mul_left, qsmul_mul_right, smul_smul,
        show s i * s k * (s k * s j) = s i * s j * (s k * s k) by ring, hs k, mul_one]

theorem csign_herm (s : Fin 3 → ℚ) {X : Matrix (Fin 3) (Fin 3) (O ℚ)} (hX : Xᴴ = X) :
    (csign s X)ᴴ = csign s X := by
  unfold csign; apply Matrix.ext; intro i j
  simp only [Matrix.conjTranspose_apply, Matrix.of_apply]
  rw [star_smul, star_trivial]
  have h := congrFun (congrFun hX i) j
  rw [Matrix.conjTranspose_apply] at h
  rw [h, mul_comm (s j) (s i)]

theorem csign_invol (s : Fin 3 → ℚ) (hs : ∀ i, s i * s i = 1) (X : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    csign s (csign s X) = X := by
  unfold csign; apply Matrix.ext; intro i j
  simp only [Matrix.of_apply, smul_smul,
    show s i * s j * (s i * s j) = (s i * s i) * (s j * s j) by ring, hs i, hs j, one_mul, one_smul]

noncomputable def csignL (s : Fin 3 → ℚ) : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)) where
  toFun := csign s
  map_add' X Y := by unfold csign; apply Matrix.ext; intro i j; simp only [Matrix.of_apply, Matrix.add_apply, smul_add]
  map_smul' r X := by
    unfold csign; apply Matrix.ext; intro i j
    simp only [Matrix.of_apply, Matrix.smul_apply, RingHom.id_apply]
    rw [smul_smul, smul_smul, mul_comm (s i * s j) r]

@[simp] theorem csignL_apply (s) (X) : csignL s X = csign s X := rfl

theorem csign_mapsTo (s : Fin 3 → ℚ) : ∀ X ∈ hermSub, csign s X ∈ hermSub :=
  fun X hX => by rw [mem_hermSub] at hX ⊢; exact csign_herm s hX

-- involutivity of the restricted map, as a Function.Involutive
theorem csignR_invol (s : Fin 3 → ℚ) (hs : ∀ i, s i * s i = 1) :
    Function.Involutive ((csignL s).restrict (csign_mapsTo s)) := by
  intro X; apply Subtype.ext
  simp only [LinearMap.restrict_coe_apply, csignL_apply]
  exact csign_invol s hs X

noncomputable def csignE (s : Fin 3 → ℚ) (hs : ∀ i, s i * s i = 1) : hermSub ≃ₗ[ℚ] hermSub :=
  LinearEquiv.ofInvolutive ((csignL s).restrict (csign_mapsTo s)) (csignR_invol s hs)

@[simp] theorem csignE_apply (s) (hs) (X : hermSub) :
    ((csignE s hs X : hermSub) : Matrix (Fin 3) (Fin 3) (O ℚ)) = csign s (X : Matrix (Fin 3) (Fin 3) (O ℚ)) := rfl

@[simp] theorem csignE_symm_apply (s) (hs) (X : hermSub) :
    (((csignE s hs).symm X : hermSub) : Matrix (Fin 3) (Fin 3) (O ℚ)) = csign s (X : Matrix (Fin 3) (Fin 3) (O ℚ)) := by
  have : (csignE s hs).symm X = (csignE s hs) X := by
    apply (csignE s hs).injective
    rw [LinearEquiv.apply_symm_apply]
    apply Subtype.ext
    simp only [csignE_apply]
    exact (csign_invol s hs (X : Matrix (Fin 3) (Fin 3) (O ℚ))).symm
  rw [this, csignE_apply]

-- THE CRUX: trace_H(Lmul (csign s C)) = trace_H(Lmul C)
theorem trace_csign_eq (s : Fin 3 → ℚ) (hs : ∀ i, s i * s i = 1)
    {C : Matrix (Fin 3) (Fin 3) (O ℚ)} (hC : Cᴴ = C) :
    LinearMap.trace ℚ hermSub ((Lmul (csign s C)).restrict (lmul_mapsTo (csign_herm s hC)))
      = LinearMap.trace ℚ hermSub ((Lmul C).restrict (lmul_mapsTo hC)) := by
  rw [← LinearMap.trace_conj' ((Lmul C).restrict (lmul_mapsTo hC)) (csignE s hs)]
  congr 1
  apply LinearMap.ext; intro X; apply Subtype.ext
  rw [LinearEquiv.conj_apply_apply]
  simp only [csignE_apply, csignE_symm_apply, LinearMap.restrict_coe_apply, Lmul_apply]
  rw [csign_jb s hs, csign_invol s hs]

#print axioms trace_csign_eq

end Phys.Algebra.HJ
