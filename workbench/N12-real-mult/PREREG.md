# N12 PREREG — ℝ field MULTIPLICATION/INVERSE on the derived-ℚ completion `Cut`

FROZEN before compute. The fold is the only posit. NO posited ℝ, NO Mathlib
number-system content import (`Mathlib.Data.{Nat,Int,Rat,Real,Complex}`). Mathlib
as MACHINERY (Field/LinearOrder/IsStrictOrderedRing typeclasses, order/field
tactics, Archimedean) on the DERIVED `Cut`/`Q` is allowed.

## THE TARGET
Make `ContinuumQ.Cut` (banked N10: order-complete linear order; N11: additive
ordered group + `Archimedean Q`) into a LINEARLY ORDERED FIELD with the lub
property, over the DERIVED ℚ. Decompose aggressively (W3); bank-as-you-go (W9.8).

## THE TRUNK-NATIVE ROUTE (reframe FIRST — THE ONE LAW)
- The POSITIVE CONE is where Born = self-overlap = positivity lives. Define the
  product of cuts on the positive cone first:
  `mulNonnegS x y q := q < 0 ∨ ∃ a b, 0 ≤ a ∧ 0 ≤ b ∧ x.S a ∧ y.S b ∧ q < a*b`.
  This is a gather for ANY x,y (it computes the RIGHT product only on nonnegatives).
- THE CAPSTONE (`√2 * √2 = 2`) is the ETERNAL APPROACH (C6) made load-bearing:
  the density-of-squares lemma `∃ c≥0, q < c² < 2` for `0≤q<2`, proved by the
  HERON contraction `c' = (2c+2)/(c+2)` whose gap `2 - c'² = 2(2-c²)/(c+2)²`
  HALVES each step (`(c+2)² ≥ 9` for `c ≥ 1`), closed by the banked `Archimedean Q`
  (`exists_pow_lt_of_lt_one`). The approach converges; Archimedean closes it.
- SIGN EXTENSION via `LinearOrder Cut` + the banked negation; `|x| = max x (-x)`.
- INVERSE = the multiplicative SWAP one level up (mirrors N9's inverse = swap q/p).

## INCREMENTS (bank-as-you-go; each compiling piece → production + commit)
- **A1** `mulNonnegS`/`mulNonnegGather`/`pmul` (positive-cone product, Cut→Cut→Cut)
  + `pmul_comm`. [MEASURE A1 gather FIRST — smallest sub-obligation, W9.2]
- **A2** `sq_dense` (Heron + Archimedean density of squares) + **CAPSTONE**
  `pmul_sqrt2_sqrt2 : pmul sqrt2 sqrt2 = Qcut 2`. THE HEADLINE NON-VACUITY.
- **B**  sign-extended `Mul Cut` + `One Cut` + reduction-to-cone; field-level
  `sqrt2 * sqrt2 = Qcut 2`.
- **C**  ring axioms → `CommRing Cut`.
- **D**  inverse of a positive cut → `Field Cut` + `IsStrictOrderedRing Cut`.
If C/D remain when ~400s of turn budget left: child onto the chain tail (W3),
complete as "decomposed". A1+A2 is the safety floor (the headline capstone banked).

## GO / NO-GO
- GO if: pieces compile foundations-only (`#print axioms ⊆ {propext, Classical.choice,
  Quot.sound}`), NO number-import, NO posited ℝ, NO bridge, costume bites, gate green.
- NO-GO / STOP-and-reframe if: a proof "fights" → return to the trunk (the cut
  shape / positivity framing is wrong, NOT the theory). NEVER add a hypothesis,
  NEVER weaken the target, NEVER reach for Mathlib's `Real`.

## KILL BUDGET (W9 — instrument-cost)
- 90s / single obligation. If any one obligation exceeds 90s compile: STOP, it is
  an instrument wall — MEASURE the smallest sub-piece, DECOMPOSE, prefer a
  structural reduction through banked identities over coordinate expansion. Do NOT
  inflate maxHeartbeats. Do NOT re-run a route already shown to blow up.
- N11 showed this construction is structurally LIGHT (~6s/file). Expect the same;
  if it is NOT light, the framing is wrong (THE ONE LAW).

## COSTUME (must BITE — a wrong field law fails to compile)
A WRONG capstone value (e.g. `pmul sqrt2 sqrt2 = Qcut 3`, or the cut contains a
value ≥ 2) → reduces to a false `Q` inequality. One row in costume_manifest.tsv.
