# VERDICT — BASE-GEM CENSUS ADJUDICATION
Date: 2026-08-08. Head: 3f4629e0. Prereg: PREREG.md (this directory). Recon lane — no repo file modified.

## (a) THE ANSWER

**The fold forces the active-span census 5/3 for the base gem. The production base's 16/9
gem IS the freeze-out staircase's light-edge term — the SAME summand, appearing once —
so N574's active-span correction applies to it directly. The true base is 7259/54, and
the correction ALSO moves the cInner log weights ((7/3, 11/3) → (3, 10/3) on L_mb, L_b0;
the −5/3 on L_b2 is unchanged). The two frames are NOT distinct summands and NOT
underdetermined.**

### The chain of inference (theorems bind; docstrings only orient)

1. **The base gem is literally the dissolved staircase light term (SAME summand).**
   `PerChannelRecombination.recomposedEndpoint_closed` (line 282): the endpoint is
   `7179/54 + leptonTailScreen + freezeoutStaircaseSummand`, where
   `freezeoutStaircaseSummand := 16/9 + κ·[(7/3)L_mb + (11/3)L_b0 − (5/3)L_b2]` (line 232).
   `D7DepthTwoComposed.recomposedEndpoint_cInner` (line 208): the SAME endpoint equals
   `2425/18 + κ·cInner`. So `2425/18 = 7179/54 + 16/9` is an ARITHMETIC REGROUPING of the
   one assembly: the base's 16/9 is the rational residue of the staircase light edge's
   dissolution (`ComposedFreezeoutDissolved.freezeout_summand_dissolved`, where
   `confinement_rung_rational` shows 16/9 = κ·2·(8π/3) with the 2 being censusLightBand's
   weight on `rl = edgeLight`, span (Λ, m_s)). There is no independent "plateau" gem term
   anywhere in the banked assembly — the gem enters the endpoint exactly once, through the
   staircase.

2. **censusLightBand's banked origin is the OLD staircase weight, not a distinct object.**
   `SubBandCompletion.lean:196`: `def censusLightBand : Cut := bandCensus [2,1,1]` — the
   {u,d,s} 3-flavour census, val 2 (line 207). It is the per-edge weight attached to the
   light span in `freezeoutTail` (line 254). No banked theorem gives the base gem a span
   distinct from the staircase light edge (Λ → m_s); the steelman for frame 1 fails:
   there is no theorem-level object of type "below-Λ plateau with census 2".

3. **The fold's own counting rule assigns that span census 5/3, not 2.**
   X3's active-content rule (a band's census is the content active THROUGHOUT its span)
   plus the removal frame (`DecouplingCensusRemoval.decoupling_removal`: below a threshold
   the decoupled content is REMOVED from the descent, never re-carried) force, over span
   (Λ, m_s), the active set {u,d} = `bandCensus [2,1] = 5/3`. `PerEdgeCensusRederived`
   proves this ab initio: `overcount_light` (line 223):
   `censusLightBand − censusActiveLightSpan = colouredCensusTerm 1` — the banked 2 keeps
   the just-decoupled strange flavour's census term (1/3), a one-threshold over-count.
   `gem_active`: κ·(5/3)·(8π/3) = 40/27; `freezeoutActive_summand_dissolved`:
   the corrected summand is `40/27 + κ·[3·L_mb + (10/3)·L_b0 − (5/3)·L_b2]`.

4. **N575 proves the lockstep AT THE THEOREM LEVEL, not just in prose.**
   `BaseNormalFormAudit.base_gem_is_light_census` (line 217):
   `κ·censusLightBand·(8π/3) = 16/9` — the base's gem uses the SAME census object N574
   corrected. `base_drop_is_strange_overcount` (line 249): the 16/9 → 40/27 drop equals
   `κ·(colouredCensusTerm 1)·(8π/3)`, tied EXACTLY to `overcount_light`.
   `base_corrected` (line 234): `6923/54 + 128/27 + 40/27 = 7259/54`;
   `base_corrected_eq` (line 237): `7259/54 = 2425/18 − 8/27`.
   The docstring's "no independent defect" claim means: the base has no defect BEYOND the
   C-layer census defect — it inherits it in lockstep. The theorems support exactly that.

5. **N579's one-cause does NOT rescue census 2 — it commits the chain to 5/3.**
   `HucDischargedFreezeoutEndpoint.endpoint_conf_one_cause` (line 185) proves the light
   gem `40/27 = bandScreen censusActiveLightSpan confBandRatio` and the full band
   `128/27 = bandScreen chargeTraceDepth confBandRatio` are ONE derived value
   (cutLog confBandRatio = 8π/3, the discharged light-edge rung — `rung_is_one_object`)
   read in two DIFFERENT censuses (5/3 ⊂ 16/3, strict) — one cause, not a double count.
   Crucially, N579 states the gem AT 40/27 (the active census), never at 16/9: the
   post-N574 banked chain has ALREADY committed the gem to 5/3.

6. **The counter-check (frame-1 steelman) fails cleanly.** The only census-16/3 lock is
   `confBand_locked_by_waypoint` (N575 line 201): the 128/27 conf band is way-point-forced
   (`6923/54 + bandScreen chargeTraceDepth confBandRatio = 7179/54`). But N575's own
   marquee (line 212) notes the gem is "the base's only census-bearing,
   non-way-point-locked piece" — no way-point, adjudicator, or teeth theorem pins census 2
   on the gem. Frame 1's 2 survives only in modules banked BEFORE the N574 re-derivation
   (`ComposedFreezeoutDissolved`, `SubBandCompletion`), which used the
   census-resolved-at-upper-edge assignment that `overcount_light` characterizes as a
   systematic off-by-one.

**Verdict: census 5/3. Base = 7259/54. The auditor's −8/27 diagnostic is INCOMPLETE:
the same correction moves cInner's log weights, adding a κ-weighted log shift.**

## (b) THE CORRECTED COMPOSITION (exact rationals; Python Fractions throughout)

Inputs (orientation midpoints of BANKED bracket theorems — exact sources cited):
- κ mid = (1/3)·mid(`inv_cutPi_bracket_ext8`, D7NarrowingRung4:265,
  [5000000000000/15707963267949, 50000000000000/157079632679489])
  = **785398163397447500000000000/7402203300817003703230194183**
- L_m01 = 815406111272601/10^16 ·(×10) → 0.0815406111272601 (`cutLog_m01` split@7, D7NarrowingRung3)
- L_mb = −0.0408930664000671, L_b0 = 0.01733728794954635, L_b2 = −0.01088723725223625
  (banked sharp edge-log bracket mids, D7NarrowingRung3/4)
- dressing 3/2 = 1/(1−depthWeight), depthWeight = 1/3 (banked `kappaLeadingDressed_eq_div`).

**Corrected base:** 7259/54 (= 2425/18 − 8/27), exact.

**Corrected endpoint (dressed):**
`7259/54 + (3/2)κ·[2·L_m01 + 3·L_mb + (10/3)·L_b0 − (5/3)·L_b2]`
= 47768884345308134755116131670999173/355305758439216177755049320784000 ≈ 134.4444417539047
(banked-frame endpoint at same mids: ≈ 134.7459967109972).

**Endpoint / F0 bracket shift (exact at the mids):**
ΔF0 = Δendpoint = −8/27 + (3/2)κ·[(2/3)·L_mb − (1/3)·L_b0]
= **−107144212740841591912190703385507/355305758439216177755049320784000**
≈ −0.30155495709245944
  - pure census part: −8/27 exactly (≈ −0.296296)
  - log-weight part: −622810820851772340601906483169/118435252813072059251683106928000
    ≈ −0.00521866 (this is what the −8/27-only diagnostic missed).
(F0 = recomposedEndpointDressed − (3/5)·κ, `MirrorFixedPoint.F0`:159; the obstruction
term is frame-independent, so ΔF0 = Δendpoint exactly.)

**Fixed-point landing shift** — root of `residual a = a·F0 − (16/9)·κ·a³ − 1`
(`MirrorFixedPoint.residual`:174; the mirror coefficient 16/9 here is
chargeTraceDepth·depthWeight = (16/3)·(1/3), a DIFFERENT object from the gem — it is NOT
corrected; verified distinct in `MirrorSelfInsertionLaw`). Bisection to 200 binary digits,
Fractions only:
- landing (banked frame, 1/a at root): 134.682324334914568…
- landing (active frame): 134.380769331099003…
- **landing shift = −0.301555003815550… ; as a rational at the stated mids the shift is
  the exact algebraic root-difference; its 10^14-denominator convergent is
  −3495192503801/11590563776348. The leading pure-census component is exactly −8/27.**

## (c) FALLOUT INVENTORY

| Module | Mentions | Classification |
|---|---|---|
| `SubBandCompletion` (censusLightBand def, freezeoutTail) | censusLightBand=2 | **needs restate** — census def stays (it IS bandCensus [2,1,1]) but its ROLE as the light-span weight is the over-count; freezeoutTail needs the active weights |
| `ComposedFreezeoutDissolved` | 16/9 gem, (11/3,10/3,2) weights | **needs re-derivation** — superseded by `freezeoutActive_summand_dissolved`; keep as historical bank |
| `PerChannelRecombination` | freezeoutStaircaseSummand 16/9, recomposedEndpoint | **needs re-derivation** (active-weight summand + endpoint) |
| `D7DepthTwoComposed` | 2425/18, cInner | **needs re-derivation** — base → 7259/54, cInner → (2, 3, 10/3, −5/3) weights |
| `D7NarrowingRung1–4` | 2425/18 normal form, endpoint brackets | **needs restate** — bracket machinery reusable, constants shift |
| `BaseNormalFormAudit` (N575) | both bases, both gems | **unaffected** — it PROVES the correction; it is the adjudicator |
| `PerEdgeCensusRederived` (N574) | 40/27, active weights | **unaffected** — source of truth |
| `HucDischargedFreezeoutEndpoint` (N579) | 40/27 gem, one-cause; but `bare_endpoint_restated` re-exports the OLD bracket | **needs restate** (the D7 restatement section only; one-cause theorems unaffected) |
| `DecouplingCensusRemoval` | removal frame | **unaffected** |
| `MirrorFixedPoint` / `MirrorResidualWelded` / `MirrorRootExistence` / `MirrorRootGlobal` / `AlphaLandingCapstone` / `AlphaLandingFinal` | F0 via recomposedEndpointDressed; mirror 16/9 | **needs restate** — F0 shifts by ΔF0 above; the mirror coefficient 16/9 (chargeTraceDepth·depthWeight) is UNTOUCHED |
| `FreezeoutComposition`, `FreezeoutReweightingBounded`, `LeadingCarrierExhausted`, `D7AugmentedAttestation` | censusLightBand in ≠-teeth only | **unaffected** (inequality teeth remain true) |

## (d) SELF-CHECK (NO-FIT)

No step used the measured value. 137.036 appears in this file only inside prereg-quoted
context and this sentence; it entered NO inference. The verdict was reached before any
landing arithmetic, purely from: same-summand identity (step 1), X3 active-content rule +
removal frame (step 3), and the lockstep theorems (step 4). Note the corrected landing
moves AWAY from the measured value — the strongest possible no-fit witness (as N574
itself recorded).

Numerals used, with banked sources:
- 2, 5/3, 10/3, 16/3, 1/3, 4/3 — bandCensus/colouredCensusTerm (X3), chargeTraceDepth (X6)
- 16/9, 40/27, 128/27, 8/27 — `confinement_rung_rational`, `gem_active`,
  `bandScreen_conf_exact`, `base_drop_rational`
- 8π/3 — `confRung_val` / X9 confBundle
- 2425/18, 7179/54, 6923/54, 7259/54 — `recomposedEndpoint_cInner`,
  `recomposed_conf_waypoint`, `recomposed_EW_waypoint`, `base_corrected`
- 3/2, 1/3 (dressing) — `kappaLeadingDressed_eq_div`, `depthWeight_eq`
- 3/5·κ obstruction — `MirrorFixedPoint.F0`
- κ bracket — `inv_cutPi_bracket_ext8`; edge-log mids — D7NarrowingRung3/4 bracket theorems
  (orientation mids; every load-bearing arithmetic step used exact Fractions).
