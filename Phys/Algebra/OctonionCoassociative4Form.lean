/-
# N210 — THE COASSOCIATIVE 4-FORM `ψ(x,y,z,w) = ⟨[x,y,z], w⟩` (the Hodge-dual calibration `*φ`)

Over the derived `ℚ` and the octonion rung `O ℚ = CD (H ℚ)`, the banked associator
`assoc x y z = (x·y)·z − x·(y·z)` (N5b `Alternative.lean`, ALTERNATING in its three slots:
`assoc_swap12`, `assoc_swap23`, `alt_left/right/flex`) and the Born self-overlap form `gForm`
(N24) assemble into the totally-antisymmetric quadrilinear COASSOCIATIVE 4-FORM on `ImO`:

      coassoc4 x y z w := gForm (assoc x y z) w   (= ⟨[x,y,z], w⟩).

For imaginary `w ∈ ImO` it equals `− reQ ([x,y,z] · w)` (`coassoc4_eq_neg_reQ`). It is
ANTISYMMETRIC under each adjacent transposition — `x↔y` (`coassoc4_swap_xy`), `y↔z`
(`coassoc4_swap_yz`), and `z↔w` (`coassoc4_swap_zw`) — hence TOTALLY ANTISYMMETRIC: the
alternating 4-form whose stabilizer in `GL(7)` is exactly the same exceptional structure group
`g₂ = Der(O)` that fixes the associative 3-form `φ` (N209). It is the Hodge dual `ψ = *φ`.

## Why this is a GENUINELY NEW joint (not a re-pin, not mechanical, not a juxtaposition)
- DIFFERENT OBJECT/DEGREE: a degree-4 SCALAR totally-antisymmetric quadrilinear FORM
  `ImO × ImO × ImO × ImO → ℚ`. NOT N209's degree-3 `φ = ⟨x, y×z⟩` (built on the cross product);
  NOT `octCross` (bilinear VECTOR, N206); NOT the degree-2 Lagrange norm (N206); NOT the
  degree-3 VECTOR contraction (N208); NOT the full-algebra Jacobiator (N205); NOT the metric
  `gForm` alone (degree-2, N24). It is the COASSOCIATIVE partner — the dual calibration.
- THE GENUINELY-NEW LEVER: the antisymmetry under the `z↔w` EXCHANGE — `assoc_reQ_skew`,
  `reQ ([x,y,z]·w) + reQ ([x,y,w]·z) = 0` — relates the associator's third BRACKET slot to the
  fourth METRIC slot. This is the statement that the associator is SKEW for the Born form in its
  last argument, a fact NEVER banked: the three-slot associator alternation (`assoc_swap12/23`)
  only gives the `x↔y` and `y↔z` antisymmetries; the `z↔w` exchange is independent content,
  forced by the real-part trace-associativity of the octonion product. The product is NON-
  associative; only its real part is associative, and that is exactly what makes `ψ` alternating.

## STANDARD compliance (the words-removable test, §2)
There are NO physics words in any theorem STATEMENT. Delete every comment and the mathematics
stands: over `ℚ` and `CD (H ℚ)`, the quadrilinear form `(x,y,z,w) ↦ gForm ((x·y)·z − x·(y·z)) w`
on `ImO = ker(star + 1)` equals `− reQ (((x·y)·z − x·(y·z)) · w)` for imaginary `w`, is
antisymmetric under each adjacent transposition, and equals `4` on an explicit 4-tuple. `assoc`,
`gForm`, `reQ` are the DERIVED objects; ℚ is the coefficient field the statements are WRITTEN IN
(the N5b/N24/N209 precedent).

DERIVED from the trunk (the associator `assoc`/`assoc_swap12`/`assoc_swap23`/`assoc_nonvanishing`
N5b; the Born form `gForm`/`gForm_smul_left`/`gForm_self_eq_zero` N24/N31; `reQ`/`reQ_neg` N17;
`ImO`/`mem_ImO` N26; standard additive-group MACHINERY on the DERIVED object, STANDARD §3),
NO posited associator / `G₂` / alternative algebra / composition algebra / Lie group / calibration
/ 3-form / 4-form / coassociative form as content, NO Mathlib ℝ/ℂ as content, NO bridge.
-/
import Phys.Algebra.OctonionAssociative3Form
import Phys.Algebra.Alternative

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## The coassociative 4-form. -/

/-- ★ THE COASSOCIATIVE 4-FORM: `coassoc4 x y z w = ⟨[x,y,z], w⟩` — the Born overlap of the
    associator `[x,y,z]` with the fourth vector `w`. The Hodge dual `ψ = *φ` of the associative
    calibration 3-form (N209). -/
def coassoc4 (x y z w : O ℚ) : ℚ := gForm (assoc x y z) w

/-- ★ THE BRIDGE TO THE TRIPLE PRODUCT: for imaginary `w`, `coassoc4 x y z w = − reQ ([x,y,z]·w)`.
    Since `star w = −w` for `w ∈ ImO`, the Born form reduces to minus the real part. -/
theorem coassoc4_eq_neg_reQ {w : O ℚ} (hw : w ∈ ImO) (x y z : O ℚ) :
    coassoc4 x y z w = - reQ (assoc x y z * w) := by
  unfold coassoc4 gForm
  have hsw : star w = - w := (mem_ImO).mp hw
  rw [hsw, mul_neg, reQ_neg]

/-! ## The genuinely-new lever: the associator is skew for the Born form in its last argument. -/

set_option maxHeartbeats 400000 in
/-- ★ THE GENUINELY-NEW LEVER — the `(z,w)` EXCHANGE: `reQ ([x,y,z]·w) + reQ ([x,y,w]·z) = 0`
    for ALL `x, y, z, w`. The associator `[x,y,z] = (x·y)·z − x·(y·z)` is SKEW for the real-part
    trace form in its third (bracket) versus fourth (metric) slot — content NOT contained in the
    three-slot associator alternation `assoc_swap12`/`assoc_swap23`. A bounded coordinate identity
    on the Cayley–Dickson product, forced by the real-part trace-associativity of `O ℚ`. -/
theorem assoc_reQ_skew (x y z w : O ℚ) :
    reQ (assoc x y z * w) + reQ (assoc x y w * z) = 0 := by
  unfold assoc
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

/-! ## Total antisymmetry: the three adjacent transpositions. -/

/-- ★ ANTISYMMETRY under `x ↔ y` (mechanical, from `assoc_swap12` + `gForm` left-linearity). -/
theorem coassoc4_swap_xy (x y z w : O ℚ) : coassoc4 x y z w = - coassoc4 y x z w := by
  unfold coassoc4
  have h : assoc x y z = - assoc y x z := eq_neg_of_add_eq_zero_left (assoc_swap12 x y z)
  rw [h, show (- assoc y x z) = (-1 : ℚ) • assoc y x z by rw [neg_one_smul], gForm_smul_left]
  ring

/-- ★ ANTISYMMETRY under `y ↔ z` (mechanical, from `assoc_swap23` + `gForm` left-linearity). -/
theorem coassoc4_swap_yz (x y z w : O ℚ) : coassoc4 x y z w = - coassoc4 x z y w := by
  unfold coassoc4
  have h : assoc x y z = - assoc x z y := eq_neg_of_add_eq_zero_left (assoc_swap23 x y z)
  rw [h, show (- assoc x z y) = (-1 : ℚ) • assoc x z y by rw [neg_one_smul], gForm_smul_left]
  ring

/-- ★★ ANTISYMMETRY under `z ↔ w` (THE GENUINELY-NEW transposition) on imaginary `z, w`:
    `coassoc4 x y z w = − coassoc4 x y w z`. Via the bridge `coassoc4_eq_neg_reQ` and the new
    lever `assoc_reQ_skew`. Together with `coassoc4_swap_xy`/`coassoc4_swap_yz` (the adjacent
    transpositions `(12)`, `(23)`, `(34)` generate `S₄`), the 4-form is TOTALLY ANTISYMMETRIC. -/
theorem coassoc4_swap_zw {z w : O ℚ} (hz : z ∈ ImO) (hw : w ∈ ImO) (x y : O ℚ) :
    coassoc4 x y z w = - coassoc4 x y w z := by
  rw [coassoc4_eq_neg_reQ hw x y z, coassoc4_eq_neg_reQ hz x y w]
  have := assoc_reQ_skew x y z w
  linarith [this]

/-! ## Non-vacuity (W8): the 4-form takes a genuine nonzero value. -/

/-- The cascade's non-associating witness triple `(ι(ιJ), ι(e₂), e₂)` (banked `assoc_nonvanishing`).
    Pairing the associator `[a,b,c]` with itself gives the Born norm `‖[a,b,c]‖²`. -/
abbrev wa : O ℚ := (CD.iota (ιJ ℚ) : O ℚ)
abbrev wb : O ℚ := (CD.iota (CD.e2 : H ℚ) : O ℚ)
abbrev wc : O ℚ := (CD.e2 : O ℚ)

/-- ★ THE 4-FORM IS GENUINELY NONZERO: on the self-paired witness `(a, b, c, [a,b,c])`,
    `coassoc4 a b c [a,b,c] = ‖[a,b,c]‖² ≠ 0` because the associator is nonzero on `O ℚ`
    (banked `assoc_nonvanishing`). So `ψ` is non-degenerate, not the trivial `0 = 0`. -/
theorem coassoc4_witness_ne_zero : coassoc4 wa wb wc (assoc wa wb wc) ≠ 0 := by
  unfold coassoc4
  exact fun h => assoc_nonvanishing (gForm_self_eq_zero.mp h)

set_option maxHeartbeats 1000000 in
/-- ★ THE EXPLICIT WITNESS VALUE: `coassoc4 a b c [a,b,c] = 4`. A single octonion computation
    over the cascade ground ring `ℚ` (the squared Born length of the witness associator). -/
theorem coassoc4_witness_coord : coassoc4 wa wb wc (assoc wa wb wc) = 4 := by
  unfold coassoc4 gForm assoc wa wb wc
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, CD.iota, CD.e2, ιJ, Dbl.J,
    Dbl.mul_re, Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im,
    Dbl.star_re', Dbl.star_im',
    star_zero, star_one,
    mul_zero, zero_mul, mul_one, one_mul, add_zero, zero_add, neg_zero, neg_neg]
  norm_num

end

end Phys.Algebra
