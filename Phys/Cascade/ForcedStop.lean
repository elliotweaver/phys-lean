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

/-! ## THE POLARIZATION CORE — the forward Hurwitz implication, closing the forced iff.

    Parts A, B, C banked the polarization, the base-image reflection, and the scaling-law
    reflection. This block closes the SINGLE remaining gap: the FORWARD implication
    `H : Nrm multiplicative on CD A ⟹ the LEFT SCALING LAW x · (star x · y) = ι (Nrm x) · y`,
    which (via the banked `assoc_of_scaling`) forces base associativity — assembling the full
    forced equivalence `Nrm multiplicative on CD A ⟺ A associative`.

    THE HOME (docs/RUNBOOK.md W5, THE ONE LAW). The literal abstract equivalence over a bare
    `[Ring A]` base is FALSE: a base with a DEGENERATE self-overlap form (e.g. upper-triangular
    `2×2`, whose nilpotent radical `n` has `n · star n = 0`) is non-associative on `CD A` yet
    keeps `Nrm` multiplicative on `CD (CD A)`. The equivalence requires the trunk's ANISOTROPY
    (Born = self-overlap = positivity) and the adjoint identity requires the trunk's CENTRALITY
    (the trace `a + star a` and self-overlap `a · star a` central). BOTH hold on the structure
    the doubling actually produces — a base `A = CD (CD B)` (a double of a double) — and NEITHER
    is posited abstractly: centrality is read off the doubled structure (the adjoint is an
    `ext`+`ring` identity there), and anisotropy is the trunk's positivity, discharged on the
    cascade's actual base by reduction to a sum of squares over the ordered ground ring.

    The chain (`bilin_L_zero`): for `L = x·(x̄·y) − ι(Nrm x)·y`,
      `bilin L w = [adjoint] bilin(x̄·y, x̄·w) − bilin(ι(Nrm x)·y, w)`
                 `= [P2] Nrm(x̄)·bilin(y,w) − [ι-scaling] Nrm x·bilin(y,w)`
                 `= [Nrm star-inv] 0`.
    Then `bilin L L = Nrm L + Nrm L = 0`, and anisotropy collapses the A-valued nondegeneracy to
    a single scalar positivity at `w = L`, giving `L = 0` — the scaling law. -/

/-- The doubling carries a `NonAssocRing` structure over a `NonAssocRing` base — the cascade's
    actual base structure one rung past associativity. Chaining this gives the algebra structure
    at every shape `CD (CD (CD B))` the core works over. -/
@[reducible] def narCD {A : Type*} [NonAssocRing A] [StarRing A] : NonAssocRing (CD A) where
  add := (· + ·)
  add_assoc a b c := by ext <;> simp <;> abel
  zero := 0
  zero_add a := by ext <;> simp
  add_zero a := by ext <;> simp
  add_comm a b := by ext <;> simp <;> abel
  neg := (- ·)
  neg_add_cancel a := by ext <;> simp
  nsmul := nsmulRec
  zsmul := zsmulRec
  mul := (· * ·)
  left_distrib a b c := by ext <;> simp [mul_add, add_mul] <;> abel
  right_distrib a b c := by ext <;> simp [mul_add, add_mul] <;> abel
  zero_mul a := by ext <;> simp
  mul_zero a := by ext <;> simp
  one := 1
  one_mul a := by ext <;> simp
  mul_one a := by ext <;> simp

/-- The conjugation propagates over the `NonAssocRing` doubling: the double is itself a
    `*`-ring, so the cascade can iterate at the non-associative level. -/
@[reducible] def srCD {A : Type*} [NonAssocRing A] [StarRing A] :
    letI := narCD (A := A); StarRing (CD A) :=
  letI := narCD (A := A)
  { star := Star.star
    star_involutive := by intro z; ext <;> simp
    star_mul := by intro z w; ext <;> simp [star_add, star_star]
    star_add := by intro z w; ext <;> simp [add_comm] }

/-! Part-A machinery ported to a `NonAssocRing` base (the banked `Nrm_add`, `bilin`
    biadditivity and `P2` are over `[Ring A]`; the core lives one rung past associativity,
    so it needs these forward-derived over `[NonAssocRing A]`). -/
section NonAssocPartA
variable {A : Type*} [NonAssocRing A] [StarRing A]

/-- Left distributivity of the `CD` product (forward, non-associative base). -/
theorem mul_add_na (x y z : CD A) : x * (y + z) = x * y + x * z := by
  ext <;> simp [mul_re, mul_im, mul_add, add_mul, star_add] <;> abel

/-- Polarization of the norm (non-associative base): `Nrm (x+y) = Nrm x + Nrm y + bilin x y`. -/
theorem Nrm_add_na (x y : CD A) : Nrm (x + y) = Nrm x + Nrm y + bilin x y := by
  simp only [Nrm, bilin, add_re, mul_re, star_re, star_im, add_im,
    star_add, star_neg, neg_add, mul_add, add_mul, neg_mul, neg_neg]; abel

/-- Left-additivity of the bilinear form (non-associative base). -/
theorem bilin_add_left_na (x x' y : CD A) :
    bilin (x + x') y = bilin x y + bilin x' y := by
  simp only [bilin, add_re, mul_re, add_mul, mul_add, star_re, star_im,
    star_add, star_neg, add_im, neg_add]; abel

/-- The bilinear form vanishes on the left zero (non-associative base). -/
theorem bilin_zero_left_na (y : CD A) : bilin (0 : CD A) y = 0 := by
  simp only [bilin, mul_re, zero_re, zero_im, star_re, star_im, star_zero,
    zero_mul, mul_zero, add_zero, zero_add, neg_zero, add_re]

/-- Left-negation of the bilinear form (non-associative base), from additivity + the zero
    value (avoids the `zsmul`-normalization that breaks a direct `simp` over a `NonAssocRing`). -/
theorem bilin_neg_left_na (x y : CD A) : bilin (-x) y = - bilin x y := by
  have hcancel : (-x) + x = 0 := by ext <;> simp
  have h := bilin_add_left_na (-x) x y
  rw [hcancel, bilin_zero_left_na] at h
  exact eq_neg_of_add_eq_zero_left h.symm

/-- ★ `P2` over a non-associative base: multiplicativity of `Nrm` still forces the left
    composition identity `bilin (z·x) (z·y) = Nrm z · bilin x y`. The polarization argument
    uses only left distributivity and the polarization of the norm, neither of which needs
    base associativity. -/
theorem P2_na (H : ∀ u v : CD A, Nrm (u * v) = Nrm u * Nrm v) (x y z : CD A) :
    bilin (z * x) (z * y) = Nrm z * bilin x y := by
  have h1 : Nrm (z * (x + y)) = Nrm (z * x) + Nrm (z * y) + bilin (z * x) (z * y) := by
    rw [mul_add_na]; exact Nrm_add_na (z * x) (z * y)
  have h2 : Nrm (z * (x + y)) = Nrm z * Nrm x + Nrm z * Nrm y + Nrm z * bilin x y := by
    rw [H, Nrm_add_na, mul_add, mul_add]
  rw [h2] at h1; rw [H, H] at h1
  exact (add_left_cancel h1).symm

/-- The diagonal of the bilinear form is twice the norm (non-associative base). -/
theorem bilin_diag_na (x : CD A) : bilin x x = Nrm x + Nrm x := by
  simp [bilin, Nrm, mul_re, add_re]

end NonAssocPartA

end CD

namespace CDcore
open CD

/-! The polarization core, over the cascade's doubled-base home `A = CD (CD B)` (carrier
    `CD A = CD (CD (CD B))`). The local `narCD`/`srCD` instances supply the algebra structure
    at the non-associative level; the structural identities below are `ext`+`ring` facts that
    bottom out in the commutative ground ring `B`, so they encode the doubled structure's
    centrality without positing it. -/
section Core
set_option maxHeartbeats 8000000
variable {B : Type*} [CommRing B] [StarRing B]
attribute [local instance] CD.narCD CD.srCD

/-- ★ THE ADJOINT IDENTITY over the doubled-double structure: `bilin (u·v) w = bilin v (ū·w)`.
    NOT a bare-ring identity (it fails over a non-central base such as `CD (M₂ ℚ)`); it holds
    here because the structure two doublings produce has central traces and self-overlaps —
    the trunk's central positivity, read off the doubled structure as an `ext`+`ring` fact,
    never posited as an abstract hypothesis. -/
theorem adjoint3 (u v w : CD (CD (CD B))) :
    bilin (u * v) w = bilin v (star u * w) := by
  unfold bilin
  ext <;> simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
    star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg, add_mul, mul_add] <;> ring

/-- Star-invariance of the norm over the doubled-double structure: `Nrm (star z) = Nrm z`. -/
theorem Nrm_star3 (z : CD (CD (CD B))) : Nrm (star z) = Nrm z := by
  unfold Nrm
  ext <;> simp only [star_star, mul_re, mul_im, star_re, star_im, add_re, add_im,
    neg_re, neg_im, star_add, star_neg, star_mul', neg_mul, mul_neg, neg_neg] <;> ring

/-- The left `ι`-scaling of the bilinear form by the norm over the doubled-double structure:
    `bilin (ι (Nrm x) · y) w = Nrm x · bilin y w`. The specialization of the trunk's central
    positivity to `t = Nrm x` (a central, self-conjugate self-overlap). -/
theorem bilin_iotaNrm3 (x y w : CD (CD (CD B))) :
    bilin (iota (Nrm x) * y) w = Nrm x * bilin y w := by
  unfold bilin Nrm
  ext <;> simp only [iota, mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
    zero_re, zero_im, star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
    add_mul, mul_add, zero_mul, mul_zero, zero_add, add_zero, star_zero, neg_zero, sub_zero] <;> ring

/-- ★ THE POLARIZATION CORE. If the self-overlap norm is multiplicative on `CD A`, the
    left-scaling defect `L = x·(x̄·y) − ι(Nrm x)·y` is bilin-orthogonal to everything:
    `bilin L w = 0` for all `w`. This is the clean Hurwitz chain — adjoint (centrality),
    `P2` (multiplicativity), star-invariance — with no associativity of the base assumed. -/
theorem bilin_L_zero (H : ∀ u v : CD (CD (CD B)), Nrm (u * v) = Nrm u * Nrm v)
    (x y w : CD (CD (CD B))) :
    bilin (x * (star x * y) + -(iota (Nrm x) * y)) w = 0 := by
  rw [CD.bilin_add_left_na, CD.bilin_neg_left_na,
    adjoint3 x (star x * y) w, CD.P2_na H y w (star x), Nrm_star3, bilin_iotaNrm3]
  exact add_neg_cancel _

/-- ★ Hcore — MULTIPLICATIVITY FORCES THE LEFT SCALING LAW. Given the trunk's Born positivity
    (anisotropy: `Nrm z + Nrm z = 0 → z = 0`), `bilin L L = Nrm L + Nrm L = 0` forces `L = 0`.
    The A-VALUED nondegeneracy that the classical Hurwitz argument needs collapses to a single
    SCALAR positivity at `w = L` — the trunk dissolves the hard step. -/
theorem scaling_of_H
    (H : ∀ u v : CD (CD (CD B)), Nrm (u * v) = Nrm u * Nrm v)
    (aniso2 : ∀ z : CD (CD (CD B)), Nrm z + Nrm z = 0 → z = 0)
    (x y : CD (CD (CD B))) :
    x * (star x * y) = iota (Nrm x) * y := by
  have hbz : bilin (x * (star x * y) + -(iota (Nrm x) * y))
      (x * (star x * y) + -(iota (Nrm x) * y)) = 0 := bilin_L_zero H x y _
  rw [CD.bilin_diag_na] at hbz
  exact add_neg_eq_zero.mp (aniso2 _ hbz)

/-- ★ THE BACKWARD DIRECTION — multiplicativity forces base associativity. Hcore gives the
    left scaling law for all `x, y`; the banked `assoc_of_scaling` (Part C) reflects it down
    to associativity of the base `A = CD (CD B)`. -/
theorem base_assoc_of_H
    (H : ∀ u v : CD (CD (CD B)), Nrm (u * v) = Nrm u * Nrm v)
    (aniso2 : ∀ z : CD (CD (CD B)), Nrm z + Nrm z = 0 → z = 0) :
    ∀ a b c : CD (CD B), (a * b) * c = a * (b * c) :=
  CD.assoc_of_scaling (fun x y => scaling_of_H H aniso2 x y)

/-- The forward helper: associativity of the doubled base `CD (CD B)` forces commutativity of
    `CD B`. By the banked `iota_iota_e2_assoc_iff`, associativity on the `(ι a, ι b, e₂)`
    triples is exactly commutativity of the base pair. -/
theorem comm_of_base_assoc
    (hassoc : ∀ x y z : CD (CD B), (x * y) * z = x * (y * z)) :
    ∀ a b : CD B, a * b = b * a := by
  intro a b
  exact (CD.iota_iota_e2_assoc_iff a b).mp (hassoc (iota a) (iota b) (e2 : CD (CD B)))

end Core

/-- ★★ THE FORCED EQUIVALENCE (the cascade's doubled-base home). Over a base `A = CD (CD B)`
    (the structure two doublings produce — carrying the trunk's central, anisotropic
    self-overlap), the self-overlap norm is MULTIPLICATIVE on `CD A` IF AND ONLY IF `A` is
    ASSOCIATIVE, given the trunk's Born positivity (anisotropy `Nrm z + Nrm z = 0 → z = 0`).

    Forward (`⟸`): base associativity forces `CD B` commutative (`comm_of_base_assoc`), whence
    the doubled-base law `Nrm_mul_of_doubled_base` gives multiplicativity. Backward (`⟹`): the
    polarization core forces the left scaling law (`scaling_of_H`), whose reflection forces
    base associativity (`base_assoc_of_H`). This is the single forced equivalence behind the
    cascade's stop: the composition/Born law lives exactly as far as associativity does. -/
theorem Nrm_mul_iff_base_assoc {B : Type*} [CommRing B] [StarRing B]
    (aniso2 : ∀ z : CD (CD (CD B)), Nrm z + Nrm z = 0 → z = 0) :
    (∀ x y : CD (CD (CD B)), Nrm (x * y) = Nrm x * Nrm y)
      ↔ (∀ a b c : CD (CD B), (a * b) * c = a * (b * c)) := by
  constructor
  · intro H; exact base_assoc_of_H H aniso2
  · intro hassoc
    have hc : ∀ a b : CD B, a * b = b * a := comm_of_base_assoc hassoc
    letI : CommRing (CD B) :=
      { (inferInstance : Ring (CD B)) with mul_comm := hc }
    intro x y
    exact CD.Nrm_mul_of_doubled_base (B := CD B) x y

end CDcore

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

/-! ## THE FORCED EQUIVALENCE MADE CONCRETE AT THE STOP, AND `genNrm_not_mul_at_S` AS A LAW.

    The generic `CDcore.Nrm_mul_iff_base_assoc` is the forced equivalence over the cascade's
    doubled-base home, modulo the trunk's anisotropy. Here we DISCHARGE that anisotropy on the
    cascade's actual terminal carrier `S ℚ = CD (O ℚ) = CD (CD (CD (Dbl ℚ)))` — the self-overlap
    norm's scalar is a sum of sixteen squares over `ℚ`, so it is anisotropic (Born positivity,
    reduced to the ordered ground ring, never posited). Instantiating the equivalence then turns
    the previously witnessed failure `genNrm_not_mul_at_S` into a FORCED LAW: the norm CANNOT be
    multiplicative on `S ℚ`, precisely because the base `O ℚ` is non-associative. -/

set_option maxHeartbeats 4000000 in
/-- ★ ANISOTROPY ON THE TERMINAL CARRIER (the trunk's Born positivity, discharged). The
    self-overlap norm's scalar `(Nrm z).re.re.re` on `S ℚ` is the sum of the sixteen squared
    coordinates of `z`; hence `Nrm z + Nrm z = 0 → z = 0`. Reduced to a sum of squares over the
    ordered ground ring `ℚ` — positivity made structural, not assumed. -/
theorem aniso_S2 (z : S ℚ) (h : CD.Nrm z + CD.Nrm z = 0) : z = 0 := by
  have hsq : (CD.Nrm z + CD.Nrm z).re.re.re = 2 * (
      z.re.re.re.re^2 + z.re.re.re.im^2 + z.re.re.im.re^2 + z.re.re.im.im^2
      + z.re.im.re.re^2 + z.re.im.re.im^2 + z.re.im.im.re^2 + z.re.im.im.im^2
      + z.im.re.re.re^2 + z.im.re.re.im^2 + z.im.re.im.re^2 + z.im.re.im.im^2
      + z.im.im.re.re^2 + z.im.im.re.im^2 + z.im.im.im.re^2 + z.im.im.im.im^2) := by
    simp only [CD.Nrm, CD.add_re, CD.add_im, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      CD.neg_re, CD.neg_im, Dbl.add_re, Dbl.add_im, Dbl.mul_re, Dbl.mul_im,
      Dbl.star_re', Dbl.star_im', Dbl.neg_re, Dbl.neg_im]
    ring
  have h0 : (CD.Nrm z + CD.Nrm z).re.re.re = 0 := by rw [h]; rfl
  rw [hsq] at h0
  ext <;>
    simp only [CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im] <;>
    nlinarith [h0, sq_nonneg z.re.re.re.re, sq_nonneg z.re.re.re.im, sq_nonneg z.re.re.im.re,
      sq_nonneg z.re.re.im.im, sq_nonneg z.re.im.re.re, sq_nonneg z.re.im.re.im,
      sq_nonneg z.re.im.im.re, sq_nonneg z.re.im.im.im, sq_nonneg z.im.re.re.re,
      sq_nonneg z.im.re.re.im, sq_nonneg z.im.re.im.re, sq_nonneg z.im.re.im.im,
      sq_nonneg z.im.im.re.re, sq_nonneg z.im.im.re.im, sq_nonneg z.im.im.im.re,
      sq_nonneg z.im.im.im.im]

/-- ★★ THE FORCED EQUIVALENCE AT THE STOP. On the terminal carrier `S ℚ = CD (O ℚ)`, the
    self-overlap norm is MULTIPLICATIVE IF AND ONLY IF the base `O ℚ` is ASSOCIATIVE. The
    generic `CDcore.Nrm_mul_iff_base_assoc` instantiated at `B := Dbl ℚ` (so the base is
    `O ℚ = CD (CD (Dbl ℚ))`), with anisotropy discharged by `aniso_S2`. -/
theorem Nrm_mul_iff_O_assoc :
    (∀ x y : S ℚ, CD.Nrm (x * y) = CD.Nrm x * CD.Nrm y)
      ↔ (∀ a b c : O ℚ, (a * b) * c = a * (b * c)) :=
  CDcore.Nrm_mul_iff_base_assoc (B := Dbl ℚ) aniso_S2

/-- ★ `genNrm_not_mul_at_S` AS A FORCED LAW. The self-overlap norm is NOT multiplicative on the
    terminal carrier `S ℚ` — and this is now FORCED, not merely witnessed: if it were, the
    forced equivalence would make the base `O ℚ` associative, contradicting the banked
    `not_associative`. The concrete witnessed failure (`genNrm_not_mul_at_S`) is the shadow of
    this law. ONE CAUSE (octonionic non-associativity), the SAME fact that stops the cascade. -/
theorem Nrm_not_mul_on_S : ¬ (∀ x y : S ℚ, CD.Nrm (x * y) = CD.Nrm x * CD.Nrm y) := by
  intro H
  exact not_associative (Nrm_mul_iff_O_assoc.mp H)

end Phys.Cascade
