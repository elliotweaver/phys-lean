/-
  # N691 — CORRECTED ENDPOINT BRACKETS: THE W9 ABSTRACT ARITHMETIC CORES (repair phase 3)

  STANDALONE corrected cores at base `7259/54` with the corrected weights, cloning the
  `endpoint_core_r4` / `dressed_core_r4` pattern of `Phys/Algebra/D7NarrowingRung4.lean`
  verbatim (same opaque variables `k L Lmb Lb0 Lb2`, same 1e14 bracket hypotheses).

  Exact-arithmetic verification (python Fractions, done BEFORE writing):
  - core 1 combo `2L + 3Lmb + (10/3)Lb0 − (5/3)Lb2`
      ∈ [1745075674597993/150000000000000, 3490151349196043/300000000000000] — EXACT at both ends.
  - core 1 product bracket margins: lo +6.52e-14, hi +6.76e-15 (both inside).
  - core 2 combo `3L + (9/2)Lmb + 5Lb0 − (5/2)Lb2`
      ∈ [1745075674597993/100000000000000, 3490151349196043/200000000000000] — EXACT at both ends.
  - core 2 product bracket margins: lo +8.49e-14, hi +7.31e-14 (both inside).
-/
import Phys.Algebra.D7NarrowingRung4
import Mathlib.Tactic

namespace Phys.Algebra.CorrectedEndpointCores

open Phys.Foundation.ContinuumQ

set_option maxHeartbeats 2000000 in
/-- THE CORRECTED BARE ARITHMETIC CORE (W9 — opaque `k, L, Lmb, Lb0, Lb2` with the 1e14 bracket
    hypotheses): with `k` in the `1e14`-grid `κ` bracket and the four logs in their 1e14 windows,
    `7259/54 + k·(2L + 3Lmb + (10/3)Lb0 − (5/3)Lb2) ∈
    [271320628915689/2000000000000, 678301572289223/5000000000000]`. The inner combination is in
    `[1745075674597993/150000000000000, 3490151349196043/300000000000000]` (exact endpoints). -/
theorem endpoint_core_corrected (k L Lmb Lb0 Lb2 : Cut)
    (hklo : (5000000000000 / 15707963267949 : Cut) / 3 ≤ k)
    (hkhi : k ≤ (50000000000000 / 157079632679489 : Cut) / 3)
    (hL : (815406111272599 : Cut) / 100000000000000 ≤ L ∧ L ≤ 815406111272603 / 100000000000000)
    (hLmb : (-408930664000672 / 100000000000000 : Cut) ≤ Lmb ∧ Lmb ≤ -408930664000670 / 100000000000000)
    (hLb0 : (173372879495463 : Cut) / 100000000000000 ≤ Lb0 ∧ Lb0 ≤ 173372879495464 / 100000000000000)
    (hLb2 : (-108872372522363 / 100000000000000 : Cut) ≤ Lb2 ∧ Lb2 ≤ -108872372522362 / 100000000000000) :
    (271320628915689 / 2000000000000 : Cut)
        ≤ 7259 / 54 + k * (2 * L + 3 * Lmb + (10 / 3) * Lb0 - (5 / 3) * Lb2)
      ∧ 7259 / 54 + k * (2 * L + 3 * Lmb + (10 / 3) * Lb0 - (5 / 3) * Lb2)
        ≤ 678301572289223 / 5000000000000 := by
  obtain ⟨hLlo, hLhi⟩ := hL
  obtain ⟨hmblo, hmbhi⟩ := hLmb
  obtain ⟨hb0lo, hb0hi⟩ := hLb0
  obtain ⟨hb2lo, hb2hi⟩ := hLb2
  have hkpos : 0 < k := lt_of_lt_of_le (by norm_num) hklo
  have hcombo_lo : (1745075674597993 / 150000000000000 : Cut)
      ≤ 2 * L + 3 * Lmb + (10 / 3) * Lb0 - (5 / 3) * Lb2 := by nlinarith
  have hcombo_hi : 2 * L + 3 * Lmb + (10 / 3) * Lb0 - (5 / 3) * Lb2
      ≤ 3490151349196043 / 300000000000000 := by nlinarith
  set C := 2 * L + 3 * Lmb + (10 / 3) * Lb0 - (5 / 3) * Lb2 with hC
  have hCpos : 0 < C := lt_of_lt_of_le (by norm_num) hcombo_lo
  refine ⟨?_, ?_⟩
  · have h1 : k * C ≥ ((5000000000000 / 15707963267949 : Cut) / 3) * (1745075674597993 / 150000000000000) := by
      have := mul_le_mul hklo hcombo_lo (by norm_num) (le_of_lt hkpos); linarith [this]
    have h2 : ((5000000000000 / 15707963267949 : Cut) / 3) * (1745075674597993 / 150000000000000)
        ≥ 271320628915689 / 2000000000000 - 7259 / 54 := by norm_num
    linarith
  · have h1 : k * C ≤ ((50000000000000 / 157079632679489 : Cut) / 3) * (3490151349196043 / 300000000000000) := by
      have := mul_le_mul hkhi hcombo_hi (le_of_lt hCpos) (by positivity); linarith [this]
    have h2 : ((50000000000000 / 157079632679489 : Cut) / 3) * (3490151349196043 / 300000000000000)
        ≤ 678301572289223 / 5000000000000 - 7259 / 54 := by norm_num
    linarith

set_option maxHeartbeats 2000000 in
/-- THE CORRECTED DRESSED ARITHMETIC CORE (W9 — the `(3/2)`-scaled corrected coefficients): with
    the same 1e14 hypotheses, `7259/54 + k·(3L + (9/2)Lmb + 5Lb0 − (5/2)Lb2) ∈
    [681387543619019/5000000000000, 34069377180951/250000000000]`. The inner combination is in
    `[1745075674597993/100000000000000, 3490151349196043/200000000000000]` (exact endpoints). -/
theorem dressed_core_corrected (k L Lmb Lb0 Lb2 : Cut)
    (hklo : (5000000000000 / 15707963267949 : Cut) / 3 ≤ k)
    (hkhi : k ≤ (50000000000000 / 157079632679489 : Cut) / 3)
    (hL : (815406111272599 : Cut) / 100000000000000 ≤ L ∧ L ≤ 815406111272603 / 100000000000000)
    (hLmb : (-408930664000672 / 100000000000000 : Cut) ≤ Lmb ∧ Lmb ≤ -408930664000670 / 100000000000000)
    (hLb0 : (173372879495463 : Cut) / 100000000000000 ≤ Lb0 ∧ Lb0 ≤ 173372879495464 / 100000000000000)
    (hLb2 : (-108872372522363 / 100000000000000 : Cut) ≤ Lb2 ∧ Lb2 ≤ -108872372522362 / 100000000000000) :
    (681387543619019 / 5000000000000 : Cut)
        ≤ 7259 / 54 + k * (3 * L + (9 / 2) * Lmb + 5 * Lb0 - (5 / 2) * Lb2)
      ∧ 7259 / 54 + k * (3 * L + (9 / 2) * Lmb + 5 * Lb0 - (5 / 2) * Lb2)
        ≤ 34069377180951 / 250000000000 := by
  obtain ⟨hLlo, hLhi⟩ := hL
  obtain ⟨hmblo, hmbhi⟩ := hLmb
  obtain ⟨hb0lo, hb0hi⟩ := hLb0
  obtain ⟨hb2lo, hb2hi⟩ := hLb2
  have hkpos : 0 < k := lt_of_lt_of_le (by norm_num) hklo
  have hcombo_lo : (1745075674597993 / 100000000000000 : Cut)
      ≤ 3 * L + (9 / 2) * Lmb + 5 * Lb0 - (5 / 2) * Lb2 := by nlinarith
  have hcombo_hi : 3 * L + (9 / 2) * Lmb + 5 * Lb0 - (5 / 2) * Lb2
      ≤ 3490151349196043 / 200000000000000 := by nlinarith
  set C := 3 * L + (9 / 2) * Lmb + 5 * Lb0 - (5 / 2) * Lb2 with hC
  have hCpos : 0 < C := lt_of_lt_of_le (by norm_num) hcombo_lo
  refine ⟨?_, ?_⟩
  · have h1 : k * C ≥ ((5000000000000 / 15707963267949 : Cut) / 3) * (1745075674597993 / 100000000000000) := by
      have := mul_le_mul hklo hcombo_lo (by norm_num) (le_of_lt hkpos); linarith [this]
    have h2 : ((5000000000000 / 15707963267949 : Cut) / 3) * (1745075674597993 / 100000000000000)
        ≥ 681387543619019 / 5000000000000 - 7259 / 54 := by norm_num
    linarith
  · have h1 : k * C ≤ ((50000000000000 / 157079632679489 : Cut) / 3) * (3490151349196043 / 200000000000000) := by
      have := mul_le_mul hkhi hcombo_hi (le_of_lt hCpos) (by positivity); linarith [this]
    have h2 : ((50000000000000 / 157079632679489 : Cut) / 3) * (3490151349196043 / 200000000000000)
        ≤ 34069377180951 / 250000000000 - 7259 / 54 := by norm_num
    linarith

end Phys.Algebra.CorrectedEndpointCores
