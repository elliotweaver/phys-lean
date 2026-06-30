/-
  Phys.Algebra.DerivationHDim — N185: THE DIMENSION OF THE QUATERNION INNER-DERIVATION
  LIE ALGEBRA IS 3 — the so(3) ≅ su(2) dimension count (the weak-isospin gauge-algebra
  seed's defining-signature fact, complementary to `dim Der(O ℚ) = 14` for g₂).
  ===========================================================================
  N184 (`DerivationH.lean`) banked the WEAK-ISOSPIN su(2) ≅ so(3) BRACKET structure
  constants `⁅ad_i, ad_j⁆ = 2·ad_k` (cyclic) of the inner derivations `ad_q : x ↦ q·x − x·q`
  of the ASSOCIATIVE quaternion algebra `H ℚ = CD (Dbl ℚ)`, plus non-vacuity (the bracket
  is genuinely non-abelian). The bracket was banked; the EXACT DIMENSION of that Lie
  algebra was NOT. This module banks it: the inner-derivation Lie algebra is exactly
  3-DIMENSIONAL over ℚ. With N184's non-abelian bracket, `dim = 3` is the
  classification-sufficient signature pinning so(3) ≅ su(2) — exactly as `dim Der(O) = 14`
  (N20) pinned g₂.

  THE STRUCTURAL ROUTE (docs/RUNBOOK W9.4 — structure over coordinate expansion). The
  inner derivations are the RANGE of the ℚ-linear map `adL : H ℚ →ₗ[ℚ] End ℚ (H ℚ)`,
  `q ↦ (x ↦ q·x − x·q)`. By rank–nullity over the field ℚ:

      finrank(range adL) + finrank(ker adL) = finrank ℚ (H ℚ) = 4   (banked N19 `finrank_H_eq_four`)

  and `ker adL` is the CENTRE of `H ℚ`, which is exactly the scalar line `ℚ·1`
  (1-dimensional): `q` commutes with everything iff `q` commutes with the two generators
  `i = ιJ` and `j = e₂`, which forces `q.im = 0` and `q.re.im = 0`, i.e. `q = q.re.re • 1`.
  Hence `finrank(range adL) = 4 − 1 = 3` — NO coordinate basis matrix, NO 16×16 rank
  computation (the W9 monolith avoided exactly as N19 avoided the 512×64 g₂ kernel).

  THE CONNECTION TO N184 (`adQ_eq_adM`). The ℚ-linear `adQ q` agrees pointwise with N184's
  `adM q` (the ℤ-linear inner derivation), so `range adL` IS the inner-derivation Lie
  algebra whose bracket constants N184 banked. The dimension is the dimension of that very
  algebra.

  THE MOAT — posit-vs-derive (docs/STANDARD §0). The division-algebra-physics field
  (Furey, Dixon, Günaydin–Gürsey) POSITS the quaternions and reads `su(2) = Im H ≅ so(3)`
  (dim 3) off by hand. Here `H ℚ = CD (Dbl ℚ)` is the cascade's OWN second doubling and
  `dim = 3` is DERIVED by rank–nullity from the banked structural dimension
  `finrank_H_eq_four` (N19) + the centre computation — NO posited su(2)/so(3)/SU(2)/Lie
  group, NO Mathlib ℝ/ℂ as content (ℚ is the coefficient field the `finrank` statement is
  written in, exactly the N6/N16/N42/N184 precedent; the OBJECT is the derived quaternions).

  THE CONTENT (each step a theorem, foundations-only):
    H_qsmul_mul_left/right — the ℚ-scalar/product compatibility on `H ℚ` (componentwise).
    adQ              — the inner derivation `ad_q` as a ℚ-linear `End ℚ (H ℚ)`.
    adL              — ★ the inner-derivation MAP `q ↦ ad_q`, ℚ-linear `H ℚ →ₗ End ℚ (H ℚ)`.
    adQ_eq_adM       — ★ THE CONNECTION: `adQ q` agrees pointwise with N184's `adM q`.
    oneEmb           — the scalar embedding `ℚ →ₗ H ℚ`, `c ↦ c • 1` (injective).
    centre_im/centre_reim — the centre computation (commuting with `i`, `j` ⟹ scalar).
    ker_adL_eq       — ★ `ker adL = range oneEmb`: the centre is exactly the scalar line.
    finrank_ker_adL_eq_one — ★ `dim(ker adL) = 1` (the 1-dimensional centre).
    finrank_innerDeriv_eq_three — ★★ `dim(range adL) = 3` — THE so(3)/su(2) DIMENSION.
    innerDeriv_ne_bot / adL_ne_zero — W8 non-vacuity: the algebra is genuinely 3-dim (≠ 0).

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete "isospin / weak / gauge / su(2) /
  so(3) / SU(2)": what remains is the pure statement that the inner-derivation map of the
  associative ring `CD (Dbl ℚ)` has 3-dimensional range over ℚ (kernel = the 1-dimensional
  centre `ℚ·1`), via rank–nullity. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.DerivationH
import Phys.Algebra.DerivationFinrank
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD Module

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-! ## The ℚ-scalar / product compatibility on `H ℚ` (componentwise, the `H` analog of
    N19's `qsmul_mul_left`/`qsmul_mul_right`). -/

/-- `(c • x) · y = c • (x · y)`: a ℚ-scalar pulls out of the left factor. -/
theorem H_qsmul_mul_left (c : ℚ) (x y : H ℚ) : (c • x) * y = c • (x * y) := by
  ext <;> simp [cd_qsmul_re, cd_qsmul_im] <;> ring

/-- `x · (c • y) = c • (x · y)`: a ℚ-scalar pulls out of the right factor. -/
theorem H_qsmul_mul_right (c : ℚ) (x y : H ℚ) : x * (c • y) = c • (x * y) := by
  ext <;> simp [cd_qsmul_re, cd_qsmul_im] <;> ring

/-! ## The ℚ-linear inner-derivation map `adL : q ↦ ad_q`. -/

/-- The inner derivation `ad_q : x ↦ q·x − x·q` as a ℚ-LINEAR endomorphism of `H ℚ`
    (the ℚ-linear version of N184's `adM q`, which was a `Module.End ℤ`). -/
def adQ (q : H ℚ) : Module.End ℚ (H ℚ) where
  toFun x := q * x - x * q
  map_add' x y := by simp [mul_add, add_mul]; abel
  map_smul' c x := by
    simp only [RingHom.id_apply, H_qsmul_mul_right, H_qsmul_mul_left, smul_sub]

@[simp] theorem adQ_apply (q x : H ℚ) : adQ q x = q * x - x * q := rfl

/-- ★ THE CONNECTION TO N184. The ℚ-linear `adQ q` agrees pointwise with N184's `adM q`
    (the ℤ-linear inner derivation). So `range adL` below IS the inner-derivation Lie
    algebra whose bracket constants `⁅ad_i, ad_j⁆ = 2·ad_k` N184 banked. -/
theorem adQ_eq_adM (q x : H ℚ) : adQ q x = adM q x := by
  simp only [adQ_apply, adM_apply]

/-- ★ THE INNER-DERIVATION MAP: `q ↦ ad_q`, a ℚ-LINEAR map `H ℚ →ₗ End ℚ (H ℚ)`. Its range
    is the inner-derivation Lie algebra; its kernel is the centre. -/
def adL : H ℚ →ₗ[ℚ] Module.End ℚ (H ℚ) where
  toFun := adQ
  map_add' p q := by
    refine LinearMap.ext fun x => ?_
    simp only [adQ_apply, LinearMap.add_apply, add_mul, mul_add]; abel
  map_smul' c q := by
    refine LinearMap.ext fun x => ?_
    simp only [adQ_apply, RingHom.id_apply, LinearMap.smul_apply,
      H_qsmul_mul_left, H_qsmul_mul_right, smul_sub]

@[simp] theorem adL_apply (q x : H ℚ) : adL q x = q * x - x * q := rfl

/-! ## The scalar embedding `ℚ → H ℚ` — the 1-dimensional centre. -/

/-- The scalar embedding `c ↦ c • 1`. Its range is the scalar line `ℚ·1`, the centre. -/
def oneEmb : ℚ →ₗ[ℚ] H ℚ where
  toFun c := c • (1 : H ℚ)
  map_add' a b := by rw [add_smul]
  map_smul' a b := by simp [mul_smul]

@[simp] theorem oneEmb_apply (c : ℚ) : oneEmb c = c • (1 : H ℚ) := rfl

/-- The scalar embedding is injective: the scalar line is a genuine 1-dimensional copy of ℚ. -/
theorem oneEmb_injective : Function.Injective oneEmb := by
  intro a b h
  simp only [oneEmb_apply] at h
  have := congrArg (fun z : H ℚ => z.re.re) h
  simpa [cd_qsmul_re] using this

/-! ## The centre computation: commuting with `i = ιJ` and `j = e₂` forces a scalar. -/

/-- Commuting with `i = ιJ` forces the new `im`-dimension to vanish: `q.im = 0`. The cause
    is `J ≠ J* = −J` (the same non-self-conjugacy that lost commutativity at rung 2). -/
theorem centre_im (q : H ℚ) (h : q * hI = hI * q) : q.im = 0 := by
  have him := congrArg CD.im h
  simp only [hI, CD.iota, CD.mul_im, Dbl.star_J, zero_mul, zero_add, add_zero] at him
  have key : q.im * (Dbl.J : Dbl ℚ) + q.im * Dbl.J = 0 := by
    rw [mul_neg] at him; linear_combination -him
  have hqJ : q.im * (Dbl.J : Dbl ℚ) = 0 := by
    have h2 : (2 : ℚ) • (q.im * (Dbl.J : Dbl ℚ)) = 0 := by rw [two_smul]; exact key
    rcases smul_eq_zero.mp h2 with hc | hc
    · norm_num at hc
    · exact hc
  have hJunit : (Dbl.J : Dbl ℚ) * (-Dbl.J) = 1 := by rw [mul_neg, Dbl.J_mul_J, neg_neg]
  calc q.im = q.im * ((Dbl.J : Dbl ℚ) * (-Dbl.J)) := by rw [hJunit, mul_one]
    _ = (q.im * Dbl.J) * (-Dbl.J) := by rw [mul_assoc]
    _ = 0 := by rw [hqJ, zero_mul]

/-- Given `q.im = 0`, commuting with `j = e₂` forces the embedded complex unit to vanish:
    `q.re.im = 0`. Together with `centre_im` this says `q = q.re.re • 1` — a scalar. -/
theorem centre_reim (q : H ℚ) (hq : q.im = 0) (h : q * hJ = hJ * q) : q.re.im = 0 := by
  have him := congrArg CD.im h
  simp only [hJ, CD.e2, CD.mul_im, hq, zero_mul, mul_zero, zero_add, add_zero] at him
  have hir := congrArg Dbl.im him
  simp only [Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.one_re, Dbl.one_im,
    mul_neg] at hir
  linarith [hir]

/-! ## `ker adL = the centre = ℚ·1`, the 1-dimensional kernel. -/

/-- ★ THE CENTRE IS THE SCALAR LINE: `ker adL = range oneEmb`. A quaternion lies in the
    kernel (commutes with everything) iff it is a scalar multiple of `1`. -/
theorem ker_adL_eq : LinearMap.ker adL = LinearMap.range oneEmb := by
  ext q
  simp only [LinearMap.mem_ker, LinearMap.mem_range]
  constructor
  · intro h
    have hcomm : ∀ x : H ℚ, q * x = x * q := by
      intro x
      have := congrArg (fun (f : Module.End ℚ (H ℚ)) => f x) h
      simp only [adL_apply, LinearMap.zero_apply, sub_eq_zero] at this
      exact this
    have hi := centre_im q (hcomm hI)
    have hj := centre_reim q hi (hcomm hJ)
    refine ⟨q.re.re, ?_⟩
    simp only [oneEmb_apply]
    ext
    · simp [cd_qsmul_re, Dbl.smul_re]
    · simp [cd_qsmul_re, Dbl.smul_im, hj]
    · simp [cd_qsmul_im, hi]
    · simp [cd_qsmul_im, hi]
  · rintro ⟨c, rfl⟩
    refine LinearMap.ext fun x => ?_
    simp only [adL_apply, oneEmb_apply, LinearMap.zero_apply]
    rw [H_qsmul_mul_left, one_mul, H_qsmul_mul_right, mul_one, sub_self]

/-- ★ `dim(ker adL) = 1` — the centre is the 1-dimensional scalar line. -/
theorem finrank_ker_adL_eq_one : Module.finrank ℚ (LinearMap.ker adL) = 1 := by
  rw [ker_adL_eq, LinearMap.finrank_range_of_inj oneEmb_injective, Module.finrank_self]

/-! ## ★★ THE so(3) ≅ su(2) DIMENSION: `dim(range adL) = 3`. -/

/-- ★★ THE DIMENSION OF THE INNER-DERIVATION LIE ALGEBRA IS 3. By rank–nullity over ℚ,
    `dim(range adL) + dim(ker adL) = dim ℚ (H ℚ) = 4` (banked N19 `finrank_H_eq_four`), and
    `dim(ker adL) = 1` (the centre), so `dim(range adL) = 3`. With N184's non-abelian bracket
    `⁅ad_i, ad_j⁆ = 2·ad_k`, this `dim = 3` is the classification-sufficient signature pinning
    so(3) ≅ su(2) — the weak-isospin gauge-algebra seed, the 3-dimensional analog of
    `dim Der(O) = 14` for g₂ (N20). -/
theorem finrank_innerDeriv_eq_three : Module.finrank ℚ (LinearMap.range adL) = 3 := by
  have hrn : Module.finrank ℚ (LinearMap.range adL) + Module.finrank ℚ (LinearMap.ker adL)
      = Module.finrank ℚ (H ℚ) := adL.finrank_range_add_finrank_ker
  rw [finrank_ker_adL_eq_one, finrank_H_eq_four] at hrn
  omega

/-! ## W8 — non-vacuity: the inner-derivation algebra is genuinely 3-dimensional (≠ 0). -/

/-- ★ W8: the inner-derivation Lie algebra is NOT the trivial space — its dimension is the
    genuine positive number `3` (not `0`), so `range adL ≠ ⊥`. The `dim = 3` is real
    structure, not a vacuous `0 = 0`. -/
theorem innerDeriv_ne_bot : LinearMap.range adL ≠ ⊥ := by
  intro h
  have : Module.finrank ℚ (LinearMap.range adL) = 0 := by rw [h]; exact finrank_bot ℚ _
  rw [finrank_innerDeriv_eq_three] at this
  exact absurd this (by norm_num)

/-- ★ W8: the inner-derivation map is genuinely nonzero (its range is 3-dimensional, hence
    nontrivial). If `adL = 0` its range would be `⊥`, contradicting `dim = 3`. -/
theorem adL_ne_zero : adL ≠ 0 := by
  intro h
  apply innerDeriv_ne_bot
  rw [h, LinearMap.range_zero]

end Phys.Algebra
