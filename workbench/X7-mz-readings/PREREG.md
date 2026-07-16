# X7 PREREG — α(M_Z) and sin²θ_W(M_Z), the intermediate readings

## Target (seed §X7)
The M_Z-scale readings 1/α(M_Z) and sin²θ_W(M_Z) as INTERNAL WAY-POINTS of the same band-tower
assembly (X6) / running self-overlap (X2), read at a further band edge. M_Z is NOT a special
reference scale — it is one more band edge in the FINITE tower descending from the octonion ceiling.

## THE THEORY-NATIVE READING (the content beyond X6/X2)
X6 gave the FULL zero-momentum tower `invAlphaZero` and its EXACT top band (1582/27 at electroweak v).
X2 gave the scale-resolved running `invAlphaRunExact`/`sinSqRunExact`. X7's NEW content:

1. THE INTERMEDIATE READING = A PARTIAL SUM. The reading at any band edge is `invAlphaZero` applied
   to the bands ABOVE that edge. The FULL tower DECOMPOSES ADDITIVELY at ANY edge:
       invAlphaZero (above ++ below) = invAlphaZero above + totalScreening below.
   This IS "M_Z is a band edge; 1/α(0) = 1/α(M_Z) + (screening below M_Z)."
2. THE BRACKETING: 42 ≤ 1/α(edge) ≤ 1/α(0) for a screening below-edge tower. The intermediate
   reading is squeezed between the octonion ceiling and the zero-momentum value.
3. THE EXACT ELECTROWEAK WAY-POINT: at the EW edge v, bands above = [top band] → the EXACT 1582/27
   (banked `invAlphaZero_topBand_value`). M_Z is a further edge below v: reading = 1582/27 +
   (v→M_Z sub-band screening). 1582/27 is an EXACT lower way-point for the M_Z reading; the v→M_Z
   sub-band needs the v/M_Z ratio (NOT banked exactly → route-NOT-YET-FOUND, enumerated for X10).
4. sin²θ_W(M_Z) via banked `sinSqRunExact` (X2): stationary EXACT 3/8 at matter isospin depth;
   runs strictly below 3/8 for the non-abelian-reduced isospin depth. Read at the SAME band edge as
   1/α — both observables are scale-resolved evaluations of the SAME gather self-overlap.

## ANTI-BULLSHIT GATE (theory-native, not standard-physics dressed up)
- FOLD→NODE: fold→cascade→octonion terminal (42 chan)→invAlphaHigh=42→running as scale-resolved
  self-overlap (X2)→finite band tower (X6)→reading at an intermediate band edge is a PARTIAL SUM (X7).
- STANDARD VERSION: "run the SM coupling from low energy up to M_Z with measured thresholds." The
  theory does something DIFFERENT: reads M_Z as a NON-special band edge in a FINITE tower from the
  octonion ceiling, reading = a PARTIAL sum with a cutPi-free EXACT way-point (1582/27), no measured
  threshold input, no Landau pole. It DISSOLVES M_Z's "reference-scale" status.
- WORDS-REMOVABLE: "f(above++below)=f(above)+Σ(below); at the exact ratio cutExp(28π/3) the
  single-term reading = 1582/27; 42 ≤ f(above) ≤ f(above++below) for a screening tail; the ratio
  a₂/(a₂+a_Y) = 3/8 at the proportional depth, < 3/8 for reduced depth." Pure real analysis on Cut.
- STANDARD TEMPTATION refused: NO measured M_Z/v ratio, NO measured α(M_Z)=127.955, NO measured
  sin²θ_W=0.23122 in any proof. The v→M_Z sub-band ratio is route-NOT-YET-FOUND (enumerated for X10),
  never asserted/fitted.

## GRADE (honest)
THEOREM-route, EXACT for: the additive edge decomposition; the 42 ≤ edge ≤ zero-momentum bracketing;
the EXACT electroweak way-point 1582/27 as an exact lower bracket of the M_Z reading; the Weinberg
matter-stationary 3/8 and the reduced-depth departure. Route-NOT-YET-FOUND (enumerated for X10): the
fully-evaluated 1/α(M_Z) numeral (needs the v→M_Z sub-band ratio) and the sin²θ_W(M_Z) numeral (needs
the reduced isospin depth d2 and M/M_Z ratio). NO numeral asserted/fitted.

## PLAN (production: Phys/Algebra/FineStructureMZReadings.lean)
- invAlphaZero_append : the additive edge decomposition (List.map_append + List.sum_append).
- invAlphaAt_le_invAlphaZero : intermediate reading ≤ zero-momentum (screening tail).
- invAlphaAt_ge_42 : intermediate reading ≥ 42 (reuse invAlphaZero_ge_42).
- invAlphaZero_at_ew_edge : reading at EW edge = 1582/27 (reuse invAlphaZero_topBand_value).
- invAlphaMZ_decomp : reading at M_Z (below EW) = 1582/27 + totalScreening belowV (exact way-point +
  route-NOT-YET-FOUND tail).
- invAlphaMZ_ge_ewpoint : M_Z reading ≥ 1582/27 for a screening sub-band (exact lower bracket).
- sinSqMZ_matter_stationary / sinSqMZ_departs_down : the Weinberg reading at M_Z (reuse X2).
- TEETH: invAlphaMZ_gt_42 (genuine screening above M_Z); way-point ≠ wrong; sin²θ_W ≠ 1/4.
- CAPSTONE mzReadings_landing : weld the 1/α decomposition + bracketing + exact way-point + Weinberg.

## DISCIPLINE
STANDARD (unbroken/complete/words-removable), foundations-only (⊆ {propext,Classical.choice,
Quot.sound}; no sorry/axiom/native_decide/foldRetention; import guard: NOT MassGapOne), ℝ-vigilance
(banked Cut/cutLog/cutExp/cutPi only), NO fit, EXACT, teeth, non-hollow weld, free-floating check.
Costume next Cid C491. Successor: ONE directed toward X8 (absolute lepton masses).
