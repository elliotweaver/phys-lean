/-
  # N328 — THE DERIVED GAUSS-SPHERE RETURN-ACTION FLUX MEASURE over the DERIVED ℝ `ContinuumQ.Cut`:
  #         the meridian-flux integration primitive + the 2-sphere solid-angle `= 4·cutPi`.

  N323 (`ContinuumTrig`) banked the derived circular functions `cutCos`/`cutSin` with the Born-unit-circle
  Pythagorean identity; N324 (`ContinuumTrigAdd`) banked the addition formulas; N325 (`ContinuumTrigPi`)
  CONSTRUCTED `cutPi` and banked the periodicity, whose LOAD-BEARING landing is the HALF-TURN antipode
  `cutCos cutPi = −1`. THIS file builds the next genuinely-missing number-tower PRIMITIVE the scale
  tower needs: the DERIVED-ℝ INTEGRATION of the sine series (the antiderivative-difference form of
  `∫₀ˣ cutSin`), and from it the 2-SPHERE SOLID ANGLE, assembled — NOT posited — from the derived
  meridian flux and the derived azimuthal turn. It extends the banked 1-D angle `cutPi` to the first
  2-dimensional return-surface flux measure.

  ★ WHY THIS IS NOT A POSIT (STANDARD §3 — THE NUMBER-TOWER GATE). Nothing here imports `Real.pi`, a
  Mathlib sphere-measure, or a Mathlib interval-integral as CONTENT. The integration is the W9
  STRUCTURAL REDUCTION (the antiderivative-difference, NO Lebesgue apparatus): term-by-term, the
  antiderivative of `sinTermC x m = (-1)ᵐ x^(2m+1)/(2m+1)!` is `(-1)ᵐ x^(2m+2)/(2m+2)!`, which is
  EXACTLY `− cosTermC x (m+1)`. Summing (a shift of the BANKED cosine summability, N323) gives the
  closed form `sinAntideriv x = 1 − cutCos x` — the fundamental theorem of calculus in its
  antiderivative-difference form `∫₀ˣ cutSin = −(cutCos x − cutCos 0)`, with every object a `tsum`
  over the Cauchy-complete derived `Cut`. The `4·cutPi` solid angle FALLS OUT of the derived integral
  (`sinAntideriv cutPi = 2` via the banked `cutCos cutPi = −1`) times the derived azimuthal full turn
  `2·cutPi` (the banked full period) — it is NEVER written as a literal.

  ★ THE THEORY-NATIVE READING (the fold's return surface). The fold's self-look-back CLOSES on a
  return surface (self-blindness has no nonzero fixed point — the probe returns without seeing itself).
  The 1-D Born-circle orbit `t ↦ (cutCos t, cutSin t)` gave the azimuthal angle `cutPi`; the next
  return surface accumulates the Born self-overlap over its MERIDIAN — the meridian flux `∫₀^cutPi
  cutSin` — whose value is FORCED by the half-turn antipode `cutCos cutPi = −1` to be `1 − (−1) = 2`.
  The 2-sphere solid angle is `(azimuthal full turn) × (meridian flux) = 2·cutPi · 2 = 4·cutPi` — the
  return-surface FLUX one dimension up from `cutPi`. This is the first rung of the Gauss-sphere flux
  measure the scale-tower exponent's numerator normalization requires (arc B / B2).

  ★ WHAT THIS DOES AND DOES NOT SETTLE. It BUILDS the derived integration primitive and the 2-sphere
  solid angle as a genuine derived analytic object. It DELIBERATELY does NOT claim the 2-sphere IS the
  fold's forced return surface (vs the 3-sphere `2π²` or the 4-sphere charge measure `8π²`), and it
  asserts NO gauge-dof count and NO transmutation coefficient. Which sphere dimension is forced, and
  the count that divides the flux, are the coupled question deferred to the successor node.

  ★ THE ONE CAUSE (THE ONE LAW). The SAME C6 order/Cauchy-completeness that built the derived ℝ, made
  its alternating series converge, closed the trig group law, and forced the least positive zero
  `cutPi` now integrates the sine series termwise and assembles the return-surface flux. One engine,
  one more termination.

  PHYSICS-WORDS-REMOVABLE (STANDARD §2): there are NO load-bearing physics words. Delete "Gauss-sphere",
  "flux", "meridian", "solid-angle", "return-action" and the file is the pure statement that over the
  completion-of-the-gather-of-closures of the derived rationals, the termwise antiderivative of the
  derived sine `S` satisfies `∫₀ˣ S = 1 − C(x)`, hence `∫₀^P S = 2` (via `C(P) = −1`), and
  `2·P · 2 = 4·P`. No name is load-bearing.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, NO Mathlib number-system
  content import, NO ℝ-valued `Norm`, NO `Real.cos`/`Real.sin`/`Real.pi`, NO Mathlib integral/sphere
  measure as content.
-/
import Phys.Foundation.ContinuumTrigPi

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set Finset
open scoped Topology BigOperators

noncomputable section

/-! ## (1) THE DERIVED-ℝ INTEGRATION PRIMITIVE for the sine series (the antiderivative-difference FTC). -/

/-- The `m`-th termwise antiderivative of the sine series: the integral of `sinTermC x m =
    (-1)ᵐ x^(2m+1)/(2m+1)!` from `0` to `x`, namely `(-1)ᵐ x^(2m+2)/(2m+2)!`. MACHINERY
    (`pow`/`div`/factorial cast) on the DERIVED `Cut`, NOT a posited integral. -/
def sinAntiderivTerm (x : Cut) (m : ℕ) : Cut :=
  (-1) ^ m * x ^ (2 * m + 2) / ((2 * m + 2).factorial : Cut)

/-- ★ THE KEY TERM IDENTITY: the `m`-th sine-antiderivative term is exactly `− cosTermC x (m+1)`.
    This is the termwise fundamental theorem of calculus `d/dx [−cosTermC x (m+1)] = sinTermC x m`
    read backwards — the antiderivative of the sine term is (minus) the next cosine term. -/
theorem sinAntiderivTerm_eq_neg_cosTermC (x : Cut) (m : ℕ) :
    sinAntiderivTerm x m = - cosTermC x (m + 1) := by
  unfold sinAntiderivTerm cosTermC
  have he : 2 * (m + 1) = 2 * m + 2 := by ring
  rw [he]
  have hsign : (-1 : Cut) ^ (m + 1) = -(-1) ^ m := by rw [pow_succ]; ring
  rw [hsign]; ring

/-- The antiderivative terms are summable over the derived ℝ — a shift of the BANKED cosine
    summability (N323), negated. NO new majorant. -/
theorem sinAntiderivTerm_summable (x : Cut) : Summable (sinAntiderivTerm x) := by
  have h : Summable (fun m => - cosTermC x (m + 1)) :=
    (((summable_nat_add_iff 1).mpr (cosTermC_summable x)).neg)
  refine h.congr ?_
  intro m; rw [sinAntiderivTerm_eq_neg_cosTermC]

/-- ★ THE DERIVED DEFINITE INTEGRAL `∫₀ˣ cutSin` over the derived ℝ, as the `tsum` of the termwise
    antiderivatives (the antiderivative vanishing at `0`). The derived-ℝ integration primitive the
    scale tower needs — a `tsum` over the Cauchy-complete `Cut`, NOT a Mathlib interval-integral. -/
def sinAntideriv (x : Cut) : Cut := ∑' m, sinAntiderivTerm x m

/-- ★★ THE FUNDAMENTAL THEOREM OF CALCULUS (antiderivative-difference form) over the derived ℝ:
    `∫₀ˣ cutSin = 1 − cutCos x`. The termwise antiderivatives sum to `∑' m, − cosTermC x (m+1)`,
    which is `−(cutCos x − cosTermC x 0) = −(cutCos x − 1) = 1 − cutCos x` by peeling the head term
    (`tsum_eq_zero_add`) of the BANKED cosine series. NO integral apparatus — pure `tsum` reindex. -/
theorem sinAntideriv_eq (x : Cut) : sinAntideriv x = 1 - cutCos x := by
  unfold sinAntideriv
  have hstep : (∑' m, sinAntiderivTerm x m) = ∑' m, - cosTermC x (m + 1) := by
    apply tsum_congr; intro m; rw [sinAntiderivTerm_eq_neg_cosTermC]
  rw [hstep, tsum_neg]
  have hz := (cosTermC_summable x).tsum_eq_zero_add
  have h0 : cosTermC x 0 = 1 := by unfold cosTermC; simp
  rw [h0] at hz
  have hcut : cutCos x = ∑' n, cosTermC x n := rfl
  rw [← hcut] at hz
  linarith [hz]

/-- The integral vanishes at the basepoint: `∫₀⁰ cutSin = 0`. -/
theorem sinAntideriv_zero : sinAntideriv 0 = 0 := by
  rw [sinAntideriv_eq, cutCos_zero]; ring

/-! ## (2) THE FULL-MERIDIAN FLUX AND THE 2-SPHERE SOLID ANGLE. -/

/-- ★★ THE FULL-MERIDIAN FLUX `∫₀^cutPi cutSin = 2`, FORCED by the banked half-turn antipode
    `cutCos cutPi = −1`: `1 − (−1) = 2`. The Born self-overlap accumulated over the meridian of the
    return surface, from basepoint to antipode. -/
theorem sinAntideriv_cutPi : sinAntideriv cutPi = 2 := by
  rw [sinAntideriv_eq, cutCos_cutPi]; ring

/-- The azimuthal full turn = the banked full period `2·cutPi`. -/
def azimuthalTurn : Cut := 2 * cutPi

/-- ★ THE 2-SPHERE SOLID ANGLE, assembled as (azimuthal full turn) × (meridian flux) — the derived
    return-surface flux measure one dimension up from the 1-D angle `cutPi`. NOT posited: it is the
    product of two DERIVED quantities. -/
def gaussSphereSolidAngle : Cut := azimuthalTurn * sinAntideriv cutPi

/-- ★★ THE DERIVED "4π": `gaussSphereSolidAngle = 4·cutPi`. It FALLS OUT of the derived meridian flux
    `= 2` (via the banked `cutCos cutPi = −1`) times the derived azimuthal turn `2·cutPi` — the
    2-sphere solid angle, DERIVED via the derived integral, NEVER written as a literal `4π`. -/
theorem gaussSphereSolidAngle_eq : gaussSphereSolidAngle = 4 * cutPi := by
  unfold gaussSphereSolidAngle azimuthalTurn
  rw [sinAntideriv_cutPi]; ring

/-- The solid angle is strictly positive (`cutPi > 0`). -/
theorem gaussSphereSolidAngle_pos : 0 < gaussSphereSolidAngle := by
  rw [gaussSphereSolidAngle_eq]; have := cutPi_pos; linarith

/-! ## NON-VACUITY (W8): the meridian flux is genuinely `2`, so the solid angle is `4·cutPi`, not the
    azimuthal turn `2·cutPi`. -/

/-- NON-VACUITY: the 2-sphere solid angle is NOT the azimuthal turn — the derived meridian flux is
    genuinely `2` (the half-turn antipode `cutCos cutPi = −1`), not `1`. A WRONG flux (`1`, i.e.
    `cutCos cutPi = 0`, no antipode) would collapse `4·cutPi` to `2·cutPi`. -/
theorem gaussSphereSolidAngle_ne_azimuthal : gaussSphereSolidAngle ≠ azimuthalTurn := by
  rw [gaussSphereSolidAngle_eq]; unfold azimuthalTurn
  have h := cutPi_pos; intro hcon; nlinarith [h]

/-- NON-VACUITY: the full-meridian flux is the concrete forced value `2` (not `0`, not `1`) —
    witnessing the return surface's meridian is a genuine half-turn accumulation. -/
theorem sinAntideriv_cutPi_eq_two : sinAntideriv cutPi = 2 := sinAntideriv_cutPi

end

end ContinuumQ
end Phys.Foundation
