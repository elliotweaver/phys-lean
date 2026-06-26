/-
  Phys.Algebra.SpinorRotation — N47: THE SPACE-ROTATION (matrix) GENERATOR of the spinor cover —
  the OTHER half of `SL(2,𝕆) ↠ SO⁺(1,9)` beyond the N46 boost, DERIVED.
  ===========================================================================
  THE NEXT FORCED NODE after the spinor-boost-matrix node (N46). N46 banked the MATRIX (spinor)
  realization of the BOOST: the diagonal rational generator `boostMat p = diag(p•1, p⁻¹•1)`, the
  conjugation `actBy A M = (A · M) · Aᴴ`, and the determinant preservation
  `mdet_act : mdet (actBy (boostMat p) (herm2 t x v)) = Qform t x v` — the time-mixing, non-compact
  generator. N45 banked the ABSTRACT space rotation `rot u : (t,x,v) ↦ (t,x,u·v)` as a `Qv`-isometry
  under the Born-unit condition `gForm u u = 1` (`rot_isom`), via the Born composition law `gForm_comp`.
  This module banks the OTHER half of the cover: the SPACE-ROTATION MATRIX GENERATOR — the matrix
  analogue of `boostMat`, realizing the abstract `rot u` as a CONCRETE matrix conjugation on the
  banked `herm2` self-adjoint `2 × 2` carrier, and PROVED to preserve `mdet = Qform`. NOT a posited
  Lorentz group; the generator and its determinant-preservation are DERIVED, over the cascade ground
  ring `ℚ`.

  THE W1 REFRAME (THE ONE LAW) — why the flagged W9 risk dissolves. The ROADMAP §N47 flagged the
  GENUINE coordinate-blow-up risk the N46 diagonal boost sidestepped: unlike the real-scalar diagonal
  `boostMat`, an octonion-valued generator `A` makes `(A · M) · Aᴴ` trigger genuine NON-ASSOCIATIVITY
  of `O ℚ`. THE REFRAME: realize the rotation by the generator with a SINGLE octonion in one corner,
      `rotMat u = !![ u, 0 ; 0, 1 ]`     (`u` a Born-unit, `u · star u = 1`).
  Then every entry of the triple matrix product `(A · M) · Aᴴ` is a SUM whose terms are at most
  BINARY octonion products as the matrix multiplication writes them (`u · v` off-diagonal,
  `star v · star u = star (u·v)` off-diagonal, `(t+x) • (u · star u)` on the diagonal). No
  `(a·b)·c ≠ a·(b·c)` triple-product ambiguity ever needs resolving — the matrix product writes each
  entry left-associated and that IS its value. So the conjugation acts by
      `herm2 t x v ↦ herm2 t x (u · v)`     (`act_herm2_rot`),
  the off-diagonal octonion `v` rotated to `u · v`, the real diagonals untouched (the `u · star u = 1`
  cancellation). The determinant-preservation then DISSOLVES exactly as N45's abstract `rot_isom`:
  `mdet` of the result is `herm2_det t x (u·v) = Qform t x (u·v) = t² − x² − gForm (u·v)(u·v)`, and the
  banked Born composition law `gForm_comp` gives `gForm (u·v)(u·v) = gForm u u · gForm v v = gForm v v`
  (since `gForm u u = 1`). So `mdet (actBy (rotMat u) (herm2 t x v)) = Qform t x v` — through the
  banked entry-wise Born norm, NOT a non-associative matrix determinant expansion.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    rotMat                  — the concrete single-octonion-corner rotation generator.
    act_herm2_rot           — ★★ THE FORCED SHAPE: the conjugation maps `herm2 t x v` to
                              `herm2 t x (u·v)` (Born-unit `u`), the off-diagonal `v` rotated, the real
                              diagonals fixed — no triple-product non-associativity, no irrational entry.
    rot_Qform               — the rotated coordinates carry the SAME Born form (`gForm_comp`, `gForm u u = 1`).
    act_isHermitian_rot     — the action PRESERVES Hermiticity (the result is again a `herm2`).
    mdet_act_rot            — ★★★ THE HEADLINE — DETERMINANT PRESERVATION: the real-part determinant of
                              the rotation conjugation equals the Born form of the original,
                              `mdet (actBy (rotMat u) (herm2 t x v)) = Qform t x v = herm2_det t x v`.
    mdet_act_rot_eq_herm2_det — the same in `herm2_det` form.
    mdet_act_boost_rot      — ★ THE COMBINED BOOST + ROTATION: conjugating first by the rotation then by
                              the boost preserves the Born form — both halves of the cover, composed,
                              are determinant-preserving.
    star_u1 / gForm_u1      — the banked imaginary unit `u1` is a concrete Born-unit (`gForm u1 u1 = 1`).
    rotMat_u1_ne_one        — ★ NON-TRIVIALITY (W8 teeth): `rotMat u1 ≠ 1` — the rotation generator is
                              genuinely non-trivial.
    act_rotates_space       — ★ THE ROTATION GENUINELY MOVES THE SPACE BLOCK: `herm2 t x 1 ↦ herm2 t x u1`
                              with `u1 ≠ 1` — a real, nontrivial rotation of the nine space directions.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That `H₂(𝕆)` carries an `SL(2,𝕆) ↠ SO⁺(1,9)`
  spinor cover whose rotation subgroup is the octonion-unit conjugations is standard (Sudbery,
  Manogue–Dray, Baez). Here the rotation matrix action and its determinant-preservation are DERIVED
  from the banked `herm2` carrier (N43) + `herm2_det_eq` + the banked Born composition law `gForm_comp`
  (N45) + the cascade ground ring `ℚ` — NO posited Lorentz group, NO Mathlib ℝ/ℂ as content. The W1
  reframe — a single-octonion-corner generator whose triple-product entries are all binary — is exactly
  what dissolves the flagged W9 non-associative-conjugation risk: the concrete action never needs a
  triple-product associativity lemma nor the false general `det(AB) = det A · det B`.

  WHAT IS CHILDED (N48, the heavy connection). The SURJECTIVITY / the `2:1` covering DEGREE
  `SL(2,𝕆) ↠ SO⁺(1,9)` — that the matrix action generated by the boosts (N46) and these rotations
  COVERS the connected isometry component — remains the heavy front (needs the derived ℝ `ContinuumQ.Cut`
  + the banked Aut(𝕆)/exp stack for the continuous-group / exponential argument, NOT Mathlib ℝ),
  childed onto the chain tail. This node banks the determinant-preserving MATRIX action for the
  ROTATION (the compact, space-rotating generator), completing both generator families of the cover.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / spinor / rotation /
  SL(2,𝕆) / isometry / cover / time / space": what remains is the theorem that conjugation
  `M ↦ (A · M) · Aᴴ` by the matrix `A = !![u, 0; 0, 1]` (`u · star u = 1`) over the Cayley–Dickson
  double³ of `ℚ` maps the self-adjoint `2 × 2` matrix `herm2 t x v` to `herm2 t x (u·v)`, preserves
  self-adjointness, and preserves the real-part determinant `reQ(M₀₀M₁₁ − M₀₁M₁₀) = t² − x² − gForm v v`
  (via `gForm (u·v)(u·v) = gForm u u · gForm v v`), nontrivially (`A ≠ 1` for `u = u1`). No theorem
  STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.SpinorCover
import Phys.Algebra.LorentzIsometry
import Phys.Algebra.DerivationStabilizer
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Matrix

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## The concrete single-octonion-corner rotation generator. -/

/-- THE SPACE-ROTATION MATRIX GENERATOR `A = !![u, 0; 0, 1]` over the terminal algebra — a single
    Born-unit octonion `u` in the `(0,0)` corner, the matrix analogue of N46's diagonal `boostMat`.
    A Born-unit `u` (`gForm u u = 1`, equivalently `u · star u = 1`) makes the conjugation a
    determinant-preserving rotation of the nine space directions. The W1 reframe of the flagged W9
    risk: a single octonion corner keeps every conjugation entry a BINARY product (no triple-product
    non-associativity). -/
def rotMat (u : O ℚ) : Matrix (Fin 2) (Fin 2) (O ℚ) :=
  !![ u, 0 ;
      0, (1 : O ℚ) ]

/-! ## The forced shape of the action and the preservation of the self-adjoint structure. -/

/-- ★★ THE FORCED SHAPE. The spinor rotation conjugation by `rotMat u` (Born-unit `u`) maps
    `herm2 t x v` to `herm2 t x (u · v)`: the off-diagonal octonion `v` is rotated to `u · v`, the
    two real lightcone diagonals are untouched (the `(0,0)` diagonal picks up `u · star u = 1`).
    Every entry of the triple matrix product is a SUM of at most BINARY octonion products, so the
    non-associativity of `O ℚ` is never triggered — the genuine W9 coordinate-blow-up risk the
    diagonal boost sidestepped, here dissolved by the single-octonion-corner generator. -/
theorem act_herm2_rot (u : O ℚ) (hu : gForm u u = 1) (t x : ℚ) (v : O ℚ) :
    actBy (rotMat u) (herm2 t x v) = herm2 t x (u * v) := by
  have husu : u * star u = 1 := by rw [selfMul_eq_smul, hu, one_smul]
  refine Matrix.ext fun i j => ?_
  fin_cases i <;> fin_cases j <;>
    simp [actBy, rotMat, herm2, Matrix.mul_apply, Fin.sum_univ_two,
      Matrix.conjTranspose_apply, qsmul_mul_left,
      StarMul.star_mul, husu]

/-- The rotated coordinates carry the SAME Born quadratic form: the Born composition law
    `gForm (u·v)(u·v) = gForm u u · gForm v v = gForm v v` (`gForm u u = 1`) is exactly the
    norm-preservation of a rotation of the nine space directions, so `Qform t x (u·v) = Qform t x v`. -/
theorem rot_Qform (u : O ℚ) (hu : gForm u u = 1) (t x : ℚ) (v : O ℚ) :
    Qform t x (u * v) = Qform t x v := by
  unfold Qform
  rw [gForm_comp, hu, one_mul]

/-- ★ THE ACTION PRESERVES HERMITICITY: `(A M Aᴴ)ᴴ = A M Aᴴ` — the result is again a self-adjoint
    `herm2`, so the rotation conjugation keeps the carrier inside the self-adjoint `2 × 2` matrices
    (the space on which the Born determinant form lives). -/
theorem act_isHermitian_rot (u : O ℚ) (hu : gForm u u = 1) (t x : ℚ) (v : O ℚ) :
    (actBy (rotMat u) (herm2 t x v))ᴴ = actBy (rotMat u) (herm2 t x v) := by
  rw [act_herm2_rot u hu t x v]; exact herm2_isHermitian _ _ _

/-! ## Determinant preservation — the rotation conjugation is a Born-form isometry. -/

/-- ★★★ THE HEADLINE — DETERMINANT PRESERVATION. The generalized real-part determinant of the
    rotation conjugation `M ↦ (A · M) · Aᴴ` (Born-unit `u`) equals the Born quadratic form of the
    original matrix: `mdet (actBy (rotMat u) (herm2 t x v)) = Qform t x v = herm2_det t x v`. The
    `SL(2,𝕆)`-style rotation generator realizes the space rotation as a genuine determinant-preserving
    conjugation — over the NON-ASSOCIATIVE `O ℚ`, by the W1-reframe single-octonion-corner route
    (the determinant-preservation dissolving through the banked Born composition law `gForm_comp`,
    exactly as N45's abstract `rot_isom`, NOT a non-associative matrix determinant expansion).
    DERIVED from the banked `herm2_det_eq` + `gForm_comp`, never posited. -/
theorem mdet_act_rot (u : O ℚ) (hu : gForm u u = 1) (t x : ℚ) (v : O ℚ) :
    mdet (actBy (rotMat u) (herm2 t x v)) = Qform t x v := by
  rw [act_herm2_rot u hu t x v, mdet_herm2, herm2_det_eq, rot_Qform u hu t x v]

/-- The determinant preservation in `herm2_det` form: `mdet` of the rotation action equals the banked
    `herm2_det` of the original. -/
theorem mdet_act_rot_eq_herm2_det (u : O ℚ) (hu : gForm u u = 1) (t x : ℚ) (v : O ℚ) :
    mdet (actBy (rotMat u) (herm2 t x v)) = herm2_det t x v := by
  rw [mdet_act_rot u hu t x v, ← herm2_det_eq]

/-- ★ THE COMBINED BOOST + ROTATION. Conjugating first by the rotation generator `rotMat u`
    (Born-unit `u`) and then by the boost generator `boostMat p` (`p ≠ 0`) preserves the Born
    quadratic form: `mdet (actBy (boostMat p) (actBy (rotMat u) (herm2 t x v))) = Qform t x v`. Both
    generator families of the spinor cover — the non-compact time-mixing boost (N46) and the compact
    space-rotation — composed, are determinant-preserving. The combined transformation in the matrix
    picture, DERIVED. -/
theorem mdet_act_boost_rot (p : ℚ) (hp : p ≠ 0) (u : O ℚ) (hu : gForm u u = 1) (t x : ℚ) (v : O ℚ) :
    mdet (actBy (boostMat p) (actBy (rotMat u) (herm2 t x v))) = Qform t x v := by
  rw [act_herm2_rot u hu t x v, mdet_act p t x hp (u * v), rot_Qform u hu t x v]

/-! ## Non-triviality (W8 teeth) — a concrete Born-unit witness and a genuine rotation. -/

/-- The banked imaginary unit `u1` is conjugate-negative: `star u1 = -u1` (a purely imaginary unit). -/
theorem star_u1 : star u1 = -u1 := rfl

/-- ★ THE BANKED IMAGINARY UNIT `u1` IS A CONCRETE BORN-UNIT: `gForm u1 u1 = 1`. Since `star u1 = -u1`
    and `u1 · u1 = -1` (`complexUnit_sq`), `u1 · star u1 = -(u1·u1) = 1`, so the Born self-overlap is
    `1` — `u1` is a genuine unit on which the rotation generator acts non-trivially. -/
theorem gForm_u1 : gForm u1 u1 = 1 := by
  have : u1 * star u1 = 1 := by rw [star_u1, mul_neg, complexUnit_sq, neg_neg]
  show reQ (u1 * star u1) = 1
  rw [this]; rfl

/-- ★ NON-TRIVIALITY: the rotation generator `rotMat u1` is NOT the identity matrix — its `(0,0)`
    entry is `u1 ≠ 1` (the imaginary unit has nonzero imaginary part). The rotation conjugation is a
    genuine, nontrivial transformation. -/
theorem rotMat_u1_ne_one : rotMat u1 ≠ (1 : Matrix (Fin 2) (Fin 2) (O ℚ)) := by
  intro hc
  have h00 := congrFun (congrFun hc 0) 0
  simp only [rotMat, Matrix.one_apply_eq, Matrix.cons_val', Matrix.cons_val_zero,
    Matrix.empty_val', Matrix.cons_val_fin_one, Matrix.of_apply] at h00
  have := congrArg (fun z => z.re.re.im) h00
  simp only [u1] at this
  norm_num at this

/-- ★ THE ROTATION GENUINELY MOVES THE SPACE BLOCK: the matrix `herm2 t x 1` (off-diagonal the real
    unit) is sent to `herm2 t x u1` — the off-diagonal octonion rotated from `1` to `u1`. With
    `u1 ≠ 1` this is a genuine nontrivial rotation of the nine space directions — the honest hallmark
    of a compact space rotation in the matrix picture, distinct from the identity. -/
theorem act_rotates_space (t x : ℚ) :
    actBy (rotMat u1) (herm2 t x 1) = herm2 t x u1 := by
  rw [act_herm2_rot u1 gForm_u1 t x 1, mul_one]

end

end Phys.Algebra
