# N8 — ℤ FROM THE DERIVED ℕ (`Re`) — PREREGISTRATION (frozen before compute)

## THE TARGET
Derive the CONTENT ℤ — the integers — as the ADDITIVE (GROUP) CLOSURE of the banked
counting tower `Re` (N7's ℕ-from-the-fold). NO `import Mathlib.Data.{Nat,Int,Rat,Real,
Complex}` used to GET the result, NO posited ℤ, NO bridge. ℤ is CONSTRUCTED from `Re`;
the `CommRing` structure is PROVED.

## THE TRUNK ROUTE (reframe through the fold FIRST)
- N7 banked: `Re` (re-entry tower: `void | step`), `step_inj`, `step_ne_void`,
  `step_ne_self`, `iterate`/`iterate_unique` (Re IS ℕ, the initial point-and-endomap),
  `step_not_surjective` (Dedekind-infinite). Counting goes ONE WAY (re-entry only).
- THE TRUNK PICTURE: counting is irreversible (you can only `step` forward). The additive
  GROUP closure is the fold's own REFLECTION (N1: `look x = -x`, negation = look-back)
  applied to counting — the completion that makes every re-entry UNDOABLE. In the
  Grothendieck construction a pair `(a,b)` represents "a minus b re-entries", and
  NEGATION IS THE SWAP `(a,b) ↦ (b,a)` — exactly the fold's reflection at the level of
  counting. The fold's `look` reappears here as the group-completion negation.

## THE CONSTRUCTION (Grothendieck group completion — the cleanest route)
1. `Re`-as-CommSemiring (rung prep): `Re.add` (iterate `step`), `Re.mul`, prove the
   commutative-semiring laws as THEOREMS over `Re`, register `instance : CommSemiring Re`.
   This makes the metalanguage tactic `ring` available ON `Re` — every downstream
   well-definedness / ring-axiom obligation over the quotient reduces to a `Re`-semiring
   `ring` identity. Also prove `add_right_cancel` (needed: `~` transitive / embedding inj).
2. `Z := Quotient` of `Re × Re` by `(a,b) ~ (c,d) ↔ a + d = c + b`. Operations:
   `add (a,b)(c,d) = (a+c, b+d)`, `neg (a,b) = (b,a)` (★ THE FOLD REFLECTION), zero `(0,0)`,
   one `(1,0)`, `mul (a,b)(c,d) = (ac+bd, ad+bc)`. Prove each descends to the quotient
   (well-defined), then `instance : CommRing Z`.
3. NON-VACUITY / anti-W8: the embedding `ιz : Re → Z`, `a ↦ ⟦(a,0)⟧`, is INJECTIVE and a
   semiring hom (ℕ sits inside ℤ). ℤ has negatives `Re` lacks: `∀ n, ∃ z, z + ιz n = 0`
   (witness `-n = ⟦(0,n)⟧`), and `-1 = ⟦(0,1)⟧` has NO `Re`-preimage under `ιz`.

## WHAT WILL BE BANKED (production files)
- `Phys/Foundation/CountingArith.lean` — `Re.add`/`Re.mul` + the CommSemiring laws +
  `instance CommSemiring Re` + `add_right_cancel`.
- `Phys/Foundation/IntegerTower.lean` — the setoid, `Z`, the operations (negation = swap),
  `instance CommRing Z`, the injective semiring embedding `ιz`, the negatives witnesses.

## GO / NO-GO
- GO if: the CommSemiring instance on `Re` + the CommRing instance on `Z` + the injective
  semiring embedding + the negatives witnesses all compile foundations-only
  (`#print axioms` ⊆ {propext, Classical.choice, Quot.sound}); costume bites; gate D0–D6
  green; physics-words-removable holds (delete fold/re-entry/reflection → the Grothendieck
  group completion of the free commutative monoid on one generator carries a CommRing, and
  the monoid embeds; pure algebra).
- NO-GO / drift alarm: if I reach for `import Mathlib.Data.Int`/`Nat` as the CONTENT
  carrier → STOP, return to the trunk. ℤ is built FROM `Re`, never from Mathlib's `Int`.
  Mathlib `Quotient`/`Setoid`/`CommRing`/`CommSemiring` typeclasses + `ring` tactic are
  METALANGUAGE machinery operating on the DERIVED `Re` — allowed and encouraged.

## KILL (compile-cost budget — W9)
This is STRUCTURAL ALGEBRA (quotient + semiring/ring laws). It must NOT need the continuum
or any heavy ground-coordinate normalizer. Each obligation is a small `induction` (Re laws)
or a `ring` identity over the `Re` CommSemiring (quotient laws). KILL = ANY single
obligation that does not close in a few seconds with `induction`/`rfl`/`ring`/`Quotient.ind`
is an INSTRUMENT signal — decompose or reframe, never grind. No `maxHeartbeats` inflation.
Bank-as-you-go (W9.8): Re-semiring file compiles → commit; Z CommRing → commit; embedding →
commit. Reserve last ~400s: if ℚ-prep remains, child ℚ onto the chain tail.

## METALANGUAGE/CONTENT DISCLOSURE (state in handoff)
Derives the CONTENT ℤ: the object every result here is ABOUT is `Z`, a constructed quotient
of `Re × Re` (`Re` = the derived ℕ), carrying a PROVED `CommRing`, with NO Nat/Int/Rat/Real
content import. Does NOT (need not) purge metalanguage `Nat` (kernel `Fin`/universe arity) —
substrate, like `propext`.

## SCOPE (W3)
ℤ this run. On success, child ℚ-from-derived-ℤ (field-of-fractions closure) onto the chain
tail. Single-flight: `kanban_list` / link onto tail before creating.
