/-
# N418 — SEEDED COMPLETION-SWEEP O3: THE TWO-SECTOR CKM COMPLETION at the DERIVED (non-maximal) fold phase

Owner-authorized completion-sweep seed (docs/SEED_COMPLETION_SWEEP.md), target **O3** — the directed
successor of N417 (O2, the arc-M discharge). Arc O pays sequencing debts now that the machinery exists.
O1 (N416) DERIVED the fold phase `P = foldPhase = cutPi/8` via the half-angle amplitude cascade; O2
(N417) discharged arc M with it. This node applies the SAME derived fold phase to the CKM sector,
CORRECTING the leading-order Jarlskog invariant N344 banked at the MAXIMAL CP phase.

★ WHAT THIS NODE DOES. N344 (seed D6) banked `J² = g₁₂·g₂₃·h₁₃·(assoc3)²` and, lacking the derived
fold phase, set `(assoc3)² = 1` as "the maximal CP factor." This node supplies the derived phase and
corrects the CP factor to its FORCED non-maximal value, landing the corrected `J²` and `J` as actual
numbers of the derived ℝ `Cut`.

★ THE THEORY-NATIVE HEART — THE ASSOCIATOR IS THE CP *SWITCH*, THE FOLD PHASE IS THE CP *MAGNITUDE*.
In the Standard Model the CP phase `δ` is a FREE hand-inserted number and `J ∝ sinδ` is fit to data.
The theory dissolves the free `δ` into TWO derived pieces of DISTINCT roles:
  * its PRESENCE / SIGN is the octonion associator (`assoc3`, N310) — a Boolean SWITCH, `0` on the
    associative ℂ-line (CP conserved), a UNIT on the octonionic Fano line (CP present). This is banked
    (N344 `cp_switch`) and is what makes CP non-accidental.
  * its MAGNITUDE is the CP-odd (imaginary) Born-weight of the DERIVED phase entering the two-sector
    diagonal `D = diag(1, e^{i2P}, e^{iP})`, `P = foldPhase`. N344 mis-identified the SWITCH (`|assoc3|=1`)
    as the magnitude; the magnitude is `cutSin(2P)²`, the imaginary Born-weight of the derived phase.
The Cabibbo-block relative phase is `2P = 2·(cutPi/8) = cutPi/4`, and the banked cascade amplitude
identity gives `cutCos(cutPi/4)² = 1/2` (N416 `cutCos_quarter_sq`), so by the Born-circle Pythagorean
identity `cutSin(cutPi/4)² = 1/2` as well — the **SELF=OTHER BALANCE** (N416 `quarter_self_eq_other`):
the derived phase sits EXACTLY halfway between CP-conserving (real, `θ=0`, imaginary weight `0`) and
maximal-CP (pure-imaginary `i = e^{iπ/2}`, imaginary weight `1`). So the DERIVED CP factor is `1/2`,
NOT `1`. The corrected Jarlskog squared is the FORCED downward correction

      `J²_corrected = g₁₂·g₂₃·h₁₃·cutSin(2·foldPhase)² = (1/2)·J²_(N344)`

a downward correction toward the measured value, its magnitude FORCED by the fold phase with ZERO free
CP parameters. This is the O1→O3 fold-phase joint (SEED §2 J-O3) applied: the phase the field posits as
free is here the third rung of the amplitude-halving cascade, and its CP-odd weight is the self=other
balance `1/2`.

★ THE FORCED NUMBERS (over `Cut`, from the banked N344 `jarlskogSq` and the derived fold phase):
  * `cpFactorDerived = cutSin(2·foldPhase)² = 1/2` (the CP-odd Born-weight of the derived phase; N416
    `cutCos_quarter_sq` + the Born-circle Pythagorean identity — the self=other balance).
  * `J²_corrected = (1/2)·jarlskogSq ∈ [36/1e9, 37/1e9]` (≈ 3.65e-8, half the N344 maximal value).
  * `J_corrected = cutSqrt(J²_corrected) ∈ [189/1e6, 193/1e6]` (≈ 1.91e-4), STRICTLY BELOW the N344
    maximal `J ∈ [268/1e6, 273/1e6]` (`jarlskogCorrected_lt`) — the derived non-maximal phase moves the
    CP invariant DOWN toward the measured value, as forced.

★ THE STRUCTURAL TWO-SECTOR OVERLAP (banked, re-exported). The mixing matrix is the overlap
`V = OᵤᵀD O_d` of the two per-sector rational Born-eigenvector frames; the banked N312 `mixV` is unitary
up to the frame-norm scale (`mixV_unitary_up_to_scale`), obeys the Brahmagupta–Fibonacci normalization
(`brahmagupta_fibonacci`, `cabibbo_mixing_orthonormal`), and the corner-zero `M₁₃ = 0` FALLS OUT of the
cascade adjacency (`cascade_open_ne_closed`, N311: the open cascade coupling path ≠ the closed coherence
cycle, differing exactly at the corner because the cascade TERMINATES at 𝕆). The derived phase `D` is a
genuine element of the derived ℂ `Dbl Cut` with unit modulus (`phaseEl_normSq`, the Born self-overlap
circle) — the CP phase is the fold's own complex structure, not a free knob.

⚠ HONEST GRADE (seed §O3 + N344/T8 leading-order caveat). What is FORCED and theorem-exact: the CP
factor `1/2` (the derived phase's imaginary Born-weight, the self=other balance) and hence the DIRECTION
and MAGNITUDE of the correction to N344 (downward by a factor `1/2`). The FULL angle-dependent effective
two-sector CP phase of `V = OᵤᵀD O_d` is frame-angle-dependent (it mixes with the real frame rotation
angles), so a clean numeric two-sector `J` from a full 3×3 diagonalization is NOT a forced number and is
NOT claimed here — that would be chasing a non-forced quantity. The FORCED, frame-angle-independent
deliverable is the CP-FACTOR correction. Higher-order angle-dependence is the honestly-unclaimed
leading-order remainder (matching N344's own leading-order flag). NO FIT: the residual against the
measured Jarlskog is NOT chased (the seed's explicit STOP); comparison to data is removable prose.

PHYSICS-WORDS-REMOVABLE (STANDARD §2, seed G4). Delete "CP" / "Jarlskog" / "phase" / "Cabibbo" /
"mixing" / "generation": over the derived `Cut`, `phaseEl θ = ⟨cutCos θ, cutSin θ⟩ : Dbl Cut` with
`(phaseEl θ).re² + (phaseEl θ).im² = 1`; `cpFactorDerived = (phaseEl (2·foldPhase)).im² = 1/2` (from the
banked `cutCos_quarter_sq` and the Pythagorean identity); `jarlskogSqCorrected = g₁₂·g₂₃·h₁₃·cpFactorDerived
= (1/2)·jarlskogSq < jarlskogSq`, with brackets; `jarlskogCorrected = cutSqrt jarlskogSqCorrected <
jarlskog`. Pure derived-ℝ / derived-ℂ arithmetic on the banked objects; no name is load-bearing.

FREE-FLOATING check (SOUL rail). Every theorem's TYPE mentions the banked objects: `cutCos`/`cutSin`/
`cutPi` (N323/N328), `foldPhase`/`cutCos_quarter_sq`/`quarter_self_eq_other` (N416), `g12`/`g23`/`h13`/
`jarlskogSq`/`jarlskog`/`cutSqrt` (N344/N57), `Dbl Cut` (N2 `ComplexUnit`), the banked `mixV`/
`brahmagupta_fibonacci`/`cabibbo_mixing_orthonormal`/`cascade_open_ne_closed` (N311/N312). `cpFactorDerived`
is literally about the derived fold-phase Born-weight; `jarlskogSqCorrected` is literally the banked N344
product scaled by the derived factor. Grounded on the tower, not a generic phase statement.

Foundations-only (seed G5): no posited axiom, no proof-hole, no kernel-trust bypass, no heartbeat inflation,
no bridge; no empirical number; the ground is the BANKED derived ℝ `Cut` + the derived ℂ `Dbl Cut`, the
banked N344 Jarlskog factors, the banked N416 fold-phase amplitude, and the banked N57 `cutSqrt` — NO
Mathlib `Real`/`Complex` as content.
-/
import Phys.Algebra.CascadeFoldPhase
import Phys.Algebra.GenerationJarlskogInvariantNumeric
import Phys.Cascade.ComplexUnit
import Mathlib.Tactic

namespace Phys.Algebra
namespace CKMTwoSectorPhase

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra.GenerationMixingAngles
open Phys.Algebra.GenerationJarlskog
open Matrix

noncomputable section

/-! ## §1 — THE DERIVED-ℂ PHASE ELEMENT `e^{iθ} = ⟨cutCos θ, cutSin θ⟩ : Dbl Cut`.

The two-sector phase diagonal `D = diag(1, e^{i2P}, e^{iP})` carries genuine elements of the derived ℂ
`Dbl Cut` (the first Cayley–Dickson double of the derived ℝ, N2), each of unit modulus — the CP phase is
the fold's own complex structure, not a free knob. -/

/-- The derived-ℂ phase element `e^{iθ} = cutCos θ + i·cutSin θ` as an element of the derived complex
    plane `Dbl Cut` (the first CD double of the derived ℝ, N2 `ComplexUnit`). -/
def phaseEl (θ : Cut) : Dbl Cut := ⟨cutCos θ, cutSin θ⟩

@[simp] theorem phaseEl_re (θ : Cut) : (phaseEl θ).re = cutCos θ := rfl
@[simp] theorem phaseEl_im (θ : Cut) : (phaseEl θ).im = cutSin θ := rfl

/-- ★ UNIT MODULUS over the derived ℂ: `|e^{iθ}|² = (cutCos θ)² + (cutSin θ)² = 1`, the Born
    self-overlap circle (banked Pythagorean identity `cutSin_sq_add_cutCos_sq`, N323). The phase
    element lies ON the derived unit circle — a genuine phase, not a free complex number. -/
theorem phaseEl_normSq (θ : Cut) :
    (phaseEl θ).re * (phaseEl θ).re + (phaseEl θ).im * (phaseEl θ).im = 1 := by
  simp only [phaseEl_re, phaseEl_im]
  have := cutSin_sq_add_cutCos_sq θ; linarith

/-- The two-sector diagonal's gen-2 entry `e^{i2P}` (the Cabibbo-block relative phase `2P`). -/
def dPhase2 : Dbl Cut := phaseEl (2 * Phys.Algebra.FoldPhase.foldPhase)
/-- The two-sector diagonal's gen-3 entry `e^{iP}`. -/
def dPhase3 : Dbl Cut := phaseEl Phys.Algebra.FoldPhase.foldPhase

/-- The Cabibbo-block relative phase is `2·foldPhase = 2·(cutPi/8) = cutPi/4` — the fold phase doubled,
    the second rung of the amplitude cascade (N416). -/
theorem twoP_eq_quarter : (2 : Cut) * Phys.Algebra.FoldPhase.foldPhase = cutPi / 4 := by
  unfold Phys.Algebra.FoldPhase.foldPhase; ring

/-! ## §2 — THE CP FACTOR IS THE DERIVED PHASE'S CP-ODD (IMAGINARY) BORN-WEIGHT `= 1/2`.

The associator is the CP SWITCH (banked N344 `cp_switch`), NOT the magnitude. The magnitude is the
imaginary Born-weight `cutSin(2P)²` of the derived phase — and at the derived phase `2P = cutPi/4` it is
the SELF=OTHER BALANCE `1/2` (N416 `cutCos_quarter_sq` + Pythagorean), halfway between CP-conserving
(weight 0) and maximal-CP (weight 1). This corrects N344's maximal `1`. -/

/-- ★★ THE DERIVED CP FACTOR: the CP-odd (imaginary) Born-weight of the derived two-sector phase,
    `cpFactorDerived = (e^{i2P}).im² = cutSin(2·foldPhase)²`. -/
def cpFactorDerived : Cut := (dPhase2).im * (dPhase2).im

/-- ★★ THE CP FACTOR IS `1/2` — the SELF=OTHER BALANCE at the derived phase, NOT the maximal `1` that
    N344 used. Since `2·foldPhase = cutPi/4` and `cutCos(cutPi/4)² = 1/2` (banked N416 `cutCos_quarter_sq`),
    the Born-circle Pythagorean identity gives `cutSin(cutPi/4)² = 1/2`. The derived phase sits EXACTLY
    halfway between CP-conserving (real, imaginary weight `0`) and maximal-CP (pure-imaginary, weight `1`). -/
theorem cpFactorDerived_eq_half : cpFactorDerived = 1 / 2 := by
  unfold cpFactorDerived dPhase2
  simp only [phaseEl_im]
  rw [twoP_eq_quarter]
  have hp := cutSin_sq_add_cutCos_sq (cutPi / 4)
  have hc := Phys.Algebra.FoldPhase.cutCos_quarter_sq
  linarith

/-- ★ THE SELF=OTHER CP-BALANCE POINT: at the derived phase the imaginary (CP-odd) Born-weight EQUALS
    the real (CP-even) Born-weight, `(e^{i2P}).im² = (e^{i2P}).re²`. The derived phase is precisely the
    balance point — neither CP-conserving (real) nor maximally CP-violating (pure-imaginary). -/
theorem cpBalance : (dPhase2).im * (dPhase2).im = (dPhase2).re * (dPhase2).re := by
  unfold dPhase2; simp only [phaseEl_re, phaseEl_im]
  rw [twoP_eq_quarter]
  have hp := cutSin_sq_add_cutCos_sq (cutPi / 4)
  have hc := Phys.Algebra.FoldPhase.cutCos_quarter_sq
  linarith

/-- ★ THE CP FACTOR IS GENUINELY NON-MAXIMAL AND NON-TRIVIAL: `0 < cpFactorDerived < 1` — real CP
    violation (not `0`) but not maximal (not `1`, as N344 assumed). -/
theorem cpFactor_between : (0 : Cut) < cpFactorDerived ∧ cpFactorDerived < 1 := by
  rw [cpFactorDerived_eq_half]; constructor <;> norm_num

/-! ## §3 — THE CORRECTED JARLSKOG INVARIANT SQUARED `J²_corrected = (1/2)·jarlskogSq`. -/

/-- ★★ THE CORRECTED JARLSKOG SQUARED: the banked N344 Born-amplitude product times the DERIVED CP
    factor, `J²_corrected = g₁₂·g₂₃·h₁₃·cpFactorDerived`. The amplitude product is unchanged from N344;
    only the CP factor is corrected from the maximal `1` to the derived `1/2`. -/
def jarlskogSqCorrected : Cut := g12 * g23 * h13 * cpFactorDerived

/-- ★★ `J²_corrected = (1/2)·jarlskogSq` — the FORCED downward correction: the derived non-maximal CP
    factor `1/2` replaces N344's maximal `1`. -/
theorem jarlskogSqCorrected_eq_half : jarlskogSqCorrected = (1 / 2) * jarlskogSq := by
  unfold jarlskogSqCorrected
  rw [cpFactorDerived_eq_half, jarlskogSq_eq]; ring

theorem jarlskogSqCorrected_pos : (0 : Cut) < jarlskogSqCorrected := by
  rw [jarlskogSqCorrected_eq_half]; have := jarlskogSq_pos; linarith

theorem jarlskogSqCorrected_nonneg : (0 : Cut) ≤ jarlskogSqCorrected := le_of_lt jarlskogSqCorrected_pos

/-- ★ THE CORRECTION IS DOWNWARD: `J²_corrected < J²_(N344)` — the derived non-maximal phase strictly
    LOWERS the CP invariant, toward the measured value. -/
theorem jarlskogSqCorrected_lt : jarlskogSqCorrected < jarlskogSq := by
  rw [jarlskogSqCorrected_eq_half]; have := jarlskogSq_pos; linarith

/-- ★★ THE CORRECTED JARLSKOG SQUARED BRACKET over the derived ℝ: `J²_corrected ∈ [36/1e9, 37/1e9]`
    (≈ 3.65e-8, half the N344 maximal value). Falls out of the banked N344 bracket scaled by `1/2`. -/
theorem jarlskogSqCorrected_lo : (36 : Cut) / 1000000000 ≤ jarlskogSqCorrected := by
  rw [jarlskogSqCorrected_eq_half]; have := jarlskogSq_lo; linarith
theorem jarlskogSqCorrected_hi : jarlskogSqCorrected ≤ (37 : Cut) / 1000000000 := by
  rw [jarlskogSqCorrected_eq_half]; have := jarlskogSq_hi; linarith

/-! ## §4 — THE CORRECTED JARLSKOG INVARIANT `J_corrected = cutSqrt(J²_corrected)`. -/

/-- ★★ THE CORRECTED JARLSKOG CP INVARIANT `J_corrected = √(J²_corrected)` over the derived ℝ (the
    single √, banked N57 `cutSqrt`). -/
def jarlskogCorrected : Cut := cutSqrt jarlskogSqCorrected

/-- ★★ THE CORRECTED JARLSKOG INVARIANT BRACKET over the derived ℝ: `J_corrected ∈ [189/1e6, 193/1e6]`
    (≈ 1.91e-4). EXTRACTED from the `J²_corrected` bracket by the derived square root. -/
theorem jarlskogCorrected_lo : (189 : Cut) / 1000000 ≤ jarlskogCorrected := by
  unfold jarlskogCorrected
  apply le_cutSqrt_of_sq_le jarlskogSqCorrected_nonneg (by norm_num)
  have := jarlskogSqCorrected_lo; nlinarith [this]
theorem jarlskogCorrected_hi : jarlskogCorrected ≤ (193 : Cut) / 1000000 := by
  unfold jarlskogCorrected
  apply cutSqrt_le_of_sq_le (by norm_num)
  have := jarlskogSqCorrected_hi; nlinarith [this]

/-- ★ NON-VACUITY: the corrected Jarlskog invariant is strictly positive — CP violation is genuinely
    PRESENT (the derived phase is non-maximal but nonzero). -/
theorem jarlskogCorrected_pos : (0 : Cut) < jarlskogCorrected := by
  have := jarlskogCorrected_lo; linarith

/-- ★★ THE CORRECTION MOVES DOWN: `J_corrected < J_(N344)` — the derived non-maximal fold phase moves
    the CP invariant strictly BELOW N344's maximal-phase value, in the direction of the measured value.
    (`J_corrected ≤ 193/1e6 < 268/1e6 ≤ J_(N344)`.) -/
theorem jarlskogCorrected_lt : jarlskogCorrected < jarlskog := by
  have h1 := jarlskogCorrected_hi
  have h2 := jarlskog_lo
  linarith

/-! ## §5 — THE STRUCTURAL TWO-SECTOR OVERLAP (banked N311/N312, re-exported).

The mixing matrix is the overlap `V = OᵤᵀD O_d` of the two per-sector rational Born-eigenvector frames.
The banked N312 `mixV` is the two-sector real overlap; its unitarity-up-to-scale and Brahmagupta–Fibonacci
normalization are banked, and the corner-zero `M₁₃ = 0` falls out of the cascade adjacency (N311). We
re-export them as the structural half of the two-sector completion. -/

/-- ★ THE TWO-SECTOR OVERLAP IS UNITARY UP TO THE FRAME-NORM SCALE (banked N312): `Vᵀ V =
    ((u₀²+u₁²)(d₀²+d₁²)) • 1`. The two-sector mixing matrix is orthogonal up to the product of the two
    frame norms — the only piece needing the derived ℝ normalization `√`. -/
theorem two_sector_overlap_unitary (u0 u1 d0 d1 : ℚ) :
    (Phys.Algebra.HJ.mixV u0 u1 d0 d1)ᵀ * (Phys.Algebra.HJ.mixV u0 u1 d0 d1)
      = ((u0 ^ 2 + u1 ^ 2) * (d0 ^ 2 + d1 ^ 2)) • (1 : Matrix (Fin 2) (Fin 2) ℚ) :=
  Phys.Algebra.HJ.mixV_unitary_up_to_scale u0 u1 d0 d1

/-- ★ THE LEADING MIXING IS NORMALIZED (banked N312 Brahmagupta–Fibonacci `cabibbo_mixing_orthonormal`):
    the mixing fraction and its complement sum to `1` — a genuine normalized leading-order mixing
    probability, arctan-free. -/
theorem two_sector_mixing_normalized (u0 u1 d0 d1 : ℚ)
    (hu : u0 ^ 2 + u1 ^ 2 ≠ 0) (hd : d0 ^ 2 + d1 ^ 2 ≠ 0) :
    (u1 * d0 - u0 * d1) ^ 2 / ((u0 ^ 2 + u1 ^ 2) * (d0 ^ 2 + d1 ^ 2))
      + (u0 * d0 + u1 * d1) ^ 2 / ((u0 ^ 2 + u1 ^ 2) * (d0 ^ 2 + d1 ^ 2)) = 1 :=
  Phys.Algebra.HJ.cabibbo_mixing_orthonormal u0 u1 d0 d1 hu hd

/-- ★ THE CORNER-ZERO `M₁₃ = 0` FALLS OUT OF CASCADE ADJACENCY (banked N311 `cascade_open_ne_closed`):
    the open cascade coupling path differs from the closed coherence cycle exactly at the corner
    (gen1↔gen3), because the cascade TERMINATES at 𝕆 (no wrap). Never imposed. -/
theorem two_sector_corner_zero : Phys.Algebra.HJ.cascadePath ≠ Phys.Algebra.HJ.seeMat :=
  Phys.Algebra.HJ.cascade_open_ne_closed

/-! ## §6 — non-vacuity (W8): the correction is a genuine strict change, the phase a genuine unit. -/

/-- ★ W8 NON-VACUITY: the CP factor is a GENUINE non-trivial value, strictly between `0` and the maximal
    `1` — `0 < cpFactorDerived < 1` AND `cpFactorDerived ≠ 1` (the derived phase is genuinely non-maximal,
    distinct from N344's assumption). -/
theorem cpFactor_ne_maximal : cpFactorDerived ≠ 1 := by
  rw [cpFactorDerived_eq_half]; norm_num

/-- ★ W8 NON-VACUITY: the corrected `J²` is a genuine number strictly between its disjoint bounds and
    strictly less than the N344 value — a real, distinct CP invariant, not a degenerate collapse. -/
theorem jarlskogSqCorrected_mem :
    (0 : Cut) < jarlskogSqCorrected ∧ jarlskogSqCorrected < jarlskogSq := by
  exact ⟨jarlskogSqCorrected_pos, jarlskogSqCorrected_lt⟩

/-! ## §7 — the capstone. -/

/-- ★★★ THE CAPSTONE — the two-sector CKM completion at the DERIVED (non-maximal) fold phase (seed O3).

    Over the derived ℝ `Cut` and the derived ℂ `Dbl Cut`, applying the DERIVED fold phase `P = foldPhase`
    (N416) to the CKM sector: the two-sector phase diagonal `D = diag(1, e^{i2P}, e^{iP})` carries genuine
    unit-modulus elements of the derived ℂ (`phaseEl_normSq`, the Born self-overlap circle). The octonion
    associator is the CP SWITCH (banked N344 `cp_switch`), NOT the magnitude; the CP MAGNITUDE is the
    CP-odd (imaginary) Born-weight of the derived phase, `cpFactorDerived = cutSin(2·foldPhase)²`. Since
    `2·foldPhase = cutPi/4` and `cutCos(cutPi/4)² = 1/2` (banked N416 `cutCos_quarter_sq`), the Born-circle
    Pythagorean identity forces `cpFactorDerived = 1/2` (`cpFactorDerived_eq_half`) — the SELF=OTHER
    BALANCE (`cpBalance`: imaginary weight = real weight), halfway between CP-conserving and maximal-CP,
    genuinely non-maximal (`cpFactor_between`, `cpFactor_ne_maximal`). This corrects N344's maximal `1`.

    So the corrected Jarlskog squared is the FORCED downward correction `J²_corrected =
    g₁₂·g₂₃·h₁₃·cpFactorDerived = (1/2)·jarlskogSq` (`jarlskogSqCorrected_eq_half`), strictly below the
    N344 value (`jarlskogSqCorrected_lt`), bracket `[36/1e9, 37/1e9]` (`jarlskogSqCorrected_lo/hi`); and
    the corrected invariant `J_corrected = cutSqrt(J²_corrected) ∈ [189/1e6, 193/1e6]`
    (`jarlskogCorrected_lo/hi`), strictly below N344's maximal `J` (`jarlskogCorrected_lt`) — the derived
    non-maximal phase moves the CP invariant DOWN toward the measured value, as forced, with ZERO free CP
    parameters. The structural two-sector overlap `V = OᵤᵀD O_d` is banked (N311/N312): unitary up to the
    frame-norm scale (`two_sector_overlap_unitary`), normalized (`two_sector_mixing_normalized`), with the
    corner-zero `M₁₃ = 0` from cascade adjacency (`two_sector_corner_zero`).

    ⚠ HONEST GRADE (seed §O3 + N344/T8 leading-order caveat): the CP factor `1/2` and the direction +
    magnitude of the correction are FORCED and theorem-exact. The FULL angle-dependent effective two-sector
    CP phase of `V = OᵤᵀD O_d` is frame-angle-dependent, so a clean numeric two-sector `J` from a full 3×3
    diagonalization is NOT a forced number and is NOT claimed. NO FIT: the residual against the measured
    Jarlskog is NOT chased; comparison to data is removable prose. -/
theorem two_sector_ckm_derived_phase :
    -- the derived-ℂ phase element is a genuine unit-modulus phase (Born circle)
    (∀ θ : Cut, (phaseEl θ).re * (phaseEl θ).re + (phaseEl θ).im * (phaseEl θ).im = 1)
    -- the Cabibbo-block relative phase is 2·foldPhase = cutPi/4 (the derived fold phase doubled)
    ∧ (2 : Cut) * Phys.Algebra.FoldPhase.foldPhase = cutPi / 4
    -- ★ the derived CP factor = 1/2, the self=other balance (corrects N344's maximal 1)
    ∧ cpFactorDerived = 1 / 2
    ∧ ((dPhase2).im * (dPhase2).im = (dPhase2).re * (dPhase2).re)
    ∧ ((0 : Cut) < cpFactorDerived ∧ cpFactorDerived < 1)
    -- ★★ the corrected Jarlskog squared = (1/2)·jarlskogSq, downward, with bracket
    ∧ jarlskogSqCorrected = (1 / 2) * jarlskogSq
    ∧ jarlskogSqCorrected < jarlskogSq
    ∧ ((36 : Cut) / 1000000000 ≤ jarlskogSqCorrected ∧ jarlskogSqCorrected ≤ (37 : Cut) / 1000000000)
    -- ★★ the corrected Jarlskog invariant over the derived ℝ, strictly below the N344 maximal value
    ∧ ((189 : Cut) / 1000000 ≤ jarlskogCorrected ∧ jarlskogCorrected ≤ (193 : Cut) / 1000000)
    ∧ jarlskogCorrected < jarlskog
    ∧ (0 : Cut) < jarlskogCorrected
    -- the structural two-sector overlap (banked N311/N312): unitary-up-to-scale, normalized, corner-zero
    ∧ (∀ u0 u1 d0 d1 : ℚ, (Phys.Algebra.HJ.mixV u0 u1 d0 d1)ᵀ * (Phys.Algebra.HJ.mixV u0 u1 d0 d1)
        = ((u0 ^ 2 + u1 ^ 2) * (d0 ^ 2 + d1 ^ 2)) • (1 : Matrix (Fin 2) (Fin 2) ℚ))
    ∧ (Phys.Algebra.HJ.cascadePath ≠ Phys.Algebra.HJ.seeMat) :=
  ⟨phaseEl_normSq, twoP_eq_quarter, cpFactorDerived_eq_half, cpBalance, cpFactor_between,
   jarlskogSqCorrected_eq_half, jarlskogSqCorrected_lt, ⟨jarlskogSqCorrected_lo, jarlskogSqCorrected_hi⟩,
   ⟨jarlskogCorrected_lo, jarlskogCorrected_hi⟩, jarlskogCorrected_lt, jarlskogCorrected_pos,
   two_sector_overlap_unitary, two_sector_corner_zero⟩

end

end CKMTwoSectorPhase
end Phys.Algebra
