/-
# N314 — THE INTERACTION-CHANNEL TOWER `ℂ:0, ℍ:6, 𝕆:42` AS `n(n−1)`
## (SEEDED GAUGE ROUTE A2 — docs/SEED_GAUGE_SCALE_COSMOLOGY.md, ARC A)

Over the derived `ℚ` and the cascade rungs `Dbl ℚ` (ℂ, rung 1), `H ℚ = CD (Dbl ℚ)` (ℍ, rung 2),
`O ℚ = CD (H ℚ)` (𝕆, rung 3), the number of INDEPENDENT INTERACTION CHANNELS of a rung is the count
of ORDERED OFF-DIAGONAL PAIRS of its imaginary units — the banked `Finset.offDiag` cardinality of
the imaginary index set. With the imaginary dimension of each rung `n = finrank(rung) − 1` (banked
`finrank_dbl_eq_two`/`finrank_H_eq_four`/`finrank_O_eq_eight`; equivalently the banked imaginary
submodule finranks `finrank_ImH_eq_three`, `finrank_ImO`), this count is

      imChannelCount n = |offDiag(Fin n)| = n·(n−1),   the tower  ℂ:0, ℍ:6, 𝕆:42   (n = 1, 3, 7).

## THE OCTONION RUNG IS THE BANKED CALIBRATION-3-FORM NORM (W2 — reuse N313, do not re-derive)

The `𝕆` rung `n(n−1) = 42` is the SAME `42` as A1: the squared norm of the banked octonion
calibration 3-form `φ = assoc3` summed over the orthonormal imaginary frame `imBasis : Fin 7 → O ℚ`
(N313 `assoc3NormSq_eq_42`). N313 proved `42` is the off-diagonal ordered-pair count of the seven
imaginary units — each of the `7·6 = 42` off-diagonal pairs a UNIT-length cross product (the Born
composition law `octCross_lagrange`, from the surviving `Nrm_mul_on_O`), the `7` diagonal pairs
vanishing (`octCross eⱼ eⱼ = 0`). Here `channels_O_eq_assoc3NormSq` ties the channel count directly
to that banked structure norm: the interaction-channel count of the terminal algebra IS `‖φ‖²`.

## THE READING: `n(n−1)` — one counting law across the cascade

The channel count of each rung is the same off-diagonal ordered-pair count `n(n−1)` of its imaginary
units. The cascade's imaginary dimensions `1, 3, 7` (each `= finrank(rung) − 1`) give the tower
`0, 6, 42`. The single imaginary unit of `ℂ` admits no ordered pairs (`0`); the `3` imaginary
quaternion units give `3·2 = 6`; the `7` imaginary octonion units give `7·6 = 42`. ONE CAUSE (via
N313): the Born composition law surviving precisely to `O ℚ` forces every off-diagonal octonion
cross product to unit length, so the `𝕆` rung realizes its full `n(n−1) = 42`.

## STANDARD compliance
- WORDS-REMOVABLE (§2): delete "interaction / channel / gauge / coupling" — the statements stand as
  pure mathematics over `ℚ`: the off-diagonal ordered-pair count `|offDiag(Fin n)| = n(n−1)` of the
  imaginary index sets of the banked cascade rungs `Dbl ℚ / H ℚ / O ℚ`, equal to `0, 6, 42`, the
  `𝕆` value being the banked `assoc3NormSq`. No physics name is load-bearing.
- NOT FREE-FLOATING: the tower TYPES cite the CONCRETE banked cascade finranks
  (`finrank ℚ (Dbl ℚ)`, `finrank ℚ ImH`, `finrank ℚ ImO`) and the banked N313 `assoc3NormSq` — NOT
  a generic `n(n−1)` for an abstract `n`-dim algebra. The `imChannelCount` def is standard `Finset`
  MACHINERY; the tower is the CONCRETE banked ℂ/ℍ/𝕆 imaginary pair counts.
- G1 NO ASSERTED VALUE: `0, 6, 42` FALL OUT of the banked finranks and `Finset.offDiag_card`, never
  premised. The `42` is reused from N313 (`assoc3NormSq_eq_42`), never re-asserted.
- UNEARNED-IMPORT: ground field `ℚ` (the banked cascade rungs); NO Mathlib-ℝ/ℂ as content;
  `Finset`/`Fin` are MACHINERY on the derived objects (STANDARD §3).
- Foundations-only `⊆ {propext, Classical.choice, Quot.sound}`: no posited axiom, no sorry, no
  compiled-kernel bypass, no heartbeat inflation, no bridge.

DERIVED from the trunk (`assoc3NormSq`/`assoc3NormSq_eq_42` N313; `finrank_ImO` N22;
`finrank_ImH_eq_three` N-DerivationRep7FullBranching; `finrank_dbl_eq_two`/`finrank_H_eq_four`/
`finrank_O_eq_eight` N-DerivationFinrank — standard Mathlib `Finset.offDiag`/`Fin` MACHINERY on the
DERIVED objects, STANDARD §3). NO posited channel structure / `n(n−1)` formula as content, NO
Mathlib ℝ/ℂ as content, NO bridge.
-/
import Phys.Algebra.OctonionStructure3FormNorm
import Phys.Algebra.DerivationRep7FullBranching
import Phys.Algebra.DerivationFinrank
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## The channel count: off-diagonal ordered pairs of the imaginary units. -/

/-- THE INTERACTION-CHANNEL COUNT of a rung with `n` imaginary units: the number of ORDERED
    OFF-DIAGONAL PAIRS of those units, `|offDiag(Fin n)|`. Standard `Finset` MACHINERY on the
    imaginary index set. -/
def imChannelCount (n : ℕ) : ℕ := (Finset.univ : Finset (Fin n)).offDiag.card

/-- THE COUNTING LAW: `imChannelCount n = n·(n−1)` — the off-diagonal ordered-pair count of `n`
    units. Via the banked `Finset.offDiag_card` (`|offDiag s| = |s|² − |s|`) and
    `Fintype.card_fin`. NEVER asserted: it falls out of the `offDiag` cardinality. -/
theorem imChannelCount_eq_n_times_n_sub_one (n : ℕ) : imChannelCount n = n * (n - 1) := by
  unfold imChannelCount
  rw [Finset.offDiag_card]
  simp [Finset.card_univ, Fintype.card_fin, Nat.mul_sub_one]

/-! ## The imaginary dimension of each cascade rung `= finrank(rung) − 1`. -/

/-- The imaginary dimension of `ℂ = Dbl ℚ` is `1` (`finrank ℚ (Dbl ℚ) = 2`, banked). The sole
    imaginary unit. -/
theorem imDim_C : Module.finrank ℚ (Dbl ℚ) - 1 = 1 := by rw [finrank_dbl_eq_two]

/-- The imaginary dimension of `ℍ = H ℚ` is `3` (`finrank ℚ (H ℚ) = 4`, banked); equals the banked
    imaginary-submodule finrank `finrank ℚ ImH = 3`. -/
theorem imDim_H : Module.finrank ℚ (H ℚ) - 1 = 3 := by rw [finrank_H_eq_four]

/-- The imaginary dimension of `𝕆 = O ℚ` is `7` (`finrank ℚ (O ℚ) = 8`, banked); equals the banked
    imaginary-submodule finrank `finrank ℚ ImO = 7`. -/
theorem imDim_O : Module.finrank ℚ (O ℚ) - 1 = 7 := by rw [finrank_O_eq_eight]

/-- The rung imaginary dimension `finrank(rung) − 1` agrees with the banked imaginary SUBMODULE
    finrank for `ℍ` (`finrank ℚ ImH = 3`). -/
theorem imDim_H_eq_ImH : Module.finrank ℚ (H ℚ) - 1 = Module.finrank ℚ ImH := by
  rw [finrank_H_eq_four, finrank_ImH_eq_three]

/-- The rung imaginary dimension `finrank(rung) − 1` agrees with the banked imaginary SUBMODULE
    finrank for `𝕆` (`finrank ℚ ImO = 7`). -/
theorem imDim_O_eq_ImO : Module.finrank ℚ (O ℚ) - 1 = Module.finrank ℚ ImO := by
  rw [finrank_O_eq_eight, finrank_ImO]

/-! ## The three rungs of the tower — each TYPE citing the banked cascade finranks. -/

/-- ★ THE `ℂ` RUNG: `0`. The single imaginary unit of `ℂ = Dbl ℚ`
    (`finrank ℚ (Dbl ℚ) − 1 = 1`) admits NO ordered off-diagonal pairs: `imChannelCount 1 = 0`. -/
theorem channels_C : imChannelCount (Module.finrank ℚ (Dbl ℚ) - 1) = 0 := by
  rw [finrank_dbl_eq_two]; decide

/-- ★ THE `ℍ` RUNG: `6`. The three imaginary quaternion units (banked `finrank ℚ ImH = 3`) give
    `3·2 = 6` ordered off-diagonal pairs: `imChannelCount 3 = 6`. -/
theorem channels_H : imChannelCount (Module.finrank ℚ ImH) = 6 := by
  rw [finrank_ImH_eq_three]; decide

/-- ★★ THE `𝕆` RUNG: `42`. The seven imaginary octonion units (banked `finrank ℚ ImO = 7`) give
    `7·6 = 42` ordered off-diagonal pairs: `imChannelCount 7 = 42`. The terminal-algebra channel
    count — the SAME `42` as the banked calibration-3-form norm (`channels_O_eq_assoc3NormSq`). -/
theorem channels_O : imChannelCount (Module.finrank ℚ ImO) = 42 := by
  rw [finrank_ImO]; decide

/-! ## The octonion rung IS the banked N313 calibration-3-form norm (W2 reuse). -/

/-- ★★★ THE TERMINAL-RUNG TIE (W2 — reuse N313, not re-derive): the `𝕆` interaction-channel count
    equals the squared norm of the banked octonion calibration 3-form `φ = assoc3`,
    `assoc3NormSq = 42` (N313). The channel/pair count of the terminal algebra IS `‖φ‖²` — the same
    `42` read two ways (off-diagonal unit cross products ↔ structure-constant norm). -/
theorem channels_O_eq_assoc3NormSq :
    ((imChannelCount (Module.finrank ℚ ImO) : ℕ) : ℚ) = assoc3NormSq := by
  rw [finrank_ImO, assoc3NormSq_eq_42]; decide

/-! ## The unifying `n(n−1)` reading across the cascade. -/

/-- THE TOWER AS ONE COUNTING LAW: at the cascade's imaginary dimensions `n = 1, 3, 7`
    (`= finrank(rung) − 1`, banked), the interaction-channel count is `n(n−1)`, giving the tower
    `ℂ:0, ℍ:6, 𝕆:42`. All three are the SAME off-diagonal ordered-pair count `n(n−1)`; only `n`
    changes along the cascade. -/
theorem channelTower_n_times_n_sub_one :
    imChannelCount (Module.finrank ℚ (Dbl ℚ) - 1) = 0 ∧
    imChannelCount (Module.finrank ℚ ImH) = 6 ∧
    imChannelCount (Module.finrank ℚ ImO) = 42 ∧
    (∀ n : ℕ, imChannelCount n = n * (n - 1)) :=
  ⟨channels_C, channels_H, channels_O, imChannelCount_eq_n_times_n_sub_one⟩

/-! ## W8 non-vacuity teeth. -/

/-- W8: the three rungs are GENUINELY DISTINCT — `0 ≠ 6`, `6 ≠ 42`, `0 ≠ 42`. The tower is not a
    constant. -/
theorem channelTower_distinct :
    imChannelCount (Module.finrank ℚ (Dbl ℚ) - 1) ≠ imChannelCount (Module.finrank ℚ ImH) ∧
    imChannelCount (Module.finrank ℚ ImH) ≠ imChannelCount (Module.finrank ℚ ImO) ∧
    imChannelCount (Module.finrank ℚ (Dbl ℚ) - 1) ≠ imChannelCount (Module.finrank ℚ ImO) := by
  rw [channels_C, channels_H, channels_O]
  refine ⟨?_, ?_, ?_⟩ <;> decide

/-- W8: the `𝕆` rung is `n(n−1) = 42`, NOT the naive `n² = 49` (which would keep the degenerate
    diagonal). The `7` diagonal self-pairs genuinely drop. -/
theorem channels_O_ne_49 : imChannelCount (Module.finrank ℚ ImO) ≠ 49 := by
  rw [finrank_ImO]; decide

/-- W8: the `ℍ` rung is `n(n−1) = 6`, NOT the naive `n² = 9`. The `3` diagonal self-pairs drop. -/
theorem channels_H_ne_9 : imChannelCount (Module.finrank ℚ ImH) ≠ 9 := by
  rw [finrank_ImH_eq_three]; decide

/-- W8: the `ℂ` rung is genuinely `0` — a single imaginary unit has NO ordered pairs (vs the naive
    `n² = 1`). The base of the tower is empty of channels. -/
theorem channels_C_eq_zero_not_one :
    imChannelCount (Module.finrank ℚ (Dbl ℚ) - 1) = 0 ∧
    imChannelCount (Module.finrank ℚ (Dbl ℚ) - 1) ≠ 1 := by
  rw [channels_C]; exact ⟨rfl, by decide⟩

end

end Phys.Algebra
