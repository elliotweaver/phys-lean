# N11 FINDINGS — ℝ field-ops on the derived-ℚ completion `Cut`

## INC-1 BANKED (commit fc04246) — the additive ordered group
- `Phys/Foundation/ContinuumField.lean`. Gate D0–D6 green, 29/29 costumes (C29 bites),
  339 theorems foundations-only ⊆ {propext, Classical.choice, Quot.sound}.
- INC-0 prerequisite: `Q.instArchimedean` (derived from counting via `Re.toNat`, NOT
  imported). This was the load-bearing risk and is solid (compiles ~6s).
- Compile cost: the WHOLE file builds in ~5.6s. NOT a W9-heavy node — these are
  structural `linarith`/`nlinarith`/`induction`/`Nat.find` proofs on the DERIVED ordered
  field, each sub-second to a few seconds. No maxHeartbeats inflation, no monolithic brute.

## KEY API NOW BANKED (for the N12 worker to build on)
- `ContinuumQ.addS` / `Add Cut` / `add_S` (cut addition = gather of pairwise sums).
- `ContinuumQ` `Zero Cut` (= `Qcut 0`), `zero_S`.
- `ContinuumQ.negS` / `Neg Cut` / `neg_S` (negation = reflect upper complement).
- `ContinuumQ.approx` (cut-approximation, Archimedean) — REUSE for multiplication too.
- `ContinuumQ.add_neg_self`, `addCommGroup`, `linearOrder`, `IsOrderedAddMonoid Cut`.
- `ContinuumQ.Qcut_add`, `Qcut_strictMono`, `zero_lt_sqrt2`.
- `Q.instArchimedean`, `Z.instArchimedean`, `Re.toNat`, `Z.ofRe_eq_natCast`.

## THE CONVENTION (critical for N12)
`IsGather S` (banked N10) = OPEN lower Dedekind cut: `ne` (nonempty), `proper` (bounded
above / not everything), `down` (downward-closed), `nomax` (no greatest element — C6
eternal approach). The cuts are OPEN lower rays. Negation uses STRICT inequality in `negS`
to keep `-x` open. Multiplication must respect this open convention.

## N12 — THE REMAINING WORK (mult/inverse → Field; childed)
The heaviest part. Standard Dedekind product, sign-cased:
1. POSITIVE CONE first. Define the product of two NONNEGATIVE cuts (cuts `≥ Qcut 0`):
   `(x ⊙ y).S q := q < 0 ∨ ∃ a b, 0 ≤ a ∧ 0 ≤ b ∧ x.S a ∧ y.S b ∧ q < a*b` (or the
   standard "q ≤ 0 ∨ ∃ positive a∈x,b∈y, q < ab"). Prove `IsGather` (the nomax up-step
   uses `Qcut`-style midpoint or the `approx`/Archimedean lever; positivity of the
   derived ℚ via the banked `Q.isStrictOrderedRing`).
2. SIGN EXTENSION. Extend to all cuts by cases on sign (`0 ≤ x` vs `x < 0`, decidable via
   `LinearOrder Cut`), using negation: `x*y = ±(|x|⊙|y|)`. Define `Cut` abs via
   `max x (-x)` (Mathlib `Lattice`/`LinearOrder` gives max).
3. RING LAWS: mul_comm, mul_assoc, distributivity (`left_distrib`) — the distributive law
   over the sign cases is the fiddliest; reframe through the positive cone + additivity.
   `one = Qcut 1`, `mul_one`.
4. `CommRing Cut` (combine with banked `addCommGroup`).
5. INVERSE of a positive cut: `(x⁻¹).S q := q ≤ 0 ∨ ∃ r, ¬x.S r ∧ 0 < r ∧ q < 1/r`
   (reflect-and-reciprocate; the multiplicative analogue of negation, mirroring N9's
   inverse = the SWAP q/p). `mul_inv_cancel` for positive cuts; extend by sign.
6. `Field Cut` + `IsStrictOrderedRing Cut` (`mul_pos` from the positive-cone product).
7. CAPSTONE (INC-3): `sqrt2 * sqrt2 = Qcut 2` (or `ofQ 2`) — the analytic gap N6 forced,
   SOLVED in the field. Mirror of banked `Q.no_q_sq_two` (which says it has NO solution in
   the derived ℚ). This is the headline non-vacuity witness: `x²=2` HAS a solution in
   `Cut` = ℝ but not in the derived ℚ.
8. COSTUME: a WRONG field law (degenerate cut product, or `sqrt2² ≠ 2` in `Cut`, or
   `mul_pos` failing) → ⊢ False. One row in scripts/costume_manifest.tsv.

W9 KILL budget for N12: 90s/obligation. The positive-cone product is-a-gather and the
distributive law are the heaviest. MEASURE the smallest sub-obligation (positive-cone
product gather) in a bounded probe BEFORE committing. Bank-as-you-go: CommRing first
increment, Field/inverse second, capstone third — each compiling lemma → production +
commit immediately. Reframe through the trunk: the positive cone is where Born=self-overlap
positivity lives; the inverse is the multiplicative SWAP (N9) one level up.

REFRAME-FIRST reminder (THE ONE LAW): if the distributive law or the inverse "fights",
the cut shape / positivity framing is wrong, NOT the theory. The positive cone + the
banked `approx`/Archimedean lever + `Q.isStrictOrderedRing` are the trunk tools. Do NOT
reach for Mathlib's `Real`. Do NOT posit. NO bridge.
