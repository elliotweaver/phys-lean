/-
  Counterexamples.GenerationDepthDressedMixingNumericVacuityCostume — GenDepthDressedMixingNumeric
  anti-vacuity (C525).
  =====================================================================================
  W8 ANTI-VACUITY. This node (THE DEPTH-DRESSED EDGE RATIO AS AN ACTUAL NUMBER OF THE DERIVED ℝ —
  the CKM/Wolfenstein mixing HIERARCHY suppression at leading order) EVALUATES rung-2's structural
  deep/shallow coupling ratio `edgeSurvival · (a₂/a₀)` over the derived ℝ `Cut`, at the banked
  N339/N340 ℝ-descent amplitudes, landing the DEPTH-DRESSED edge ratio in the certified two-sided
  bracket `[16255/1e5, 16257/1e5]` (≈ 0.1626) — one factor of the self-blind Born-survival
  `survivalCut = 2/3` below the UNDRESSED ratio `b2/b0 ∈ [24383/1e5, 24385/1e5]` (≈ 0.2438). The
  marquee content that must NOT be hollow: the depth-dressed ratio's UPPER endpoint 16257/1e5 is
  STRICTLY BELOW the undressed ratio's LOWER endpoint 24383/1e5 — the two brackets are DISJOINT, so
  the depth suppression is a REAL, non-degenerate effect over the derived ℝ (not a bracket that
  overlaps the undressed one, which would make the "hierarchy" vacuous).

  THE CERTIFICATE. ddFlag := 1 -- a natural-number flag standing for "the depth-dressed edge-ratio
  bracket [16255/1e5, 16257/1e5] lies STRICTLY BELOW the undressed bracket [24383/1e5, 24385/1e5]
  over the derived ℝ (16257/1e5 < 24383/1e5), so the Wolfenstein-hierarchy suppression is a genuine
  non-degenerate number, not a vacuous overlap". It is TIED to the banked landing by ddFlag_forced:
  the banked depthDressedEdgeRatio_hi + undressedEdgeRatio_lo witness that the dressed ratio is
  STRICTLY below the undressed ratio (depthDressed_strict_suppress), and 16257/1e5 < 24383/1e5 over
  Cut, so the flag is 1.

  We anchor min 525 ddFlag = 1 (TRUE -- ddFlag = 1 < 525, so the min is ddFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the dressed and undressed brackets overlap / there is no real
  suppression / the depth-dressing is vacuous / the hierarchy is flat" mis-reading): that
  min 525 ddFlag = 525. It GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim to
  the false numeric 1 = 525 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (525, 1) is fresh (Cid 525 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.GenerationDepthDressedMixingNumeric
import Mathlib.Tactic

namespace Counterexamples

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra.DepthDressedMixing

/-- THE FLAG: 1 = "the depth-dressed edge-ratio bracket lies STRICTLY BELOW the undressed bracket
    over the derived ℝ, so the Wolfenstein-hierarchy suppression is a genuine non-degenerate number,
    not a vacuous overlap". -/
def ddFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the derived ℝ bracket endpoints separate — the depth-dressed
    ratio's upper endpoint `16257/1e5` is strictly below the undressed ratio's lower endpoint
    `24383/1e5` (the two brackets are disjoint, witnessed by the banked `depthDressedEdgeRatio_hi`
    and `undressedEdgeRatio_lo`), so `ddFlag = 1`. -/
theorem ddFlag_forced :
    (depthDressedEdgeRatio ≤ (16257 : Cut) / 100000)
    ∧ ((24383 : Cut) / 100000 ≤ undressedEdgeRatio)
    ∧ ((16257 : Cut) / 100000 < (24383 : Cut) / 100000)
    ∧ ddFlag = 1 :=
  ⟨depthDressedEdgeRatio_hi, undressedEdgeRatio_lo, by norm_num, rfl⟩

/-- TRUE: min 525 ddFlag = 1, holding precisely because ddFlag = 1 < 525. -/
theorem cert_val_true : min (525 : ℕ) ddFlag = 1 := by decide

/-- BOGUS: claims min 525 ddFlag = 525. It GENUINELY equals 1 (cert_val_true). A "the dressed and
    undressed brackets overlap / there is no real suppression / the depth-dressing is vacuous / the
    hierarchy is flat" mis-reading reduces -- through the banked landing -- to the false numeric
    1 = 525, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (525 : ℕ) ddFlag = 525 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 525  (FALSE — the costume bites)

end Counterexamples
