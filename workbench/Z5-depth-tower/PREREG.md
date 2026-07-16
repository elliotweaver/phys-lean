# Z5 — THE DEPTH TOWER THROUGH THE DESCENT (arc-Z ENDPOINT-ASSEMBLY, §Z5)

Directed successor of Z4 (`BandEdgeList`). Module: `Phys/Algebra/DepthTowerDescent.lean`,
namespace `Phys.Algebra.DepthTowerDescent`.

## FRONT (theory-native, chosen first)
X5 (`FineStructureAllOrdersNormalization`) banked the all-orders normalization
`kappaLeadingDressed w = dressedOverlap kappaLeading w = κ₀/(1−w)` (EXACT closed rational
function of the per-loop self-overlap weight w, 0≤w<1), the census-in-census self-reference
`κ(w) = κ₀ + w·κ(w)`, and the totalizing-forbidden pole `geometric_diverges_at_one` (w=1).
BUT X5 evaluated κ(w) IN THE ABSTRACT — no bands.

Z4 (`BandEdgeList`) banked the FIRST-ORDER band tower on the derived band list: each band's
screening increment `bandScreen depth ratio = κ₀·depth·cutLog ratio` uses the LEADING κ₀. The
derived assembly `invAlphaZero derivedBandList = 190/3` (= 42 + 448/27 + 128/27).

Z5 WELDS them: replace the LEADING κ₀ per band by the DRESSED κ(w), EXACTLY (the closed κ(w),
not a truncated (α/π)-series — a truncation is NOT the theory's claim). Because `bandScreen` is
LINEAR in κ, the census-in-census DRESSING FACTORS per band:

    dressedBandScreen w depth ratio = bandScreen depth ratio / (1−w)         (per band, exact)

so the whole tower dresses uniformly (the self-look-back weight w is the SAME unary
self-reference at every band; the census `depth` differs per band, w does not):

    dressedTotalScreening w bands  = totalScreening bands / (1−w)
    dressedInvAlphaZero w bands     = 42 + totalScreening bands / (1−w)      (EXACT closed form)

The ceiling `invAlphaHigh = 42` is NOT dressed — it is the bare octonion-scale channel COUNT
(1/α* = 42), a census count, not a loop-normalized screening increment. The census-in-census
dresses the RUNNING (the screening), never the bare count. Theory-native.

## KEY LANDINGS (all EXACT closed rationals of Cut, per band)
- `kappaLeadingDressed_eq_div` : κ(w) = κ₀/(1−w)  (unfold + X5 dressedOverlap_closed).
- `dressedBandScreen_factor`   : dressedBandScreen w d r = bandScreen d r / (1−w).
- `dressedBandScreen_topBand_exact` : dressedBandScreen w chargeTraceDepth topBandRatio
                                       = (448/27)/(1−w)   (X6 bandScreen_topBand_exact / (1−w)).
- `dressedBandScreen_conf_exact`    : dressedBandScreen w chargeTraceDepth confBandRatio
                                       = (128/27)/(1−w)   (Z4 bandScreen_conf_exact / (1−w)).
- `dressedTotalScreening_factor`    : = totalScreening bands / (1−w)  (map/sum, factor out 1/(1−w)).
- `dressedInvAlphaZero_closed`      : = 42 + totalScreening bands/(1−w).
- `dressedInvAlphaZero_derivedBandList` : dressedInvAlphaZero w derivedBandList
                                       = 42 + (64/3)/(1−w)   (576/27 = 64/3; the running-of-the-
                                       running at the confinement way-point, EXACT closed function).
- `dressedInvAlphaZero_leading` : dressedInvAlphaZero 0 derivedBandList = 190/3  (RECOVERS Z4 EXACTLY).

## TEETH (W8)
- `dressedBandScreen_selfref` : dressedBandScreen inherits census-in-census `κ(w)=κ₀+w·κ(w)` shape.
- `dressed_gt_bare_conf` : for 0<w<1, dressed conf band > bare 128/27 (the running-of-the-running
  is REAL — the dressing strictly increases each band).
- `dressedInvAlphaZero_gt_ceiling` : for 0≤w<1, 42 < dressedInvAlphaZero w derivedBandList.
- `dressed_ne_truncated` : the EXACT closed dressed conf band (128/27)/(1−w) at a witness weight
  ≠ the first-order TRUNCATION (128/27)(1+w) — the claim is EXACT, a truncation is NOT the theory's.
- `dressed_totalizing_forbidden` : geometric_diverges_at_one (w=1 pole = C6-forbidden self-blindness).
- `dressedInvAlphaZero_leading` (recovery) load-bearing anchor on Z4's 190/3.

## GUARDS
G1 values fall out (all from bandScreen linearity + X5 closed form; no asserted coupling).
G2 no empirical number (w is a STRUCTURAL variable 0≤w<1; measured α/two-loop coefficients are
   removable prose/costume only — NOT imported; the field's two-loop/threshold-matching are their
   MEASURED forms of what this depth tower COUNTS natively).
G3 EXACT — closed rational functions of Cut, no error bar, NO truncation.
G6 foundations-only ⊆ {propext,Classical.choice,Quot.sound}; derived ℝ Cut only; NO Mathlib ℝ/ℂ;
   import guard: X5/X6/Z4 only, NEVER MassGapOne/OneAxiom, no foldRetention.
G5 words-removable: pure real analysis on kappaLeading/cutPi/bandScreen/invAlphaZero over Cut.
G8 teeth above.

## COST BUDGET / KILL
Every proof is field_simp/ring/nlinarith on Cut + one map/sum induction (List.sum). No brute
coordinate expansion, no native_decide, no maxHeartbeats inflation. KILL: if `dressedTotalScreening_factor`
map/sum factoring needs >2 tactic families, decompose via a per-element congr lemma. No compile
should exceed the single-module build (~seconds over prebuilt Mathlib).

## WIRING (bank BEFORE gate)
production Phys/Algebra/DepthTowerDescent.lean + Phys.lean import + costume C499
(Counterexamples/DepthTowerDescentVacuityCostume.lean) + AxiomAudit import+#print lines +
costume_manifest row `C499<TAB>Counterexamples/DepthTowerDescentVacuityCostume.lean<TAB>1 = 499`
+ LEDGER row. Then gate-fast.sh, poll non-blocking.

## SUCCESSOR
ONE directed child toward Z6 (★★★ THE ENDPOINT — invAlphaZero over the COMPLETE derived band list
as a derived closed real of Cut, EXACT, comparison to measured removable prose).
