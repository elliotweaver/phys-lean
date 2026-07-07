# N407 PREREG — arc-M M1: the winding / ladder-rung quantization n = 1 + 3k

SELECT: DIRECTED successor of N406 (arc-L L5) toward arc-M M1 (SEED_INPUT_CLOSURE §M1).
Fresh-worker SELECT ran in full (comment 325); S2 GOAL+REFRAMING lenses landed on M1
independently; S3 ALIGN (no redirect); S4 anti-bullshit gate passed with specifics.

TARGET (theorem-grade STRUCTURE; assignment candidate/inception-flag):
Derive the winding/ladder-rung quantization n = 1 + 3k as an exact structural fact about the
banked ladder, grounded on the DERIVED generation count finrank ℚ Uhol = 3 (N42c, the ℤ₃
self-blind cycle) and the derived Born phase circle azimuthalTurn = 2·cutPi (N328).

MODULE: Phys/Algebra/ScaleTowerWindingQuantization.lean, ns Phys.Algebra.
COSTUME: C432 Counterexamples/ScaleTowerWindingQuantizationVacuityCostume.lean, bites 1 = 432.

HEART (all grounded on banked finrank ℚ Uhol / azimuthalTurn):
- windingRungIndex_eq: windingRungIndex k = 1 + 3k
- windingRungShift_quantized: finrank ℚ Uhol ∣ (windingRungIndex k − 1)
- windingRungIndex_emod: windingRungIndex k % 3 = 1
- baseOffset_not_cycle: ¬ finrank ℚ Uhol ∣ 1  (singlet-offset teeth)
- windingRungIndex_injective; windingRungIndex_ne_zero
- windingRung_at_neg_one: windingRungIndex (−1) = −2 (structural index; scale assignment flagged)
- windingPhase_step: windingPhase(k+1) − windingPhase k = (finrank ℚ Uhol)·azimuthalTurn
- windingPhase_step_pos; criticalBudget_channelform (tie to 84π)
- winding_quantization_structure (capstone, non-hollow)

GRADE: THEOREM for the quantization structure; CANDIDATE with PERMANENT INCEPTION FLAG for the
rung↔scale assignment (the w=−1 rung, the 9/4) — prose only, never asserted, never fit (PHANTOM CAP).

KILL / COST BUDGET: pure ℤ / derived-Cut arithmetic; every proof a one-line close
(omega/push_cast/ring/nlinarith). If any obligation exceeds ~60s, that is an instrument signal —
decompose. (None did.)

MEASURE-FIRST (W9): probe.lean compiled EXIT 0 @ ~11s BEFORE production (one push_cast cast fix).
Production olean built @ 41s. Isolated reaudit: 13/13 decls foundations-only vs built olean.
Costume bites 1 = 432 (EXIT 1).

GUARDS: G1 no asserted value (1+3k, the divisibility FALL OUT of finrank_Uhol); G2 no empirical
number (m_e/m_b/z0/9·4 never in a proof — prose only); G3 derived not posited (modulus =
finrank ℚ Uhol, circle = azimuthalTurn); G4 words-removable (delete winding/scale/mass/generation:
pure ℤ coset + derived-Cut phase statements); G5 foundations-only ⊆ {propext,Classical.choice,
Quot.sound}, no proof-hole/native-decide/heartbeat; ℝ-vigilance: derived Cut only, no Mathlib-ℝ;
FREE-FLOATING: every TYPE cites banked finrank ℚ Uhol / azimuthalTurn / criticalPhaseNumerator.
W8 non-vacuity: C432 + baseOffset_not_cycle (nontrivial coset). W4.5: exactly M1, not M2/M3.
