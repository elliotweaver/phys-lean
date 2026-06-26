/-
  Phys.Algebra.LorentzContinuumPolar — N56: THE BORN SELF-OVERLAP POSITIVITY and the forced
  (1,9) SIGNATURE SPLIT of the continuum Minkowski form over the DERIVED ℝ `Cut` — the
  positive-definiteness the polar/reverse decomposition rests on, DERIVED from the trunk
  (Born = self-overlap = positivity).
  ===========================================================================
  THE NEXT FORCED NODE after the two-sided-Moufang/Spin(9)-generator node (N55). N49–N55 banked,
  over the derived ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)`:
    • the continuum Born form `QvC = t² − x² − gFormC v v` + the isometry monoid `qvIsomMonoidC`
      (N49), the `Cut`-pinned Born composition law `gFormC (x·y)(x·y) = gFormC x x · gFormC y y`
      (`gFormC_comp`, N50);
    • the FORWARD soundness: both one-parameter generator families (`boostOPS` N52, `rotGenSetC`
      N53/N54) and the two-sided Moufang/Spin(9) generator `biMulFun` (N55), with the generated
      group `genIsomMonoidC2 ≤ qvIsomMonoidC` (every finite product of generators is an isometry);
    • the tangent algebra `infIsomLieAlg` + the polarized Minkowski form `BvC` (N51).

  ── THE FORWARD FRONTIER THIS NODE OPENS: the REVERSE direction needs BORN POSITIVITY ──
  N49–N55 banked the FORWARD inclusion `genIsomMonoidC2 ≤ qvIsomMonoidC` (every word in the
  generators is an isometry). The REVERSE — that EVERY orientation/time-preserving continuum
  isometry IS such a finite product (the polar/KAK decomposition `g = k·exp(p)`) — must, as the
  ROADMAP §N56 records, be attacked FROM Born positivity: a form-isometry's "boost part" `exp(p)`
  is the positive-definite factor of its polar decomposition, and positivity is exactly what the
  Born self-overlap supplies. But across the ENTIRE chain banked so far, NO positivity fact about
  the Born self-overlap form exists — yet "Born = self-overlap = positivity" is a TRUNK PRIMITIVE.
  This node banks that missing trunk prerequisite, the foundation the reverse/polar direction rests
  on, and the structural consequence it forces: the (1,9) signature split of the continuum
  Minkowski form.

  ── THE TRUNK REFRAME (THE ONE LAW): positivity is the SUM OF SQUARES over the ordered `Cut` ──
  The derived ℝ `Cut` is banked as a `LinearOrder` + `Field` + `IsStrictOrderedRing` (N11–N13), so
  squares are nonnegative. The Born self-overlap `gFormC v v = reQC (v · star v)` over the
  Cayley–Dickson double³ `O Cut = CD (CD (Dbl Cut))` expands, through the banked generic `CD`/`Dbl`
  product + conjugation, to the SUM OF THE EIGHT COORDINATE SQUARES — manifestly `≥ 0`, and `= 0`
  iff every coordinate is `0` iff `v = 0`. The self-overlap positivity that the trunk asserts is,
  over the ordered continuum, literally a sum of squares: `positivity`/`nlinarith` close it with NO
  analysis, NO topology, NO posited inner product. The reverse-direction positivity DISSOLVES into
  the ordered-field arithmetic of the derived ℝ.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    gFormC_sumOfSquares   — ★ THE STRUCTURAL HEART: `gFormC v v` equals the SUM OF THE EIGHT
                            coordinate squares of `v : O Cut`, via the banked generic `CD`/`Dbl`
                            product + conjugation, NOT a posited norm.
    gFormC_nonneg         — ★★ THE BORN SELF-OVERLAP IS NONNEGATIVE: `0 ≤ gFormC v v` over the
                            derived ℝ — the trunk's Born = self-overlap = positivity, made a theorem
                            of the ordered continuum (sum of squares).
    gFormC_eq_zero_iff    — ★★ POSITIVE-DEFINITENESS: `gFormC v v = 0 ↔ v = 0` — the Born
                            self-overlap is a positive-DEFINITE form (no nonzero null vector). The
                            non-degeneracy the polar decomposition's positive part requires.
    gFormC_pos_of_ne_zero — `v ≠ 0 → 0 < gFormC v v`: strictly positive off the origin.
    gFormC_one_pos        — NON-VACUITY: `0 < gFormC 1 1` (`= 1`), a concrete positive value.
    QvC_time_pos          — ★ THE TIME DIRECTION IS POSITIVE: `t ≠ 0 → 0 < QvC (t,0,0)` — the `+1`
                            of the signature.
    QvC_space_nonpos      — ★ THE SPACE BLOCK IS NONPOSITIVE: `QvC (0,x,v) ≤ 0` — the nine space
                            directions `(x, v)` enter the form with the opposite sign to time.
    QvC_space_neg_of_ne   — ★★ THE SPACE BLOCK IS NEGATIVE-DEFINITE: a NONZERO space vector
                            `(0,x,v)` has `QvC (0,x,v) < 0` — the `−9` of the signature. Together
                            with `QvC_time_pos` this is the (1,9) SIGNATURE SPLIT of the continuum
                            Minkowski form, DERIVED from Born positivity — the structural fact the
                            polar "boost part" rests on.
    QvC_space_e2_neg      — NON-VACUITY: a concrete nonzero space unit `(0,0,e₂)` has `QvC = −1 < 0`.

  ── THE W1 HEAVY REMAINDER (childed N57, an honest dissolution ticket, NOT closed here) ──
  The actual KAK `g = k·exp(p)` finite-product EXHAUSTION (`qvIsomMonoidC` on the connected
  component `≤ genIsomMonoidC2`) and the full `Spin(9)→SO(9)` surjectivity (every spacelike `SO(9)`
  rotation a finite product of `biMulFun`) require a positive-definite SQUARE ROOT over the derived
  `Cut` (no banked `sqrt` of a general nonnegative element — only the specific derived `√2`),
  connectedness, and Lie-group integration over `Cut` — none of which Mathlib supplies over `Cut`.
  That is the genuine HEAVY core, childed onto the chain tail as an honest W1 dissolution ticket.
  This node banks the Born-positivity / signature foundation it rests on: a form-isometry's boost
  part is the positive-definite factor of its polar decomposition, and THIS module proves that
  positivity exists and that the form has the (1,9) signature it acts on.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That octonionic Minkowski space carries the
  positive-definite Euclidean norm on its spacelike block and has Lorentzian signature `(1,9)` is
  standard (Sudbery, Manogue–Dray, Baez). Here the positive-definiteness and the signature split
  DESCEND from the banked generic Cayley–Dickson product + conjugation over the DERIVED ordered ℝ
  `Cut` — the Born self-overlap is literally the sum of the eight coordinate squares of the derived
  continuum, positive-definite by the order structure of `Cut` (N11–N13), NOT a posited inner
  product, NOT a posited signature, NOT Mathlib ℝ/ℂ as content, NOT a bridge. The trunk reframe
  (positivity = sum of squares over the ordered continuum) is exactly what lets the reverse-
  direction positivity re-ground without any analysis.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / Spin / SO(9) /
  SO⁺(1,9) / isometry / signature / Minkowski / spacelike / timelike / polar / KAK / positive-
  definite / Born": what remains is the theorem that, over the derived complete ordered field `Cut`
  and the Cayley–Dickson double³ `O Cut`, the form `gFormC v v = reQC (v · star v)` equals the sum
  of the eight coordinate squares of `v`, hence `0 ≤ gFormC v v` with equality iff `v = 0`; and
  that the form `QvC (t,x,v) = t² − x² − gFormC v v` is `> 0` on `(t,0,0)` with `t ≠ 0`, `≤ 0` on
  `(0,x,v)`, and `< 0` on nonzero `(0,x,v)`. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import (the continuum is the DERIVED `Cut`), NO posited Lorentz group, NO
  posited inner product / signature.
-/
import Phys.Algebra.LorentzContinuumSpin9

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## The Born self-overlap as a sum of squares — the structural heart of positivity. -/

/-- ★ THE STRUCTURAL HEART: the continuum Born self-overlap `gFormC v v` equals the SUM OF THE
    EIGHT coordinate squares of `v : O Cut = CD (CD (Dbl Cut))`. Through the banked generic
    Cayley–Dickson product (`CD.mul_re`/`Dbl.mul_re`) and conjugation (`CD.star_*`/`Dbl.star_*`),
    `reQC (v · star v)` collapses to `Σ (coordinate)²` — the trunk's self-overlap, written out over
    the derived continuum. No posited norm; pure structural unfolding + `ring`. -/
theorem gFormC_sumOfSquares (v : O Cut) :
    gFormC v v =
      v.re.re.re^2 + v.re.re.im^2 + v.re.im.re^2 + v.re.im.im^2
    + v.im.re.re^2 + v.im.re.im^2 + v.im.im.re^2 + v.im.im.im^2 := by
  show reQC (v * star v) = _
  simp only [reQC, CD.mul_re, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.star_re', Dbl.star_im',
    CD.add_re, CD.neg_re, CD.neg_im,
    Dbl.add_re, Dbl.neg_re, Dbl.neg_im]
  ring

/-- ★★ THE BORN SELF-OVERLAP IS NONNEGATIVE: `0 ≤ gFormC v v` over the derived ℝ `Cut`. The trunk's
    Born = self-overlap = positivity, made a theorem of the ordered continuum — the self-overlap is
    a sum of eight squares (`gFormC_sumOfSquares`), each `≥ 0` by the order structure of `Cut`
    (`IsStrictOrderedRing`, N11–N13). NO analysis, NO posited inner product. -/
theorem gFormC_nonneg (v : O Cut) : 0 ≤ gFormC v v := by
  rw [gFormC_sumOfSquares]; positivity

/-- ★★ POSITIVE-DEFINITENESS: `gFormC v v = 0 ↔ v = 0`. The Born self-overlap form is positive-
    DEFINITE — its only null vector is the origin. Forward: a sum of eight squares vanishes iff
    every coordinate vanishes (each square `≥ 0`, `nlinarith`), iff `v = 0` (`ext`). Backward:
    `gFormC 0 0 = reQC (0 · star 0) = 0`. The non-degeneracy the polar decomposition's positive
    part requires, DERIVED from the order structure of the continuum. -/
theorem gFormC_eq_zero_iff (v : O Cut) : gFormC v v = 0 ↔ v = 0 := by
  constructor
  · intro h
    rw [gFormC_sumOfSquares] at h
    ext <;>
    · simp only [CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im]
      nlinarith [sq_nonneg v.re.re.re, sq_nonneg v.re.re.im, sq_nonneg v.re.im.re,
        sq_nonneg v.re.im.im, sq_nonneg v.im.re.re, sq_nonneg v.im.re.im,
        sq_nonneg v.im.im.re, sq_nonneg v.im.im.im]
  · intro h; rw [h]; show reQC (0 * star 0) = 0; rw [zero_mul]; rfl

/-- The Born self-overlap is STRICTLY positive off the origin: `v ≠ 0 → 0 < gFormC v v`. -/
theorem gFormC_pos_of_ne_zero {v : O Cut} (hv : v ≠ 0) : 0 < gFormC v v :=
  lt_of_le_of_ne (gFormC_nonneg v) (fun h => hv ((gFormC_eq_zero_iff v).mp h.symm))

/-- NON-VACUITY (W8): the unit has strictly positive self-overlap, `0 < gFormC 1 1` (`= 1`). The
    positive-definite form is realized on a concrete nonzero vector. -/
theorem gFormC_one_pos : 0 < gFormC (1 : O Cut) (1 : O Cut) := by
  rw [gFormC_one]; exact one_pos

/-! ## The forced (1,9) signature split of the continuum Minkowski form. -/

/-- ★ THE TIME DIRECTION IS POSITIVE: a nonzero pure-time vector `(t,0,0)` has `0 < QvC (t,0,0)`
    (`= t²`). The `+1` of the signature — the single timelike direction. -/
theorem QvC_time_pos {t : Cut} (ht : t ≠ 0) : 0 < QvC (t, (0 : Cut), (0 : O Cut)) := by
  show 0 < QformC t 0 0
  unfold QformC
  have hg : gFormC (0 : O Cut) (0 : O Cut) = 0 := by show reQC (0 * star 0) = 0; rw [zero_mul]; rfl
  rw [hg]
  have : 0 < t ^ 2 := by positivity
  nlinarith [this]

/-- ★ THE SPACE BLOCK IS NONPOSITIVE: any space vector `(0,x,v)` has `QvC (0,x,v) ≤ 0` (`= −x² −
    gFormC v v`). The nine space directions `(x, v)` enter the form with the opposite sign to time —
    the spacelike block, by Born positivity (`gFormC_nonneg`) + the order of `Cut`. -/
theorem QvC_space_nonpos (x : Cut) (v : O Cut) : QvC ((0 : Cut), x, v) ≤ 0 := by
  show QformC 0 x v ≤ 0
  unfold QformC
  have hnn := gFormC_nonneg v
  nlinarith [sq_nonneg x, hnn]

/-- ★★ THE SPACE BLOCK IS NEGATIVE-DEFINITE: a NONZERO space vector `(0,x,v)` (`¬(x = 0 ∧ v = 0)`)
    has `QvC (0,x,v) < 0`. Together with `QvC_time_pos` this is the (1,9) SIGNATURE SPLIT of the
    continuum Minkowski form — one positive (timelike) direction, nine negative (spacelike)
    directions — DERIVED from Born positivity over the derived ℝ. The structural fact the polar
    "boost part" (the positive-definite factor) rests on. -/
theorem QvC_space_neg_of_ne {x : Cut} {v : O Cut} (h : ¬(x = 0 ∧ v = 0)) :
    QvC ((0 : Cut), x, v) < 0 := by
  show QformC 0 x v < 0
  unfold QformC
  rcases eq_or_ne x 0 with hx | hx
  · -- x = 0, so v ≠ 0; the space block is −gFormC v v < 0
    have hv : v ≠ 0 := by
      intro hv0; exact h ⟨hx, hv0⟩
    have hpos := gFormC_pos_of_ne_zero hv
    rw [hx]; nlinarith [hpos]
  · -- x ≠ 0, so x² > 0; the space block is ≤ −x² < 0
    have hx2 : 0 < x ^ 2 := by positivity
    have hnn := gFormC_nonneg v
    nlinarith [hx2, hnn]

/-- NON-VACUITY (W8): a concrete nonzero space unit `(0,0,e₂)` is spacelike, `QvC (0,0,e₂) = −1 <
    0`. The signature split is realized on the cascade's terminal imaginary unit. -/
theorem QvC_space_e2_neg : QvC ((0 : Cut), (0 : Cut), (CD.e2 : O Cut)) < 0 := by
  apply QvC_space_neg_of_ne
  rintro ⟨-, he2⟩
  -- e₂ = 0 contradicts gFormC e₂ e₂ = 1
  have h1 : gFormC (CD.e2 : O Cut) (CD.e2 : O Cut) = 1 := e2_gFormC_self
  rw [he2] at h1
  rw [show gFormC (0 : O Cut) (0 : O Cut) = 0 by
        show reQC (0 * star 0) = 0; rw [zero_mul]; rfl] at h1
  exact zero_ne_one h1

end

end Phys.Algebra
