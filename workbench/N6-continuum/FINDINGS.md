# FINDINGS — N6-pre: the STANDING CONTINUUM GATE, increment 1

## What was attacked
The gate (STANDARD §3, ROADMAP STANDING DEPENDENCY GATE): derive the continuum
(ℝ + completeness) from the fold's GATHER OF CLOSURES — the ONE outcome. ℝ may NOT
be posited; NO `import …Real` used to get a result. If the route resists it is
*route not yet found*, never "non-derivable".

## Outcome: increment 1 banked — the FORCED GAP

Per the sharpened gate policy (STANDARD §3 / ROADMAP, as of this run): the continuum
has exactly ONE outcome — it is DERIVED from the fold. "Report non-derivability" /
"honest finding of failure" is FORBIDDEN (standard-scientific skepticism leaking in,
treating the one axiom as a hypothesis on trial). When the route resists, the only
honest status is **route NOT YET found** (reframe / W5 / child a route-finding node).

The continuum problem is far too big for one run, so it is W3-decomposed exactly as
N2 rung-1 was: prove the OBSTRUCTION first, then the RESOLUTION (childed). This run
banked the obstruction half, foundations-only, NO ℝ. The route to the RESOLUTION is
specified (build the completion type, prove completeness) and childed — route found,
in progress, never declared unreachable.

### Banked (production: `Phys/Foundation/Continuum.lean`)
- `no_int_sq_two`, `no_rat_sq_two` — the cascade ground ring `ℚ` cannot solve
  `x² = 2`, proved **ℝ-free** (Mathlib's `irrational_sqrt_two` is over ℝ and was
  deliberately NOT used). A reduced `q` with `q²=2` has `den = 1` (via
  `Rat.den_pow`), hence is an integer; `no_int_sq_two` bounds it in `[-2,2]` and
  finishes by `omega`. This is the analytic-order analogue of N2's
  `sqrt_fold_not_on_line`: the ordered ground cannot solve a square equation the
  structure demands.
- `IsGather` (downward-closed, proper, no-max predicate on `ℚ` = a Dedekind lower
  cut = the gather of lower closures, locally coherent) and `IsCoherent` (realized
  by a ground coherence point `c`: `S q ↔ q < c`).
- `sqrtTwoGather_isGather` — the canonical gap IS a genuine gather (non-vacuity):
  all four clauses proved; the `nomax` up-step is the Heron/mediant `(2q+2)/(q+2)`
  (the trunk's C6 eternal approach — always a strictly closer ground approximant).
- `sqrtTwoGather_not_coherent` — ★★ THE FORCED MISS: that gather has NO ground
  coherence point. A coherence point `c` would force `c²=2` (ruling out `c²<2` by
  `c∈S→c<c`, and `c²>2` by the Heron down-step `(c²+2)/(2c)<c`), impossible by
  `no_rat_sq_two`. The local→global / sheaf-like failure: a locally-coherent gather
  whose eternal approach attains nothing in the ground.
- `ground_not_coherence_closed` — the gate as a theorem: `∃ S, IsGather S ∧ ¬
  IsCoherent S`. The obstruction that FORCES the continuum, with NO posited ℝ.

### Costume that bites (C23)
`Counterexamples/ContinuumGroundCoherentCostume.lean`: asserts `∃ c : ℚ, c²=2` (the
ground DOES contain the coherence point — the gap closes in `ℚ`). Literal negation
of `no_rat_sq_two`; leaves goal `⊢ False`, rejected at the math field. Guards W8: if
this compiled, the gather would be coherent in the ground and the continuum would not
be forced by it — and it is precisely the move a future node would use to silently
smuggle ℝ.

### Axioms
All five banked theorems: `[propext, Classical.choice, Quot.sound]` — foundations-only.

## SIDE FINDING (recorded honestly — not papered over)
Reconnaissance of the existing scaffolding found that **N2 rung-1
(`Phys/Cascade/ComplexUnit.lean`) already imports and USES `ℝ`** in its motivational
why-double law: `foldRoot_forces_even_dim` (`Module ℝ`, `finrank ℝ`, `LinearMap.det`),
`J₂` on `ℝ × ℝ`, `no_foldRoot_dim1`. These are exactly the "real-linear scaffolding
stand-in" the gate flags — those particular theorems descend from `Real`, a
Mathlib-given object, not from the fold. The LOAD-BEARING cascade spine
(`Dbl`/`CD`/`O ℚ` → all of N2b–N5) is over `ℚ`/general `CommRing` and does NOT touch
`ℝ`, so the chain's algebraic crown is clean. But the why-double *motivation* in
ComplexUnit is an ℝ-dependency that the continuum, once DERIVED (increment 2+), should
ideally REPLACE — re-derive the even-dimension obstruction over the DERIVED continuum
(or over the ground directly) rather than over Mathlib's `ℝ`. Flagged for the
resolution phase; it does not affect the algebraic chain N2b–N5.

## What is OWED (childed onto the chain tail — the RESOLUTION half)
The completion construction: build the TYPE of gathers/cuts itself, give it the
ordered-field structure, and prove IT is coherence-closed (every gather of ITS
elements has a coherence point) = COMPLETENESS — the continuum DERIVED, not posited.
Then revisit the ComplexUnit ℝ-creep above. The gate row stays UNRESOLVED until the
completion lands; this increment claims ONLY the forced gap, never that ℝ is derived.

## Anti-circling record (routes)
- `irrational_sqrt_two`: DEAD for our purpose — it is stated over ℝ; using it would
  import `Real`, the exact forbidden move. Re-derived the rational miss ℝ-free instead.
- `Rat.not_isSquare_*`: no such lemma in this Mathlib (probed, unknown constant).
  The num/den `den_pow` route is the clean ℝ-free path; measured <10s, no instrument wall.
