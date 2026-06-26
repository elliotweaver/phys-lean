# N56 PREREG — frozen BEFORE compute

## Node
N56: the REVERSE finite-product surjectivity (polar/KAK g=k·exp(p)) + the full Spin(9)→SO(9)
exhaustion. Ticket priority order to MEASURE: (i) positive-definite square-root extraction over
the derived `Cut`; (ii) a concrete 2-plane SO(9) reachability via banked `biMulFun`; (iii) the
BvC-positivity skeleton. Reframe through the trunk (Born positivity) FIRST.

## THE KEY RECON FINDING (drives the node)
Across the ENTIRE Phys tree there is **no positivity fact about the Born self-overlap form**
(`grep nonneg|PosDef|0 ≤ gForm|sq_nonneg` over Phys → 0 hits). Yet "Born = self-overlap =
positivity" is a TRUNK PRIMITIVE, and the ROADMAP §N56 says the polar/reverse decomposition is to
be attacked FROM Born positivity. So the genuine, unbanked prerequisite that the WHOLE
polar/reverse direction rests on is:

  **the Born self-overlap form `gFormC` is positive-definite over the derived ℝ `Cut`.**

`Cut` is banked as `LinearOrder` + `Field` + `IsStrictOrderedRing` + `Archimedean` (squares ≥ 0,
ordered-field tactics available). `gFormC v v = reQC (v * star v) = (v·star v).re.re.re`, and over
an ordered field the self-overlap of a Cayley–Dickson double³ is the SUM OF THE 8 COORDINATE
SQUARES — manifestly ≥ 0, and = 0 iff every coordinate is 0 iff `v = 0`. This pins:
  • `gFormC v v ≥ 0` (Born self-overlap nonneg) — `gFormC_nonneg`
  • `gFormC v v = 0 ↔ v = 0` (positive-DEFINITE) — `gFormC_eq_zero_iff`
and what they FORCE about the continuum Minkowski form: the spacelike block of `QvC`/`BvC` is
negative-definite, pinning the (1,9) split — the structural fact the polar "boost part" needs.

## GO / NO-GO  (frozen)
GO (bank N56 as the Born-positivity / signature piece) iff ALL:
  G1. `gFormC v v ≥ 0` PROVED over `Cut`, foundations-only, NO Mathlib ℝ/ℂ content, NO sorry.
  G2. `gFormC v v = 0 ↔ v = 0` (positive-definiteness) PROVED.
  G3. At least ONE forced downstream structural consequence on the BANKED continuum form proved
      (e.g. `QvC (0,0,v) = -gFormC v v ≤ 0` for spacelike vectors, i.e. the space block is
      timelike-negative — the signature split; or the boost-part positivity skeleton `BvC`-side).
  G4. Words-removable: delete Lorentz/boost/Spin/SO(9)/isometry/signature/polar/positive-definite
      → pure math about `gFormC`/`QvC`/`BvC` over `Cut` and `O Cut`.
  G5. Costume C87 bites a WRONG positivity/definiteness/signature claim (false numeric).

NO-GO / DECOMPOSE: if the 8-square expansion is a W9 instrument wall (heavy `simp`+`ring` at CD
depth 3 won't close in bounded time), DECOMPOSE: bank the recursive level-by-level positivity
(`Dbl`→`H`→`O`) as separate bounded lemmas, or bank `gFormC_nonneg` alone + child the definiteness.

## KILL budget (W9)
- KILL any single tactic (`simp`/`ring`/`decide`) on the full 8-coordinate `gFormC v v` expansion
  that does not close in ≤ 60s in a bounded probe. If it KILLs → DECOMPOSE recursively
  (`Nrm` is additively `re·star re + im·star im` per level; bank `Dbl`-level nonneg, then `H`,
  then `O` by two additions of nonnegs — each bounded). NEVER inflate maxHeartbeats and wait.
- Measure the SMALLEST sub-obligation (the `Dbl Cut` level: `(d·star d).re = d.re² + d.im² ≥ 0`)
  FIRST. If even that is expensive, the monolith won't close.

## THE GLOBAL REMAINDER (childed N57, honest W1)
The actual KAK g=k·exp(p) finite-product EXHAUSTION (`qvIsomMonoidC` on the connected component
≤ `genIsomMonoidC2`) + the full `Spin(9)→SO(9)` surjectivity (every spacelike SO(9) rotation a
finite product of `biMulFun`) requires a positive-definite SQUARE ROOT over `Cut` (no banked
`sqrt`), connectedness, and Lie-group integration — none in Mathlib over `Cut`. This is the
genuine HEAVY core; it is childed onto the chain tail as an honest W1 dissolution ticket. N56
banks the Born-positivity / signature prerequisite it rests on.

## Routes attempted (anti-circling log)
- PROBE A (gFormC v v = sum of 8 coord squares, via simp[mul_re/star/Dbl] then ring): COMPILES,
  ~2s user. Tractable, NOT a W9 wall — the CD-depth-3 expansion closes with one `ring`.
- PROBE B (0 ≤ gFormC v v via `positivity` on the sum-of-squares form): COMPILES, cheap.
- PROBE C (gFormC v v = 0 → v = 0, via `ext <;> simp[zero coords]; nlinarith[8 sq_nonneg]`):
  COMPILES ~6.5s user. The `ext` cleanly splits v=0 into 8 leaf coord goals (CD/Dbl @[ext] chain);
  each closed by the 8-square nlinarith bag after simp-reducing `(0:O Cut).re.re.re` etc to 0.
  PITFALL: must `simp only [CD.zero_re,CD.zero_im,Dbl.zero_re,Dbl.zero_im]` before nlinarith,
  else the RHS reads `(re 0).re.re` not `0` and linarith fails.
- PROBE G3 (signature split: space-block QvC ≤ 0; nonzero space QvC < 0; pure-time QvC > 0):
  all COMPILE ~7s user. PITFALL: after `unfold QformC` do NOT add `simp only` (no progress —
  projections already reduce); go straight to nlinarith.
- VERDICT: GO. G1,G2,G3 all met, all cheap (no inflated heartbeats, no monolith). The Born =
  self-overlap = positivity trunk primitive dissolves the entire signature/polar foundation.
  Production target: LorentzContinuumPolar.lean banking nonneg + definite + the (1,9) signature.
