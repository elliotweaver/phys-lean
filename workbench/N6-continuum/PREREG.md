# PREREG — N6-pre: the STANDING CONTINUUM GATE (increment 1)

*Frozen contract for this run. The continuum is an OUTPUT to be DERIVED from the fold,
never an INPUT to be posited. ℝ may NOT be imported to get a result.*

## The target (this increment only — the node is W3-decomposed by design)

The gate asks: derive the continuum from the fold's GATHER OF CLOSURES, or report
non-derivability as a FINDING. This is far too big for one run. Increment 1 is the
**FORCED GAP** — the obstruction half, mirroring exactly how N2 rung-1 first proved the
OBSTRUCTION (`sqrt_fold_not_on_line`, `no_foldRoot_dim1`) before the RESOLUTION (doubling).

**Theory-native framing (the trunk, not classical Dedekind for its own sake):**
- The fold misses itself (N1 `fold_self_blind`: the look-back has no nonzero fixed point).
- Covering the miss = a **closure**: bracket where the missed point "should be" by ground
  approximants from below — the downward-closed lower set.
- The **gather of closures** = that lower set, which coheres LOCALLY: downward-closed,
  proper, and **no greatest element** (`nomax`) — this `nomax` IS the trunk's C6 *eternal
  approach*: you can always get strictly closer, there is no best/attained element.
- The **local→global / sheaf-like failure**: the gather coheres locally yet has **no
  coherence point in the ground ℚ** — the eternal approach attains nothing in the ground.
  The continuum is exactly what supplies the missing coherence point.

Increment 1 proves: **the ground ring ℚ (the cascade's stand-in base) is NOT
coherence-closed** — there is a genuine, locally-coherent gather of closures with no ground
coherence point. This is the forced obstruction that makes the continuum necessary, derived
WITHOUT positing ℝ and WITHOUT `import Mathlib...Real`.

## GO (all required to bank increment 1)
- G1. A Lean framework over the cascade ground `ℚ`: `IsGather` (downward-closed, proper,
      no-max predicate — the gather of lower closures, locally coherent) and `IsCoherent`
      (realized by a ground coherence point).
- G2. `sqrtTwoGather_isGather`: the canonical analytic gap is a GENUINE gather (ne + proper
      + down + nomax all proved — non-vacuous, the gather is not degenerate).
- G3. `sqrtTwoGather_not_coherent`: THE FORCED MISS — that gather has NO ground coherence
      point. Engine: `no_rat_sq_two` (ℚ has no square root of 2), proved ℝ-free.
- G4. Foundations-only: `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`; NO
      `import Mathlib...Real`, NO `Real`, NO posited ℝ, NO bridge/at-grade marker.
- G5. A costume that BITES: a garbage witness asserting the ground DOES contain the
      coherence point (or that the gather is improper) FAILS to elaborate.
- G6. Gate D0–D6 green; physics-words-removable (delete fold/closure/gather/continuum →
      pure order theory: a Dedekind lower cut on ℚ has no rational supremum).
- G7. The RESOLUTION (construct the completion = the type of gathers/cuts, give it the
      ordered-field structure, prove IT is coherence-closed = completeness) is childed onto
      the chain tail as increment 2. The gate row stays UNRESOLVED until that lands.

## NO-GO / KILL (a fight here is an INSTRUMENT/FRAMING failure — THE ONE LAW, never theory)
- K1. The moment I reach for `import Mathlib.Data.Real.Basic` (or any `Real`) to MAKE a
      result work → STOP. That is the exact drift this gate exists to catch. The continuum
      is derived, not assumed.
- K2. If `no_rat_sq_two` or the gather lemmas fight the kernel (timeout/blowup): that is a
      W9 instrument wall — measure the smallest sub-obligation, decompose, never inflate
      maxHeartbeats. (Measured cheap in scratch: all close in <10s with `nlinarith`/`omega`.)
- K3. NO weakening of the claim to close it (W5). The miss is `¬ IsCoherent`, stated for a
      genuine gather; I do not shrink it to a degenerate predicate to make `nomax` trivial.
- K4. If the completion construction (increment 2) RESISTS after a theory-native attempt →
      the status is *route NOT YET found* (reframe through the trunk / W5 / child a dedicated
      route-finding node), NEVER "non-derivable" and NEVER papered over by positing ℝ. The
      theory generates the continuum; the only live question is how/when the route is found.

## Costume (the garbage witness that MUST be rejected)
`Counterexamples/ContinuumGroundCoherentCostume.lean`: assert the ground ℚ DOES contain the
coherence point of the canonical gather, i.e. `∃ c : ℚ, c^2 = 2`. If this compiled, the gap
would close in ℚ and the continuum would NOT be forced by this gather — the precise
vacuity/wrong-stop the battery exists to catch. Reduces via `no_rat_sq_two` to a false core.
