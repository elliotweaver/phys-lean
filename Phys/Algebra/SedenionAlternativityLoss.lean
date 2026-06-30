/-
  Phys.Algebra.SedenionAlternativityLoss — N200: THE LOSS OF LEFT-ALTERNATIVITY
  AT THE SEDENION RUNG (the FOURTH termination of the one octonionic cause).
  ===========================================================================
  THE "ONE CAUSE, MANY TERMINATIONS" WEB, ONE RUNG WIDER. The cascade's
  octonionic non-associativity is a single algebraic seed (`O ℚ` is the first
  non-associative rung, `Phys/Cascade/Octonion.lean`, `not_associative`). That
  ONE fact is already known to terminate THREE different structures:

    • THE CASCADE itself stops at the next double `S ℚ = CD (O ℚ)`: division and
      the Born / composition self-overlap law are LOST (`Phys/Cascade/Sedenion.lean`
      `has_zero_divisor`, `born_law_fails`, `zero_divisor_breaks_composition`).
    • THE HERMITIAN-JORDAN TOWER caps at order `3` — the Jordan identity fails at
      `n ≥ 4` exactly when the entry algebra is non-associative
      (`jordan_cap_iff_nonassoc`, N5).
    • THE CHIRALITY EXTENSION is blocked by the same cap (`chirality_block_iff_jordan_cap`,
      N44).

  This module banks the FOURTH termination: the LEFT-ALTERNATIVE LAW
  `x · (x · y) = (x · x) · y` — which the octonions KEEP (`Phys/Algebra/Alternative.lean`,
  `mul_mul_left`) — FAILS one rung up, on the sedenion shape `S ℚ = CD (O ℚ)`.
  Until now this fact lived only in a comment (`Alternative.lean` L45–47, "the
  left-alternative and Moufang laws break on `CD (O ℚ)`") and in a numeric probe
  (workbench/N5-jordan-cap/sedenion_test.py); here it is a THEOREM.

  THE DEEP CONNECTION (what makes this NON-VACUOUS, docs/RUNBOOK.md W8). The loss
  is not an independent new computation: it is forced by the SAME banked zero
  divisor that stops the cascade. The minimal left-alternativity witness is the
  banked pair `zdX, zdY` (`Sedenion.lean`), and:

    zero_divisor_breaks_left_alternative
                         — ★ ONE FACT, A FOURTH TERMINATION. ANY zero divisor
                           `x · y = 0` whose "square·other" `(x · x) · y` is
                           nonzero breaks the left-alternative law:
                           `x · (x · y) = x · 0 = 0 ≠ (x · x) · y`. The right side
                           of the alternative law is FORCED to `0` by the zero
                           divisor, while the left side is not — the same zero
                           divisor that loses division (`zero_divisor_prod`) and
                           the composition law (`zero_divisor_breaks_composition`)
                           ALSO loses alternativity, read a third way.
    sedenion_left_alt_witness
                         — ★ THE CONCRETE WITNESS on the banked pair:
                           `(zdX · zdX) · zdY ≠ zdX · (zdX · zdY)`. The right side
                           collapses through the banked `zero_divisor_prod`
                           (`zdX · zdY = 0`); the left side is nonzero (its
                           `re.im.re.im` coordinate is `-2`, since `zdX · zdX`
                           is the scalar `-2` and `(-2) · zdY ≠ 0`).
    sedenion_not_left_alternative
                         — ★ THE HEADLINE: `¬ ∀ x y : S ℚ, (x · x) · y = x · (x · y)`.
                           The terminal algebra past the octonion stop is no longer
                           left-alternative. The alternativity the octonions keep —
                           the precise property the `H₃(𝕆)` Jordan cap value `3`
                           measures — is destroyed by one more doubling.

  WHY THIS IS A GENUINELY DIFFERENT JOINT (docs/RUNBOOK.md W4.5). N43/N198/N199
  are all faces of the `(1,9)` determinant FORM (a quadratic-form object: its
  inertia split, its Sylvester invariance, its null cone / Witt index). This node
  is about the ALGEBRA's MULTIPLICATIVE structure — the alternative law / the
  associator — a different object entirely. It is also NOT the (heavy, deferred)
  forced-generic cascade-stop iff ("`N`-multiplicative on `CD A ⟹ A` associative"
  for every base): it is the CONCRETE witnessed loss, the exact analogue of N2's
  `not_associative` one rung up.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). There are NO physics words here.
  Every statement is a pure algebraic fact about the Cayley–Dickson double of the
  derived non-associative algebra `O ℚ`: the double has a zero divisor whose
  presence forces the left-alternative identity `x(xy) = (xx)y` to fail. Nothing
  to delete.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no a fully
  proved implication standing in for a missing proof.
-/
import Phys.Cascade.Sedenion
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade

/-! ## A right-multiplication-by-zero helper on the terminal algebra `S ℚ`.

    `S ℚ = CD (O ℚ)` is the double of the NON-associative, non-commutative `O ℚ`,
    so it carries NO `Ring`/`MulZeroClass` instance (the banked `Ring (CD A)`
    needs `CommRing A`). The fact `x · 0 = 0` must be proved by hand from the
    `CD` product, never assumed from a typeclass. -/
theorem sX_mul_zero (x : S ℚ) : x * (0 : S ℚ) = 0 := by
  ext <;> simp [CD.mul_re, CD.mul_im, CD.star_re, CD.star_im]

/-! ## THE FOURTH TERMINATION — the generic zero-divisor lever. -/

/-- ★ ONE FACT, A FOURTH TERMINATION (the "one cause, many terminations" web,
    one rung wider). ANY zero divisor `x · y = 0` whose product `(x · x) · y` is
    nonzero breaks the LEFT-ALTERNATIVE law on the terminal algebra: the right
    side `x · (x · y) = x · 0 = 0` is FORCED to vanish by the zero divisor, while
    the left side `(x · x) · y` does not. So the very element that loses division
    (`zero_divisor_prod`) and the composition / Born law
    (`zero_divisor_breaks_composition`) ALSO loses alternativity — the same
    cause, read a third way. -/
theorem zero_divisor_breaks_left_alternative {x y : S ℚ}
    (hxy : x * y = 0) (hne : (x * x) * y ≠ 0) :
    (x * x) * y ≠ x * (x * y) := by
  rw [hxy, sX_mul_zero]
  exact hne

/-! ## THE CONCRETE WITNESS on the banked zero-divisor pair `zdX, zdY`. -/

/-- The `re.im.re.im` coordinate of the left side `(zdX · zdX) · zdY` is `-2`:
    `zdX · zdX` is the scalar `-2` and `(-2) · zdY` has a `-2` in that slot. A
    single sedenion computation over the cascade ground ring `ℚ`. -/
theorem leftAlt_lhs_coord : ((zdX * zdX) * zdY).re.im.re.im = -2 := by
  simp [zdX, zdY, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im']
  norm_num

/-- The left side of the left-alternative law on the banked pair is NONZERO
    (its `re.im.re.im` coordinate is `-2 ≠ 0`). -/
theorem leftAlt_lhs_ne_zero : (zdX * zdX) * zdY ≠ 0 := by
  intro h
  have hc : ((zdX * zdX) * zdY).re.im.re.im = -2 := leftAlt_lhs_coord
  rw [h] at hc
  simp at hc

/-- ★ THE CONCRETE LEFT-ALTERNATIVITY FAILURE on the banked zero-divisor pair:
    `(zdX · zdX) · zdY ≠ zdX · (zdX · zdY)`. The right side collapses through the
    banked `zero_divisor_prod` (`zdX · zdY = 0 ⟹ zdX · (zdX · zdY) = zdX · 0 = 0`);
    the left side is nonzero (`leftAlt_lhs_ne_zero`). -/
theorem sedenion_left_alt_witness : (zdX * zdX) * zdY ≠ zdX * (zdX * zdY) :=
  zero_divisor_breaks_left_alternative zero_divisor_prod leftAlt_lhs_ne_zero

/-- ★ THE HEADLINE: the LEFT-ALTERNATIVE LAW FAILS on the terminal algebra
    `S ℚ = CD (O ℚ)`. There is a pair `x, y` with `(x · x) · y ≠ x · (x · y)`.
    The alternativity that the octonions KEEP (`Alternative.lean`'s `mul_mul_left`,
    the exact property the `H₃(𝕆)` Jordan-tower cap value `3` measures) is
    DESTROYED by one more Cayley–Dickson doubling — the fourth structure the same
    octonionic non-associativity terminates. -/
theorem sedenion_not_left_alternative : ¬ ∀ x y : S ℚ, (x * x) * y = x * (x * y) :=
  fun h => sedenion_left_alt_witness (h zdX zdY)

end Phys.Algebra
