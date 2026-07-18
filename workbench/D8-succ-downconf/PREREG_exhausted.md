# PREREG — LeadingCarrierExhausted (t_58f0f1ea): the CORRECTED route-finder's finding

## THE FINDING (theory-native, S2/S4 gate passed — see kanban comment 470)

The task asked: survey theory-native whether the ACTUAL dominant missing summand of 1/α(0) is
(a) an uncomposed recombination/anti-screening-layer summand, OR (b) awaits arc-M's ℝ-descent.
DERIVED answer (not assumed):

- **(a) REFUTED.** The leading census inventory is EXHAUSTED — every enumerated leading summand is
  composed / derived / zero / bounded:
  · recombination `+70` weld — COMPOSED (`RecombinedEndpoint.composed_endpoint`, both channels, split free)
  · anti-screening `s = 1/8` — DERIVED (`CasimirProjectionSelectsS.projectedS_eq`, no route-not-yet-found)
  · join content — ZERO (`JoinSplitRatioDerived.joinContent_at_derived_eq_zero`)
  · freeze-out — BOUNDED under ANY reweighting (parent `freezeout_reweight_bounded`)
  There is NO enumerated-but-uncomposed leading summand.

- **(b)'s RATIONALE REFINED.** The task's (b) says "awaits arc-M's ℝ-descent that pins the edges."
  But the edges are ALREADY pinned to DERIVED closed reals: `freezeout_at_pinned_dissolved` gives
  `rb = mbRatioDerived·(bMass0/bMass2)`, `rc = 1/mbRatioDerived`, `rl = downConfBundle·bMass2`, and
  `FreezeoutEdgeCrossSectorReduction` DISCHARGED the within-sector shape to the banked N340 numerals,
  collapsing the residual to the relative scale (itself pinned by the fold phase `mbRatioDerived` +
  the confinement weld). So D is NOT blocked on unpinned edges.

- **CONCLUSION (the honest diagnosis).** The leading composed carrier is a DETERMINED closed real
  (`composed_leading_closed`): `112 + (chargeTraceDepth − projectedS)·T + (16/9 + κ·[…])`, T the
  determined screening unit, the log-combination over the three DERIVED shape numerals — NO free
  parameter, NO uncomposed leading summand. The "dominant missing summand of 1/α(0)" front —
  deferred ≥5 nodes — is CLOSED at the leading census layer: there is none. The leading carrier is a
  DETERMINED WAY-POINT. The ≥15-significant-digit restate AS 1/α(0) is NOT available from the leading
  layer (the determined value would need the sub-leading / absolute-scale completion; pinning it to
  the measured value would be a G2-forbidden fit). Per the OWNER-BINDING board order D→M→C→GR
  (SEED_DIGITS §D8), the ONE directed successor is arc-M target M1 (the unit peg / absolute-scale
  skeleton); D's ≥15-digit restate resumes AFTER the dimensionful skeleton exists.

## THE THEOREMS (module Phys/Algebra/LeadingCarrierExhausted.lean)

1. `leading_carrier_determined` — re-export `composed_leading_closed`: the leading carrier = the
   determined closed form (no free parameter).
2. `residual_above_recombined` (NEW, `ring`) — the leading carrier MINUS the certified recombined
   endpoint `invAlphaEM(bands)` = `totalScreening(freezeout) − projectedS·T`, a determined closed real.
3. `residual_at_pinned_determined` — re-export `freezeout_at_pinned_dissolved`: the freeze-out part of
   the residual at the pinned edges = `16/9 + κ·[(7/3)L_mb + (11/3)L_b0 − (5/3)L_b2]` (determined).
4. `leading_inventory_exhausted` (bundle of re-exports) — recombination `+70`, anti-screening `1/8`,
   join `0`, freeze-out bounded (ANY reweighting): the leading layer carries NO uncomposed summand.
5. `freezeout_general_bounded` — re-export the parent `freezeout_reweight_bounded`: no version of the
   freeze-out (census OR any reweighting) is the dominant summand.
6. TEETH: `antiscreen_positive` (the anti-screening part of the residual is genuinely > 0);
   `occupancy_ne_census_total` (the counts distinct — no hidden identification patching the gap);
   `residual_nonvacuous` (the residual is a genuine composed quantity, not `= 0`).
7. capstone `leadingCarrierExhausted_landing` — welded, non-hollow, ~7 conjuncts.

## GRADE
THEOREM-EXACT (all re-exports + the new ring identity are exact identities/inequalities of Cut,
foundations-only). The front CLOSED at the leading layer (theorem). D's leading carrier a DETERMINED
WAY-POINT; the ≥15-digit AS-1/α(0) restate DEFERRED to resume after arc M (board order). No fit, no
empirical number in any proof; 138.97 / 137.036 / 137.95 / 1.94 removable orientation prose. The
composed object stays a WAY-POINT, NOT the ≥15-digit endpoint.

## SUCCESSOR (the ONE directed child — REPLACES the generic SELECT)
Arc-M target M1 (SEED_MASSES §M1): THE ONE UNIT PEG. Carry the deferred-D7 note (D's ≥15-digit
AS-1/α(0) restate resumes after the absolute-scale skeleton). Board order D→M→C→GR.

## COST BUDGET / KILL
All theorems are re-exports + one `ring`. No heavy compile. If any re-export name mismatches, fix the
open/name; if the residual `ring` needs the edges as explicit args, add them. KILL: if a re-export
does not typecheck after 2 name-fixes, read the source module's exact signature (do NOT invent).
