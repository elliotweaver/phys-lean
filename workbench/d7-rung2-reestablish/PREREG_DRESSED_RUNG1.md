# PREREG — D7 DRESSED NARROWING RUNG 1 (first narrowing rung over the TRULY-CLOSED COMPOSED endpoint)
## (t_2b137452, run 892; directed successor of N573 D7AboveFloorExact 87be64e; owner R2 v4, NO-BLOCK)

## RESUME CHECK (SOUL start-of-run mandate — done FIRST)
- git log + workbench read. The twice-reverted Rung2 (82d8aaa→0eea542, 11c746d→6a68dcd) has FULLY-WORKED,
  foundations-only DEEP EDGE-LOG instruments (~1e-12): `cutLog_b0_r2`/`cutLog_b2_r2`/`cutLog_mb_r2` over the
  banked NB11 s6 numerals + the banked ContinuumBracket exp instrument (N=17/18/21/22/29/30). Both reverts
  were COMPLETENESS concerns ("would polish a provably incomplete sum") — NOW RESOLVED: the composition is
  COMPLETE (D7DepthTwoComposed b78aefb composed the fold-forced depth-2 running) AND the ledger is TRULY
  CLOSED (D7AboveFloorExact 87be64e: above-floor contributes EXACTLY ZERO). So the deep edge logs are
  legitimately re-establishable NOW, applied to the DRESSED endpoint. This is a RESUME (advance the furthest
  probe), not a re-derive.

## THE FRONT (narrow the COMPOSED/dressed endpoint toward the ⛔ ≥15-sig-digit floor — rung 1 over dressed)
The composed endpoint (banked, D7DepthTwoComposed):
  recomposedEndpointDressed = 2425/18 + kappaLeading·(3·L_m01 + (7/2)·L_mb + (11/2)·L_b0 − (5/2)·L_b2)
  (recomposedEndpointDressed_normalform), currently bracketed [137.0984, 137.1006] (width ~2e-3, ~5 digits)
  from the RUNG-1-grade edge logs (~1e-7). Sharpen the edge logs to ~1e-12 (the banked deep instruments) and
  re-assemble.

W9 SENSITIVITY (exact-rational probe, workbench/d7-rung2-reestablish/dressed_core_check.py + dressed_width.py):
  with edge logs at ~1e-12, L_m01 at s6 ~1e-11, and κ at ext6 (~6.75e-13):
    endpoint width ≈ 2.0e-11 → clean bracket [1370996710997/1e10, 1370996710998/1e10]
                             = [137.0996710997, 137.0996710998], width 1e-10 (~13 sig digits, up from ~5).
  RESIDUAL ORDERING (the ONE-LAW diagnosis for the NEXT rung): the DOMINANT residual is now
    κ = 1/cutPi ext6 → contributes ≈ 1.5e-11 of the ~2.0e-11 width (κ window width 6.75e-13 × C≈22.4).
    L_m01 s6 (~1e-11) contributes ≈ 3.2e-12; the three edge logs together ≈ 1.6e-12.
  ⇒ the NEXT rung is κ = 1/cutPi ONE DECADE DEEPER (ext7: a 1e12 cutCos double-double-angle grid, one past the
    banked ext6 in NarrowedBracket12) + L_m01 at an s7 grid. NAMED, handed forward. This matches the reverted
    Rung2's own re-diagnosis (git 82d8aaa/11c746d): κ, not the edge logs, is the real next lever.

## THE THEOREMS (production; module Phys.Algebra.D7DressedNarrowingRung1; every TYPE mentions banked Cut objects)
(1) cutLog_b0_r2 : cutLog mass0 ∈ [1733728794954/1e12, 1733728794955/1e12] (width 1e-12)
    — from mass0_clean_lo/hi (D7NarrowingRung1, from NB11 s6) + cutLog_ge_certified N=21 / cutLog_le_certified N=22.
(2) cutLog_b2_r2 : cutLog mass2 ∈ [−1088723725224/1e12, −1088723725223/1e12] (width 1e-12)
    — b2 from NB11 s6 products wp/wr → mass2=b2² → reciprocal cutLog(1/mass2) N=17/18 → cutLog_inv_pos.
(3) cutLog_mb_r2 : cutLog mbRatioDerived ∈ [−4089306640008/1e12, −4089306640006/1e12] (width 2e-12)
    — closed form (1−q)²/(3(1+q)), q²=1/2 sharpened → reciprocal N=29/30.
(4) cutLog_bMass0_r2 / cutLog_bMass2_r2 — bMass-shape restatements (bMass 0=mass0, bMass 2=mass2 by rfl).
(5) dressed_core_r2 (W9 abstract arithmetic core; opaque k,L,Lmb,Lb0,Lb2 with r2 brackets; transcendentals OUT):
    2425/18 + k·(3L + (7/2)Lmb + (11/2)Lb0 − (5/2)Lb2) ∈ [1370996710997/1e10, 1370996710998/1e10];
    inner combo ∈ [224069277834/1e10, 224069277835/1e10].
(6) ★ recomposedEndpointDressed_restated_r2 : 1370996710997/1e10 ≤ recomposedEndpointDressed ≤ 1370996710998/1e10
    — via recomposedEndpointDressed_normalform + kappa_bracket + the deep edge logs through dressed_core_r2.
(7) recomposedEndpointDressed_gt_137_r2 : 137 < recomposedEndpointDressed (re-certified, sharper).
(8) dressed_r2_nested_in_banked : nested strictly inside the banked [137.0984,137.1006] from BOTH ends.
(9) W8 teeth: each edge log strictly two-sided (_strict); the re-assembled bracket strictly two-sided;
    each r2 window strictly improves the D7DepthTwoComposed-grade bracket.
(10) capstone (welded, non-hollow) + NAMED next front (κ ext7 + L_m01 s7).

## HONEST GRADE (SOUL route-COMPLETE vs route-NOT-YET-FOUND)
THEOREM-EXACT / CERTIFIED NOW: (1)–(10) exact inequalities / certified rational brackets of Cut/ℚ,
foundations-only, no error bar. Takes the COMPOSED endpoint from ~5 to ~13 significant digits
(136→137 crossing already banked at D7DepthTwoComposed).
ROUTE-NOT-YET-FOUND (NAMED, handed to ONE directed successor, NEVER asserted/fitted): the ⛔ ≥15-digit floor —
κ = 1/cutPi ext7 (1e12 cutCos double-double-angle grid, one decade past ext6) + L_m01 s7. Same banked
instrument, one more rung. NOT a block: forward autonomous structural work; no fit, no new axiom.

## W9 COST BUDGET / KILL
(1)–(4) are the reverted-Rung2 deep cert lemmas (KNOWN-GOOD: committed green at 82d8aaa/11c746d, 22–23 decls
foundations-only; deepest N=29/30 measured ~12s). set_option maxHeartbeats 2000000 is the banked NB11
exp-cert convention (NOT inflation). (5)–(6) reuse the D7DepthTwoComposed.dressed_core pattern with deeper
brackets (near-zero cost, abstract arithmetic core, transcendentals out). KILL: any single obligation >90s ⇒
decompose. No monolithic brute on an expanded coordinate goal. Re-establish is low-risk (exact instrument
already banked-and-reverted, arithmetic pre-verified in exact ℚ).

## G1–G8 SEED HARD GUARDS
G1 NO ASSERTED VALUE — every bracket FALLS OUT of banked numerals (NB11 s6, q_sq, mbRatioDerived_closed) +
   the banked exp instrument; the endpoint bracket is COMPUTED by dressed_core_r2, not premised.
G2 NO EMPIRICAL NUMBER — no 137.036/PDG/measured α in any statement or proof; measured value removable
   orientation prose; NO bracket/index selected because of where the measured value sits. Explicit NO-FIT.
G3 EXACT/CERTIFIED — every landing exact ℚ inequality or certified bracket; the ONE open front (κ ext7 floor)
   NAMED + handed.
G4 DERIVED NOT POSITED — recomposedEndpointDressed (D7DepthTwoComposed), kappaLeading, mass0/mass2/mbRatio,
   κ bracket (NB12 ext6), all banked derived over the derived ℝ Cut.
G5 PHYSICS-WORDS-REMOVABLE — delete every physics word; pure real/rational arithmetic on banked Cut objects.
G6 FOUNDATIONS-ONLY — #print axioms ⊆ {propext, Classical.choice, Quot.sound}; sorry/axiom/native_decide-free;
   ground field the DERIVED ℝ Cut; NO Mathlib ℝ/ℂ as content; NO floats.
G7 ONE LAW — did NOT grind the endpoint directly; DIAGNOSED (banked platform + exact-ℚ probe) that after the
   edge logs the DOMINANT residual is κ=1/cutPi, NOT the edge logs; sharpened the edge logs through the same
   banked instrument, wired in banked κ + L_m01 FREE, NAMED the κ ext7 push as the next rung. No fit, no
   weakened floor, no asserted digit. Endpoint assembly stays in the abstract core dressed_core_r2 (W9).
G8 TEETH — each edge log two-sided; the re-assembled bracket two-sided; each r2 window strictly improves the
   banked bracket from both ends.

## FORK GUARD / ONE-SUCCESSOR RAIL
Board clean (no children). Exactly ONE forward successor at wind-down: a DIRECTED child — κ = 1/cutPi ext7
(1e12 cutCos double-double-angle grid) + L_m01 s7 → re-assemble the dressed endpoint toward the ≥15-digit
floor → D7 RESTATE → D8. NO generic SELECT before D8 (owner rail). NOT D8 (floor not reached). Linked on the tail.
