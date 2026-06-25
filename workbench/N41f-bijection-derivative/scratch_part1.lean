import Phys.Algebra.DerivationOProductPreserving

namespace Phys.Algebra
open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix
open scoped BigOperators Topology
noncomputable section
attribute [local instance] CD.narCD CD.srCD

/-! ## crux (banked from probe) -/
theorem coordOCut_expO (D' : Module.End Cut (O Cut)) (x : O Cut) :
    coordOCut (expO (D'.restrictScalars ℤ) x)
      = expMap (derivMatrix D') *ᵥ coordOCut x := by
  have hsum : HasSum (fun n => (1 / (n.factorial : Cut)) • (((D'.restrictScalars ℤ) ^ n) x))
      (expO (D'.restrictScalars ℤ) x) := by
    unfold expO; exact (expO_summable_restrict D' x).hasSum
  have hmap := hsum.map (coordOCut.toLinearMap.toAddMonoidHom) coordOCut_continuous
  have hterm : (fun n => coordOCut ((1 / (n.factorial : Cut)) • (((D'.restrictScalars ℤ) ^ n) x)))
      = (fun n => expTerm (derivMatrix D') n *ᵥ coordOCut x) := by
    funext n; rw [restrictScalars_pow_apply, expO_term_coord]
  have hmat : HasSum (fun n => expTerm (derivMatrix D') n *ᵥ coordOCut x)
      (expMap (derivMatrix D') *ᵥ coordOCut x) := by
    have := (expMap_hasSum (derivMatrix D')).map (mulVecHom (coordOCut x))
      (mulVecHom_continuous (coordOCut x))
    simpa [mulVecHom] using this
  have hmap' : HasSum (fun n => expTerm (derivMatrix D') n *ᵥ coordOCut x)
      (coordOCut (expO (D'.restrictScalars ℤ) x)) := by
    have := hmap
    simp only [LinearMap.toAddMonoidHom_coe, LinearEquiv.coe_coe, Function.comp_def] at this
    rw [hterm] at this; exact this
  exact hmap'.unique hmat

/-! ## derivMatrix additivity / negation -/
theorem derivMatrix_neg (D' : Module.End Cut (O Cut)) :
    derivMatrix (-D') = - derivMatrix D' := by
  unfold derivMatrix; rw [map_neg, map_neg]

/-! ## the Cut-LINEAR exponential map (composition route — manifestly linear) -/

/-- The Cut-linear exponential endomorphism: `coordOCut.symm ∘ (expMap M *ᵥ ·) ∘ coordOCut`.
    Manifestly Cut-linear (composition of Cut-linear maps); equals the vector exponential by
    `coordOCut_expO`. -/
def expOLin (D' : Module.End Cut (O Cut)) : O Cut →ₗ[Cut] O Cut :=
  coordOCut.symm.toLinearMap ∘ₗ
    (Matrix.mulVecLin (expMap (derivMatrix D'))) ∘ₗ coordOCut.toLinearMap

/-- `expOLin D' x = expO (D'.restrictScalars ℤ) x` — the Cut-linear map IS the vector exponential. -/
theorem expOLin_apply (D' : Module.End Cut (O Cut)) (x : O Cut) :
    expOLin D' x = expO (D'.restrictScalars ℤ) x := by
  unfold expOLin
  simp only [LinearMap.comp_apply, LinearEquiv.coe_coe]
  rw [show Matrix.mulVecLin (expMap (derivMatrix D')) (coordOCut x)
        = expMap (derivMatrix D') *ᵥ coordOCut x from rfl,
    ← coordOCut_expO, LinearEquiv.symm_apply_apply]

/-! ## the bijection (free from the N40 matrix GL-law) -/

/-- `expOLin D' ∘ expOLin (-D') = id`: the composition collapses to `coordOCut.symm ((expMap M *
    expMap (-M)) *ᵥ coordOCut x) = coordOCut.symm (1 *ᵥ coordOCut x) = x`, via the banked GL-law
    `expMap_mul_neg`. -/
theorem expOLin_comp_neg (D' : Module.End Cut (O Cut)) (x : O Cut) :
    expOLin D' (expOLin (-D') x) = x := by
  unfold expOLin
  simp only [LinearMap.comp_apply, LinearEquiv.coe_coe, LinearEquiv.apply_symm_apply]
  rw [show Matrix.mulVecLin (expMap (derivMatrix (-D'))) (coordOCut x)
        = expMap (derivMatrix (-D')) *ᵥ coordOCut x from rfl,
    show Matrix.mulVecLin (expMap (derivMatrix D'))
          (expMap (derivMatrix (-D')) *ᵥ coordOCut x)
        = expMap (derivMatrix D') *ᵥ (expMap (derivMatrix (-D')) *ᵥ coordOCut x) from rfl,
    Matrix.mulVec_mulVec, derivMatrix_neg, expMap_mul_neg, Matrix.one_mulVec,
    LinearEquiv.symm_apply_apply]

theorem expOLin_neg_comp (D' : Module.End Cut (O Cut)) (x : O Cut) :
    expOLin (-D') (expOLin D' x) = x := by
  unfold expOLin
  simp only [LinearMap.comp_apply, LinearEquiv.coe_coe, LinearEquiv.apply_symm_apply]
  rw [show Matrix.mulVecLin (expMap (derivMatrix D')) (coordOCut x)
        = expMap (derivMatrix D') *ᵥ coordOCut x from rfl,
    show Matrix.mulVecLin (expMap (derivMatrix (-D')))
          (expMap (derivMatrix D') *ᵥ coordOCut x)
        = expMap (derivMatrix (-D')) *ᵥ (expMap (derivMatrix D') *ᵥ coordOCut x) from rfl,
    Matrix.mulVec_mulVec, derivMatrix_neg, expMap_neg_mul, Matrix.one_mulVec,
    LinearEquiv.symm_apply_apply]

/-- ★ THE BIJECTION: `expO (D'.restrictScalars ℤ)` as a Cut-linear EQUIVALENCE of `O Cut`, with
    inverse `expO ((-D').restrictScalars ℤ)`. -/
def expOEquiv (D' : Module.End Cut (O Cut)) : O Cut ≃ₗ[Cut] O Cut :=
  LinearEquiv.ofLinear (expOLin D') (expOLin (-D'))
    (LinearMap.ext (fun x => expOLin_comp_neg D' x))
    (LinearMap.ext (fun x => expOLin_neg_comp D' x))
theorem expOEquiv_apply (D' : Module.End Cut (O Cut)) (x : O Cut) :
    expOEquiv D' x = expO (D'.restrictScalars ℤ) x := expOLin_apply D' x

theorem expOEquiv_symm_apply (D' : Module.End Cut (O Cut)) (x : O Cut) :
    (expOEquiv D').symm x = expO ((-D').restrictScalars ℤ) x := expOLin_apply (-D') x

/-! ## unital: expO D 1 = 1 (from the Leibniz law D 1 = 0) -/

/-- A Leibniz derivation kills the unit: `D 1 = 0`. From `D 1 = D(1·1) = D 1·1 + 1·D 1 = 2 D 1`. -/
theorem deriv_one_eq_zero (D : Module.End ℤ (O Cut)) (hD : IsDeriv D) : D 1 = 0 := by
  have h := hD 1 1
  simp only [one_mul, mul_one] at h
  -- h : D 1 = D 1 + D 1
  have h2 : D 1 + D 1 = D 1 := h.symm
  have : D 1 = 0 := by
    have := sub_eq_zero.mpr h2
    simpa [add_sub_cancel_left] using this
  exact this

/-- All higher powers of a Leibniz derivation kill the unit: `(D^(n+1)) 1 = 0`. -/
theorem deriv_pow_succ_one (D : Module.End ℤ (O Cut)) (hD : IsDeriv D) (n : ℕ) :
    (D ^ (n + 1)) 1 = 0 := by
  rw [pow_succ, Module.End.mul_apply, deriv_one_eq_zero D hD, map_zero]

/-- ★ UNITAL: `expO D 1 = 1` for a Leibniz derivation. Only the `n=0` term `(1/0!)•(D⁰ 1) = 1`
    survives; every higher term has `(D^(n+1)) 1 = 0`. -/
theorem expO_one (D' : Module.End Cut (O Cut)) (hD : IsDeriv (D'.restrictScalars ℤ)) :
    expO (D'.restrictScalars ℤ) (1 : O Cut) = 1 := by
  unfold expO
  rw [tsum_eq_single 0]
  · simp
  · intro n hn
    obtain ⟨m, rfl⟩ := Nat.exists_eq_succ_of_ne_zero hn
    rw [deriv_pow_succ_one _ hD m, smul_zero]

/-! ## THE AUTOMORPHISM -/

/-- The Cut-side algebra-automorphism predicate (mirror of the ℚ-side `IsAlgAut`): a Cut-linear
    equivalence that is multiplicative and unital. -/
def IsAlgAutCut (φ : O Cut ≃ₗ[Cut] O Cut) : Prop :=
  (∀ x y, φ (x * y) = φ x * φ y) ∧ φ 1 = 1

/-- ★★ THE HEADLINE: the exponential of a Leibniz derivation is a genuine Cut-side algebra
    automorphism of the non-associative octonion algebra `O Cut` — Cut-linear (it is a `≃ₗ[Cut]`),
    structure-preserving (banked N41e `expO_mul`), unital (`expO_one`), invertible (inverse
    `expO (-D)`). The literal Lie-algebra → Lie-group correspondence, over the derived ℝ. -/
theorem expOEquiv_isAlgAut (D' : Module.End Cut (O Cut))
    (hD : IsDeriv (D'.restrictScalars ℤ)) : IsAlgAutCut (expOEquiv D') := by
  constructor
  · intro x y
    rw [expOEquiv_apply, expOEquiv_apply, expOEquiv_apply, expO_mul D' hD]
  · rw [expOEquiv_apply, expO_one D' hD]

/-! ## NON-VACUITY (W8) -/

/-- NON-VACUITY: the zero derivation's exponential is the identity automorphism. -/
theorem expOEquiv_zero_isAlgAut :
    IsAlgAutCut (expOEquiv (0 : Module.End Cut (O Cut))) :=
  expOEquiv_isAlgAut 0 (by intro u v; simp)

end
end Phys.Algebra
