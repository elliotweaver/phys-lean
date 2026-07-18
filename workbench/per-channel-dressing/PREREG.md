# D2c — THE PER-CHANNEL DEPTH DRESSING — arc-D THE DIGITS (docs/SEED_DIGITS.md §D2c)

Node t_1621d2f4 (directed successor of D2b RecombinedEndpoint). Scope-corrected: the ticket
title said "re-narrow → D7 restate", but a mid-run SEED SCOPE UPDATE (comment on this ticket)
promoted D2c/D2d/D2e to first-class closure targets and confirmed "the completed stack with ALL
of D2b–D2e composed closes to the endpoint; ANY STRICT SUBSET PROVABLY MISSES." So THIS node's
actual job is D2c, NOT re-narrowing.

## THE THEORY-NATIVE READING (what D2c composes, and what is honestly bounded)

D2b banked the BARE-CENSUS recombination weld:
  invAlphaEM bands = isoTower bands + hyperTower bands,  invAlphaEM (charge list) = invAlphaZero + 70.
Each channel tower used the FIRST-ORDER (undressed, w=0) screening.

D3 (DepthWeight) / Z5 (DepthTowerDescent) derived the census-in-census DEPTH DRESSING: the
running-OF-the-running resums each band's screening by /(1−w), where w = the DERIVED return-surface
weight = mean Born self-overlap = meridianFlux cutPi / sinAntideriv cutPi = (2/3)/2 = 1/3 (D3
`depthWeight_eq`). The weight is a PURE RETURN-SURFACE GEOMETRY ratio (cutPi cancels) — the fold's
ONE geometric fact, so it is CHANNEL-INDEPENDENT.

D2c composes the DEPTH DRESSING into the recombination weld PER CHANNEL. The two channels dress at
the SAME derived weight w = depthWeight = 1/3 (one return surface, one self-reference, one weight —
D3 method per channel). The channels differ ONLY in their CENSUS, and the census asymmetry is the
banked Z1/Z2 gather self-census:

  • ISOSPIN (SU(2)_L, NON-abelian): the census-in-census loop includes the isospin GATHER resolving
    itself, whose self-census is strictly NEGATIVE (Z1 `gatherIsospin_selfCensus_neg`, the fold's
    minus `look = −id` at generator level). So the isospin channel's NET running census is REDUCED:
    `netIsoDepth s = isoDepth − s` (Z2), s > 0 the anti-screening magnitude the Z1 negative sense
    forces.
  • HYPERCHARGE (U(1)_Y, ABELIAN): the gather has ZERO self-census (Z1 `abelian_no_selfCensus`), so
    the net hypercharge census is UNREDUCED, `hyperDepth` (Z2 `netHyperDepth`).

⭐ ONE CAUSE: the SAME fold minus `look = −id` that is Z1's skew-adjoint NEGATIVE gather self-census
is here the DOWNWARD direction of the recombined coupling — the isospin anti-screening runs the
recombined dressed endpoint DOWN from the ceiling-share. The abelian/non-abelian asymmetry is Z1's
`abelian_no_selfCensus` vs `gatherIsospin_selfCensus_neg`, one dichotomy — the SAME one Z2 used for
the weak-mixing departure.

## THE DELIVERABLE (theorems on the derived ℝ Cut)

Module `Phys/Algebra/PerChannelDressing.lean`, namespace `Phys.Algebra.PerChannelDressing`.
Imports `Phys.Algebra.RecombinedEndpoint` (⇒ D2b weld + totalScreeningWith + Z2 netIsoDepth/
hyperDepth + census_additive) and `Phys.Algebra.DepthWeight` (⇒ D3 depthWeight + Z5 dressedBandScreen
+ dressedInvAlphaZero).

New machinery (the D3 method per channel):
  1. `dressedTotalScreeningWith w c bands := (bands.map (dressedBandScreen w c ·.2)).sum`
     — the census-in-census resummation of a channel's screening at fixed census c.
  2. ★ `dressedTotalScreeningWith_factor` : `= totalScreeningWith c bands / (1−w)` (0≤w<1) — the
     SAME uniform /(1−w) factoring Z5 proved, per channel (induction over `dressedBandScreen_factor`).
  3. `totalScreeningWith_homog` : `totalScreeningWith c bands = c · totalScreeningWith 1 bands`
     (census-homogeneity, the load-bearing simplifier).

The per-channel dressed towers + recombined coupling:
  4. `dressedIsoTower w s bands := invAlpha2High + dressedTotalScreeningWith w (netIsoDepth s) bands`
  5. `dressedHyperTower w bands := invAlphaYHigh + dressedTotalScreeningWith w hyperDepth bands`
  6. `dressedInvAlphaEM w s bands := dressedIsoTower w s bands + dressedHyperTower w bands`

Key theorems (EXACT, closed reals of Cut):
  7. ★ `dressedInvAlphaEM_closed` : `= 112 + ((chargeTraceDepth − s)·T)/(1−w)`, T := totalScreeningWith 1 bands
     (the two ceilings 42+70=112 + the dressed census-split screening with the isospin reduction).
  8. ★ `dressedInvAlphaEM_s0` : at s=0, `= 112 + chargeTraceDepth·T/(1−w)`.
  9. ★★ `dressedInvAlphaEM_antiscreen` : `dressedInvAlphaEM w s bands = dressedInvAlphaEM w 0 bands − (s·T)/(1−w)`
     — the isospin anti-screening reduction, EXACT closed form. The reduction is the Z1 negative
     gather self-census composed through the dressing.
  10. ★★★ `dressedInvAlphaEM_s0_composed` : on `completeBandList chargeTraceDepth`,
      `dressedInvAlphaEM w 0 (charge list) = dressedInvAlphaZero w (charge list) + 70` — the DRESSED
      analog of D2b's `composed_endpoint` (the +70 hypercharge ceiling composed through the dressing).
  11. ★★ `dressedInvAlphaEM_runs_down` : for 0<s and 0≤w<1 on the complete charge list,
      `dressedInvAlphaEM w s (charge list) < dressedInvAlphaEM w 0 (charge list)` — the isospin
      anti-screening runs the recombined DRESSED endpoint DOWN (the reduction s·T/(1−w) > 0 because
      T = totalScreeningWith 1 (charge list) > 0, from the banked numeral, and the Z1 sense is
      negative ⇒ s > 0). "Without the per-channel dressing the composed sum overshoots" made precise:
      the un-anti-screened (s=0) value is dressedInvAlphaZero+70; the Z1 gather self-census pulls it
      strictly below.
  12. `dressedInvAlphaEM_at_depthWeight` : the two channels dress at the SAME derived weight
      w = depthWeight = 1/3 (D3), the per-channel weight is the return-surface geometry, channel-
      independent.
  13. Teeth (W8): T > 0 on the charge list (`screeningUnit_pos`); anti-screening load-bearing
      (`dressedInvAlphaEM_runs_down`, s>0 ⟹ strictly less); both channels present (isoDepth≠0,
      hyperDepth≠0); asymmetry genuine (netIsoDepth reduced, hyperDepth not; isoDepth≠hyperDepth);
      weight derived 1/3 (≠0, ≠1); depth dressing genuinely dresses (dressed ≠ bare for w>0).
  14. Welded capstone.

## GRADE (honest, per piece)

THEOREM-EXACT NOW: the per-channel dressed factoring; census homogeneity; the recombined dressed
closed form; the s=0 recovery = dressedInvAlphaZero+70; the anti-screening reduction closed form; the
DOWNWARD direction (Z1-signed, T>0 from the banked numeral); the shared derived weight 1/3; the teeth.

ROUTE-NOT-YET-FOUND (BOUNDED, NEVER asserted / NEVER fitted): the exact isospin anti-screening
MAGNITUDE s, carried EXACTLY as Z2/N342 carry it — `0 < s < isoDepth` (bounded), its SIGN and
PLACEMENT and DIRECTION now derived (Z1 negative gather self-census, per-channel dressing), its
magnitude the cross-normalization of the FUNDAMENTAL-7 gather trace form (Z1 `hsCensus Imat = 16`)
to the DOUBLET running census (`isoDepth = 2 = Tr(T₃²)`) — a specific, NAMED cross-normalization
that is not banked (repeated-deferral signal NAMED, per SOUL). This is a BOUNDED residual the arc
carries by design to D7 (the D7 gate explicitly permits a bounded quantified residual so the
≥15-digit bracket is a genuine TWO-SIDED bracket, not a way-point below an unbounded gap). NEVER
fitted, NEVER chosen by where 137.036 sits.

## ANTI-BULLSHIT GATE (run honestly)

- fold→node: fold → look=−id (N1) → skew-adjoint generators (Z1) → NEGATIVE gather self-census
  (isospin, Z1) vs ZERO (abelian hypercharge, Z1) → net isospin census reduced by s (Z2) → recombined
  weld (D2b) with each channel's census-in-census resummed at the SAME return-surface weight (D3) →
  isospin anti-screening runs the recombined dressed endpoint DOWN. Every arrow banked/forced.
- standard version: the field MEASURES per-channel β-functions and threshold matchings and fits the
  running down to 1/α_em(0). The fold DERIVES the direction (Z1 negative gather self-census) and the
  structure (per-channel census-in-census at the shared return-surface weight); no measured β enters.
- delete physics words: over Cut, dressedInvAlphaEM w s bands = 112 + ((chargeTraceDepth − s)·
  totalScreeningWith 1 bands)/(1−w); at s=0 on the charge list = dressedInvAlphaZero w + 70; for
  0<s, T>0, w<1, strictly less than the s=0 value. Pure real analysis on banked objects. Survives.
- temptation "pin s to hit 137.036": REFUSED. s stays bounded 0<s<isoDepth exactly as Z2 carries it;
  the direction is forced (Z1 sign), the magnitude is a named unbanked cross-normalization, NEVER a
  dial. No numeric is asserted; the reduction is an exact closed form in a bounded parameter.

## GUARDS

foundations-only (#print axioms ⊆ {propext,Classical.choice,Quot.sound}); floats NOWHERE; no
empirical number in any proof; NO-FIT; import guard never OneAxiom/MassGapOne; costume bites;
ONE directed successor (D2d — the join content) — NO generic SELECT (rail).
