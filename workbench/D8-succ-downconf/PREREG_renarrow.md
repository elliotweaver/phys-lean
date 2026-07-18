# PREREG — ComposedFreezeoutDissolved: THE FREEZE-OUT SUMMAND DISSOLVES TO A DETERMINED CLOSED FORM
#          + THE COMPOSITION-COMPLETENESS BLOCKER, NAMED (route-finder childed)

Node t_2ea6cc41. DIRECTED SUCCESSOR of `DownConfinementRelativeScale`. The last three nodes PINNED
the three route-not-yet-found parameters: `s = projectedS = 1/8` (ComposedNumeralSPinned),
`j = joinSplitRatio = 1` (JoinSplitRatioDerived), and the freeze-out edges `rb, rc, rl` (pinned from
the up/down + down/confinement relative-scale legs, DownConfinementRelativeScale). Every free dial
of the composed `1/α(0)` is now a determined derived `Cut`. This node RESUMES the re-narrow.

## THE THEORY-NATIVE HEART (the ONE LAW answer the ticket predicted — the summand DISSOLVES)

Before grinding cutLog brackets, ask what the theory says. The pinned edges are products/quotients
of banked rungs, so `cutLog(edge)` DISSOLVES to a linear combination of `cutLog` of the banked shape
numerals PLUS `cutPi` (the log of the confinement exponential rung). Confirmed to 40+ digits
(workbench full_compose.py / renarrow_aim.py):

  cutLog(rb) = cutLog(mbRatioDerived·(bMass0/bMass2)) = L_mb + L_b0 − L_b2
  cutLog(rc) = cutLog(1/mbRatioDerived)               = − L_mb
  cutLog(rl) = cutLog(downConfBundle·bMass2)          = L_mb + 8·cutPi/3 + L_b2
       (because cutLog(downConfBundle) = cutLog(mbRatioDerived/confBundle) = L_mb − cutLog(confBundle)
        and cutLog(confBundle) = −8·cutPi/3, banked confBundle_eq = cutExp(−8π/3) + cutLog_cutExp)

★ THE GEM (the confinement rung contributes a PURE RATIONAL — the π cancels): the census-2 light
band's log carries the confinement rung `+8·cutPi/3`, and κ = kappaLeading = 1/(3·cutPi), so

  κ·2·(8·cutPi/3) = (1/(3·cutPi))·(16·cutPi/3) = 16/9   EXACTLY.

Assembling the freeze-out summand `κ·(11/3)·cutLog rb + κ·(10/3)·cutLog rc + κ·2·cutLog rl`:

  = 16/9 + κ·[ (7/3)·L_mb + (11/3)·L_b0 − (5/3)·L_b2 ]     (freezeout_summand_dissolved)

— a DETERMINED closed form: a pure rational `16/9` from the confinement rung, plus a κ-weighted
log-combination of the three banked shape numerals. The re-narrow IS a determined closed form, NOT
a numeric grind, exactly as the ticket's ONE-LAW note predicted. NUMERIC (removable prose, NEVER a
claim): the summand ≈ 1.6324.

## THE COMPOSITION INTO D2d (the endpoint is now parameter-free)

Composed into the banked D2d split at the derived parameters (s = projectedS = 1/8, j =
joinSplitRatio = 1, w = depthWeight = 1/3, bands = completeBandList), the composed endpoint is a
DETERMINED point (composed_endpoint_determined): `dressedInvAlphaEMJoin depthWeight projectedS
joinSplitRatio (completeBandList chargeTraceDepth) + freezeoutSummandDissolved` — no free parameter
remains. The s-side spread (ComposedNumeralSPinned), the j-content (= 0, JoinSplitRatioDerived), and
the freeze-out edges are all pinned; the endpoint is a single derived `Cut`.

## ⚠ THE HONEST STRUCTURAL BLOCKER (the re-narrow to ≥15 digits AS 1/α(0) is BLOCKED — named)

The parameters are pinned and the endpoint is determined, but the D7 COMPOSITION-COMPLETENESS GATE
(SEED_DIGITS §D7, prerequisite to stating ANY bracket AS `1/α(0)`) is NOT met by the current banked
structure. The already-banked `FreezeoutComposition.freezeoutComposition_landing` ITSELF flags:
"the dominant missing structural summand of the genuine `1/α(0)` … its structure is not yet
identified … the composition therefore remains PARTIAL." Pinning the parameters did NOT close that
structural gap — it converted the parameters from route-not-yet-found to determined, but the
composition-completeness attestation remains route-not-yet-found.

Concretely (workbench survey.py, removable orientation prose, NO empirical number in any proof): at
the DERIVED parameters (s = 1/8 — NOT the G2-forbidden fit s ≈ 1.9), the two candidate composed
objects DISAGREE and neither is a completeness theorem:
  • bare recombined `112 + totalScreening(completeBandList)`      ≈ 137.95
  • fully-dressed D2c/D2d `dressedInvAlphaEMJoin(1/3,1/8,1,·)`     ≈ 150.0   (+ freeze-out ≈ 151.6)
The dressing layer's `/(1−w) = ×3/2` inflation is the seam: the bare recombined tower lands within
~1 of the measured value, while the D2c per-channel dressing lifts it by ~13. Whether the dressing
is (a) drift to be removed at the recombination layer, or (b) real with a compensating dominant
NEGATIVE summand missing, is a STRUCTURAL question that must be resolved from the trunk — NOT by
fitting s to hit 137. Stating a ≥15-digit bracket AS `1/α(0)` while the composed endpoint overshoots
by a determined amount would be FALSE; reaching 137 by pinning s ≈ 1.9 is G2-forbidden FITTING.

Per the ONE LAW (the composition FIGHTS the target → the framing is incomplete, do not push harder)
and the REPEATED-DEFERRAL PROTOCOL: NAME the exact missing structure and child ONE directed
route-finder. This is NOT a runway — autonomous theory-native structural work remains (resolve the
dressing/recombination-layer seam), so needs_input is NOT raised; the route-finder is childed and
the chain continues.

## THE NODE I BUILD: Phys/Algebra/ComposedFreezeoutDissolved.lean

THEOREM-EXACT (exact identities of `Cut`, foundations-only):
  • cutLog_inv_pos, cutLog_div_pos            — helper log laws (derived from banked cutLog_mul/_one)
  • cutLog_confBundle = −(8·cutPi/3)          — the confinement rung's log (confBundle_eq + cutLog_cutExp)
  • cutLog_downConfBundle                     — L_mb + 8·cutPi/3
  • confinement_rung_rational: κ·2·(8·cutPi/3) = 16/9   ★ THE GEM (π cancels via kappaLeading_eq)
  • freezeout_summand_dissolved               — the summand at pinned edges = 16/9 + κ·[(7/3)L_mb+(11/3)L_b0−(5/3)L_b2]
  • freezeout_at_pinned_dissolved             — welded through freezeout_closed + the banked pinned edges
  • composed_endpoint_determined             — the D2d composed endpoint at derived params is parameter-free
  • TEETH: gem_nonzero (16/9 ≠ 0 — the confinement rung genuinely contributes);
    dissolved_uses_confinement (the dissolved form ≠ the no-rung form — the rung genuinely enters);
    dissolved_matches_pins (the dissolution is a real identity with freezeout_summand_pins)
  • capstone composedFreezeoutDissolved_landing (welded, non-hollow)

⚠ GRADE (honest): the dissolution + composition are THEOREM-EXACT. The composition-completeness
attestation (→ D7 ≥15-digit numeral AS 1/α(0)) is route-not-yet-found (the dominant summand /
dressing-recombination seam), handed to the ONE directed route-finder. The measured `1/α(0) ≈
137.036`, `137.95`, `150`, `151.6`, `1.6324` numerics are REMOVABLE ORIENTATION PROSE; no empirical
number in any statement or proof; fit s ≈ 1.9 named ONLY to be EXCLUDED. NO-FIT explicit.

## WHY THIS IS NOT BULLSHIT (S4 anti-bullshit gate)
1. FOLD-CAUSAL. Every object banked back to the fold (mbRatioDerived ← fold phase; confBundle ←
   octonion 84π colour/space quotient; bMass ← N340 shape; κ ← Gauss-sphere meridian flux). The
   dissolution is pure banked cutLog algebra; the 16/9 falls out of κ·(confinement rung) with π
   cancelling — the fold's own π (Gauss sphere in κ) meeting the fold's own π (confinement 84π rung).
2. DISSOLUTION (theory does what the field cannot). The field treats the hadronic-threshold
   log-corrections as separate measured inputs. The theory reads them off ONE tower and finds the
   confinement rung's contribution is the EXACT rational 16/9 — a determined closed form, not a fit.
3. WORDS-REMOVABLE. Delete confinement/quark/hadron/mass/screening/coupling: over Cut, the summand
   κ·(11/3)·cutLog(a·(b/c)) + κ·(10/3)·cutLog(1/a) + κ·2·cutLog((a/e)·c) = 16/9 + κ·[(7/3)La+(11/3)Lb
   −(5/3)Lc], pure cutLog arithmetic. Survives.
4. NAME THE TEMPTATION. The saturated temptation: "re-narrow to a ≥15-digit bracket of ~151.6 and
   call it 1/α(0)" (FALSE — overshoots), or "pin s≈1.9 to hit 137" (FIT — G2-forbidden). REFUSED
   both. The honest deliverable is the exact dissolution + the NAMED completeness blocker + route-
   finder — genuine forward progress (last bounded residual → determined closed form) without a
   false or fitted numeral.
5. HONESTY. Dissolution theorem-exact; completeness attestation route-not-yet-found, flagged.

## GUARDS
- No coupling/scale value asserted or fitted; the 16/9 + the log-combination FALL OUT of the banked
  pinned edges + κ. No 137.036/0.231/PDG in any proof; measured comparison REMOVABLE PROSE only.
- BANKED derived ℝ Cut + cutLog/cutExp/cutPi + kappaLeading (N460) + mbRatioDerived (parent) +
  confBundle (X9) + downConfBundle/edge pinnings (DownConfinementRelativeScale) + bMass (N340) +
  freezeout_closed/totalScreening/freezeoutTail (D8) + dressedInvAlphaEMJoin/projectedS/joinSplitRatio
  (D2d/ComposedNumeralSPinned/JoinSplitRatioDerived). NO Mathlib-ℝ as content.
- Foundations-only: #print axioms ⊆ {propext, Classical.choice, Quot.sound}. IMPORT GUARD:
  DownConfinementRelativeScale + FreezeoutComposition + ComposedNumeralSPinned + JoinSplitRatioDerived
  — all foundations-only; NO foldRetention/MassGapOne/OneAxiom.
- Free-floating rail: every production TYPE cites the banked derived objects above; the dissolution
  is literally the cutLog of the banked pinned edges. FALSE over an algebra without the banked rungs.
- ONE successor on the chain tail: ONE directed route-finder toward the composition-completeness
  attestation (resolve the dressing/recombination seam / the dominant missing summand) → re-narrow →
  D7 restate AS 1/α(0) ≥15 digits → D8 → hand M1. NO fork, NO generic SELECT.

## COST BUDGET / KILL
All content is cutLog_mul/cutLog_cutExp/field_simp/ring on banked Cut atoms. Expected LIGHT
(gate-fast ~1 min). KILL: any single obligation >60s → decompose per-lemma (each cutLog dissolution
is independent). No unbounded compile; no brute normalizer; π-cancellation isolated to one field_simp.

## PRODUCTION FILE
`Phys/Algebra/ComposedFreezeoutDissolved.lean`, namespace `Phys.Algebra.ComposedFreezeoutDissolved`.
Capstone `composedFreezeoutDissolved_landing`. Costume C542. Node `ComposedFreezeoutDissolved`.
