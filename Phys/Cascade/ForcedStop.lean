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

  THE BACKWARD HALF — PROGRESS BANKED, MIDDLE CHILDED (honestly partial, NOT bridged
  — docs/STANDARD.md §4). The FULL forced impossibility — "`Nrm` multiplicative on
  `CD A` ⟹ `A` associative", for EVERY base, upgrading the loss past `𝕆` from the
  witnessed pair to a forced law — is genuinely Hurwitz-depth. The honest route is
  ALTERNATIVITY, and it factors into three thirds. The FIRST and LAST thirds are PROVED
  HERE, forward from `CD`/`star`, no Mathlib Hurwitz import:
    • PART A (polarization): the Born self-overlap bilinear form `bilin`, the
      polarization `Nrm (x+y) = Nrm x + Nrm y + bilin x y`, and the two composition
      identities `P1`, `P2` that multiplicativity FORCES on `bilin`.
    • PART B (reflection): `iota` is a ring homomorphism, so `CD A` associates on a
      base-image triple IFF the base associates on it (`iota_assoc_iff`,
      `base_assoc_of_image_assoc`).
  The MIDDLE third — multiplicativity ⟹ `CD A` alternative ⟹ `CD A` associates on the
  new-generator (`e₂`) triples, via the nondegeneracy of `bilin` — remains OPEN: over
  a BARE `*`-ring the alternative laws need the full polarized composition machinery
  (the single-explicit-witness route is numerically refuted, workbench/N2d-forced-stop:
  the cascade's bases are themselves composition algebras, so every fixed witness
  vanishes on them, and the obstruction is irreducibly 3-element). It is the dedicated
  next node (a theory-native dissolution ticket: build the alternative laws on `CD A`
  from `P1`/`P2` and close `CD A`-alternative ⟹ base-associative via Part B), linked
  onto the chain tail. Nothing here is asserted: Parts A and B are PROVED, the easy
  direction and the generic loss are PROVED; the generic backward iff is honestly a
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

set_option maxHeartbeats 2000000 in
/-- ★ THE EASY DIRECTION, GENERALIZED ONE RUNG FURTHER — the composition law SURVIVES
    the step whose base is associative but NON-commutative. When the base is itself a
    DOUBLE `CD B` of a commutative `*`-ring `B`, the self-overlap norm is MULTIPLICATIVE
    on `CD (CD B)`: `Nrm (x · y) = Nrm x · Nrm y`. The base `CD B` is associative
    (`instance Ring (CD B)`, banked, since `B` is a `CommRing`) but in general NOT
    commutative — so this is strictly stronger than `Nrm_mul_of_comm`, which required a
    commutative base and therefore only covered the `CD ℝ`, `CD ℂ` rungs. This is the
    rung `CD ℂ → CD (CD ℂ)` (the quaternion → octonion step): the composition law is
    PRESERVED while the base stays associative, here for an associative non-commutative
    base derived by one doubling.

    WHY a doubled base and not an abstract "associative + central self-overlap" base
    (THE ONE LAW / docs/RUNBOOK.md W5 + W8): the abstract hypothesis is genuinely NOT
    sufficient — over a free quadratic `*`-algebra whose trace `a + star a` and self-
    overlap `a · star a` are both central, the norm defect does NOT vanish
    (workbench/N2d-forced-stop/quadratic_forward.py: 12 surviving terms). Multiplicativity
    needs the base to carry the FULL composition structure, which along the cascade is
    exactly "the base is a double `CD B`." We therefore derive the law over the structure
    the doubling actually produces, never over a posited abstract hypothesis. -/
theorem Nrm_mul_of_doubled_base {B : Type*} [CommRing B] [StarRing B]
    (x y : CD (CD B)) : Nrm (x * y) = Nrm x * Nrm y := by
  rw [Nrm_def, Nrm_def, Nrm_def]
  ext <;>
    simp only [mul_re, mul_im, star_re, star_im, add_re, add_im,
      neg_re, neg_im, star_add, star_neg, star_mul', star_star, neg_mul,
      mul_neg, neg_neg, add_mul, mul_add] <;>
    ring

/-! ## THE BACKWARD HALF, PART A — the polarized self-overlap (Born) bilinear form.

    The backward direction of the forced iff — `A` non-associative ⟹ the self-overlap
    norm is NOT multiplicative on `CD A` — is the genuine Hurwitz obstruction (the
    single-explicit-witness route is numerically refuted: the cascade's bases are
    themselves composition algebras, so every fixed witness vanishes on them, and the
    norm-defect is irreducibly 3-element; workbench/N2d-forced-stop). The honest route
    is alternativity, attacked through the POLARIZATION of the self-overlap norm.

    This block banks the genuinely forced first third of that route: the polarized Born
    bilinear form `bilin x y = (x · star y + y · star x).re`, its diagonal/symmetry/
    biadditivity, the polarization `Nrm (x+y) = Nrm x + Nrm y + bilin x y`, and the two
    COMPOSITION IDENTITIES `P1`, `P2` that the multiplicativity of `Nrm` forces on the
    bilinear form. All derived FORWARD from the banked `CD` product + `star`, over a
    GENERAL associative `*`-base `[Ring A] [StarRing A]` (no commutativity) — never
    imported from Mathlib's composition-algebra / Hurwitz API. The remaining middle of
    the chain (multiplicativity ⟹ `CD A` alternative ⟹ associativity on the new-
    generator triples) is the dedicated next node. -/

/-- distributivity of the `CD` product on the right (forward, general associative base). -/
theorem add_mul' [Ring A] [StarRing A] (x y z : CD A) :
    (x + y) * z = x * z + y * z := by
  ext <;> simp [mul_re, mul_im, add_mul, mul_add] <;> abel

/-- distributivity of the `CD` product on the left (forward, general associative base). -/
theorem mul_add' [Ring A] [StarRing A] (x y z : CD A) :
    x * (y + z) = x * y + x * z := by
  ext <;> simp [mul_re, mul_im, mul_add, add_mul, star_add] <;> abel

/-- THE POLARIZED SELF-OVERLAP (Born) BILINEAR FORM: `bilin x y = (x · star y + y ·
    star x).re`. The symmetric form whose diagonal is `2 · Nrm` — the trunk's self-
    overlap positivity, polarized so the composition law becomes bilinear. -/
def bilin [Mul A] [Add A] [Neg A] [Star A] (x y : CD A) : A :=
  (x * star y + y * star x).re

/-- The diagonal of the bilinear form is twice the norm: `bilin x x = Nrm x + Nrm x`. -/
theorem bilin_diag [Ring A] [StarRing A] (x : CD A) : bilin x x = Nrm x + Nrm x := by
  simp [bilin, Nrm, mul_re, add_re]

/-- The bilinear form is symmetric. -/
theorem bilin_symm [Ring A] [StarRing A] (x y : CD A) : bilin x y = bilin y x := by
  simp [bilin, add_comm]

/-- The bilinear form is additive in the left slot. -/
theorem bilin_add_left [Ring A] [StarRing A] (x x' y : CD A) :
    bilin (x + x') y = bilin x y + bilin x' y := by
  simp only [bilin, add_re, mul_re, add_mul, mul_add, star_re, star_im,
    star_add, star_neg, add_im, neg_add]
  abel

/-- The bilinear form is additive in the right slot. -/
theorem bilin_add_right [Ring A] [StarRing A] (x y y' : CD A) :
    bilin x (y + y') = bilin x y + bilin x y' := by
  simp only [bilin, add_re, mul_re, add_mul, mul_add, star_re, star_im,
    star_add, add_im, neg_add]
  abel

/-- ★ POLARIZATION OF THE NORM: `Nrm (x + y) = Nrm x + Nrm y + bilin x y`. The
    self-overlap norm's deviation from additivity is exactly the bilinear form — the
    identity that turns the (quadratic) composition law into the (bilinear) identities
    `P1`, `P2`. -/
theorem Nrm_add [Ring A] [StarRing A] (x y : CD A) :
    Nrm (x + y) = Nrm x + Nrm y + bilin x y := by
  simp only [Nrm, bilin, add_re, mul_re, star_re, star_im, add_im,
    star_add, star_neg, neg_add, mul_add, add_mul, neg_mul, neg_neg]
  abel

/-- ★ P1 — THE RIGHT COMPOSITION IDENTITY. If the self-overlap norm is MULTIPLICATIVE
    on `CD A`, then the polarized form scales on the right by the norm:
    `bilin (x · z) (y · z) = bilin x y · Nrm z`. Proved by polarizing the
    multiplicativity of `Nrm` on `(x + y) · z` via right distributivity. The
    hypothesis `H` is genuinely used (a `P1` claimed without it is false — costume
    C13). The first composition identity of the Hurwitz alternativity argument. -/
theorem P1 [Ring A] [StarRing A]
    (H : ∀ u v : CD A, Nrm (u * v) = Nrm u * Nrm v) (x y z : CD A) :
    bilin (x * z) (y * z) = bilin x y * Nrm z := by
  have h1 : Nrm ((x + y) * z) = Nrm (x * z) + Nrm (y * z) + bilin (x * z) (y * z) := by
    rw [add_mul']; exact Nrm_add (x * z) (y * z)
  have h2 : Nrm ((x + y) * z) = Nrm x * Nrm z + Nrm y * Nrm z + bilin x y * Nrm z := by
    rw [H, Nrm_add, add_mul, add_mul]
  rw [h2] at h1
  rw [H, H] at h1
  exact (add_left_cancel h1).symm

/-- ★ P2 — THE LEFT COMPOSITION IDENTITY. If the self-overlap norm is MULTIPLICATIVE
    on `CD A`, then the polarized form scales on the left by the norm:
    `bilin (z · x) (z · y) = Nrm z · bilin x y`. Proved by polarizing the
    multiplicativity of `Nrm` on `z · (x + y)` via left distributivity. The second
    composition identity of the Hurwitz alternativity argument. -/
theorem P2 [Ring A] [StarRing A]
    (H : ∀ u v : CD A, Nrm (u * v) = Nrm u * Nrm v) (x y z : CD A) :
    bilin (z * x) (z * y) = Nrm z * bilin x y := by
  have h1 : Nrm (z * (x + y)) = Nrm (z * x) + Nrm (z * y) + bilin (z * x) (z * y) := by
    rw [mul_add']; exact Nrm_add (z * x) (z * y)
  have h2 : Nrm (z * (x + y)) = Nrm z * Nrm x + Nrm z * Nrm y + Nrm z * bilin x y := by
    rw [H, Nrm_add, mul_add, mul_add]
  rw [h2] at h1
  rw [H, H] at h1
  exact (add_left_cancel h1).symm

/-! ## THE BACKWARD HALF, PART B — associativity of the double pins base associativity.

    The last third of the alternativity route: once multiplicativity has forced `CD A`
    to associate on the relevant triples, that associativity must be pushed BACK DOWN to
    the base. The base embedding `iota` is a ring homomorphism, so the double associates
    on a base-image triple `(iota a, iota b, iota c)` IFF the base associates on
    `(a, b, c)`. Hence `CD A` associative (on base images) ⟹ `A` associative — the
    structural reflection that converts the alternativity conclusion into base
    associativity, ready to feed the banked `iota_iota_e2_assoc_iff` one rung down. -/

/-- ★ THE BASE EMBEDDING IS A RING HOMOMORPHISM: `iota (a * b) = iota a * iota b`.
    Products of base-image elements stay in the base image (the new dimension stays
    empty), so `iota` carries the base product. -/
theorem iota_mul [Ring A] [StarRing A] (a b : A) :
    (iota (a * b) : CD A) = iota a * iota b := by
  ext
  · simp [iota, mul_re]
  · simp [iota, mul_im]

/-- ★ THE DOUBLE ASSOCIATES ON A BASE-IMAGE TRIPLE IFF THE BASE ASSOCIATES ON IT:
    `(iota a · iota b) · iota c = iota a · (iota b · iota c) ↔ (a * b) * c = a * (b * c)`,
    over any `[Ring A] [StarRing A]` (NO commutativity). Because `iota` is an injective
    ring homomorphism, associativity of `CD A` on base images is EXACTLY associativity
    of the base. -/
theorem iota_assoc_iff [Ring A] [StarRing A] (a b c : A) :
    (iota a * iota b) * iota c = iota a * (iota b * iota c)
      ↔ (a * b) * c = a * (b * c) := by
  rw [← iota_mul, ← iota_mul, ← iota_mul, ← iota_mul]
  constructor
  · intro h; exact iota_injective h
  · intro h; rw [h]

/-- ★ BASE-IMAGE ASSOCIATIVITY REFLECTS TO BASE ASSOCIATIVITY. If the double `CD A`
    associates on every base-image triple, then the base `A` is associative. The
    contrapositive — `A` non-associative ⟹ `CD A` non-associative on some base-image
    triple — is the structural reflection the backward direction pushes the alternativity
    conclusion through. -/
theorem base_assoc_of_image_assoc [Ring A] [StarRing A]
    (h : ∀ a b c : A, (iota a * iota b) * iota c = iota a * (iota b * iota c)) :
    ∀ a b c : A, (a * b) * c = a * (b * c) :=
  fun a b c => (iota_assoc_iff a b c).mp (h a b c)

/-! ## THE BACKWARD HALF, PART C — the scaling-law reflection (alternativity ⟹ base
    associative). PART B reflected the associativity of `CD A` on BASE-IMAGE triples
    `(iota a, iota b, iota c)` to base associativity. But the content multiplicativity
    forces is the alternative/scaling law, which mixes the NEW generator (`e₂`) — exactly
    the part `iota`-images cannot see. This block reflects the LEFT SCALING LAW
    `x · (star x · y) = iota (Nrm x) · y` (the composition law in its scaling form, the
    polarized shadow of the alternative laws) DOWN to base associativity, reaching the
    `e₂`-mixing content Part B could not.

    CRUCIAL — non-vacuity (docs/RUNBOOK.md W8, docs/STANDARD.md §1). This block is stated
    over a base carrying NO assumed associativity (`[NonAssocRing A]`: distributivity +
    `1`, but NOT `mul_assoc`), so the conclusion `∀ a b c : A, (a*b)*c = a*(b*c)` is REAL
    content, never a tautology. The single structural identity `scal_im_assoc` exposes the
    base associator `[a,b,c]` as the new-dimension component of the scaling defect; `iota`
    injectivity then forces it to vanish. Foundations-only, forward from `CD`/`star`. -/

section Reflection
variable [NonAssocRing A] [StarRing A]

/-- ★ THE STRUCTURAL IM-IDENTITY behind the reflection. The new-dimension (`im`) component
    of the left-scaling expression `⟨a,b⟩ · (star ⟨a,b⟩ · iota c)` equals the
    `iota`-scaling value PLUS the *-associator term `b · (star c · a) − (b · star c) · a`.
    Over a NON-associative base this last term need not vanish; on a base that DOES
    associate it is `0` and the scaling law holds. The defect of the scaling law in the
    new dimension IS a base associator. -/
theorem scal_im_assoc (a b c : A) :
    ((⟨a, b⟩ : CD A) * (star (⟨a, b⟩ : CD A) * iota c)).im
      = (iota (Nrm (⟨a, b⟩ : CD A)) * iota c).im
        + (b * (star c * a) - (b * star c) * a) := by
  simp only [Nrm, iota, mul_re, mul_im, star_re, star_im, star_mul, star_star,
    star_neg, star_zero, zero_mul, add_zero, zero_add, neg_zero,
    mul_neg, neg_mul, neg_neg]
  abel

/-- ★ THE SCALING-LAW REFLECTION (alternativity ⟹ base associative). If the LEFT SCALING
    LAW `x · (star x · y) = iota (Nrm x) · y` holds for ALL `x, y : CD A`, then the base
    `A` is ASSOCIATIVE. This is the alternativity analogue of Part B's `iota_assoc_iff`:
    where Part B reflected base-image associativity, this reflects the `e₂`-mixing scaling
    law (which multiplicativity forces, via the polarization `P1`/`P2`) down to base
    associativity. Proved by evaluating the scaling law at `x = ⟨c, a⟩`, `y = iota (star b)`
    and reading the new-dimension component through `scal_im_assoc`: the base associator
    `(a*b)*c − a*(b*c)` is forced to `0`. Non-vacuous: the base is only a `NonAssocRing`. -/
theorem assoc_of_scaling
    (Scal : ∀ x y : CD A, x * (star x * y) = iota (Nrm x) * y) :
    ∀ a b c : A, (a * b) * c = a * (b * c) := by
  intro a b c
  have h := congrArg CD.im (Scal (⟨c, a⟩ : CD A) (iota (star b)))
  rw [scal_im_assoc, star_star] at h
  have h2 : a * (b * c) - (a * b) * c = 0 := by
    have h4 : ((iota (Nrm (⟨c, a⟩ : CD A)) * iota (star b)).im)
          + (a * (b * c) - (a * b) * c)
        = ((iota (Nrm (⟨c, a⟩ : CD A)) * iota (star b)).im) + 0 := by
      rw [add_zero]; exact h
    exact add_left_cancel h4
  exact (sub_eq_zero.mp h2).symm

end Reflection

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

/-! ## THE FORWARD LAW AT THE LAST ASSOCIATIVE RUNG, AND THE STOP'S BOUNDARY. -/

/-- ★ THE COMPOSITION LAW HOLDS AT THE LAST ASSOCIATIVE RUNG `𝕆 = CD (CD (CD ℚ))`.
    Instantiating `Nrm_mul_of_doubled_base` at `B := Dbl ℚ` (a commutative `*`-ring)
    gives the self-overlap norm multiplicative on `O ℚ = CD (H ℚ) = CD (CD (Dbl ℚ))`:
    `Nrm (x · y) = Nrm x · Nrm y`. NON-VACUOUS: the base `H ℚ = CD (Dbl ℚ)` is a
    genuinely associative, NON-commutative ring (`not_commutative`), so this is the
    quaternion → octonion step, not a commutative rung — the composition law is proved
    to SURVIVE through the last associative base. -/
theorem Nrm_mul_on_O (x y : O ℚ) : CD.Nrm (x * y) = CD.Nrm x * CD.Nrm y :=
  CD.Nrm_mul_of_doubled_base x y

/-- ★ THE FORCED-STOP BOUNDARY — the composition law holds at the last associative
    rung and dies at the very next. The self-overlap norm is MULTIPLICATIVE on the
    octonion rung `O ℚ` (base `H ℚ` associative) — for ALL `x, y`, the forward law
    `Nrm_mul_on_O` — yet it FAILS on the sedenion rung `S ℚ = CD (O ℚ)` (base `O ℚ`
    non-associative) at the witnesses `zdX, zdY` (`genNrm_not_mul_at_S`). The two
    sandwiched together pin the loss to the EXACT rung where the base stops being
    associative: the law is preserved while the base is associative and is lost at the
    first non-associative base. This is the forward half of the forced iff
    (`Nrm` multiplicative on `CD A` ⟸ `A` associative, here for the cascade's bases),
    made concrete at the boundary; the generic backward half — `A` non-associative ⟹
    the law cannot hold for EVERY base, via the alternativity/polarization route — is
    the dedicated next node (the single-associator-witness route is numerically refuted,
    workbench/N2d-forced-stop). -/
theorem forced_stop_boundary :
    (∀ x y : O ℚ, CD.Nrm (x * y) = CD.Nrm x * CD.Nrm y) ∧
    CD.Nrm (zdX * zdY) ≠ CD.Nrm zdX * CD.Nrm zdY :=
  ⟨Nrm_mul_on_O, genNrm_not_mul_at_S⟩

end Phys.Cascade
