# N207 PREREG — frozen GO/NO-GO + KILL before compute

## Chain state
Run 438, first run on N207. HEAD clean at N206 gate-green (de8bcb2). N206 banked the
7-dim cross product `octCross x y = x·y + (gForm x y)•1 = Im(x·y)` on `ImO`, anticommutative,
closing, with the Lagrange norm identity `gForm(x⊗y)(x⊗y) = gForm x x·gForm y y − (gForm x y)²`.

## Candidate fronts measured (W9 measure-first, W4.5 look WIDEST)
- (a) HYPERCHARGE NORMALIZATION — REJECTED again (no convention-free Y anchor inside rank-2 g₂;
  N203 entanglement blocks a commuting-Cartan reading; risks a posited convention; THE ONE LAW/W8).
- (b) DERIVATION-INVARIANCE OF THE CROSS PRODUCT — CHOSEN (pending measure). Every derivation
  `D ∈ g₂ = Der(O ℚ)` (IsDerivQ) is an infinitesimal automorphism of the cross product:
  `D(octCross x y) = octCross (D x) y + octCross x (D y)`. CONNECTS N206 (vector product) ↔
  N16–N21 (derivation Lie algebra g₂) — the two faces of the exceptional structure share the
  SAME symmetry algebra. NON-MECHANICAL: the gForm-correction term `(gForm x y)•1` in octCross is
  killed by D PRECISELY because every derivation is SKEW-ADJOINT for the Born form
  (`gFormQ_skew`, N24/N26) — so the invariance = Leibniz (mult) + skew-adjointness (gForm),
  combining two DISTINCT banked invariances into a NEW one, not a single-rule restatement.
- (c) CONTRACTION / VECTOR-TRIPLE-PRODUCT identity — fallback. `octCross x (octCross x y)` etc.,
  connects cross ↔ alternativity (Alternative.lean alt_left). Clean non-vacuity (`= −u2`).

## GO / NO-GO
GO iff: the main invariance theorem (abstract IsDerivQ D) compiles clean foundations-only AND a
W8 non-vacuity tooth (the invariance recovers a genuinely nonzero quantity at a concrete banked
witness derivation + the orthonormal pair, OR a structural witness that the killed correction term
is genuine non-trivial content) compiles clean. If the abstract identity is clean but the witness
is heavy, fall back to (c) contraction identity (clean `= −u2` tooth).

NO-GO if the front measures as a trivial Leibniz restatement that does NOT use skew-adjointness
(then it WOULD be mechanical/vacuous; W8 reject) — verified FALSE: the correction term genuinely
requires gFormQ_skew.

## KILL
KILL = 90s/obligation, 240s/file in `lake env lean`. If any obligation exceeds, it is a W9
instrument wall — measure/decompose/reframe, do NOT inflate maxHeartbeats.

## Levers (all banked, confirmed over ℚ)
- `IsDerivQ D := ∀ x y, D (x*y) = D x * y + x * D y` (DerivationFinrank).
- `derivQ_one (D) (hD) : D 1 = 0` (DerivationUpperBound).
- `gFormQ_skew (D) (hD) (x y) : gForm (D x) y + gForm x (D y) = 0` (DerivationCompact, N24/N26).
- `octCross x y := x*y + (gForm x y)•1` + `octCross_mem_ImO`/`octCross_antisymm` (N206).
- `octo_quadratic x : x*x = (2 reQ x)•x − (gForm x x)•1`; `alt_left : assoc x x y = 0`;
  `mul_mul_left : x*(x*y) = (x*x)*y` (Alternative N5b) — for the (c) fallback.
- witness derivations: `witnessDerivQ`/`witnessDerivQ_isDerivQ` (DerivationFinrank);
  `D0E..D7E` + `_isDerivQ` (DerivationLowerBound).

## Costume (next id C239)
Distinct false numeric `some_value = 207` biting the chosen front's genuine relational content.
