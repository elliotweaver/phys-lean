/-
  Phys.Algebra.Alternative — N5b: THE TERMINAL ALGEBRA'S ALTERNATIVITY (the cap's
  positive lever).
  ===========================================================================
  THE POSITIVE-EDGE LEVER for the Hermitian Jordan tower (N5). N2 derived the forced
  cascade and its STOP at the octonion shape `𝕆 = CD (CD B)`, where the product becomes
  NON-associative (`Phys/Cascade/Octonion.lean`, `not_associative`). But it did NOT
  become a wild non-associative algebra: it stays ALTERNATIVE — every associator
  `[x,y,z] = (x·y)·z − x·(y·z)` of the terminal algebra is an ALTERNATING function of
  its three arguments. This module derives that alternativity FORWARD from the banked
  Cayley–Dickson product, as a battery of identities, with NO Mathlib alternative-algebra
  /composition-algebra import (the POSIT-vs-DERIVE moat).

  WHY THIS NODE. N5 Part 1 proved the Hermitian Jordan tower's cap FAILS at order `n ≥ 4`
  and tied that failure, by a proved equivalence, to the loss of associativity
  (`jordan_cap_iff_nonassoc`). The COMPLEMENTARY direction — that the tower IS Jordan at
  order `n ≤ 3` — is the classical fact that `H₃(𝕆)` is a Jordan algebra. Its engine is
  exactly the property derived here: the Jordan identity on `H₃` over an algebra `D`
  holds because `D` is ALTERNATIVE (the entrywise Jordan defect collapses to a sum of
  associators of the matrix entries — see workbench/N5-jordan-cap/free_defect.py — and
  each associator is governed by the alternative laws), and `D = 𝕆` is alternative even
  though it is not associative. The cap value `3` is then the exact gap between
  "alternative" (which `𝕆` keeps — this module) and "associative" (which `𝕆` lost at the
  cascade stop — `not_associative`).

  WHAT IS DERIVED (forward; each a theorem, foundations-only):

    mul_mul_left     — ★ LEFT ALTERNATIVE (product form): `x·(x·y) = (x·x)·y`.
    mul_mul_right    — ★ RIGHT ALTERNATIVE (product form): `(x·y)·y = x·(y·y)`.
    mul_flex         — ★ FLEXIBLE (product form): `x·(y·x) = (x·y)·x`.
    mul_swap12       — ★ LINEARIZED left-alternative: `(x·y)·z + (y·x)·z = x·(y·z)+y·(x·z)`.
    mul_swap23       — ★ LINEARIZED right-alternative: `(x·y)·z + (x·z)·y = x·(y·z)+x·(z·y)`.
    moufang_left     — ★ LEFT MOUFANG `x·(y·(x·z)) = ((x·y)·x)·z`.
    moufang_right    — ★ RIGHT MOUFANG `((z·x)·y)·x = z·(x·(y·x))`.
    moufang_mid      — ★ MIDDLE MOUFANG `(x·y)·(z·x) = x·((y·z)·x)`.

    assoc            — the associator `[x,y,z] = (x·y)·z − x·(y·z)`.
    alt_left/right/  — ★ the alternative laws in ASSOCIATOR form: `[x,x,y]=0`,
      flex             `[x,y,y]=0`, `[x,y,x]=0`.
    assoc_swap12/23  — ★ the associator is ANTISYMMETRIC in each adjacent pair
                       (`[x,y,z]=−[y,x,z]`, `[x,y,z]=−[x,z,y]`): it is an ALTERNATING
                       trilinear form — the full octonionic alternativity, the exact
                       content the `H₃` cap needs.

  ANTI-VACUITY (docs/RUNBOOK.md W8). These are NOT bare-ring identities: they FAIL one
  rung up (on the sedenion shape `CD (O ℚ)`, the left-alternative and Moufang laws break
  — see workbench/N5-jordan-cap/sedenion_test.py), and the underlying algebra is
  genuinely non-associative (`not_associative`). The concrete witness `assoc_nonvanishing`
  exhibits a nonzero associator on `O ℚ` (the cascade's own non-associating triple),
  proving the alternating-form statements are non-vacuous (an alternating form that is
  identically zero would say nothing). `assoc_witness_coord` pins the witness associator's
  `im.im.im` coordinate to `2`.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). There are NO physics words here at all:
  every statement is a pure algebraic identity on the associator of the Cayley–Dickson
  double of a double. Nothing to delete.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.Operator
import Phys.Cascade.Octonion
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade
open Phys.Cascade.CD

/-! ## THE ALTERNATIVE LAWS (product form) on the octonion shape `CD (CD B)`.

    The carrier is the Cayley–Dickson double of a double `CD (CD B)` over a commutative
    `*`-base `B` — the octonion rung. Its base `CD B` is associative but in general
    non-commutative, so `CD (CD B)` is in general non-associative. The local `narCD` /
    `srCD` instances carry the (non-associative) ring structure; every identity below is
    proved by reducing the `CD` product to the commutative ground ring `B`. -/
section Alt
variable {B : Type*} [CommRing B] [StarRing B]
attribute [local instance] CD.narCD CD.srCD

set_option maxHeartbeats 4000000 in
/-- ★ LEFT ALTERNATIVE LAW (product form): `x·(x·y) = (x·x)·y`. Derived forward by
    expanding the `CD` product down to the commutative ground ring. It FAILS one rung up
    (the sedenions), so it is genuine octonionic content, not associativity. -/
theorem mul_mul_left (x y : CD (CD B)) : x * (x * y) = (x * x) * y := by
  ext <;>
    simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_mul, mul_zero] <;>
    ring

set_option maxHeartbeats 4000000 in
/-- ★ RIGHT ALTERNATIVE LAW (product form): `(x·y)·y = x·(y·y)`. -/
theorem mul_mul_right (x y : CD (CD B)) : (x * y) * y = x * (y * y) := by
  ext <;>
    simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_mul, mul_zero] <;>
    ring

set_option maxHeartbeats 4000000 in
/-- ★ FLEXIBLE LAW (product form): `x·(y·x) = (x·y)·x`. -/
theorem mul_flex (x y : CD (CD B)) : x * (y * x) = (x * y) * x := by
  ext <;>
    simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_mul, mul_zero] <;>
    ring

set_option maxHeartbeats 4000000 in
/-- ★ THE LINEARIZED LEFT-ALTERNATIVE LAW: `(x·y)·z + (y·x)·z = x·(y·z) + y·(x·z)`.
    Polarizing `mul_mul_left` in `x`. The associator-form companion is `assoc_swap12`. -/
theorem mul_swap12 (x y z : CD (CD B)) :
    (x * y) * z + (y * x) * z = x * (y * z) + y * (x * z) := by
  ext <;>
    simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_mul, mul_zero] <;>
    ring

set_option maxHeartbeats 4000000 in
/-- ★ THE LINEARIZED RIGHT-ALTERNATIVE LAW: `(x·y)·z + (x·z)·y = x·(y·z) + x·(z·y)`.
    Polarizing `mul_mul_right` in `y`. The associator-form companion is `assoc_swap23`. -/
theorem mul_swap23 (x y z : CD (CD B)) :
    (x * y) * z + (x * z) * y = x * (y * z) + x * (z * y) := by
  ext <;>
    simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_mul, mul_zero] <;>
    ring

set_option maxHeartbeats 8000000 in
/-- ★ THE LEFT MOUFANG IDENTITY: `x·(y·(x·z)) = ((x·y)·x)·z`. The higher alternative law
    that controls associators of PRODUCTS of elements — the identity the off-diagonal
    `H₃` Jordan assembly consumes. Derived forward from the `CD` product. -/
theorem moufang_left (x y z : CD (CD B)) : x * (y * (x * z)) = ((x * y) * x) * z := by
  ext <;>
    simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_mul, mul_zero] <;>
    ring

set_option maxHeartbeats 8000000 in
/-- ★ THE RIGHT MOUFANG IDENTITY: `((z·x)·y)·x = z·(x·(y·x))`. -/
theorem moufang_right (x y z : CD (CD B)) : ((z * x) * y) * x = z * (x * (y * x)) := by
  ext <;>
    simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_mul, mul_zero] <;>
    ring

set_option maxHeartbeats 8000000 in
/-- ★ THE MIDDLE MOUFANG IDENTITY: `(x·y)·(z·x) = x·((y·z)·x)`. -/
theorem moufang_mid (x y z : CD (CD B)) : (x * y) * (z * x) = x * ((y * z) * x) := by
  ext <;>
    simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_mul, mul_zero] <;>
    ring

/-! ### THE ASSOCIATOR FORM — `𝕆`'s associator is an ALTERNATING trilinear form.

    Packaging the product identities above as statements about the associator
    `[x,y,z] = (x·y)·z − x·(y·z)`. These are the forms the `H₃` Jordan assembly uses;
    each follows from the corresponding product identity by pure additive-group algebra
    (`sub_eq_zero`, `sub_add_sub_comm`), no further `CD` computation. -/

/-- THE ASSOCIATOR `[x, y, z] = (x·y)·z − x·(y·z)` of the octonion shape. -/
def assoc (x y z : CD (CD B)) : CD (CD B) := (x * y) * z - x * (y * z)

/-- ★ LEFT ALTERNATIVE (associator form): `[x, x, y] = 0`. -/
theorem alt_left (x y : CD (CD B)) : assoc x x y = 0 := by
  unfold assoc; rw [mul_mul_left, sub_self]

/-- ★ RIGHT ALTERNATIVE (associator form): `[x, y, y] = 0`. -/
theorem alt_right (x y : CD (CD B)) : assoc x y y = 0 := by
  unfold assoc; rw [mul_mul_right, sub_self]

/-- ★ FLEXIBLE (associator form): `[x, y, x] = 0`. -/
theorem alt_flex (x y : CD (CD B)) : assoc x y x = 0 := by
  unfold assoc; rw [mul_flex, sub_self]

/-- ★ THE ASSOCIATOR IS ANTISYMMETRIC IN ITS FIRST TWO ARGUMENTS:
    `[x,y,z] + [y,x,z] = 0`. The linearized left-alternative law; with `assoc_swap23`
    this makes the associator an alternating trilinear form. -/
theorem assoc_swap12 (x y z : CD (CD B)) : assoc x y z + assoc y x z = 0 := by
  unfold assoc
  rw [sub_add_sub_comm, mul_swap12, sub_self]

/-- ★ THE ASSOCIATOR IS ANTISYMMETRIC IN ITS LAST TWO ARGUMENTS:
    `[x,y,z] + [x,z,y] = 0`. The linearized right-alternative law. -/
theorem assoc_swap23 (x y z : CD (CD B)) : assoc x y z + assoc x z y = 0 := by
  unfold assoc
  rw [sub_add_sub_comm, mul_swap23, sub_self]

end Alt

/-! ## NON-VACUITY on the cascade's terminal algebra `O ℚ` (docs/RUNBOOK.md W8).

    The alternative laws say the associator is an ALTERNATING form. An alternating form
    that happened to be identically zero would say nothing — so the alternative laws are
    only content if the associator is genuinely NONZERO somewhere. It is: on `O ℚ` the
    cascade's own non-associating triple has a nonzero associator. So `O ℚ` is alternative
    AND non-associative — the precise gap the cap value 3 measures. -/

section Concrete
attribute [local instance] CD.narCD CD.srCD

set_option maxHeartbeats 4000000 in
/-- The `im.im.im` coordinate of the witness associator equals `2`: a single octonion
    computation over the cascade ground ring `ℚ`. -/
theorem assoc_witness_coord :
    (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ)).im.im.im = 2 := by
  unfold assoc
  simp only [sub_eq_add_neg, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, CD.iota, CD.e2, ιJ, Dbl.J,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.zero_re, Dbl.zero_im, Dbl.one_re, Dbl.one_im,
    CD.one_re, CD.zero_re, CD.zero_im, star_zero, star_one,
    mul_zero, zero_mul, mul_one, one_mul, add_zero, zero_add, neg_zero, neg_neg]
  norm_num

/-- ★ THE ASSOCIATOR IS GENUINELY NONZERO on `O ℚ`: at the cascade's non-associating
    triple `(ι(ιJ), ι(e₂), e₂)` (the banked `not_associative_witness`), `[·,·,·] ≠ 0`.
    So the alternating-form statements above are non-vacuous — `O ℚ` is alternative but
    NOT associative, the exact gap the Hermitian-tower cap value 3 measures. -/
theorem assoc_nonvanishing :
    assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ) ≠ 0 := by
  intro h
  have hz : (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ)).im.im.im = 2 :=
    assoc_witness_coord
  rw [h] at hz
  norm_num [CD.zero_im] at hz

end Concrete

end Phys.Algebra
