# N77 PREREG — frozen GO/NO-GO + KILL before finalize

## Date
2026-06-26 (run 238, fresh — N76 fully landed, git clean at e621514)

## NODE TARGET (specified against what the chain ACTUALLY produced — ROADMAP §N77 FORWARD FRONTIER)
The ticket TARGET is the HEAVY group-manifold core (full existence ∀ g ∃ c u, g = specOpN c u +
global polar/KAK + connectedness + reverse surjectivity + Spin(9) exhaustion). MEASURE-FIRST
(W1/W9) re-specifies the IMMEDIATELY-BANKABLE forced advance:

The genuine obstruction to the FULL STVC existence is that STVC is 10-dim (EVEN), so a charpoly
has even degree 10 — N75's odd-degree(cubic) engine and N76's dim-3-only seed cannot root/seed it.
Under deflation the dimension descends 10→9→8→…; the ODD rungs get a guaranteed eigenpair from a
GENERAL odd-degree root engine. That general odd-degree root is exactly the missing lever that
generalizes BOTH N75 (cubic only) AND N76 (dim 3 only), and — via Mathlib's `IsRealClosed`
(FieldTheory/IsRealClosed/Basic.lean, `of_linearOrderedField`) — it lands the DEEP forced
identification that the DERIVED ℝ `Cut` is a REAL CLOSED FIELD.

## THE REFRAME (THE ONE LAW)
The general odd-degree root is NOT a Cardano/Sturm grind and NOT a new posit — it DISSOLVES through
the SAME `intermediate_value_Icc` engine that built N57 `cutSqrt` and N75 `cut_cubic_has_root`,
escalated from fixed degree (2, 3) to ARBITRARY odd degree. The Cauchy bound
`s = (∑_{i<n} |coeff i|) + 1` gives `f(s) ≥ 0` (dominance) and `f(−s) ≤ 0` (odd reflection,
`Odd.neg_pow`), IVT crosses zero. `IsRealClosed Cut` then follows from `of_linearOrderedField` with
(1) every nonneg a square (N57 `cutSqrt`) and (2) every odd-degree poly has a root (this node).

## WHAT WILL BE BANKED (production file Phys/Algebra/LorentzContinuumRealClosed.lean)
- eval_upper_nonneg / eval_lower_nonpos — the two Cauchy-dominance halves (the hard sub-obligations,
  MEASURED clean at ≤9s each).
- cut_odd_degree_has_root — ★ GENERAL monic odd-degree root over Cut (generalizes N75 cubic).
- cut_isSquare_of_nonneg — every nonneg is a square (from N57 cutSqrt).
- cut_exists_root_of_odd — every (non-monic too) odd-degree poly has a root.
- cut_isRealClosed : IsRealClosed Cut — ★★ THE HEADLINE: the derived ℝ Cut is a real closed field.
- dim_odd_has_eigenvector — ★ every endo of an ODD-finrank Cut-space has a nonzero eigenvector
  (generalizes N76 dim3_has_eigenvector to every odd dimension; the re-seeding lever for odd rungs).
- stvc not directly (STVC is even-dim); the odd-dim seed is the general re-seeding lever.

## GO / NO-GO
GO iff: all decls compile foundations-only [propext, Classical.choice, Quot.sound] vs built olean,
costume C108 bites a WRONG real-closed/odd-root/odd-seed claim with a numeric DISTINCT from the
banked battery (…C107 6=13), gate D0–D6 green, words-removable, single-flight preserved.
NO-GO → honest W1 dissolution ticket + block.

## KILL (W9 — instrument-failure budget)
KILL = 45s / obligation. If ANY single obligation exceeds 45s compile, it is an INSTRUMENT failure
(not theory) → MEASURE the smallest sub-obligation, DECOMPOSE, never inflate maxHeartbeats, never
brute. (Measured: all probes ≤9s; KILL not expected to be approached.)
NO inflated maxHeartbeats, NO native_decide, NO sorry, NO brute monolith.

## ANTI-TIMEOUT (W9)
Probes already clean. Plan: production file compiles → COMMIT (production + costume + wiring) →
run gate in BACKGROUND (poll log, do not block turn budget on D6) → child N78 + complete with turns
to spare. Checkpoint early.

## WORDS-REMOVABLE
Delete "Lorentz/spectral/eigen*/seed/dimension/rank/Spin/SO(9)/KAK/isometry/real-closed(as-physics)":
what remains is pure math — over the derived complete ordered field Cut, every nonneg is a square,
every odd-degree polynomial has a root, Cut is a real closed field (IsRealClosed Cut), and every
endomorphism of an odd-finite-dimensional Cut-vector space has a nonzero eigenvector. No statement
needs a physics word.
