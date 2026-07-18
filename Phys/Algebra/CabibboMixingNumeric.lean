/-
# C2 — THE LEADING ANGLE EVALUATED: THE CABIBBO MIXING FRACTION AS AN ACTUAL NUMBER OF THE DERIVED ℝ

Owner-authorized mixing seed (docs/SEED_MIXING.md), target **C2** — the directed successor of C1
(`PhaseAlignmentDerivation`, the phase-alignment keystone). Arc D and arc M are complete; the board
runs the mixing sector (order D→M→C→GR). C1 made the two-quark-sector frame MISALIGNMENT a FORCED
object: `sectorMisalign a₀ a₁ = a₀·a₁·(1 − edgeSurvival) = a₀·a₁·(1/3)` — the down frame is the up
frame with its sub-leading amplitude damped by ONE self-blind survival factor `edgeSurvival = 2/3`
(the down-type sits one cascade rung deeper). This node EVALUATES that derived misalignment through
the banked normalized overlap (N312 `cabibbo_mixing_orthonormal`) into an ACTUAL certified two-sided
rational bracket over the derived ℝ `Cut`.

★ THE FORCED OBJECT (C1-native, at the leading Cabibbo edge). The leading Cabibbo edge is the
deep/shallow slot pair `(a₀, a₂) = (b0, b2)` of the banked ℝ-descent amplitudes (N339/N340, at the
derived phase `δ_B = 2/9`, `p = cutCos(2/9)`) — the largest-ρ inter-generation edge (the same edge the
banked rung-3 identified as the Cabibbo/Wolfenstein hierarchy edge). The C1 survival-dressed frames are

      up frame   `u = (b0, b2)`,   down frame `d = (b0, survivalCut·b2)`   (`survivalCut = 2/3`)

and the banked overlap `mixV` cross-term (the mixing) and inner product (the aligned complement) are

      `cabCross   = u∧d = b2·b0 − b0·(survivalCut·b2) = b0·b2·(1 − survivalCut) = b0·b2·(1/3)`  (the C1 keystone shape)
      `cabAligned = u·d = b0·b0 + b2·(survivalCut·b2)`.

The leading Cabibbo mixing FRACTION (arctan-free, the Brahmagupta–Fibonacci-normalized `sin²` of the
leading angle, N312) is

      `cabMix2 = cabCross² / (cabNu · cabNd)`,  `cabNu = b0²+b2²`,  `cabNd = b0²+(survivalCut·b2)²`.

★ THE LANDING (this node). Evaluated over the derived ℝ `Cut` from the banked `b0`, `b2` brackets:
`cabMix2 ∈ [60740/1e7, 60770/1e7]` (≈ 0.0060753) — the leading Cabibbo mixing `|V_mix|²` as an ACTUAL
number, ZERO free continuous parameters (`survivalCut = 2/3` derived, `b0`, `b2` the banked
`cutCos(2/9)`-descent numerals). FREE TOOTH: the arctan-free unitarity `cabCross² + cabAligned² =
cabNu · cabNd` (Brahmagupta–Fibonacci, a ring identity of the dressed frames) gives
`cabMix2 + cabAln2 = 1` EXACTLY — the `sin² + cos² = 1` of the leading angle reproduced from the
evaluated fraction.

⭐ ONE CAUSE, MANY TERMINATIONS. The SAME self-blind survival `edgeSurvival = 2/3` whose DEFICIT
`(1 − edgeSurvival) = 1/3` is the C1 frame misalignment is here the factor that sets the derived
Cabibbo mixing `cabCross = b0·b2·(1/3)` — the Born self-view (Koide `2/3`), the cycle phase
(`δ_B = 2/9`), the mixing deficit (`1/3`), and now the evaluated Cabibbo fraction are one self-blind
split read across the sectors.

⚠ HONEST GRADE (seed §C2, T8 leading-order caveat). LEADING ORDER: `|V_mix| ≈ 0.0779` (derived);
the measured `sin θ_C ≈ 0.2252` (`sin² ≈ 0.0507`) is the arc-C LIVE-fight residual — REMOVABLE PROSE,
in NO proof, NEVER fitted, NEVER chased (reaching for the measured angle to steer any bracket is the
fit — forbidden, seed G2). The C1-forced object is the survival-dressed overlap fraction; the ≈0.2438
UNDRESSED ratio `b2/b0` is the SEPARATE banked rung-3 object (`undressedEdgeRatio`), NOT C2's target.
THE ONE-PEG LAW (inherited from M1): `cabMix2` is DIMENSIONLESS (a ratio of amplitudes) — no new peg.

PHYSICS-WORDS-REMOVABLE (STANDARD §2, seed G4). Delete "quark" / "Cabibbo" / "mixing" / "CKM" /
"angle": over the derived `Cut`, with the banked `b0`, `b2` and the banked rational `survivalCut = 2/3`,
`cabCross = b0·b2·(1/3)`, `cabNu = b0²+b2²`, `cabNd = b0²+(2/3·b2)²`, `cabMix2 = cabCross²/(cabNu·cabNd)
∈ [60740/1e7, 60770/1e7]`, and `cabCross² + cabAligned² = cabNu·cabNd` (a ring identity). No theorem
STATEMENT needs a physics word.

FREE-FLOATING check (SOUL rail). Every TYPE mentions the banked derived objects: `b0`, `b2`
(N339/N340 ℝ-descent amplitudes over `Cut`), `survivalCut` (the banked `edgeSurvival = tr Poth/3` cast),
and the C1 tie carries `((edgeSurvival:ℚ):Cut)`. `cabMix2` is literally the banked `mixV`
cross-term-squared normalized fraction at the C1 survival-dressed `(b0, b2)` edge — not a generic
2×2-overlap statement floating free of the derived generation objects.

Foundations-only (seed G6): no posited axiom, no proof-hole, no kernel-trust bypass, no heartbeat
inflation, no bridge; no empirical number (measured Cabibbo / Wolfenstein `λ` / PDG value in NO proof,
removable prose only); the ground field is the BANKED derived ℝ `Cut`, the banked `cutCos(2/9)`-descent
amplitudes, and the banked ℚ `edgeSurvival` cast to `Cut` — NO Mathlib `Real`/`Complex` as content.
IMPORT GUARD: imports the banked rung-3 (transitively N305–N340, the cascade + ℝ-descent) and the C1
module, NEVER `MassGapOne` — no `foldRetention` reaches this content.
-/
import Phys.Algebra.GenerationDepthDressedMixingNumeric
import Phys.Algebra.PhaseAlignmentDerivation
import Mathlib.Tactic

namespace Phys.Algebra.CabibboMixing

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.DepthDressedMixing
open Phys.Algebra.HJ

noncomputable section

/-! ## §1 — the C1 survival-dressed frames and the overlap cross-term / inner product over `Cut`. -/

/-- The C1 survival-dressed down sub-leading amplitude over the derived ℝ: `survivalCut · b2`
    (the down-type sub-leading amplitude damped by ONE self-blind survival factor, C1). -/
def dressedDown : Cut := survivalCut * b2

/-- The overlap MIXING cross-term `u∧d = u₁d₀ − u₀d₁` of the up frame `u = (b0, b2)` with the
    survival-dressed down frame `d = (b0, dressedDown)` (the banked `mixV` cross-term, N312). This is
    the C1 keystone shape `b0·b2·(1 − survivalCut)` evaluated at the leading `(b0, b2)` edge. -/
def cabCross : Cut := b2 * b0 - b0 * dressedDown

/-- The overlap ALIGNED inner product `u·d = u₀d₀ + u₁d₁` of the two dressed frames (the
    Brahmagupta complement of the mixing cross-term). -/
def cabAligned : Cut := b0 * b0 + b2 * dressedDown

/-- The up-frame norm `u₀²+u₁² = b0²+b2²` (the aligned-overlap denominator factor, banked frame-norm). -/
def cabNu : Cut := b0 ^ 2 + b2 ^ 2

/-- The survival-dressed down-frame norm `d₀²+d₁² = b0²+(survivalCut·b2)²`. -/
def cabNd : Cut := b0 ^ 2 + dressedDown ^ 2

/-- ★★ THE LEADING CABIBBO MIXING FRACTION `|V_mix|² = (u∧d)²/((u₀²+u₁²)(d₀²+d₁²))` over the derived ℝ
    (arctan-free, the Brahmagupta–Fibonacci-normalized `sin²` of the leading angle, N312). -/
def cabMix2 : Cut := cabCross ^ 2 / (cabNu * cabNd)

/-- The aligned complement fraction `|V_aligned|²` (the `cos²` of the leading angle). -/
def cabAln2 : Cut := cabAligned ^ 2 / (cabNu * cabNd)

/-! ## §2 — the C1 keystone shape and positivity. -/

/-- ★ THE C1 KEYSTONE SHAPE over `Cut`: the mixing cross-term IS the amplitude product times the
    self-blind survival DEFICIT `(1 − survivalCut)` — the C1 `sectorMisalign` structure evaluated at
    the leading `(b0, b2)` edge over the derived ℝ. -/
theorem cabCross_eq_deficit : cabCross = b0 * b2 * (1 - survivalCut) := by
  unfold cabCross dressedDown; ring

/-- The mixing cross-term is the amplitude product times the derived deficit `1/3`
    (`survivalCut = 2/3`, banked rung-3 `survivalCut_val`). -/
theorem cabCross_eq_val : cabCross = b0 * b2 * (1 / 3) := by
  rw [cabCross_eq_deficit, survivalCut_val]; ring

/-- The C1 tie: the mixing cross-term is `b0·b2·(1 − ((edgeSurvival:ℚ):Cut))` — literally the banked
    C1 `sectorMisalign` shape (the down frame damped by the banked self-blind `edgeSurvival`, N308)
    evaluated over the derived ℝ at the leading amplitudes. -/
theorem cabCross_eq_edgeSurvival : cabCross = b0 * b2 * (1 - ((edgeSurvival : ℚ) : Cut)) := by
  rw [cabCross_eq_deficit, ← survivalCut_eq_edgeSurvival]

theorem cabNu_pos : (0 : Cut) < cabNu := by
  unfold cabNu; nlinarith [pow_pos b0_pos 2, sq_nonneg b2]
theorem cabNd_pos : (0 : Cut) < cabNd := by
  unfold cabNd; nlinarith [pow_pos b0_pos 2, sq_nonneg dressedDown]
theorem cabDen_pos : (0 : Cut) < cabNu * cabNd := mul_pos cabNu_pos cabNd_pos

theorem cabCross_pos : (0 : Cut) < cabCross := by
  rw [cabCross_eq_val]; have h := mul_pos b0_pos b2_pos; nlinarith [h]

/-! ## §3 — the cross-term bracket (via the `b0·b2` product bracket). -/

/-- The amplitude product `b0·b2 ∈ [138054/1e5, 138060/1e5]` (from the banked `b0`, `b2` brackets;
    each factor its own banked bound, product by monotonicity). -/
theorem b0b2_lo : (138054 : Cut) / 100000 ≤ b0 * b2 :=
  le_trans (by norm_num)
    (mul_le_mul b0_lo b2_lo (by norm_num) (le_of_lt b0_pos))
theorem b0b2_hi : b0 * b2 ≤ (138060 : Cut) / 100000 :=
  le_trans (mul_le_mul b0_hi b2_hi (le_of_lt b2_pos) (by norm_num)) (by norm_num)

/-- The mixing cross-term `cabCross = b0·b2·(1/3) ∈ [46018/1e5, 46020/1e5]` (≈ 0.46019). -/
theorem cabCross_lo : (46018 : Cut) / 100000 ≤ cabCross := by
  rw [cabCross_eq_val]; nlinarith [b0b2_lo]
theorem cabCross_hi : cabCross ≤ (46020 : Cut) / 100000 := by
  rw [cabCross_eq_val]; nlinarith [b0b2_hi]

/-! ## §4 — the frame-norm brackets (`b0² = mass0`, `b2² = mass2` banked). -/

/-- `b0² ∈ [237943/1e5·237943/1e5, 237944/1e5·237944/1e5]` (banked `mass0` = `b0²`). -/
theorem b0sq_lo : (237943 : Cut) / 100000 * (237943 / 100000) ≤ b0 ^ 2 := mass0_lo
theorem b0sq_hi : b0 ^ 2 ≤ (237944 : Cut) / 100000 * (237944 / 100000) := mass0_hi
/-- `b2² ∈ [5802/1e4·5802/1e4, 58022/1e5·58022/1e5]` (banked `mass2` = `b2²`). -/
theorem b2sq_lo : (5802 : Cut) / 10000 * (5802 / 10000) ≤ b2 ^ 2 := mass2_lo
theorem b2sq_hi : b2 ^ 2 ≤ (58022 : Cut) / 100000 * (58022 / 100000) := mass2_hi

/-- The up-frame norm `cabNu = b0²+b2² ∈ [599831/1e5, 599840/1e5]` (≈ 5.99834). -/
theorem cabNu_lo : (599831 : Cut) / 100000 ≤ cabNu := by
  unfold cabNu; nlinarith [b0sq_lo, b2sq_lo]
theorem cabNu_hi : cabNu ≤ (599840 : Cut) / 100000 := by
  unfold cabNu; nlinarith [b0sq_hi, b2sq_hi]

/-- The dressed down-frame norm `cabNd = b0²+(2/3·b2)² = b0²+(4/9)b2² ∈ [581130/1e5, 581136/1e5]`
    (≈ 5.81134). -/
theorem cabNd_eq : cabNd = b0 ^ 2 + (4 / 9) * b2 ^ 2 := by
  unfold cabNd dressedDown; rw [survivalCut_val]; ring
theorem cabNd_lo : (581130 : Cut) / 100000 ≤ cabNd := by
  rw [cabNd_eq]; nlinarith [b0sq_lo, b2sq_lo]
theorem cabNd_hi : cabNd ≤ (581136 : Cut) / 100000 := by
  rw [cabNd_eq]; nlinarith [b0sq_hi, b2sq_hi]

/-! ## §5 — ★★ THE LEADING CABIBBO MIXING FRACTION BRACKET over the derived ℝ. -/

/-- ★★ THE LEADING CABIBBO MIXING, LOW END. `cabMix2 = cabCross²/(cabNu·cabNd) ≥ 60740/1e7`
    (≈ 0.0060753). -/
theorem cabMix2_lo : (60740 : Cut) / 10000000 ≤ cabMix2 := by
  have hcross2 : ((46018 : Cut) / 100000) ^ 2 ≤ cabCross ^ 2 := by
    have h0 : (0 : Cut) ≤ (46018 : Cut) / 100000 := by norm_num
    nlinarith [cabCross_lo, h0]
  have hden : cabNu * cabNd ≤ ((599840 : Cut) / 100000) * ((581136 : Cut) / 100000) :=
    mul_le_mul cabNu_hi cabNd_hi (le_of_lt cabNd_pos) (by norm_num)
  rw [cabMix2, le_div_iff₀ cabDen_pos]
  nlinarith [hcross2, hden]

/-- ★★ THE LEADING CABIBBO MIXING, HIGH END. `cabMix2 ≤ 60770/1e7` (≈ 0.0060753). Together with
    `cabMix2_lo`, the leading Cabibbo mixing `|V_mix|²` as an ACTUAL certified two-sided rational
    bracket over the derived ℝ. -/
theorem cabMix2_hi : cabMix2 ≤ (60770 : Cut) / 10000000 := by
  have hcross2 : cabCross ^ 2 ≤ ((46020 : Cut) / 100000) ^ 2 := by
    nlinarith [cabCross_hi, cabCross_pos]
  have hden : ((599831 : Cut) / 100000) * ((581130 : Cut) / 100000) ≤ cabNu * cabNd :=
    mul_le_mul cabNu_lo cabNd_lo (by norm_num) (le_of_lt cabNu_pos)
  rw [cabMix2, div_le_iff₀ cabDen_pos]
  nlinarith [hcross2, hden]

/-! ## §6 — ★ THE FREE UNITARITY TOOTH (arctan-free, Brahmagupta–Fibonacci). -/

/-- ★ THE BRAHMAGUPTA–FIBONACCI IDENTITY of the dressed frames (a ring identity over `Cut`): the
    mixing cross-term squared plus the aligned inner product squared equals the product of the two
    frame norms. The algebraic core of the leading angle's `sin²+cos² = 1`. -/
theorem cab_brahmagupta : cabCross ^ 2 + cabAligned ^ 2 = cabNu * cabNd := by
  unfold cabCross cabAligned cabNu cabNd; ring

/-- ★★ THE ARCTAN-FREE UNITARITY TOOTH: `cabMix2 + cabAln2 = 1` EXACTLY over the derived ℝ — the
    `sin²+cos² = 1` of the leading Cabibbo angle reproduced from the evaluated fraction
    (`cab_brahmagupta` + `cabNu·cabNd ≠ 0`). -/
theorem cab_unitarity : cabMix2 + cabAln2 = 1 := by
  unfold cabMix2 cabAln2
  rw [← add_div, cab_brahmagupta, div_self (ne_of_gt cabDen_pos)]

/-! ## §7 — non-vacuity / teeth (W8). -/

/-- ★ NON-VACUITY: the leading Cabibbo mixing fraction is a genuine POSITIVE number
    (`cabCross > 0`, `cabNu·cabNd > 0`) — real mixing, not zero. -/
theorem cabMix2_pos : (0 : Cut) < cabMix2 := by
  unfold cabMix2
  exact div_pos (pow_pos cabCross_pos 2) cabDen_pos

/-- ★ NON-VACUITY: the mixing fraction is strictly inside `(0,1)` — a genuine leading-order mixing
    PROBABILITY (not `0` = no mixing, not `1` = maximal), from the bracket and unitarity. -/
theorem cabMix2_mem : (0 : Cut) < cabMix2 ∧ cabMix2 < 1 := by
  refine ⟨cabMix2_pos, ?_⟩
  have h := cabMix2_hi; linarith

/-- ★ NON-VACUITY (the dressing BITES): the mixing fraction is strictly below the aligned complement
    (the two frames are far from maximally mixed — the leading angle is small, as the hierarchy
    demands), because `cabMix2 = 1 − cabAln2` and `cabAln2 > cabMix2`. -/
theorem cabMix2_lt_cabAln2 : cabMix2 < cabAln2 := by
  have hu := cab_unitarity
  have h := cabMix2_hi
  -- cabAln2 = 1 − cabMix2 ≥ 1 − 60770/1e7 > 60770/1e7 ≥ cabMix2
  have hAln : cabAln2 = 1 - cabMix2 := by linarith [hu]
  rw [hAln]; linarith [h, cabMix2_lo]

/-! ## §8 — the capstone. -/

/-- ★★★ THE CAPSTONE — the leading Cabibbo mixing fraction as an ACTUAL NUMBER of the derived ℝ
    (seed C2, the leading angle evaluated).

    Over the derived ℝ `Cut`, evaluating the C1 survival-dressed misalignment (C1
    `sectorMisalign`, the down frame damped by one self-blind `edgeSurvival = 2/3`) through the banked
    normalized overlap (N312) at the leading Cabibbo `(b0, b2)` edge of the banked ℝ-descent amplitudes
    (N339/N340, at the derived phase `δ_B = 2/9`, `p = cutCos(2/9)`): the mixing cross-term is the C1
    keystone shape `cabCross = b0·b2·(1 − survivalCut) = b0·b2·(1/3)` (`cabCross_eq_deficit`,
    `cabCross_eq_edgeSurvival` the C1 tie), and the leading Cabibbo mixing FRACTION
    `cabMix2 = cabCross²/(cabNu·cabNd) ∈ [60740/1e7, 60770/1e7]` (≈ 0.0060753, `cabMix2_lo/hi`) — an
    ACTUAL certified two-sided rational bracket, ZERO free continuous parameters. FREE TOOTH: the
    arctan-free unitarity `cabCross² + cabAligned² = cabNu·cabNd` (`cab_brahmagupta`, Brahmagupta–
    Fibonacci) gives `cabMix2 + cabAln2 = 1` EXACTLY (`cab_unitarity`). Non-vacuity: `cabMix2` is a
    genuine number in `(0,1)` (`cabMix2_mem`) strictly below its aligned complement (`cabMix2_lt_cabAln2`,
    the leading angle is small — the dressing bites).

    ⭐ ONE CAUSE: the SAME self-blind `edgeSurvival = 2/3` (Koide `2/3`, cycle phase `δ_B = 2/9`, C1
    deficit `1/3`) sets `cabCross = b0·b2·(1/3)`.

    ⚠ HONEST GRADE (seed §C2): LEADING ORDER. `|V_mix| ≈ 0.0779` (derived); the measured
    `sin θ_C ≈ 0.2252` is the arc-C LIVE-fight residual — REMOVABLE PROSE, in NO proof, NEVER fitted;
    the ≈0.2438 undressed ratio `b2/b0` is the SEPARATE banked rung-3 object. `cabMix2` is dimensionless
    (ONE-PEG LAW: no new peg). -/
theorem cabibbo_mixing_numeric :
    -- the C1 keystone shape at the leading edge over the derived ℝ
    (cabCross = b0 * b2 * (1 - survivalCut))
    ∧ (cabCross = b0 * b2 * (1 - ((edgeSurvival : ℚ) : Cut)))
    -- ★★ the leading Cabibbo mixing fraction as an actual two-sided bracket
    ∧ ((60740 : Cut) / 10000000 ≤ cabMix2 ∧ cabMix2 ≤ (60770 : Cut) / 10000000)
    -- ★ the free arctan-free unitarity tooth (Brahmagupta–Fibonacci)
    ∧ (cabCross ^ 2 + cabAligned ^ 2 = cabNu * cabNd)
    ∧ (cabMix2 + cabAln2 = 1)
    -- non-vacuity: a genuine mixing probability in (0,1), the dressing bites
    ∧ ((0 : Cut) < cabMix2 ∧ cabMix2 < 1)
    ∧ (cabMix2 < cabAln2) :=
  ⟨cabCross_eq_deficit, cabCross_eq_edgeSurvival, ⟨cabMix2_lo, cabMix2_hi⟩,
   cab_brahmagupta, cab_unitarity, cabMix2_mem, cabMix2_lt_cabAln2⟩

end

end Phys.Algebra.CabibboMixing
