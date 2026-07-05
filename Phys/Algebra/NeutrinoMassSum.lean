/-
  # N335 — SEEDED GAUGE ROUTE C1 (arc-C, FIRST COSMOLOGY CONTACT): `Σm_ν = m₀` rides the tower —
  #         the three-generation neutrino mass SUM is the trace of the type-I light seesaw operator,
  #         and it rides the ONE seesaw scale `m₀ = v²/M` (B6) precisely because the heavy Majorana
  #         scale is FAMILY-BLIND (∝ id). Over the DERIVED ℝ `ContinuumQ.Cut`.
  =============================================================================================

  ⭐ SECOND OWNER-AUTHORIZED SEED — GAUGE → SCALE-TOWER → COSMOLOGY, TARGET C1
  (`docs/SEED_GAUGE_SCALE_COSMOLOGY.md`, §ARC C). The directed single successor of N334 (B7). This is
  the FIRST cosmology contact. It derives the STRUCTURAL IDENTITY `Σm_ν = m₀` — the neutrino mass sum
  rides the banked seesaw scale — as a theorem about the banked `seesawScale` (N333, B6) and its tower
  reading `seesawRatio = scaleTowerRung 9 (−2)` (N334, B7).

  ## WHAT THIS NODE BANKS

  Over the derived ℝ `Cut`, with `D : Matrix (Fin 3)(Fin 3) Cut` the (dimensionful) Dirac coupling:

  (1) THE FAMILY-BLIND HEAVY SCALE. `heavyMajorana M = M • 1` — the heavy (gauge-neutral, sterile)
      Majorana mass operator is FORCED ∝ id by the banked family-blindness (N290
      `family_invariant_core_eq_span_one`: the only family-invariant Hermitian direction is the
      scalar-unit line; N271: the joint colour∧isospin-neutral core = `span{1}`, the sterile ν_R
      direction). Its family-universality is PROVED: `heavyMajorana_family_blind` — it commutes with
      EVERY family rotation `U`; and its seesaw inverse is scalar: `heavyMajorana_scalar_inv`.

  (2) THE BORN SELF-OVERLAP OF THE DIRAC COUPLING. `diracSelfOverlap D = Tr(D Dᵀ) = Σᵢⱼ Dᵢⱼ²`
      (`diracSelfOverlap_eq_sum_sq`) — a Born self-overlap (`Born = self-overlap`, the trunk), hence
      `0 ≤ diracSelfOverlap D` (`diracSelfOverlap_nonneg`).

  (3) THE SUM RIDES THE ONE SCALE. `neutrinoMassSum D M = Tr((M⁻¹) • (D Dᵀ))` — the SUM over the three
      generations = the trace of the type-I light seesaw operator `m_ν = m_D M_R⁻¹ m_Dᵀ`, which
      COLLAPSES (family-blind `M_R = M·1`) to `M⁻¹·(D Dᵀ)`. The structural core:

          `neutrinoMassSum D M = diracSelfOverlap D / M`   (`neutrinoMassSum_eq`)

      — the WHOLE three-generation sum rides the ONE scale `M` because the heavy scale is family-blind.

  (4) THE C1 LANDING (candidate-grade, under an explicit Born-self-overlap-saturation hypothesis):

          `diracSelfOverlap D = v²  ⟹  neutrinoMassSum D M = seesawScale M`   (= m₀ = v²/M, B6)
          `                          ⟹  neutrinoMassSum D M / M = scaleTowerRung 9 (−2)`   (the tower, B7)

      where `v = transmutationScale M (rungExponent(finrank spaceSub)·g²) g²` is the banked electroweak
      VEV (N332). The three-generation sum equals the ONE banked seesaw scale m₀, and its ratio to M is
      the banked `(9,−2)` tower rung.

  where `seesawScale M = M·seesawRatio`, `seesawScale_eq_vev_sq_div` (the literal `v²/M = m₀`),
  `seesawRatio_as_rung` (`m₀/M = scaleTowerRung 9 (−2)`), `transmutationScale`, `scaleTowerRung` are
  BANKED (N320/N333/N334); `Cut` is the derived ℝ (N33–N37); `Matrix.trace`/`transpose`/`smul` are
  standard Mathlib MACHINERY on the derived `Cut`. NO `Real.exp`/`Real.pi`, NO empirical ν mass premised.

  ## THE THEORY-NATIVE READING (why C1 is the SUM structure, not a restatement of `seesawScale`)

  B6/B7 gave `m₀` as a SINGLE dimensionless scale. C1's theory-native question is the SUM: WHY does the
  whole THREE-generation neutrino mass sum equal this ONE scale, and not three independent scales? Two
  banked fold results, joined, force it:
    (i) SELF-BLINDNESS AT THE FAMILY LEVEL (N290/N271): the derived family `so(3)` is blind to all
        generation content — the only family-invariant Hermitian direction is the scalar-unit line. So
        the heavy sterile Majorana operator, being family-invariant, is FORCED ∝ id: ONE scale M,
        family-universal (the field POSITS a family-universal M_R; the theory DERIVES the blindness that
        forces it).
    (ii) BORN = SELF-OVERLAP (the trunk primitive; the SAME positivity that forced `cutExp_pos`, made
        gravity's coupling a square at B3, and the ν seesaw a square at B6): with `M_R = M·1` the
        type-I light operator `m_D M_R⁻¹ m_Dᵀ` collapses to `M⁻¹·(D Dᵀ)` — the Born self-overlap of the
        Dirac coupling over the ONE scale. The SUM is its trace: `Σm_ν = Tr(D Dᵀ)/M`.
  ONE CAUSE, MANY TERMINATIONS: the same family self-blindness (N290) that has no distinguished
  generation direction makes the heavy scale a single scalar, so the whole generation sum rides one
  tower rung.

  ## PHYSICS-WORDS-REMOVABLE (STANDARD §2)

  Delete "neutrino / mass / sum / seesaw / Dirac / Majorana / family / sterile / cosmology". What
  survives: for `D : Matrix (Fin 3)(Fin 3) Cut`, `Tr((M⁻¹)•(D Dᵀ)) = Tr(D Dᵀ)/M`, `Tr(D Dᵀ) = Σᵢⱼ Dᵢⱼ²
  ≥ 0`, `M•1` commutes with every `U` and `(M•1)(M⁻¹•1)=1`, and under `Tr(D Dᵀ) = (transmutationScale
  …)²` one has `Tr((M⁻¹)•(D Dᵀ)) = seesawScale M = M·scaleTowerRung 9 (−2)`. Pure real-matrix analysis
  on the banked `cutExp`/`cutPi`-built scales. No physics name does any logical work.

  ## HONEST GRADE (mandatory flags — DO NOT over-claim)

  Three grades live in this file and they are DIFFERENT:
    • IDENTITY-grade (forced math): the trace factorization `neutrinoMassSum_eq` (the sum rides ONE
      scale M), the Born self-overlap `diracSelfOverlap_eq_sum_sq`/`_nonneg`, the family-blind collapse
      (`heavyMajorana_family_blind`/`_scalar_inv`), and the `seesawScale`/rung landings UNDER the
      explicit normalization hypothesis. Pure `Cut`-matrix arithmetic on banked objects. Nothing fished.
    • CANDIDATE-grade (arc-C, prose + hypothesis, NEVER asserted): (i) the physical READING — `Tr(m_ν)`
      IS the physical neutrino mass sum, `m_ν`'s eigenvalues ARE the physical light masses (`m_ν` PSD ⟹
      nonneg sum); (ii) the Born-self-overlap-saturates-`v²` normalization (`hnorm`) — the Dirac
      coupling self-overlap equals the electroweak scale²; (iii) `M_R ∝ id` as the physical
      family-universal sterile scale. All flagged CANDIDATE — the whole arc C is candidate-grade, NOT
      identity-grade like arc A.
    • ⚠️⚠️ STANDING KILL-LINE (prose-only, do NOT soften): the private program's `Σm_ν ≈ 58 meV` IS
      UNDER 95%-CL EXCLUSION — DESI DR2 fired `Σ < 58 meV`, and the framework's Σ is the normal-ordering
      floor, so the bound excludes ~2σ. This is a REAL FIGHT, NOT a win. The number (58 meV) and its
      exclusion status stay REMOVABLE PROSE; NEVER fit, NEVER invoke an escape hatch, NEVER put an
      empirical ν mass in any statement or proof. Lab ordering (JUNO/DUNE) is the adjudicator.

  ## THE ONE CAUSE (THE ONE LAW)

  The SAME octonion self-blindness that caps the tower at three (N5), furnishes exactly three matter
  slots (N267), and makes the family `so(3)` blind to all generation content (N290) is what forces the
  heavy sterile Majorana scale to be a single scalar `M·1` — so the whole three-generation neutrino
  mass sum rides the ONE banked seesaw scale `m₀ = v²/M`, the `(9,−2)` rung of the one-object tower.
  And the SAME Born self-overlap positivity (N174) that made gravity's coupling a square and the ν
  seesaw a square is the `Tr(D Dᵀ) = Σ Dᵢⱼ² ≥ 0` self-overlap here. One blindness, one budget.

  ## SEED-2 HARD GUARDS

  - G1 NO ASSERTED VALUE — the sum's value FALLS OUT of the trace factorization + the banked
    `seesawScale_eq_vev_sq_div` under an explicit hypothesis. No decimal/literal ν mass in any statement
    or proof.
  - G2 NO EMPIRICAL NUMBER — the measured `Σm_ν ≈ 58 meV` / its DESI exclusion is REMOVABLE PROSE ONLY;
    none appears in any statement or proof.
  - G3 SCALES vs RATIOS — `M` is the single dimensionful anchor; `v = transmutationScale M …` is the
    banked EW scale; `neutrinoMassSum` and `seesawScale` are `M·(dimensionless ratio)`. NO new
    dimensionful `Cut` atom.
  - G4 DERIVED NOT POSITED — `heavyMajorana ∝ id` is JUSTIFIED by the banked family-blindness (N290/
    N271) and its universality PROVED; the sum from the trace + the banked seesaw. No Mathlib-ℝ content.
  - G5 PHYSICS-WORDS-REMOVABLE — every theorem stands as pure `Cut`-matrix analysis (see §above).
  - G6 FOUNDATIONS-ONLY — `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`; complete proofs, no
    posited axiom, no sorry, no kernel-compiled decision, no `maxHeartbeats` raise. Ground field the
    DERIVED ℝ `Cut` + banked `seesawScale`/`transmutationScale`/`seesawRatio`/`scaleTowerRung` (⚠ NOT
    Mathlib-ℝ/`Real.exp`/`Real.pi`; `Matrix` is MACHINERY only).

  ## NOT FREE-FLOATING

  The C1 landing theorems' TYPES cite the banked `seesawScale`, `transmutationScale`, `scaleTowerRung`;
  the RESULT is literally `Σm_ν = the banked seesawScale = M·scaleTowerRung 9 (−2)`. `neutrinoMassSum`/
  `diracSelfOverlap` are over the derived `Cut`. Not generic over an arbitrary field — grounded on the
  banked B6/B7 tower.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, NO Mathlib number-system content
  import, NO `Real.exp`/`Real.pi`. No empirical ν mass appears anywhere.
-/
import Phys.Algebra.ScaleTowerOneObject
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Foundation Phys.Foundation.ContinuumQ
open Matrix

noncomputable section

/-! ## (1) THE FAMILY-BLIND HEAVY MAJORANA SCALE `M_R = M·1`. -/

/-- THE FAMILY-BLIND HEAVY MAJORANA SCALE `M_R = M • 1`. The heavy (gauge-neutral, sterile) Majorana
    mass operator is FORCED ∝ id by the banked family-blindness: N290 (`family_invariant_core_eq_span_one`
    — the only family-invariant Hermitian direction is the scalar-unit line) and N271 (the joint
    colour∧isospin-neutral core `= span{1}`, the sterile ν_R direction). ONE scale `M`. -/
def heavyMajorana (M : Cut) : Matrix (Fin 3) (Fin 3) Cut := M • 1

/-- ★ FAMILY-UNIVERSALITY (the concrete family-blindness): the scalar heavy scale commutes with EVERY
    family rotation `U`. This is the family-blindness N290/N271 made concrete on the mass operator. -/
theorem heavyMajorana_family_blind (M : Cut) (U : Matrix (Fin 3) (Fin 3) Cut) :
    U * heavyMajorana M = heavyMajorana M * U := by
  unfold heavyMajorana
  rw [Matrix.mul_smul, Matrix.smul_mul, mul_one, one_mul]

/-- The scalar heavy scale's seesaw inverse is scalar (`M⁻¹ • 1`) — family-blind ⟹ ONE scale governs
    the inverse, no genuine matrix inversion. -/
theorem heavyMajorana_scalar_inv (M : Cut) (hM : M ≠ 0) :
    heavyMajorana M * (M⁻¹ • (1 : Matrix (Fin 3) (Fin 3) Cut)) = 1 := by
  unfold heavyMajorana
  rw [Matrix.smul_mul, Matrix.mul_smul, mul_one, smul_smul, mul_inv_cancel₀ hM, one_smul]

/-! ## (2) THE BORN SELF-OVERLAP OF THE DIRAC COUPLING. -/

/-- THE BORN SELF-OVERLAP of the Dirac coupling `D`: `Tr(D Dᵀ)`. `Born = self-overlap` (the trunk). -/
def diracSelfOverlap (D : Matrix (Fin 3) (Fin 3) Cut) : Cut := Matrix.trace (D * Dᵀ)

/-- The self-overlap is the sum of squares of the entries — Born positivity made explicit. -/
theorem diracSelfOverlap_eq_sum_sq (D : Matrix (Fin 3) (Fin 3) Cut) :
    diracSelfOverlap D = (D 0 0) ^ 2 + (D 0 1) ^ 2 + (D 0 2) ^ 2
      + (D 1 0) ^ 2 + (D 1 1) ^ 2 + (D 1 2) ^ 2
      + (D 2 0) ^ 2 + (D 2 1) ^ 2 + (D 2 2) ^ 2 := by
  unfold diracSelfOverlap
  simp only [Matrix.trace, Matrix.diag_apply, Matrix.mul_apply, Matrix.transpose_apply,
    Fin.sum_univ_three]
  ring

/-- Born positivity: `0 ≤ Tr(D Dᵀ)` (a sum of squares over the ordered derived `Cut`). -/
theorem diracSelfOverlap_nonneg (D : Matrix (Fin 3) (Fin 3) Cut) :
    0 ≤ diracSelfOverlap D := by
  rw [diracSelfOverlap_eq_sum_sq]; positivity

/-! ## (3) THE NEUTRINO MASS SUM = trace of the light seesaw operator, riding the ONE scale. -/

/-- THE NEUTRINO MASS SUM `Σm_ν = Tr((M⁻¹) • (D Dᵀ))` — the trace of the type-I light seesaw operator
    `m_ν = m_D M_R⁻¹ m_Dᵀ`, which COLLAPSES (family-blind `M_R = M·1`) to `M⁻¹·(D Dᵀ)`. The SUM over
    the three generations. -/
def neutrinoMassSum (D : Matrix (Fin 3) (Fin 3) Cut) (M : Cut) : Cut :=
  Matrix.trace ((M⁻¹) • (D * Dᵀ))

/-- ★ THE SUM RIDES THE ONE SCALE: `Σm_ν = diracSelfOverlap D / M`. The whole three-generation sum is
    the ONE Born self-overlap divided by the ONE scale `M` — because the heavy scale is family-blind.
    THE STRUCTURAL CORE of C1. -/
theorem neutrinoMassSum_eq (D : Matrix (Fin 3) (Fin 3) Cut) (M : Cut) :
    neutrinoMassSum D M = diracSelfOverlap D / M := by
  unfold neutrinoMassSum diracSelfOverlap
  rw [Matrix.trace_smul]
  simp [smul_eq_mul, div_eq_inv_mul]

/-- Born positivity of the sum for `0 ≤ M⁻¹` (the eigenvalue sum of a PSD operator is nonneg). -/
theorem neutrinoMassSum_nonneg (D : Matrix (Fin 3) (Fin 3) Cut) (M : Cut) (hM : 0 < M) :
    0 ≤ neutrinoMassSum D M := by
  rw [neutrinoMassSum_eq]
  exact div_nonneg (diracSelfOverlap_nonneg D) (le_of_lt hM)

/-! ## (4) THE C1 LANDING — `Σm_ν = m₀ = v²/M` rides the `(9,−2)` tower rung. -/

/-- THE BANKED ELECTROWEAK VEV `v = transmutationScale M (rungExponent(finrank spaceSub)·g²) g²`
    (N332). Named here for the normalization hypothesis. -/
def vevScale (M g2 : Cut) : Cut :=
  transmutationScale M (rungExponent (Module.finrank ℚ spaceSub) * g2) g2

/-- ★★ THE C1 LANDING `Σm_ν = m₀`. Under the Born self-overlap saturating the electroweak scale
    (`diracSelfOverlap D = v²`, an explicit HYPOTHESIS — candidate-grade, NEVER asserted), the
    three-generation neutrino mass sum equals the banked seesaw scale `m₀ = v²/M`
    (`seesawScale_eq_vev_sq_div`, B6). The sum rides the ONE banked seesaw scale. -/
theorem neutrinoMassSum_eq_seesawScale (D : Matrix (Fin 3) (Fin 3) Cut) (M g2 : Cut)
    (hM : M ≠ 0) (hg : g2 ≠ 0) (hnorm : diracSelfOverlap D = (vevScale M g2) ^ 2) :
    neutrinoMassSum D M = seesawScale M := by
  rw [neutrinoMassSum_eq, hnorm, vevScale]
  exact seesawScale_eq_vev_sq_div M g2 hM hg

/-- ★★ THE TOWER READING `Σm_ν / M = scaleTowerRung 9 (−2)`. Under the same Born self-overlap
    saturation, the sum's ratio to the anchor `M` is the banked `(9,−2)` rung of the one-object scale
    tower (`seesawRatio_as_rung`, B7) — the Born SQUARE of the electroweak rung. -/
theorem neutrinoMassSum_over_M_eq_rung (D : Matrix (Fin 3) (Fin 3) Cut) (M g2 : Cut)
    (hM : M ≠ 0) (hg : g2 ≠ 0) (hnorm : diracSelfOverlap D = (vevScale M g2) ^ 2) :
    neutrinoMassSum D M / M = scaleTowerRung 9 (-2) := by
  rw [neutrinoMassSum_eq_seesawScale D M g2 hM hg hnorm]
  unfold seesawScale
  rw [mul_div_cancel_left₀ seesawRatio hM, seesawRatio_as_rung]

/-- THE SUM IS BELOW THE VEV `Σm_ν < v` — the seesaw suppression (banked `seesawScale_lt_vev`). -/
theorem neutrinoMassSum_lt_vev (D : Matrix (Fin 3) (Fin 3) Cut) (M g2 : Cut)
    (hM : 0 < M) (hg : g2 ≠ 0) (hnorm : diracSelfOverlap D = (vevScale M g2) ^ 2) :
    neutrinoMassSum D M < vevScale M g2 := by
  rw [neutrinoMassSum_eq_seesawScale D M g2 (ne_of_gt hM) hg hnorm, vevScale]
  exact seesawScale_lt_vev M g2 hM hg

/-! ## (5) THE CAPSTONE — C1, the ν mass sum rides the tower. -/

/-- ★★★ C1 — THE NEUTRINO MASS SUM RIDES THE TOWER, all consequences at once, over the banked derived-ℝ
    `Cut` and the banked B6/B7 seesaw scale. The three-generation neutrino mass sum is the trace of the
    type-I light seesaw operator; it rides the ONE scale `M` (`= diracSelfOverlap D / M`) because the
    heavy Majorana scale is family-blind (`M•1` commutes with every family rotation); the self-overlap
    is a Born sum of squares (`≥ 0`); and under the Born self-overlap saturating the electroweak scale
    `v²`, the sum equals the banked seesaw scale `m₀ = seesawScale M = M·scaleTowerRung 9 (−2)`.
    CANDIDATE-grade; the `Σm_ν ≈ 58 meV` value and its DESI exclusion are REMOVABLE PROSE (the standing
    kill-line). -/
theorem neutrino_mass_sum_rides_tower :
    (∀ (D : Matrix (Fin 3) (Fin 3) Cut) (M : Cut), neutrinoMassSum D M = diracSelfOverlap D / M)
    ∧ (∀ (D : Matrix (Fin 3) (Fin 3) Cut), 0 ≤ diracSelfOverlap D)
    ∧ (∀ (M : Cut) (U : Matrix (Fin 3) (Fin 3) Cut),
        U * heavyMajorana M = heavyMajorana M * U)
    ∧ (∀ (D : Matrix (Fin 3) (Fin 3) Cut) (M g2 : Cut), M ≠ 0 → g2 ≠ 0 →
        diracSelfOverlap D = (vevScale M g2) ^ 2 → neutrinoMassSum D M = seesawScale M)
    ∧ (∀ (D : Matrix (Fin 3) (Fin 3) Cut) (M g2 : Cut), M ≠ 0 → g2 ≠ 0 →
        diracSelfOverlap D = (vevScale M g2) ^ 2 →
          neutrinoMassSum D M / M = scaleTowerRung 9 (-2)) :=
  ⟨neutrinoMassSum_eq, diracSelfOverlap_nonneg, heavyMajorana_family_blind,
   neutrinoMassSum_eq_seesawScale, neutrinoMassSum_over_M_eq_rung⟩

/-! ## NON-VACUITY (W8): the SUM is genuinely over THREE generations riding ONE scale. -/

/-- NON-VACUITY: the Born self-overlap of the identity Dirac coupling COUNTS the three generations —
    `Tr(1·1ᵀ) = Tr 1 = 3` over the derived `Cut`. If the SUM were mis-built (wrong index range, not
    three generations, trace not factoring), this would not equal `3`. -/
theorem diracSelfOverlap_one : diracSelfOverlap (1 : Matrix (Fin 3) (Fin 3) Cut) = 3 := by
  rw [diracSelfOverlap_eq_sum_sq]; simp; norm_num

/-- NON-VACUITY: the family-blind heavy scale is genuinely NONZERO for `M ≠ 0` — the sterile Majorana
    direction carries a real scale, so the seesaw suppression is genuine. -/
theorem heavyMajorana_ne_zero (M : Cut) (hM : M ≠ 0) :
    heavyMajorana M ≠ 0 := by
  unfold heavyMajorana
  intro h
  have h00 : (M • (1 : Matrix (Fin 3) (Fin 3) Cut)) 0 0 = (0 : Matrix (Fin 3) (Fin 3) Cut) 0 0 := by
    rw [h]
  simp only [Matrix.smul_apply, Matrix.one_apply_eq, smul_eq_mul, mul_one,
    Matrix.zero_apply] at h00
  exact hM h00

end

end Phys.Algebra
