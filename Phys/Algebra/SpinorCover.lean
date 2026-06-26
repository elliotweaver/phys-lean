/-
  Phys.Algebra.SpinorCover — N46: THE SPINOR (matrix) REALIZATION of the Lorentz boost on the
  self-adjoint 2×2 matrices over the terminal algebra — the `M ↦ A M A†` action, DERIVED.
  ===========================================================================
  THE NEXT FORCED NODE after the isometry-structure node (N45). N43 banked the self-adjoint
  `2 × 2` carrier `herm2 t x v : Matrix (Fin 2) (Fin 2) (O ℚ)` and ★★ `herm2_det_eq`
  (`herm2_det = Qform = t² − x² − gForm v v`, the Born determinant form). N45 banked the ISOMETRY
  STRUCTURE of `Qv` abstractly — the `Qform`-preserving submonoid + the boost / rotation
  generators — WITHOUT any matrix determinant (the W1 reframe that dissolved the W9-flagged
  non-associative-determinant difficulty). This module banks the MATRIX ACTION itself: the
  `SL(2,𝕆)`-style conjugation `M ↦ (A · M) · Aᴴ` on the `herm2` carrier, realized CONCRETELY,
  connecting the abstract N45 isometry to the spinor picture. NOT a posited Lorentz group; the
  action and its determinant-preservation are DERIVED, over the cascade ground ring `ℚ`.

  THE W1 REFRAME (THE ONE LAW) — why this is light, not the flagged W9 grind. The natural worry
  (ROADMAP §N46) was the GENERAL determinant multiplicativity `det(A B) = det A · det B`, which
  FAMOUSLY FAILS over the non-associative `O ℚ`, and a general boost matrix needs IRRATIONAL
  entries (the derived ℝ). Both difficulties DISSOLVE for the CONCRETE generator the boost forces:
  the diagonal RATIONAL matrix
      `boostMat p = !![ p•1, 0 ; 0, p⁻¹•1 ]`     (`p ∈ ℚ`, `p ≠ 0`),
  whose real determinant is `p · p⁻¹ = 1`. Because `boostMat p` is real-diagonal (so `Aᴴ = A`,
  `boostMat_selfadjoint`), the conjugation `(A · M) · Aᴴ` acts on `herm2 t x v` by
      `herm2 t x v ↦ herm2 t' x' v`   with   `t' + x' = p²(t + x)`,  `t' − x' = p⁻²(t − x)`
  (`act_herm2`): the off-diagonal `v` is EXACTLY preserved (it picks up `p · p⁻¹ = 1`), the two
  real lightcone diagonals scale by `p²` and `p⁻²`. This is a genuine Lorentz boost in LIGHTCONE
  COORDINATES — entirely RATIONAL, and the non-associativity of `O ℚ` is never triggered because
  the off-diagonal carries a SINGLE octonion `v` flanked by real scalars (no octonion×octonion
  associativity question arises). It connects to the N45 abstract `boost a b` via the rational
  reparametrization `a = (p² + p⁻²)/2`, `b = (p² − p⁻²)/2` (then `a² − b² = (p²·p⁻²) = 1`).

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    boostMat / actBy        — the concrete diagonal rational generator and the conjugation action.
    boostMat_selfadjoint    — `(boostMat p)ᴴ = boostMat p` (real diagonal ⇒ self-adjoint).
    act_herm2               — ★★ THE FORCED SHAPE: the action maps `herm2 t x v` to a herm2 of
                              rescaled lightcone coordinates, with `v` preserved — no matrix
                              determinant, no irrational entries, the non-associativity untouched.
    act_isHermitian         — the action PRESERVES Hermiticity (`(A M Aᴴ)ᴴ = A M Aᴴ`): the result
                              is again a `herm2`, hence self-adjoint.
    mdet                    — the generalized real-part determinant `reQ (M₀₀M₁₁ − M₀₁M₁₀)` of an
                              ARBITRARY `2 × 2` over `O ℚ` (the honest scalar, `O ℚ` non-commutative
                              so Mathlib `Matrix.det` does not apply), agreeing with `herm2_det` on
                              the self-adjoint carrier (`mdet_herm2`).
    scaled_Qform            — the rescaled lightcone coordinates carry the SAME `Qform` (the
                              `p²·p⁻² = 1` cancellation — the determinant-one condition).
    mdet_act                — ★★★ THE HEADLINE — DETERMINANT PRESERVATION: the real-part determinant
                              of the spinor action equals the Born form of the original,
                              `mdet ((boostMat p · M) · (boostMat p)ᴴ) = Qform t x v = herm2_det M`.
                              The `SL(2,𝕆)`-style action realizes the Lorentz boost as a genuine
                              determinant-preserving conjugation — DERIVED, never posited.
    boostMat_ne_one / _scales — ★ NON-TRIVIALITY (W8 teeth): for `p ≠ 1, p ≠ 0` the generator is
                              NOT the identity matrix and genuinely rescales the lightcone — the
                              action is a real, nontrivial boost, not a triviality.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That `H₂(𝕆)` carries an `SL(2,𝕆) ↠ SO⁺(1,9)`
  spinor cover is standard (Sudbery, Manogue–Dray, Baez). Here the matrix action and its
  determinant-preservation are DERIVED from the banked `herm2` carrier (N43) + `herm2_det_eq` +
  the cascade ground ring `ℚ` — NO posited Lorentz group, NO Mathlib ℝ/ℂ as content (the generator
  is a rational diagonal matrix; the whole development is over `ℚ`). The W1 reframe — realizing the
  boost by a RATIONAL diagonal generator in lightcone coordinates — is exactly what dissolves the
  flagged W9 non-associative-determinant difficulty: the concrete action never needs the general
  `det(AB) = det A · det B` (false over `O ℚ`) nor an irrational entry.

  WHAT IS CHILDED (N47, the heavy connection). The FULL `SL(2,𝕆) ↠ SO⁺(1,9)` cover — the general
  (octonionic, off-diagonal, unit-multiplication) generators realizing the N45 space ROTATION
  `rot u` as a matrix conjugation, and the surjectivity onto the connected component — remains the
  heavy front, childed onto the chain tail. This node banks the determinant-preserving MATRIX
  action for the boost (the time-mixing, non-compact generator), connecting N45 → the spinor matrix
  picture, by the W1-reframe concrete-rational route.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / spinor / SL(2,𝕆) /
  isometry / cover / lightcone / time / space": what remains is the theorem that the conjugation
  `M ↦ (A · M) · Aᴴ` by the diagonal matrix `A = diag(p•1, p⁻¹•1)` over the Cayley–Dickson double³
  of `ℚ` maps the self-adjoint `2 × 2` matrix `herm2 t x v` to `herm2 t' x' v` with
  `t' + x' = p²(t+x)`, `t' − x' = p⁻²(t−x)`, preserves self-adjointness, and preserves the
  real-part determinant `reQ(M₀₀M₁₁ − M₀₁M₁₀) = t² − x² − gForm v v` (the `p²·p⁻² = 1` cancellation),
  nontrivially for `p ≠ 1`. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.SpacetimeSignature
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Matrix

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## The concrete diagonal rational boost generator and the conjugation action. -/

/-- THE CONCRETE DIAGONAL RATIONAL BOOST GENERATOR `A = diag(p•1, p⁻¹•1)` over the terminal
    algebra. Real-diagonal (its entries are real scalars on the unit), so self-adjoint; its real
    determinant is `p · p⁻¹ = 1` — the `SL(2,𝕆)`-style unit-determinant condition, realized
    RATIONALLY (no irrational entry, the W1 reframe of the flagged W9 difficulty). -/
def boostMat (p : ℚ) : Matrix (Fin 2) (Fin 2) (O ℚ) :=
  !![ (p • (1 : O ℚ)), 0 ;
      0, (p⁻¹ • (1 : O ℚ)) ]

/-- THE SPINOR CONJUGATION ACTION `M ↦ (A · M) · Aᴴ` — the `SL(2,𝕆)`-style transformation of the
    self-adjoint `2 × 2` carrier. -/
def actBy (A M : Matrix (Fin 2) (Fin 2) (O ℚ)) : Matrix (Fin 2) (Fin 2) (O ℚ) := (A * M) * Aᴴ

/-- THE GENERALIZED REAL-PART DETERMINANT `reQ (M₀₀·M₁₁ − M₀₁·M₁₀)` of an arbitrary `2 × 2` matrix
    over `O ℚ`. The honest scalar invariant: `O ℚ` is non-commutative, so Mathlib `Matrix.det`
    (commutative-ring only) does not apply; the real part of the standard `2 × 2` determinant
    expression is the invariant. It extends the banked `herm2_det` from the self-adjoint carrier to
    every `2 × 2`. -/
def mdet (M : Matrix (Fin 2) (Fin 2) (O ℚ)) : ℚ :=
  reQ (M 0 0 * M 1 1 - M 0 1 * M 1 0)

/-- On the self-adjoint carrier, `mdet` agrees with the banked `herm2_det` (definitional). -/
theorem mdet_herm2 (t x : ℚ) (v : O ℚ) : mdet (herm2 t x v) = herm2_det t x v := rfl

/-- The generator is self-adjoint: `(boostMat p)ᴴ = boostMat p`. Its entries are real scalars on
    the unit (`star (q • 1) = q • 1`), so conjugate-transpose fixes it. -/
theorem boostMat_selfadjoint (p : ℚ) : (boostMat p)ᴴ = boostMat p := by
  refine Matrix.ext fun i j => ?_
  fin_cases i <;> fin_cases j <;>
    simp [boostMat, Matrix.conjTranspose_apply]

/-! ## The forced shape of the action and the preservation of the self-adjoint structure. -/

/-- ★★ THE FORCED SHAPE. The spinor action by the diagonal rational generator maps `herm2 t x v`
    to a herm2 of RESCALED LIGHTCONE coordinates: `t' + x' = p²(t + x)`, `t' − x' = p⁻²(t − x)`,
    with the off-diagonal `v` EXACTLY PRESERVED (it picks up `p · p⁻¹ = 1`). No matrix determinant,
    no irrational entry, the non-associativity of `O ℚ` never triggered (the off-diagonal carries a
    single octonion flanked by real scalars). -/
theorem act_herm2 (p t x : ℚ) (hp : p ≠ 0) (v : O ℚ) :
    actBy (boostMat p) (herm2 t x v) =
      herm2 ((p^2*(t+x) + p⁻¹^2*(t-x))/2) ((p^2*(t+x) - p⁻¹^2*(t-x))/2) v := by
  refine Matrix.ext fun i j => ?_
  fin_cases i <;> fin_cases j <;>
    simp [actBy, boostMat, herm2, Matrix.mul_apply, Fin.sum_univ_two,
      Matrix.conjTranspose_apply, qsmul_mul_left, smul_smul,
      mul_inv_cancel₀ hp, inv_mul_cancel₀ hp] <;>
    ring_nf

/-- ★ THE ACTION PRESERVES HERMITICITY: `(A M Aᴴ)ᴴ = A M Aᴴ` — the result is again a self-adjoint
    `herm2`, so the spinor action keeps the carrier inside the self-adjoint `2 × 2` matrices (the
    space on which the Born determinant form lives). -/
theorem act_isHermitian (p t x : ℚ) (hp : p ≠ 0) (v : O ℚ) :
    (actBy (boostMat p) (herm2 t x v))ᴴ = actBy (boostMat p) (herm2 t x v) := by
  rw [act_herm2 p t x hp v]; exact herm2_isHermitian _ _ _

/-! ## Determinant preservation — the spinor action is a Born-form isometry. -/

/-- The rescaled lightcone coordinates carry the SAME Born quadratic form: the determinant-one
    condition `p² · p⁻² = 1` is exactly what makes `t'² − x'² = (t'+x')(t'−x') = p²(t+x)·p⁻²(t−x)
    = (t+x)(t−x) = t² − x²`, so `Qform t' x' v = Qform t x v`. -/
theorem scaled_Qform (p t x : ℚ) (hp : p ≠ 0) (v : O ℚ) :
    Qform ((p^2*(t+x) + p⁻¹^2*(t-x))/2) ((p^2*(t+x) - p⁻¹^2*(t-x))/2) v = Qform t x v := by
  unfold Qform
  have hpp : p^2 * p⁻¹^2 = 1 := by rw [← mul_pow, mul_inv_cancel₀ hp, one_pow]
  nlinarith [hpp]

/-- ★★★ THE HEADLINE — DETERMINANT PRESERVATION. The generalized real-part determinant of the
    spinor action `M ↦ (A · M) · Aᴴ` equals the Born quadratic form of the original matrix:
    `mdet (actBy (boostMat p) (herm2 t x v)) = Qform t x v = herm2_det t x v`. The `SL(2,𝕆)`-style
    conjugation by the rational determinant-one generator realizes the Lorentz boost as a genuine
    determinant-preserving transformation — over the NON-ASSOCIATIVE `O ℚ`, by the W1-reframe
    concrete-rational route (NOT the false general `det(AB) = det A · det B`, NOT an irrational
    matrix). DERIVED from the banked `herm2_det_eq`, never posited. -/
theorem mdet_act (p t x : ℚ) (hp : p ≠ 0) (v : O ℚ) :
    mdet (actBy (boostMat p) (herm2 t x v)) = Qform t x v := by
  have hshape := act_herm2 p t x hp v
  have hstep : mdet (actBy (boostMat p) (herm2 t x v))
      = herm2_det ((p^2*(t+x) + p⁻¹^2*(t-x))/2) ((p^2*(t+x) - p⁻¹^2*(t-x))/2) v := by
    rw [hshape, mdet_herm2]
  rw [hstep, herm2_det_eq, scaled_Qform p t x hp v]

/-- The determinant preservation in `herm2_det` form: `mdet` of the action equals the banked
    `herm2_det` of the original. -/
theorem mdet_act_eq_herm2_det (p t x : ℚ) (hp : p ≠ 0) (v : O ℚ) :
    mdet (actBy (boostMat p) (herm2 t x v)) = herm2_det t x v := by
  rw [mdet_act p t x hp v, ← herm2_det_eq]

/-! ## Non-triviality (W8 teeth) — the action is a genuine boost, not the identity. -/

/-- ★ NON-TRIVIALITY: for `p ≠ 1` (and `p ≠ 0`) the generator is NOT the identity matrix — its
    `(0,0)` entry is `p • 1 ≠ 1 • 1`. The spinor action is a genuine, nontrivial transformation. -/
theorem boostMat_ne_one {p : ℚ} (hp1 : p ≠ 1) : boostMat p ≠ (1 : Matrix (Fin 2) (Fin 2) (O ℚ)) := by
  intro hcontra
  have h00 := congrFun (congrFun hcontra 0) 0
  simp only [boostMat, Matrix.one_apply_eq, Matrix.cons_val', Matrix.cons_val_zero,
    Matrix.empty_val', Matrix.cons_val_fin_one, Matrix.of_apply] at h00
  -- h00 : p • (1 : O ℚ) = 1
  have : p • (1 : O ℚ) = (1 : ℚ) • (1 : O ℚ) := by rw [one_smul]; exact h00
  have hp : p = 1 := by
    have := congrArg (fun z => reQ z) this
    simpa [reQ, cd_qsmul_re, Dbl.smul_re] using this
  exact hp1 hp

/-- ★ THE ACTION GENUINELY RESCALES THE LIGHTCONE: a pure lightcone-plus vector `herm2 t t 0`
    (where `t − x = 0`) is sent to `herm2` with `t' + x' = p²·(2t)`, scaling the `t + x` lightcone
    coordinate by `p²`. With `p² ≠ 1` this is a genuine nontrivial scaling — the honest hallmark of
    a non-compact boost in lightcone coordinates. -/
theorem act_scales_lightcone (p t : ℚ) (hp : p ≠ 0) :
    actBy (boostMat p) (herm2 t t 0) = herm2 (p^2 * t) (p^2 * t) 0 := by
  rw [act_herm2 p t t hp 0]
  have h1 : (p^2*(t+t) + p⁻¹^2*(t-t))/2 = p^2 * t := by ring_nf
  have h2 : (p^2*(t+t) - p⁻¹^2*(t-t))/2 = p^2 * t := by ring_nf
  rw [h1, h2]

end

end Phys.Algebra
