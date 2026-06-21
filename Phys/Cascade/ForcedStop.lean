/-
  Phys.Cascade.ForcedStop — N2d: the GENERIC self-overlap norm on the cascade's
  doubling, the EASY direction of the composition law, and the generic loss at the stop.
  ===========================================================================
  THE CROWN'S CLOSURE, PART 1. N2c proved the cascade STOPS at `S = CD (O ℚ)`
  CONCRETELY: explicit witnesses `zdX, zdY` break division and the Born self-overlap
  composition law (`Phys/Cascade/Sedenion.lean`). N2c read its scalar norm off
  `z · star z` at the bottom of the tower. This module DEEPENS that stop toward the
  forced impossibility by working with the norm GENERICALLY on the one banked
  doubling `CD A` (Phys/Cascade/Double.lean) — derived forward from the `CD` product
  and `star`, never imported from Mathlib's composition-algebra / Hurwitz API (which
  would POSIT the very link we derive; drift trap, docs/RUNBOOK.md W1).

  WHAT IS PROVED HERE (each foundations-only, derived forward from `CD`/`star`):

    Nrm                  — THE GENERIC SELF-OVERLAP NORM. The base component of
                           `z · star z` on `CD A`. The trunk's Born = self-overlap
                           positivity, written once and for all on the doubling.
    Nrm_def              — `Nrm z = z.re · star z.re + star z.im · z.im` (read off
                           the banked product).
    selfMul              — ★ THE BORN SELF-OVERLAP IS "REAL". Generically (any
                           involutive `*`-base) the NEW-dimension component of
                           `z · star z` vanishes: `z · star z = ι (Nrm z)`. The
                           self-overlap lands in the base — positivity made
                           structural, with ZERO algebraic hypotheses beyond a ring
                           with star.
    Nrm_one / Nrm_iota   — the norm fixes the unit (`Nrm 1 = 1`) and restricts to the
                           base self-overlap on the embedded base (`Nrm (ι a) =
                           a · star a`).
    Nrm_mul_of_comm      — ★ THE EASY DIRECTION (the composition law HOLDS while the
                           base is COMMUTATIVE associative). On a commutative `*`-base
                           the self-overlap norm is MULTIPLICATIVE on `CD A`:
                           `Nrm (x y) = Nrm x · Nrm y`. This is the law that the
                           cascade PRESERVES through the complex (`CD ℝ`) and
                           quaternion (`CD ℂ`) rungs — a GENERIC theorem, not a
                           per-rung computation.
    N_eq_proj            — the generic `Nrm` PROJECTS to N2c's concrete scalar `N` on
                           `S ℚ` (`N z = (Nrm z).re.re.re`): the generic form and the
                           concrete witnessed form are the same object.
    genNrm_not_mul_at_S  — ★ THE GENERIC NORM DIES AT THE STOP. Through the generic
                           `Nrm`, the composition law FAILS at `S = CD (O ℚ)`:
                           `Nrm (zdX · zdY) ≠ Nrm zdX · Nrm zdY` (left side `0`,
                           right side projects to `4`). The concrete N2c stop is the
                           generic norm's failure — not an artifact of the scalar
                           projection.

  THE REMAINING LINK (honestly deferred, NOT bridged — docs/STANDARD.md §4). The
  FULL forced impossibility — "`Nrm` multiplicative on `CD A` ⟹ `A` associative",
  for EVERY base, upgrading the loss past `𝕆` from the witnessed pair to a forced
  law — is genuinely Hurwitz-depth: over a BARE `*`-ring the norm defect carries
  central-self-overlap (commutator) corrections that vanish only on a composition
  algebra (numerically verified, workbench/N2d-forced-stop). It is the dedicated
  next node (a theory-native dissolution ticket building the conjugation / Born-
  scalar structure on `CD`), linked onto the chain tail. Nothing here is asserted:
  the easy direction and the generic loss are PROVED; the generic iff is honestly a
  next node, never a marker in the source.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Born / self-overlap /
  composition / octonion / sedenion": what remains is the theorem that the base
  component of `z · star z` is a multiplicative form on the Cayley–Dickson double of
  a commutative `*`-ring, that it equals `ι` of itself, and that it FAILS to be
  multiplicative on the double of the derived non-associative algebra. No theorem
  STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Cascade.Sedenion
import Mathlib.Tactic

namespace Phys.Cascade

namespace CD

variable {A : Type*}

/-- THE GENERIC SELF-OVERLAP NORM on the cascade's doubling: the base component of
    `z · star z`. The trunk's Born = self-overlap positivity, written once on `CD A`
    and derived forward from the banked `CD` product + `star`. -/
def Nrm [Mul A] [Add A] [Neg A] [Star A] (z : CD A) : A := (z * star z).re

/-- The norm read off the banked product: `Nrm z = z.re · star z.re + star z.im · z.im`. -/
theorem Nrm_def [Ring A] [StarRing A] (z : CD A) :
    Nrm z = z.re * star z.re + star z.im * z.im := by
  simp [Nrm, mul_re, star_re, star_im, star_neg, neg_mul]

/-- ★ THE BORN SELF-OVERLAP IS "REAL". Generically — for ANY involutive `*`-base —
    the new-dimension component of `z · star z` vanishes, so `z · star z = ι (Nrm z)`.
    The self-overlap lands in the base: the trunk's positivity made structural, with
    no algebraic hypothesis beyond a ring carrying `star`. -/
theorem selfMul [Ring A] [StarRing A] (z : CD A) :
    z * star z = iota (Nrm z) := by
  ext
  · simp [iota, Nrm, mul_re, star_re, star_im, star_neg, neg_mul]
  · simp [iota, mul_im, star_re, star_im, neg_mul]

/-- The norm fixes the unit: `Nrm 1 = 1`. -/
theorem Nrm_one [Ring A] [StarRing A] : Nrm (1 : CD A) = 1 := by
  simp [Nrm_def]

/-- On the embedded base, the norm is the base self-overlap: `Nrm (ι a) = a · star a`. -/
theorem Nrm_iota [Ring A] [StarRing A] (a : A) :
    Nrm (iota a : CD A) = a * star a := by
  simp [Nrm_def, iota]

/-- ★ THE EASY DIRECTION — the composition law HOLDS on a COMMUTATIVE base. When the
    base `A` is a commutative `*`-ring, the self-overlap norm is MULTIPLICATIVE on the
    double: `Nrm (x · y) = Nrm x · Nrm y`. This is the law the cascade PRESERVES
    through the complex rung (`CD ℝ`) and the quaternion rung (`CD ℂ`) — a generic
    theorem, not a per-rung computation. (The loss appears only when the base stops
    being associative, two rungs further; that forced loss is the dedicated next
    node.) -/
theorem Nrm_mul_of_comm [CommRing A] [StarRing A] (x y : CD A) :
    Nrm (x * y) = Nrm x * Nrm y := by
  simp only [Nrm_def, mul_re, mul_im, star_neg,
    star_mul, star_star, star_add]
  ring

end CD

/-! ## SPECIALIZATION + the generic norm's loss at the proved stop. -/

/-- The generic norm PROJECTS to N2c's concrete scalar `N` on `S ℚ`: the base scalar
    of `z · z*` is the fully-projected real part of the generic self-overlap. The
    generic form and the concrete witnessed form are the SAME object. -/
theorem N_eq_proj (z : S ℚ) : N z = (CD.Nrm z).re.re.re := by
  simp [N, CD.Nrm]

/-- `Nrm (zdX · zdY) = 0`: the generic self-overlap of the vanished product is the
    void's self-overlap. -/
theorem Nrm_zd_prod : CD.Nrm (zdX * zdY) = (0 : O ℚ) := by
  rw [zero_divisor_prod]
  show ((0 : S ℚ) * star 0).re = 0
  ext <;> simp [CD.mul_re, CD.mul_im, CD.star_re, CD.star_im]

set_option maxHeartbeats 1000000 in
/-- The scalar projection of `Nrm zdX · Nrm zdY` is `4`: the right-hand side of the
    composition law is non-degenerate (`2 · 2`). -/
theorem Nrm_prod_proj : (CD.Nrm zdX * CD.Nrm zdY).re.re.re = (4 : ℚ) := by
  simp only [CD.Nrm]
  simp [zdX, zdY, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im']
  norm_num

/-- ★ THE GENERIC NORM DIES AT THE STOP. Through the generic self-overlap norm `Nrm`,
    the composition law FAILS at the terminal algebra `S = CD (O ℚ)`:
    `Nrm (zdX · zdY) ≠ Nrm zdX · Nrm zdY` (the left side is `0`, the right side
    projects to `4`). The concrete N2c stop (`born_law_fails`) is exactly the generic
    norm's failure — not an artifact of the scalar projection, and the SAME loss the
    cascade's required self-overlap property suffers past `𝕆`. -/
theorem genNrm_not_mul_at_S :
    CD.Nrm (zdX * zdY) ≠ CD.Nrm zdX * CD.Nrm zdY := by
  intro h
  have hp := congrArg (fun w : O ℚ => w.re.re.re) h
  simp only [Nrm_zd_prod, Nrm_prod_proj] at hp
  norm_num at hp

end Phys.Cascade
