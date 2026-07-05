/-
# N316 — α* = 1/42 LANDS: THE FINE-STRUCTURE-SCALE COUPLING
## (SEEDED GAUGE ROUTE A4 — docs/SEED_GAUGE_SCALE_COSMOLOGY.md, ARC A — the FIRST MARQUEE CONSTANT)

Over the derived `ℚ` and the terminal octonion rung `O ℚ = CD (H ℚ)`, this node NAMES the
fine-structure-scale coupling `α*` and reads off its landing:

      α* := (the banked per-active-channel Born weight, N315 `couplingWeight`)
      α* = 1/42                      (the un-dressed structural value at the octonion scale)
      1/α* = 42 = n(n−1)             (★ the inverse coupling IS the interaction-channel count).

α* is NOT a fresh symbol: it is DEFINITIONALLY the banked N315 `couplingWeight` — the normalized
per-channel Born self-overlap of the banked octonion calibration 3-form `assoc3` (N313), which is
`1/42` on every active channel (UNIFORM — a single coupling) and completes to `1` (COMPLETENESS).
The A3 ★ BRIDGE (N315 `channels_times_coupling`) already banked `(channel count)·α* = 1`; A4 is the
RECIPROCAL reading — the physicist's marquee `1/α = pure integer count` — landing

      1/α* = the banked interaction-channel count `imChannelCount (finrank ℚ ImO)` = 42 = n(n−1).

## WHY A4 IS A DISTINCT LANDING, NOT A RENAME (the sufficiency answer)
A3 (N315) banked the PRODUCT form `N·α = 1` and the completeness `Σ weight = 1`. A4 banks the
INVERSE form `1/α* = N = 42`, the canonical statement of a coupling constant ("the inverse coupling
is a pure integer") — the "α* = 1/42 lands" headline of Arc A. The inverse of the undressed coupling
IS the count of ordered imaginary-unit pairs of the octonions (the interaction channels of the
terminal division algebra), FORCED. This is the FIRST marquee dimensionless constant of the gauge arc.

## REMOVABLE PROSE (G2 — NEVER a proof step): the physicist reads `α` at the octonion/unification
scale as `1/42`. The measured low-energy fine-structure constant `≈ 1/137` is the DRESSED (running)
value; `1/42` is the un-dressed STRUCTURAL value at the octonion scale, before the running/threshold
dressing (downstream Arc B). No measured number enters any statement or proof in this file — the
comparison to the running value is this comment only, fully removable, exactly as `sin²θ_W = 3/8`
vs the measured `0.231`.

## STANDARD compliance
- WORDS-REMOVABLE (§2): delete "coupling / α / fine-structure / charge" — the statements stand as
  pure mathematics over `ℚ`: the banked normalized per-channel self-overlap value of the octonion
  calibration 3-form is `1/42`, and its reciprocal is the banked interaction-channel count `42`. No
  physics name is load-bearing.
- NOT FREE-FLOATING: `alphaStar := couplingWeight` (the BANKED N315 object, NOT a fresh `1/42`), so
  `alphaStar_eq` IS the banked `couplingWeight_eq`; the marquee `inverseAlphaStar_eq_channelCount`
  cites the banked channel count `imChannelCount (finrank ℚ ImO)` (N314). Tied to the banked
  self-overlap, never a floating symbol.
- G1 NO ASSERTED VALUE: `α* = 1/42` FALLS OUT of the banked `couplingWeight_eq`; `1/α* = 42` FALLS
  OUT of the banked `channels_O`/`channels_times_coupling`. Never premised.
- G2 NO EMPIRICAL NUMBER: no `1/137`, no `137` in any statement or proof; the running-value
  comparison is the docstring prose above, fully removable.
- UNEARNED-IMPORT: ground field `ℚ` (`1/42`, `42`, `1/49` all ℚ-EXACT); NO Mathlib-ℝ/ℂ as content;
  `Finset`/`Fin` (inside the banked `imChannelCount`) are MACHINERY on the derived objects (§3).
- Foundations-only `⊆ {propext, Classical.choice, Quot.sound}`: no posited axiom, no sorry, no
  compiled-kernel bypass, no heartbeat inflation, no bridge.

DERIVED from the trunk (`couplingWeight`/`couplingWeight_eq`/`channels_times_coupling` the banked
Born-isometry completeness N315, itself the banked per-channel self-overlap `assoc3InnerSum`/
`assoc3NormSq` N313 over the surviving composition law `octCross_lagrange`/`Nrm_mul_on_O`;
`imChannelCount`/`channels_O`/`finrank_ImO` the banked channel count N314/N22 — standard Mathlib
`Finset`/`Fin` MACHINERY on the DERIVED objects, STANDARD §3). NO posited coupling / `α` value as
content, NO Mathlib ℝ/ℂ as content, NO bridge.
-/
import Phys.Algebra.BornIsometryCompleteness
import Phys.Algebra.InteractionChannelTower
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## The fine-structure-scale coupling `α*` — the banked per-channel Born weight, named. -/

/-- THE FINE-STRUCTURE-SCALE COUPLING `α*`: DEFINITIONALLY the banked per-active-channel Born weight
    (N315 `couplingWeight` = `bornWeight 0 1`), the normalized per-channel self-overlap of the banked
    octonion calibration 3-form. NOT a fresh symbol — the physics label "coupling / α" is REMOVABLE. -/
def alphaStar : ℚ := couplingWeight

/-- ★ `α* = 1/42` — the un-dressed structural coupling at the octonion scale. DERIVED: it IS the
    banked `couplingWeight_eq` (the banked unit self-overlap over the banked total `42`), never
    asserted. -/
theorem alphaStar_eq : alphaStar = 1 / 42 := couplingWeight_eq

/-- THE A3 COMPLETENESS in the named coupling (banked `channels_times_coupling`): the banked
    interaction-channel count times `α*` equals `1`. -/
theorem alphaStar_reciprocal_completeness :
    (imChannelCount (Module.finrank ℚ ImO) : ℚ) * alphaStar = 1 := channels_times_coupling

/-! ## The marquee: `1/α* = channel count = 42 = n(n−1)`. -/

/-- ★★★ THE MARQUEE LANDING: the INVERSE fine-structure-scale coupling IS the banked
    interaction-channel count of the terminal division algebra, `imChannelCount (finrank ℚ ImO)`
    (N314). The physicist's `1/α = pure integer count`, here the count of ordered imaginary-unit
    pairs of the octonions. DERIVED from `α* = 1/42` (banked) and `channels_O = 42` (banked). -/
theorem inverseAlphaStar_eq_channelCount :
    1 / alphaStar = (imChannelCount (Module.finrank ℚ ImO) : ℚ) := by
  have h42 : (imChannelCount (Module.finrank ℚ ImO) : ℚ) = 42 := by rw [channels_O]; norm_num
  rw [alphaStar_eq, h42]; norm_num

/-- ★★ THE NUMERIC LANDING `1/α* = 42 = n(n−1)`: the inverse of the un-dressed structural coupling
    is `42`, the same `42` as the calibration-3-form norm (A1) and the channel count (A2). -/
theorem inverseAlphaStar_eq_42 : 1 / alphaStar = 42 := by
  rw [alphaStar_eq]; norm_num

/-- THE `α* = 1/42` READING bundled: `α* = 1/42`, the inverse is the banked channel count, and the
    channel count times `α*` is `1` — the FIRST marquee constant of Arc A, tying the banked coupling
    weight (N315) to the banked channel count (N314). -/
theorem fineStructureScale_reading :
    alphaStar = 1 / 42 ∧
    1 / alphaStar = (imChannelCount (Module.finrank ℚ ImO) : ℚ) ∧
    (imChannelCount (Module.finrank ℚ ImO) : ℚ) * alphaStar = 1 :=
  ⟨alphaStar_eq, inverseAlphaStar_eq_channelCount, alphaStar_reciprocal_completeness⟩

/-! ## W8 non-vacuity teeth. -/

/-- W8: `α*` is genuinely nonzero (it is `1/42`). -/
theorem alphaStar_ne_zero : alphaStar ≠ 0 := by rw [alphaStar_eq]; norm_num

/-- W8: `α*` is `1/42`, NOT the WRONG `1/49` (which would keep the degenerate diagonal, `n² = 49`
    channels). The `7` diagonal self-pairs genuinely carry weight `0`. -/
theorem alphaStar_ne_wrong : alphaStar ≠ 1 / 49 := by rw [alphaStar_eq]; norm_num

/-- W8: the inverse coupling `1/α* = 42` genuinely BITES — a WRONG `α* = 1/49` (diagonal not dropped)
    would give the WRONG `1/α* = 49`. Only the DERIVED `1/42` gives `1/α* = 42`. -/
theorem inverseAlphaStar_ne_wrong : 1 / alphaStar ≠ 49 := by rw [inverseAlphaStar_eq_42]; norm_num

/-- W8: the marquee reciprocal-count reading is genuinely `42`, not the naive `49` — the inverse
    coupling equals the `n(n−1) = 42` channel count, NOT the degenerate `n² = 49`. -/
theorem inverseAlphaStar_channelCount_ne_49 :
    1 / alphaStar = (imChannelCount (Module.finrank ℚ ImO) : ℚ) ∧
    (imChannelCount (Module.finrank ℚ ImO) : ℚ) ≠ 49 := by
  refine ⟨inverseAlphaStar_eq_channelCount, ?_⟩
  rw [channels_O]; norm_num

end

end Phys.Algebra
