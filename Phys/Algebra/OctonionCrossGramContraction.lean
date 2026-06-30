import Phys.Algebra.OctonionCoassociative4Form

/-!
# The cross-product Gram contraction — the polarized Born composition law

Over the derived `ℚ` and the octonion rung `O ℚ = CD (H ℚ)`, this module banks the
**polarized Born composition law** and the **Gram contraction of the 7-dimensional vector
product**.

The banked Born composition law `gForm_comp` (N24/LorentzIsometry) states that the Born
self-overlap form `gForm` is *multiplicative*: `gForm (x·y) (x·y) = gForm x x · gForm y y`.
That is a degree-`(2,2)` quadratic statement on the diagonal. Polarizing it twice — once in
the left factor (`gForm_right_exchange`) and once in the right factor (`gForm_exchange`) —
yields the fully bilinear **exchange identity**

  `gForm (x·y) (z·w) + gForm (x·w) (z·y) = 2 · gForm x z · gForm y w`,

the master identity underneath every composition-algebra contraction. It needs no coordinate
expansion: it is the double polarization of `gForm_comp` through the bilinearity of `gForm`.

On the imaginary subspace `Im(O ℚ)` (where `octCross x y = Im(x·y)` is the genuine 7-dimensional
vector product, N206), the exchange identity contracts the Gram pairing of two cross products to
the metric:

  `gForm (octCross x y) (octCross z w) + gForm (octCross x w) (octCross z y)`
      `= 2 · gForm x z · gForm y w − gForm x y · gForm z w − gForm x w · gForm y z`.

This `octCross_gram_contraction` is the **symmetric (metric) part of the calibration
contraction** `⟨φ_{xy·}, φ_{zw·}⟩`. The totally-antisymmetric coassociative 4-form correction
`coassoc4` (N210, `ψ = *φ`) *cancels* in the symmetric sum — the antisymmetric part of the Gram
pairing lives in the non-associative (double cross-product) sector, the obstruction that 7
dimensions do not simplify. On the diagonal `z = x, w = y` it recovers the banked Lagrange /
Pythagorean norm identity `octCross_lagrange` (N206), of which it is the full polarization.

Everything is derived through the banked `gForm_comp` (N24) + `gForm` bilinearity (N31) +
the cross product `octCross` (N206) + the imaginary real-part identity `octMul_re_eq_neg_gForm`
(N206), with no coordinate ring. `ℚ` is the coefficient field these `gForm` statements are
*written in* (per the standing dependency gate); the object is the derived rung `O ℚ = CD (H ℚ)`.
-/

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## The polarized Born composition law (the master exchange identity). -/

/-- ★ THE HALF-POLARIZED COMPOSITION LAW: polarizing the banked Born composition law
    `gForm_comp` in its LEFT factor. `gForm (a·y) (c·y) = gForm a c · gForm y y`. The
    self-overlap of two products sharing a right factor is the inner product of the left
    factors scaled by the shared self-overlap. Pure polarization through `gForm` bilinearity,
    no coordinate expansion. -/
theorem gForm_right_exchange (a c y : O ℚ) :
    gForm (a * y) (c * y) = gForm a c * gForm y y := by
  have h := gForm_comp (a + c) y
  rw [add_mul] at h
  simp only [gForm_add_left, gForm_add_right] at h
  have ha := gForm_comp a y
  have hc := gForm_comp c y
  have hsym : gForm (c * y) (a * y) = gForm (a * y) (c * y) := gForm_symm _ _
  have hsym2 : gForm c a = gForm a c := gForm_symm _ _
  linear_combination h / 2 - ha / 2 - hc / 2 - hsym / 2 + (gForm y y) * hsym2 / 2

/-- ★★★ THE EXCHANGE IDENTITY — the fully-polarized Born composition law:
    `gForm (x·y) (z·w) + gForm (x·w) (z·y) = 2 · gForm x z · gForm y w`. The master
    degree-4 scalar identity of the composition algebra, obtained by polarizing
    `gForm_right_exchange` in its right factor. From it both the Lagrange norm identity
    (N206, the diagonal) and the cross-product Gram contraction below descend. Proved purely
    through the banked composition law and `gForm` bilinearity — NO coordinate ring. -/
theorem gForm_exchange (x y z w : O ℚ) :
    gForm (x * y) (z * w) + gForm (x * w) (z * y) = 2 * gForm x z * gForm y w := by
  have h := gForm_right_exchange x z (y + w)
  rw [mul_add, mul_add] at h
  simp only [gForm_add_left, gForm_add_right] at h
  have hy := gForm_right_exchange x z y
  have hw := gForm_right_exchange x z w
  have hyw : gForm y w = gForm w y := gForm_symm _ _
  linear_combination h - hy - hw - (gForm x z) * hyw

/-! ## The cross-product Gram pairing, reduced to the product Gram and the metric. -/

/-- For imaginary `y`, `gForm (x·y) 1 = − gForm x y` (the real part of the product). -/
theorem gForm_xy_one (x y : O ℚ) (hy : y ∈ ImO) :
    gForm (x * y) (1 : O ℚ) = - gForm x y := by
  rw [gForm_one_right]; exact octMul_re_eq_neg_gForm hy

/-- For imaginary `w`, `gForm 1 (z·w) = − gForm z w`. -/
theorem gForm_one_zw (z w : O ℚ) (hw : w ∈ ImO) :
    gForm (1 : O ℚ) (z * w) = - gForm z w := by
  show reQ (1 * star (z * w)) = - reQ (z * star w)
  rw [one_mul, reQ_star]; exact octMul_re_eq_neg_gForm hw

/-- ★ THE CROSS-Gram REDUCTION: for imaginary `y, w`, the Gram pairing of two cross products is
    the Gram pairing of the underlying products minus the metric correction:
    `gForm (octCross x y) (octCross z w) = gForm (x·y) (z·w) − gForm x y · gForm z w`. The
    real-scalar parts of the two products cancel against the metric term. -/
theorem gForm_octCross_octCross {x y z w : O ℚ}
    (hy : y ∈ ImO) (hw : w ∈ ImO) :
    gForm (octCross x y) (octCross z w) = gForm (x * y) (z * w) - gForm x y * gForm z w := by
  unfold octCross
  simp only [gForm_add_left, gForm_add_right, gForm_smul_left, gForm_smul_right]
  rw [gForm_xy_one x y hy, gForm_one_zw z w hw, gForm_one_one]
  ring

/-- ★★★ THE CROSS-PRODUCT GRAM CONTRACTION (the symmetric / metric part of the calibration
    contraction): for imaginary `x, y, z, w ∈ Im(O ℚ)`,
    `gForm (octCross x y) (octCross z w) + gForm (octCross x w) (octCross z y)`
        `= 2 · gForm x z · gForm y w − gForm x y · gForm z w − gForm x w · gForm y z`.
    The totally-antisymmetric coassociative 4-form correction `coassoc4` (N210, `ψ = *φ`)
    cancels in this symmetric sum; the surviving content is the metric contraction. On the
    diagonal `z = x, w = y` it is the banked Lagrange identity (N206), of which it is the full
    polarization. Derived from the exchange identity (the polarized composition law). -/
theorem octCross_gram_contraction {x y z w : O ℚ}
    (_hx : x ∈ ImO) (hy : y ∈ ImO) (_hz : z ∈ ImO) (hw : w ∈ ImO) :
    gForm (octCross x y) (octCross z w) + gForm (octCross x w) (octCross z y) =
      2 * gForm x z * gForm y w - gForm x y * gForm z w - gForm x w * gForm y z := by
  have h1 := gForm_octCross_octCross (x := x) (y := y) (z := z) (w := w) hy hw
  have h2 := gForm_octCross_octCross (x := x) (y := w) (z := z) (w := y) hw hy
  have he := gForm_exchange x y z w
  have hsym : gForm z y = gForm y z := gForm_symm _ _
  linear_combination h1 + h2 + he - (gForm x w) * hsym

/-! ## W8 non-vacuity — the contraction is genuinely nonzero on the orthonormal witness. -/

/-- The cross-product Gram contraction on the banked orthonormal pair `u1, u2` evaluates to the
    nonzero scalar `2`: `gForm (octCross u1 u2) (octCross u1 u2) + gForm (octCross u1 u2)
    (octCross u1 u2) = 2`. (Both `gForm u1 u1 = gForm u2 u2 = 1`, `gForm u1 u2 = 0`, so the RHS
    is `2·1·1 − 0 − 0 = 2`.) -/
theorem octCross_gram_witness :
    gForm (octCross u1 u2) (octCross u1 u2) + gForm (octCross u1 u2) (octCross u1 u2) = 2 := by
  have h := octCross_gram_contraction (x := u1) (y := u2) (z := u1) (w := u2)
    u1_mem_ImO u2_mem_ImO u1_mem_ImO u2_mem_ImO
  rw [h, gForm_u1, gForm_u2_u2, gForm_u1_u2]
  have h21 : gForm u2 u1 = 0 := by rw [gForm_symm]; exact gForm_u1_u2
  rw [h21]; norm_num

/-- The contracted value `2` is nonzero — the Gram contraction does not collapse. -/
theorem octCross_gram_witness_ne_zero :
    gForm (octCross u1 u2) (octCross u1 u2) + gForm (octCross u1 u2) (octCross u1 u2) ≠ 0 := by
  rw [octCross_gram_witness]; norm_num

end

end Phys.Algebra
