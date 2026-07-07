/-
  Phys.Algebra.CondensedMatterPhaseTransition — N405 (arc-L L4).
  ============================================================================================
  CONDENSED MATTER / PHASE TRANSITIONS = THE SAME FOLD ENGINE AT THE MANY-BODY SCALE.

  Arc L (the emergent matter ladder) has climbed nuclear (L1), atomic (L2), chemical (L3). L4 is
  the many-body scale: order parameters, phases, and critical phenomena. The theory does NOT posit a
  Landau/Ginzburg free-energy functional and RG-compute exponents fitted to materials. It reads all
  of it off two ALREADY-BANKED fold engines:

    • G3 (Phys/Algebra/MaxEntArrowOfTime, the arrow / maxent structure): the C6-forced equilibrium
      `uniformState n` and the deviation self-datum `relInfo p q` (≥0, =0 iff equal, >0 for a
      concrete distinct witness). A same-budget deviation from maxent carries a strictly-positive
      self-datum = partial self-coincidence = C6-forbidden — so the symmetric (disordered) phase IS
      the maxent equilibrium, and an ORDER PARAMETER is a measure of deviation from it.

    • G2 (Phys/Algebra/UniversalityCriticalExponent, the universality / critical-exponent structure):
      the totalization projector `chanProj n` is the UNIQUE equivariant + sum-reading + idempotent +
      nonzero operator (`criticalProjector_unique`), the completeness/rank-1 engine that killed the
      identity part; its entry IS the banked fine-structure channel share `α* = 1/42`, and its
      inverse (the channel count 42) is half the scale-tower numerator `84 = 2/α*`.

  THE LOAD-BEARING WELD (never banked — the genuine new content, NOT a hollow conjunction):
  `equilibrium_is_universality_fixedpoint` — the abstractly-characterized universality fixed point
  (any equivariant + sum-reading + idempotent + nonzero M) has, cast to the derived ℝ `Cut`, each of
  its ROWS equal to the maxent equilibrium `uniformState`. Two INDEPENDENTLY-derived objects — the
  completeness/rank-1 engine (G2) and the Gibbs/C6 engine (G3) — are the SAME democratic
  totalization. One cause, two terminations: universality (microscopic-detail independence) IS the
  rank-1 forcing, and it lands on the maxent equilibrium.

  So a PHASE TRANSITION is: the order parameter `orderParam p = relInfo p (uniformState n)` vanishes
  EXACTLY on the symmetric equilibrium phase (disordered) and is strictly positive on a distinct
  (ordered/broken) phase; and the transition's UNIVERSAL exponent is the banked `α* = 1/42`, the same
  number that fixes the couplings — one engine (`84 = 2/α*`), two regimes.

  GRADE: MECHANISM (beyond-key, SEED_MATTER_LADDER §L4). The order-parameter STRUCTURE, the universal
  exponent, the WELD, and the two-regime cross-tie are FULL theorems foundations-only over the derived
  `Cut` + the banked ℚ objects. The IDENTIFICATION that this IS condensed-matter criticality binding
  real materials is MECHANISM-grade (flagged prose). NO material number (transition temperatures,
  material-specific exponents) appears in any statement or proof (G1/G2 NO-FIT).

  PHYSICS-WORDS-REMOVABLE: delete "condensed matter", "phase transition", "order parameter",
  "critical", "disordered", "ordered" — every theorem stands as a pure statement about `relInfo` /
  `uniformState` / `chanProj` / `criticalExponent` over `Cut` and ℚ.
-/
import Phys.Algebra.UniversalityCriticalExponent
import Phys.Algebra.MaxEntArrowOfTime
import Mathlib.Tactic

namespace Phys.Algebra.PhaseTransition

open Phys.Algebra.Universality
open Phys.Algebra.MaxEnt
open Phys.Foundation Module
open Phys.Foundation.ContinuumQ
open Phys.Algebra
open Matrix

/-! ## §1 — THE WELD: the universality fixed point (G2) IS the maxent equilibrium (G3). -/

/-- The totalization projector has uniform entries `1/n` (both diagonal and off-diagonal). -/
theorem chanProj_entry_uniform (n : ℕ) (i j : Fin n) :
    chanProj n i j = 1 / (n : ℚ) := by
  simp only [chanProj, chanTot, Matrix.smul_apply, smul_eq_mul, mul_one]

/-- THE CAST WELD: the projector's rational entry `1/n` casts to the derived-ℝ equilibrium value
    `(n : Cut)⁻¹ = uniformState n j`. -/
theorem cast_uniform_weld (n : ℕ) (j : Fin n) :
    (((1 : ℚ) / (n : ℚ) : ℚ) : Cut) = uniformState n j := by
  unfold uniformState
  push_cast
  rw [one_div]

/-- Each ROW of the totalization projector, cast to `Cut`, is the maxent equilibrium `uniformState`. -/
theorem critProjRow_eq_equilibrium (n : ℕ) (i j : Fin n) :
    ((chanProj n i j : ℚ) : Cut) = uniformState n j := by
  rw [chanProj_entry_uniform]; exact cast_uniform_weld n j

/-- ★★ THE LOAD-BEARING WELD (never banked). The universality fixed point — characterized abstractly
    as ANY equivariant + sum-reading + idempotent + nonzero operator `M` over `Fin n` (n ≥ 2), which
    `criticalProjector_unique` forces to be the totalization projector — has, cast to the derived ℝ
    `Cut`, each of its ROWS equal to the maxent equilibrium `uniformState n`. The completeness/rank-1
    engine (G2) and the Gibbs/C6 engine (G3) are the SAME democratic totalization. -/
theorem equilibrium_is_universality_fixedpoint {n : ℕ} (hN : 2 ≤ n)
    {M : Matrix (Fin n) (Fin n) ℚ}
    (hEq : Equivariant M) (hSR : SumReading M) (hIdem : M * M = M) (hNe : M ≠ 0)
    (i j : Fin n) :
    ((M i j : ℚ) : Cut) = uniformState n j := by
  rw [criticalProjector_unique hN hEq hSR hIdem hNe]
  exact critProjRow_eq_equilibrium n i j

/-! ## §2 — THE ORDER PARAMETER = the maxent-deviation self-datum (G3). -/

/-- THE ORDER PARAMETER: the deviation self-datum of a many-body distribution `p` from the C6-forced
    symmetric equilibrium `uniformState n`. This is NOT a posited Landau field — it is the banked
    relative-information self-datum `relInfo` read against the maxent reference. -/
noncomputable def orderParam {n : ℕ} (p : Fin n → Cut) : Cut := relInfo p (uniformState n)

/-- The symmetric (disordered) phase — the equilibrium itself — has order parameter ZERO. -/
theorem orderParam_disordered_zero (n : ℕ) :
    orderParam (uniformState n) = 0 := relInfo_self _

/-- ★ THE ORDER PARAMETER VANISHES EXACTLY ON THE SYMMETRIC PHASE: for a positive normalized state,
    `orderParam p = 0` IFF `p` IS the maxent equilibrium. The order parameter distinguishes the
    symmetric phase from every broken phase — no second zero to slide into (the pinned-unique-vacuum
    shape of Born self-overlap, at the many-body state level). -/
theorem orderParam_zero_iff_symmetric {n : ℕ} [NeZero n] (p : Fin n → Cut)
    (hp : ∀ i, 0 < p i) (hsp : ∑ i, p i = 1) :
    orderParam p = 0 ↔ p = uniformState n := by
  unfold orderParam
  exact relInfo_zero_iff p (uniformState n) hp uniformState_pos hsp uniformState_sum_one

/-- The banked concrete reference `qWit = ![1/2, 1/2]` IS the maxent equilibrium `uniformState 2`. -/
theorem qWit_eq_uniform : qWit = uniformState 2 := by
  funext i
  unfold qWit uniformState
  fin_cases i <;> · norm_num

/-- ★ A DISTINCT (ordered / symmetry-broken) PHASE HAS STRICTLY POSITIVE ORDER PARAMETER: the banked
    concrete deviation `pWit = ![3/4, 1/4]` genuinely departs from the equilibrium, so its order
    parameter is `> 0` (the strict Gibbs inequality bites). A genuine phase transition, not a vacuous
    one. -/
theorem orderParam_ordered_pos : 0 < orderParam pWit := by
  unfold orderParam
  rw [← qWit_eq_uniform]
  exact maxent_deviation_pos

/-! ## §3 — THE UNIVERSAL EXPONENT = the banked channel share α* = 1/42, one engine two regimes. -/

/-- The critical (universal) exponent IS the banked fine-structure channel share `α*` (re-export of
    the G2 marquee). -/
theorem criticalExponent_eq_alphaStar' :
    criticalExponent = alphaStar := criticalExponent_eq_alphaStar

/-- The critical (universal) exponent is `1/42`. -/
theorem criticalExponent_eq_one_div_42' :
    criticalExponent = 1 / 42 := criticalExponent_eq_one_div_42

/-- ★ THE TWO-REGIME CROSS-TIE: the SAME numerator `84 = 2/α* = 2·(channel count)` that is the
    arc-B scale-tower rung numerator (couplings regime) governs criticality (critical-phenomena
    regime). One completeness engine, two utterly different regimes. -/
theorem universality_two_regime :
    (84 : ℚ) = 2 / alphaStar
      ∧ (84 : ℚ) = 2 * (imChannelCount (Module.finrank ℚ ImO) : ℚ) :=
  scaleTowerNumerator_eq

/-! ## §4 — THE CAPSTONE + W8 non-vacuity. -/

/-- ★★★ THE PHASE-TRANSITION STRUCTURE (arc-L L4 capstone). Bundled over the derived ℝ `Cut` and the
    banked ℚ objects:
      (WELD)  the universality fixed point (any equivariant + sum-reading + idempotent + nonzero M)
              has each row = the maxent equilibrium `uniformState`;
      (ORDER PARAMETER) it vanishes on the symmetric phase, is strictly positive on a distinct phase,
              and is zero IFF the state IS the equilibrium;
      (EXPONENT) the universal critical exponent IS the banked channel share `α* = 1/42`;
      (CROSS-TIE) the numerator `84 = 2/α* = 2·(channel count)` — the same number that fixes the
              couplings — governs criticality.
    Condensed-matter criticality is the SAME fold engine (maxent/C6 + completeness/rank-1) at the
    many-body scale. -/
theorem phase_transition_structure {n : ℕ} [NeZero n] (hN : 2 ≤ n) :
    (∀ {M : Matrix (Fin n) (Fin n) ℚ},
        Equivariant M → SumReading M → M * M = M → M ≠ 0 →
        ∀ i j, ((M i j : ℚ) : Cut) = uniformState n j)
      ∧ orderParam (uniformState n) = 0
      ∧ 0 < orderParam pWit
      ∧ (∀ (p : Fin n → Cut), (∀ i, 0 < p i) → (∑ i, p i = 1) →
            (orderParam p = 0 ↔ p = uniformState n))
      ∧ criticalExponent = alphaStar
      ∧ criticalExponent = 1 / 42
      ∧ (84 : ℚ) = 2 / alphaStar
      ∧ (84 : ℚ) = 2 * (imChannelCount (Module.finrank ℚ ImO) : ℚ) :=
  ⟨fun hEq hSR hIdem hNe i j =>
      equilibrium_is_universality_fixedpoint hN hEq hSR hIdem hNe i j,
   orderParam_disordered_zero n,
   orderParam_ordered_pos,
   fun p hp hsp => orderParam_zero_iff_symmetric p hp hsp,
   criticalExponent_eq_alphaStar,
   criticalExponent_eq_one_div_42,
   (scaleTowerNumerator_eq).1, (scaleTowerNumerator_eq).2⟩

/-- W8 non-vacuity: a genuine transition — the ordered phase's order parameter differs from the
    disordered (symmetric) phase's. If the "transition" were vacuous (order parameter constant), this
    would fail. -/
theorem orderParam_ordered_ne_disordered :
    orderParam pWit ≠ orderParam (uniformState 2) := by
  rw [orderParam_disordered_zero]
  exact ne_of_gt orderParam_ordered_pos

end Phys.Algebra.PhaseTransition
