# Z7 PREREG — THE WAY-POINT READINGS RE-READ (arc-Z, docs/SEED_ENDPOINT_ASSEMBLY.md §Z7)

Directed successor of Z6 (`EndpointAssembly`). Read α(M_Z) and sin²θ_W(M_Z) as PARTIAL SUMS of the
SAME completed Z6 tower. NO-DEFERRAL arc.

## THE THEORY-NATIVE FRONT (chosen fresh, gate-honest)

The X7 M_Z readings were established on an ABSTRACT below-edge list `belowV`. Z6 built the COMPLETE
derived band list `completeBandList d = derivedBandList ++ leptonTail d` and evaluated it END TO END.
Z7's NEW content is the CONNECTION: **M_Z is an interior way-point of the banked confinement band.**

M_Z sits between the electroweak edge `v` and the confinement edge `Λ` (v > M_Z > Λ). In the
complete Z6 list the confinement band is the single entry `(chargeTraceDepth, confBandRatio)` with
`confBandRatio = v/Λ = cutExp(8π/3)` (Z4). The M_Z edge SPLITS this band:
`confBandRatio = rVMz · (confBandRatio/rVMz)` where `rVMz = v/M_Z` (the v→M_Z sub-band ratio) — the
enumerated ℝ-descent numeral, carried as a PARAMETER, NEVER asserted, NEVER fitted.

Because `bandScreen depth ratio = κ·depth·cutLog ratio` and `cutLog` is a homomorphism (`cutLog_mul`),
splitting the band ratio splits its screening ADDITIVELY — the SAME telescoping the Z6 lepton tail
used. So:

    1/α(M_Z) = 1582/27 + bandScreen chargeTraceDepth rVMz              (M_Z reading = partial sum)
    invAlphaZero (completeBandList d)
        = 1/α(M_Z) + [bandScreen chargeTraceDepth (confBandRatio/rVMz) + totalScreening (leptonTail d)]
                                                          (the endpoint DECOMPOSES OFF the M_Z reading)

and inserting the M_Z way-point into the complete list LEAVES THE ENDPOINT INVARIANT (the
free-way-point / consistency tooth: the way-point is internal, not an anchor). `42 + 448/27 = 1582/27`.

## THE CONSISTENCY TOOTH (the seed's marquee constraint)

The X7 exact electroweak way-point `1582/27` falls FREE from the Z6 complete list (appending the
confinement band + lepton tail never moves it) — reuse Z6 `ewWaypoint_in_complete`. And the M_Z
insertion is FREE: `invAlphaZero (completeMzList rVMz d) = invAlphaZero (completeBandList d)`. If the
way-point had to be adjusted to make the reading land, the assembly would be a fit — it is not.

## PLANNED PRODUCTION THEOREMS (Phys/Algebra/WaypointReadings.lean)

Definitions (all over derived ℝ `Cut`, on banked objects):
- `mzWaypoint (rVMz : Cut) : Cut := 1582/27 + bandScreen chargeTraceDepth rVMz`  — 1/α(M_Z)
- `belowMzScreening (rVMz d : Cut) : Cut := bandScreen chargeTraceDepth (confBandRatio/rVMz) + totalScreening (leptonTail d)`
- `completeMzList (rVMz d : Cut) : List (Cut×Cut) := (chargeTraceDepth,topBandRatio) :: (chargeTraceDepth,rVMz) :: (chargeTraceDepth,confBandRatio/rVMz) :: leptonTail d`

Theorems:
1. `confBand_splits (hpos : 0 < rVMz)` : `bandScreen chargeTraceDepth confBandRatio = bandScreen chargeTraceDepth rVMz + bandScreen chargeTraceDepth (confBandRatio/rVMz)` (cutLog_mul telescoping).
2. `mzWaypoint_eq_partial_sum` : `mzWaypoint rVMz = invAlphaZero [(chargeTraceDepth,topBandRatio),(chargeTraceDepth,rVMz)]` (X7 invAlphaMZ_decomp; the M_Z reading IS the assembly of bands above M_Z).
3. ★★★ `endpoint_decomposes_off_mz (hpos : 0 < rVMz)` : `invAlphaZero (completeBandList d) = mzWaypoint rVMz + belowMzScreening rVMz d` (the master identity).
4. `mz_insertion_free (hpos : 0 < rVMz)` : `invAlphaZero (completeMzList rVMz d) = invAlphaZero (completeBandList d)` (★ free-way-point/consistency tooth).
5. `ewWaypoint_free_on_complete` : `invAlphaZero (completeBandList d) = 1582/27 + totalScreening ((chargeTraceDepth,confBandRatio) :: leptonTail d)` (cite Z6 ewWaypoint_in_complete — the consistency tooth for 1582/27).
6. `mzWaypoint_bracket (h1 : 1 < rVMz) (h2 : rVMz < confBandRatio) (hd : 0 ≤ d …)` : `1582/27 ≤ mzWaypoint rVMz ∧ mzWaypoint rVMz ≤ invAlphaZero (completeBandList chargeTraceDepth)` (M_Z reading squeezed between the electroweak way-point and the endpoint).
7. Weinberg readings (cite X7): `sinSqMZ_stationary` (=3/8 at isoDepth), `sinSqMZ_departs_down` (< 3/8 at reduced depth).
W8 teeth:
- `mzWaypoint_gt_ewpoint (h1 : 1 < rVMz)` : `1582/27 < mzWaypoint rVMz` (genuine screening above the way-point).
- `mzWaypoint_lt_endpoint` (1 < rVMz < confBandRatio, lepton tail screens) : `mzWaypoint rVMz < invAlphaZero (completeBandList chargeTraceDepth)` (genuine screening below M_Z).
- `mzWaypoint_ne_ceiling` : `mzWaypoint rVMz ≠ 42` (not pinned at the octonion ceiling) OR reuse the > 1582/27 > 42.
- `sinSqMZ_ne_wrong` : `sinSqRunExact isoDepth M mz ≠ 1/4`.
Capstone: `waypointReadings_landing` welded ∧, statable from no conjunct alone.

## GRADE (honest, per-piece)
THEOREM-EXACT: the confinement-band split (telescoping), the M_Z reading as a partial sum, the master
decomposition of the endpoint off the M_Z reading, the free insertion (consistency tooth), the
1582/27 free-landing, the bracket, the Weinberg 3/8 stationary + departure, all W8 teeth — closed
reals of Cut, no error bar. ROUTE-NOT-YET-FOUND (enumerated, NEVER asserted / NEVER fitted): the v→M_Z
sub-band ratio numeral `rVMz` (carried as a parameter; the same ℝ-descent status as X7/Z6). Measured
`1/α(M_Z)≈127.955`, `sin²θ_W(M_Z)≈0.23122` are REMOVABLE PROSE / costume only (G2).

## GUARDS
G6 foundations-only ⊆ {propext,Classical.choice,Quot.sound}; derived ℝ Cut only, NEVER Mathlib ℝ/ℂ as
content; import guard — banked Z6 EndpointAssembly + X7 FineStructureMZReadings only, NEVER
MassGapOne/OneAxiom/foldRetention. Costume C501. Words-removable: yes (pure Cut analysis).
NOT free-floating: every TYPE mentions banked invAlphaZero/bandScreen/totalScreening/confBandRatio/
completeBandList/leptonTail/mass0/mass1/sinSqRunExact.

## COST BUDGET / KILL
All proofs are List-append + cutLog_mul + ring + linarith + nlinarith on banked lemmas — the same
family as Z6 (which compiled fast). No heavy normalizer. KILL: if any single obligation exceeds ~90s
or needs maxHeartbeats inflation, STOP, decompose, re-measure. Expect a fast build.
