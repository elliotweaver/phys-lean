# N10 — RE-GROUND THE CONTINUUM ONTO THE DERIVED ℚ — PREREGISTRATION (frozen)

Task: t_ea3290ed. Parent: N9 (t_5e53ff75). Frozen before compute.

## THE TARGET
Re-ground N6's continuum (`Continuum.lean` + `CompletionContinuum.lean`, currently over
Mathlib's imported `ℚ`) onto the DERIVED ℚ = `Phys.Foundation.Q` (N9), so the ℝ rung rests
on the fold, not on imported `Rat`. NO `import Mathlib.Data.{Nat,Int,Rat,Real,Complex}` used
to GET the result.

## THE BINDING PREREQUISITE (the real content)
The continuum (Dedekind cuts) needs the ground as a LINEARLY ORDERED FIELD. The derived `Q`
has `Field` (N9) but NO ORDER. So DERIVE the order tower from `Re`'s comparability (banked
`Re.add_comparable`, `Re.sub_exists_of_ne`):
  (R1) order on `Re` (the derived ℕ): `Re.le a b := ∃ c, b = a + c` → `LinearOrder Re`,
       canonically ordered (compat with +, ·; `0 ≤ a` always).
  (R2) order on `Z` (the derived ℤ): via `Z.Nonneg`, → `LinearOrder Z` + `IsStrictOrderedRing Z`.
  (R3) order on `Q` (the derived ℚ): via `Q.Nonneg` (same-sign numerator/denominator),
       → `LinearOrder Q` + `IsStrictOrderedRing Q` = the derived ℚ as a LINEAR ORDERED FIELD.

## SCOPE OF THIS RUN (W3 — decompose aggressively)
Primary deliverable: **the order tower R1→R2→R3, banked** — the derived ℚ as an ordered field
(`Field Q` from N9 + `LinearOrder Q` + `IsStrictOrderedRing Q`), order DERIVED from `Re`
comparability. Bank-as-you-go: Re order → commit; Z order → commit; Q order → commit.
If the continuum port (cuts/gathers/completeness + no-sq-2 over derived Q) does not also fit,
CHILD it onto the chain tail and complete as "decomposed: derived-ℚ order banked, continuum
port childed." Reserve last ~400s to decompose.

Stretch (only if order lands with budget): port `Continuum.lean`/`CompletionContinuum.lean`
onto derived `Q`, re-proving the `q²=2` obstruction over derived `Q` (integer descent on the
derived `Z`, using banked `Re` parity `add_self_ne_step_add_self`), the cuts, completeness,
derived √2 as a new completion element.

## GO / NO-GO
- GO if: each order rung compiles foundations-only (#print axioms ⊆ {propext, Classical.choice,
  Quot.sound}), order DERIVED from `Re.add_comparable` (NOT posited, NOT Mathlib `Rat`/`Int`
  order), strictly-monotone field laws PROVED.
- NO-GO / return-to-trunk (W5) if: the order "fights" → I am reaching for Mathlib's `Rat`/`Int`
  order as the content ground. STOP, the order MUST descend from `Re`'s one-way comparability
  (`add_comparable`). Never posit `≤`.

## KILL / COMPILE-COST BUDGET (W9)
Order proofs are PURELY STRUCTURAL (induction on `Re`, quotient lifts, `ring`/`omega`-style on
counting). Baseline: N9 RationalTower scratch ~6s. KILL: if any single order-instance proof
obligation exceeds **90s** OR uses a monolithic brute normalizer on an expanded quotient goal,
that is the W9 instrument wall → MEASURE the smallest sub-obligation, DECOMPOSE into bounded
lemmas, reframe through the trunk (the order is `Re`-comparability lifted, NOT a coordinate
bash). Total per-file scratch compile expected < 30s; if a file exceeds ~120s, split it.
Never run an unbounded compile inside the turn budget — measure in a bounded probe first.

## ANTI-VACUITY (W8) + COSTUME
The derived order must be NON-TRIVIAL: `0 < 1` in `Q`, the order is the field-compatible one
(not the discrete/degenerate order). Costume Cnn: a WRONG order (e.g. `Q` order degenerate so
`1 ≤ 0`, or the continuum's derived √2 IS rational over derived Q / the cut trivial) FAILS to
compile. One row in scripts/costume_manifest.tsv.

## STANDARD CHECK (the second gate)
- UNBROKEN: order derives from `Re.add_comparable`/`sub_exists_of_ne` (banked) → `Z` → `Q`.
  Nothing posited but the fold.
- COMPLETE: all order/strict-ordered-ring laws PROVED; foundations-only verified by #print axioms.
- PHYSICS-WORDS-REMOVABLE: delete fold/counting/re-entry/comparability → the field of fractions
  of the Grothendieck completion of the free comm monoid on one generator is a linearly ordered
  field whose order extends the monoid's algebraic (difference) order. Pure order algebra.

## ROUTES TRIED (anti-circling log — append, never re-run a dead route)
- (start) Mathlib v4.29.1: `LinearOrderedField` is DEPRECATED → use
  `[Field K] [LinearOrder K] [IsStrictOrderedRing K]`. `IsStrictOrderedRing` in
  Mathlib/Algebra/Order/Ring/Defs.lean.
