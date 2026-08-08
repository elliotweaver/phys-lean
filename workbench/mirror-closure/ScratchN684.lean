/-
  # N684 — FOLD PHASE CHARACTERIZED (referee item 6, LANE C)
  ================================================================================
  PREREG: workbench/PREREG-LANES-682-684.md (LANE C). Head at freeze: 44b2902e.

  TARGET: `foldPhase = cutPi/8` CHARACTERIZED — the UNIQUE x in Ioo 0 (cutPi/4)
  satisfying the cascade condition
      cutCos (2*x)² = (1 + cutCos (cutPi/2)) / 2   with   0 < cutCos (2*x)
  (the double angle closes the NEXT rung up: the positive Born branch of the
  amplitude-halving cascade). The phase is FORCED as the unique solution of a
  structural condition, not named.

  KILL-CHECK RESULT (prereg (b)): the repo has NO cutCos injectivity /
  strict-antitonicity machinery on [0, cutPi/2] (grep: no strictAnti / InjOn /
  cutCos_lt / cutCos_inj in ContinuumTrig*.lean, ContinuumTrigPi.lean). Uniqueness
  is nonetheless provable WITHOUT it — no MVT machinery is built here. The route:
  if cutCos y · cutCos y = 1/2 with y ∈ Ioo 0 (cutPi/2), the double-angle law
  gives cutCos (y+y) = 0; positivity below the quarter-turn
  (`cutCos_pos_below_half_pi`) forbids y+y < cutPi/2, and the supplement identity
  cutCos (cutPi − w) = −cutCos w (from `cutCos_add_cutPi` + parity `cutCos_neg`)
  forbids cutPi/2 < y+y < cutPi. Hence y+y = cutPi/2 exactly, i.e. y = cutPi/4.

  CONSUMED (banked): cutCos_two_mul, cutCos_pos_below_half_pi, cutCos_quarter_sq,
  cutCos_quarter_pos, cutCos_eighth_sq, cutCos_eighth_pos, foldPhase,
  foldPhase_amplitude (N681, CascadeFoldPhase); cutCos_cutPi_half,
  cutCos_add_cutPi, cutPi_pos (N328, ContinuumTrigPi); cutCos_neg (N323,
  ContinuumTrig). Ground = derived Cut; nothing posited; no sorry, no axiom.
-/
import Phys.Algebra.CascadeFoldPhase
import Mathlib.Tactic

open Set

noncomputable section

namespace Phys.Algebra.FoldPhaseCharacterized

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra.FoldPhase

/-! ## (A) THE CASCADE CONDITION — the structural predicate a fold phase must satisfy.

  `x` is a fold phase iff it lies strictly between `0` and the ℂ-fold angle `cutPi/4`,
  its double angle closes the NEXT rung up — `cutCos(2x)² = (1 + cutCos(cutPi/2))/2`,
  the Born amplitude of the quarter-turn — and the amplitude is on the POSITIVE Born
  branch, `0 < cutCos(2x)`. -/

/-- The cascade condition: `x ∈ Ioo 0 (cutPi/4)`, the double angle satisfies the
    next-rung Born amplitude identity, and the amplitude is the positive branch. -/
def IsFoldPhase (x : Cut) : Prop :=
  x ∈ Ioo (0 : Cut) (cutPi / 4)
    ∧ cutCos (2 * x) * cutCos (2 * x) = (1 + cutCos (cutPi / 2)) / 2
    ∧ 0 < cutCos (2 * x)

/-- The condition's right-hand side is `1/2`: the quarter-turn cosine vanishes
    (`cutCos_cutPi_half`), so the next-rung Born amplitude is `(1+0)/2 = 1/2`. -/
theorem foldPhase_condition_rhs : (1 + cutCos (cutPi / 2)) / 2 = (1 / 2 : Cut) := by
  rw [cutCos_cutPi_half]; ring

/-- Rewritten condition: `x` is a fold phase iff `x ∈ Ioo 0 (cutPi/4)`,
    `cutCos(2x)² = 1/2`, and `0 < cutCos(2x)`. -/
theorem isFoldPhase_iff (x : Cut) :
    IsFoldPhase x ↔
      x ∈ Ioo (0 : Cut) (cutPi / 4)
        ∧ cutCos (2 * x) * cutCos (2 * x) = 1 / 2
        ∧ 0 < cutCos (2 * x) := by
  unfold IsFoldPhase
  rw [foldPhase_condition_rhs]

/-! ## (B) THE SUPPLEMENT IDENTITY — cosine is strictly negative between the
    quarter-turn and the half-turn. This replaces injectivity machinery. -/

/-- Supplement: `cutCos (cutPi - w) = -cutCos w`, from the banked half-turn shift
    `cutCos (x + cutPi) = -cutCos x` and the banked parity `cutCos (-x) = cutCos x`. -/
theorem cutCos_cutPi_sub (w : Cut) : cutCos (cutPi - w) = -cutCos w := by
  have h := cutCos_add_cutPi (-w)
  rw [show -w + cutPi = cutPi - w by ring, cutCos_neg] at h
  exact h

/-- Cosine is strictly NEGATIVE strictly between the quarter-turn and the half-turn:
    `cutPi/2 < z ≤ cutPi ⟹ cutCos z < 0`. Via the supplement `z = cutPi - w` with
    `0 ≤ w < cutPi/2` and positivity below the quarter-turn. -/
theorem cutCos_neg_above_half_pi (z : Cut) (h1 : cutPi / 2 < z) (h2 : z ≤ cutPi) :
    cutCos z < 0 := by
  have hw0 : 0 ≤ cutPi - z := by linarith
  have hwlt : cutPi - z < cutPi / 2 := by linarith
  have hpos : 0 < cutCos (cutPi - z) := cutCos_pos_below_half_pi _ hw0 hwlt
  have hsub := cutCos_cutPi_sub (cutPi - z)
  rw [show cutPi - (cutPi - z) = z by ring] at hsub
  -- hsub : cutCos z = -cutCos (cutPi - z)
  rw [hsub]
  linarith

/-! ## (C) THE ZERO IS PINNED — the only zero of cosine in `(0, cutPi]` up to the
    half-turn's interior is the quarter-turn itself. -/

/-- PINNED ZERO: if `0 < z < cutPi` and `cutCos z = 0` then `z = cutPi/2`.
    Below the quarter-turn cosine is strictly positive (least-zero characterization);
    above it and below the half-turn, strictly negative (supplement). -/
theorem cutCos_eq_zero_pinned (z : Cut) (h0 : 0 < z) (hlt : z < cutPi)
    (hz : cutCos z = 0) : z = cutPi / 2 := by
  rcases lt_trichotomy z (cutPi / 2) with hcase | hcase | hcase
  · have hpos : 0 < cutCos z := cutCos_pos_below_half_pi z (le_of_lt h0) hcase
    exact absurd hz (ne_of_gt hpos)
  · exact hcase
  · have hneg : cutCos z < 0 := cutCos_neg_above_half_pi z hcase (le_of_lt hlt)
    exact absurd hz (ne_of_lt hneg)

/-- THE HALF-AMPLITUDE ANGLE IS PINNED: if `y ∈ Ioo 0 (cutPi/2)` and
    `cutCos y · cutCos y = 1/2`, then `y = cutPi/4`. The double-angle law converts
    the square identity into `cutCos (y+y) = 0`, and the pinned zero forces
    `y + y = cutPi/2`. NO injectivity machinery consumed. -/
theorem cos_sq_half_pinned (y : Cut) (hy : y ∈ Ioo (0 : Cut) (cutPi / 2))
    (hsq : cutCos y * cutCos y = 1 / 2) : y = cutPi / 4 := by
  obtain ⟨hy0, hylt⟩ := hy
  have hdouble : cutCos (y + y) = 2 * cutCos y * cutCos y - 1 := cutCos_two_mul y
  have hzero : cutCos (y + y) = 0 := by rw [hdouble]; nlinarith [hsq]
  have h20 : 0 < y + y := by linarith
  have h2lt : y + y < cutPi := by linarith
  have hpin := cutCos_eq_zero_pinned (y + y) h20 h2lt hzero
  linarith

/-! ## (D) THE WELD — `foldPhase` SATISFIES the condition (consuming the banked
    amplitude cascade), and it is the UNIQUE solution. -/

/-- WELD (existence): the banked `foldPhase = cutPi/8` satisfies the cascade
    condition. `2·(cutPi/8) = cutPi/4`; the banked ℂ-fold amplitude
    `cutCos(cutPi/4)² = 1/2 = (1 + cutCos(cutPi/2))/2` and its positivity close it. -/
theorem foldPhase_isFoldPhase : IsFoldPhase foldPhase := by
  rw [isFoldPhase_iff]
  have hpi := cutPi_pos
  refine ⟨⟨?_, ?_⟩, ?_, ?_⟩
  · unfold foldPhase; linarith
  · unfold foldPhase; linarith
  · rw [show 2 * foldPhase = cutPi / 4 by unfold foldPhase; ring]
    exact cutCos_quarter_sq
  · rw [show 2 * foldPhase = cutPi / 4 by unfold foldPhase; ring]
    exact cutCos_quarter_pos

/-- ★ UNIQUENESS: any `x` satisfying the cascade condition IS `cutPi/8`. The
    condition pins `2x = cutPi/4` (via `cos_sq_half_pinned` at `y = 2x`), hence
    `x = cutPi/8`. Note the positivity conjunct is not even needed for uniqueness —
    the square identity and the window already pin the angle. -/
theorem foldPhase_unique (x : Cut) (hx : IsFoldPhase x) : x = cutPi / 8 := by
  rw [isFoldPhase_iff] at hx
  obtain ⟨⟨hx0, hxlt⟩, hsq, _hpos⟩ := hx
  have hy : (2 * x) ∈ Ioo (0 : Cut) (cutPi / 2) := by
    constructor <;> [linarith; linarith]
  have hpin := cos_sq_half_pinned (2 * x) hy hsq
  linarith

/-- ★★ THE CHARACTERIZATION: `x` satisfies the cascade condition IFF `x = foldPhase`.
    The fold phase is THE unique solution of the structural condition — derived,
    not named. -/
theorem foldPhase_characterized (x : Cut) : IsFoldPhase x ↔ x = foldPhase := by
  constructor
  · intro hx
    have h := foldPhase_unique x hx
    unfold foldPhase
    exact h
  · intro hx
    rw [hx]
    exact foldPhase_isFoldPhase

/-- ★★ EXISTENCE-AND-UNIQUENESS in canonical form: there is EXACTLY ONE `x` in the
    window satisfying the cascade condition, and it is `foldPhase = cutPi/8`. -/
theorem foldPhase_existsUnique : ∃! x : Cut, IsFoldPhase x := by
  refine ⟨foldPhase, foldPhase_isFoldPhase, ?_⟩
  intro y hy
  rw [foldPhase_characterized] at hy
  exact hy

/-! ## (E) NON-VACUITY — the condition genuinely constrains: the window's endpoints
    and the ℂ-fold angle itself FAIL the condition. -/

/-- NON-VACUITY: `0` is NOT a fold phase (it is outside the open window). -/
theorem zero_not_foldPhase : ¬ IsFoldPhase 0 := by
  intro h
  obtain ⟨⟨h0, _⟩, _, _⟩ := h
  exact lt_irrefl 0 h0

/-- NON-VACUITY: the ℂ-fold angle `cutPi/4` is NOT a fold phase — its double angle is
    the quarter-turn whose cosine VANISHES, breaking the positive-branch conjunct. -/
theorem quarter_not_foldPhase : ¬ IsFoldPhase (cutPi / 4) := by
  intro h
  obtain ⟨⟨_, hlt⟩, _, _⟩ := h
  exact lt_irrefl _ hlt

/-- NON-VACUITY (interior failure): `cutPi/6`-style points are excluded not by the
    window but by the AMPLITUDE identity itself — witnessed abstractly: any point of
    the open window other than `cutPi/8` fails the condition. -/
theorem interior_failure (x : Cut) (_hx : x ∈ Ioo (0 : Cut) (cutPi / 4))
    (hne : x ≠ cutPi / 8) : ¬ IsFoldPhase x := by
  intro h
  exact hne (foldPhase_unique x h)

end Phys.Algebra.FoldPhaseCharacterized
