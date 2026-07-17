import Phys.Algebra.HermitianJordan.Setup
import Phys.Algebra.DerivationSkew
import Phys.Algebra.DerivationFinrank
import Phys.Algebra.OctonionJordanThreeMatterSlots
import Phys.Algebra.OctonionJordanHermTraceCommutator
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.LinearAlgebra.FiniteDimensional.Defs

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

theorem selfconj_eq_ocR (x : O ℚ) (h : star x = x) : x = ocR (reQ x) := by
  obtain ⟨⟨⟨xrrr, xrri⟩, ⟨xrir, xrii⟩⟩, ⟨⟨xirr, xiri⟩, ⟨xiir, xiii⟩⟩⟩ := x
  simp only [CD.ext_iff, Dbl.ext_iff] at h
  simp only [CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im',
    CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im] at h
  simp only [ocR, reQ]
  obtain ⟨⟨⟨_, h2⟩, h3, h4⟩, ⟨h5, h6⟩, h7, h8⟩ := h
  refine CD.ext (CD.ext (Dbl.ext rfl ?_) (Dbl.ext ?_ ?_)) (CD.ext (Dbl.ext ?_ ?_) (Dbl.ext ?_ ?_)) <;>
    simp only [] <;> linarith

/-- reQ is ℚ-additive. -/
theorem reQ_add (x y : O ℚ) : reQ (x + y) = reQ x + reQ y := by
  simp only [reQ, CD.add_re, Dbl.add_re]

/-- reQ commutes with ℚ-scaling (the module smul on O ℚ from cd_qsmul). -/
theorem reQ_smul (q : ℚ) (x : O ℚ) : reQ (q • x) = q * reQ x := by
  simp only [reQ]
  -- q • x on O ℚ = CD (H ℚ): re-layer scales componentwise
  simp [cd_qsmul_re]

noncomputable def build (p : (Fin 3 → ℚ) × (O ℚ × O ℚ × O ℚ)) : hermSub :=
  ⟨Hm (p.1 0) (p.1 1) (p.1 2) p.2.1 p.2.2.1 p.2.2.2, by
    rw [mem_hermSub]
    apply Matrix.ext; intro i j
    simp only [Matrix.conjTranspose_apply, Hm]
    fin_cases i <;> fin_cases j <;>
      simp [Matrix.of_apply, Matrix.cons_val, ocR_star, star_star]⟩

noncomputable def readOff (M : hermSub) : (Fin 3 → ℚ) × (O ℚ × O ℚ × O ℚ) :=
  (fun i => reQ ((M : Matrix (Fin 3) (Fin 3) (O ℚ)) i i),
    ((M : Matrix (Fin 3) (Fin 3) (O ℚ)) 0 1,
     (M : Matrix (Fin 3) (Fin 3) (O ℚ)) 0 2,
     (M : Matrix (Fin 3) (Fin 3) (O ℚ)) 1 2))

theorem readOff_build (p : (Fin 3 → ℚ) × (O ℚ × O ℚ × O ℚ)) : readOff (build p) = p := by
  obtain ⟨d, a, b, c⟩ := p
  simp only [readOff, build, Hm]
  refine Prod.ext ?_ ?_
  · funext i; fin_cases i <;> simp [Matrix.of_apply, Matrix.cons_val, reQ, ocR]
  · simp [Matrix.of_apply, Matrix.cons_val]

theorem build_readOff (M : hermSub) : build (readOff M) = M := by
  apply Subtype.ext
  obtain ⟨M, hM⟩ := M
  rw [mem_hermSub] at hM
  -- hM : Mᴴ = M, i.e. ∀ i j, star (M j i) = M i j
  have hstar : ∀ i j, star (M j i) = M i j := by
    intro i j; have := congrFun (congrFun hM i) j
    rwa [Matrix.conjTranspose_apply] at this
  simp only [build, readOff, Hm]
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp only [Matrix.of_apply, Matrix.cons_val, Matrix.cons_val_zero, Matrix.cons_val_one,
      Matrix.head_cons, Matrix.head_fin_const, Fin.isValue] <;>
    first
      | rfl
      | exact (selfconj_eq_ocR _ (hstar _ _)).symm
      | exact hstar _ _

/-- ★ THE STRUCTURAL EQUIVALENCE. -/
noncomputable def hermEquiv : hermSub ≃ₗ[ℚ] (Fin 3 → ℚ) × (O ℚ × O ℚ × O ℚ) where
  toFun := readOff
  invFun := build
  left_inv := build_readOff
  right_inv := readOff_build
  map_add' := by
    intro M N
    simp only [readOff, Submodule.coe_add, Matrix.add_apply]
    refine Prod.ext ?_ ?_
    · funext i; simp [reQ_add]
    · simp [Prod.ext_iff]
  map_smul' := by
    intro q M
    simp only [readOff, SetLike.val_smul, Matrix.smul_apply, RingHom.id_apply, Prod.smul_def]
    refine Prod.ext ?_ ?_
    · funext i; simp [reQ_smul]
    · simp [Prod.ext_iff, Prod.smul_def]

theorem finrank_hermSub_eq_27 : Module.finrank ℚ hermSub = 27 := by
  rw [hermEquiv.finrank_eq, Module.finrank_prod]
  rw [Module.finrank_pi (R := ℚ) (ι := Fin 3)]
  simp only [Module.finrank_self, Finset.sum_const, Finset.card_univ, Fintype.card_fin,
    smul_eq_mul, mul_one]
  rw [Module.finrank_prod, Module.finrank_prod, finrank_O_eq_eight]

end Phys.Algebra.HJ
