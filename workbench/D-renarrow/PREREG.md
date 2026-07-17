# PREREG — ARC-D REMAINDER: RE-NARROW THE COMPLETE COMPOSED SUM (node = obstruction + redirect)

## The ticket premise, tested against the banked objects — and FALSIFIED
Ticket: "re-narrow the COMPLETE composed sum (D2b+D2c+D2d+D2e) toward the ≥15-digit floor →
then D7 RESTATE the certified bracket AS 1/α(0) at ≥15 significant digits."

I read the full composition stack (TheNumeral D7, FreezeoutComposition D8, RecombinedEndpoint
D2b, PerChannelDressing D2c, JoinContent D2d, HadronicLevelWeights D2e). Every banked capstone
carries a ROUTE-NOT-YET-FOUND bounded parameter:
  • D2c  s   (isospin anti-screening magnitude)     bounded 0 < s < isoDepth = 2
  • D2d  j   (transmutation-join splitting ratio)   bounded 1 < j
  • D8   rb,rc,rl (quark-threshold edge ratios)      bounded 1 < r  (the quark mass ℝ-descent)

## The EXACT magnitude finding (rational arithmetic, no floats — workbench/D-renarrow/spread_exact.py)
The most-composed banked object is `dressedInvAlphaEMJoin w s j bands` (D2d = D2c dressed
recombination + join). Using the banked closed form and the banked D7 numeral lower bound:
  totalScreening(charge list) = S ≥ 12007329939722/176714586765 − 42 = 4585317295592/176714586765 ≈ 25.9476
  screening unit T = totalScreeningWith 1 (charge list),  chargeTraceDepth·T = S,  chargeTraceDepth = 16/3
  the value's SPREAD over s ∈ (0, isoDepth) at the derived weight w = depthWeight = 1/3:
      spread = (isoDepth · T)/(1 − w) = (3/2)·(3/16)·S·(16/9)… = 9S/16 = 573164661949/39269908170 ≈ 14.60
So the complete composed 1/α(0) FLOATS BY ≈ 14.6 from the single free parameter s alone (j and
freeze-out add up to ≈ 2 and ≈ 6.6 more, all POSITIVE — they only WIDEN the spread).

## The obstruction (exact, two-sided)
A ≥15-significant-digit two-sided bracket on a value ≈ 137 needs width < 10⁻¹¹. But the value is
NOT DETERMINED to width < 1 while s is free: two admissible parameter points (s = 1/2 and s = 3/2,
both in the banked open range (0, isoDepth)) give composed values differing by exactly
(3/2)·T = 9S/32 ≥ 9/32·(4585317295592/176714586765) ≈ 7.30 > 1.  Hence NO bracket narrower than 1
can contain the composed numeral across admissible s ⟹ ≥15 digits is MATHEMATICALLY IMPOSSIBLE
until s (then j, then rb/rc/rl) is DERIVED. Reaching 137.036 by pinning s ≈ 1.9 would be FITTING to
the measured value — G2-forbidden.

## The SOUL diagnosis
This is the ONE LAW + the REPEATED-DEFERRAL signal (the same high-value front — the ℝ-descent of
the threshold parameters — deferred across D2c/D2d/D8 for the same posit-risk reason). The correct
move is NOT to fake a bracket (fit), NOT to block emptily, but to (1) NAME the blocker as an exact
theorem, and (2) CHILD ONE directed route-finder to DERIVE the DOMINANT blocker s — the isospin
anti-screening magnitude — from the banked trace-form cross-normalization (Z1 hsCensus Imat = 16 →
doublet running census isoDepth = 2 = Tr(T₃²)), turning the ≈14.6 spread into a pinned value. That
route-finder IS the single successor, REPLACING the generic re-narrow/D7-restate. NOT a runway
(autonomous theory-native forward node exists → child it, no needs_input).

## The node I build: Phys/Algebra/ComposedNumeralObstruction.lean
Theorems (all over the derived ℝ Cut, physics-words-removable, not free-floating — TYPE cites the
banked dressedInvAlphaEMJoin / depthWeight / totalScreeningWith / chargeTraceDepth / isoDepth /
completeBandList / theNumeral_bracket):
  • totalScreening_ge_numeral      — S ≥ 4585317295592/176714586765 (from the banked D7 numeral)
  • composed_s_difference          — exact: joinContent cancels; diff = ((s2−s1)·T)/(1−w)
  • composed_difference_at_depthWeight — at w=1/3, s∈{1/2,3/2}: diff = (3/2)·T (exact spread)
  • composed_numeral_unpinnable    — 1 < that spread (from S ≥ numeral, chargeTraceDepth·T = S)
  • no_narrow_bracket              — ANY [lo,hi] containing the value at both admissible points ⟹ 1 < hi−lo
  • admissible_points, points_distinct — W8 teeth (both s-points in banked (0,isoDepth); distinct)
  • composedNumeralObstruction_landing — welded capstone, non-hollow

## Costume C533; append #print axioms + import line to Audits/AxiomAudit.lean; gate-fast (bg, poll).
## Successor: ONE directed route-finder — DERIVE s (dominant blocker). No generic SELECT (rail).
