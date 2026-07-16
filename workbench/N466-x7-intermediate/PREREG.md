# PREREG — N466 / X7 (arc-X EXACT DRESSING): α(M_Z) and sin²θ_W(M_Z), the intermediate readings

## FRONT CHOSEN
The M_Z-scale readings 1/α(M_Z) and sin²θ_W(M_Z) as INTERMEDIATE way-points of the SAME
band-tower assembly banked in X6 (N465), read at a further band edge (μ = M_Z) rather than at
the endpoint (zero momentum).

## THEORY-NATIVE JUSTIFICATION (fold → node, each arrow forced)
- The coupling IS the per-channel Born self-overlap of the gather (X1/N313), "running" = that
  self-overlap RESOLVED at a scale (X2/N461), assembled across the finite band tower down from
  the octonion ceiling 42 (X6/N465: invAlphaZero = 42 + Σ_bands κ·census·cutLog(ratio)).
- An INTERMEDIATE reading at a band edge μ is the octonion ceiling PLUS the screening of the
  bands strictly ABOVE μ — i.e. a PREFIX PARTIAL SUM of the tower. This is a genuinely NEW,
  exact mathematical fact X6 did not have: the tower is ADDITIVE over List.append, so
      invAlphaZero (top ++ low) = invAlphaZero top + totalScreening low
  makes "the reading at a band edge" a well-defined derived object, monotone in scale
  (screening runs 1/α UP as scale drops: 42 ≤ intermediate ≤ zero-momentum).
- The electroweak band edge (μ = v) has the banked EXACT cutPi-free way-point 1582/27 (X6). The
  M_Z reading = that anchor + the sub-band screen bandScreen(depth, v/M_Z) — an exact structural
  expression; the sub-EW ratio v/M_Z is a derived real currently banked only as bounds →
  route-NOT-YET-FOUND for the FULL numeral (127.955), enumerated for X10, NEVER asserted/fitted.
- The Weinberg angle at M_Z uses the banked sinSqRunExact (X2/N342): matter-stationary 3/8;
  the non-abelian-reduced isospin depth runs it strictly below 3/8 (toward 0.231). Same
  mechanism at the M_Z band edge.

## ANTI-BULLSHIT GATE (honest)
- Standard version: standard EW physics computes 1/α(M_Z), sin²θ_W(M_Z) by integrating TWO
  one-loop RGEs with measured b-coefficients and measured thresholds, then MEASURES the hadronic
  input for the ~2×10⁻¹⁰ bar. The theory DOES: dissolves the loop into the finite band-tower
  partial sum (X6 mechanism), so "the intermediate reading" is a prefix partial sum of an EXACT
  derived tower — no measured β, no measured thresholds in the structure.
- Words-removable: delete coupling/Weinberg/M_Z/electroweak/isospin → the tower reading at any
  PREFIX of a finite band list is 42 + the prefix screening sum, monotone under appending
  nonneg-screening bands; at the banked-exact top band it is 1582/27 + the sub-band screen; the
  mixing function is 3/8 stationary at matter depth, < 3/8 at reduced depth. Pure real analysis
  on Cut. NO physics word load-bearing. PASS.
- Free-floating check: every TYPE mentions banked derived objects (invAlphaZero, totalScreening,
  bandScreen, chargeTraceDepth, topBandRatio, sinSqRunExact, isoDepth over Cut). NOT generic. PASS.
- NOT a trivial restatement of X6: X6 had invAlphaZero + the top-band value; X7 adds (a) the
  append-additivity / way-point decomposition (NEW), (b) the M_Z reading = anchor + sub-band, (c)
  the Weinberg reading at M_Z from a different banked module (N342). Genuinely new theorems.

## GRADE (honest, route COMPLETE vs route NOT-YET-FOUND)
- THEOREM-EXACT NOW: the way-point additivity/decomposition, the monotonicity (42 ≤ intermediate
  ≤ zero-momentum), the M_Z structural reading (1582/27 + sub-band screen), the Weinberg matter-
  stationary 3/8 and the departure-down sign.
- route-NOT-YET-FOUND (enumerate for X10, NEVER assert/fit): the FULL numerals 1/α(M_Z)≈127.955
  and sin²θ_W(M_Z)≈0.23122 need the sub-EW scale ratio v/M_Z (banked only as bounds) and the
  non-abelian depth-reduction magnitude — inherited from X6's grade, not a new axiom/number.
- 127.955 / 0.23122 / measured α / measured sin²θ_W = REMOVABLE PROSE / costume ONLY (G2).

## TEETH (W8)
- invAlphaZero_intermediate_strict_lt (genuine screening below M_Z: intermediate < zero-momentum).
- invAlphaMZ_ge_electroweak (the M_Z reading ≥ the electroweak way-point 1582/27; the tower is
  genuinely graded — 42 < 1582/27 ≤ M_Z reading).
- sinSqMZ_ne_wrong (3/8 ≠ 1/4).
- reuse bandScreen_unbounded (an infinite sub-tower would diverge — finiteness load-bearing).

## COST BUDGET / KILL
Probe1 (7 crux lemmas) compiled EXIT 0 in seconds — all reuse banked lemmas + List.map_append/
List.sum_append + ring/linarith. No heavy tactic. KILL: if any production lemma needs >60s or a
monolithic normalizer, STOP and decompose. (Not expected — probe confirms all cheap.)

## PLAN
Production Phys/Algebra/FineStructureIntermediateReading.lean (import FineStructureZeroMomentum
which transitively pulls X2/N342 sinSqRunExact + WeinbergAngleRunning). Costume C491. Wire
Phys.lean + AxiomAudit (import + #print axioms lines). LEDGER row via temp+cat. gate-fast bg+poll.
Successor: ONE directed child toward X8 (absolute lepton masses).
