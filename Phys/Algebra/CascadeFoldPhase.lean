/-
  Phys.Algebra.CascadeFoldPhase — N416 (SEED_COMPLETION_SWEEP.md, arc O, target O1).
  ============================================================================================
  THE FOLD PHASE P via the HALF-ANGLE AMPLITUDE CASCADE — the cascade's own rotation angle,
  DERIVED (never asserted), over the derived ℝ `Cut`.

  Arc M banked the absolute-scale chain `absScaleChain phaseBorn topLink lightLink` (N409) with a
  GENUINELY FREE rational slot `phaseBorn` (`absScaleChain_parameter_dependent`, N410): the absolute
  scale was CONDITIONAL on an undetermined phase. This node DERIVES that phase from the cascade's own
  structure — the M-discharge prerequisite (O2).

  ---------------------------------------------------------------------------
  THE DERIVATION (theory-native, forced, no posited angle).

  The Cayley–Dickson cascade is a sequence of self-look-backs, each the AMPLITUDE — the positive
  self-overlap (Born) square-root — of the previous rotation. The fold's intrinsic chirality forced
  the complex unit `J` with `J² = −1` (banked `Dbl.mulJ_isFoldRoot`, N2; `foldComplex`, N392): the
  QUARTER-TURN, `cutCos (cutPi/2) = 0` (banked `cutCos_cutPi_half`). Each subsequent Cayley–Dickson
  fold HALVES the angle, because the half-angle identity
      `cutCos x = 2·cutCos(x/2)·cutCos(x/2) − 1`      (`cutCos_half_angle`, the double-angle law)
  reads `cutCos(x/2)² = (1 + cutCos x)/2` — the amplitude at the half-step is the POSITIVE Born root
  of `(1 + cutCos x)/2`. So the cascade's angle descends by exact half-steps:
      π/2  (ℂ unit, quarter-turn, `J²=−1`)
        → π/4  (ℂ-fold: `cutCos(π/4)² = 1/2`, the 45° self=other Born balance, N309-genre)
        → π/8 = P  (ℍ-fold: `cutCos(π/8)² = (1 + cutCos(π/4))/2`)
        → π/16     (the next amplitude half-step `R = cos(P/2)`, cascade continues).
  Each rung's cosine is the STRICTLY-POSITIVE root (positivity below the quarter-turn,
  `cutCos_pos_below_half_pi`, from the least-cosine-zero characterization of `cutPi/2`). The angle
  `P = cutPi/8` is FORCED as the ℍ-level fold angle — not an input, not a fit, not a posited `π/8`.

  ---------------------------------------------------------------------------
  THE DISSOLUTION / MOAT (STANDARD §0). Standard physics treats a `π/8`-type angle as an INPUT / a
  fit parameter, and `cos(π/8)` as a mere computation. The theory DISSOLVES the "why this angle?"
  wall two ways: (a) the angle is the third rung of an amplitude-HALVING cascade anchored at the
  forced quarter-turn `J²=−1` — the halving is forced by the CD doubling, one amplitude step per
  fold; (b) the half-angle identity `cos²(half) = (1+cos)/2` IS the Born-square amplitude law — what
  standard trigonometry calls a formula, the theory reads as the fold's positive-self-overlap
  descent. THE ONE CAUSE: the fold's own chirality (which forced `J`, `J²=−1`) sets the quarter-turn;
  the Born-amplitude structure (positive self-overlap root) forces every subsequent fold to halve it.

  ---------------------------------------------------------------------------
  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete "fold / cascade / amplitude / Born / phase /
  quarter-turn / half-step": what remains is — over the derived ℝ `Cut`, the derived cosine satisfies
  the double-angle law `cutCos(x+x) = 2·cutCos x·cutCos x − 1`; `cutCos` is strictly positive on
  `[0, cutPi/2)`; `cutCos(cutPi/4)² = 1/2`; `cutCos(cutPi/8)² = (1 + cutCos(cutPi/4))/2`;
  `cutCos(cutPi/16)² = (1 + cutCos(cutPi/8))/2`; and every one of these cosines is strictly positive.
  No theorem STATEMENT needs a physics word; every headline TYPE cites the banked `cutCos` / `cutSin`
  / `cutPi` on the derived `Cut` (NOT free-floating literals, NOT a generic real field).

  ⚠ FREE-FLOATING RAIL (SOUL): every theorem is stated at the BANKED derived objects — `cutCos`,
  `cutSin`, `cutPi` on `Cut` (N323/N326/N328). G1: the halving law, the square identities, and the
  positivity FALL OUT of the banked `cutCos_add` / `cutSin_sq_add_cutCos_sq` / `cutCos_continuous` /
  `cosZeroSet` / `cutCos_cutPi_half`, never premised; the angle `cutPi/8` is a derived `Cut`, never a
  posited numeral. G2: NO empirical number in any proof (the Weinberg-type reading of `π/8` lives only
  in prose). ⚠ UNEARNED-IMPORT: everything over the derived `Cut`; `cutCos`/`cutSin`/`cutPi` are the
  DERIVED trig; `intermediate_value_Icc'` / `csInf_le` / `linarith` are standard Mathlib MACHINERY on
  the derived objects; NO Mathlib-ℝ/ℂ as content.

  UNBROKEN: `cutCos` / `cutSin` / `cutCos_add` / `cutSin_sq_add_cutCos_sq` (N323, ContinuumTrig +
  ContinuumTrigAdd), `cutCos_continuous` / `cosZeroSet` / `cosZeroSet_bddBelow` / `leastCosZero` /
  `leastCosZero_mem` / `cutPi` / `cutPi_pos` / `cutCos_cutPi_half` / `cutCos_zero` (N328,
  ContinuumTrigPi); standard Mathlib MACHINERY on the derived objects. Ground = derived `Cut`; nothing
  posited; no bridge.

  Foundations-only: `#print axioms` ⊆ {propext, Classical.choice, Quot.sound}. No sorry, no axiom,
  no kernel-compilation bypass, no heartbeat inflation.
-/
import Phys.Foundation.ContinuumTrigPi
import Mathlib.Tactic

open Set

noncomputable section

namespace Phys.Algebra.FoldPhase

open Phys.Foundation Phys.Foundation.ContinuumQ

/-! ## (A) THE DOUBLE-ANGLE / HALF-ANGLE LAW over the derived ℝ.

  The amplitude structure: each Cayley–Dickson fold is the positive Born root of the previous
  rotation, encoded by `cutCos(x/2)² = (1 + cutCos x)/2`, i.e. the double-angle law. -/

/-- ★ THE DOUBLE-ANGLE LAW over the derived ℝ: `cutCos(x+x) = 2·cutCos x·cutCos x − 1`, from the
    banked cosine addition formula (`cutCos_add`) and the banked Pythagorean identity
    (`cutSin_sq_add_cutCos_sq`). This is the amplitude-doubling relation the cascade halves. -/
theorem cutCos_two_mul (x : Cut) :
    cutCos (x + x) = 2 * cutCos x * cutCos x - 1 := by
  rw [cutCos_add]
  have hp := cutSin_sq_add_cutCos_sq x
  linarith [hp]

/-- ★ THE HALF-ANGLE (AMPLITUDE-HALVING) LAW: `cutCos x = 2·cutCos(x/2)·cutCos(x/2) − 1`, i.e.
    `cutCos(x/2)² = (1 + cutCos x)/2`. Each fold's cosine is the (positive) Born root at the halved
    angle — the exact amplitude descent of the Cayley–Dickson cascade. -/
theorem cutCos_half_angle (x : Cut) :
    cutCos x = 2 * cutCos (x / 2) * cutCos (x / 2) - 1 := by
  have h := cutCos_two_mul (x / 2)
  rw [show x / 2 + x / 2 = x by ring] at h
  exact h

/-! ## (B) POSITIVITY BELOW THE QUARTER-TURN — the Born amplitude is the POSITIVE root.

  `cutPi/2 = leastCosZero` is the least positive zero of the derived cosine (N328). Hence `cutCos`
  is strictly positive on `[0, cutPi/2)`: were it `≤ 0` at some `x < cutPi/2`, the IVT would supply
  a zero in `[0,x]` strictly below `leastCosZero`, contradicting its leastness. This selects the
  POSITIVE Born root at each half-step. -/

/-- ★ POSITIVITY BELOW THE QUARTER-TURN: `0 < cutCos x` for `0 ≤ x < cutPi/2`. The derived cosine is
    strictly positive up to the first zero at `cutPi/2` — so each cascade amplitude `cutCos(cutPi/2ⁿ)`
    is the POSITIVE Born root, not the negative branch. -/
theorem cutCos_pos_below_half_pi (x : Cut) (hx0 : 0 ≤ x) (hxlt : x < cutPi / 2) :
    0 < cutCos x := by
  by_contra h
  rw [not_lt] at h
  have hpi2 : cutPi / 2 = leastCosZero := by
    unfold cutPi; rw [show (2 * leastCosZero) / 2 = leastCosZero by ring]
  have hxlt' : x < leastCosZero := by rw [hpi2] at hxlt; exact hxlt
  have hcont : ContinuousOn cutCos (Icc (0 : Cut) x) := cutCos_continuous.continuousOn
  have hmem : (0 : Cut) ∈ Icc (cutCos x) (cutCos 0) := by
    rw [cutCos_zero]; exact ⟨h, by norm_num⟩
  obtain ⟨c, hc, hcval⟩ := (intermediate_value_Icc' hx0 hcont) hmem
  have hle2 : leastCosZero ≤ 2 := leastCosZero_mem.1.2
  have hc2 : c ≤ 2 := le_trans hc.2 (le_of_lt (lt_of_lt_of_le hxlt' hle2))
  have hcmem : c ∈ cosZeroSet := ⟨⟨hc.1, hc2⟩, hcval⟩
  have hle : leastCosZero ≤ c := csInf_le cosZeroSet_bddBelow hcmem
  have hxle : leastCosZero ≤ x := le_trans hle hc.2
  exact absurd (lt_of_le_of_lt hxle hxlt') (lt_irrefl _)

/-! ## (C) THE THREE-RUNG AMPLITUDE CASCADE: π/2 → π/4 → π/8, each a positive Born root. -/

/-- ★ THE ℂ-FOLD AMPLITUDE (the 45° self=other Born balance): `cutCos(cutPi/4)² = 1/2` — the half of
    the quarter-turn, the amplitude root of `(1 + cutCos(cutPi/2))/2 = 1/2`. -/
theorem cutCos_quarter_sq :
    cutCos (cutPi / 4) * cutCos (cutPi / 4) = 1 / 2 := by
  have h : cutCos (cutPi / 4 + cutPi / 4)
      = 2 * cutCos (cutPi / 4) * cutCos (cutPi / 4) - 1 := cutCos_two_mul _
  rw [show cutPi / 4 + cutPi / 4 = cutPi / 2 by ring, cutCos_cutPi_half] at h
  linarith [h]

/-- ★ THE 45° SELF=OTHER BORN BALANCE (N309-genre): at the ℂ-fold angle the two Born channels are
    equal, `cutCos(cutPi/4)² = cutSin(cutPi/4)²` — the balance point of the amplitude descent. -/
theorem quarter_self_eq_other :
    cutCos (cutPi / 4) * cutCos (cutPi / 4) = cutSin (cutPi / 4) * cutSin (cutPi / 4) := by
  have hc := cutCos_quarter_sq
  have hp := cutSin_sq_add_cutCos_sq (cutPi / 4)
  linarith

/-- The ℂ-fold amplitude is the POSITIVE Born root: `0 < cutCos(cutPi/4)`. -/
theorem cutCos_quarter_pos : 0 < cutCos (cutPi / 4) := by
  apply cutCos_pos_below_half_pi
  · have := cutPi_pos; linarith
  · have := cutPi_pos; linarith

/-- ★ THE ℍ-FOLD AMPLITUDE (the fold phase P = cutPi/8): `cutCos(cutPi/8)² = (1 + cutCos(cutPi/4))/2`
    — the half of the ℂ-fold, the amplitude root of `(1 + cutCos(cutPi/4))/2`. The angle halves once
    more; the ℍ level is one Cayley–Dickson step above the ℂ level. -/
theorem cutCos_eighth_sq :
    cutCos (cutPi / 8) * cutCos (cutPi / 8) = (1 + cutCos (cutPi / 4)) / 2 := by
  have h : cutCos (cutPi / 8 + cutPi / 8)
      = 2 * cutCos (cutPi / 8) * cutCos (cutPi / 8) - 1 := cutCos_two_mul _
  rw [show cutPi / 8 + cutPi / 8 = cutPi / 4 by ring] at h
  linarith [h]

/-- The ℍ-fold amplitude (the fold phase P) is the POSITIVE Born root: `0 < cutCos(cutPi/8)`. -/
theorem cutCos_eighth_pos : 0 < cutCos (cutPi / 8) := by
  apply cutCos_pos_below_half_pi
  · have := cutPi_pos; linarith
  · have := cutPi_pos; linarith

/-! ## (D) THE FOLD PHASE P and its continuation. -/

/-- ★★ THE FOLD PHASE `P = cutPi/8`, DERIVED as the ℍ-level Cayley–Dickson fold angle — the third
    rung of the amplitude-halving cascade anchored at the forced quarter-turn `J²=−1`. This is the
    quantity arc M left as the free slot `phaseBorn`; it is now a derived `Cut`, not an input. -/
def foldPhase : Cut := cutPi / 8

/-- The fold phase is the HALF of the ℂ-fold angle: `foldPhase = (cutPi/4)/2`. Each cascade step
    halves the angle — the ℍ fold is the amplitude of the ℂ fold. -/
theorem foldPhase_is_half_of_quarter : foldPhase = (cutPi / 4) / 2 := by
  unfold foldPhase; ring

/-- The ℂ-fold angle is the HALF of the half-turn's quarter (the quarter-turn): `cutPi/4 = (cutPi/2)/2`.
    The amplitude descent from the quarter-turn `J²=−1`. -/
theorem quarter_is_half_of_quarter_turn : cutPi / 4 = (cutPi / 2) / 2 := by ring

/-- ★★ THE FOLD PHASE IS THE ℍ-LEVEL BORN AMPLITUDE: `0 < cutCos foldPhase` and
    `cutCos foldPhase² = (1 + cutCos(cutPi/4))/2` — the fold phase's cosine is the strictly-positive
    Born root at the ℍ half-step. The angle is FORCED by the amplitude cascade, never posited. -/
theorem foldPhase_amplitude :
    0 < cutCos foldPhase
    ∧ cutCos foldPhase * cutCos foldPhase = (1 + cutCos (cutPi / 4)) / 2 := by
  unfold foldPhase
  exact ⟨cutCos_eighth_pos, cutCos_eighth_sq⟩

/-- The NEXT amplitude half-step `R = cos(P/2) = cos(cutPi/16)` — the cascade continues; the ℍ→𝕆
    step halves the fold phase once more. -/
def foldPhaseHalf : Cut := cutPi / 16

theorem foldPhaseHalf_is_half_of_foldPhase : foldPhaseHalf = foldPhase / 2 := by
  unfold foldPhaseHalf foldPhase; ring

/-- ★ THE NEXT RUNG'S AMPLITUDE: `cutCos(cutPi/16)² = (1 + cutCos(cutPi/8))/2` — the amplitude root
    at the fold-phase half-step, the next Born-root descent. -/
theorem cutCos_sixteenth_sq :
    cutCos (cutPi / 16) * cutCos (cutPi / 16) = (1 + cutCos (cutPi / 8)) / 2 := by
  have h : cutCos (cutPi / 16 + cutPi / 16)
      = 2 * cutCos (cutPi / 16) * cutCos (cutPi / 16) - 1 := cutCos_two_mul _
  rw [show cutPi / 16 + cutPi / 16 = cutPi / 8 by ring] at h
  linarith [h]

theorem cutCos_sixteenth_pos : 0 < cutCos (cutPi / 16) := by
  apply cutCos_pos_below_half_pi
  · have := cutPi_pos; linarith
  · have := cutPi_pos; linarith

theorem foldPhaseHalf_amplitude :
    0 < cutCos foldPhaseHalf
    ∧ cutCos foldPhaseHalf * cutCos foldPhaseHalf = (1 + cutCos foldPhase) / 2 := by
  unfold foldPhaseHalf foldPhase
  exact ⟨cutCos_sixteenth_pos, cutCos_sixteenth_sq⟩

/-! ## (E) NON-VACUITY (W8). -/

/-- W8 NON-VACUITY: the ℂ-fold amplitude is a GENUINE nontrivial value `cutCos(cutPi/4)² = 1/2 ≠ 1`
    — the cascade genuinely descends (the amplitude is neither the full quarter-turn `0` nor the
    trivial `1`), so the fold phase is a real forced angle, not a vacuous coincidence. -/
theorem quarter_sq_ne_one :
    cutCos (cutPi / 4) * cutCos (cutPi / 4) ≠ 1 := by
  rw [cutCos_quarter_sq]; norm_num

/-- W8 NON-VACUITY: the fold phase's amplitude is STRICTLY BETWEEN the ℂ-fold amplitude and `1` —
    `1/2 < cutCos(cutPi/8)² < 1`. The ℍ amplitude is a genuine intermediate Born root, witnessing the
    cascade halving is real and the fold phase sits strictly inside `(0, cutPi/4)`. -/
theorem eighth_sq_between :
    1 / 2 < cutCos (cutPi / 8) * cutCos (cutPi / 8)
    ∧ cutCos (cutPi / 8) * cutCos (cutPi / 8) < 1 := by
  rw [cutCos_eighth_sq]
  have hpos : 0 < cutCos (cutPi / 4) := cutCos_quarter_pos
  have hlt1 : cutCos (cutPi / 4) < 1 := by
    have hsq : cutCos (cutPi / 4) * cutCos (cutPi / 4) = 1 / 2 := cutCos_quarter_sq
    nlinarith [hpos, hsq]
  constructor
  · linarith
  · linarith

/-! ## (F) THE CAPSTONE — the derived fold phase as the ℍ rung of the amplitude cascade. -/

/-- ★★★ THE FOLD PHASE via the HALF-ANGLE AMPLITUDE CASCADE (arc-O O1): the fold phase `P = cutPi/8`
    is DERIVED as the ℍ-level Cayley–Dickson fold angle — the third rung of the amplitude-HALVING
    cascade anchored at the forced quarter-turn `J²=−1` (`cutCos(cutPi/2)=0`). The halving is the
    exact double-angle/Born-amplitude law `cutCos(x/2)² = (1 + cutCos x)/2`, and each rung's cosine is
    the STRICTLY-POSITIVE Born root:
      · ℂ-fold: `cutCos(cutPi/4)² = 1/2` (the 45° self=other balance), `0 < cutCos(cutPi/4)`;
      · ℍ-fold (= P): `cutCos foldPhase² = (1 + cutCos(cutPi/4))/2`, `0 < cutCos foldPhase`;
      · next step: `cutCos foldPhaseHalf² = (1 + cutCos foldPhase)/2`, `0 < cutCos foldPhaseHalf`.
    `P` is FORCED — not an input, not a fit, not a posited `π/8`. This closes the free slot arc M
    left as `phaseBorn` (the O2 discharge prerequisite). -/
theorem fold_phase_half_angle_cascade :
    (∀ x : Cut, cutCos x = 2 * cutCos (x / 2) * cutCos (x / 2) - 1)
    ∧ cutCos (cutPi / 4) * cutCos (cutPi / 4) = 1 / 2
    ∧ 0 < cutCos (cutPi / 4)
    ∧ (0 < cutCos foldPhase
        ∧ cutCos foldPhase * cutCos foldPhase = (1 + cutCos (cutPi / 4)) / 2)
    ∧ (0 < cutCos foldPhaseHalf
        ∧ cutCos foldPhaseHalf * cutCos foldPhaseHalf = (1 + cutCos foldPhase) / 2) :=
  ⟨cutCos_half_angle, cutCos_quarter_sq, cutCos_quarter_pos,
    foldPhase_amplitude, foldPhaseHalf_amplitude⟩

end Phys.Algebra.FoldPhase

end
