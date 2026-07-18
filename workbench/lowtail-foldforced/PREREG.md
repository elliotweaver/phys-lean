# PREREG — t_7795433d  LowTailFoldForcedWeight (arc-D remainder — the low-tail second-depth weight is the ONE fold-forced constant)

## SELECT resolution (ONE LAW fired on ticket framing — comment 503)
Ticket asked to derive per-band VARYING low-tail second-depth weights w_b "each its own band's self-overlap census." The ONE LAW fires: (a) D3 DERIVES the second-depth weight as the mean Born self-overlap over the RETURN SURFACE (⟨cos²⟩ = meridianFlux/sinAntideriv = (2/3)/2 = 1/3); the return surface is the SAME 2-sphere for every band ⇒ the weight is BAND-INDEPENDENT. The band-specific data is the census depth_b + scale ratio_b, NOT the weight. (b) The parent's "135.06 undershoot needing new per-band dressing" is an ARTIFACT of DROPPING the banked determined weight-free quark freeze-out tail (ComposedFreezeoutDissolved `16/9 + κ·[…]`; composed_endpoint_determined is already "a fully determined closed form — no free parameter remains"). No ~2-unit gap cries out for a per-band knob. (c) A per-band VARYING weight has NO fold source; the only motive to want distinct w_b is to tune the endpoint onto 137.036 = a FIT (forbidden).

So the theory-native target REDIRECTS: the low-tail second-depth weight is the ONE fold-forced UNIFORM depthWeight (D3, band-independent); the per-band-varying weight COLLAPSES to that constant; the low-tail second-depth screen is the DETERMINED closed real `(3/2)·totalScreening lowTail`; per-band variation is a knob the fold KILLS. This RESOLVES the open front the parent handed forward (not overturns the banked FRAMEWORK, which is valid general machinery).

## Target module: Phys/Algebra/LowTailFoldForcedWeight.lean
Namespace Phys.Algebra.LowTailFoldForcedWeight. Imports: DepthTwoBandVaryingRunning (framework), DecouplingCensusRemoval (census-conserving leptonCensus/leptonTail), Mathlib.Tactic. Ground = derived ℝ Cut. NO OneAxiom/MassGapOne/foldRetention.

## Theorems (all provable over Cut, teeth)
1. foldForcedLowTailScreen (lowTail) : bandVaryingScreen (withWeight depthWeight lowTail) = (3/2)·totalScreening lowTail
     (bandVaryingScreen_uniform depthWeight + dressedTotalScreening_factor + depthWeight_eq: /(1−1/3)=·3/2)
2. foldForcedWeight_value : depthWeight = 1/3  (re-export; the band-independent value — D3)
3. foldForced_dresses_lowTail : bandVaryingScreen (withWeight 0 lt) < bandVaryingScreen (withWeight depthWeight lt) for the banked census-conserving lepton tail (T>0 ⟹ T < (3/2)T) — the fold-forced weight genuinely dresses
4. perBand_knob_real (b) (hb : bandScreen b.1 b.2 ≠ 0) : bandVaryingScreen [(0,b)] ≠ bandVaryingScreen [(depthWeight,b)]
     (a single band's weight is a REAL knob — value depends on it; the fold FORCES it to depthWeight, not free)
5. ★ conservingEndpoint_foldForced : bandVaryingInvAlphaZero (withWeight 0 derivedBandList ++ withWeight depthWeight (leptonTail leptonCensus)) = 190/3 + (3/2)·totalScreening (leptonTail leptonCensus)
     (highBands_preserved ∘ foldForcedLowTailScreen — the census-conserving endpoint with the fold-forced low-tail weight)
6. ★ conservingEndpoint_closed : = 190/3 + (3/2)·bandScreen leptonCensus (mass0/mass1)   (leptonTail_screen_telescope) — a DERIVED CLOSED REAL of Cut
7. conservingEndpoint_gt_waypoint : 190/3 < that endpoint   ((3/2)·bandScreen leptonCensus (m0/m1) > 0; leptonCensus=2>0, m01_gt_one) — bites
8. CAPSTONE lowTailFoldForcedWeight_landing (welded, non-hollow).

## HARD GUARDS
NO fit (never pin any value to hit 137.036; explicitly do NOT claim the endpoint = 1/α(0)); s stays derived 1/8 (untouched); NO empirical number in any statement/proof (137.036/138.97/135.06/136.12 removable prose ONLY); NO new axiom; NO truncation; BANKED derived ℝ Cut only, NEVER Mathlib ℝ as content. #print axioms ⊆ {propext, Classical.choice, Quot.sound}.

## Remaining open front (named, handed to ONE successor)
The COMPOSITION-COMPLETENESS attestation: proving the determined weight-free-plus-fold-weight assembly (high bands + census-conserving lepton tail + banked determined quark freeze-out) IS the complete 1/α(0) (a census-partition completeness proof), so the closed real can be stated AS 1/α(0). This node banks the low-tail weight as the ONE fold constant + the determined endpoint; it does NOT claim completeness.

## Numerics-with-teeth (ONE LAW confirmed, /tmp/onelaw_check.py)
Weight-free determined assembly (high+lepton+banked freeze-out) already ~136–137; parent's 135.06 dropped the freeze-out. The fold gives ONE weight (1/3); per-band variation = fit. NO number pinned.
