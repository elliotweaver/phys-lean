# PREREG — t_1a7ae267 DepthTwoBandVaryingRunning (arc-D depth-2 band-varying running framework)

## SELECT resolution (ONE LAW fired on ticket framing)
Ticket said "fill the +1.94 residual ABOVE the measured region." That +1.94 is the OVERSHOOT of the
ADDITIVE/leadingCarrier frame, which owner-R2 BANKED-REJECTED (DecouplingCensusRemoval: additive
overshoots worse the more complete). In the owner-ENDORSED census-conserving frame the endpoint
UNDERSHOOTS (~135.06 high+lepton; model_full.py), and depth-2 running screens UP (κ(w)=κ₀/(1−w)>κ₀).
So the theory-native target is the BAND-VARYING second-depth running as an UPWARD correction from the
census-conserving undershoot, way-point-preserving (resolving DressingSeamResolved's uniform-only
exclusion: band-varying with weight 0 on the high way-point bands preserves 1582/27 & 190/3 while low
bands run). Framework theorem-exact NOW; per-band low-band weights RNYF → one directed successor.

## Target module: Phys/Algebra/DepthTwoBandVaryingRunning.lean
Namespace Phys.Algebra.DepthTwoBandVaryingRunning. Import Phys.Algebra.DepthWeight (transitively X5/Z5/
X6/Z4/BandEdgeList/D3) + Mathlib.Tactic. NO OneAxiom/MassGapOne/foldRetention. Ground = derived ℝ Cut.

## Definitions
- bandVaryingScreen (wbands : List (Cut × (Cut × Cut))) := Σ bandScreen q.2.1 q.2.2 / (1 − q.1)
  (each entry (w_b,(depth_b,ratio_b)): a per-band second-depth weight, NOT uniform)
- withWeight (w) (bands) := bands.map (fun b => (w, b))
- bandVaryingInvAlphaZero (wbands) := invAlphaHigh + bandVaryingScreen wbands

## Theorems (all provable, teeth)
1. bandVaryingScreen_append  (sum over ++)
2. bandVaryingScreen_uniform : withWeight w bands = dressedTotalScreening w bands  (Z5 tie-in, 0≤w<1)
3. bandVaryingScreen_zeroWeights : withWeight 0 bands = totalScreening bands
4. bandVaryingInvAlphaZero_zeroWeights : withWeight 0 bands ⟹ invAlphaZero bands (leading recovery)
5. bandVaryingInvAlphaZero_uniform : withWeight w bands ⟹ dressedInvAlphaZero w bands (Z5 tie-in)
6. ★ highBands_preserved : bandVaryingInvAlphaZero (withWeight 0 derivedBandList ++ lowTail)
      = 190/3 + bandVaryingScreen lowTail  (THE KEY: zero on high way-point bands preserves 190/3)
7. ★ bandVaryingBandScreen_gt_leading : 0<w<1, 0<depth, 1<ratio ⟹ bandScreen d r < bandScreen d r/(1−w)
      (the upward direction — depth-2 running raises the low-band screen)
8. bandVaryingBandScreen_selfref : bandScreen d r/(1−w) = bandScreen d r + w·(bandScreen d r/(1−w))
      (the census-in-census fixed point AT the band, per-band)
9. ★ zeroOnHigh_preserves_waypoint : withWeight 0 derivedBandList ⟹ 190/3 (via derivedBandList_assembly)
10. uniform_derived_moves_waypoint : withWeight depthWeight derivedBandList ⟹ 74 ≠ 190/3
      (via bandVaryingInvAlphaZero_uniform + dressed_at_depthWeight — uniform-nonzero MOVES it)
11. TEETH: varying_preserves_uniform_moves (190/3 vs 74, ≠); the strict upward inequality.
12. CAPSTONE depthTwoBandVaryingRunning_landing (welded, non-hollow).

## HARD GUARDS
NO fit (never pin any weight to hit 137.036); s stays derived 1/8 (untouched here); NO empirical
number in any statement/proof (137.036/138.97/1.94/135.06 removable prose ONLY); NO new axiom; NO
truncation; BANKED derived ℝ Cut only, NEVER Mathlib ℝ as content. #print axioms ⊆ {propext,
Classical.choice, Quot.sound}.

## Numerics-with-teeth (model_full.py, direction confirmed)
census-conserving high+lepton ≈ 135.06 (UNDERSHOOT); depth-2 running screens UP toward the region
(ONE-LAW-correct). uniform-at-derived-weight 74 MOVES the 190/3 way-point (banked, excluded);
band-varying-zero-on-high PRESERVES it. NO number pinned to any measured value.
