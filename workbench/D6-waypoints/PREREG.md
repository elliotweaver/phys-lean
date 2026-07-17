# PREREG — ARC-D D6: THE WAY-POINTS EVALUATED FREE (WayPointBracket)

## Node
D6, directed successor of D5-next-12 (NarrowedBracket12). Module: `Phys/Algebra/WayPointBracket.lean`,
namespace `Phys.Algebra.WayPointBracket`. Costume C520.

## FRONT SELECTED (theory-native, anti-bullshit gate applied)
Read α(M_Z) and sin²θ_W(M_Z) from the SAME certified tower as certified two-sided rational
brackets, landing FREE, never targeted, PLUS the free instrument-check (the pipeline reproduces
the banked exact way-points 1582/27, 190/3, dressed 74 exactly — width 0).

THEORY-NATIVE HEART: In EW theory α(M_Z), sin²θ_W(M_Z) are MEASURED inputs. The fold DISSOLVES
M_Z's special status — it is just an intermediate band edge inside the confinement band (Z7,
forced product constraint (v/s)·(s/Λ)=confBandRatio). So 1/α(M_Z)=invAlphaMZ vz reads as a
certified two-sided rational bracket squeezed FREE between the EXACT electroweak way-point 1582/27
(a partial-sum floor, NO ℝ-descent needed) below, and the D5-next-12 sharpest derived endpoint
ceiling 32019546505738/471238898037 above — with NO posited v/M_Z numeral. The reading lands free
because the endpoint bracket + the exact way-point floor squeeze it. ONE CAUSE: 1582/27 is
simultaneously (a) the exact M_Z-reading floor, (b) a free width-0 partial sum, (c) the anchor the
reading decomposes off; and sin²θ_W = 3/8 is the SAME gather self-overlap read at the SAME edge.

## DESIGN (all citations banked; nothing posited)
Reuse Z7 (WayPointReadings) structural facts + D5-next-12 sharp endpoint + D4 free instrument-check.

1. FREE INSTRUMENT-CHECK (numeral grade, width 0):
   - `AssembledBracket.pipeline_ew_waypoint`  : invAlphaZero [(chargeTraceDepth,topBandRatio)] = 1582/27
   - `AssembledBracket.pipeline_conf_waypoint`: invAlphaZero derivedBandList = 190/3
   - `AssembledBracket.assembled_at_zero_census`: invAlphaZero (completeBandList 0) = 190/3
   - `AssembledBracket.pipeline_conf_waypoint_dressed`: dressedInvAlphaZero depthWeight derivedBandList = 74

2. α(M_Z) CERTIFIED TWO-SIDED RATIONAL BRACKET (evaluated FREE), quantified over the FORCED
   product constraint vz·zL=confBandRatio, 1≤vz, 1≤zL:
     1582/27 ≤ invAlphaMZ vz  ∧  invAlphaMZ vz < 32019546505738/471238898037
   Lower = `WayPointReadings.invAlphaMZ_ge_ewpoint vz hvz` (exact way-point floor).
   Upper: `WayPointReadings.endpoint_gt_invAlphaMZ vz zL … hprod` (M_Z reading < full endpoint)
          chained with `NarrowedBracket12.invAlphaZero_narrowed12_bracket.2` (endpoint ≤ ceiling).

3. sin²θ_W(M_Z) EVALUATED FREE — exact 3/8 (degenerate certified bracket + teeth):
     3/8 ≤ sinSqRunExact isoDepth M mz ∧ sinSqRunExact isoDepth M mz ≤ 3/8
   via `WayPointReadings.sinSqMZ_stationary`; strictly < 3/8 at reduced depth
   (`sinSqMZ_below`), ≠ 1/4 (`sinSqMZ_ne_wrong`).

4. W8 TEETH:
   - `(1582/27 : Cut) < 32019546505738/471238898037` (norm_num) — bracket genuinely two-sided.
   - `42 < invAlphaMZ vz` (`WayPointReadings.invAlphaMZ_gt_42`) — reading genuinely screens.
   - the sin²θ_W bracket is exact (`sinSqMZ_ne_wrong`).

5. CAPSTONE `wayPointBracket_landing`: welds (1)–(4), non-hollow, honest grade.

## HONEST GRADE
- CERTIFIED NOW: free instrument-check (way-points reproduced width 0); the α(M_Z) certified
  two-sided rational bracket quantified over the forced constraint; exact Weinberg 3/8; teeth.
- ROUTE-NOT-YET-FOUND (never asserted/fitted): the single v/M_Z closed rational NUMERAL (needs the
  M_Z scale as a closed real of Cut) that would collapse the α(M_Z) bracket to below measured
  precision — handed onward (arc M scales; owner order D→M→C→GR). The measured α(M_Z)≈127.955 and
  sin²θ_W≈0.23122 are REMOVABLE PROSE ONLY (G2); the derived M_Z reading is a partial sum squeezed
  between the octonion ceiling and the derived endpoint, never a claim to the measured value.

## GUARDS
foundations-only #print axioms ⊆ {propext,Classical.choice,Quot.sound}; derived ℝ Cut only; NO
Mathlib ℝ/ℂ as content; NO Real.pi/cos/exp; NO native_decide; NO floats in production; NO empirical
number in any proof; words-removable; import guard: WayPointReadings + NarrowedBracket12 +
AssembledBracket (transitively the banked chain), NEVER OneAxiom.

## COMPILE-COST BUDGET / KILL
All proofs are citation + linarith/norm_num over rationals of Cut — LIGHT (no heavy tactic). Probe
first (bounded). KILL: if any single obligation needs >90s or a heavy normalizer, STOP and
decompose (W9); do not inflate heartbeats. Expect <30s file build.

## ONE SUCCESSOR
D7 (docs/SEED_DIGITS.md §D7 — THE NUMERAL: certified bracket for 1/α(0) to more digits than
measured, with the composition-completeness attestation prerequisite). Directed child REPLACES the
generic SELECTION ticket.
