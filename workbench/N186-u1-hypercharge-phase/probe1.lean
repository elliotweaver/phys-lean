import Phys.Algebra.DerivationIrreducibleFull
import Mathlib.Tactic

namespace Phys.Algebra.N186Probe

open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)

attribute [local instance] dblModuleQ

noncomputable section

theorem star_qsmul (c : ℚ) (w : Dbl ℚ) : star (c • w) = c • star w := by
  ext <;> simp [Dbl.star_re', Dbl.star_im', Dbl.smul_re, Dbl.smul_im]

/-- The self-overlap form on the complex-unit rung `Dbl ℚ`. -/
def bForm : BilinForm ℚ (Dbl ℚ) where
  toFun v := {
    toFun := fun w => (v * star w).re
    map_add' := by intro w1 w2; simp [Dbl.mul_re, Dbl.star_re', Dbl.star_im']; ring
    map_smul' := by
      intro c w
      simp only [RingHom.id_apply, smul_eq_mul]
      show (v * star (c • w)).re = c * (v * star w).re
      rw [star_qsmul]
      simp [Dbl.mul_re, Dbl.smul_re, Dbl.smul_im]; ring }
  map_add' := by intro v1 v2; ext w; simp [Dbl.mul_re, Dbl.star_re', Dbl.star_im']; ring
  map_smul' := by
    intro c v; ext w
    simp only [RingHom.id_apply, smul_eq_mul, LinearMap.smul_apply, LinearMap.coe_mk,
      AddHom.coe_mk]
    show ((c • v) * star w).re = c * (v * star w).re
    simp [Dbl.mul_re, Dbl.smul_re]; ring

@[simp] theorem bForm_apply (v w : Dbl ℚ) : bForm v w = (v * star w).re := rfl

/-- `bForm v v = v.re² + v.im²` — sum of two ℚ-squares (the Born positivity, one rung down). -/
theorem bForm_self (v : Dbl ℚ) : bForm v v = v.re ^ 2 + v.im ^ 2 := by
  simp only [bForm_apply, Dbl.mul_re, Dbl.star_re', Dbl.star_im']; ring

theorem bForm_symm (v w : Dbl ℚ) : bForm v w = bForm w v := by
  simp only [bForm_apply, Dbl.mul_re, Dbl.star_re', Dbl.star_im']; ring

theorem bForm_isSymm : (bForm).IsSymm := ⟨fun x y => bForm_symm x y⟩

theorem bForm_self_eq_zero {v : Dbl ℚ} : bForm v v = 0 ↔ v = 0 := by
  rw [bForm_self]
  constructor
  · intro h
    have hre : v.re = 0 := by nlinarith [sq_nonneg v.re, sq_nonneg v.im]
    have him : v.im = 0 := by nlinarith [sq_nonneg v.re, sq_nonneg v.im]
    exact Dbl.ext hre him
  · intro h; subst h; simp

theorem bForm_nondegenerate : bForm.Nondegenerate := by
  refine ⟨?_, ?_⟩
  · intro x hx
    have : bForm x x = 0 := hx x
    exact bForm_self_eq_zero.mp this
  · intro y hy
    have : bForm y y = 0 := by rw [bForm_symm]; exact hy y
    exact bForm_self_eq_zero.mp this

/-- Multiplication by the complex unit `J` — the phase rotation `z ↦ J·z`. -/
def L_J : Module.End ℚ (Dbl ℚ) where
  toFun z := Dbl.J * z
  map_add' := by intro x y; ring
  map_smul' := by
    intro c z; simp only [RingHom.id_apply]
    show Dbl.J * (c • z) = c • (Dbl.J * z)
    ext <;> simp [Dbl.J, Dbl.mul_re, Dbl.mul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

@[simp] theorem L_J_apply (z : Dbl ℚ) : L_J z = Dbl.J * z := rfl

/-- The phase rotation is SKEW-ADJOINT for the self-overlap form: J* = −J. -/
theorem L_J_skew : bForm.IsSkewAdjoint L_J := by
  intro x y
  show bForm (Dbl.J * x) y = bForm x ((-L_J) y)
  simp only [LinearMap.neg_apply, L_J_apply, bForm_apply]
  simp only [Dbl.J, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.neg_re, Dbl.neg_im]
  ring

theorem L_J_ne_zero : L_J ≠ 0 := by
  intro h
  have h1 : L_J (1 : Dbl ℚ) = 0 := by rw [h]; rfl
  rw [L_J_apply, mul_one] at h1
  have : (1 : ℚ) = 0 := by have := congrArg Dbl.im h1; simpa [Dbl.J] using this
  exact one_ne_zero this

instance : FiniteDimensional ℚ (Dbl ℚ) :=
  Module.Finite.equiv dblProdEquiv.symm

/-- UPPER BOUND: dim so(Born on Dbl ℚ) ≤ (finrank (Dbl ℚ)).choose 2 = (2).choose 2 = 1. -/
theorem dim_le_one : Module.finrank ℚ bForm.skewAdjointSubmodule ≤ 1 := by
  have h := finrank_skewAdjoint_le_choose bForm bForm_isSymm bForm_nondegenerate
  rw [finrank_dbl_eq_two] at h
  simpa using h

/-- LOWER BOUND: the submodule is nonzero (contains `L_J ≠ 0`). -/
theorem skewAdjoint_ne_bot : bForm.skewAdjointSubmodule ≠ ⊥ := by
  intro h
  apply L_J_ne_zero
  have hmem : L_J ∈ bForm.skewAdjointSubmodule := (LinearMap.mem_skewAdjointSubmodule _).mpr L_J_skew
  rw [h, Submodule.mem_bot] at hmem
  exact hmem

theorem one_le_dim : 1 ≤ Module.finrank ℚ bForm.skewAdjointSubmodule :=
  Submodule.one_le_finrank_iff.mpr skewAdjoint_ne_bot

/-- ★★ THE u(1) ≅ so(2) DIMENSION = 1 — the third SM gauge factor's rank. -/
theorem finrank_phase_eq_one : Module.finrank ℚ bForm.skewAdjointSubmodule = 1 :=
  le_antisymm dim_le_one one_le_dim

#print axioms finrank_phase_eq_one
#print axioms L_J_skew
#print axioms bForm_nondegenerate

end

end Phys.Algebra.N186Probe
