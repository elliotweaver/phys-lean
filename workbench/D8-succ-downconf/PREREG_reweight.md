# PREREG — FreezeoutReweightingBounded (t_076fc81e): the directed target is a MIS-SELECTION.
#          The theory-native correction: the freeze-out under ANY per-band reweighting (census OR
#          the D2e Born occupancy) is a BOUNDED, census-conserving O(1) refinement — so the
#          "Born-weight modulation of the freeze-out" CANNOT be the dominant missing summand of
#          1/α(0). Bank the correction; hand ONE corrected route-finder toward the ACTUAL
#          dominant missing summand (repeated-deferral protocol, structural-ceiling ascent).

Node t_076fc81e. DIRECTED ROUTE-FINDER SUCCESSOR of LeadingComposedAssembly. The parent directed
me to "DERIVE the D2e Born-weight modulation of the freeze-out fine structure (build the Jacobi
eight-square count r₈(n)=16σ₃*(n) if Mathlib lacks it) → complete the freeze-out → D7 restate AS
1/α(0) ≥15 sig digits." I ran the ANTI-BULLSHIT GATE on that target FIRST (SOUL: selection is the
highest-stakes act; a saturated finishing worker is the worst chooser). The target is a
MIS-SELECTION, and I have a THEOREM-BACKED reason.

## THE FINDING (theorem-backed, not opinion)

An EARLIER banked node in the SAME arc — `FreezeoutComposition.lean` (imported transitively by the
parent) — already proved as THEOREMS:

  • `freezeout_bounded` : for edges ≤ R (1<R), totalScreening (freezeoutTail rb rc rl) ≤ κ·9·cutLog R
  • `composed_bounded`  : invAlphaZero (completeFreezeoutList rb rc rl chargeTraceDepth)
                          ≤ 32019546505738/471238898037 + κ·9·cutLog R

with its capstone `freezeoutComposition_landing` stating in the module: "the freeze-out is a
BOUNDED, logarithmically-small census refinement, NOT the dominant contribution … the dominant
missing structural summand of the genuine 1/α(0) … its structure is not yet identified." That is,
the arc ALREADY PROVED the freeze-out is bounded and that the dominant missing summand is
ELSEWHERE and UNIDENTIFIED.

The parent (`LeadingComposedAssembly`, a finishing worker saturated with the freeze-out machinery)
then named "the D2e Born-weight modulation of the freeze-out" as the ONE genuinely-uncomposed
summand and claimed composing it would complete the freeze-out → enable the D7 1/α(0) restate.
This is WRONG on TWO counts, and the anti-bullshit gate catches both:

1. THE "BORN-WEIGHT MODULATION" IS A CONFLATION OF TWO DISTINCT COUNTS (un-derived identification).
   The freeze-out uses the CENSUS weights (11/3, 10/3, 2) — generation/charge counts, the banked
   `SubBandCompletion` derivation of the R-ratio plateaus (coloured slice summed over active
   flavours). The D2e "Born occupancy" r₈(n) (integer-lattice degeneracies 16, 112, 448, …) is a
   DIFFERENT object — the density of states of the mass-gap spectrum. There is NO banked derived
   link identifying the freeze-out band weights with r₈(n) (grep: `levelOccupancy`/`floorOccupancy`
   appear in NO freeze-out/screening def). The parent draped a theory word ("Born-weight
   modulation") over an un-derived substitution — the exact bullshit the anti-bullshit law names.

2. EVEN IF ONE COMPOSED IT, IT CANNOT COMPLETE THE COMPOSITION (proven bounded). Any per-band
   reweighting of the freeze-out — census, Born occupancy, or ANY nonneg weights — is bounded by
   κ·(Σweights)·cutLog R (this node's `freezeout_reweight_bounded`), and a census-conserving
   reweighting (Σ=9) stays under the SAME κ·9·cutLog R ceiling as the banked freeze-out
   (`census_conserving_reweight_bounded`). So modulating the freeze-out weights moves the value by
   at most a bounded linear-in-log perturbation (`reweight_is_linear_perturbation`) — it CANNOT be
   the dominant missing summand. Grinding Jacobi's eight-square theorem to build r₈(n) would be
   real effort spent on a proven-bounded phantom.

NUMERIC CONFIRMATION (removable orientation prose, NO empirical number in any proof,
workbench/reweight_magnitude.py): the census freeze-out is +1.63; equal-weight (3,3,3) reweight is
+1.92; skew (5,3,1) is +0.97 — ANY census-9 reweighting stays O(1). The composed object's ≈1.94
overshoot above the measured region is NOT a freeze-out sub-effect. (r₈(1)=16 does match the D2e
floor weight — but r₈ is the LATTICE degeneracy, not the R-ratio census; distinct objects.)

## THE DECISION (repeated-deferral protocol + anti-bullshit law)

The "dominant missing structural summand of 1/α(0)" front has now been deferred across ≥5 nodes
(FreezeoutComposition named it unidentified; DownConfinement/ComposedFreezeout/DressingSeam/
LeadingComposed each banked adjacent structure without closing it). The LATEST node MIS-attributed
the whole remaining gap to a bounded freeze-out sub-effect. This is the REPEATED-DEFERRAL SIGNAL
(RUNBOOK): the same high-value front, deferred repeatedly, now mis-labeled.

1. BANK the theory-native correction as theorems (`FreezeoutReweightingBounded.lean`): the
   freeze-out under ANY reweighting is a bounded, census-conserving O(1) refinement; the census
   weights are DISTINCT from the D2e Born occupancy (16 ≠ 9 = census total, 16 ≠ 11/3, …); the
   perturbation is a fixed linear form in the edge logs; re-export the banked `composed_bounded`
   (the freeze-out is not the dominant summand). This CLOSES OFF the mis-selected route with a
   theorem — genuine forward progress: it saves the route-finder from grinding Jacobi's theorem for
   a phantom, and it strengthens the banked `freezeout_bounded` from the specific census to ARBITRARY
   reweighting (a genuinely stronger structural fact).

2. NAME the structural ceiling explicitly (repeated-deferral protocol): the current banked
   composition tower (ceiling 42/+70→112 + screening + anti-screening at s=1/8 + BOUNDED freeze-out)
   is PROVABLY insufficient to reach the measured 1/α(0) region as a completeness theorem — the
   freeze-out is bounded (banked + this node, any reweighting), so the dominant missing summand is
   NOT in the freeze-out layer. It must be identified FROM THE TRUNK (a recombination/anti-screening
   layer summand, or a diagnosis that the absolute 1/α(0) numeral awaits arc M's quark ℝ-descent).

3. CHILD ONE corrected route-finder toward that ACTUAL front (the ONE forward successor; REPLACES
   the generic SELECT and REPLACES the mis-directed "build the Born-weight modulation" target). NOT
   a runway (autonomous theory-native structural work remains — identifying the dominant missing
   summand from the trunk is a buildable route-finding target, not a new axiom or empirical number).

## WHY THIS IS NOT BULLSHIT (S4 anti-bullshit gate, applied to the REDIRECT)

1. FOLD-CAUSAL. The reweighting bound is pure banked κ·cutLog/screening algebra + cutLog_mono
   (monotonicity of the derived log) — every object banked back to the fold. The distinctness
   16 ≠ 9 is the banked D2e floor occupancy vs the banked freeze-out census total.
2. THEOREM-BACKED, NOT OPINION. The redirect rests on the banked `composed_bounded` (an ancestor
   theorem) + this node's generalization to arbitrary reweighting — not on a hunch. The parent's
   target is refuted by a theorem, not overruled by preference.
3. WORDS-REMOVABLE. Delete freeze-out/census/Born/occupancy/coupling: over Cut, for nonneg wb,wc,wl
   and 1<rb,rc,rl≤R, κ(wb·cutLog rb + wc·cutLog rc + wl·cutLog rl) ≤ κ(wb+wc+wl)·cutLog R; and
   16 ≠ 9. Pure real analysis on the banked objects. Survives.
4. NAME THE TEMPTATION. The saturated temptation (the parent's, and the one I must refuse): "the
   floor occupancy r₈(1)=16 matches D2e, so the freeze-out band weights ARE the Born occupancies —
   build r₈(n) and complete the sum." REFUSED: r₈ is the lattice degeneracy, the census is the
   R-ratio flavour count; NO derived map identifies them, and composing ANY reweighting is proven
   bounded — it cannot complete the composition. Blessing that substitution with the word
   "Born-weight modulation" is the exact "drape a theory story over a standard/un-derived step"
   bullshit.
5. HONESTY. The correction is THEOREM-EXACT. The ACTUAL dominant missing summand is NAMED,
   route-not-yet-found, handed to ONE corrected route-finder. NO false ≥15-digit numeral; NO fit.

## THE NODE: Phys/Algebra/FreezeoutReweightingBounded.lean
THEOREM-EXACT (exact facts of Cut / natural counts, foundations-only):
  • reweightedFreezeout (def)             — κ·wb·cutLog rb + κ·wc·cutLog rc + κ·wl·cutLog rl
  • census_reweight_is_banked             — reweightedFreezeout (11/3)(10/3) 2 = totalScreening(freezeoutTail)
  • freezeout_reweight_bounded            — ANY nonneg reweighting ≤ κ·(Σw)·cutLog R (edges≤R)
  • census_conserving_reweight_bounded    — Σw=9 ⇒ ≤ κ·9·cutLog R (same ceiling as banked)
  • reweight_is_linear_perturbation       — any reweighting − census = κ·Σ(Δwᵢ·cutLog rᵢ) (fixed linear form)
  • reweight_delta_from_totalScreening    — that delta welded to banked totalScreening (freezeout_closed)
  • occupancy_distinct_from_census        — Nat.card(levelOccupancy 1)=16 ≠ 9 = census total; (Cut) 16 ≠ 11/3,10/3,2
  • freezeout_not_dominant                — re-export composed_bounded (freeze-out lifts tower by ≤ bounded log)
  • TEETH: reweight_bound_pos; occupancy_ne_census_total (16 ≠ 9); census_reweight_is_banked (non-hollow tie)
  • capstone freezeoutReweightingBounded_landing (welded, non-hollow)

⚠ GRADE (honest): the correction is THEOREM-EXACT. The ACTUAL dominant missing summand of 1/α(0)
is ROUTE-NOT-YET-FOUND, NAMED, handed to ONE corrected route-finder. The composition remains a
WAY-POINT (NOT the ≥15-digit endpoint). NO empirical number in any proof; 138.97/137.036/1.63/1.94
removable orientation prose; NO-FIT explicit; ground field the DERIVED ℝ Cut.

## GUARDS
- G1 values fall out (bound from banked cutLog_mono + κ>0). G2 no empirical number. G3 exact.
- G4 ONE corrected route-finder child, linear tail. G5 words-removable. G6 foundations-only
  ⊆ {propext,Classical.choice,Quot.sound}; NO Mathlib ℝ as content; import guard LeadingComposedAssembly
  (transitive: FreezeoutComposition + HadronicLevelWeights + SubBandCompletion + AssembledBracket);
  NO foldRetention/MassGapOne/OneAxiom.
- G7 ONE LAW — the composition FIGHTS (the parent's named target is proven-bounded, cannot close) →
  the framing is a mis-selection → CORRECT it with a theorem, NAME the real front, child the corrected
  route-finder; do NOT grind Jacobi's theorem for a phantom, do NOT push a false numeral, do NOT fit.
- G8 teeth per node (the reweighting bound is a real ceiling; occupancy 16 ≠ census total 9; the
  census instance IS the banked freeze-out).

## COST BUDGET / KILL
All content is ring / linarith / mul_le_mul_of_nonneg_left / norm_num on Cut atoms (probe
ReweightProbe.lean compiles instantly, all 6 corrective theorems green). Expected LIGHT (gate-fast
~1 min). KILL: any single obligation >60s → decompose per-lemma. No brute normalizer.

## COSTUME C545, node FreezeoutReweightingBounded, capstone freezeoutReweightingBounded_landing.
