/-
  # Z7 — THE WAY-POINT READINGS RE-READ — arc-Z ENDPOINT-ASSEMBLY (docs/SEED_ENDPOINT_ASSEMBLY.md §Z7)
  =====================================================================================================

  Directed successor of Z6 (`EndpointAssembly`). Z6 banked the COMPLETE derived tower
  `completeBandList d = derivedBandList ++ leptonTail d`, evaluated end to end as the closed real
  `invAlphaZero (completeBandList d) = 190/3 + κ·d·cutLog(mass0/mass1)`, with BOTH way-points
  `1582/27` (electroweak edge `v`) and `190/3` (confinement edge `Λ`) landing FREE. This node reads
  `α(M_Z)` and `sin²θ_W(M_Z)` as PARTIAL SUMS of that SAME completed tower — exact derived readings
  at the derived edge — and proves the CONSISTENCY TOOTH: inserting the `M_Z` edge does not move the
  endpoint, and the banked exact way-point `1582/27` is UNCHANGED by the refinement (the free-way-point
  principle at the `M_Z` refinement).

  ## THE THEORY-NATIVE READING (what the fold says the field cannot — seed §Z7)

  In standard electroweak theory, `M_Z` is the anchor at which `α(M_Z)` and `sin²θ_W(M_Z)` are
  MEASURED and from which the running is integrated. The fold DISSOLVES its special status: the `M_Z`
  scale sits BETWEEN the electroweak edge `v` and the confinement edge `Λ` (`Λ < M_Z < v` — removable
  prose), so `M_Z` is simply an INTERMEDIATE edge inside the banked Z4 confinement band
  `(chargeTraceDepth, confBandRatio)` where `confBandRatio = v/Λ = ewEdgeScale/confEdgeScale`. Refining
  the confinement band at `M_Z` splits it into two consecutive sub-bands with the SAME census:
  `(chargeTraceDepth, v/M_Z)` and `(chargeTraceDepth, M_Z/Λ)`. Because consecutive-edge scale ratios
  MULTIPLY (`(v/s)·(s/Λ) = v/Λ` for any intermediate scale `s ≠ 0`, `mz_edge_product`) and `cutLog` is
  a homomorphism (`cutLog_mul`), the two sub-band screenings recombine EXACTLY into the single
  confinement-band screening (`mzWaypoint_refines_confBand`). So:

    THE ENDPOINT IS INVARIANT UNDER THE M_Z REFINEMENT (`endpoint_invariant_under_MZ_refinement`):
        invAlphaZero (mzWaypointList vz zL d) = invAlphaZero (completeBandList d).

  The reading AT `M_Z` is the partial sum of the tower down to `M_Z` (`invAlphaMZ vz = invAlphaZero
  [(chargeTraceDepth, topBandRatio), (chargeTraceDepth, vz)]`), and it decomposes off the EXACT
  electroweak way-point (`invAlphaMZ_off_ewpoint`: `= 1582/27 + κ·d·cutLog(v/M_Z)`). The complete Z6
  endpoint then reads as the `M_Z` reading PLUS the screening below `M_Z` (`endpoint_reads_MZ`):
        invAlphaZero (completeBandList d) = invAlphaMZ vz + totalScreening (mzBelow zL d).

  ## THE CONSISTENCY TOOTH / FREE-WAY-POINT (seed §Z7 — the overconstraint check)

  The re-derived electroweak way-point `1582/27` must AGREE with the banked exact value on the refined
  list. `ewWaypoint_in_mzList` proves `1582/27` is a PARTIAL SUM of the refined tower, UNCHANGED by
  refining the confinement band at `M_Z` or by appending the lepton tail — nothing is adjusted to make
  a reading land, exactly as Z4/Z6 required. The endpoint invariance IS the proof of closure: the
  intermediate `M_Z` reading is a forced partial sum of the ONE completed tower, not a free anchor.

  ## THE WEINBERG READING AT M_Z (the SAME gather self-overlap, other observable — seed §Z7)

  `sin²θ_W(M_Z)` is read at the SAME band edge via the banked `sinSqRunExact` (X2/N461): at the matter
  isospin depth `isoDepth = 2` it is STATIONARY at the EXACT `3/8` (`sinSqMZ_stationary`); the
  non-abelian SU(2) self-coupling reduces the depth (`0 < d2 < isoDepth`), running the mixing STRICTLY
  BELOW `3/8` (`sinSqMZ_below`). Both observables at `M_Z` are scale-resolved evaluations of the ONE
  gather self-overlap — the same object, read at the same edge.

  ## GRADE (honest, per piece — seed §Z7 / SOUL "route COMPLETE vs route NOT-YET-FOUND")

  THEOREM-EXACT NOW (closed reals of `Cut`, no error bar, foundations-only): the product constraint
  `(v/s)·(s/Λ) = confBandRatio` for any intermediate scale (`mz_edge_product`); the sub-band
  telescoping recombining to the confinement band (`mzWaypoint_refines_confBand`); the endpoint
  invariance under the `M_Z` refinement (`endpoint_invariant_under_MZ_refinement` — the consistency
  tooth); the `M_Z` reading decomposing off the exact way-point `1582/27` (`invAlphaMZ_off_ewpoint`);
  the exact way-point `1582/27` falling FREE from the refined list (`ewWaypoint_in_mzList`); the
  complete endpoint reading as the `M_Z` reading plus below-`M_Z` screening (`endpoint_reads_MZ`); the
  bracket `1582/27 ≤ invAlphaMZ` (`invAlphaMZ_ge_ewpoint`); the `M_Z` reading strictly below the full
  endpoint (`endpoint_gt_invAlphaMZ` — genuine partial sum); the two Weinberg readings.

  ROUTE-NOT-YET-FOUND (the enumerated ℝ-descent, NEVER asserted / NEVER fitted — exactly the banked
  X6/X7/Z6 status): the single closed rational NUMERAL for the `v/M_Z` sub-band ratio `vz` (needs the
  `M_Z` scale as a closed real of `Cut`) and the light-quark / hadronic per-band census freeze-out.
  The theorems here quantify over ALL `vz, zL` satisfying the FORCED product constraint (`vz·zL =
  confBandRatio`), so the STRUCTURE (the decomposition, the invariance, the free way-point) is exact
  and the numeral is the only open sub-fact — handed to Z8. The measured `α(M_Z) ≈ 127.955` and
  `sin²θ_W(M_Z) ≈ 0.23122` are REMOVABLE PROSE / costume ONLY (G2), never a proof step, never a fit
  target; the `M_Z` reading here is a derived partial sum squeezed between the octonion ceiling and
  the derived endpoint, never a claim to the measured value.

  ## PHYSICS-WORDS-REMOVABLE (STANDARD §2; seed G5)

  Delete "coupling / running / screening / band / edge / electroweak / M_Z / confinement / lepton /
  octonion / weak mixing angle": what remains, over the derived ℝ `Cut`, is that `(a/s)·(s/b) = a/b`
  for `s ≠ 0`; that `κ·d·cutLog(vz) + κ·d·cutLog(zL) = κ·d·cutLog(confBandRatio)` when
  `vz·zL = confBandRatio` (via `cutLog_mul`); that therefore the finite-list sum `invAlphaZero`
  over `[(d,topBandRatio),(d,vz),(d,zL)] ++ leptonTail d` equals it over
  `[(d,topBandRatio),(d,confBandRatio)] ++ leptonTail d`; that the two-element reading
  `invAlphaZero [(d,topBandRatio),(d,vz)] = 1582/27 + bandScreen d vz`; that this is `≥ 1582/27 > 42`
  for `vz ≥ 1`; that the endpoint exceeds it strictly; and that `a₂/(a₂+a_Y) = 3/8` at the
  proportional depth and `< 3/8` for a reduced depth. Pure real analysis on the banked `κ`/`cutLog`/
  `cutExp`/`cutPi`/`bandScreen`/`invAlphaZero`/`totalScreening`/`confBandRatio`/`ewEdgeScale`/
  `confEdgeScale`/`completeBandList`/`leptonTail`/`sinSqRunExact` over `Cut`. No theorem STATEMENT
  needs a physics word.

  ## NOT FREE-FLOATING (seed / SOUL free-floating rail)

  Every production TYPE mentions the banked derived objects: `invAlphaZero`/`totalScreening`/
  `bandScreen`/`topBandRatio`/`chargeTraceDepth`/`kappaLeading` (X6), `confBandRatio`/`ewEdgeScale`/
  `confEdgeScale`/`confBand_ratio_from_edges`/`ewWaypoint_free`/`derivedBandList` (Z4),
  `completeBandList`/`leptonTail`/`ewWaypoint_in_complete`/`leptonTail_screen_pos` (Z6),
  `sinSqRunExact`/`isoDepth`/`invAlpha2` (X2), and `cutLog`/`cutLog_mul`/`Cut` (derived ℝ).
  `mzWaypointList` is literally the Z6 tower with the confinement band split at `M_Z`; `invAlphaMZ` is
  literally `invAlphaZero` restricted to the above-`M_Z` sub-list. Not generic, not carrier-agnostic.

  ## SEED HARD GUARDS (G1–G8)

  - G1 NO ASSERTED VALUE — `1582/27` FALLS OUT of the banked `invAlphaZero_topBand_value` /
    `ewWaypoint_free`; the invariance FALLS OUT of `mz_edge_product` + `cutLog_mul`; no `M_Z` coupling
    / mixing value is premised.
  - G2 NO EMPIRICAL NUMBER — no `127.955`, no `0.23122`, no measured `α(M_Z)` / `sin²θ_W(M_Z)` in any
    statement or proof; the measured constants are this prose / the costume only, fully removable.
  - G3 EXACT — the decomposition, the invariance, the exact way-point `1582/27`, the bracket, and the
    Weinberg `3/8` are EXACT derived facts of `Cut`; the only open sub-fact is the `v/M_Z` numeral (the
    ℝ-descent), quantified over, never asserted.
  - G4 DERIVED, NOT POSITED — the tower is the banked Z6 `completeBandList`; the exact way-point is the
    banked top-band value; the product constraint is derived from the banked derived edges
    (`mz_edge_product`); the reading is a partial sum of the banked finite tower.
  - G5 PHYSICS-WORDS-REMOVABLE — see above.
  - G6 FOUNDATIONS-ONLY — `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`; sorry-free, zero
    posited axioms, no compiled-decision bypass, no heartbeat inflation, NO `foldRetention` (import
    guard: only banked Z6 / X7 modules, never `MassGapOne` / `OneAxiom`). Ground field the DERIVED ℝ
    `Cut`; ⚠ NO Mathlib `Real` / `Complex` as content — Mathlib is MACHINERY only.
  - G7 ONE LAW — the derivation did not fight; `mz_edge_product` (`field_simp`), `cutLog_mul`, and the
    banked `ewWaypoint_free` / `ewWaypoint_in_complete` close every step; the `M_Z` refinement mirrors
    the Z6 lepton-tail telescoping exactly.
  - G8 TEETH (W8) — `invAlphaMZ_gt_42` (the `M_Z` reading genuinely screens above the octonion ceiling
    — it is NOT pinned at `42`); `invAlphaMZ_ne_42`; `endpoint_gt_invAlphaMZ` (the `M_Z` reading is
    STRICTLY below the full endpoint — a genuine partial sum, uses banked `leptonTail_screen_pos`);
    `ewWaypoint_in_mzList` witnesses the exact way-point is UNCHANGED by the refinement (the
    consistency tooth — the assembly is NOT a fit); `sinSqMZ_ne_wrong` (the mixing reading is `3/8`,
    NOT the wrong `1/4`).

  DEPENDENCIES (all banked, foundations-only): Z6 `EndpointAssembly` (`completeBandList`/`leptonTail`/
  `ewWaypoint_in_complete`/`leptonTail_screen_pos`); Z4 `BandEdgeList` (`confBandRatio`/`derivedBandList`/
  `ewWaypoint_free`/`ewEdgeScale`/`confEdgeScale`/`confBand_ratio_from_edges`/`confBandRatio_gt_one`/
  `confEdgeScale_pos`); X7 `FineStructureMZReadings` (`invAlphaZero_append`/`sinSqMZ_matter_stationary`/
  `sinSqMZ_departs_down`); X6 `FineStructureZeroMomentum` (`invAlphaZero`/`invAlphaZero_cons`/
  `invAlphaZero_nil`/`invAlphaZero_closed`/`totalScreening`/`totalScreening_append`/`bandScreen`/
  `bandScreen_topBand_exact`/`bandScreen_nonneg`/`topBandRatio`/`chargeTraceDepth`/`chargeTraceDepth_pos`/
  `kappaLeading`); X2 `FineStructureRunningExact` (`sinSqRunExact`/`isoDepth`/`invAlpha2`); the derived
  `Cut` (`cutLog`/`cutLog_mul`); standard Mathlib `field_simp`/`ring`/`linarith`/`norm_num`/`List`
  MACHINERY on the DERIVED objects (STANDARD §3). NO posited coupling / mixing value as content, NO
  Mathlib ℝ as content, NO bridge.
-/
import Phys.Algebra.EndpointAssembly
import Phys.Algebra.FineStructureMZReadings
import Mathlib.Tactic

namespace Phys.Algebra.WayPointReadings

open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.EndpointAssembly
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (0) LIST MACHINERY — the total screening of a cons / nil (banked-style helpers). -/

/-- THE TOTAL SCREENING OF THE EMPTY TOWER is `0` (no resolved band). -/
theorem totalScreening_nil : totalScreening [] = 0 := by
  unfold totalScreening; simp

/-- THE TOTAL SCREENING OF A CONS adds the head band's increment: `totalScreening (b :: bands) =
    bandScreen b.1 b.2 + totalScreening bands`. `List.map_cons` + `List.sum_cons` on the banked
    `totalScreening` (mirrors X6 `invAlphaZero_cons`). -/
theorem totalScreening_cons (b : Cut × Cut) (bands : List (Cut × Cut)) :
    totalScreening (b :: bands) = bandScreen b.1 b.2 + totalScreening bands := by
  unfold totalScreening
  rw [List.map_cons, List.sum_cons]

/-! ## (1) THE FORCED PRODUCT CONSTRAINT — the M_Z edge REFINES the confinement band. -/

/-- ★★ THE CONSECUTIVE-EDGE PRODUCT IS FORCED: for ANY intermediate scale `s ≠ 0`, the two sub-band
    ratios `ewEdgeScale/s` (`v/M_Z`) and `s/confEdgeScale` (`M_Z/Λ`) MULTIPLY to the confinement-band
    ratio `confBandRatio = ewEdgeScale/confEdgeScale = v/Λ` (Z4 `confBand_ratio_from_edges`). Splitting
    the confinement band at `M_Z` is a REFINEMENT, not a free choice: whatever the intermediate scale,
    the product of the consecutive ratios is fixed by the two DERIVED edges. (The individual numeral
    `v/M_Z` needs the `M_Z` scale as a closed real of `Cut` — the ℝ-descent sub-fact.) -/
theorem mz_edge_product (s : Cut) (hs : s ≠ 0) :
    (ewEdgeScale / s) * (s / confEdgeScale) = confBandRatio := by
  rw [confBand_ratio_from_edges]
  have hc : confEdgeScale ≠ 0 := ne_of_gt confEdgeScale_pos
  field_simp

/-- ★★★ THE SUB-BAND TELESCOPING — the two `M_Z`-refined sub-band screenings recombine EXACTLY to the
    single confinement-band screening. When `vz·zL = confBandRatio` (the forced product constraint,
    `mz_edge_product`), the two consecutive screenings at the SAME census `chargeTraceDepth` sum, via
    the banked `cutLog` homomorphism `cutLog_mul`, to the confinement-band screening:
        κ·d·cutLog(vz) + κ·d·cutLog(zL) = κ·d·cutLog(vz·zL) = κ·d·cutLog(confBandRatio).
    The intermediate `M_Z` edge is a genuine way-point, not an anchor — the same telescoping the Z6
    lepton tail used. -/
theorem mzWaypoint_refines_confBand (vz zL : Cut) (hvz : 0 < vz) (hzL : 0 < zL)
    (hprod : vz * zL = confBandRatio) :
    bandScreen chargeTraceDepth vz + bandScreen chargeTraceDepth zL
      = bandScreen chargeTraceDepth confBandRatio := by
  unfold bandScreen
  have hlog : cutLog vz + cutLog zL = cutLog confBandRatio := by
    rw [← cutLog_mul hvz hzL, hprod]
  have hr : kappaLeading * chargeTraceDepth * cutLog vz
            + kappaLeading * chargeTraceDepth * cutLog zL
          = kappaLeading * chargeTraceDepth * (cutLog vz + cutLog zL) := by ring
  rw [hr, hlog]

/-! ## (2) THE M_Z-REFINED TOWER AND THE READING AT THE M_Z EDGE. -/

/-- THE ABOVE-`M_Z` SUB-LIST: the bands above the `M_Z` edge — the octonion→electroweak top band and
    the electroweak→`M_Z` band, both at the census `chargeTraceDepth`. A two-element derived list. -/
def mzAbove (vz : Cut) : List (Cut × Cut) :=
  [(chargeTraceDepth, topBandRatio), (chargeTraceDepth, vz)]

/-- THE BELOW-`M_Z` SUB-LIST: the `M_Z`→confinement band `(chargeTraceDepth, zL)` followed by the
    banked Z6 derived lepton tail. The screening across the bands below the `M_Z` edge. -/
def mzBelow (zL d : Cut) : List (Cut × Cut) :=
  (chargeTraceDepth, zL) :: leptonTail d

/-- ★★★ THE `M_Z`-REFINED COMPLETE TOWER: the banked Z6 `completeBandList` with the confinement band
    split at the `M_Z` edge into `(chargeTraceDepth, vz)` (`v→M_Z`) and `(chargeTraceDepth, zL)`
    (`M_Z→Λ`). Literally `mzAbove vz ++ mzBelow zL d`. -/
def mzWaypointList (vz zL d : Cut) : List (Cut × Cut) := mzAbove vz ++ mzBelow zL d

/-- ★ THE READING AT THE `M_Z` EDGE: `invAlphaMZ vz = invAlphaZero (mzAbove vz)` — the partial sum of
    the tower restricted to the bands ABOVE the `M_Z` edge (`1/α(M_Z)`). -/
def invAlphaMZ (vz : Cut) : Cut := invAlphaZero (mzAbove vz)

/-- ★★★ THE `M_Z` READING DECOMPOSES OFF THE EXACT ELECTROWEAK WAY-POINT: `invAlphaMZ vz = 1582/27 +
    bandScreen chargeTraceDepth vz`. The `M_Z` reading is the EXACT electroweak way-point `1582/27`
    (X6/X7) PLUS the single `v→M_Z` sub-band screening `κ·d·cutLog(v/M_Z)`. The way-point falls out of
    the banked top-band value; the `v/M_Z` ratio is the ℝ-descent sub-fact (quantified over). -/
theorem invAlphaMZ_off_ewpoint (vz : Cut) :
    invAlphaMZ vz = 1582 / 27 + bandScreen chargeTraceDepth vz := by
  unfold invAlphaMZ mzAbove
  rw [invAlphaZero_cons, invAlphaZero_cons, invAlphaZero_nil]
  show bandScreen chargeTraceDepth topBandRatio
        + (bandScreen chargeTraceDepth vz + 42) = 1582 / 27 + bandScreen chargeTraceDepth vz
  rw [bandScreen_topBand_exact]
  ring

/-! ## (3) THE CONSISTENCY TOOTH — the endpoint is INVARIANT under the M_Z refinement. -/

/-- THE `mzBelow` SCREENING is the `M_Z`→confinement band plus the banked lepton-tail screening. -/
theorem totalScreening_mzBelow (zL d : Cut) :
    totalScreening (mzBelow zL d) = bandScreen chargeTraceDepth zL + totalScreening (leptonTail d) := by
  unfold mzBelow
  rw [totalScreening_cons]

/-- ★★★ THE ENDPOINT IS INVARIANT UNDER THE `M_Z` REFINEMENT (the consistency tooth): under the forced
    product constraint `vz·zL = confBandRatio`,
        invAlphaZero (mzWaypointList vz zL d) = invAlphaZero (completeBandList d).
    Inserting the `M_Z` edge splits the confinement band, but the two sub-band screenings recombine
    EXACTLY (`mzWaypoint_refines_confBand`), so the endpoint is UNCHANGED. The `M_Z` reading is a
    forced partial sum of the ONE completed Z6 tower, not a free anchor. This is the free-way-point
    principle at the `M_Z` refinement — the assembly is NOT a fit. -/
theorem endpoint_invariant_under_MZ_refinement (vz zL d : Cut) (hvz : 0 < vz) (hzL : 0 < zL)
    (hprod : vz * zL = confBandRatio) :
    invAlphaZero (mzWaypointList vz zL d) = invAlphaZero (completeBandList d) := by
  -- Both sides share the ceiling; reduce to the total-screening equality.
  rw [invAlphaZero_closed, invAlphaZero_closed]
  -- LHS screening: split above/below at M_Z, expand the two small lists.
  have hLHS : totalScreening (mzWaypointList vz zL d)
      = bandScreen chargeTraceDepth topBandRatio + bandScreen chargeTraceDepth vz
        + (bandScreen chargeTraceDepth zL + totalScreening (leptonTail d)) := by
    unfold mzWaypointList mzAbove mzBelow
    rw [totalScreening_append, totalScreening_cons, totalScreening_cons, totalScreening_nil,
      totalScreening_cons]
    ring
  -- RHS screening: split derivedBandList/tail, expand the two-band high list.
  have hRHS : totalScreening (completeBandList d)
      = bandScreen chargeTraceDepth topBandRatio + bandScreen chargeTraceDepth confBandRatio
        + totalScreening (leptonTail d) := by
    unfold completeBandList derivedBandList
    rw [totalScreening_append, totalScreening_cons, totalScreening_cons, totalScreening_nil]
    ring
  rw [hLHS, hRHS]
  have htel := mzWaypoint_refines_confBand vz zL hvz hzL hprod
  linarith [htel]

/-- ★★★ THE COMPLETE Z6 ENDPOINT READS AS THE `M_Z` READING PLUS BELOW-`M_Z` SCREENING: under the
    forced product constraint,
        invAlphaZero (completeBandList d) = invAlphaMZ vz + totalScreening (mzBelow zL d).
    The `M_Z` edge is a band edge; `1/α(0) = 1/α(M_Z) + (screening below M_Z)`. Chains the invariance
    (the consistency tooth) with the banked additive edge decomposition (`invAlphaZero_append`). -/
theorem endpoint_reads_MZ (vz zL d : Cut) (hvz : 0 < vz) (hzL : 0 < zL)
    (hprod : vz * zL = confBandRatio) :
    invAlphaZero (completeBandList d) = invAlphaMZ vz + totalScreening (mzBelow zL d) := by
  rw [← endpoint_invariant_under_MZ_refinement vz zL d hvz hzL hprod]
  unfold invAlphaMZ mzWaypointList
  rw [invAlphaZero_append]

/-! ## (4) THE FREE ELECTROWEAK WAY-POINT ON THE REFINED LIST (the overconstraint check). -/

/-- ★★ THE EXACT WAY-POINT `1582/27` FALLS FREE FROM THE `M_Z`-REFINED LIST: for the refined tower,
        invAlphaZero (mzWaypointList vz zL d) = 1582/27 + totalScreening ((chargeTraceDepth, vz) :: mzBelow zL d).
    The banked exact electroweak way-point `1582/27` is a PARTIAL SUM of the refined tower — UNCHANGED
    by refining the confinement band at `M_Z` or by the lepton tail below it (Z4 `ewWaypoint_free`).
    Nothing is adjusted to make the reading land: the way-point landing free is the assembly's proof of
    closure. -/
theorem ewWaypoint_in_mzList (vz zL d : Cut) :
    invAlphaZero (mzWaypointList vz zL d)
      = 1582 / 27 + totalScreening ((chargeTraceDepth, vz) :: mzBelow zL d) := by
  unfold mzWaypointList mzAbove
  rw [show ([(chargeTraceDepth, topBandRatio), (chargeTraceDepth, vz)] ++ mzBelow zL d)
        = [(chargeTraceDepth, topBandRatio)] ++ ((chargeTraceDepth, vz) :: mzBelow zL d) from rfl]
  rw [ewWaypoint_free]

/-! ## (5) THE BRACKET AND W8 NON-VACUITY WITH TEETH. -/

/-- ★★ THE EXACT WAY-POINT LOWER-BRACKETS THE `M_Z` READING: for a `v→M_Z` sub-band that screens
    (`1 ≤ vz`), the `M_Z` reading is at least the EXACT electroweak way-point `1582/27`. `1582/27` is
    an exact lower bracket of `1/α(M_Z)`. -/
theorem invAlphaMZ_ge_ewpoint (vz : Cut) (hvz : 1 ≤ vz) : 1582 / 27 ≤ invAlphaMZ vz := by
  rw [invAlphaMZ_off_ewpoint]
  have : 0 ≤ bandScreen chargeTraceDepth vz :=
    bandScreen_nonneg (le_of_lt chargeTraceDepth_pos) hvz
  linarith

/-- ★ W8 — THE `M_Z` READING GENUINELY SCREENS ABOVE THE CEILING: for a `v→M_Z` sub-band that screens,
    the `M_Z` reading STRICTLY EXCEEDS the octonion ceiling `42` (it is `≥ 1582/27 ≈ 58.6 > 42`). A
    non-screening (constant) coupling would stay pinned at `42`. -/
theorem invAlphaMZ_gt_42 (vz : Cut) (hvz : 1 ≤ vz) : 42 < invAlphaMZ vz := by
  have := invAlphaMZ_ge_ewpoint vz hvz
  linarith

/-- ★ W8 — THE `M_Z` READING IS OFF THE CEILING: it is not the un-screened octonion ceiling `42`. -/
theorem invAlphaMZ_ne_42 (vz : Cut) (hvz : 1 ≤ vz) : invAlphaMZ vz ≠ 42 := by
  have := invAlphaMZ_gt_42 vz hvz
  linarith

/-- ★★ W8 — THE `M_Z` READING IS STRICTLY BELOW THE FULL ENDPOINT (a genuine partial sum): with the
    full census `d = chargeTraceDepth` and a screening `M_Z`→confinement band (`1 ≤ zL`),
        invAlphaMZ vz < invAlphaZero (completeBandList chargeTraceDepth).
    The screening below `M_Z` (the `M_Z`→confinement band plus the banked lepton tail,
    `leptonTail_screen_pos > 0`) genuinely runs `1/α` further UP — the `M_Z` reading is not the
    endpoint, it is a partial sum below it. -/
theorem endpoint_gt_invAlphaMZ (vz zL : Cut) (hvz : 0 < vz) (hzL : 1 ≤ zL)
    (hprod : vz * zL = confBandRatio) :
    invAlphaMZ vz < invAlphaZero (completeBandList chargeTraceDepth) := by
  rw [endpoint_reads_MZ vz zL chargeTraceDepth hvz (lt_of_lt_of_le zero_lt_one hzL) hprod,
    totalScreening_mzBelow]
  have hzband : 0 ≤ bandScreen chargeTraceDepth zL :=
    bandScreen_nonneg (le_of_lt chargeTraceDepth_pos) hzL
  have htail : 0 < totalScreening (leptonTail chargeTraceDepth) := leptonTail_screen_pos
  linarith

/-! ## (6) THE WEINBERG READING AT M_Z (the SAME gather self-overlap, other observable — X2/X7). -/

/-- ★★ THE WEINBERG READING IS STATIONARY AT THE MATTER DEPTH: at the matter isospin depth
    `isoDepth = 2`, `sin²θ_W(M_Z) = 3/8` at every band edge — matter ALONE does not run the mixing.
    The banked `sinSqMZ_matter_stationary` (X7) read at the `M_Z` edge. -/
theorem sinSqMZ_stationary (M mz : Cut) (h2 : invAlpha2 isoDepth kappaLeading M mz ≠ 0) :
    sinSqRunExact isoDepth M mz = 3 / 8 :=
  sinSqMZ_matter_stationary M mz h2

/-- ★★ THE WEINBERG READING DEPARTS DOWN AT THE REDUCED DEPTH: with the non-abelian-reduced isospin
    depth `0 < d2 < isoDepth` below the octonion scale, `sin²θ_W(M_Z)` runs STRICTLY BELOW `3/8`. The
    banked `sinSqMZ_departs_down` (X7) at the `M_Z` edge. -/
theorem sinSqMZ_below (d2 M mz : Cut) (hd2 : 0 < d2) (hd2lt : d2 < isoDepth)
    (hmz : 0 < mz) (hmzM : mz < M) :
    sinSqRunExact d2 M mz < 3 / 8 :=
  sinSqMZ_departs_down d2 M mz hd2 hd2lt hmz hmzM

/-- ★ W8 — THE WEINBERG READING IS `3/8`, NOT THE WRONG `1/4`: at the matter isospin depth the `M_Z`
    mixing reading is the correct banked value `3/8`, not the wrong `1/4`. -/
theorem sinSqMZ_ne_wrong (M mz : Cut) (h2 : invAlpha2 isoDepth kappaLeading M mz ≠ 0) :
    sinSqRunExact isoDepth M mz ≠ 1 / 4 := by
  rw [sinSqMZ_stationary M mz h2]; norm_num

/-! ## (7) THE Z7 CAPSTONE — welded, non-hollow. -/

/-- ★★★ THE WAY-POINT READINGS (arc-Z Z7, welded landing). `α(M_Z)` and `sin²θ_W(M_Z)` read as PARTIAL
    SUMS of the SAME completed Z6 tower — exact derived readings at the derived `M_Z` edge:

    (1) THE FORCED PRODUCT CONSTRAINT: for any intermediate scale `s ≠ 0`, `(v/s)·(s/Λ) = confBandRatio`
        (`mz_edge_product`) — the `M_Z` refinement of the confinement band, not a free choice;
    (2) THE SUB-BAND TELESCOPING: under `vz·zL = confBandRatio`, the two `M_Z`-refined screenings
        recombine to the confinement-band screening (`mzWaypoint_refines_confBand`, via `cutLog_mul`);
    (3) THE `M_Z` READING OFF THE EXACT WAY-POINT: `invAlphaMZ vz = 1582/27 + bandScreen d vz`
        (`invAlphaMZ_off_ewpoint`) — a partial sum off the banked exact electroweak way-point;
    (4) ★ THE ENDPOINT IS INVARIANT UNDER THE `M_Z` REFINEMENT (the consistency tooth):
        `invAlphaZero (mzWaypointList vz zL d) = invAlphaZero (completeBandList d)`
        (`endpoint_invariant_under_MZ_refinement`) — inserting the `M_Z` edge never moves the endpoint;
    (5) THE ENDPOINT READS THROUGH `M_Z`: `invAlphaZero (completeBandList d) = invAlphaMZ vz +
        totalScreening (mzBelow zL d)` (`endpoint_reads_MZ`) — `1/α(0) = 1/α(M_Z) + (below screening)`;
    (6) THE EXACT WAY-POINT `1582/27` FALLS FREE FROM THE REFINED LIST (`ewWaypoint_in_mzList`) —
        unchanged by the refinement, the overconstraint check passes;
    (7) THE `M_Z` READING GENUINELY SCREENS: `42 < invAlphaMZ vz` (`invAlphaMZ_gt_42`) and is STRICTLY
        below the full endpoint (`endpoint_gt_invAlphaMZ`) — a genuine partial sum;
    (8) THE WEINBERG READING: stationary `3/8` at the matter depth (`sinSqMZ_stationary`), strictly
        below `3/8` for the non-abelian-reduced depth (`sinSqMZ_below`).

    Statable from no single conjunct alone (non-hollow). ⚠ HONEST GRADE: (1)–(8) THEOREM-EXACT now
    (closed reals of `Cut`, quantified over the FORCED product constraint, no error bar). ROUTE-NOT-YET-
    FOUND (the enumerated ℝ-descent, NEVER asserted / NEVER fitted, exactly the banked X6/X7/Z6 status):
    the single closed rational NUMERAL for the `v/M_Z` sub-band ratio `vz` and the light-quark /
    hadronic per-band census freeze-out — handed to Z8. The measured `α(M_Z) ≈ 127.955` and
    `sin²θ_W(M_Z) ≈ 0.23122` are REMOVABLE PROSE ONLY; the `M_Z` reading here is a derived partial sum
    squeezed between the octonion ceiling and the derived endpoint, never a claim to the measured value,
    never a fit. No empirical number in any proof. -/
theorem wayPointReadings_landing (vz zL d M mz : Cut)
    (hvz1 : 1 ≤ vz) (hzL1 : 1 ≤ zL) (hprod : vz * zL = confBandRatio)
    (hmz : 0 < mz) (hmzM : mz < M)
    (h2 : invAlpha2 isoDepth kappaLeading M mz ≠ 0) :
    -- (1) the forced product constraint (the M_Z scale refines the confinement band)
    ((ewEdgeScale / mz) * (mz / confEdgeScale) = confBandRatio)
    -- (2) the sub-band telescoping
    ∧ bandScreen chargeTraceDepth vz + bandScreen chargeTraceDepth zL
        = bandScreen chargeTraceDepth confBandRatio
    -- (3) the M_Z reading off the exact way-point
    ∧ invAlphaMZ vz = 1582 / 27 + bandScreen chargeTraceDepth vz
    -- (4) the endpoint is invariant under the M_Z refinement (the consistency tooth)
    ∧ invAlphaZero (mzWaypointList vz zL d) = invAlphaZero (completeBandList d)
    -- (5) the endpoint reads through M_Z
    ∧ invAlphaZero (completeBandList d) = invAlphaMZ vz + totalScreening (mzBelow zL d)
    -- (6) the exact way-point 1582/27 falls free from the refined list
    ∧ invAlphaZero (mzWaypointList vz zL d)
        = 1582 / 27 + totalScreening ((chargeTraceDepth, vz) :: mzBelow zL d)
    -- (7) the M_Z reading genuinely screens above the ceiling and is strictly below the endpoint
    ∧ 42 < invAlphaMZ vz
    ∧ invAlphaMZ vz < invAlphaZero (completeBandList chargeTraceDepth)
    -- (8) the Weinberg reading: stationary 3/8, departing down at the reduced depth
    ∧ sinSqRunExact isoDepth M mz = 3 / 8
    ∧ (∀ d2 : Cut, 0 < d2 → d2 < isoDepth → sinSqRunExact d2 M mz < 3 / 8) :=
  ⟨mz_edge_product mz (ne_of_gt hmz),
   mzWaypoint_refines_confBand vz zL (lt_of_lt_of_le zero_lt_one hvz1)
     (lt_of_lt_of_le zero_lt_one hzL1) hprod,
   invAlphaMZ_off_ewpoint vz,
   endpoint_invariant_under_MZ_refinement vz zL d (lt_of_lt_of_le zero_lt_one hvz1)
     (lt_of_lt_of_le zero_lt_one hzL1) hprod,
   endpoint_reads_MZ vz zL d (lt_of_lt_of_le zero_lt_one hvz1)
     (lt_of_lt_of_le zero_lt_one hzL1) hprod,
   ewWaypoint_in_mzList vz zL d,
   invAlphaMZ_gt_42 vz hvz1,
   endpoint_gt_invAlphaMZ vz zL (lt_of_lt_of_le zero_lt_one hvz1) hzL1 hprod,
   sinSqMZ_stationary M mz h2,
   fun d2 hd2p hd2lt => sinSqMZ_below d2 M mz hd2p hd2lt hmz hmzM⟩

end

end Phys.Algebra.WayPointReadings
