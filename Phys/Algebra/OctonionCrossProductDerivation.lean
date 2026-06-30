/-
# N207 — DERIVATION-INVARIANCE OF THE 7-DIMENSIONAL CROSS PRODUCT

Over the DERIVED field `ℚ` and the octonion rung `O ℚ = CD (H ℚ)`, every Leibniz derivation
`D` of the octonion product (`IsDerivQ D`, the elements of the banked derivation Lie algebra
`derivationLieQ = Der(O ℚ) = g₂`, N16–N21) is SIMULTANEOUSLY a derivation of the banked
7-dimensional cross product `octCross` (N206):

      D (octCross x y) = octCross (D x) y + octCross x (D y).

This CONNECTS the two faces of the exceptional structure: the VECTOR PRODUCT (N206, the
bilinear antisymmetric `octCross`) and the DERIVATION LIE ALGEBRA (N16–N21, `g₂ = Der(O ℚ)`,
the carrier of the gauge arc) share the SAME infinitesimal symmetry algebra. The cross product
and the octonion product are invariant under exactly the same `g₂`.

## THE NON-MECHANICAL CONTENT (why this is NOT a trivial Leibniz restatement)

`octCross x y = x·y + (gForm x y)•1` carries a metric CORRECTION term `(gForm x y)•1`. The
Leibniz law alone gives `D(x·y) = D x · y + x · D y`, but acting on the correction term yields
`D((gForm x y)•1) = (gForm x y)•(D 1) = 0` ONLY because a derivation kills the unit
(`derivQ_one`), and reassembling `octCross (D x) y + octCross x (D y)` produces the EXTRA term
`(gForm (D x) y + gForm x (D y))•1`, which vanishes ONLY because every derivation is
SKEW-ADJOINT for the Born self-overlap form (`gFormQ_skew`, N24/N26 — `gForm (D x) y +
gForm x (D y) = 0`). So the invariance combines TWO distinct banked invariances — the
MULTIPLICATIVE Leibniz law and the METRIC skew-adjointness — into one statement. It is a genuine
junction of N206 (the product), N16–N21 (the Lie algebra), and N24 (the Born metric), not a
single-rule consequence.

## THE ONE-CAUSE WEB

The SAME `g₂ = Der(O ℚ)` that the gauge arc (colour SU(3) N42, isospin SU(2) N187, …) is built
inside is ALSO the infinitesimal automorphism algebra of the vector product. The derivation
algebra of the octonion product and of the cross product COINCIDE — one symmetry algebra, two
faces (the associative-bilinear product N205 vs. the antisymmetric vector product N206).

## Physics-words-removable

There are NO physics words in any theorem STATEMENT. Delete every comment and the mathematics
stands: over the derived field `ℚ` and `O ℚ = CD (H ℚ)`, for every ℚ-linear endomorphism `D`
satisfying the Leibniz law `D (x·y) = D x · y + x · D y`, the operation
`octCross x y = x·y + (gForm x y)•1` satisfies `D (octCross x y) = octCross (D x) y +
octCross x (D y)`; and at the concrete banked nullbasis endomorphism `D0E` and units `u1, u2`
the value is genuinely nonzero.

DERIVED from the trunk (the banked `octCross` N206; `IsDerivQ`/`derivationLieQ`/`mem_derivationLieQ`
N16–N21; `derivQ_one` N20; `gFormQ_skew` N24/N26; `gForm_add_left`/`_right` N31; `gForm_u1_u2`
N206; the nullbasis derivation `D0E`/`D0E_isDerivQ` N16; `u1`/`u2`/`c3` N18 — standard Mathlib
MACHINERY on the DERIVED objects, STANDARD §3). NO posited cross product / vector-product algebra /
G₂ / derivation algebra / Lie group as content, NO Mathlib ℝ/ℂ as content (ℚ is the coefficient
field the `Module.End`/`LieSubalgebra`/`gForm` statements are WRITTEN IN; the OBJECT is the derived
rung `O ℚ = CD (H ℚ)`). Foundations-only `⊆ {propext, Classical.choice, Quot.sound}`.
-/
import Phys.Algebra.OctonionCrossProduct
import Phys.Algebra.DerivationLowerBound

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## ★★★ THE INVARIANCE (the headline). -/

/-- ★★★ DERIVATION-INVARIANCE OF THE CROSS PRODUCT: every Leibniz derivation `D` of the octonion
    product is also a derivation of the cross product `octCross`:
    `D (octCross x y) = octCross (D x) y + octCross x (D y)`. The correction term
    `(gForm x y)•1` is killed precisely because `D` is skew-adjoint for the Born form
    (`gFormQ_skew`) — combining the MULTIPLICATIVE Leibniz law and the METRIC skew-adjointness. -/
theorem octCross_deriv_leibniz (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) (x y : O ℚ) :
    D (octCross x y) = octCross (D x) y + octCross x (D y) := by
  unfold octCross
  rw [map_add, map_smul, derivQ_one D hD, smul_zero, add_zero, hD x y]
  have hskew := gFormQ_skew D hD x y
  have hcorr : (gForm (D x) y) • (1 : O ℚ) + (gForm x (D y)) • (1 : O ℚ) = 0 := by
    rw [← add_smul, hskew, zero_smul]
  rw [show ((D x * y + (gForm (D x) y) • (1 : O ℚ)) + (x * D y + (gForm x (D y)) • (1 : O ℚ)))
       = (D x * y + x * D y)
         + ((gForm (D x) y) • (1 : O ℚ) + (gForm x (D y)) • (1 : O ℚ)) from by abel,
     hcorr, add_zero]

/-- ★★ THE LIE-ALGEBRA FORM: every element of the banked derivation Lie algebra
    `derivationLieQ = Der(O ℚ) = g₂` (N16–N21) is a cross-product derivation — the two faces of
    the exceptional structure (the product and the vector product) share the SAME infinitesimal
    symmetry algebra. -/
theorem derivationLieQ_octCross_leibniz (D : derivationLieQ) (x y : O ℚ) :
    (D : Module.End ℚ (O ℚ)) (octCross x y)
      = octCross ((D : Module.End ℚ (O ℚ)) x) y + octCross x ((D : Module.End ℚ (O ℚ)) y) :=
  octCross_deriv_leibniz (D : Module.End ℚ (O ℚ)) D.2 x y

/-! ## W8 NON-VACUITY — the invariance is genuine at a concrete banked witness derivation. -/

/-- The witness coordinate `(D0E (octCross u1 u2)).im.re.re = −1`: the nullbasis derivation `D0E`
    (N16) acts genuinely nontrivially on the cross product `octCross u1 u2 = u1·u2` (the next
    imaginary unit), since `.im.re.re = −c3(u1·u2) = −1`. -/
theorem octCross_deriv_witness_coord : (D0E (octCross u1 u2)).im.re.re = -1 := by
  rw [show octCross u1 u2 = u1 * u2 by
        unfold octCross; rw [gForm_u1_u2, zero_smul, add_zero]]
  simp only [D0E, c3, u1, u2, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
    CD.neg_im, Dbl.mul_im, Dbl.add_im, Dbl.neg_im,
    LinearMap.coe_mk, AddHom.coe_mk]
  norm_num

/-- ★★ THE INVARIANCE IS NON-VACUOUS: `D0E (octCross u1 u2) ≠ 0` — the derivation moves the cross
    product genuinely (not the trivial fixed/zero case). -/
theorem octCross_deriv_witness_ne_zero : D0E (octCross u1 u2) ≠ 0 := by
  intro h
  have hz := octCross_deriv_witness_coord
  rw [h] at hz
  simp only [CD.zero_re, CD.zero_im, Dbl.zero_re] at hz
  norm_num at hz

/-- The headline invariance instantiated at the concrete banked nullbasis derivation `D0E` and the
    banked imaginary units `u1, u2` — a genuinely nonzero instance (`octCross_deriv_witness_ne_zero`),
    so the Leibniz-over-the-cross-product law is non-vacuous content. -/
theorem octCross_deriv_witness :
    D0E (octCross u1 u2) = octCross (D0E u1) u2 + octCross u1 (D0E u2) :=
  octCross_deriv_leibniz D0E D0E_isDerivQ u1 u2

end

end Phys.Algebra
