# N314 — SEEDED GAUGE ROUTE A2: the interaction-channel tower ℂ:0, ℍ:6, 𝕆:42 = n(n−1)

## S1 ARC SYNTHESIS (fresh worker; NOT the N313 worker)
SEED 2 (docs/SEED_GAUGE_SCALE_COSMOLOGY.md), ARC A. A1 (N313, banked HEAD d48368a) derived the
octonion structure 3-form φ = banked `assoc3` and ‖φ‖² = `assoc3NormSq` = 42 = n(n−1), n=7, as the
off-diagonal ordered-pair count of the 7 imaginary units (each pair a unit cross product; diagonal
drops). A2 reads the SAME count across the cascade rungs ℂ→ℍ→𝕆 (imaginary dims n = 1, 3, 7 →
n(n−1) = 0, 6, 42). The 42 rung REUSES N313 (W2). A COUNTING landing, NOT a bridge.

## MEASURED BANKED STATE (W9 measure-first, all in `Phys.Algebra`, ground field ℚ)
- Cascade rungs: `Dbl ℚ` (ℂ, rung 1), `H ℚ = CD (Dbl ℚ)` (ℍ, rung 2), `O ℚ = CD (H ℚ)` (𝕆, rung 3).
- Banked imaginary DIMENSIONS (the n of each rung):
  - `finrank_dbl_eq_two : finrank ℚ (Dbl ℚ) = 2`  ⟹ imaginary dim = 2 − 1 = 1  (Dbl.J the sole unit).
  - `finrank_ImH_eq_three : finrank ℚ ImH = 3`     (ImH = ker(starLH+1), DerivationRep7FullBranching).
  - `finrank_ImO : finrank ℚ ImO = 7`               (DerivationRep7).
- Banked octonion channel content (W2 reuse): `assoc3NormSq = 42` (`assoc3NormSq_eq_42`, N313).
- Mathlib machinery: `Finset.offDiag_card : (offDiag s).card = s.card * s.card - s.card`. For
  `s = (univ : Finset (Fin n))`, `s.card = n`, so `offDiag.card = n*n − n = n(n−1)` (ℕ-subtraction;
  n=1→0, n=3→6, n=7→42). This is the CONCRETE off-diagonal ordered-pair count — NOT a bare formula.

## THE PLAN (LIGHT node — the tower as a COUNTING landing; NOT free-floating)
The n(n−1) reading = the cardinality of `Finset.offDiag` of the imaginary index set of each rung.
- `imChannelCount (n) := (univ : Finset (Fin n)).offDiag.card`  (machinery def; the GENUINE
  off-diagonal pair count, tied to banked finranks in the LANDING theorems).
- `imChannelCount_eq : imChannelCount n = n*(n-1)` (via `offDiag_card` + `Fintype.card_fin`).
- Three rung LANDINGS, each TYPE citing the banked cascade finranks (NOT generic n):
  - `channels_C : imChannelCount (finrank ℚ (Dbl ℚ) - 1) = 0`   (finrank_dbl_eq_two → Fin 1 → 0).
  - `channels_H : imChannelCount (finrank ℚ ImH) = 6`            (finrank_ImH_eq_three → Fin 3 → 6).
  - `channels_O : imChannelCount (finrank ℚ ImO) = 42`           (finrank_ImO → Fin 7 → 42).
- N313 TIE (W2, the load-bearing grounding): `channels_O_eq_assoc3NormSq :
  ((imChannelCount (finrank ℚ ImO) : ℕ) : ℚ) = assoc3NormSq` — the octonion channel count IS the
  banked calibration-3-form norm.
- The UNIFYING reading: `channelTower_n_times_n_sub_one` — all three = n(n−1) at the banked
  imaginary dims 1, 3, 7.

## W8 non-vacuity teeth
- `0 ≠ 6`, `6 ≠ 42`, `0 ≠ 42` (the three rungs genuinely distinct).
- Each is n(n−1) at the CORRECT n and DISTINCT from the naive n² (include-diagonal) reading:
  `channels_O ≠ 49` (diagonal drops), `channels_H ≠ 9`, and `channels_C = 0` (single unit → no pairs,
  vs n²=1). A wrong count (diagonal not dropped / wrong n) fails.

## COSTUME C343 (next free id; C342 = N313)
A WRONG tower value fails to compile: assert e.g. `imChannelCount (finrank ℚ ImH) = 9` (the naive n²,
diagonal NOT dropped) → reduces to 6 = 9, false; certificate `min ... = 6` with RHS 343.
Pair (343, 6) — RHS 343 distinct from every prior manifest RHS.

## GUARDS (SEED 2 relaxes NONE)
- G1: 0,6,42 FALL OUT of the banked finranks + offDiag_card — never premised.
- G2: no empirical number in any proof. G5: words-removable (delete channel/interaction/gauge —
  pure statement about the off-diagonal ordered-pair count of the imaginary subspaces of the banked
  cascade rungs). G6: foundations-only; no sorry/axiom/native_decide/maxHeartbeats-raise.
- FREE-FLOATING RAIL: the LANDING types cite the BANKED finranks (finrank ℚ ImH / ImO / Dbl ℚ) and
  the N313 `assoc3NormSq` — NOT a generic n-dim algebra. The `imChannelCount` def is machinery;
  the tower is the CONCRETE banked ℂ/ℍ/𝕆 imaginary pair counts.
- UNEARNED-IMPORT: ground field ℚ; Finset/Fin machinery only; NO Mathlib-ℝ/ℂ as content.
- EVERY CONSTANT FORCED: the tower is a counting fact of the cascade rungs; route-COMPLETE if the
  three landings + N313 tie hold ℚ-exact. Do NOT block as CHAIN-RUNWAY.

## COST BUDGET / KILL (W9)
Pure Finset/finrank arithmetic — trivial compile. If any `decide`/`offDiag_card` reduction exceeds
~30s or needs a heartbeat raise, STOP and reframe (it should be `simp`/`norm_num`/`decide` on Fin n
with tiny n). No monolithic brute.
