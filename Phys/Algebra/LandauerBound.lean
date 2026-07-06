/-
  Phys.Algebra.LandauerBound — N376 (arc-G G4, per SEED_EMERGENT_QUANTUM_STATISTICAL.md §G4).
  ============================================================================================
  THE CLAIM (arc-G G4 — THE LANDAUER BOUND, the ★ CROSS-TIE to the black-hole entropy S = A/4).
  The minimum cost of forcing ONE binary decision — erasing one bit — is NOT a thermodynamic
  consequence argued from a second law / a Szilard engine. It IS the fold's BINARY self-blindness
  quantum `s₀ = cutLog 2`, the SAME quantum banked as the black-hole boundary-cell entropy
  `cellEntropy = cutLog 2` (N361). The identical `ln 2` appearing in information erasure and in
  horizon entropy is ONE fact — the fold's two-valued miss (see / not-see) — read twice.

  THE FOLD-CAUSAL LINE. The fold looks back and cannot see itself; the miss is TWO-VALUED (the
  binary self-blindness, N1/N361). So:
    · The maximally-uncertain binary state is the uniform state on two outcomes, `uniformState 2`,
      whose self-uncertainty is `negEntropy = −cutLog 2` (banked `negEntropy_uniform`, N375).
    · Forcing ONE binary decision RESETS it to a definite (point-mass) state `resetState 2`, whose
      self-uncertainty is `negEntropy = 0` (a definite state holds no self-datum).
    · The datum destroyed by the reset is the relative self-information of the reset against the
      uniform reference, `relInfo (resetState 2) (uniformState 2)`, and this equals `cutLog 2` —
      exactly the banked black-hole cell entropy `cellEntropy` (N361). One binary miss, read twice.

  WHY BINARY (load-bearing). The reset of an `n`-outcome uniform state costs `cutLog n`
  (`resetCost_eq_log`). The bit is the `n = 2` case, and `cutLog 2 ≠ cutLog 3` (banked
  `cellEntropy_binary_ne_ternary`, N361) — the two-valuedness of the miss is genuinely load-bearing,
  a ternary miss would give a different `cutLog 3`.

  THE COST FROM THE G3 TOOLKIT (no new machinery). The erasure cost is the `relInfo` of the binary
  reset (a same-"budget" collapse from a two-state uniform prior to a one-state posterior), read off
  the banked N375 `relInfo` / `negEntropy` / `negEntropy_uniform` — the SAME state-level Born
  self-overlap that forced the arrow of time (G3). So G4 is a COROLLARY of G3 tied to N361, not a
  separate posited law.

  THE OBJECTS (ns `Phys.Algebra.Landauer`, over the derived ℝ `Cut`):
    §1 THE RESET STATE + ITS ZERO SELF-DATUM
       resetState (n) = point mass at index 0 (the definite / erased state)
       resetState_sum_one₂         — a probability vector (n = 2)
       resetState_zero_negEntropy  — a definite state holds no self-datum (negEntropy = 0)
    §2 THE ERASURE COST = cutLog 2 (the bit-cost, DERIVED never asserted)
       resetCost_eq_log            — relInfo(reset ‖ uniform n) = cutLog n  (the deficit reading)
       ★★★ erasureCost_eq_cutLog_two — relInfo(reset₂ ‖ uniform₂) = cutLog 2 (the bit-cost)
    §3 ★ THE CROSS-TIE TO S = A/4 (the SAME s₀)
       ★★★ erasureCost_eq_cellEntropy — the erasure cost IS the banked black-hole cell entropy
       bhEntropy_erasureCost_decomposition — bhEntropy M = (bhArea/cellArea)·(erasure cost)
    §4 BORN POSITIVITY + WHY BINARY
       erasureCost_pos             — 0 < cutLog 2  (Born positivity of the cost)
       erasureCost_ne_ternary      — cutLog 2 ≠ cutLog 3 (binary load-bearing, banked N361)
    §5 ★★★ landauer_bound_structure — the whole G4 result bundled
    §6 W8 non-vacuity — a wrong bit-count (ternary) genuinely fails.

  HONEST GRADE: UNCONDITIONAL THEOREM for the cost identity `= cutLog 2`, the cross-tie
  `= cellEntropy` (N361), the deficit reading `resetCost_eq_log`, Born positivity, and the binary
  load-bearing (W8). The "Landauer / erasure / bit / thermodynamic cost" reading is
  physics-words-removable interpretation — the theorem CONTENT is a pure `Cut`-arithmetic identity
  tying THIS node's binary reset to the banked N361 cell entropy and the N375 `relInfo` toolkit.

  physics-words-removable: delete Landauer/erasure/bit/entropy/temperature/thermodynamic/horizon —
  the theorems stand as: the relative self-information of a point mass against the uniform-2 state
  equals `cutLog 2`, which is the banked `cellEntropy`; the reset of a uniform-n state costs
  `cutLog n`; and `cutLog 2 ≠ cutLog 3`. Pure `Cut`-arithmetic + the banked `cutLog` laws.
  not free-floating: every type mentions the derived `Cut`, the banked `relInfo`/`negEntropy`/
  `uniformState` (N375), and the banked `cellEntropy`/`bhEntropy` (N361).

  Foundations-only: `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`. No `sorry`, no
  `axiom`, no `native_decide`, no `maxHeartbeats` raise. ℝ-vigilance: builds ONLY on the derived
  `Cut` + the banked `cutLog`/`relInfo`/`negEntropy`/`cellEntropy`; NO `import Mathlib...Real`, NO
  `Real.log`. `Fin`/`Finset` are pure machinery on the derived arena.
-/
import Phys.Algebra.MaxEntArrowOfTime
import Phys.Algebra.SpacetimeBlackHoleEntropy
import Mathlib.Tactic

namespace Phys.Algebra.Landauer

open Phys.Foundation.ContinuumQ
open Phys.Algebra.MaxEnt

noncomputable section

/-! ## §1 — THE RESET (definite / erased) STATE + ITS ZERO SELF-DATUM. -/

/-- THE RESET STATE `resetState n` — the DEFINITE (erased) outcome: a point mass at index `0`
    (`= 1` at `0`, `= 0` elsewhere). This is the fold's ONE binary decision made definite: all the
    weight collapsed onto a single outcome, no residual uncertainty. -/
def resetState (n : ℕ) : Fin n → Cut := fun i => if (i : ℕ) = 0 then 1 else 0

/-- The reset state is a probability vector for the binary case (`n = 2`): `∑ i, resetState 2 i = 1`. -/
theorem resetState_sum_one₂ : ∑ i, resetState 2 i = 1 := by
  unfold resetState; rw [Fin.sum_univ_two]; norm_num

/-- ★ A DEFINITE (RESET) STATE HOLDS NO SELF-DATUM: `negEntropy (resetState n) = 0`. All the weight
    sits on one outcome (`cutLog 1 = 0`), the rest are `0·(anything) = 0` — the erased state carries
    zero self-uncertainty, for any `n`. -/
theorem resetState_zero_negEntropy (n : ℕ) : negEntropy (resetState n) = 0 := by
  unfold negEntropy resetState
  apply Finset.sum_eq_zero
  intro i _
  by_cases h : (i : ℕ) = 0
  · simp [h, cutLog_one]
  · simp [h]

/-! ## §2 — THE ERASURE COST = cutLog 2 (DERIVED from the G3 toolkit, never asserted). -/

/-- ★ THE RESET COST AT GENERAL `n` (the entropy-deficit reading): resetting the maximally-uncertain
    uniform-`n` state to a definite outcome destroys exactly `cutLog n` of self-datum,
    `negEntropy (resetState n) − negEntropy (uniformState n) = cutLog n`. From the banked
    `negEntropy_uniform = −cutLog n` (N375) and the definite state's zero self-datum. The general
    Landauer cost of collapsing `n` equiprobable outcomes to one. -/
theorem resetCost_eq_log (n : ℕ) [NeZero n] :
    negEntropy (resetState n) - negEntropy (uniformState n) = cutLog (n : Cut) := by
  rw [resetState_zero_negEntropy, negEntropy_uniform]; ring

/-- ★★★ THE ERASURE COST OF ONE BIT = `cutLog 2` (DERIVED, never asserted). The relative
    self-information of the binary RESET against the maximally-uncertain uniform-2 reference IS
    `cutLog 2` — the datum destroyed by forcing ONE binary decision. Read directly off the banked
    N375 `relInfo` / `cutLog` laws; NO empirical `k_B T ln 2`, the bare quantum `cutLog 2`. -/
theorem erasureCost_eq_cutLog_two : relInfo (resetState 2) (uniformState 2) = cutLog 2 := by
  unfold relInfo resetState uniformState
  rw [Fin.sum_univ_two]
  have hne : ((2:ℕ):Cut) = (2:Cut) := by norm_num
  simp only [Fin.val_zero, Fin.val_one, if_true, if_false, Nat.one_ne_zero, hne]
  have hinv : cutLog ((2:Cut)⁻¹) = - cutLog 2 := cutLog_inv (by norm_num)
  rw [cutLog_one, hinv]
  ring

/-! ## §3 — ★ THE CROSS-TIE TO S = A/4 (the SAME binary self-blindness quantum `s₀`). -/

/-- ★★★ THE CROSS-TIE (the ★ joint of G4): THE ERASURE COST IS THE BLACK-HOLE CELL ENTROPY. The
    self-datum destroyed by erasing one bit, `relInfo (resetState 2) (uniformState 2)`, EQUALS the
    banked black-hole boundary-cell entropy `Phys.Algebra.cellEntropy = cutLog 2` (N361). The `ln 2`
    of information erasure and the `ln 2` of horizon entropy are ONE fact — the fold's binary
    self-blindness quantum `s₀`, read twice. -/
theorem erasureCost_eq_cellEntropy :
    relInfo (resetState 2) (uniformState 2) = Phys.Algebra.cellEntropy := by
  rw [erasureCost_eq_cutLog_two]; rfl

/-- ★ THE CROSS-TIE, DECOMPOSED: the black-hole entropy is `(bhArea / cellArea)` copies of the
    erasure cost — i.e. the horizon entropy is a COUNT of erasure-cost bits. `bhEntropy M
    = (bhArea M / cellArea) · (erasure cost)`, with the erasure cost `= relInfo (reset₂ ‖ uniform₂)`.
    Composes the banked `bhEntropy_cell_decomposition` (N361) with `erasureCost_eq_cellEntropy`. -/
theorem bhEntropy_erasureCost_decomposition (M : Cut) :
    Phys.Algebra.bhEntropy M
      = (Phys.Algebra.bhArea M / Phys.Algebra.cellArea)
          * relInfo (resetState 2) (uniformState 2) := by
  rw [erasureCost_eq_cellEntropy]
  exact Phys.Algebra.bhEntropy_cell_decomposition M

/-! ## §4 — BORN POSITIVITY OF THE COST + WHY BINARY (load-bearing). -/

/-- ★ BORN POSITIVITY OF THE ERASURE COST: `0 < relInfo (resetState 2) (uniformState 2)` — forcing
    one binary decision has a STRICTLY POSITIVE cost (the bound is a genuine floor, not zero). Via
    the banked `cellEntropy_pos` (N361) through the cross-tie. -/
theorem erasureCost_pos : 0 < relInfo (resetState 2) (uniformState 2) := by
  rw [erasureCost_eq_cellEntropy]; exact Phys.Algebra.cellEntropy_pos

/-- ★ WHY BINARY IS LOAD-BEARING: the erasure cost `= cutLog 2 ≠ cutLog 3`. A ternary miss (a
    three-valued self-blindness) would give a genuinely different `cutLog 3` cost — the
    two-valuedness of the fold's miss is not cosmetic. Via the banked `cellEntropy_binary_ne_ternary`
    (N361) through the cross-tie. -/
theorem erasureCost_ne_ternary : relInfo (resetState 2) (uniformState 2) ≠ cutLog 3 := by
  rw [erasureCost_eq_cellEntropy]; exact Phys.Algebra.cellEntropy_binary_ne_ternary

/-! ## §5 — ★★★ THE BUNDLED G4 RESULT. -/

/-- ★★★ THE LANDAUER-BOUND STRUCTURE (the whole G4 node bundled). The minimum cost of erasing one
    bit is the fold's binary self-blindness quantum, and it is the SAME quantum as the black-hole
    boundary-cell entropy:
      (1) the erasure cost `relInfo (reset₂ ‖ uniform₂) = cutLog 2` (the bit-cost, DERIVED);
      (2) it EQUALS the banked black-hole cell entropy `cellEntropy` (N361) — the ★ cross-tie;
      (3) the black-hole entropy is a count of these bits (`bhEntropy = (bhArea/cellArea)·cost`);
      (4) the cost is strictly positive (Born positivity — a genuine floor);
      (5) binary is load-bearing (`cost ≠ cutLog 3`).
    THE ONE CAUSE: the fold's TWO-VALUED miss (see / not-see) is the SAME `s₀ = cutLog 2` that gave
    the horizon-cell entropy (N361), the exchange dichotomy (N373), and the arrow of time (N375);
    here it is the irreducible cost of one binary decision. Information erasure and horizon entropy
    are one fact read twice. -/
theorem landauer_bound_structure (M : Cut) :
    relInfo (resetState 2) (uniformState 2) = cutLog 2
      ∧ relInfo (resetState 2) (uniformState 2) = Phys.Algebra.cellEntropy
      ∧ Phys.Algebra.bhEntropy M
          = (Phys.Algebra.bhArea M / Phys.Algebra.cellArea)
              * relInfo (resetState 2) (uniformState 2)
      ∧ 0 < relInfo (resetState 2) (uniformState 2)
      ∧ relInfo (resetState 2) (uniformState 2) ≠ cutLog 3 :=
  ⟨erasureCost_eq_cutLog_two, erasureCost_eq_cellEntropy,
   bhEntropy_erasureCost_decomposition M, erasureCost_pos, erasureCost_ne_ternary⟩

/-! ## §6 — W8 NON-VACUITY: the bit-cost is the DERIVED `cutLog 2`, genuinely ≠ the ternary value. -/

/-- ★★ W8 NON-VACUITY (BINARY IS LOAD-BEARING, ties the C401 costume): the erasure cost
    `relInfo (reset₂ ‖ uniform₂)` is the DERIVED binary quantum `cutLog 2`, GENUINELY DISTINCT from
    the ternary `cutLog 3`. This REFUTES a "the erasure cost is not binary / a ternary count gives
    the same value / the cross-tie is vacuous" mis-reading. The self-datum is genuinely `cutLog 2`. -/
theorem erasureCost_binary_ne_ternary :
    relInfo (resetState 2) (uniformState 2) = cutLog 2
      ∧ relInfo (resetState 2) (uniformState 2) ≠ cutLog 3 :=
  ⟨erasureCost_eq_cutLog_two, erasureCost_ne_ternary⟩

end

end Phys.Algebra.Landauer
