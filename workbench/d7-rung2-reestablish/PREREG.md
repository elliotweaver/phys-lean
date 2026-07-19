# PREREG — D7 NARROWING RUNG 2 (re-established over the ATTESTED-COMPLETE composition): sharpen the three DERIVED edge logs to ≈10⁻¹² → ≈12-sig-digit certified restatement AS 1/α(0)
## (t_3a070796, OWNER R2v2 continuation; directed successor of N571 D7AugmentedAttestation bf29483)

## RESUME FINDING (why this is a re-establishment, not a fresh derivation)
A prior run (t_db0153ae) BUILT this exact rung (commit 82d8aaa, `D7NarrowingRung2`) then REVERTED it
(0eea542). The revert was NOT a math error — it was a COMPLETENESS concern: the owner worried the
`recomposedEndpoint < 137` framing was premature because named band-varying depth-2 content was thought
uncomposed. That concern is now RESOLVED:
 - `LowTailFoldForcedWeight` (3643441) PROVED band-varying weights = a forbidden FIT; `depthWeight = 1/3`
   band-INDEPENDENT is fold-forced. Nothing overturns it.
 - `D7AugmentedAttestation` (bf29483, my parent) CLOSED the ledger (`augmented_composition_complete`):
   both owner-named forced summands composed (mirror census shift = 0 at derived splitting; above-floor
   weights bounded), endpoint UNCHANGED, `recomposedEndpoint < 137` re-certified as the owner-LICENSED
   fold prediction.
So narrowing the SAME `recomposedEndpoint` — now the ATTESTED-COMPLETE, ledger-CLOSED object — is exactly
this ticket's mandate. I re-verified the reverted brackets against mpmath (dps=45): every edge-log
bracket is correct and the endpoint central 136.30718814055 sits inside [136.3071881405, 136.3071881406].

## THE FRONT (narrowing rung 2 over the attested-complete composition)
The banked Rung1 landing (`D7NarrowingRung1.recomposedEndpoint_restated_sharp`, re-exported by the closed
ledger as `augmented_endpoint_restated`) is `recomposedEndpoint ∈ [1363071880/1e7, 1363071883/1e7]`
(≈9 sig digits). The endpoint normal form (banked `recomposedEndpoint_normalform`) is
  recomposedEndpoint = 2425/18 + κ·(2·L_m01 + (7/3)·L_mb + (11/3)·L_b0 − (5/3)·L_b2),
κ = (1/cutPi)/3. Rung1 held the three edge logs L_b0/L_b2/L_mb at width ≈10⁻⁷ (the bottleneck). This rung
pushes them to ≈10⁻¹² (the underlying mass0/mass2/mbRatioDerived numerals are banked to ≈10⁻¹⁴ at the s6
grids — an instrument-INDEX choice, not a limit) via the SAME banked ContinuumBracket exp instrument at
deeper N, wires in the banked sharp L_m01 FREE, and re-assembles a ≈12-sig-digit bracket.

## THE THEOREMS (production; every TYPE mentions banked derived Cut objects)
(A) cutLog_b0_r2 : cutLog mass0 ∈ [1733728794954/1e12, 1733728794955/1e12] (width 10⁻¹²), from NB11
    mass0_lo_s6/hi_s6 via the exp instrument (N=21/22) + cutLog_mono.
(B) cutLog_b2_r2 : cutLog mass2 ∈ [−1088723725224/1e12, −1088723725223/1e12], from NB11 s6 products
    wB·pB / wB·rB → b2 → mass2=b2² → reciprocal (N=17/18) + cutLog_inv_pos.
(C) cutLog_mb_r2 : cutLog mbRatioDerived ∈ [−4089306640008/1e12, −4089306640006/1e12], from the closed
    form (1−q)²/(3(1+q)) with q²=1/2 sharpened one grid deeper → reciprocal (N=29/30).
(D) cutLog_m01_sharp (re-export from Rung1/NB11): cutLog(mass0/mass1) ∈ [815406111272/1e11, .../1e11].
(E) endpoint_core_r2 (W9 abstract arithmetic core; opaque k,L,Lmb,Lb0,Lb2; transcendentals OUT):
    2425/18 + k·(...) ∈ [1363071881405/1e10, 1363071881406/1e10].
(F) recomposedEndpoint_restated_r2 : recomposedEndpoint ∈ [1363071881405/1e10, 1363071881406/1e10]
    (136.3071881405 … 136.3071881406, ≈12 sig digits) — assembled from (A)–(E) + banked κ bracket.
(G) recomposedEndpoint_lt_137_r2 : recomposedEndpoint < 137 (the fold's prediction, re-certified).
(H) r2_nested_in_attested : the rung-2 bracket nests strictly inside the attested-complete restatement
    `augmented_endpoint_restated` (= Rung1 bracket, re-exported by the closed ledger) from both ends —
    the EXPLICIT tie to the ATTESTED-COMPLETE composition.
(I) W8 teeth: every bracket strictly two-sided; rung 2 genuinely improves rung 1's edge brackets.
(J) d7NarrowingRung2_landing : welded, non-hollow capstone.

## THE HONEST GRADE (SOUL route-COMPLETE vs route-NOT-YET-FOUND)
THEOREM-EXACT / CERTIFIED NOW: (A)–(J) — exact inequalities / certified rational brackets of Cut/ℚ,
foundations-only, no error bar. This rung takes the attested-complete endpoint from ≈9 to ≈12 sig digits.
ROUTE-NOT-YET-FOUND (NAMED, handed to ONE directed successor, NEVER asserted/fitted): the ⛔ OWNER
≥15-SIG-DIGIT FLOOR. W9 sensitivity (workbench/d7-rung2-reestablish/verify.py, mpmath dps=45): after
this rung the DOMINANT endpoint-width residual is κ=1/cutPi (≈1.0×10⁻¹¹, from the 1e11 cutCos ext6 grid),
then L_m01 (≈2.1×10⁻¹², the NB11 s6 grid); the edge logs are now ≈3.9×10⁻¹³ (subdominant). Reaching
≥15 digits requires BUILDING the next instruments: (1) a deeper cutPi bracket (an NB13-style 1e12 cutCos
double-double-angle positivity grid, one decade past ext6) and (2) L_m01 at an s7 mass grid. Those are
genuine NEW construction rungs (heavy cutCos_bracket / nlinarith work at deeper grids) — the next node.
NOT a block: forward autonomous structural work remains; no path here fits a measured value or needs a
new axiom.

## W9 COST BUDGET / KILL
The edge-log brackets are the same known-good proofs the reverted 82d8aaa compiled (gate-fast PASSED
before revert), deepest exp index N=30, measured ~12s each. All closers are cutLog_ge/le_certified +
cutLog_mono + nlinarith over banked lemmas. KILL: any single obligation >90s ⇒ decompose per-input
(should not fire — this exact set compiled before). The endpoint assembly stays in the abstract core
endpoint_core_r2 (transcendentals out — W9). No monolithic brute on an expanded coordinate goal.

## G1–G8 SEED HARD GUARDS
G1 NO ASSERTED VALUE — every sharpened bracket FALLS OUT of a banked numeral bracket + the exp instrument.
G2 NO EMPIRICAL NUMBER — no 137.036/PDG in any statement or proof; the measured value is removable prose;
   `< 137` is a certified consequence. Explicit NO-FIT.
G3 EXACT/CERTIFIED — every landing exact; the ONE open front (≥15-digit floor) NAMED + handed forward.
G4 DERIVED NOT POSITED — every input a banked derived object over the derived ℝ Cut.
G5 PHYSICS-WORDS-REMOVABLE — delete every physics word; pure real/rational arithmetic on banked objects
   remains (the edge-log brackets + endpoint bracket + `< 137`).
G6 FOUNDATIONS-ONLY — #print axioms ⊆ {propext, Classical.choice, Quot.sound}; sorry-free; derived ℝ Cut
   as ground, Mathlib as MACHINERY only; no Mathlib ℝ as content, no floats, no native_decide.
G7 ONE LAW — did NOT grind the endpoint directly; DIAGNOSED (banked platform + mpmath sensitivity) that
   the edge logs were the Rung1 bottleneck, sharpened THEM, wired the banked sharp L_m01 free, and NAMED
   the NEW dominant residual (κ) that the next rung must build deeper. No fit, no weakened floor.
G8 TEETH — each sharpened bracket strictly two-sided; the re-assembled bracket two-sided; the sharpening
   genuinely improves the coarse brackets from both ends.

## FORK GUARD / ONE-SUCCESSOR RAIL
Board clean (no children). Exactly ONE forward successor at wind-down: a DIRECTED narrowing rung 3 toward
the ≥15-digit floor (build the deeper cutPi + L_m01 instruments), replacing the SELECT ticket. NO generic
SELECT before D8 (owner rail). NOT D8 yet (the ≥15-digit floor is not reached).
