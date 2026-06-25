/-
  # N41f — THE BIJECTION + THE Cut-side `≃ₗ[Cut]` / `IsAlgAutCut` AUTOMORPHISM of `O Cut`
  #         (the AUTOMORPHISM GROUP, increment 11, part f) over the DERIVED ℝ `ContinuumQ.Cut`.

  N41e (`Phys/Algebra/DerivationOProductPreserving.lean`) banked the genuine hard core: the
  UNCONDITIONAL literal product-preservation `expO D (x·y) = expO D x · expO D y` (`expO_mul`) for
  `D = D'.restrictScalars ℤ` of a `Cut`-linear Leibniz derivation `D'`. THIS file completes the
  LITERAL `Der(𝕆) → Aut(𝕆)` correspondence at the GROUP end: the vector exponential `expO D` is a
  genuine Cut-side ALGEBRA AUTOMORPHISM of the non-associative octonion algebra `O Cut` — a
  `Cut`-linear EQUIVALENCE (`≃ₗ[Cut]`), structure-preserving (the banked N41e `expO_mul`), UNITAL
  (`expO D 1 = 1`), and INVERTIBLE with inverse `expO (-D)`.

  ## The route (matrix-transport; reframe through the trunk — THE ONE LAW)

  The `Cut`-linearity and the invertibility are NOT bashed analytically over the non-associative
  product. They are transported, through the SAME N41d coordinate frame `coordOCut`, to the banked
  N40 MATRIX one-parameter-subgroup law `expMap_mul_neg` (`exp(M)·exp(-M) = 1`):

    (1) `coordOCut_expO` — THE INTERTWINING: the vector exponential, read in coordinates, is the
        matrix exponential applied to the coordinate vector,
        `coordOCut (expO D x) = expMap (derivMatrix D') *ᵥ coordOCut x`. The `tsum` analogue of the
        banked per-power `expO_matrix_rep`: `coordOCut` (a continuous `≃ₗ[Cut]`) commutes with the
        `tsum` (banked unconditional `expO_summable_restrict`), each term transports by the banked
        `expO_term_coord`, and the `tsum` of `(· *ᵥ v)` pulls out as `(∑' expTerm M n) *ᵥ v`.

    (2) `expOLin` — THE Cut-LINEAR MAP: `coordOCut.symm ∘ₗ mulVecLin (expMap M) ∘ₗ coordOCut`,
        MANIFESTLY `Cut`-linear (a composition of `Cut`-linear maps), and equal to the vector
        exponential by `coordOCut_expO`. This is how the `Cut`-linearity is obtained without ever
        proving the `tsum` is additive/homogeneous directly: the coordinate frame carries it.

    (3) `expOEquiv` — THE BIJECTION: `LinearEquiv.ofLinear (expOLin D') (expOLin (-D'))`, the two
        composition identities `expOLin D' ∘ expOLin (-D') = id` (and reverse) collapsing through
        `coordOCut`/`Matrix.mulVec_mulVec`/`derivMatrix_neg` to the banked `expMap_mul_neg` /
        `expMap_neg_mul` and `Matrix.one_mulVec`. The inverse of the exponential flow is the
        exponential of the negated derivation — the literal group inverse.

    (4) `expO_one` — UNITAL: a Leibniz derivation kills the unit (`deriv_one_eq_zero`: `D 1 = 0`
        from `D 1 = D(1·1) = D 1·1 + 1·D 1 = 2 D 1`), so every higher term of the series vanishes on
        `1` and only the `n=0` term `(1/0!)•1 = 1` survives.

    (5) `expOEquiv_isAlgAut` — THE HEADLINE: `IsAlgAutCut (expOEquiv D')` — multiplicative (banked
        N41e `expO_mul`) and unital (`expO_one`), on the `Cut`-linear equivalence `expOEquiv D'`.

  ## The one cause (THE ONE LAW)

  The SAME Born positivity that gave the operator norm (N38), the convergent matrix series (N39),
  the matrix one-parameter subgroup `exp(M)·exp(-M)=1` (N40), the unconditional vector-exp
  summability (N41d) and the unconditional product law (N41e) now closes the GROUP structure: the
  exponential flow of a Leibniz derivation is an automorphism, its inverse the flow of the negated
  derivation. The Lie-algebra `Der(𝕆)` integrates to the Lie group `Aut(𝕆)`; one positivity, read
  from the operator norm all the way to the one-parameter subgroup of automorphisms.

  ## What this node does NOT do (childed N41g)

  The TANGENT half `d/dt exp(tD)|₀ = D` (the `Der → Aut` derivative recovering the derivation as the
  `n=1` term of the flow, the rest `o(t)`) — a trunk-native `Tendsto` of the difference quotient over
  the N36 uniform structure, NOT Mathlib `HasDerivAt` (an ℝ/`NormedField`-valued-derivative content
  trap). It is genuine analysis (the matrix remainder bound `∑_{n≥2}(tM)ⁿ/n! = O(t²)`) and is scoped
  to the dedicated forward node on the chain tail.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2): delete "exp / derivation / automorphism / gauge /
  G₂ / colour": the file is a complete proof that the convergent power series `E(x) := ∑ₙ (1/n!)•(Dⁿ x)`
  of a Leibniz endomorphism `D` of the 8-dimensional non-associative complete-topological `*`-algebra
  over the completion-of-the-gather-of-closures of the derived rationals is a `Cut`-linear bijection
  preserving the product and the unit — a structure-preserving bijection (an algebra automorphism),
  invertible with inverse the series of `-D`. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no posited exp/G₂/Aut/metric,
  NO Mathlib ℝ as content, NO ℝ-valued `Norm`, NO Mathlib `NormedSpace.exp`/`Matrix.exp`/`HasDerivAt`,
  a fully proved implication throughout (no claim left without a proof).
-/
import Phys.Algebra.DerivationOProductPreserving

namespace Phys.Algebra

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix
open scoped BigOperators Topology

noncomputable section

attribute [local instance] CD.narCD CD.srCD

/-! ## The intertwining: the vector exponential is the matrix exponential in coordinates. -/

/-- ★ THE INTERTWINING: `coordOCut (expO (D'.restrictScalars ℤ) x) = expMap (derivMatrix D') *ᵥ
    coordOCut x`. The `tsum` analogue of the banked per-power `expO_matrix_rep`: the continuous
    `Cut`-linear `coordOCut` commutes with the (banked-summable) `tsum` defining `expO`; each term
    transports by `expO_term_coord` to `expTerm (derivMatrix D') n *ᵥ coordOCut x`; the `tsum` of
    `(· *ᵥ coordOCut x) = mulVecHom (coordOCut x)` (continuous additive) pulls out as
    `(∑' expTerm M n) *ᵥ coordOCut x = expMap M *ᵥ coordOCut x`. Sums are unique. -/
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

/-- The coordinate matrix of a negated endomorphism is the negated matrix (additivity of the
    `conjRingEquiv` and of `toMatrix'`). -/
theorem derivMatrix_neg (D' : Module.End Cut (O Cut)) :
    derivMatrix (-D') = - derivMatrix D' := by
  unfold derivMatrix; rw [map_neg, map_neg]

/-! ## The Cut-linear exponential map (composition route — manifestly linear). -/

/-- The `Cut`-LINEAR exponential endomorphism `coordOCut.symm ∘ₗ mulVecLin (expMap M) ∘ₗ coordOCut`.
    Manifestly `Cut`-linear (a composition of `Cut`-linear maps); equals the vector exponential
    `expO (D'.restrictScalars ℤ)` by `coordOCut_expO`. This is how the `Cut`-linearity of the
    exponential flow is obtained — the coordinate frame carries it, no direct `tsum`-additivity
    argument needed. -/
def expOLin (D' : Module.End Cut (O Cut)) : O Cut →ₗ[Cut] O Cut :=
  coordOCut.symm.toLinearMap ∘ₗ
    (Matrix.mulVecLin (expMap (derivMatrix D'))) ∘ₗ coordOCut.toLinearMap

/-- `expOLin D' x = expO (D'.restrictScalars ℤ) x` — the `Cut`-linear map IS the vector exponential. -/
theorem expOLin_apply (D' : Module.End Cut (O Cut)) (x : O Cut) :
    expOLin D' x = expO (D'.restrictScalars ℤ) x := by
  unfold expOLin
  simp only [LinearMap.comp_apply, LinearEquiv.coe_coe]
  rw [show Matrix.mulVecLin (expMap (derivMatrix D')) (coordOCut x)
        = expMap (derivMatrix D') *ᵥ coordOCut x from rfl,
    ← coordOCut_expO, LinearEquiv.symm_apply_apply]

/-! ## The bijection (the literal group inverse, from the N40 matrix one-parameter-subgroup law). -/

/-- `expOLin D' (expOLin (-D') x) = x`: the composition collapses, through `coordOCut`, to
    `coordOCut.symm ((expMap M * expMap (-M)) *ᵥ coordOCut x) = coordOCut.symm (1 *ᵥ coordOCut x) = x`,
    via the banked one-parameter-subgroup law `expMap_mul_neg`. -/
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

/-- `expOLin (-D') (expOLin D' x) = x`: symmetric to `expOLin_comp_neg`, via `expMap_neg_mul`. -/
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

/-- ★ THE BIJECTION: the vector exponential `expO (D'.restrictScalars ℤ)` as a `Cut`-linear
    EQUIVALENCE of `O Cut`, with inverse the exponential of the negated derivation. -/
def expOEquiv (D' : Module.End Cut (O Cut)) : O Cut ≃ₗ[Cut] O Cut :=
  LinearEquiv.ofLinear (expOLin D') (expOLin (-D'))
    (LinearMap.ext (fun x => expOLin_comp_neg D' x))
    (LinearMap.ext (fun x => expOLin_neg_comp D' x))

/-- The equivalence applies as the vector exponential. -/
theorem expOEquiv_apply (D' : Module.End Cut (O Cut)) (x : O Cut) :
    expOEquiv D' x = expO (D'.restrictScalars ℤ) x := expOLin_apply D' x

/-- The inverse equivalence applies as the exponential of the negated derivation. -/
theorem expOEquiv_symm_apply (D' : Module.End Cut (O Cut)) (x : O Cut) :
    (expOEquiv D').symm x = expO ((-D').restrictScalars ℤ) x := expOLin_apply (-D') x

/-! ## Unital: the exponential fixes the unit (from the Leibniz law `D 1 = 0`). -/

/-- A Leibniz derivation kills the unit: `D 1 = 0`. From `D 1 = D(1·1) = D 1·1 + 1·D 1 = 2 D 1`. -/
theorem deriv_one_eq_zero (D : Module.End ℤ (O Cut)) (hD : IsDeriv D) : D 1 = 0 := by
  have h := hD 1 1
  simp only [one_mul, mul_one] at h
  -- `h : D 1 = D 1 + D 1`
  have h2 : D 1 + D 1 = D 1 := h.symm
  have := sub_eq_zero.mpr h2
  simpa [add_sub_cancel_left] using this

/-- Every higher power of a Leibniz derivation kills the unit: `(D^(n+1)) 1 = 0`. -/
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

/-! ## THE AUTOMORPHISM. -/

/-- The `Cut`-side algebra-automorphism predicate (the analogue of the banked ℚ-side `IsAlgAut`): a
    `Cut`-linear equivalence that is multiplicative and unital. (`O Cut` is non-associative, so there
    is no `Algebra Cut (O Cut)` instance and no Mathlib `AlgEquiv` to import — the predicate is built
    FORWARD on the `Cut`-linear equivalence group, MACHINERY on the DERIVED object, STANDARD §3.) -/
def IsAlgAutCut (φ : O Cut ≃ₗ[Cut] O Cut) : Prop :=
  (∀ x y, φ (x * y) = φ x * φ y) ∧ φ 1 = 1

/-- ★★ THE HEADLINE: the exponential of a Leibniz derivation is a genuine `Cut`-side ALGEBRA
    AUTOMORPHISM of the non-associative octonion algebra `O Cut` — `Cut`-linear (it is a `≃ₗ[Cut]`),
    structure-preserving (banked N41e `expO_mul`), unital (`expO_one`), invertible (inverse
    `expO (-D)`, `expOEquiv_symm_apply`). The literal `Der(𝕆) → Aut(𝕆)` correspondence at the group
    end, over the DERIVED ℝ. -/
theorem expOEquiv_isAlgAut (D' : Module.End Cut (O Cut))
    (hD : IsDeriv (D'.restrictScalars ℤ)) : IsAlgAutCut (expOEquiv D') := by
  constructor
  · intro x y
    rw [expOEquiv_apply, expOEquiv_apply, expOEquiv_apply, expO_mul D' hD]
  · rw [expOEquiv_apply, expO_one D' hD]

/-! ## NON-VACUITY (W8): the automorphism is genuine. -/

/-- NON-VACUITY: the zero derivation's exponential is the identity automorphism — a concrete instance
    inhabiting the hypothesis class, witnessing `expOEquiv_isAlgAut` is not vacuously quantified. -/
theorem expOEquiv_zero_isAlgAut :
    IsAlgAutCut (expOEquiv (0 : Module.End Cut (O Cut))) :=
  expOEquiv_isAlgAut 0 (by intro u v; simp)

/-- NON-VACUITY: the inverse of the exponential flow is the exponential of the negated derivation,
    exhibited at the unit — `(expOEquiv 0).symm 1 = 1`. -/
theorem expOEquiv_zero_symm_one :
    (expOEquiv (0 : Module.End Cut (O Cut))).symm (1 : O Cut) = 1 := by
  rw [expOEquiv_symm_apply, show -(0 : Module.End Cut (O Cut)) = 0 from neg_zero]
  exact expO_one 0 (by intro u v; simp)

end

end Phys.Algebra
