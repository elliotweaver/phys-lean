/-
# N208 — THE 7-DIMENSIONAL CROSS-PRODUCT CONTRACTION (VECTOR TRIPLE-PRODUCT) IDENTITY

Over the derived `ℚ` and the octonion rung `O ℚ = CD (H ℚ)`, the 7-dimensional cross product
`octCross` (banked N206) satisfies the CONTRACTED double-cross identity: for imaginary `x, y ∈ ImO`,

      octCross x (octCross x y) = (gForm x y) • x − (gForm x x) • y.

This is the 7-dimensional analogue of the classical `x × (x × y) = ⟨x,y⟩ x − ⟨x,x⟩ y`. In seven
dimensions the FULL BAC–CAB rule `a × (b × c) = ⟨a,c⟩ b − ⟨a,b⟩ c` FAILS; only this contracted
`(x, x, y)` case survives — and it survives PRECISELY because of LEFT ALTERNATIVITY
`x · (x · y) = (x · x) · y` (`mul_mul_left`, Alternative.lean, the alternating `(x,x,y)` associator
vanishes). The classical proof of BAC–CAB uses full associativity of coordinates; here the only
associativity available is the alternating one, and it is exactly enough for the contracted case.

## Why this is a GENUINELY NEW joint (not a re-pin, not mechanical)
- DIFFERENT DEGREE/OBJECT from N206: `octCross_lagrange` (N206) is a degree-2 SCALAR norm identity
  `gForm (x×y)(x×y) = gForm x x · gForm y y − (gForm x y)²`. THIS is a degree-3 VECTOR equation in
  `O ℚ`.
- DIFFERENT LEVER: N206 routed entirely through the Born composition law `gForm_comp`; it never
  used the alternative laws. THIS identity is forced by LEFT ALTERNATIVITY `mul_mul_left`
  (Alternative.lean) + the imaginary minimal polynomial `x·x = −(gForm x x)•1` (`selfMul_eq_smul`)
  + the orthogonality `gForm x (octCross x y) = 0`. A NEW connection N206 (cross product) ↔
  Alternative.lean (the alternative laws).
- NOT N205's Jacobiator (the full-algebra commutator on all of `O`; this is the contracted
  imaginary vector product).
- NOT trivial-from-associativity: `O ℚ` is non-associative; the contraction holds ONLY because the
  `(x, x, y)` associator vanishes by alternativity, while the generic `(a, b, c)` associator does
  not. A generic `octCross a (octCross b y)` does NOT reduce this way — the `x = x` coincidence
  triggers alternativity.

## The chain
`octCross`/`octCross_mem_ImO`/`octCross_lagrange` (N206) on the derived rung `O ℚ = CD (H ℚ)`;
`mul_mul_left` LEFT ALTERNATIVITY (Alternative.lean); `selfMul_eq_smul`/`octo_quadratic`
(DerivationAutGroup); `gForm`/`gForm_symm` (N24); `qsmul_mul_left`/`qsmul_mul_right`
(DerivationFinrank); `trace_id`/`reQ_add`/`reQ_neg`/`reQ_smul` (N17); `ImO`/`mem_ImO`/`one_ne_zero_O`
(N26); `u1`/`u2`/`u1_mem_ImO`/`u2_mem_ImO` (N18/N26); `gForm_u1` (SpinorRotation); `gForm_u1_u2`
(N206). `ℚ` is the coefficient field the `Submodule`/`gForm` statements are WRITTEN IN (the
N24/N26/N206 precedent); the OBJECT is the derived rung `O ℚ` and its banked imaginary cross
product — STANDARD §3. NO posited cross product / vector-product algebra / `G₂` / composition
algebra / alternative algebra as content, NO Mathlib ℝ/ℂ as content, NO bridge.
-/
import Phys.Algebra.OctonionCrossProduct
import Phys.Algebra.Alternative
import Phys.Algebra.DerivationAutGroup

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- Imaginary elements have zero real part: `x ∈ ImO ⟹ reQ x = 0`. From the trace identity
    `x + star x = (2 reQ x)•1` with `star x = −x` ⟹ `(2 reQ x)•1 = 0` ⟹ `reQ x = 0`
    (`1 ≠ 0`). -/
theorem reQ_ImO_zero {x : O ℚ} (hx : x ∈ ImO) : reQ x = 0 := by
  have hs : star x = -x := (mem_ImO).mp hx
  have ht := trace_id x
  rw [hs, add_neg_cancel] at ht
  have hz : (2 * reQ x) • (1 : O ℚ) = 0 := ht.symm
  rcases smul_eq_zero.mp hz with h | h
  · rcases mul_eq_zero.mp h with h' | h'
    · norm_num at h'
    · exact h'
  · exact absurd h one_ne_zero_O

/-- The square of an imaginary element lands on the unit line at the NEGATIVE Born norm:
    `x ∈ ImO ⟹ x·x = (−gForm x x)•1`. From `x · star x = (gForm x x)•1` (`selfMul_eq_smul`)
    with `star x = −x`. -/
theorem octSq_ImO {x : O ℚ} (hx : x ∈ ImO) :
    x * x = (- gForm x x) • (1 : O ℚ) := by
  have hs : star x = -x := (mem_ImO).mp hx
  have hsm : x * star x = (gForm x x) • (1 : O ℚ) := selfMul_eq_smul x
  rw [hs, mul_neg] at hsm
  have hxx : x * x = -((gForm x x) • (1 : O ℚ)) := by rw [← hsm, neg_neg]
  rw [hxx, neg_smul]

/-- ★ THE INNER STEP via LEFT ALTERNATIVITY: `x · (octCross x y) = (gForm x y)•x − (gForm x x)•y`
    for `x ∈ ImO`. The key move is `mul_mul_left : x·(x·y) = (x·x)·y` (LEFT ALTERNATIVITY,
    Alternative.lean) — the `(x,x,y)` associator vanishes — followed by `octSq_ImO`. -/
theorem octMul_x_octCross {x y : O ℚ} (hx : x ∈ ImO) :
    x * (octCross x y) = (gForm x y) • x - (gForm x x) • y := by
  unfold octCross
  rw [mul_add, mul_mul_left x y, octSq_ImO hx, qsmul_mul_left, one_mul,
      qsmul_mul_right, mul_one, neg_smul]
  abel

/-- The factor `x` is Born-orthogonal to the cross product `octCross x y`:
    `gForm x (octCross x y) = 0`. Since `octCross x y ∈ ImO`, `gForm x (octCross x y) =
    −reQ (x · octCross x y) = −reQ ((gForm x y)•x − (gForm x x)•y) = 0` because both `x, y`
    are imaginary (`reQ = 0`). -/
theorem gForm_x_octCross {x y : O ℚ} (hx : x ∈ ImO) (hy : y ∈ ImO) :
    gForm x (octCross x y) = 0 := by
  have hmem : octCross x y ∈ ImO := octCross_mem_ImO hy
  have hs : star (octCross x y) = -(octCross x y) := (mem_ImO).mp hmem
  unfold gForm
  rw [hs, mul_neg, reQ_neg, octMul_x_octCross hx]
  rw [sub_eq_add_neg, reQ_add, reQ_smul, reQ_neg, reQ_smul,
      reQ_ImO_zero hx, reQ_ImO_zero hy]
  ring

/-- ★★★ THE HEADLINE — the 7-dimensional cross-product CONTRACTION (vector triple-product)
    identity: for imaginary `x, y ∈ ImO`,

        octCross x (octCross x y) = (gForm x y) • x − (gForm x x) • y.

    The outer `octCross x (octCross x y) = x·(octCross x y) + (gForm x (octCross x y))•1`;
    the correction term vanishes by `gForm_x_octCross`, and the product term is the
    LEFT-ALTERNATIVE inner step `octMul_x_octCross`. -/
theorem octCross_contraction {x y : O ℚ} (hx : x ∈ ImO) (hy : y ∈ ImO) :
    octCross x (octCross x y) = (gForm x y) • x - (gForm x x) • y := by
  have hgo : gForm x (octCross x y) = 0 := gForm_x_octCross hx hy
  have hxo : x * (octCross x y) = (gForm x y) • x - (gForm x x) • y :=
    octMul_x_octCross hx
  -- unfold ONLY the outer octCross layer (head occurrence)
  show x * (octCross x y) + (gForm x (octCross x y)) • (1 : O ℚ)
      = (gForm x y) • x - (gForm x x) • y
  rw [hgo, zero_smul, add_zero, hxo]

/-! ## W8 non-vacuity teeth -/

/-- At the orthonormal pair `(u1, u2)`: `gForm u1 u2 = 0` (N206) and `gForm u1 u1 = 1`
    (SpinorRotation), so the contraction collapses to
    `octCross u1 (octCross u1 u2) = 0•u1 − 1•u2 = −u2`: the double cross of two orthonormal
    imaginary units reproduces the NEGATIVE of the second unit. -/
theorem octCross_contraction_witness :
    octCross u1 (octCross u1 u2) = - u2 := by
  rw [octCross_contraction u1_mem_ImO u2_mem_ImO, gForm_u1_u2, gForm_u1,
      zero_smul, zero_sub, one_smul]

/-- The witness coordinate `(octCross u1 (octCross u1 u2)).re.im.re = −1`: the double cross
    reproduces `−u2`, a GENUINELY NONZERO imaginary unit. -/
theorem octCross_contraction_witness_coord :
    (octCross u1 (octCross u1 u2)).re.im.re = -1 := by
  rw [octCross_contraction_witness]
  decide

/-- ★★ THE CONTRACTION IS NON-VACUOUS: `octCross u1 (octCross u1 u2) ≠ 0` — the double cross
    of two orthonormal imaginary units is genuinely nonzero (it is `−u2`), not the trivial
    `0 = 0`. -/
theorem octCross_contraction_witness_ne_zero :
    octCross u1 (octCross u1 u2) ≠ 0 := by
  intro h
  have hc : (octCross u1 (octCross u1 u2)).re.im.re = -1 :=
    octCross_contraction_witness_coord
  rw [h] at hc
  simp at hc

end Phys.Algebra
