/-
# N408 — arc-M M2: THE BORN-SURVIVAL GEAR DECOMPOSITION + THE S1/S2 GEAR SELECTION

Owner-authorized input-closure seed (docs/SEED_INPUT_CLOSURE.md), target **M2 — the S1 gear
decomposition (`m_b`; CANDIDATE)**. The directed successor of N407 (arc-M M1, the winding/ladder-rung
quantization). ⚠⚠ ARC M IS THE HARDEST, LEAST-CERTAIN ARC — the answer key closed the absolute-scale
input closure only CONDITIONALLY, and the CLEAN forced absolute-scale identity DOES NOT EXIST (the
PHANTOM CAP, seed §3). The honest BAR is CANDIDATE grade: DERIVE the STRUCTURE (the Born-survival gear
decomposition + the S1/S2 gear selection); the phase-gear factor carries a PERMANENT INCEPTION FLAG.

## THE TARGET (seed §M2)
The key's `m_b` route is `m_b/m_t = (tan²P · cosP · √(2/3))²`, whose amplitude decomposes EXACTLY
into banked ladder factors — S1 is SELECTED by the grammar; S2 (`3^{−1/4}`) is meaningless (the
gear-search is empty). This node DERIVES the decomposition STRUCTURE, `m_b` a grammar-CANDIDATE,
NEVER fit to the measured value.

## THE THEORY-NATIVE PICTURE (why the decomposition is FORCED, not an ansatz)
An amplitude on the fold's ℤ₃ generation cycle (the probe blind to itself, N305–N308) is a PRODUCT
OF BORN-SURVIVAL STEPS. The self-blind seeing operator has the unique Born weight split `1/3 ⊕ 2/3`
(N308: the self-seen "others" fraction `Matrix.trace Poth / 3 = 2/3`). A Born-survival GEAR is the
DERIVED √ of a Born weight the cycle produces. The amplitude's √ therefore factors as
`(phase gear) · (Born gear)`:
- the **Born gear** `bornGearP := cutSqrt (self-seen fraction)` is the derived √ of the BANKED
  rational `Matrix.trace Poth / 3 = 2/3` — it squares back to the self-seen fraction (`bornGearP_sq`);
- the **phase gear** (`tan²P · cosP`, the fold's cascade angle) is the CANDIDATE parameter — the fold
  phase `P` is NOT banked here (it is an arc-O target, O3, AFTER arc M), so it is carried as an
  EXPLICIT parameter `phaseGear : Cut` and honestly DEFERRED. Deriving `P` now would be out of order
  AND grinding for the clean number the phantom cap forbids.

## THE S1/S2 GEAR SELECTION (the dissolution — a decidable, finite gear-search)
The standard framework treats `m_b/m_t` as a free Yukawa dial with no answer to "why this value".
The theory turns that WALL into a DECIDABLE search over RATIONAL Born weights:
- **S1 admissible.** `bornGearP` is the derived √ of the BANKED rational weight `2/3` (`s1_grammar`).
- **S2 EXCLUDED.** S2's `3^{−1/4}` has Born weight `3^{−1/2} = cutSqrt (1/3)`, which is NOT a rational
  cast, because NO rational squares to `1/3` (`no_rat_sq_third`, pure ℚ, NO Real) — so `cutSqrt (1/3)`
  is irrational (`s2_bornweight_irrational`). The S2 gear-search over rational Born weights is EMPTY.

## WHAT THIS BANKS (ns `Phys.Algebra.GearGrammar`)
- `bornGearP`, `bornGearP_sq`, `s1_grammar` — the S1 Born gear as the derived √ of the banked 2/3.
- `no_rat_sq_three`, `no_rat_sq_third`, `s2_bornweight_irrational` — the S2 exclusion (empty search).
- `amplitude_decomposition` — the decomposition FORM (phase gear × Born gear)² = phase² · (self-seen).
- W8 teeth: `bornGearP_ne_zero`, `selfseen_ne_democratic`, `s2_ne_s1`.
- `born_survival_gear_structure` — the capstone conjunction (candidate-grade STRUCTURE).

## THE ONE CAUSE
The SAME self-blindness that gives the ℤ₃ cycle its Born weight split `1/3 ⊕ 2/3` (N308) both
SUPPLIES the admissible S1 Born gear (√ of the rational `2/3`) AND EXCLUDES the S2 gear (√ of `1/3`
is irrational): one Born-counting fact, one admissible gear, one excluded gear.

## WORDS-REMOVABLE (STANDARD §2)
Delete "mass", "quark", "Yukawa", "gear", "generation", "flavor": over the derived ℝ `Cut`,
`cutSqrt (r)` for the banked rational `r = Matrix.trace Poth / 3` squares back to `r`; there is no
rational whose square is `3` (hence none whose square is `1/3`), so `cutSqrt (1/3)` is not a rational
cast; and `(a · cutSqrt r)² = a² · r`. Pure statements about a derived √ of a banked rational, an
irrationality obstruction, and a product form. Every TYPE cites the banked `Matrix.trace Poth` /
`cutSqrt` / `Cut` — NOT generic.

## HONEST GRADE
CANDIDATE. The Born gear √(2/3) is FORCED (grounded on banked N308); the S2 exclusion is a THEOREM;
the phase gear is a deferred-candidate with a PERMANENT INCEPTION FLAG (arc-O's P). No empirical
number in any proof; `m_b/m_t` measured value is REMOVABLE PROSE only. This is the honest conditional
STRUCTURE the seed asks for — not a fitted scale, not a phantom clean identity.
-/
import Phys.Algebra.OctonionJordanGenerationCyclePhase
import Phys.Algebra.LorentzContinuumSqrt
import Mathlib.Tactic

open Phys.Foundation.ContinuumQ
open Phys.Algebra
open Phys.Algebra.HJ

namespace Phys.Algebra.GearGrammar

noncomputable section

/-- The S1 Born-survival GEAR: the DERIVED √ of the BANKED self-seen fraction `Matrix.trace Poth / 3`
    (N308, `= 2/3`). Over the derived ℝ `Cut`, using the banked derived √ `cutSqrt`. -/
noncomputable def bornGearP : Cut := cutSqrt (((Matrix.trace Poth / 3 : ℚ) : Cut))

/-- The self-seen fraction is the banked rational `2/3` (N308), cast into the derived ℝ. -/
theorem selfseen_cut : ((Matrix.trace Poth / 3 : ℚ) : Cut) = ((2/3 : ℚ) : Cut) := by
  rw [selfseen_two_thirds]

theorem selfseen_nonneg_rat : (0 : ℚ) ≤ Matrix.trace Poth / 3 := by
  rw [selfseen_two_thirds]; norm_num

theorem selfseen_nonneg : (0 : Cut) ≤ ((Matrix.trace Poth / 3 : ℚ) : Cut) := by
  rw [selfseen_cut]; norm_num

/-- ★ THE S1 GEAR squares back to the banked self-seen fraction — ties the TYPE to `Poth` (N308). -/
theorem bornGearP_sq : bornGearP * bornGearP = ((Matrix.trace Poth / 3 : ℚ) : Cut) := by
  unfold bornGearP
  exact cutSqrt_sq selfseen_nonneg

/-- ★ S1 GRAMMAR MEMBERSHIP: the Born gear is the derived √ of a NONNEGATIVE RATIONAL Born weight
    (the banked self-seen fraction). This is what "admissible S1 gear" means structurally. -/
theorem s1_grammar : ∃ w : ℚ, 0 ≤ w ∧ bornGearP * bornGearP = ((w : ℚ) : Cut) :=
  ⟨Matrix.trace Poth / 3, selfseen_nonneg_rat, bornGearP_sq⟩

/-- ★★ THE S2-EXCLUSION CORE (pure ℚ, NO `Real` as content): NO rational squares to `3`. -/
theorem no_rat_sq_three : ¬ ∃ r : ℚ, r ^ 2 = 3 := by
  rintro ⟨q, hq⟩
  have hnd : (q.num : ℚ) / (q.den : ℚ) = q := Rat.num_div_den q
  have key : (q.num) ^ 2 = 3 * (q.den : ℤ) ^ 2 := by
    have h2 : (q.num : ℚ) ^ 2 = 3 * (q.den : ℚ) ^ 2 := by
      rw [← hnd] at hq
      have hden0 : (q.den : ℚ) ≠ 0 := by exact_mod_cast q.den_nz
      field_simp at hq
      linarith [hq]
    exact_mod_cast h2
  have h3p : Prime (3 : ℤ) := by norm_num
  have hdvd_num : (3 : ℤ) ∣ q.num := h3p.dvd_of_dvd_pow ⟨(q.den : ℤ) ^ 2, key⟩
  obtain ⟨k, hk⟩ := hdvd_num
  have hdvd_den : (3 : ℤ) ∣ (q.den : ℤ) := by
    have h9' : (q.den : ℤ) ^ 2 = 3 * k ^ 2 := by
      have hcancel : (3:ℤ) * (q.den : ℤ) ^ 2 = 3 * (3 * k ^ 2) := by rw [← key, hk]; ring
      exact mul_left_cancel₀ (by norm_num : (3:ℤ) ≠ 0) hcancel
    exact h3p.dvd_of_dvd_pow ⟨k ^ 2, h9'⟩
  have hcop : Nat.Coprime q.num.natAbs q.den := q.reduced
  have hd1 : 3 ∣ q.num.natAbs := by
    have := Int.natAbs_dvd_natAbs.mpr (⟨k, hk⟩ : (3:ℤ) ∣ q.num); simpa using this
  have hd2 : 3 ∣ q.den := by
    have := Int.natAbs_dvd_natAbs.mpr hdvd_den; simpa using this
  have hg : (3 : ℕ) ∣ Nat.gcd q.num.natAbs q.den := Nat.dvd_gcd hd1 hd2
  rw [hcop] at hg; norm_num at hg

/-- No rational squares to `1/3` either (the S2 gear's own square is irrational). -/
theorem no_rat_sq_third : ¬ ∃ r : ℚ, r ^ 2 = 1/3 := by
  rintro ⟨r, hr⟩
  exact no_rat_sq_three ⟨3 * r, by rw [mul_pow, hr]; norm_num⟩

/-- ★★ S2 EXCLUDED: S2's Born weight `3^{−1/2} = cutSqrt (1/3)` is NOT a rational cast — the
    gear-search over RATIONAL Born weights is EMPTY for S2. -/
theorem s2_bornweight_irrational :
    ¬ ∃ w : ℚ, cutSqrt (((1/3 : ℚ) : Cut)) = ((w : ℚ) : Cut) := by
  rintro ⟨w, hw⟩
  have hnn : (0:Cut) ≤ ((1/3:ℚ):Cut) := by norm_num
  have hsq : cutSqrt (((1/3:ℚ):Cut)) * cutSqrt (((1/3:ℚ):Cut)) = ((1/3:ℚ):Cut) := cutSqrt_sq hnn
  rw [hw] at hsq
  have hcast : (((w^2 : ℚ)) : Cut) = (((1/3 : ℚ)) : Cut) := by
    push_cast; ring_nf; ring_nf at hsq; linear_combination hsq
  have hqe : (w^2 : ℚ) = (1/3 : ℚ) := by exact_mod_cast hcast
  exact no_rat_sq_third ⟨w, hqe⟩

/-- ★ THE DECOMPOSITION FORM: an amplitude = (phase gear) · (Born gear); its square is
    `phase² · (self-seen fraction)`. `phaseGear` is the CANDIDATE parameter (the fold phase
    `tan²P·cosP` — arc-O's P, honestly DEFERRED with a permanent inception flag). -/
theorem amplitude_decomposition (phaseGear : Cut) :
    (phaseGear * bornGearP) * (phaseGear * bornGearP)
      = (phaseGear * phaseGear) * ((Matrix.trace Poth / 3 : ℚ) : Cut) := by
  rw [show (phaseGear * bornGearP) * (phaseGear * bornGearP)
        = (phaseGear * phaseGear) * (bornGearP * bornGearP) by ring, bornGearP_sq]

/-! ## W8 non-vacuity teeth -/

/-- The S1 Born gear is nonzero (the self-seen fraction `2/3 ≠ 0`). -/
theorem bornGearP_ne_zero : bornGearP ≠ 0 := by
  intro h
  have hsq : bornGearP * bornGearP = ((2/3:ℚ):Cut) := by rw [bornGearP_sq, selfseen_cut]
  rw [h] at hsq
  simp only [mul_zero] at hsq
  have h0 : ((0:ℚ):Cut) = ((2/3:ℚ):Cut) := by push_cast; push_cast at hsq; linarith [hsq]
  have h0' : (0:ℚ) = 2/3 := by exact_mod_cast h0
  norm_num at h0'

/-- The self-seen (S1) fraction `2/3` differs from the democratic `1/3`: the S1 Born weight is the
    "others" fraction, not the gathered/Unity fraction. -/
theorem selfseen_ne_democratic :
    ((Matrix.trace Poth / 3 : ℚ) : Cut) ≠ ((1/3 : ℚ) : Cut) := by
  rw [selfseen_cut]
  intro h
  have h2 : (2/3:ℚ) = 1/3 := by exact_mod_cast h
  norm_num at h2

/-- The S1 Born weight `2/3` is NOT the S2 Born weight `1/3` — the two gears are genuinely distinct. -/
theorem s2_ne_s1 : ((1/3 : ℚ) : Cut) ≠ ((Matrix.trace Poth / 3 : ℚ) : Cut) :=
  fun h => selfseen_ne_democratic h.symm

/-- ★★★ THE CAPSTONE (candidate-grade STRUCTURE): the S1 Born gear squares to the banked self-seen
    fraction (admissible), the S2 Born weight is irrational (excluded, empty gear-search), the
    decomposition form holds for any phase gear, and the gear is non-vacuous. -/
theorem born_survival_gear_structure :
    (bornGearP * bornGearP = ((Matrix.trace Poth / 3 : ℚ) : Cut))
    ∧ (∃ w : ℚ, 0 ≤ w ∧ bornGearP * bornGearP = ((w : ℚ) : Cut))
    ∧ (¬ ∃ w : ℚ, cutSqrt (((1/3 : ℚ) : Cut)) = ((w : ℚ) : Cut))
    ∧ (∀ phaseGear : Cut, (phaseGear * bornGearP) * (phaseGear * bornGearP)
        = (phaseGear * phaseGear) * ((Matrix.trace Poth / 3 : ℚ) : Cut))
    ∧ bornGearP ≠ 0 :=
  ⟨bornGearP_sq, s1_grammar, s2_bornweight_irrational, amplitude_decomposition, bornGearP_ne_zero⟩

end

end Phys.Algebra.GearGrammar
