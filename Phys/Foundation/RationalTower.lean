/-
  Phys.Foundation.RationalTower — THE NUMBER TOWER, rung 2: ℚ FROM THE DERIVED ℤ.
  ===========================================================================
  THE NUMBER TOWER (docs/STANDARD.md §3, docs/ROADMAP.md ⚠ STANDING DEPENDENCY GATE).
  The whole tower ℕ→ℤ→ℚ→ℝ must descend from the fold, never be imported from Mathlib
  as CONTENT. N7 (`Counting.lean`) derived ℕ as the fold's re-entry tower `Re`;
  N8 (`IntegerTower.lean`) derived ℤ = `Z` as the ADDITIVE GROUP CLOSURE of that
  counting (★ negation = THE SWAP = the fold's reflection). THIS file derives the
  CONTENT ℚ — the rationals — as the MULTIPLICATIVE (FIELD-OF-FRACTIONS) closure of
  that derived `Z`, with NO `import Mathlib.Data.{Nat,Int,Rat,Real,Complex}` used to
  GET the result, NO posited ℚ, NO bridge. ℚ is CONSTRUCTED from `Z`; the `Field`
  structure is PROVED.

  ── THE THEORY-NATIVE PICTURE (the trunk, read OUT of the math; §2 below) ──
  N8 made every ADDITIVE re-entry UNDOABLE: the additive group closure, with negation
  the fold's reflection (the swap `(a,b)↦(b,a)` on Grothendieck pairs, N1 `look x = -x`).
  ℚ makes every NONZERO MULTIPLICATIVE step UNDOABLE — the field closure: the SAME
  "make the act reversible" move, now applied to MULTIPLICATION, and localized away
  from the one irreversible point — zero, the void's own image, the count that cannot
  be undone multiplicatively. The construction:

  • A signed FRACTION is a PAIR `(p, q)` with numerator `p : Z` and a NONZERO
    denominator `q`. Two fractions are the SAME rational when `p·s = r·q` (`ratRel`) —
    cross-multiplication, the subtraction/division-free form of `p/q = r/s`.
  • This is an equivalence EXACTLY because `Z` is an INTEGRAL DOMAIN (cancellation by a
    nonzero element) — which is itself DERIVED here from the banked `Z.commRing`: `Z` has
    NO ZERO DIVISORS because counting `Re` is cancellative and linearly comparable
    (`Re.mul_cross_ne`, traced to `Re.add_right_cancel`/`step_inj`, N7/N8). The domain
    property is not posited; it is forced by the fold's counting.
  • ★ THE MULTIPLICATIVE INVERSE IS THE SWAP `(p, q) ↦ (q, p)` — numerator ↔
    denominator — exactly the fold's reflection realized on the multiplicative pairs,
    the mirror of N8's ADDITIVE swap. The additive swap reflects sign; the
    multiplicative swap reflects scale. `mul_inv_cancel` then holds for every nonzero
    fraction, and the whole carries a FIELD: the derived rationals.

  ── WHAT THIS BANKS ──
    Re.mul_ne_zero', Re.add_comparable, Re.mul_cross_ne  — the no-zero-divisor /
                                      comparability content of counting, the exact
                                      properties `Z` needs to be an integral domain.
    Re.add_self_ne_step_add_self    — ★ PARITY: an even count never equals an odd count
                                      (`a+a ≠ step(b+b)`) — the witness that `1/2` is not
                                      an integer.
    Z instances: Nontrivial, NoZeroDivisors  — ★ the derived ℤ is an INTEGRAL DOMAIN.
    NZ, ratRel, ratSetoid           — nonzero denominators, the cross-mult relation and
                                      its equivalence (transitivity USES domain cancel).
    Q, Q.mk, Q.sound, Q.exact'      — the carrier `ℚ = (Z × NZ)/~` and its quotient API.
    Q.add, Q.neg, Q.mul             — the operations, each PROVED to descend.
    Q.commRing                      — the derived ℚ carries a `CommRing`.
    Q.isField, Q.field              — ★ THE DELIVERABLE: the derived ℚ is a `Field`; the
                                      multiplicative inverse of `p/q` is the SWAP `q/p`.
    Q.ofZ (+ _add/_mul/_injective)  — the embedding `Z ↪ ℚ` as an injective ring hom
                                      (ℤ sits inside ℚ).
    Q.half, Q.half_mul_two,         — ★ ANTI-VACUITY (W8): `1/2` is a genuine new element
    Q.half_not_ofZ                    with an inverse (`2` is invertible) and NO `Z`
                                      preimage — ℚ STRICTLY extends `Z`.

  ── WHAT IS OWED (childed onto the chain tail) ──
    Re-ground the continuum work (N6, `Continuum.lean`/`CompletionContinuum.lean`,
    currently over the imported ℚ) onto THIS derived ℚ; then the ℝ field-operations.
    The ⚠ NUMBER-TOWER gate flips toward RESOLVED only when the WHOLE tower descends
    from the fold AND the continuum re-grounds onto the derived ℚ; this file banks
    rung 2 (ℚ).

  ── CONTENT vs. METALANGUAGE (STANDARD §3) ──
  This derives the CONTENT ℚ: the OBJECT every result here is ABOUT is `Q`, a
  constructed quotient of `Z × {nonzero Z}` (`Z` = the derived ℤ), carrying a PROVED
  `Field`, with NO Nat/Int/Rat/Real CONTENT import. Mathlib's `Quotient`/`Setoid`, the
  `Field`/`CommRing` typeclasses, `IsField`, and the `ring`/`linear_combination` tactics
  are MACHINERY (the metalanguage) operating on the DERIVED `Z` — exactly what
  STANDARD §3 permits. It does NOT (need not) purge the kernel's metalanguage arity
  (`nsmulRec`/`zsmulRec` scalar-arity) — substrate, like `propext`.

  §2. PHYSICS-WORDS-REMOVABLE (STANDARD §2). Delete "fold / re-entry / counting /
  reflection / look-back / swap": what remains is the field of fractions of the
  Grothendieck completion of the free commutative monoid on one generator — a complete,
  true development that the completion is an integral domain, its field of fractions
  carries a field, the ring embeds injectively, and the field strictly extends it with a
  multiplicative inverse of 2 (a non-integer rational `1/2`). No theorem STATEMENT needs
  a trunk or physics word to be true. The names are read OUT of the math.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge,
  and — the gate's whole point — NO Mathlib number-system import as content.
-/
import Phys.Foundation.IntegerTower
import Mathlib.Algebra.Ring.Defs
import Mathlib.Algebra.Field.Basic
import Mathlib.Tactic

namespace Phys.Foundation

/-! ## The integral-domain content of counting: `Re` has no zero divisors and is
    linearly comparable — the exact properties the field of fractions is built on. -/

namespace Re

/-- Counting has NO ZERO DIVISORS: the product of two nonzero counts is nonzero. -/
theorem mul_ne_zero' {a b : Re} (ha : a ≠ 0) (hb : b ≠ 0) : a * b ≠ 0 := by
  cases b with
  | void => exact (hb rfl).elim
  | step b' =>
    cases a with
    | void => exact (ha rfl).elim
    | step a' =>
      rw [mul_step, add_step]
      exact Re.step_ne_void _

/-- Counting is LINEARLY COMPARABLE: any two counts differ by a count on one side. -/
theorem add_comparable (a b : Re) : (∃ s, b = a + s) ∨ (∃ s, a = b + s) := by
  induction a with
  | void => left; exact ⟨b, by rw [void_add]⟩
  | step a' ih =>
    cases ih with
    | inl h =>
      obtain ⟨s, hs⟩ := h
      cases s with
      | void =>
        right; refine ⟨step void, ?_⟩
        rw [hs, add_void, add_step, add_void]
      | step s' =>
        left; refine ⟨s', ?_⟩
        rw [hs, step_add, add_step]
    | inr h =>
      obtain ⟨s, hs⟩ := h
      right; refine ⟨step s, ?_⟩
      rw [hs, add_step]

/-- Two distinct counts differ by a NONZERO count on one side (strict comparability). -/
theorem sub_exists_of_ne {a b : Re} (h : a ≠ b) :
    (∃ s, s ≠ 0 ∧ b = a + s) ∨ (∃ s, s ≠ 0 ∧ a = b + s) := by
  cases add_comparable a b with
  | inl hc =>
    obtain ⟨s, hs⟩ := hc
    left; refine ⟨s, ?_, hs⟩
    rintro rfl; rw [add_zero] at hs; exact h hs.symm
  | inr hc =>
    obtain ⟨s, hs⟩ := hc
    right; refine ⟨s, ?_, hs⟩
    rintro rfl; rw [add_zero] at hs; exact h hs

/-- From `x = x + y` over `Re` (cancellative), `y = 0`. -/
theorem add_cancel_zero {x y : Re} (h : x = x + y) : y = 0 := by
  have h2 : x + 0 = x + y := by rwa [add_zero]
  exact (Re.add_left_cancel h2).symm

/-- ★ THE CROSS-PRODUCT PARITY — the `Z`-no-zero-divisor content over `Re`: distinct
    counts `a≠b`, `c≠d` give `a·c + b·d ≠ a·d + b·c`. In each comparability case the two
    sides differ by `s·t ≠ 0` (`mul_ne_zero'`), killed by cancellation. -/
theorem mul_cross_ne {a b c d : Re} (hab : a ≠ b) (hcd : c ≠ d) :
    a * c + b * d ≠ a * d + b * c := by
  rcases sub_exists_of_ne hab with ⟨s, hs, rfl⟩ | ⟨s, hs, rfl⟩
  · rcases sub_exists_of_ne hcd with ⟨t, ht, rfl⟩ | ⟨t, ht, rfl⟩
    · intro heq
      have hr : a*c + (a+s)*(c+t) = (a*(c+t) + (a+s)*c) + s*t := by ring
      rw [heq] at hr
      exact mul_ne_zero' hs ht (add_cancel_zero hr)
    · intro heq
      have hr : a*d + (a+s)*(d+t) = (a*(d+t) + (a+s)*d) + s*t := by ring
      rw [← heq] at hr
      exact mul_ne_zero' hs ht (add_cancel_zero hr)
  · rcases sub_exists_of_ne hcd with ⟨t, ht, rfl⟩ | ⟨t, ht, rfl⟩
    · intro heq
      have hr : (b+s)*(c+t) + b*c = ((b+s)*c + b*(c+t)) + s*t := by ring
      rw [← heq] at hr
      exact mul_ne_zero' hs ht (add_cancel_zero hr)
    · intro heq
      have hr : (b+s)*(d+t) + b*d = ((b+s)*d + b*(d+t)) + s*t := by ring
      rw [heq] at hr
      exact mul_ne_zero' hs ht (add_cancel_zero hr)

/-- ★ PARITY: an EVEN count never equals an ODD count — `a + a ≠ step (b + b)`. This is
    the witness that the derived `1/2` is NOT an integer (no count `a` has `2a = 2b+1`).
    Double induction over the counting tower, bottoming on `step ≠ void` (N7). -/
theorem add_self_ne_step_add_self : ∀ (a b : Re), a + a ≠ step (b + b) := by
  intro a
  induction a with
  | void =>
    intro b
    rw [void_add]
    exact fun h => Re.step_ne_void _ h.symm
  | step a' ih =>
    intro b
    rw [add_step, step_add]
    cases b with
    | void =>
      rw [void_add]
      exact fun h => Re.step_ne_void _ (Re.step_inj h)
    | step b' =>
      rw [add_step, step_add]
      exact fun h => ih b' (Re.step_inj (Re.step_inj h))

end Re

namespace Z

/-- `mk a b = 0 ↔ a = b` over `Re`. -/
theorem mk_eq_zero {a b : Re} : mk a b = 0 ↔ a = b := by
  rw [zero_def, mk_eq, add_zero, zero_add]

/-- `(1 : Z) ≠ (0 : Z)` — the count-1 differs from the void. -/
theorem one_ne_zero' : (1 : Z) ≠ (0 : Z) := by
  rw [one_def]
  intro h
  rw [mk_eq_zero] at h
  exact Re.step_ne_void Re.void h

instance : Nontrivial Z := ⟨1, 0, one_ne_zero'⟩

/-- ★ THE DERIVED ℤ IS AN INTEGRAL DOMAIN: no zero divisors, from `Re.mul_cross_ne`
    (which traces to counting's cancellation + comparability). This is exactly what the
    field-of-fractions relation needs to be transitive. -/
instance : NoZeroDivisors Z where
  eq_zero_or_eq_zero_of_mul_eq_zero := by
    intro x y
    refine Z.ind (fun a b => ?_) x
    refine Z.ind (fun c d => ?_) y
    intro hxy
    rw [mk_mul_mk, mk_eq_zero] at hxy
    -- if neither factor is 0, the cross-product parity is violated.
    by_contra hcon
    rw [not_or] at hcon
    obtain ⟨hx, hy⟩ := hcon
    exact Re.mul_cross_ne ((not_congr mk_eq_zero).mp hx) ((not_congr mk_eq_zero).mp hy) hxy

end Z

/-! ## ℚ = the field of fractions of the derived ℤ. -/

/-- A NONZERO derived integer — a legal denominator. -/
def NZ : Type := {d : Z // d ≠ 0}

namespace NZ
/-- The unit denominator `1`. -/
def one : NZ := ⟨1, Z.one_ne_zero'⟩
/-- Product of denominators stays a legal denominator (no zero divisors — `Z` a domain). -/
def mul (q s : NZ) : NZ := ⟨q.1 * s.1, mul_ne_zero q.2 s.2⟩
@[simp] theorem mul_val (q s : NZ) : (mul q s).1 = q.1 * s.1 := rfl
@[simp] theorem one_val : (one : NZ).1 = 1 := rfl
end NZ

/-- THE FRACTION RELATION: `(p,q) ~ (r,s) ↔ p·s = r·q` — cross-multiplication, the
    subtraction/division-free form of `p/q = r/s`. -/
def ratRel (x y : Z × NZ) : Prop := x.1 * y.2.1 = y.1 * x.2.1

theorem ratRel_refl (x : Z × NZ) : ratRel x x := rfl

theorem ratRel_symm {x y : Z × NZ} (h : ratRel x y) : ratRel y x := h.symm

/-- Transitivity USES domain cancellation (cancel the nonzero middle denominator) — the
    exact use of `Z` being an integral domain. -/
theorem ratRel_trans {x y z : Z × NZ} (h1 : ratRel x y) (h2 : ratRel y z) : ratRel x z := by
  unfold ratRel at *
  apply mul_right_cancel₀ y.2.2
  calc x.1 * z.2.1 * y.2.1
      = (x.1 * y.2.1) * z.2.1 := by ring
    _ = (y.1 * x.2.1) * z.2.1 := by rw [h1]
    _ = (y.1 * z.2.1) * x.2.1 := by ring
    _ = (z.1 * y.2.1) * x.2.1 := by rw [h2]
    _ = z.1 * x.2.1 * y.2.1 := by ring

instance ratSetoid : Setoid (Z × NZ) where
  r := ratRel
  iseqv := ⟨ratRel_refl, ratRel_symm, ratRel_trans⟩

/-- ★ THE DERIVED RATIONALS: the field-of-fractions (multiplicative) closure of the
    derived ℤ, the quotient of nonzero-denominator fractions by cross-multiplication. -/
def Q : Type := Quotient ratSetoid

namespace Q

/-- The fraction `p/q`. -/
def mk (p : Z) (q : NZ) : Q := Quotient.mk ratSetoid (p, q)

theorem sound {p : Z} {q : NZ} {r : Z} {s : NZ} (h : p * s.1 = r * q.1) :
    mk p q = mk r s := Quotient.sound h

theorem exact' {p : Z} {q : NZ} {r : Z} {s : NZ} (h : mk p q = mk r s) :
    p * s.1 = r * q.1 := Quotient.exact h

@[simp] theorem mk_eq {p : Z} {q : NZ} {r : Z} {s : NZ} :
    mk p q = mk r s ↔ p * s.1 = r * q.1 := ⟨exact', sound⟩

@[elab_as_elim] theorem ind {motive : Q → Prop} (h : ∀ p q, motive (mk p q)) :
    ∀ z, motive z := fun z => Quotient.ind (fun p => h p.1 p.2) z

instance : Zero Q := ⟨mk 0 NZ.one⟩
instance : One Q := ⟨mk 1 NZ.one⟩

theorem zero_def : (0 : Q) = mk 0 NZ.one := rfl
theorem one_def : (1 : Q) = mk 1 NZ.one := rfl

/-! ## The operations — each PROVED to descend to the quotient (cross-mult identities
    over the derived `Z`, discharged by `linear_combination`/`ring`). -/

/-- ADDITION of fractions: `p/q + r/s = (p·s + r·q)/(q·s)`. -/
def add : Q → Q → Q :=
  Quotient.lift₂ (fun x y => mk (x.1 * y.2.1 + y.1 * x.2.1) (NZ.mul x.2 y.2))
    (by
      rintro ⟨p, q⟩ ⟨r, s⟩ ⟨p', q'⟩ ⟨r', s'⟩ (h1 : p * q'.1 = p' * q.1)
        (h2 : r * s'.1 = r' * s.1)
      show mk (p * s.1 + r * q.1) (NZ.mul q s) = mk (p' * s'.1 + r' * q'.1) (NZ.mul q' s')
      apply sound
      simp only [NZ.mul_val]
      linear_combination (s.1 * s'.1) * h1 + (q.1 * q'.1) * h2)

instance : Add Q := ⟨add⟩

@[simp] theorem mk_add_mk (p : Z) (q : NZ) (r : Z) (s : NZ) :
    mk p q + mk r s = mk (p * s.1 + r * q.1) (NZ.mul q s) := rfl

/-- NEGATION rides along: `-(p/q) = (-p)/q` (the additive swap, inherited from `Z`). -/
def neg : Q → Q :=
  Quotient.lift (fun x => mk (-x.1) x.2)
    (by
      rintro ⟨p, q⟩ ⟨p', q'⟩ (h : p * q'.1 = p' * q.1)
      show mk (-p) q = mk (-p') q'
      apply sound; linear_combination -h)

instance : Neg Q := ⟨neg⟩

@[simp] theorem neg_mk (p : Z) (q : NZ) : -mk p q = mk (-p) q := rfl

/-- MULTIPLICATION of fractions: `(p/q)·(r/s) = (p·r)/(q·s)`. -/
def mul : Q → Q → Q :=
  Quotient.lift₂ (fun x y => mk (x.1 * y.1) (NZ.mul x.2 y.2))
    (by
      rintro ⟨p, q⟩ ⟨r, s⟩ ⟨p', q'⟩ ⟨r', s'⟩ (h1 : p * q'.1 = p' * q.1)
        (h2 : r * s'.1 = r' * s.1)
      show mk (p * r) (NZ.mul q s) = mk (p' * r') (NZ.mul q' s')
      apply sound
      simp only [NZ.mul_val]
      linear_combination (r * s'.1) * h1 + (p' * q.1) * h2)

instance : Mul Q := ⟨mul⟩

@[simp] theorem mk_mul_mk (p : Z) (q : NZ) (r : Z) (s : NZ) :
    mk p q * mk r s = mk (p * r) (NZ.mul q s) := rfl

/-- ★ THE DERIVED RATIONALS CARRY A COMMUTATIVE RING. Every law reduces, after `ind` +
    the `mk` reduction lemmas, to a `Z`-commutative-ring identity discharged by `ring`
    (the metalanguage tactic on the DERIVED integers). -/
instance commRing : CommRing Q where
  add := add
  add_assoc := by
    refine ind fun p q => ind fun r s => ind fun u v => ?_
    simp only [mk_add_mk]; apply sound; simp only [NZ.mul_val]; ring
  zero := mk 0 NZ.one
  zero_add := by
    refine ind fun p q => ?_
    show mk 0 NZ.one + mk p q = mk p q
    simp only [mk_add_mk]; apply sound; simp only [NZ.mul_val, NZ.one_val]; ring
  add_zero := by
    refine ind fun p q => ?_
    show mk p q + mk 0 NZ.one = mk p q
    simp only [mk_add_mk]; apply sound; simp only [NZ.mul_val, NZ.one_val]; ring
  add_comm := by
    refine ind fun p q => ind fun r s => ?_
    simp only [mk_add_mk]; apply sound; simp only [NZ.mul_val]; ring
  neg := neg
  mul := mul
  left_distrib := by
    refine ind fun p q => ind fun r s => ind fun u v => ?_
    show mk p q * (mk r s + mk u v) = mk p q * mk r s + mk p q * mk u v
    simp only [mk_add_mk, mk_mul_mk]; apply sound; simp only [NZ.mul_val]; ring
  right_distrib := by
    refine ind fun p q => ind fun r s => ind fun u v => ?_
    show (mk p q + mk r s) * mk u v = mk p q * mk u v + mk r s * mk u v
    simp only [mk_add_mk, mk_mul_mk]; apply sound; simp only [NZ.mul_val]; ring
  zero_mul := by
    refine ind fun p q => ?_
    show mk 0 NZ.one * mk p q = mk 0 NZ.one
    simp only [mk_mul_mk]; apply sound; simp only [NZ.mul_val, NZ.one_val]; ring
  mul_zero := by
    refine ind fun p q => ?_
    show mk p q * mk 0 NZ.one = mk 0 NZ.one
    simp only [mk_mul_mk]; apply sound; simp only [NZ.mul_val, NZ.one_val]; ring
  mul_assoc := by
    refine ind fun p q => ind fun r s => ind fun u v => ?_
    simp only [mk_mul_mk]; apply sound; simp only [NZ.mul_val]; ring
  one := mk 1 NZ.one
  one_mul := by
    refine ind fun p q => ?_
    show mk 1 NZ.one * mk p q = mk p q
    simp only [mk_mul_mk]; apply sound; simp only [NZ.mul_val, NZ.one_val]; ring
  mul_one := by
    refine ind fun p q => ?_
    show mk p q * mk 1 NZ.one = mk p q
    simp only [mk_mul_mk]; apply sound; simp only [NZ.mul_val, NZ.one_val]; ring
  neg_add_cancel := by
    refine ind fun p q => ?_
    show -mk p q + mk p q = mk 0 NZ.one
    simp only [neg_mk, mk_add_mk]; apply sound; simp only [NZ.mul_val, NZ.one_val]; ring
  mul_comm := by
    refine ind fun p q => ind fun r s => ?_
    simp only [mk_mul_mk]; apply sound; simp only [NZ.mul_val]; ring
  nsmul := nsmulRec
  zsmul := zsmulRec

/-! ## The field structure: the multiplicative inverse is THE SWAP. -/

/-- `mk p q = 0 ↔ p = 0` (a fraction vanishes iff its numerator does). -/
theorem mk_eq_zero {p : Z} {q : NZ} : mk p q = 0 ↔ p = 0 := by
  rw [zero_def, mk_eq, NZ.one_val, mul_one, zero_mul]

/-- ★ THE DELIVERABLE — THE DERIVED ℚ IS A FIELD. The multiplicative inverse of a
    nonzero fraction `p/q` is THE SWAP `q/p` — the fold's reflection realized on the
    multiplicative pairs (numerator ↔ denominator), the mirror of N8's ADDITIVE swap
    (negation). `mul_inv_cancel` is precisely "the multiplicative look-back undoes the
    nonzero scaling". -/
theorem isField : IsField Q where
  exists_pair_ne := ⟨0, 1, by
    rw [zero_def, one_def, Ne, mk_eq, NZ.one_val, mul_one, mul_one]
    exact fun h => Z.one_ne_zero' h.symm⟩
  mul_comm := mul_comm
  mul_inv_cancel := by
    intro a ha
    refine Q.ind (motive := fun z => z ≠ 0 → ∃ b, z * b = 1) (fun p q hpq => ?_) a ha
    have hp : p ≠ 0 := fun h => hpq (by rw [h]; exact mk_eq_zero.mpr rfl)
    -- THE INVERSE IS THE SWAP: q/p.
    refine ⟨mk q.1 ⟨p, hp⟩, ?_⟩
    show mk p q * mk q.1 ⟨p, hp⟩ = 1
    rw [mk_mul_mk, one_def]
    apply sound
    simp only [NZ.mul_val, NZ.one_val]
    ring

/-- The derived ℚ as a `Field` (the inverse supplied by `isField` = the swap). -/
noncomputable instance field : Field Q := isField.toField

/-! ## The embedding `Z ↪ ℚ` (ℤ sits inside ℚ) and non-vacuity. -/

/-- THE EMBEDDING: an integer `p` is the fraction `p/1`. -/
def ofZ (p : Z) : Q := mk p NZ.one

@[simp] theorem ofZ_def (p : Z) : ofZ p = mk p NZ.one := rfl

/-- The embedding is a RING HOM (additive). -/
theorem ofZ_add (p r : Z) : ofZ (p + r) = ofZ p + ofZ r := by
  simp only [ofZ, mk_add_mk]; apply sound; simp only [NZ.mul_val, NZ.one_val]; ring

/-- The embedding is a RING HOM (multiplicative). -/
theorem ofZ_mul (p r : Z) : ofZ (p * r) = ofZ p * ofZ r := by
  simp only [ofZ, mk_mul_mk]; apply sound; simp only [NZ.mul_val, NZ.one_val]; ring

theorem ofZ_zero : ofZ 0 = 0 := rfl
theorem ofZ_one : ofZ 1 = 1 := rfl

/-- ★ THE EMBEDDING IS INJECTIVE: distinct integers give distinct rationals (ℤ ↪ ℚ). -/
theorem ofZ_injective : Function.Injective ofZ := by
  intro p r h
  have : p * (1 : Z) = r * (1 : Z) := by simpa [ofZ, NZ.one_val] using exact' h
  simpa using this

/-- The derived `2 : Z` as an explicit count-pair `(1+1, 0)` — needed as a denominator. -/
def twoR : Re := 1 + 1

theorem twoZ_ne_zero : (Z.mk twoR 0 : Z) ≠ 0 := by
  intro h
  rw [Z.mk_eq_zero] at h
  -- twoR = 1 + 1 = step (step 0) ≠ void = 0
  rw [twoR, show (1 : Re) = Re.step 0 from rfl, Re.add_step, add_zero] at h
  exact Re.step_ne_void _ h

/-- The legal denominator `2`. -/
def dTwo : NZ := ⟨Z.mk twoR 0, twoZ_ne_zero⟩

/-- ★ THE WITNESS `1/2` — a genuine rational. -/
def half : Q := mk 1 dTwo

/-- `1/2` is NONZERO. -/
theorem half_ne_zero : half ≠ 0 := by
  rw [half, Ne, mk_eq_zero]
  exact Z.one_ne_zero'

/-- ★ `2` IS INVERTIBLE in ℚ: `(1/2)·2 = 1` — an inverse the integers `Z` do NOT have. -/
theorem half_mul_two : half * ofZ (Z.mk twoR 0) = 1 := by
  rw [half, ofZ, mk_mul_mk, one_def]
  apply sound
  simp only [NZ.mul_val, NZ.one_val, dTwo]
  ring

/-- ★ ANTI-VACUITY (docs/RUNBOOK.md W8): `1/2` has NO `Z` preimage under the embedding —
    ℚ STRICTLY extends `Z`. A preimage `z` would force `z·2 = 1` over `Z`, i.e. an even
    count equal to an odd count (`a+a = step(b+b)`), impossible by `Re` parity
    (`add_self_ne_step_add_self`). The multiplicative closure genuinely adds new elements,
    exactly as N8's additive closure added `-1`. If the closure had collapsed (a zero
    denominator admitted, or the inverse degenerate), this would FAIL — the costume forces
    exactly that collapse. -/
theorem half_not_ofZ : ¬ ∃ z : Z, ofZ z = half := by
  rintro ⟨z, hz⟩
  -- ofZ z = half ⟹ z·2 = 1 over Z.
  have hzeq : z * (Z.mk twoR 0) = 1 := by
    have := exact' hz
    simpa [ofZ, half, dTwo, NZ.one_val, one_def] using this
  -- expand z = mk a b; reduce to a parity equation over Re.
  revert hzeq
  refine Z.ind (fun a b => ?_) z
  intro hzeq
  rw [show (1 : Z) = Z.mk 1 0 from rfl, Z.mk_mul_mk, Z.mk_eq] at hzeq
  -- hzeq : a*twoR + b*0 + 0 = 1 + (a*0 + b*twoR)   (over Re)
  rw [twoR] at hzeq
  -- normalize: a*(1+1) = a+a, b*(1+1) = b+b, 1 + (b+b) = step(b+b)
  have key : a + a = Re.step (b + b) := by
    have e1 : a * (1 + 1) + b * 0 + 0 = a + a := by ring
    have e2 : (1 : Re) + (a * 0 + b * (1 + 1)) = (1 : Re) + (b + b) := by ring
    rw [e1, e2] at hzeq
    -- hzeq : a + a = 1 + (b + b);  1 + (b+b) = step (b+b)
    rw [show (1 : Re) = Re.step 0 from rfl, Re.step_add, zero_add] at hzeq
    exact hzeq
  exact Re.add_self_ne_step_add_self a b key

end Q
end Phys.Foundation
