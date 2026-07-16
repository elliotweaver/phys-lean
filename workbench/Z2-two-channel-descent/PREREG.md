# PREREG — Z2: THE TWO-CHANNEL DESCENT ABOVE THE ELECTROWEAK EDGE

Arc Z (docs/SEED_ENDPOINT_ASSEMBLY.md §Z2). Directed successor of Z1 (GatherSelfCensus).
Module: `Phys/Algebra/TwoChannelDescent.lean`. Costume: C496.

## THE ANTI-BULLSHIT GATE (in writing, BEFORE compute)

### What is the FORCED theory-native target (fold → … → node, each arrow forced)?

The descent from the octonion ceiling (1/α* = 42) to the electroweak edge (v/M = ewClosureRatio,
banked) resolves into the derived electroweak channel structure N342 already carries: the ISOSPIN
channel (SU(2)_L, non-abelian) running with `invAlpha2` at depth `isoDepth = Tr(T3²) = 2`, and the
HYPERCHARGE channel (U(1)_Y, abelian) running with `invAlphaY` at depth `hyperDepth = Tr(Y²) = 10/3`.
N342 proved: at the MATTER depths the ratio `hyperDepth:isoDepth = (10/3):2 = 5:3` EQUALS the
GUT-intercept ratio, so `sin²θ_W = 3/8` is STATIONARY (matter alone does not run the mixing); and IF
the isospin depth drops below the matter value (`0 < d2 < isoDepth`) the mixing departs DOWN. But N342
left `d2 < isoDepth` as an **honest free parameter** with only a prose story ("the non-abelian SU(2)
self-coupling reduces the effective isospin depth").

Z1 (GatherSelfCensus) DERIVED the missing object: the gather's OWN self-census. The gather generators
are SKEW-adjoint (the fold law look=−id at generator level), so their trace-form self-census is
NEGATIVE (`gatherIsospin_selfCensus_neg`: B(imRep DI) = −16 < 0) — the anti-screening sense — while an
ABELIAN (zero) generator has ZERO gather self-census (`abelian_no_selfCensus`: traceSq 0 = 0).

**Z2 = the CHANNEL-STRUCTURE READING that turns N342's free `d2 < isoDepth` into a DERIVED consequence
of Z1.** Each channel's NET running depth = its MATTER census (X3, positive/self-adjoint) PLUS its
GATHER self-census (Z1, signed). The two channels are ASYMMETRIC by abelian-vs-non-abelian:

- ISOSPIN (SU(2)_L, non-abelian): matter `isoDepth` + a genuine NEGATIVE gather self-census (Z1's
  B(imRep DI) < 0) ⟹ net isospin depth REDUCED below `isoDepth`. `netIsoDepth s := isoDepth − s`,
  the reduction magnitude `s > 0` being the (normalized) anti-screening the Z1 negative sense forces.
- HYPERCHARGE (U(1)_Y, abelian): matter `hyperDepth` + ZERO gather self-census (Z1
  `abelian_no_selfCensus`) ⟹ net hypercharge depth UNREDUCED. `netHyperDepth := hyperDepth`.

The RECOMBINATION at the edge: reducing ONLY the isospin channel breaks the depth proportionality
`hyperDepth = (5/3)·isoDepth` DOWNWARD (`hyperDepth > (5/3)·netIsoDepth s`), which is exactly the N342
departure quantity `5·a₂ − 3·a_Y < 0`, so `sin²θ_W < 3/8`. **The DIRECTION is now FORCED by the SIGN
(Z1, negative) + the ASYMMETRY (Z1, abelian-zero) — no free direction, no prose story.**

Each arrow: fold look=−id ⟹ (Z1) skew generators ⟹ negative isospin gather self-census + zero abelian
gather self-census ⟹ isospin net depth reduced, hypercharge net depth not ⟹ (N342) proportionality
breaks down ⟹ sin²θ_W < 3/8. Forced, not adjacent.

### The standard version, and what the theory DOES to it.

Standard electroweak: integrate TWO RGEs for 1/α_Y, 1/α_2 with textbook one-loop coefficients
b₁ = 41/10 (with a POSITIVE gauge contribution) and b₂ = −19/6 (asymptotic freedom, the gauge-boson
self-coupling put in BY HAND as a measured/computed loop). The theory does NOT run a loop: the isospin
gauge-self-coupling anti-screening IS the gather self-census (Z1, DERIVED negative sense from
skew-adjointness), and the abelian hypercharge has NONE (abelian_no_selfCensus). So the b₂ vs b₁
asymmetry the field computes is the fold's abelian/non-abelian gather-census asymmetry, COUNTED. The
theory DISSOLVES the loop into a self-census sign + presence-asymmetry.

### Delete the physics words — does a real reason survive?

Delete "isospin / hypercharge / weak-mixing / gauge / coupling / running / screening / abelian /
octonion / electroweak": what remains — over the derived ℝ `Cut`, with `a₂(d,L) = 42 + κ·d·L`,
`a_Y(L) = 70 + κ·(10/3)·L`, `L = cutLog(M/μ)`, `netIso(s) = 2 − s`, and `netHyper = 10/3`: the ratio
`a₂/(a₂+a_Y)` is 3/8 at L=0; equals 3/8 for all L when the first depth is 2 (because 70:(10/3)=42:2);
is `< 3/8` for L>0 when the first depth is `2−s < 2` (0<s<2) while the second stays 10/3; and if the
second depth were ALSO reduced to `10/3 − (5/3)s` (proportional), the ratio would FREEZE at 3/8. Pure
real analysis on the banked `cutLog`. Every LANDING TYPE mentions the banked `isoDepth`/`hyperDepth`/
`invAlpha2`/`invAlphaY`/`sinSqRun` (N342) + `traceForm7 (imRep DI)`/`traceSq 0` (Z1) + `invAlphaZero`/
`chargeTraceDepth`/`topBandRatio` (X6/X7). NOT free-floating. A real reason survives → not bullshit.

### The standard temptation, named — and how Z2 differs.

Temptation: just re-assert N342 with `d2 < isoDepth` renamed "the reduced depth" and call it Z2. That
would be bullshit (no advance). Z2 DIFFERS: (1) the reduction SIGN is derived (Z1 negative sense),
(2) the abelian ASYMMETRY is a theorem (`netHyperDepth = hyperDepth`, no gather term, from Z1's abelian
tooth), (3) the LOAD-BEARING tooth `symmetric_frozen` proves that if the hypercharge were ALSO reduced
proportionally the mixing FREEZES at 3/8 — so the departure genuinely requires the abelian asymmetry,
i.e. Z1's `abelian_no_selfCensus` is load-bearing. The residual free piece is ONLY the reduction
MAGNITUDE `s` (the common normalization between the 7-trace and the doublet trace), honestly graded
route-not-yet-found, NEVER fitted (no measured sin²θ_W steers `s`).

## GRADE (honest)

THEOREM-route, EXACT for the STRUCTURE: the channel net-depth definitions, the negative-sign reduction
(isospin) and zero-reduction (hypercharge) asymmetry, the proportionality break, the recombination
`sin²θ_W < 3/8`, the switch-off consistency (`s=0 ⟹ 3/8`), the symmetric-freeze load-bearing tooth,
and the EM way-point 1582/27 consistency. ROUTE-NOT-YET-FOUND (honestly flagged, as X7/N342 already
flag it): the exact reduction MAGNITUDE `s` in `isoDepth` units (needs the cross-normalization of the
fundamental-7 trace to the doublet-4 trace). The measured `sin²θ_W(M_Z) ≈ 0.231` is REMOVABLE PROSE /
costume only (G2), NEVER a proof step, NO residual chased.

## PLANNED DECLS (module `Phys/Algebra/TwoChannelDescent.lean`)

Defs: `netIsoDepth (s : Cut) := isoDepth − s`; `netHyperDepth := hyperDepth`;
`invAlphaY_symmetric (s κ M μ) := invAlphaYHigh + κ·(hyperDepth − (5/3)·s)·cutLog(M/μ)`;
`sinSqRun_symmetric (s κ M μ) := invAlpha2 (netIsoDepth s) / (invAlpha2 (netIsoDepth s) + invAlphaY_symmetric s)`.

Theorems:
- `channel_gather_asymmetry`  : B(imRep DI) < 0 ∧ traceSq 0 = 0  (Z1: isospin negative, hypercharge zero).
- `netHyperDepth_matterOnly`  : netHyperDepth = hyperDepth (rfl; abelian matter-only).
- `netHyperDepth_eq`          : netHyperDepth = 10/3.
- `netIsoDepth_reduced`       : 0 < s → netIsoDepth s < isoDepth  (the negative-sense reduction).
- `netIsoDepth_pos`           : 0 < s → s < isoDepth → 0 < netIsoDepth s  (bounded magnitude).
- `net_ratio_breaks_up`       : 0<s → hyperDepth > (5/3)·netIsoDepth s  (proportionality breaks DOWN).
- `sinSqRun_eq_3_8_of_proportional` : a_Y = (5/3)·a₂(d) → a₂(d)≠0 → sinSqRun d = 3/8  (general helper).
- `twoChannel_mixing_departs` : 0<κ,0<s,s<isoDepth,0<μ,μ<M → sinSqRun (netIsoDepth s) κ M μ < 3/8  (RECOMBINATION).
- `twoChannel_switchoff`      : netIsoDepth 0 = isoDepth ∧ (h2 → sinSqRun (netIsoDepth 0) = 3/8)  (CONSISTENCY).
- `symmetric_frozen`          : a₂(netIso)≠0 → sinSqRun_symmetric s κ M μ = 3/8  (LOAD-BEARING abelian-asymmetry tooth).
- `em_waypoint_consistency`   : invAlphaZero [(chargeTraceDepth, topBandRatio)] = 1582/27  (X7 EM reading, s-independent).
- W8 teeth: `asymmetry_distinct` (isospin<0 but ¬(hyper gather<0)); `departure_needs_reduction`
  (s=0 ⟹ 3/8, no departure); `mixing_ne_wrong` (3/8 ≠ 1/4 at switch-off).
- `twoChannelDescent_landing` : welded capstone (asymmetry ∧ net depths ∧ break ∧ departs ∧ switchoff ∧ EM), statable from none alone.

## DISCIPLINE

Ground field the DERIVED ℝ `Cut` + banked `cutLog`; NO Mathlib Real as content. Import guard: Z1
(GatherSelfCensus) + X7 (FineStructureMZReadings), transitively X6/X2/N342 — NEVER MassGapOne, no
foldRetention. #print axioms ⊆ {propext, Classical.choice, Quot.sound}. No sorry/native_decide. NO
bridge/residual token in block comments. C496 costume bites 1 = 496.

## COMPILE-COST BUDGET / KILL

Light: `ring`/`field_simp`/`linarith`/`nlinarith`/`div_lt_iff₀` over `Cut`, all reusing N342's proven
lemmas. No brute, no heartbeat raise. KILL: if any single obligation exceeds ~60s or needs a raised
`maxHeartbeats`, STOP → measure/decompose (W9), never grind.
