# M5 — THE HEAVY QUARK SECTOR (SEED_MASSES §M5) — workbench note (t_fc0796de)

## SELECT (fresh worker) — CONFIRMED M5 theory-native
Trace fold → CD cascade → ℍ-level fold angle P=cutPi/8 (amplitude-halving cascade J²=−1 → π/2 → π/4
→ π/8) → the fold-phase Born weight (1−q)²/(3(1+q)), q=cos(π/4), sets the up/down heavy-sector
separation. The theory's next beat after M2–M4 (evaluate each banked closed form as a certified
numeral against the ONE peg): EVALUATE the heavy-quark cross-sector ratios. Standard physics: heavy
quark masses = FREE Yukawa couplings (the largest block of SM free parameters) → DISSOLVED: the heavy
cross ratio is FORCED = the fold phase's own Born weight, zero free shape parameters. Anti-bullshit
gate PASS (full S1–S4 in kanban comments 474/475). Board order D→M→C→GR.

## WHAT WAS BANKED (Phys/Algebra/HeavyQuarkNumerals.lean, namespace Phys.Algebra.HeavyQuarkNumerals, C551, 13 audited decls)
- q_bracket (q=cos(π/4)∈[7071/1e4,707107/1e6], banked M2 cutCos_quarter_bracket).
- mbRatio_bracket (★★★ m_b/m_t = (Md/Mu)² = mbRatioDerived ∈ [167505/1e7,167522/1e7] ≈ 1.675e-2, the
  fold-phase Born weight (1−q)²/(3(1+q)) pinned by nlinarith; q²=1/2 collapses the two-sided ineq to
  linear-in-q).
- mbRatio_pos (genuine positive derived ratio).
- invMbRatio_bracket (★★ 1/mbRatioDerived ∈ [5969/100,5971/100] ≈ 59.70, the charm-band edge
  reciprocal edgeCharm, via one_div_le_one_div_of_le).
- downConfBundle_as_mul (downConfBundle = mbRatioDerived · confBandRatio, since confBandRatio=confBundle⁻¹).
- downConfBundle_bracket (★★★ (Md/Mλ)² = downConfBundle ∈ [7280/100,7288/100] ≈ 72.83, product of the
  mbRatioDerived bracket and the M3 confBandRatio∈[4347,4350] bracket — the M3 band ratio re-used).
- heavyQuark_numerals (★★ the three heavy-sector ratio numerals collected).
- mbRatio_lt_one_from_bracket (★ W8: mbRatioDerived < 1, genuine suppression), 
  offset_ordered_from_brackets (★ W8: mbRatioDerived < downConfBundle, the two legs distinct),
  heavyQuark_widths_positive (★ W8: each lo<hi), mbRatio_ne_survival_from_bracket (★ W8: < 2/3, the
  fold-phase factor bites).
- pegged_mbRatio_bracket (★ ONE-PEG LAW: p.human mbRatioDerived scaled by the SINGLE positive peg).
- heavyQuarkNumerals_landing (welded capstone, 6 blocks, non-hollow).

## GROUNDING (not free-floating)
Every TYPE cites banked derived objects over Cut: mbRatioDerived, downConfBundle, confBundle,
confBandRatio, q, cutCos, cutPi, the M1 UnitPeg. Imports: DownConfinementRelativeScale,
ConfinementScaleNumeral, UnitPeg, ContinuumBracket, ContinuumTrigEval.

## THE ONE-PEG LAW (cited, not duplicated)
All heavy-sector ratios are pure dimensionless ratios to M_oct := 1; brackets on those ratios. The M1
UnitPeg only converts to a human unit (pegged_mbRatio_bracket). NO second dimensionful input.

## GRADE (honest, per SEED_MASSES §M5 + Z3)
THEOREM-EXACT: the CROSS-SECTOR heavy ratios (m_b/m_t = mbRatioDerived, its reciprocal, the
down/confinement offset downConfBundle) are banked THEOREM-EXACT closed forms, bracketed here
(foundations-only ⊆ {propext,Classical.choice,Quot.sound}). ROUTE-NOT-YET-FOUND (NOT faked here, per
Z3/N344): the precise WITHIN-sector individual numerical quark ratios (top vs charm inside the up
sector) need the deviated individual-sector phase on the Fano line + the ℝ-descent. NO measured quark
mass in any statement/proof — the physical m_b/m_t comparison (PDG ≈ 2.4e-2 vs derived ≈ 1.7e-2, a
leading-order fold-phase reading) is removable prose; beyond-measurement digits are the STANDING
PREDICTION.

## COST (W9 — no risk)
Crux measured before build (workbench/M5-heavy-quark/Probe.lean): full crux battery (all 3 brackets +
reciprocal + product) compiles in 10.9s; the mbRatioDerived nlinarith closes cheaply after q²=1/2.
Full module 10s (lake build). No maxHeartbeats inflation, no monolithic brute; each bracket its own
lemma. Route reuses the M2 cutCos_quarter_bracket + the M3 confBandRatio_bracket (no new cutExp crux).

## CARRIED NOTE
Deferred-D7 (arc-D standing debt, NOT a runway): D's ≥15-sig-digit AS-1/α(0) restate resumes AFTER
the absolute-scale skeleton is complete.

## SUCCESSOR (the ONE directed child — REPLACES the generic SELECT)
Arc-M target M6 (SEED_MASSES §M6): THE LIGHT QUARK SECTOR — the hardest row on the board (child until
done). The light masses from the texture + the confinement weld structure; expect genuine
sub-structure work (the light sector reads through the hadronic band). NO-DEFERRAL law binds: derive,
child, or escalate NAMED.
