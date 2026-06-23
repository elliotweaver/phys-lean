# N9 — ℚ FROM THE DERIVED ℤ — FINDINGS (the as-built record)

## OUTCOME: BANKED (commit 645eb1f). Number tower rung 2 (ℚ) descends from the fold.

`Phys/Foundation/RationalTower.lean` derives the CONTENT ℚ as the multiplicative
(field-of-fractions) closure of the derived integers `Z` (N8), with NO Mathlib
number-system content import. Gate D0–D6 green, C27 bites, 296 theorems audited
foundations-only ⊆ {propext, Classical.choice, Quot.sound}.

## THE TRUNK ROUTE THAT WORKED (no fights — the N8 pattern ported directly)
The PREREG route held verbatim. The picture: N8's additive closure made every re-entry
undoable via negation = THE SWAP `(a,b)↦(b,a)` (the fold's reflection). ℚ makes every
nonzero multiplicative step undoable via the field closure, and ★ THE MULTIPLICATIVE
INVERSE IS THE SWAP `(p,q)↦(q,p)` — numerator↔denominator — the same reflection on the
multiplicative pairs. The additive swap reflects sign; the multiplicative swap reflects
scale. This is "one move, two closures": the fold's reflection realized additively (ℤ)
then multiplicatively (ℚ).

## THE ONE GATING RISK, MEASURED AND CLEARED FIRST (W9)
Per W9.2 (measure before commit), the integral-domain core was prototyped in isolation
(`scratch/domain.lean`, ~6s) BEFORE the field. `Z` has no zero divisors:
  - `Re.mul_ne_zero'` — counting has no zero divisors (cases on `step`).
  - `Re.add_comparable` — counting is linearly comparable (induction).
  - ★ `Re.mul_cross_ne` — `a≠b, c≠d ⟹ ac+bd ≠ ad+bc`: four comparability cases, in each
    the two sides differ by `s·t ≠ 0`, killed by cancellation (`add_cancel_zero`). THIS
    is the `Z`-no-zero-divisor content, traced entirely to `Re.add_right_cancel`/`step_inj`
    (N7/N8). Domain is DERIVED, never posited.
The `IsDomain Z` *typeclass-synthesis* path failed (a Mathlib instance-path quirk), but it
is NOT needed: the field of fractions only uses `mul_right_cancel₀`/`mul_left_cancel₀`,
which `NoZeroDivisors Z + Nontrivial Z` supply directly. Avoided that detour.

## DESIGN DECISIONS
- HAND-ROLLED the quotient (like N8's Grothendieck construction), NOT Mathlib's
  `FractionRing`/`Localization` — keeps the carrier visibly the localization of the
  DERIVED `Z` and the inverse visibly THE SWAP, and keeps `#print axioms` transparent.
- Used `IsField` (existential inverse) rather than a Classical `Inv` function: this makes
  the inverse LITERALLY the swap `q/p` exhibited in `mul_inv_cancel`, no `if p=0` guard.
  `Field Q := isField.toField` then supplies the `Inv`/`Field` instance (this is the only
  place `Classical.choice` enters — the inverse function — allowed substrate).
- Denominators: `NZ := {d : Z // d ≠ 0}` (subtype). Its `.val`/`.1` is `Subtype.val`;
  state the projection simp lemmas (`NZ.mul_val`/`NZ.one_val`) over `.1` to match.
- Every ring/field law: `Q.ind` + `mk` reduction lemmas + `linear_combination`/`ring`
  over the banked `Z.commRing` — the N8 pattern exactly.

## NON-VACUITY (W8)
- `half_mul_two`: `(1/2)·2 = 1` — `2` is invertible, an inverse `Z` lacks.
- ★ `half_not_ofZ`: `1/2` has NO integer preimage — a preimage `z` forces `z·2 = 1` over
  `Z`, i.e. an EVEN count = an ODD count (`a+a = step(b+b)`), impossible by the new parity
  lemma `Re.add_self_ne_step_add_self` (double induction, bottoms on `step ≠ void`, N7).
  ℚ STRICTLY extends `Z`, exactly as N8's `-1` strictly extended `Re`.
- Costume C27: the wrong closure `1/2 = 0` reduces (via `Q.mk_eq_zero`) to `(1:Z) = 0`,
  forced false (the goal `⊢ 1 = 0` remains). Bites.

## COMPILE COST (W9 — well within KILL budget)
Purely structural, no heavy normalizer, no `maxHeartbeats` inflation:
  - scratch domain.lean ~6s; scratch rat.lean ~6s (full field construction)
  - production RationalTower.lean standalone ~6.3s; incremental `lake build Phys` ~12.7s
    total (RationalTower 5.3s + Phys aggregator 3.0s).
Every obligation closes in seconds with `induction`/`cases`/`ring`/`linear_combination`/
`Quotient.ind`. KILL budget never approached.

## STANDARD CHECK (the second gate)
- UNBROKEN: `Q ← Z (N8) ← Re (N7) ← fold (N1)`. Domain derived, not posited. Only Mathlib
  MACHINERY (Quotient/Field typeclasses, ring/linear_combination/IsField) on the DERIVED
  `Z`. No `import Mathlib.Data.{Nat,Int,Rat,Real,Complex}` (grep-confirmed).
- COMPLETE: all proved, #print axioms ⊆ {propext, Classical.choice, Quot.sound}. No
  sorry/axiom/native_decide/bridge.
- PHYSICS-WORDS-REMOVABLE: delete fold/reflection/swap/counting/re-entry → "the field of
  fractions of the Grothendieck completion of the free commutative monoid on one generator
  is a Field, the ring embeds injectively, and the field strictly extends it with a
  multiplicative inverse of 2 (1/2 ∉ ℤ)." Pure algebra; no trunk word load-bearing.

## OWED (childed onto the chain tail, single-flight)
RE-GROUND the continuum work (N6 `Continuum.lean`/`CompletionContinuum.lean`, currently
over the imported ℚ) onto the DERIVED ℚ (`Phys.Foundation.Q`). The construction ports
verbatim — it is not torn down, only re-grounded. THEN the ℝ field-ops on `Cut`. The ⚠
NUMBER-TOWER gate flips RESOLVED once the continuum rests on the derived ℚ.
