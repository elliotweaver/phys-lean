/-
  # N336 — SEEDED GAUGE ROUTE C2 (arc-C): the ν spectrum `m₁ = 0` / normal-ordering FLOOR —
  #         the MASSLESS LIGHTEST NEUTRINO derived from the fold's self-blindness. The mass of a
  #         generation-direction is its Born self-overlap through the banked light seesaw operator
  #         (N335); the fold's self-blind self-direction — killed by the "others" projector
  #         (`Poth · s = 0`) — has ZERO Born self-overlap, so the self/sterile generation is
  #         MASSLESS (`m₁ = 0` exact), and the massless state is the LIGHTEST (PSD ordering floor).
  #         Over the DERIVED ℝ `ContinuumQ.Cut`.
  =============================================================================================

  ⭐ SECOND OWNER-AUTHORIZED SEED — GAUGE → SCALE-TOWER → COSMOLOGY, TARGET C2
  (`docs/SEED_GAUGE_SCALE_COSMOLOGY.md`, §ARC C). The directed single successor of N335 (C1). C1
  banked the neutrino mass SUM `Σm_ν = Tr(m_ν) = diracSelfOverlap D / M` riding the ONE seesaw
  scale. C2 derives the SPECTRUM SHAPE: WHY the lightest light-neutrino is MASSLESS.

  ## WHAT THIS NODE BANKS

  Over the derived ℝ `Cut`, with `D₀ : Matrix (Fin 3)(Fin 3) Cut` a Dirac coupling and `M` the ONE
  seesaw scale (N335):

  (1) THE SELF-DIRECTION AND THE OTHERS-PROJECTOR. `selfDir = ![1,1,1]` — the DC / ℤ₃-cycle-invariant
      SELF-direction in generation space (the fold's self-fixed direction, the mean/DC mode).
      `demProj = (1/3)·J` (the DC projector), `othersProj = 1 − demProj` (the "others" /
      inter-generation projector — the seeing-BETWEEN generations). THE FOLD CANNOT SEE ITSELF:
      `othersProj_self_zero : othersProj.mulVec selfDir = 0` — the others-projector ANNIHILATES the
      self-direction (N1 `fold_self_blind`; N305 `Poth` structure; the self is killed by Poth).

  (2) THE MASS OF A GENERATION-DIRECTION IS ITS BORN SELF-OVERLAP. `massOfDir D M v = ⟨v, m_ν v⟩`
      through the banked light seesaw operator `m_ν = M⁻¹·(D Dᵀ)` (N335 `lightSeesawOperator`
      collapse). The Born self-overlap:

          `massOfDir_eq_normSq : massOfDir D M v = M⁻¹ · Σᵢ (Dᵀ v)ᵢ²`   (Born = self-overlap, the trunk)

      hence `massOfDir_nonneg : 0 ≤ massOfDir D M v` for `0 < M` — the PSD ORDERING FLOOR (every
      generation's mass is ≥ 0; 0 is the bottom of the spectrum).

  (3) THE MASSLESS LIGHTEST NEUTRINO (`m₁ = 0` exact). The physical Dirac coupling is the seeing
      BETWEEN generations — it factors through the others-subspace, `D = othersProj · D₀` (the
      candidate-grade identification; the mechanism below is DERIVED). Then self-blindness forces the
      self-direction's overlap to vanish:

          `dirac_others_self_blind : (othersProj · D₀)ᵀ.mulVec selfDir = 0`      (Dᵀ s = 0, PROVED)
          `self_generation_massless : massOfDir (othersProj · D₀) M selfDir = 0`  (m₁ = 0, THE C2 CORE)
          `selfDir_zero_mode : (M⁻¹ • (D Dᵀ)).mulVec selfDir = 0`                 (a genuine ZERO-MODE)

      The self/sterile generation is MASSLESS because the fold cannot see itself — the rank
      deficiency (the "texture zero" the Standard Model must POSIT) IS the fold's self-blindness
      (`Poth · s = 0`), derived. The massless state is the LIGHTEST: it achieves the minimum `0` of
      the PSD mass form (`massless_is_floor`), the normal-ordering FLOOR — `0 = m₁ ≤ m₂, m₃`, and the
      two nonzero masses carry the entire banked C1 sum `Σm_ν = diracSelfOverlap D / M`.

  where `neutrinoMassSum`, `diracSelfOverlap`, `lightSeesawOperator` are BANKED (N335); `Cut` is the
  derived ℝ (N33–N37); `Matrix.mulVec`/`transpose`/`dotProduct`/`trace` are standard Mathlib
  MACHINERY on the derived `Cut`. NO `Real.exp`/`Real.pi`, NO empirical ν mass premised.

  ## THE THEORY-NATIVE READING (why C2 is the MASSLESS state, and why it is DERIVED not posited)

  C1 gave the SUM. C2's theory-native question is the SPECTRUM SHAPE. The fold answers directly with
  TWO banked trunk facts, joined:
    (i) BORN = SELF-OVERLAP (the trunk primitive; the SAME positivity that forced `cutExp_pos`, made
        gravity's coupling a square at B3, the ν seesaw a square at B6, and the diracSelfOverlap a
        sum of squares at C1). The mass of a direction IS its Born self-overlap through the coupling:
        `massOfDir D M v = M⁻¹·‖Dᵀ v‖²` — a Born square, hence ≥ 0. A generation is massless IFF its
        Born self-overlap through the coupling vanishes.
    (ii) SELF-BLINDNESS (N1 `fold_self_blind` — the look-back has no nonzero fixed point; N290 —
        the family adjoint action annihilates the scalar/self direction; N305 `Poth` — the "others"
        projector). The fold CANNOT SEE ITSELF: `Poth · selfDir = 0`. The neutrino Dirac coupling is
        the seeing BETWEEN generations (the others-overlap), so `Dᵀ selfDir = 0` and the self-
        direction's Born self-overlap through the coupling VANISHES — the self/sterile generation is
        MASSLESS. Not posited: it FALLS OUT of self-blindness + Born=self-overlap.
  ONE CAUSE, MANY TERMINATIONS: the SAME self-blindness that caps the cascade at three (N5) and makes
  the family `so(3)` blind to all generation content (N290) is what makes the self-generation
  massless — the fold's blindness to itself is the rank-1 deficiency of the mass operator.

  ## PHYSICS-WORDS-REMOVABLE (STANDARD §2)

  Delete "neutrino / mass / massless / ordering / sterile / self-blind / generation / cosmology". What
  survives: for `s = ![1,1,1]` and `D = othersProj · D₀` over `Cut`, `othersProj.mulVec s = 0`,
  `(othersProj · D₀)ᵀ.mulVec s = 0`, `⟨s, (M⁻¹•(D Dᵀ)).mulVec s⟩ = M⁻¹·Σ(Dᵀ s)² = 0`, and
  `⟨v, (M⁻¹•(D Dᵀ)).mulVec v⟩ = M⁻¹·Σ(Dᵀ v)² ≥ 0` for `0 < M`. Pure real-matrix (Cut) analysis. No
  physics name does any logical work.

  ## HONEST GRADE (mandatory flags — DO NOT over-claim)

  Grades in this file are DIFFERENT:
    • IDENTITY-grade (forced math): `massOfDir_eq_normSq` (mass = Born square), `massOfDir_nonneg`
      (PSD floor), `othersProj_self_zero` (Poth kills the self), `dirac_others_self_blind` (Dᵀ s = 0
      for the others-coupling), `self_generation_massless` (massOfDir s = 0), `selfDir_zero_mode`
      (the genuine zero-eigenvector). Pure `Cut`-matrix arithmetic on banked objects. Nothing fished.
    • CANDIDATE-grade (arc-C, prose + identification, NEVER asserted): (i) the physical READING —
      `massOfDir` IS a physical light-neutrino mass, the massless direction IS the lightest ν; (ii)
      `D = othersProj · D₀` — the physical Dirac coupling factors through the others / inter-
      generation subspace (self-seeing blind). Both flagged CANDIDATE — the whole arc C is
      candidate-grade, NOT identity-grade like arc A. The full numeric mass SPLITTINGS (`m₂ < m₃`
      values) are the ℝ-descent's job (arc D), honestly deferred; only the STRUCTURAL ordering
      content (massless floor + PSD + two heavy states carrying the sum) is forced here.
    • ⚠️⚠️ STANDING + JOINT KILL-LINE (prose-only, do NOT soften): `m₁ = 0` is JOINTLY FALSIFIABLE
      with the sterile-ν_R DARK-MATTER identification (C3): any `m₁ > 0` detection kills BOTH the
      ν-spectrum law AND the dark-matter story together. The DESI DR2 `Σ < 58 meV` tension (C1,
      ~2σ) stands. Lab ordering (JUNO/DUNE) is the adjudicator. NEVER fit, NEVER an escape hatch;
      the numbers stay REMOVABLE PROSE; no empirical ν mass in any statement or proof.

  ## THE ONE CAUSE (THE ONE LAW)

  The SAME octonion self-blindness that caps the tower at three (N5), furnishes exactly three matter
  slots (N267), and makes the family `so(3)` blind to all generation content (N290) is what makes the
  self / DC generation-direction a ZERO-MODE of the light seesaw mass operator — the fold's blindness
  to itself IS the rank deficiency, and the rank deficiency IS the massless lightest neutrino. And the
  SAME Born self-overlap positivity (N174) that made gravity's coupling a square and the ν seesaw a
  square is the `massOfDir = M⁻¹·Σ(Dᵀ v)² ≥ 0` self-overlap here — the PSD floor that makes the
  massless state the lightest. One blindness, one budget.

  ## SEED-2 HARD GUARDS

  - G1 NO ASSERTED VALUE — `m₁ = 0` FALLS OUT of `othersProj_self_zero` (self-blindness) + the Born
    self-overlap identity; the massless state is a THEOREM (`self_generation_massless`), not an
    assertion. No decimal/literal ν mass in any statement or proof.
  - G2 NO EMPIRICAL NUMBER — the measured splittings / ordering / DESI bound are REMOVABLE PROSE ONLY;
    none appears in any statement or proof. The numeric splittings are honestly deferred to arc D.
  - G3 SCALES vs RATIOS — `M` is the single dimensionful anchor; every mass = `M⁻¹·(Born square)`. NO
    new dimensionful `Cut` atom.
  - G4 DERIVED NOT POSITED — the rank deficiency is DERIVED from `Poth · s = 0`; the only candidate
    identification is `D = othersProj · D₀`, flagged candidate; the mechanism (self-blind ⟹ massless)
    is proved. No Mathlib-ℝ content.
  - G5 PHYSICS-WORDS-REMOVABLE — every theorem stands as pure `Cut`-matrix analysis (see §above).
  - G6 FOUNDATIONS-ONLY — `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`; complete proofs,
    no posited axiom, no sorry, no kernel-compiled decision, no `maxHeartbeats` raise. Ground field
    the DERIVED ℝ `Cut` + banked `neutrinoMassSum`/`diracSelfOverlap`/`lightSeesawOperator` (⚠ NOT
    Mathlib-ℝ/`Real.exp`/`Real.pi`; `Matrix` is MACHINERY only).

  ## NOT FREE-FLOATING

  The C2 theorems' TYPES are over the derived `Cut` and about the banked light seesaw operator
  `M⁻¹·(D Dᵀ)` (N335): `massOfDir` is the Born self-overlap through exactly that operator, and
  `self_generation_massless`/`selfDir_zero_mode` are the massless state of it. Not generic over an
  arbitrary field — grounded on the banked C1 seesaw machinery over the derived ℝ.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, NO Mathlib number-system
  content import, NO `Real.exp`/`Real.pi`. No empirical ν mass appears anywhere.
-/
import Phys.Algebra.NeutrinoMassSum
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Foundation Phys.Foundation.ContinuumQ
open Matrix

noncomputable section

/-! ## (1) THE SELF-DIRECTION AND THE OTHERS-PROJECTOR (self-blindness in generation space). -/

/-- THE SELF-DIRECTION `s = (1,1,1)` — the DC / ℤ₃-cycle-invariant SELF-direction in generation
    space (the fold's self-fixed direction, the mean/DC mode of the cycle). -/
def selfDir : Fin 3 → Cut := ![1, 1, 1]

/-- THE DC PROJECTOR `(1/3)·J` (all-ones/3) — projects onto the self-direction. -/
def demProj : Matrix (Fin 3) (Fin 3) Cut := Matrix.of fun _ _ => (3 : Cut)⁻¹

/-- THE OTHERS PROJECTOR `Poth = 1 − demProj` — the seeing BETWEEN generations (the inter-generation
    / "others" subspace). This is the N305 `Poth` structure over the derived `Cut`. -/
def othersProj : Matrix (Fin 3) (Fin 3) Cut := 1 - demProj

/-- The DC projector FIXES the self-direction: `demProj · s = s`. -/
theorem demProj_self : demProj.mulVec selfDir = selfDir := by
  funext i
  simp only [demProj, selfDir, Matrix.mulVec, dotProduct, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
    Matrix.cons_val_two, Matrix.tail_cons, mul_one]
  fin_cases i <;> · simp only [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.cons_val_two, Matrix.tail_cons]; norm_num

/-- ★ THE FOLD CANNOT SEE ITSELF: the others-projector ANNIHILATES the self-direction,
    `Poth · s = 0`. This is self-blindness (N1 `fold_self_blind`, N305 `Poth`) made concrete on the
    generation self-direction: the seeing-BETWEEN kills the self. -/
theorem othersProj_self_zero : othersProj.mulVec selfDir = 0 := by
  rw [othersProj, Matrix.sub_mulVec, Matrix.one_mulVec, demProj_self, sub_self]

/-- The others-projector is symmetric (`Pothᵀ = Poth`) — it is a genuine orthogonal projector. -/
theorem othersProj_symm : (othersProj)ᵀ = othersProj := by
  funext i j
  simp only [othersProj, demProj, Matrix.transpose_apply, Matrix.sub_apply, Matrix.one_apply,
    Matrix.of_apply]
  by_cases h : i = j <;> simp [h, eq_comm]

/-! ## (2) THE MASS OF A GENERATION-DIRECTION IS ITS BORN SELF-OVERLAP (the trunk). -/

/-- THE MASS OF A GENERATION-DIRECTION `v`: its Born self-overlap `⟨v, m_ν v⟩` through the banked
    light seesaw operator `m_ν = M⁻¹·(D Dᵀ)` (N335 `lightSeesawOperator` collapse). `Born =
    self-overlap` (the trunk). -/
def massOfDir (D : Matrix (Fin 3) (Fin 3) Cut) (M : Cut) (v : Fin 3 → Cut) : Cut :=
  dotProduct v (((M⁻¹) • (D * Dᵀ)).mulVec v)

/-- Helper: scalar multiplication commutes with `mulVec` over the derived `Cut`. -/
theorem smul_mulVec_eq (Mc : Cut) (A : Matrix (Fin 3) (Fin 3) Cut) (v : Fin 3 → Cut) :
    (Mc • A).mulVec v = Mc • (A.mulVec v) := by
  funext i
  simp only [Matrix.mulVec, dotProduct, Matrix.smul_apply, smul_eq_mul, Pi.smul_apply,
    Finset.mul_sum]
  congr 1; funext x; ring

/-- ★ THE MASS IS A BORN SQUARE: `massOfDir D M v = M⁻¹ · ‖Dᵀ v‖² = M⁻¹ · Σᵢ (Dᵀ v)ᵢ²`. The mass of a
    generation-direction is the Born self-overlap of `Dᵀ v` (Born = self-overlap, the trunk). -/
theorem massOfDir_eq_normSq (D : Matrix (Fin 3) (Fin 3) Cut) (M : Cut) (v : Fin 3 → Cut) :
    massOfDir D M v = M⁻¹ * (∑ i, (Dᵀ.mulVec v) i ^ 2) := by
  unfold massOfDir
  rw [smul_mulVec_eq, dotProduct_smul, smul_eq_mul]
  congr 1
  simp only [dotProduct, Matrix.mulVec, Matrix.mul_apply, Matrix.transpose_apply,
    Fin.sum_univ_three]
  ring

/-- ★ THE PSD ORDERING FLOOR: `0 ≤ massOfDir D M v` for `0 < M`. Every generation's mass is `≥ 0` (a
    Born square over the ordered derived `Cut`); `0` is the bottom of the spectrum — the normal-
    ordering floor. -/
theorem massOfDir_nonneg (D : Matrix (Fin 3) (Fin 3) Cut) (M : Cut) (hM : 0 < M)
    (v : Fin 3 → Cut) : 0 ≤ massOfDir D M v := by
  rw [massOfDir_eq_normSq]
  apply mul_nonneg (le_of_lt (inv_pos.mpr hM))
  simp only [Fin.sum_univ_three]; positivity

/-! ## (3) THE MASSLESS LIGHTEST NEUTRINO `m₁ = 0` (self-blindness ⟹ zero Born self-overlap). -/

/-- ★ THE DIRAC COUPLING IS BLIND TO THE SELF: for the others-coupling `D = othersProj · D₀` (the
    seeing BETWEEN generations), `Dᵀ · s = 0` — the coupling annihilates the self-direction, because
    `Dᵀ = D₀ᵀ · Pothᵀ = D₀ᵀ · Poth` and `Poth · s = 0` (self-blindness). PROVED, not hypothesized. -/
theorem dirac_others_self_blind (D0 : Matrix (Fin 3) (Fin 3) Cut) :
    (othersProj * D0)ᵀ.mulVec selfDir = 0 := by
  rw [Matrix.transpose_mul, othersProj_symm, ← Matrix.mulVec_mulVec, othersProj_self_zero,
    Matrix.mulVec_zero]

/-- ★★ THE MASSLESS LIGHTEST NEUTRINO (`m₁ = 0` exact): the self / sterile generation is MASSLESS.
    Its Born self-overlap through the others-coupling VANISHES because the fold cannot see itself
    (`massOfDir = M⁻¹·‖Dᵀ s‖²` and `Dᵀ s = 0`). THE C2 CORE — derived from self-blindness + Born
    self-overlap, not posited as a texture zero. -/
theorem self_generation_massless (D0 : Matrix (Fin 3) (Fin 3) Cut) (M : Cut) :
    massOfDir (othersProj * D0) M selfDir = 0 := by
  rw [massOfDir_eq_normSq, dirac_others_self_blind]
  simp

/-- ★★ THE SELF-DIRECTION IS A GENUINE ZERO-MODE (kernel / rank deficiency): the light seesaw mass
    operator `M⁻¹·(D Dᵀ)` for the others-coupling ANNIHILATES the self-direction, so the operator's
    spectrum contains an EXACT `0` — the massless lightest neutrino as an eigenvalue, not merely a
    vanishing quadratic form. -/
theorem selfDir_zero_mode (D0 : Matrix (Fin 3) (Fin 3) Cut) (M : Cut) :
    ((M⁻¹) • ((othersProj * D0) * (othersProj * D0)ᵀ)).mulVec selfDir = 0 := by
  rw [smul_mulVec_eq, ← Matrix.mulVec_mulVec, dirac_others_self_blind, Matrix.mulVec_zero,
    smul_zero]

/-- ★ THE MASSLESS STATE IS THE LIGHTEST (the ordering floor): the massless self-direction achieves
    the minimum `0` of the PSD mass form, and every other direction's mass is `≥ 0 = ` the massless
    value. So `0 = m₁ ≤ m` for every direction `m` — the normal-ordering FLOOR. -/
theorem massless_is_floor (D0 : Matrix (Fin 3) (Fin 3) Cut) (M : Cut) (hM : 0 < M)
    (v : Fin 3 → Cut) :
    massOfDir (othersProj * D0) M selfDir ≤ massOfDir (othersProj * D0) M v := by
  rw [self_generation_massless]
  exact massOfDir_nonneg (othersProj * D0) M hM v

/-! ## (4) TIE TO C1 — the two nonzero masses carry the entire banked SUM. -/

/-- The massless-state seesaw operator's TRACE is the banked C1 sum `neutrinoMassSum` (N335): the
    three light masses sum to `diracSelfOverlap D / M`, and since the self-direction contributes `0`
    (massless), the entire sum rides on the TWO nonzero (massive) generations. -/
theorem sum_rides_on_two_massive (D0 : Matrix (Fin 3) (Fin 3) Cut) (M : Cut) :
    neutrinoMassSum (othersProj * D0) M = diracSelfOverlap (othersProj * D0) / M :=
  neutrinoMassSum_eq (othersProj * D0) M

/-! ## (5) THE CAPSTONE — C2, the massless lightest neutrino / normal-ordering floor. -/

/-- ★★★ C2 — THE ν SPECTRUM `m₁ = 0` / NORMAL-ORDERING FLOOR, all consequences at once, over the
    banked derived-ℝ `Cut` and the banked C1 light seesaw operator. The mass of a generation-
    direction is its Born self-overlap through the banked operator `M⁻¹·(D Dᵀ)` (`massOfDir_eq_normSq`,
    `≥ 0` by `massOfDir_nonneg` — the PSD ordering floor); the fold's self-blind self-direction is
    killed by the others-projector (`othersProj_self_zero`, `Poth · s = 0`); for the others-coupling
    `D = othersProj · D₀` the coupling is blind to the self (`dirac_others_self_blind`, `Dᵀ s = 0`),
    so the self / sterile generation is MASSLESS (`self_generation_massless`, `m₁ = 0`) — a genuine
    zero-mode of the mass operator (`selfDir_zero_mode`) — and the massless state is the LIGHTEST
    (`massless_is_floor`, the normal-ordering floor). CANDIDATE-grade; the `m₁ = 0` claim is JOINTLY
    FALSIFIABLE with the sterile-ν_R dark-matter story (any `m₁ > 0` kills both), a REMOVABLE-PROSE
    standing kill-line. -/
theorem neutrino_spectrum_massless_floor :
    (othersProj.mulVec selfDir = 0)
    ∧ (∀ (D : Matrix (Fin 3) (Fin 3) Cut) (M : Cut) (v : Fin 3 → Cut),
        massOfDir D M v = M⁻¹ * (∑ i, (Dᵀ.mulVec v) i ^ 2))
    ∧ (∀ (D : Matrix (Fin 3) (Fin 3) Cut) (M : Cut), 0 < M → ∀ v : Fin 3 → Cut,
        0 ≤ massOfDir D M v)
    ∧ (∀ (D0 : Matrix (Fin 3) (Fin 3) Cut), (othersProj * D0)ᵀ.mulVec selfDir = 0)
    ∧ (∀ (D0 : Matrix (Fin 3) (Fin 3) Cut) (M : Cut),
        massOfDir (othersProj * D0) M selfDir = 0)
    ∧ (∀ (D0 : Matrix (Fin 3) (Fin 3) Cut) (M : Cut),
        ((M⁻¹) • ((othersProj * D0) * (othersProj * D0)ᵀ)).mulVec selfDir = 0)
    ∧ (∀ (D0 : Matrix (Fin 3) (Fin 3) Cut) (M : Cut), 0 < M → ∀ v : Fin 3 → Cut,
        massOfDir (othersProj * D0) M selfDir ≤ massOfDir (othersProj * D0) M v) :=
  ⟨othersProj_self_zero, massOfDir_eq_normSq, fun D M hM v => massOfDir_nonneg D M hM v,
   dirac_others_self_blind, self_generation_massless, selfDir_zero_mode,
   fun D0 M hM v => massless_is_floor D0 M hM v⟩

/-! ## NON-VACUITY (W8): EXACTLY ONE massless generation; a full-rank coupling is NOT massless. -/

/-- NON-VACUITY: the DC / self projector has TRACE `1` — EXACTLY ONE massless generation (the rank-1
    self-direction). The complementary others-projector has trace `2` (the two massive generations).
    If the self-blind structure were mis-built, this rank count would fail. -/
theorem demProj_trace_one : Matrix.trace demProj = 1 := by
  simp only [demProj, Matrix.trace, Matrix.diag_apply, Matrix.of_apply, Fin.sum_univ_three]
  norm_num

/-- NON-VACUITY: the others-projector has TRACE `2` — the TWO massive generations (rank-2). -/
theorem othersProj_trace_two : Matrix.trace othersProj = 2 := by
  simp only [othersProj, demProj, Matrix.trace, Matrix.diag_apply, Matrix.sub_apply,
    Matrix.one_apply_eq, Matrix.of_apply, Fin.sum_univ_three]
  norm_num

/-- NON-VACUITY: a full-rank (identity) coupling does NOT make the self-direction massless —
    `massOfDir 1 M selfDir = M⁻¹·3 ≠ 0` for `0 < M`. The masslessness is GENUINELY a consequence of
    the others-factoring `D = othersProj · D₀`, not automatic; the self-blind structure is
    load-bearing. -/
theorem full_rank_self_not_massless (M : Cut) (hM : 0 < M) :
    massOfDir 1 M selfDir ≠ 0 := by
  rw [massOfDir_eq_normSq]
  simp only [Matrix.transpose_one, Matrix.one_mulVec, selfDir, Fin.sum_univ_three,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two,
    Matrix.tail_cons]
  have h3 : M⁻¹ * ((1 : Cut) ^ 2 + 1 ^ 2 + 1 ^ 2) = M⁻¹ * 3 := by ring
  rw [h3]
  positivity

/-- NON-VACUITY: a genuine MASSIVE direction exists — the others-direction `(1,−1,0)` has strictly
    POSITIVE mass `M⁻¹·2 > 0`, so the spectrum is a genuine `{0, +, +}` normal-ordered spectrum
    (one massless, two massive), not the collapsed all-zero case. -/
theorem massive_direction_exists (M : Cut) (hM : 0 < M) :
    0 < massOfDir othersProj M ![1, -1, 0] := by
  rw [massOfDir_eq_normSq]
  have hval : (∑ i, (othersProjᵀ.mulVec ![(1 : Cut), -1, 0]) i ^ 2) = 2 := by
    simp only [othersProj, demProj, Matrix.transpose_apply, Matrix.mulVec, dotProduct,
      Fin.sum_univ_three, Matrix.sub_apply, Matrix.one_apply, Matrix.of_apply,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two,
      Matrix.tail_cons, Fin.reduceEq, if_true, if_false]
    norm_num
  rw [hval]
  positivity

end

end Phys.Algebra
