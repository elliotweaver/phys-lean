/-
# N206 — THE 7-DIMENSIONAL CROSS PRODUCT ON Im(O ℚ) AND ITS LAGRANGE NORM IDENTITY

Over the DERIVED field `ℚ` and the octonion rung `O ℚ = CD (H ℚ)`, the imaginary subspace
`ImO` (banked `Phys.Algebra.ImO`, `finrank ℚ ImO = 7`, N26) carries a genuine **vector product**
— the cross product `octCross x y := x·y + ⟨x,y⟩•1` (the imaginary part of the octonion product
of two imaginaries) — which is anticommutative and closes in `ImO`, and which satisfies the
defining composition-algebra **Lagrange / Pythagorean norm identity**

      gForm (octCross x y) (octCross x y) = gForm x x · gForm y y − (gForm x y)²

for imaginary `x, y`. This is the structure whose automorphism group is the OTHER, distinct
characterization of the exceptional object the gauge arc lives inside: while `Der(O ℚ)` (N16–N21)
is the derivation Lie algebra, the cross product is the **bilinear vector product** whose
symmetry group fixes it — the two faces of the same exceptional structure. The N205 arc was
about the carrier's full-algebra commutator (NOT a Lie bracket); THIS is about the imaginary
vector product (an anticommutative, closing, norm-multiplicative operation).

## THE ONE LAW reframe (composition law + polarization, NOT a coordinate bash)

For imaginary `x, y` (`star x = −x`), `re(x·y) = −gForm x y` (`octMul_re_eq_neg_gForm`), so
`octCross x y = Im(x·y)` lands in `ImO` (`octCross_mem_ImO`). The headline norm identity goes
THROUGH the banked Born composition law `gForm_comp` (`gForm (x·y)(x·y) = gForm x x · gForm y y`)
+ `gForm` bilinearity + the fact that `ImO ⊥ ℚ·1` under `gForm` (`gForm_ImO_one`): writing
`x·y = octCross x y − ⟨x,y⟩•1`, bilinear expansion of `gForm (x·y)(x·y)` peels off the
`(gForm x y)²` term and leaves `gForm (octCross x y)(octCross x y)`. NO 8-coordinate expansion of
the product is ever performed — the magnitude proof stands on the banked structural identities.

## THE ONE-CAUSE WEB

The cross product exists, anticommutes, closes, and is norm-multiplicative ONLY because of the
banked composition law `Nrm_mul_on_O` / `gForm_comp` — the SAME Born = self-overlap = positivity
that survives precisely through the last associative-base rung (the octonions) and is LOST at the
sedenions (N200, `Nrm_not_mul_on_S`). One cause (the composition law surviving to `O ℚ`), the
vector-product algebra; one rung up it is gone.

## Physics-words-removable

There are NO physics words in any theorem STATEMENT. Delete every comment and the mathematics
stands: over the derived field `ℚ` and the Cayley–Dickson double of a double `O ℚ = CD (H ℚ)`,
the operation `octCross x y = x·y + (reQ (x · star y))•1` restricted to the imaginary subspace
`ImO = ker(star + 1)` is antisymmetric, lands in `ImO`, and satisfies
`gForm (octCross x y)(octCross x y) = gForm x x · gForm y y − (gForm x y)²`.

DERIVED from the trunk (the banked `gForm`/`reQ`/`gForm_symm` N24; `gForm_add_left`/`_right`,
`gForm_smul_left`/`_right` N31; the Born composition law `gForm_comp` / `Nrm_mul_on_O`;
`trace_id`/`reQ_neg`/`reQ_add`/`reQ_smul`/`reQ_one` N17; `ImO`/`mem_ImO`/`one_ne_zero_O` N26;
`u1`/`u2`/`u1_mem_ImO`/`u2_mem_ImO` N18/N26; `gForm_u1` SpinorRotation; `star_mul`/`mul_neg`/
`neg_mul_neg` Cascade — standard Mathlib MACHINERY on the DERIVED objects, STANDARD §3). NO
posited cross product / vector-product algebra / G₂ / composition algebra / division ring as
content, NO Mathlib ℝ/ℂ as content (ℚ is the coefficient field the `Submodule`/`gForm` statements
are WRITTEN IN; the OBJECT is the derived rung `O ℚ = CD (H ℚ)` and its banked imaginary subspace).
Foundations-only `⊆ {propext, Classical.choice, Quot.sound}`.
-/
import Phys.Algebra.LorentzIsometry
import Phys.Algebra.DerivationRep7
import Phys.Algebra.DerivationAutCompact
import Phys.Algebra.SpinorRotation

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## The unit-line / imaginary-subspace facts the cross product rests on. -/

/-- `gForm v 1 = reQ v`: the Born overlap with the unit reads off the real part. -/
theorem gForm_one_right (v : O ℚ) : gForm v (1 : O ℚ) = reQ v := by
  show reQ (v * star (1 : O ℚ)) = reQ v
  rw [show star (1 : O ℚ) = 1 by simp, mul_one]

/-- `gForm 1 1 = 1`. -/
theorem gForm_one_one : gForm (1 : O ℚ) (1 : O ℚ) = 1 := by
  rw [gForm_one_right, reQ_one]

/-- The imaginary subspace is `gForm`-orthogonal to the unit line: `x ∈ ImO ⟹ gForm x 1 = 0`. -/
theorem gForm_ImO_one {x : O ℚ} (hx : x ∈ ImO) : gForm x (1 : O ℚ) = 0 := by
  rw [gForm_one_right, mem_ImO] at *
  have htr := trace_id x
  rw [hx, add_neg_cancel] at htr
  have h1 : (2 * reQ x) • (1 : O ℚ) = 0 := htr.symm
  rcases smul_eq_zero.mp h1 with h | h
  · rcases mul_eq_zero.mp h with h2 | h2
    · norm_num at h2
    · exact h2
  · exact absurd h one_ne_zero_O

/-- ★ THE IMAGINARY REAL-PART IDENTITY: for `y ∈ ImO`, `reQ (x·y) = −gForm x y`.
    Since `star y = −y`, `gForm x y = reQ (x · star y) = reQ (x · (−y)) = −reQ (x·y)`. -/
theorem octMul_re_eq_neg_gForm {x y : O ℚ} (hy : y ∈ ImO) :
    reQ (x * y) = - gForm x y := by
  rw [mem_ImO] at hy
  show reQ (x * y) = - reQ (x * star y)
  rw [hy, mul_neg, reQ_neg]; ring

/-! ## The cross product. -/

/-- ★ THE CROSS PRODUCT on `O ℚ`: `octCross x y := x·y + (gForm x y)•1`. On the imaginary
    subspace this is exactly the imaginary part of the octonion product `Im(x·y)` (the real part
    `re(x·y) = −gForm x y` is cancelled), the genuine 7-dimensional vector product. -/
def octCross (x y : O ℚ) : O ℚ := x * y + (gForm x y) • (1 : O ℚ)

/-- ★★ CLOSURE: for imaginary `y`, the cross product lands in the imaginary subspace `ImO`.
    Its real part is `re(x·y) + gForm x y = −gForm x y + gForm x y = 0`. -/
theorem octCross_mem_ImO {x y : O ℚ} (hy : y ∈ ImO) :
    octCross x y ∈ ImO := by
  rw [mem_ImO]
  have htr := trace_id (octCross x y)
  have hre : reQ (octCross x y) = 0 := by
    show reQ (x * y + (gForm x y) • (1 : O ℚ)) = 0
    rw [reQ_add, octMul_re_eq_neg_gForm hy]
    have : reQ ((gForm x y) • (1 : O ℚ)) = gForm x y := by
      rw [reQ_smul, reQ_one, mul_one]
    rw [this]; ring
  rw [hre] at htr
  simp only [mul_zero, zero_smul] at htr
  linear_combination (norm := abel) htr

/-- ★ THE SYMMETRIC-PRODUCT IDENTITY: for imaginary `x, y`, the symmetric part of the octonion
    product is the real scalar `−2⟨x,y⟩`: `x·y + y·x = −(2 gForm x y)•1`. (`star` is an
    anti-automorphism with `star x = −x`, `star y = −y`, so `star(x·y) = y·x`; the trace identity
    gives `x·y + y·x = (2 re(x·y))•1` and `re(x·y) = −gForm x y`.) -/
theorem octMul_symm_eq {x y : O ℚ} (hx : x ∈ ImO) (hy : y ∈ ImO) :
    x * y + y * x = (-(2 * gForm x y)) • (1 : O ℚ) := by
  have hsx : star x = -x := (mem_ImO).mp hx
  have hsy : star y = -y := (mem_ImO).mp hy
  have hstar : star (x * y) = y * x := by rw [star_mul, hsx, hsy, neg_mul_neg]
  have htr := trace_id (x * y)
  rw [hstar] at htr
  rw [htr, octMul_re_eq_neg_gForm hy, mul_neg]

/-- ★★ ANTISYMMETRY: the cross product of imaginaries is antisymmetric, `octCross x y =
    −octCross y x`. (One of the two defining axioms of a vector product.) -/
theorem octCross_antisymm {x y : O ℚ} (hx : x ∈ ImO) (hy : y ∈ ImO) :
    octCross x y = - octCross y x := by
  unfold octCross
  have hsymm := octMul_symm_eq hx hy
  rw [gForm_symm y x]
  linear_combination (norm := module) hsymm

/-- The cross product of an imaginary with itself vanishes (the diagonal of an antisymmetric
    product). -/
theorem octCross_self {x : O ℚ} (hx : x ∈ ImO) : octCross x x = 0 := by
  have h := octCross_antisymm hx hx
  -- h : octCross x x = - octCross x x ⟹ 2 • (octCross x x) = 0 ⟹ octCross x x = 0
  have h2 : (2 : ℚ) • octCross x x = 0 := by
    rw [two_smul]; linear_combination (norm := abel) h
  have := smul_eq_zero.mp h2
  rcases this with h0 | h0
  · norm_num at h0
  · exact h0

/-! ## ★★★ THE LAGRANGE / PYTHAGOREAN NORM IDENTITY (the headline). -/

/-- ★★★ THE LAGRANGE / PYTHAGOREAN NORM IDENTITY: for imaginary `x, y`,
    `gForm (octCross x y) (octCross x y) = gForm x x · gForm y y − (gForm x y)²`.
    The defining composition-algebra relation of the cross product — the squared length of the
    vector product is the area² of the parallelogram. Proved through the banked Born composition
    law `gForm_comp` and `gForm` bilinearity, NOT a coordinate expansion. -/
theorem octCross_lagrange {x y : O ℚ} (_hx : x ∈ ImO) (hy : y ∈ ImO) :
    gForm (octCross x y) (octCross x y)
      = gForm x x * gForm y y - (gForm x y)^2 := by
  have hcomp := gForm_comp x y
  set c := gForm x y with hc
  set w := octCross x y with hw
  have hxy : x * y = w + (-c) • (1 : O ℚ) := by
    rw [hw]; unfold octCross; rw [neg_smul]; abel
  have hwmem : w ∈ ImO := by rw [hw]; exact octCross_mem_ImO hy
  have hw1 : gForm w (1 : O ℚ) = 0 := gForm_ImO_one hwmem
  have h1w : gForm (1 : O ℚ) w = 0 := by rw [gForm_symm]; exact hw1
  have h11 : gForm (1 : O ℚ) (1 : O ℚ) = 1 := gForm_one_one
  rw [hxy] at hcomp
  simp only [gForm_add_left, gForm_add_right, gForm_smul_left, gForm_smul_right,
      hw1, h1w, h11] at hcomp
  nlinarith [hcomp]

/-! ## W8 NON-VACUITY — the cross product is genuinely nonzero, the Lagrange identity genuine. -/

/-- The two banked imaginary units `u1, u2` are `gForm`-orthogonal. -/
theorem gForm_u1_u2 : gForm u1 u2 = 0 := by
  show reQ (u1 * star u2) = 0
  simp only [reQ, u1, u2, CD.mul_re, CD.star_re, CD.star_im, CD.add_re,
    CD.neg_re, CD.neg_im, Dbl.mul_re, Dbl.add_re, Dbl.star_re', Dbl.star_im',
    Dbl.neg_re, Dbl.neg_im]
  norm_num

/-- `gForm u2 u2 = 1` (`u2` is a Born unit). -/
theorem gForm_u2_u2 : gForm u2 u2 = 1 := by
  show reQ (u2 * star u2) = 1
  simp only [reQ, u2, CD.mul_re, CD.star_re, CD.star_im, CD.add_re,
    CD.neg_re, CD.neg_im, Dbl.mul_re, Dbl.add_re, Dbl.star_re', Dbl.star_im',
    Dbl.neg_re, Dbl.neg_im]
  norm_num

/-- ★ A NONZERO CROSS PRODUCT: `octCross u1 u2 = u1·u2` (the orthogonal pair, `gForm u1 u2 = 0`)
    and its `re.im.im` coordinate is `1` (it is the next imaginary unit `e₁·e₂ = e₃`), so it is
    genuinely nonzero — the cross product is NOT identically zero. -/
theorem octCross_u1_u2_coord : (octCross u1 u2).re.im.im = 1 := by
  unfold octCross
  rw [gForm_u1_u2, zero_smul, add_zero]
  simp only [u1, u2, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im]
  norm_num

/-- ★★ THE CROSS PRODUCT IS NOT IDENTICALLY ZERO (`octCross u1 u2 ≠ 0`) — the W8 teeth: the
    operation has genuine content, not the trivial vacuous product. -/
theorem octCross_u1_u2_ne_zero : octCross u1 u2 ≠ 0 := by
  intro h
  have hz : (octCross u1 u2).re.im.im = 1 := octCross_u1_u2_coord
  rw [h] at hz
  simp only [CD.zero_re, CD.zero_im, Dbl.zero_im] at hz
  norm_num at hz

/-- ★★ THE LAGRANGE VALUE AT THE ORTHONORMAL PAIR `(u1,u2)` IS `1`: `1·1 − 0² = 1`. The norm
    identity is non-vacuous — the cross product of two orthonormal imaginary units is itself a
    Born unit. -/
theorem octCross_lagrange_u1_u2 :
    gForm (octCross u1 u2) (octCross u1 u2) = 1 := by
  rw [octCross_lagrange u1_mem_ImO u2_mem_ImO, gForm_u1, gForm_u2_u2, gForm_u1_u2]
  norm_num

end

end Phys.Algebra
