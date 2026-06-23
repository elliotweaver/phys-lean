# N11 PREREG — ℝ FIELD-OPS on the derived-ℚ completion `ContinuumQ.Cut`

FROZEN before compute. Task t_714ba117. Parent N10 (t_ea3290ed).

## TARGET
Make `Phys.Foundation.ContinuumQ.Cut` (banked: PartialOrder + totality `le_total` +
Dedekind order-completeness `completion_coherence_closed`) into an ORDERED FIELD with
the lub property — ℝ as the Dedekind completion of the DERIVED ℚ. NO posited ℝ, NO
`import Mathlib.Data.{Nat,Int,Rat,Real,Complex}` as content. Mathlib only as MACHINERY
(typeclasses + order/field tactics) on the DERIVED `Cut`/`Q`.

## THE TRUNK PICTURE (read OUT of the math)
N8 made every additive re-entry undoable (negation = the swap). N9 made every nonzero
multiplicative step undoable (inverse = the swap q/p). The COMPLETION's `+` is the
gather of pairwise sums; its NEGATION is the fold's reflection one level up (reflect the
upper complement); its `·` mirrors N9's multiplicative closure on the positive cone.
The cut for √2 — the point the derived ℚ MISSED (banked `sqrtTwoGather_not_coherent`) —
becomes an actual square root IN the completion: the gap the ground could not close, the
field does.

## DECOMPOSITION (W3 — bank-as-you-go, W9.8)
- **INC-0 (prerequisite): `Archimedean Q`.** The derived ℚ is Archimedean — DERIVED from
  counting (`Re` induction: every count ≤ some metalanguage `n•1`), lifted to `Z` then
  `Q` via `archimedean_iff_nat_le`. The Dedekind additive-inverse law needs it.
- **INC-1 (THIS run, primary bankable): the ADDITIVE ORDERED GROUP on `Cut`.**
  Add (`{a+b | a∈x, b∈y}`), Zero (`Qcut 0`), Neg (reflect the complement:
  `(-x).S q := ∃ r, ¬x.S r ∧ q < -r`), the cut-approximation lemma (Archimedean),
  `x + (-x) = Qcut 0`, comm/assoc → `AddCommGroup Cut`; `add_le_add_left` →
  `IsOrderedAddMonoid Cut`; `LinearOrder Cut` (upgrade banked PartialOrder via `le_total`).
  DELIVERABLE: `Cut` is a Dedekind-complete linearly ordered abelian group.
- **INC-2 (likely childed): MULTIPLICATION + INVERSE → `Field Cut` + `IsStrictOrderedRing Cut`.**
  Positive-cone product, sign extension, distributivity, inverse of a positive cut.
- **INC-3 (capstone, with INC-2): `sqrt2 * sqrt2 = Qcut 2`** in the field — the analytic
  gap N6 forced, SOLVED in the completion (mirror of banked `Q.no_q_sq_two`).

## GO / NO-GO
- GO if INC-0 (`Archimedean Q`) compiles foundations-only AND the cut-approximation +
  additive-inverse lemma compiles in scratch. These are the load-bearing risks.
- Bank INC-1 (additive ordered group) if it lands; child INC-2/INC-3 onto the tail.
- NO-GO / reframe (THE ONE LAW) if the additive inverse "fights": the framing (cut shape
  / neg definition) is wrong, NOT the theory — return to the standard open-cut conventions
  the banked `IsGather` already uses (nonempty, proper, down-closed, no-max).

## KILL (W9 compile-cost budget)
- Per-obligation KILL: **90s**. Any single tactic/lemma exceeding 90s ⟹ INSTRUMENT
  failure: MEASURE the smallest sub-obligation, DECOMPOSE, never inflate maxHeartbeats.
- These proofs are `linarith`/`nlinarith`/`induction`/`Nat.find` on the DERIVED ordered
  field — expected sub-second to a few seconds each. A blowup is a SMELL the framing is
  coordinate-bashy; reframe structurally.
- Reserve last ~400s of the run to decompose + child + complete honestly (never run out
  of turns mid-task — auto-blocks).

## COSTUME (one row in scripts/costume_manifest.tsv; must BITE)
A WRONG field/group law fails to compile — e.g. `Cut` additive inverse degenerate
(`x + (-x) ≠ 0`), or (if INC-2 lands) `sqrt2² ≠ 2` in `Cut`, or the order not
field-compatible. PASS_SIGNATURE ⊢ False.

## STANDARD CHECK (applied before any "done")
- UNBROKEN: every object from the banked `Cut`/`Q` API or Mathlib machinery; nothing posited.
- COMPLETE: `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`; no sorry/axiom/native_decide.
- PHYSICS-WORDS-REMOVABLE: delete fold/gather/miss/completion/continuum → the Dedekind
  completion of a derived linearly ordered Archimedean field is a Dedekind-complete
  linearly ordered field strictly extending it (the √2 cut squares to 2). Pure order/field
  theory; no trunk word load-bearing.
