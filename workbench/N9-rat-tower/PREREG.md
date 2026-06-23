# N9 — ℚ FROM THE DERIVED ℤ (`Z`) — PREREGISTRATION (frozen before compute)

## THE TARGET
Derive the CONTENT ℚ — the rationals — as the MULTIPLICATIVE (FIELD-OF-FRACTIONS)
closure of the banked derived integers `Z` (N8's ℤ-from-the-fold). NO
`import Mathlib.Data.{Nat,Int,Rat,Real,Complex}` used to GET the result, NO posited ℚ,
NO bridge. ℚ is CONSTRUCTED from `Z`; the `Field` structure is PROVED.

## THE TRUNK ROUTE (reframe through the fold FIRST)
- N8 banked: `Z = (Re×Re)/~` the Grothendieck completion, `Z.commRing`, with
  ★ NEGATION = THE SWAP `(a,b)↦(b,a)` = the fold's reflection (N1 `look x = -x`) —
  the ADDITIVE group closure that makes every re-entry UNDOABLE.
- THE TRUNK PICTURE (the multiplicative analogue): N8 made every ADDITIVE step
  undoable (negation = the swap). ℚ makes every NONZERO MULTIPLICATIVE step undoable —
  the field closure. The same "make the act reversible" move, now on MULTIPLICATION,
  localized away from the one irreversible point: zero (the void's own image, the count
  that cannot be undone multiplicatively). ★ THE MULTIPLICATIVE INVERSE IS THE SWAP
  `(p,q) ↦ (q,p)` — numerator ↔ denominator — exactly the fold's reflection realized
  on the multiplicative pairs, the mirror of N8's additive swap. The additive swap
  reflects sign; the multiplicative swap reflects scale.

## THE CONSTRUCTION (field of fractions — hand-rolled, mirroring N8)
1. ★ THE INTEGRAL DOMAIN CORE (the gating derived content; everything else is routine).
   `Z` has NO ZERO DIVISORS, derived from `Re` cancellation + comparability:
   - `Re.mul_ne_zero` : `a ≠ 0 → b ≠ 0 → a*b ≠ 0` (Re no zero divisors), by destructing
     both to `step`.
   - `Re.add_comparable` : `(∃ s, b = a + s) ∨ (∃ s, a = b + s)` (counting is linearly
     comparable), by induction.
   - `Re.mul_cross_ne` : `a ≠ b → c ≠ d → a*c + b*d ≠ a*d + b*c` (the cross-product
     parity that is exactly `Z`-zero-divisor-freeness), four cases on the comparability
     differences; in each the two sides differ by `s*t ≠ 0`, killed by cancellation.
   - ⇒ `instance Z.instNoZeroDivisors`, `instance Z.instNontrivial` (`(1:Z) ≠ 0` since
     `1+0 ≠ 0+0` would force `step void = void`), hence `IsDomain Z`.
2. THE FRACTION CARRIER `Q := Quotient ratSetoid`, underlying `Z × {d : Z // d ≠ 0}`,
   `(p,q) ~ (r,s) ↔ p*s = r*q`. Transitivity USES domain cancellation (mul by nonzero).
   Operations descend (well-defined):
   - `add (p,q)(r,s) = (p*s + r*q, q*s)`  (denominator nonzero via `Re→Z` mul_ne_zero)
   - `mul (p,q)(r,s) = (p*r, q*s)`
   - `neg (p,q) = (-p, q)`  (the additive swap rides along, inherited from `Z`)
   - `zero = (0,1)`, `one = (1,1)`
   - ★ `inv (p,q) = (q,p)` when `p ≠ 0`, else `0`  (THE MULTIPLICATIVE SWAP; the `p=0`
     guard via Classical decidability — `Classical.choice` is in the allowed trust base).
   `instance Q.field : Field Q` — every law a `ring`-over-`Z` identity after
   `Quotient.ind` + the reduction lemmas (the N8 pattern), with `mul_inv_cancel`
   (`p ≠ 0 → (p,q)*(q,p) ~ (1,1)`) and `inv_zero`.
3. NON-VACUITY / anti-W8:
   - the embedding `ofZ : Z → Q`, `p ↦ (p,1)`, INJECTIVE + a ring hom (ℤ sits inside ℚ).
   - ★ `half := (1, 2)` has an inverse `2` (`half * ofZ 2 = 1`) — a genuine element with
     NO `Z`-preimage under `ofZ` (`¬ ∃ z:Z, ofZ z = half`): ℚ STRICTLY extends `Z`.
   - costume: a WRONG closure — `half = 0` (1/2 collapses) → reduces to `1 = 0` in `Z`,
     forced false; FAILS to compile.

## WHAT WILL BE BANKED (production file)
- `Phys/Foundation/RationalTower.lean` — the domain core (`Re.mul_ne_zero`,
  `Re.add_comparable`, `Re.mul_cross_ne`, `Z` NoZeroDivisors/Nontrivial/IsDomain), the
  setoid + `Q`, the operations (inverse = the multiplicative swap), `instance Field Q`,
  the injective ring embedding `ofZ`, the `half` non-vacuity witnesses.

## GO / NO-GO
- GO if: `IsDomain Z` + `Field Q` + the injective ring embedding + the `half` witnesses
  all compile foundations-only (`#print axioms` ⊆ {propext, Classical.choice, Quot.sound});
  costume bites; gate D0–D6 green; physics-words-removable holds (delete fold/reflection/
  swap → the field of fractions of the Grothendieck completion of the free comm monoid on
  one generator carries a Field, the ring embeds injectively, the field strictly extends
  it with a multiplicative inverse of 2 — pure algebra).
- NO-GO / drift alarm: if I reach for `import Mathlib.Data.Rat`/`Int`/`Nat` as the CONTENT
  carrier → STOP, return to the trunk. ℚ is built FROM `Z`, never from Mathlib's `Rat`.
  Mathlib `Quotient`/`Setoid`/`Field`/`CommRing` typeclasses + `ring`/Classical decidability
  are METALANGUAGE machinery operating on the DERIVED `Z` — allowed and encouraged.

## KILL (compile-cost budget — W9)
STRUCTURAL ALGEBRA (quotient + field laws over the derived `Z`). It must NOT need the
continuum or any heavy ground-coordinate normalizer. Each obligation is a small
`induction`/`cases` (Re lemmas) or a `ring` identity over `Z.commRing` after
`Quotient.ind` + reduction lemmas. KILL = ANY single obligation that does not close in a
few seconds with `induction`/`cases`/`ring`/`Quotient.ind` is an INSTRUMENT signal —
decompose or reframe, never grind. No `maxHeartbeats` inflation. Bank-as-you-go (W9.8):
domain core compiles → commit; `Field Q` → commit; embedding + witnesses → commit.
Reserve last ~400s: if the `Field` inverse half remains hard, child it onto the chain
tail and complete as "decomposed: ℚ ring done, inverse childed."

## METALANGUAGE/CONTENT DISCLOSURE (state in handoff)
Derives the CONTENT ℚ: the object every result here is ABOUT is `Q`, a constructed
quotient of `Z × {nonzero Z}` (`Z` = the derived ℤ), carrying a PROVED `Field`, with NO
Nat/Int/Rat/Real content import. Does NOT (need not) purge metalanguage `Nat` (kernel
`Fin`/universe arity, `nsmulRec`/`zsmulRec` scalar-arity) — substrate, like `propext`.

## SCOPE (W3)
ℚ this run. On success, child the next rung — re-ground the N6 continuum (Cut over the
imported ℚ) onto the DERIVED ℚ, and/or the ℝ field-ops — onto the chain tail.
Single-flight: board confirmed single-flight (only this task running) before creating.
