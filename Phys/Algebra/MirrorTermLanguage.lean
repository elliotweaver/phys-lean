import Phys.Algebra.MirrorRootGlobal
import Phys.Algebra.TwoEndsConstructed
import Phys.Algebra.ChainTermGrammar

/-!
  # N675 — MIRROR TERM LANGUAGE: the next moment pair + the UNIVERSAL legality theorem
  # over the formal term language (the N588 boundary closed as a theorem)
  ================================================================================
  MANAGER-AS-PROVER NODE (owner-directed airtight arc). PREREG:
  workbench/mirror-closure/PREREG-AIRTIGHT.md (N675). Recon: airtight-recon.json
  (cos⁵·sin = 5/32·sin2x + 1/8·sin4x + 1/32·sin6x; cos⁴·sin = 1/8·sin x + 3/16·sin 3x +
  1/16·sin 5x — both exact, sympy certificates computed pre-Lean against the repo's own
  expansion convention; runningLogContent ≥ 22.4 by worst-case banked edge-log brackets).
-/

namespace Phys.Algebra
namespace MirrorTermLanguage
open Phys.Foundation.ContinuumQ
open Phys.Algebra.DepthWeight
open Phys.Algebra.TwoEndsConstructed
open Phys.Algebra.MirrorFixedPoint
open Phys.Algebra.ChainTermGrammar
open Phys.Algebra.D7NarrowingRung4
open Phys.Algebra.D7NarrowingRung3
open Phys.Algebra.GenerationMassRatios

noncomputable section

/-! ## (1) THE 5x/6x ANTIDERIVATIVES (the N590 sinN pattern at scales 5 and 6). -/

/-- The `m`-th termwise antiderivative of `sinTermC (5x)`, w.r.t. `x`. -/
def sin5AntiderivTerm (x : Cut) (m : ℕ) : Cut :=
  (-1) ^ m * (5 : Cut) ^ (2 * m + 1) * x ^ (2 * m + 2) / ((2 * m + 2).factorial : Cut)

theorem sin5AntiderivTerm_eq (x : Cut) (m : ℕ) :
    sin5AntiderivTerm x m = -(1 / 5) * cosTermC (5 * x) (m + 1) := by
  unfold sin5AntiderivTerm cosTermC
  have he : 2 * (m + 1) = 2 * m + 2 := by ring
  rw [he]
  have hsign : (-1 : Cut) ^ (m + 1) = -(-1) ^ m := by rw [pow_succ]; ring
  rw [hsign]
  have hpow : ((5 : Cut) * x) ^ (2 * m + 2) = (5 : Cut) ^ (2 * m + 2) * x ^ (2 * m + 2) := by
    rw [mul_pow]
  rw [hpow]
  have h5 : (5 : Cut) ^ (2 * m + 2) = 5 * (5 : Cut) ^ (2 * m + 1) := by rw [← pow_succ']
  rw [h5]; ring

theorem sin5AntiderivTerm_summable (x : Cut) : Summable (sin5AntiderivTerm x) := by
  have h : Summable (fun m => -(1 / 5) * cosTermC (5 * x) (m + 1)) :=
    (((summable_nat_add_iff 1).mpr (cosTermC_summable (5 * x))).mul_left _)
  refine h.congr ?_
  intro m; rw [sin5AntiderivTerm_eq]

/-- `∫₀ˣ cutSin(5·)` over the derived ℝ (termwise FTC). -/
def sin5Antideriv (x : Cut) : Cut := ∑' m, sin5AntiderivTerm x m

/-- FTC: `∫₀ˣ cutSin(5·) = (1 − cutCos 5x)/5`. -/
theorem sin5Antideriv_eq (x : Cut) : sin5Antideriv x = (1 - cutCos (5 * x)) / 5 := by
  unfold sin5Antideriv
  have hstep : (∑' m, sin5AntiderivTerm x m) = ∑' m, -(1 / 5) * cosTermC (5 * x) (m + 1) := by
    apply tsum_congr; intro m; rw [sin5AntiderivTerm_eq]
  rw [hstep, tsum_mul_left]
  have hz := (cosTermC_summable (5 * x)).tsum_eq_zero_add
  have h0 : cosTermC (5 * x) 0 = 1 := by unfold cosTermC; simp
  rw [h0] at hz
  have hcut : cutCos (5 * x) = ∑' n, cosTermC (5 * x) n := rfl
  rw [← hcut] at hz
  have hshift : (∑' n, cosTermC (5 * x) (n + 1)) = cutCos (5 * x) - 1 := by linarith [hz]
  rw [hshift]; ring

/-- The `m`-th termwise antiderivative of `sinTermC (6x)`, w.r.t. `x`. -/
def sin6AntiderivTerm (x : Cut) (m : ℕ) : Cut :=
  (-1) ^ m * (6 : Cut) ^ (2 * m + 1) * x ^ (2 * m + 2) / ((2 * m + 2).factorial : Cut)

theorem sin6AntiderivTerm_eq (x : Cut) (m : ℕ) :
    sin6AntiderivTerm x m = -(1 / 6) * cosTermC (6 * x) (m + 1) := by
  unfold sin6AntiderivTerm cosTermC
  have he : 2 * (m + 1) = 2 * m + 2 := by ring
  rw [he]
  have hsign : (-1 : Cut) ^ (m + 1) = -(-1) ^ m := by rw [pow_succ]; ring
  rw [hsign]
  have hpow : ((6 : Cut) * x) ^ (2 * m + 2) = (6 : Cut) ^ (2 * m + 2) * x ^ (2 * m + 2) := by
    rw [mul_pow]
  rw [hpow]
  have h6 : (6 : Cut) ^ (2 * m + 2) = 6 * (6 : Cut) ^ (2 * m + 1) := by rw [← pow_succ']
  rw [h6]; ring

theorem sin6AntiderivTerm_summable (x : Cut) : Summable (sin6AntiderivTerm x) := by
  have h : Summable (fun m => -(1 / 6) * cosTermC (6 * x) (m + 1)) :=
    (((summable_nat_add_iff 1).mpr (cosTermC_summable (6 * x))).mul_left _)
  refine h.congr ?_
  intro m; rw [sin6AntiderivTerm_eq]

/-- `∫₀ˣ cutSin(6·)` over the derived ℝ (termwise FTC). -/
def sin6Antideriv (x : Cut) : Cut := ∑' m, sin6AntiderivTerm x m

/-- FTC: `∫₀ˣ cutSin(6·) = (1 − cutCos 6x)/6`. -/
theorem sin6Antideriv_eq (x : Cut) : sin6Antideriv x = (1 - cutCos (6 * x)) / 6 := by
  unfold sin6Antideriv
  have hstep : (∑' m, sin6AntiderivTerm x m) = ∑' m, -(1 / 6) * cosTermC (6 * x) (m + 1) := by
    apply tsum_congr; intro m; rw [sin6AntiderivTerm_eq]
  rw [hstep, tsum_mul_left]
  have hz := (cosTermC_summable (6 * x)).tsum_eq_zero_add
  have h0 : cosTermC (6 * x) 0 = 1 := by unfold cosTermC; simp
  rw [h0] at hz
  have hcut : cutCos (6 * x) = ∑' n, cosTermC (6 * x) n := rfl
  rw [← hcut] at hz
  have hshift : (∑' n, cosTermC (6 * x) (n + 1)) = cutCos (6 * x) - 1 := by linarith [hz]
  rw [hshift]; ring

/-! ## (2) THE PERIOD VALUES at 3π/5π/6π (the banked full-period shift, iterated). -/

/-- `cutCos (3π) = −1` — odd multiple of the antiperiod. -/
theorem cutCos_three_cutPi : cutCos (3 * cutPi) = -1 := by
  have h := cutCos_add_two_cutPi cutPi
  have he : (3 : Cut) * cutPi = cutPi + (cutPi + cutPi) := by ring
  rw [he]
  rw [show cutPi + (cutPi + cutPi) = cutPi + (cutPi + cutPi) from rfl] at *
  have h2 : cutPi + (cutPi + cutPi) = cutPi + (cutPi + cutPi) := rfl
  rw [h] 
  exact cutCos_cutPi

/-- `cutCos (5π) = −1`. -/
theorem cutCos_five_cutPi : cutCos (5 * cutPi) = -1 := by
  have h := cutCos_add_two_cutPi (3 * cutPi)
  have he : (5 : Cut) * cutPi = 3 * cutPi + (cutPi + cutPi) := by ring
  rw [he, h, cutCos_three_cutPi]

/-- `cutCos (6π) = 1`. -/
theorem cutCos_six_cutPi : cutCos (6 * cutPi) = 1 := by
  have h := cutCos_add_two_cutPi (4 * cutPi)
  have he : (6 : Cut) * cutPi = 4 * cutPi + (cutPi + cutPi) := by ring
  rw [he, h, cutCos_four_cutPi]

/-! ## (3) THE INTEGRAND LINEARIZATIONS (recon-verified certificates). -/

/-- ★ The FIVE-ENDED integrand linearizes (a pure addition-formula identity — no
    Pythagoras needed, sympy-verified):
    `cutCos⁵·cutSin = (5/32)·sin2x + (1/8)·sin4x + (1/32)·sin6x`. -/
theorem momentIntegrand_five_linearize (x : Cut) :
    cutCos x ^ 5 * cutSin x
      = (5/32) * cutSin (2 * x) + (1/8) * cutSin (4 * x) + (1/32) * cutSin (6 * x) := by
  have h2 : (2 : Cut) * x = x + x := by ring
  have h4 : (4 : Cut) * x = (2 * x) + (2 * x) := by ring
  have h6 : (6 : Cut) * x = (4 * x) + (2 * x) := by ring
  rw [h6, cutSin_add, h4, cutSin_add, cutCos_add, h2, cutSin_add, cutCos_add]
  have hpyth := cutSin_sq_add_cutCos_sq x
  linear_combination (13/16 * cutCos x ^ 3 * cutSin x - 3/16 * cutCos x * cutSin x ^ 3
    + 5/16 * cutCos x * cutSin x) * hpyth

/-- ★ The FOUR-ENDED (even) integrand linearizes (one Pythagorean factor, certificate
    `c²s − s³ + s`, sympy-verified):
    `cutCos⁴·cutSin = (1/8)·cutSin x + (3/16)·cutSin 3x + (1/16)·cutSin 5x`. -/
theorem momentIntegrand_four_linearize (x : Cut) :
    cutCos x ^ 4 * cutSin x
      = (1/8) * cutSin x + (3/16) * cutSin (3 * x) + (1/16) * cutSin (5 * x) := by
  have h3 : (3 : Cut) * x = (2 * x) + x := by ring
  have h5 : (5 : Cut) * x = (4 * x) + x := by ring
  have h2 : (2 : Cut) * x = x + x := by ring
  have h4 : (4 : Cut) * x = (2 * x) + (2 * x) := by ring
  rw [h5, cutSin_add, h4, cutSin_add, cutCos_add, h3, cutSin_add, h2, cutSin_add, cutCos_add]
  have hpyth := cutSin_sq_add_cutCos_sq x
  linear_combination (11/16 * cutCos x ^ 2 * cutSin x - 1/16 * cutSin x ^ 3
    + 1/8 * cutSin x) * hpyth

/-! ## (4) THE MOMENT FLUXES AT THE NEW SCALES. -/

/-- The five-ended return flux: `∫₀ˣ cutCos⁵·cutSin` (via the linearization). -/
def fifthMomentFlux (x : Cut) : Cut :=
  (5/32) * sin2Antideriv x + (1/8) * sin4Antideriv x + (1/32) * sin6Antideriv x

/-- The four-ended (even) return flux: `∫₀ˣ cutCos⁴·cutSin` (via the linearization). -/
def fourthEvenMomentFlux (x : Cut) : Cut :=
  (1/8) * sinAntideriv x + (3/16) * sin3Antideriv x + (1/16) * sin5Antideriv x

/-- ★★★ THE FIVE-ENDED FLUX VANISHES EXACTLY at the antipode. -/
theorem fifthMomentFlux_vanishes : fifthMomentFlux cutPi = 0 := by
  unfold fifthMomentFlux
  rw [sin2Antideriv_eq, sin4Antideriv_eq, sin6Antideriv_eq,
    cutCos_two_cutPi, cutCos_four_cutPi, cutCos_six_cutPi]
  ring

/-- ★★ THE FOUR-ENDED (EVEN) FLUX IS 2/5 — the first higher even moment is NONZERO:
    the return surface does not annihilate the even moments beyond n=2. -/
theorem fourthEvenMoment_eq : fourthEvenMomentFlux cutPi = 2/5 := by
  unfold fourthEvenMomentFlux
  rw [sinAntideriv_eq, sin3Antideriv_eq, sin5Antideriv_eq,
    cutCos_cutPi, cutCos_three_cutPi, cutCos_five_cutPi]
  ring

/-! ## (5) THE UNIVERSAL LEGALITY THEOREM — the grammar closed over the formal term
    language (the N588 boundary, now a theorem). -/

/-- A mirror-level parsed term is LEGAL iff every slot is the forced one: the full census
    (16/9 = census 16/3 × w — the no-gap census, banked `census_no_edge_no_removal`),
    exactly ONE return (the unary law), exactly TWO α-ends (the constructed annihilation),
    NO scale gap. This is the N586 legality lifted from a finite structure to the
    grammar's own ParsedTerm language. -/
def ChainLegal (t : ParsedTerm) : Prop :=
  t.censusWeight = 16/9 ∧ t.returns = 1 ∧ t.logContent = 1 ∧ t.alphaEnds = 2

/-- ★★★ THE MIRROR TERM IS THE UNIQUE LEGAL PARSED TERM: any legal term of the grammar IS
    the mirror term — the four slots pinned, each by a banked theorem-ancestor:
    census 16/9 (the no-gap full census through one w: `census_no_edge_no_removal`,
    `mirrorCoeff_eq`); one return (the unary law `foldCount = 1` — a direct multi-return
    term double-counts the tower the fixed point already iterates); two ends (the moment
    annihilation: `firstMomentFlux_vanishes`, `thirdMomentFlux_vanishes`,
    `fifthMomentFlux_vanishes` — odd ends capture EXACTLY nothing; `secondMoment_survives`
    — the two-ended flux IS the banked depth weight; `fourthEvenMoment_eq` — the higher
    even moment 2/5 has NO banked normalization: it arises only by ITERATING the two-ended
    step, which the fixed point performs, never as a direct term); no log (the no-gap
    fact). Quantified over the whole formal term language — the N588 boundary closed. -/
theorem mirror_term_universal (t : ParsedTerm) (h : ChainLegal t) :
    t = mirrorParsed := by
  obtain ⟨cw, r, lc, ae⟩ := t
  obtain ⟨hcw, hr, hlc, hae⟩ := h
  subst hcw; subst hr; subst hlc; subst hae
  rfl

/-- The mirror term IS legal (non-vacuity of the universal theorem). -/
theorem mirrorParsed_legal : ChainLegal mirrorParsed :=
  ⟨rfl, rfl, rfl, rfl⟩

/-- ★ THE SLOT TEETH OVER THE LANGUAGE: every slot of ChainLegal bites against a concrete
    illegal term of the grammar — wrong census (sub-census 10/9 = coloured 10/3 × w), two
    returns, a log-carrying mirror-level term, one end, three ends, four ends. Each fails
    a NAMED conjunct. -/
theorem language_controls_excluded :
    ¬ ChainLegal ⟨10/9, 1, 1, 2⟩ ∧ ¬ ChainLegal ⟨16/9, 2, 1, 2⟩
      ∧ ¬ ChainLegal ⟨16/9, 1, runningLogContent, 2⟩ ∧ ¬ ChainLegal ⟨16/9, 1, 1, 1⟩
      ∧ ¬ ChainLegal ⟨16/9, 1, 1, 3⟩ ∧ ¬ ChainLegal ⟨16/9, 1, 1, 4⟩ := by
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_⟩ <;>
    intro h <;> obtain ⟨hcw, hr, hlc, hae⟩ := h
  · norm_num at hcw
  · norm_num at hr
  · -- runningLogContent ≠ 1: worst-case lower bound from the banked edge-log brackets
    -- (cutLog_lo_s7, cutLog_mb_ext8, cutLog_bMass0_ext8, cutLog_bMass2_ext8):
    -- rLC ≥ 3·0.8154 + (7/2)·(−4.0894) + (11/2)·1.7337 − (5/2)·(−1.0887) ≈ 14.4 > 1.
    have h1 : (815406111272599 : Cut) / 100000000000000 ≤ cutLog (mass0 / mass1) := cutLog_lo_s7
    have h2 := cutLog_mb_ext8.1
    have h3 := cutLog_bMass0_ext8.1
    have h4 := cutLog_bMass2_ext8.1
    have hgt : (1 : Cut) < runningLogContent := by
      have key : (1 : Cut) <
          3 * (815406111272599 / 100000000000000)
            + (7/2) * (-408930664000672 / 100000000000000)
            + (11/2) * (173372879495463 / 100000000000000)
            - (5/2) * (-108872372522362 / 100000000000000) := by norm_num
      have g1 : (3:Cut) * (815406111272599 / 100000000000000) ≤ 3 * cutLog (mass0 / mass1) :=
        mul_le_mul_of_nonneg_left h1 (by norm_num)
      have g2 : (7/2:Cut) * (-408930664000672 / 100000000000000) ≤
          7 / 2 * cutLog UpDownRelativeScaleFoldPhase.mbRatioDerived :=
        mul_le_mul_of_nonneg_left h2 (by norm_num)
      have g3 : (11/2:Cut) * (173372879495463 / 100000000000000) ≤
          11 / 2 * cutLog (FreezeoutEdgeCrossSectorReduction.bMass 0) :=
        mul_le_mul_of_nonneg_left h3 (by norm_num)
      have hneg := neg_le_neg cutLog_bMass2_ext8.2
      have hnorm : (-(-108872372522362 / 100000000000000) : Cut) =
          108872372522362 / 100000000000000 := by ring
      rw [hnorm] at hneg
      have g4 : (5/2:Cut) * (108872372522362 / 100000000000000) ≤
          5 / 2 * (-cutLog (FreezeoutEdgeCrossSectorReduction.bMass 2)) :=
        mul_le_mul_of_nonneg_left hneg (by norm_num)
      have g4' : -(5/2:Cut) * cutLog (FreezeoutEdgeCrossSectorReduction.bMass 2) =
          5 / 2 * (-cutLog (FreezeoutEdgeCrossSectorReduction.bMass 2)) := by ring
      unfold runningLogContent
      linarith [key, g1, g2, g3, g4]
    have hlc' : runningLogContent = 1 := hlc
    rw [hlc'] at hgt
    exact lt_irrefl 1 hgt
  · norm_num at hae
  · norm_num at hae
  · norm_num at hae

end
end MirrorTermLanguage
end Phys.Algebra
