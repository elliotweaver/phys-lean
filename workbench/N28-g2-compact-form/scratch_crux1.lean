import Mathlib.LinearAlgebra.ExteriorPower.Basis
import Mathlib.LinearAlgebra.Alternating.Basic
import Mathlib.LinearAlgebra.BilinearForm.Properties
import Mathlib.LinearAlgebra.SesquilinearForm.Basic
import Mathlib.LinearAlgebra.Dual.Lemmas
import Mathlib.Tactic

open LinearMap (BilinForm)
noncomputable section

variable {V : Type*} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]

/-- The MultilinearMap on `Fin 2 → V` given by `m ↦ Φ (D (m 0)) (m 1)`. -/
def bml (Φ : BilinForm ℚ V) (D : Module.End ℚ V) :
    MultilinearMap ℚ (fun _ : Fin 2 => V) ℚ where
  toFun m := Φ (D (m 0)) (m 1)
  map_update_add' := by intro _ m i x y; fin_cases i <;> simp
  map_update_smul' := by intro _ m i c x; fin_cases i <;> simp

theorem bml_zero_diag (Φ : BilinForm ℚ V) (hsymm : Φ.IsSymm) (D : Module.End ℚ V)
    (hD : Φ.IsSkewAdjoint D) (x : V) : Φ (D x) x = 0 := by
  have h := hD x x
  rw [Pi.neg_apply, map_neg] at h
  have hs : Φ x (D x) = Φ (D x) x := (BilinForm.isSymm_def.mp hsymm) x (D x)
  rw [hs] at h; linarith

/-- The alternating Fin-2 map from a skew-adjoint D for a symmetric form. -/
def aml (Φ : BilinForm ℚ V) (hsymm : Φ.IsSymm) (D : Module.End ℚ V)
    (hD : Φ.IsSkewAdjoint D) : V [⋀^Fin 2]→ₗ[ℚ] ℚ where
  toMultilinearMap := bml Φ D
  map_eq_zero_of_eq' := by
    intro m i j hmij hne
    have h0 : m 0 = m 1 := by fin_cases i <;> fin_cases j <;> simp_all
    show Φ (D (m 0)) (m 1) = 0
    rw [← h0]; exact bml_zero_diag Φ hsymm D hD (m 0)

@[simp] theorem aml_apply (Φ : BilinForm ℚ V) (hsymm : Φ.IsSymm) (D : Module.End ℚ V)
    (hD : Φ.IsSkewAdjoint D) (v : Fin 2 → V) :
    aml Φ hsymm D hD v = Φ (D (v 0)) (v 1) := rfl

/-- ★ THE LINEAR MAP from skew-adjoint endos into `Dual (⋀² V)` (via the alternating-map
    universal property). -/
def skewToDual (Φ : BilinForm ℚ V) (hsymm : Φ.IsSymm) :
    Φ.skewAdjointSubmodule →ₗ[ℚ] Module.Dual ℚ (⋀[ℚ]^2 V) :=
  (exteriorPower.alternatingMapLinearEquiv (R := ℚ) (n := 2) (M := V) (N := ℚ)).toLinearMap ∘ₗ
    { toFun := fun D => aml Φ hsymm (D : Module.End ℚ V)
        ((LinearMap.mem_skewAdjointSubmodule _).mp D.2)
      map_add' := by
        intro D E; ext v
        simp only [AlternatingMap.add_apply, aml_apply, Submodule.coe_add,
          LinearMap.add_apply, map_add]
      map_smul' := by
        intro c D; ext v
        simp only [AlternatingMap.smul_apply, aml_apply, SetLike.val_smul,
          LinearMap.smul_apply, map_smul, RingHom.id_apply, smul_eq_mul] }

theorem skewToDual_injective (Φ : BilinForm ℚ V) (hsymm : Φ.IsSymm)
    (hnd : Φ.Nondegenerate) : Function.Injective (skewToDual Φ hsymm) := by
  rw [injective_iff_map_eq_zero]
  intro D hD
  -- hD : alternatingMapLinearEquiv (aml ...) = 0, hence aml ... = 0
  have haml : aml Φ hsymm (D : Module.End ℚ V)
      ((LinearMap.mem_skewAdjointSubmodule _).mp D.2) = 0 := by
    have := (exteriorPower.alternatingMapLinearEquiv (R := ℚ) (n := 2) (M := V) (N := ℚ)).map_eq_zero_iff.mp hD
    exact this
  have hzero : (D : Module.End ℚ V) = 0 := by
    ext x
    refine hnd.1 ((D : Module.End ℚ V) x) (fun y => ?_)
    have := AlternatingMap.congr_fun haml ![x, y]
    simpa [aml_apply] using this
  exact Subtype.ext hzero

/-- ★★ THE so(n)-TYPE BOUND: dim of skew-adjoint operators of a symmetric nondegenerate
    form on a d-dim space is ≤ C(d, 2). -/
theorem finrank_skewAdjoint_le_choose (Φ : BilinForm ℚ V) (hsymm : Φ.IsSymm)
    (hnd : Φ.Nondegenerate) :
    Module.finrank ℚ Φ.skewAdjointSubmodule ≤ (Module.finrank ℚ V).choose 2 := by
  have hinj := skewToDual_injective Φ hsymm hnd
  have hle := LinearMap.finrank_le_finrank_of_injective hinj
  rwa [Subspace.dual_finrank_eq, exteriorPower.finrank_eq] at hle

end
