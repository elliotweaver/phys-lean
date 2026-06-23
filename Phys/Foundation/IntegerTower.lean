/-
  Phys.Foundation.IntegerTower — THE NUMBER TOWER, rung 1: ℤ FROM THE DERIVED ℕ.
  ===========================================================================
  THE NUMBER TOWER (docs/STANDARD.md §3, docs/ROADMAP.md ⚠ STANDING DEPENDENCY GATE).
  The whole tower ℕ→ℤ→ℚ→ℝ must descend from the fold, never be imported from Mathlib
  as CONTENT. N7 (`Counting.lean`) derived ℕ as the fold's re-entry tower `Re`;
  `CountingArith.lean` equipped it with its commutative-semiring arithmetic. THIS file
  derives the CONTENT ℤ — the integers — as the ADDITIVE (GROUP) CLOSURE of that
  derived counting, with NO `import Mathlib.Data.{Nat,Int,Rat,Real,Complex}` used to
  GET the result, NO posited ℤ, NO bridge. ℤ is CONSTRUCTED from `Re`; the `CommRing`
  structure is PROVED.

  ── THE THEORY-NATIVE PICTURE (the trunk, read OUT of the math; §2 below) ──
  Counting goes ONE WAY: the re-entry tower `Re` can only `step` forward; it is
  Dedekind-infinite but has no inverses (`step_ne_void` — you cannot un-count to
  before the void). The ADDITIVE GROUP CLOSURE is the fold's own REFLECTION applied
  to counting. N1 proved the fold IS the unique annihilating reflection,
  `look x = -x` (`fold_eq_neg`): negation is the look-back. Here that same reflection
  reappears at the level of counting, as the GROTHENDIECK group completion:

  • A signed count is a PAIR `(a, b)` of re-entry depths, read as "`a` re-entries
    forward, `b` re-entries back" — the depth `a` minus the depth `b`, but stated
    additively, with NO subtraction presupposed (there is none on `Re`).
  • Two pairs are the SAME signed count when `a + d = c + b` (`intRel`) — the
    cancellative, subtraction-free form of `a - b = c - d`. This is an equivalence
    EXACTLY because counting is cancellative (`Re.add_right_cancel`, N7's `step_inj`).
  • ★ NEGATION IS THE SWAP `(a, b) ↦ (b, a)` — the fold's reflection at counting
    level: reflecting a signed count reverses its sign. This is the structure that
    makes every re-entry UNDOABLE; it is the look-back `look x = -x` realized on the
    completed counts. `neg_add_cancel` then holds, and `(Re×Re)/~` is a group.
  • Multiplication descends by the sign rule `(a,b)·(c,d) = (ac+bd, ad+bc)` — forced
    on signed counts by bilinearity over the `Re` semiring — and the whole carries a
    COMMUTATIVE RING: the derived integers.

  ── WHAT THIS BANKS ──
    intRel, intSetoid               — the Grothendieck relation on `Re × Re` and its
                                      equivalence (transitivity USES `add_right_cancel`).
    Z, Z.mk, Z.sound, Z.exact'      — the carrier `ℤ = (Re×Re)/~` and its quotient API.
    Z.add, Z.neg, Z.mul             — the operations, each PROVED to descend
                                      (well-defined) to the quotient.
    Z.commRing                      — ★ THE DELIVERABLE: the derived ℤ carries a
                                      `CommRing`, negation = the fold's reflection. This
                                      is what later rungs (ℚ) and the cascade ground
                                      instantiate.
    Z.ofRe (+ _add/_mul/_zero/_one) — the embedding `Re ↪ ℤ` as a semiring hom (ℕ ⊂ ℤ).
    Z.ofRe_injective                — ★ the embedding is INJECTIVE (distinct counts ⇒
                                      distinct integers).
    Z.exists_neg                    — ★ ℤ has the negatives `Re` lacks: every count has
                                      an additive inverse in ℤ.
    Z.neg_one_not_ofRe              — ★ ANTI-VACUITY (W8): `-1` is a genuine NEW element
                                      with NO count preimage — ℤ STRICTLY extends `Re`.
    Z.neg_one_eq                    — `-1` is exactly the reflection (swap) of `1`.

  ── WHAT IS OWED (childed onto the chain tail) ──
    ℚ from this derived ℤ (the field-of-fractions / multiplicative closure), then the
    continuum work (N6) re-grounds verbatim onto the derived ℚ. The ⚠ NUMBER-TOWER
    gate flips toward RESOLVED only when the WHOLE tower descends from the fold; this
    file banks rung 1 (ℤ).

  ── CONTENT vs. METALANGUAGE (STANDARD §3) ──
  This derives the CONTENT ℤ: the OBJECT every result here is ABOUT is `Z`, a
  constructed quotient of `Re × Re` (`Re` = the derived ℕ), carrying a PROVED
  `CommRing`, with NO Nat/Int/Rat/Real CONTENT import. Mathlib's `Quotient`/`Setoid`,
  the `CommRing`/`CommSemiring` typeclasses, and the `ring` tactic are MACHINERY
  (the metalanguage) operating on the DERIVED `Re` — exactly what STANDARD §3 permits.
  It does NOT (need not) purge the kernel's metalanguage arity — substrate, like
  `propext`.

  §2. PHYSICS-WORDS-REMOVABLE (STANDARD §2). Delete "fold / re-entry / counting /
  reflection / look-back": what remains is the Grothendieck group completion of the
  free commutative monoid on one generator — a complete, true development that the
  completion carries a commutative ring, the monoid embeds injectively as a semiring,
  and the completion strictly extends it with additive inverses. No theorem STATEMENT
  needs a trunk or physics word to be true. The names are read OUT of the math.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge,
  and — the gate's whole point — NO Mathlib number-system import as content.
-/
import Phys.Foundation.CountingArith
import Mathlib.Algebra.Ring.Defs
import Mathlib.Tactic

namespace Phys.Foundation

/-! ## The Grothendieck relation on signed counts. -/

/-- THE SIGNED-COUNT RELATION: pairs `(a,b)` and `(c,d)` represent the same signed
    count iff `a + d = c + b` — the cancellative, subtraction-free form of
    `a - b = c - d` (there is no subtraction on `Re`). -/
def intRel (p q : Re × Re) : Prop := p.1 + q.2 = q.1 + p.2

theorem intRel_refl (p : Re × Re) : intRel p p := rfl

theorem intRel_symm {p q : Re × Re} (h : intRel p q) : intRel q p := h.symm

/-- Transitivity USES cancellation (`Re.add_right_cancel`, the N7-derived property):
    counting must be cancellative for signed equivalence to be transitive. -/
theorem intRel_trans {p q r : Re × Re} (h1 : intRel p q) (h2 : intRel q r) :
    intRel p r := by
  unfold intRel at *
  apply Re.add_right_cancel (c := q.1 + q.2)
  calc p.1 + r.2 + (q.1 + q.2)
      = (p.1 + q.2) + (q.1 + r.2) := by ring
    _ = (q.1 + p.2) + (r.1 + q.2) := by rw [h1, h2]
    _ = r.1 + p.2 + (q.1 + q.2) := by ring

instance intSetoid : Setoid (Re × Re) where
  r := intRel
  iseqv := ⟨intRel_refl, intRel_symm, intRel_trans⟩

/-- ★ THE DERIVED INTEGERS: the additive group closure of the counting tower `Re`,
    the quotient of signed-count pairs by the Grothendieck relation. -/
def Z : Type := Quotient intSetoid

namespace Z

/-- The signed count `(a,b)` — "`a` forward, `b` back". -/
def mk (a b : Re) : Z := Quotient.mk intSetoid (a, b)

theorem sound {a b c d : Re} (h : a + d = c + b) : mk a b = mk c d :=
  Quotient.sound (show intRel _ _ by simpa [intRel] using h)

theorem exact' {a b c d : Re} (h : mk a b = mk c d) : a + d = c + b :=
  Quotient.exact h

@[simp] theorem mk_eq {a b c d : Re} : mk a b = mk c d ↔ a + d = c + b :=
  ⟨exact', sound⟩

@[elab_as_elim] theorem ind {motive : Z → Prop} (h : ∀ a b, motive (mk a b)) :
    ∀ z, motive z :=
  fun z => Quotient.ind (fun p => h p.1 p.2) z

instance : Zero Z := ⟨mk 0 0⟩
instance : One Z := ⟨mk 1 0⟩

theorem zero_def : (0 : Z) = mk 0 0 := rfl
theorem one_def : (1 : Z) = mk 1 0 := rfl

/-! ## The operations — each proved to descend to the quotient. -/

/-- ADDITION descends componentwise: forward with forward, back with back. -/
def add : Z → Z → Z :=
  Quotient.lift₂ (fun p q => mk (p.1 + q.1) (p.2 + q.2))
    (by
      rintro ⟨a, b⟩ ⟨c, d⟩ ⟨a', b'⟩ ⟨c', d'⟩ (h1 : a + b' = a' + b) (h2 : c + d' = c' + d)
      show mk (a + c) (b + d) = mk (a' + c') (b' + d')
      apply sound
      calc a + c + (b' + d') = (a + b') + (c + d') := by ring
        _ = (a' + b) + (c' + d) := by rw [h1, h2]
        _ = a' + c' + (b + d) := by ring)

instance : Add Z := ⟨add⟩

@[simp] theorem mk_add_mk (a b c d : Re) : mk a b + mk c d = mk (a + c) (b + d) := rfl

/-- ★ NEGATION IS THE SWAP — the fold's reflection (`look x = -x`, N1 `fold_eq_neg`)
    at the level of counting: reflecting a signed count reverses its sign. This is the
    group-completion structure that makes every re-entry UNDOABLE. -/
def neg : Z → Z :=
  Quotient.lift (fun p => mk p.2 p.1)
    (by
      rintro ⟨a, b⟩ ⟨c, d⟩ (h : a + d = c + b)
      show mk b a = mk d c
      apply sound
      calc b + c = c + b := by ring
        _ = a + d := h.symm
        _ = d + a := by ring)

instance : Neg Z := ⟨neg⟩

@[simp] theorem neg_mk (a b : Re) : -mk a b = mk b a := rfl

/-- MULTIPLICATION descends by the sign rule, forced by bilinearity over the `Re`
    semiring. Well-definedness is proved in two single-pair-varying steps, each a
    `Re`-semiring identity after one cancellation. -/
def mul : Z → Z → Z :=
  Quotient.lift₂ (fun p q => mk (p.1 * q.1 + p.2 * q.2) (p.1 * q.2 + p.2 * q.1))
    (by
      rintro ⟨a, b⟩ ⟨c, d⟩ ⟨a', b'⟩ ⟨c', d'⟩ (h1 : a + b' = a' + b) (h2 : c + d' = c' + d)
      show mk (a*c + b*d) (a*d + b*c) = mk (a'*c' + b'*d') (a'*d' + b'*c')
      have step1 : mk (a*c + b*d) (a*d + b*c) = mk (a'*c + b'*d) (a'*d + b'*c) := by
        apply sound
        have hL : (a*c + b*d) + (a'*d + b'*c) = (a'+b)*c + (a'+b)*d := by
          rw [show a*c + b*d + (a'*d + b'*c) = (a+b')*c + (a'+b)*d from by ring, h1]
        have hR : (a'*c + b'*d) + (a*d + b*c) = (a'+b)*c + (a'+b)*d := by
          rw [show a'*c + b'*d + (a*d + b*c) = (a'+b)*c + (a+b')*d from by ring, h1]
        exact hL.trans hR.symm
      have step2 : mk (a'*c + b'*d) (a'*d + b'*c) = mk (a'*c' + b'*d') (a'*d' + b'*c') := by
        apply sound
        have hL : (a'*c + b'*d) + (a'*d' + b'*c') = a'*(c'+d) + b'*(c'+d) := by
          rw [show a'*c + b'*d + (a'*d' + b'*c') = a'*(c+d') + b'*(c'+d) from by ring, h2]
        have hR : (a'*c' + b'*d') + (a'*d + b'*c) = a'*(c'+d) + b'*(c'+d) := by
          rw [show a'*c' + b'*d' + (a'*d + b'*c) = a'*(c'+d) + b'*(c+d') from by ring, h2]
        exact hL.trans hR.symm
      exact step1.trans step2)

instance : Mul Z := ⟨mul⟩

@[simp] theorem mk_mul_mk (a b c d : Re) :
    mk a b * mk c d = mk (a*c + b*d) (a*d + b*c) := rfl

/-- ★ THE DERIVED INTEGERS CARRY A COMMUTATIVE RING — the additive group closure of
    counting. Every law reduces, after `ind` + the `mk` reduction lemmas, to a
    `Re`-commutative-semiring identity discharged by `ring` (the metalanguage tactic
    on the DERIVED counts). Negation = the fold's reflection (swap); `neg_add_cancel`
    is precisely "the look-back undoes the count". -/
instance commRing : CommRing Z where
  add := add
  add_assoc := by
    refine ind fun a b => ind fun c d => ind fun e f => ?_
    show mk a b + mk c d + mk e f = mk a b + (mk c d + mk e f)
    simp only [mk_add_mk]; apply sound; ring
  zero := mk 0 0
  zero_add := by
    refine ind fun a b => ?_
    show mk 0 0 + mk a b = mk a b
    simp only [mk_add_mk]; apply sound; ring
  add_zero := by
    refine ind fun a b => ?_
    show mk a b + mk 0 0 = mk a b
    simp only [mk_add_mk]; apply sound; ring
  add_comm := by
    refine ind fun a b => ind fun c d => ?_
    show mk a b + mk c d = mk c d + mk a b
    simp only [mk_add_mk]; apply sound; ring
  neg := neg
  mul := mul
  left_distrib := by
    refine ind fun a b => ind fun c d => ind fun e f => ?_
    show mk a b * (mk c d + mk e f) = mk a b * mk c d + mk a b * mk e f
    simp only [mk_add_mk, mk_mul_mk]; apply sound; ring
  right_distrib := by
    refine ind fun a b => ind fun c d => ind fun e f => ?_
    show (mk a b + mk c d) * mk e f = mk a b * mk e f + mk c d * mk e f
    simp only [mk_add_mk, mk_mul_mk]; apply sound; ring
  zero_mul := by
    refine ind fun a b => ?_
    show mk 0 0 * mk a b = mk 0 0
    simp only [mk_mul_mk]; apply sound; ring
  mul_zero := by
    refine ind fun a b => ?_
    show mk a b * mk 0 0 = mk 0 0
    simp only [mk_mul_mk]; apply sound; ring
  mul_assoc := by
    refine ind fun a b => ind fun c d => ind fun e f => ?_
    show mk a b * mk c d * mk e f = mk a b * (mk c d * mk e f)
    simp only [mk_mul_mk]; apply sound; ring
  one := mk 1 0
  one_mul := by
    refine ind fun a b => ?_
    show mk 1 0 * mk a b = mk a b
    simp only [mk_mul_mk]; apply sound; ring
  mul_one := by
    refine ind fun a b => ?_
    show mk a b * mk 1 0 = mk a b
    simp only [mk_mul_mk]; apply sound; ring
  neg_add_cancel := by
    refine ind fun a b => ?_
    show -mk a b + mk a b = mk 0 0
    simp only [neg_mk, mk_add_mk]; apply sound; ring
  mul_comm := by
    refine ind fun a b => ind fun c d => ?_
    show mk a b * mk c d = mk c d * mk a b
    simp only [mk_mul_mk]; apply sound; ring
  nsmul := nsmulRec
  zsmul := zsmulRec

/-! ## The embedding `Re ↪ ℤ` (ℕ sits inside ℤ) and non-vacuity. -/

/-- THE EMBEDDING: a count `a` is the purely-forward signed count `(a, 0)`. -/
def ofRe (a : Re) : Z := mk a 0

@[simp] theorem ofRe_def (a : Re) : ofRe a = mk a 0 := rfl

theorem ofRe_zero : ofRe 0 = 0 := rfl
theorem ofRe_one : ofRe 1 = 1 := rfl

/-- The embedding is a SEMIRING HOM (additive). -/
theorem ofRe_add (a b : Re) : ofRe (a + b) = ofRe a + ofRe b := by
  simp only [ofRe, mk_add_mk]; apply sound; ring

/-- The embedding is a SEMIRING HOM (multiplicative). -/
theorem ofRe_mul (a b : Re) : ofRe (a * b) = ofRe a * ofRe b := by
  simp only [ofRe, mk_mul_mk]; apply sound; ring

/-- ★ THE EMBEDDING IS INJECTIVE: distinct counts give distinct integers (ℕ ↪ ℤ). -/
theorem ofRe_injective : Function.Injective ofRe := by
  intro a b h
  have : a + 0 = b + 0 := by simpa [ofRe] using exact' h
  simpa using this

/-- ★ ℤ HAS THE NEGATIVES `Re` LACKS: every count has an additive inverse in ℤ — the
    reflection `(0, a)` of `(a, 0)`. Counting alone (`Re`) has no inverses
    (`step_ne_void`); the group closure supplies them. -/
theorem exists_neg (a : Re) : ∃ z : Z, z + ofRe a = 0 := by
  refine ⟨mk 0 a, ?_⟩
  simp only [ofRe, mk_add_mk]; apply sound; ring

/-- ★ ANTI-VACUITY (docs/RUNBOOK.md W8): `-1` is a GENUINE NEW element with NO count
    preimage — ℤ STRICTLY extends `Re`. A preimage would need `0 = a + 1` for some
    count `a`, impossible since `step` is never the void (`step_ne_void`, N7). If the
    closure had collapsed (negation degenerate, or the embedding non-injective), this
    would FAIL — the costume forces exactly that collapse. -/
theorem neg_one_not_ofRe : ¬ ∃ a : Re, ofRe a = mk 0 1 := by
  rintro ⟨a, h⟩
  have hh : a + 1 = 0 + 0 := exact' h
  rw [show ((0 : Re) + 0) = Re.void from rfl,
      show (1 : Re) = Re.step 0 from rfl, Re.add_step] at hh
  exact Re.step_ne_void (a + 0) hh

/-- The new element `-1` is exactly the reflection (swap) of `1` — the fold's
    look-back realized on the completed counts. -/
theorem neg_one_eq : (mk 0 1 : Z) = -1 := by
  show mk 0 1 = -mk 1 0
  rw [neg_mk]

end Z
end Phys.Foundation
