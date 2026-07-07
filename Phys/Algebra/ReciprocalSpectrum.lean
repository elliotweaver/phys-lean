/-
  Phys.Algebra.ReciprocalSpectrum — N423 (arc-O O8, per SEED_COMPLETION_SWEEP.md §O8).
  ============================================================================================
  THE {7,9,28} RECIPROCAL SPECTRUM — the scale-tower rung / RG-eigenvalue CROSS-ARC WELD.

  ── WHAT WAS ALREADY BANKED (so this node does NOT re-state it) ──
  The scaling ladder `λ_n = −n/(84·cutPi)` over a GENERIC index `n` is ALREADY a banked Lean
  theorem — N377 (`PathIntegral.scalingDim`, `scalingDim_eq`, `scalingDim_lock`,
  `scalingDim_nonpos`, `scalingDim_strictAnti`). Merely re-stating it would be free-floating
  redundancy. N332 (`ScaleTowerLadder`) named the piece that was DEFERRED and NOT built: "the
  {7,9,28} divisors as the relevant-direction eigenvalues `λ_n = −n/(84π)` of the one critical
  fixed point) is a B7 target — noted here as prose for the successor, NOT built." THIS node
  builds exactly that deferred piece.

  ── THE CLAIM (arc-O O8 — ONE SPECTRUM, TWO REGIMES) ──
  The fold has ONE critical-phase budget `criticalPhaseNumerator = 84·cutPi = 2·cutPi·42 = 2π/α*`
  (N329): the terminal algebra 𝕆 has `1/α* = 42` Born self-overlap channels (arc A), each closing
  one phase circle `azimuthalTurn = 2·cutPi` (N328). This ONE budget is divided by a structural
  count `n` in TWO OPPOSITE ways, and these two divisions are the two arcs:
    • (numerator) `rungExponent n = 84·cutPi / n` — the SCALE-HIERARCHY e-folds for a face with
      `n` units to complete its share of the budget (arc B, N329);
    • (denominator) `scalingDim n = −n / (84·cutPi)` — the RG EIGENVALUE of the `n`-th direction
      of the linearized totalization at the closure fixed point (arc G, N377).
  These two banked functions — defined in DIFFERENT modules for DIFFERENT purposes (arc B vs
  arc G) and NEVER before co-occurring in a single theorem — are exact RECIPROCALS through their
  shared budget:

      `rungExponent n · scalingDim n = −1`      (for `(n : Cut) ≠ 0`)      ★ the weld.

  Evaluated at the three banked structural counts `n ∈ {7, 9, 28}` (`finrank ℚ ImO`,
  `finrank ℚ spaceSub`, `finrank ℚ selfAdj`), the product is `−1` at every one; the three RG
  eigenvalues are `−7/(84π), −9/(84π), −28/(84π)`. Bundled with the banked universality tie
  `84 = 2/α*` (N314/G2 `scaleTowerNumerator_eq`), this is the "ONE spectrum, TWO regimes"
  capstone tying the scale tower (arc B), universality (G2), and renormalizability (G5, the
  ladder itself) to ONE derived number.

  ── THE FOLD-CAUSAL LINE ──
  fold → self-blindness (no nonzero fixed point, N1) → Born self-overlap positivity → 𝕆 has
  `42 = 1/α*` Born channels (arc A) → the phase circle closes at `2·cutPi` (N328) → the budget is
  `84·cutPi = 2·cutPi·42` (N329) → ONE count `n` divides that budget TWO ways (hierarchy e-folds
  `84π/n`, RG eigenvalue `−n/84π`) → the two are reciprocal → product `−1`. Each arrow forced;
  the `−1` is the mechanical shadow of "one number, two regimes."

  ── HONEST GRADE ──
  THEOREM for: the reciprocal weld `rungExponent n · scalingDim n = −1`, the reciprocal form
  `scalingDim n = −1/rungExponent n`, the three evaluations at the banked counts, the three
  explicit eigenvalues, the eigenvalue distinctness, and the bundled one-spectrum capstone with
  the shared budget and the universality tie. The `−1` becomes algebraically direct ONCE both
  banked functions are seen to share `criticalPhaseNumerator` — that SHARING is the content (if
  the two arcs used different budgets the product would NOT be `−1`), NOT the algebra. The
  face↔count matching (n=7 ↔ QCD `b₀`, n=9 ↔ electroweak F₄ dual-Coxeter face, n=28 ↔
  gravitational Spin(8) saturation channel) stays FLAGGED ladder-grade prose (as N329/N332
  flagged it), NEVER in any theorem statement. No empirical number in any proof.

  ── PHYSICS-WORDS-REMOVABLE (STANDARD §2) ──
  Delete "scale / hierarchy / RG / eigenvalue / universality / spectrum / coupling / rung": the
  theorems stand as pure statements over the derived ℝ `Cut` — `(criticalPhaseNumerator / n) ·
  (−n / criticalPhaseNumerator) = −1`, `−n/criticalPhaseNumerator = −1/(criticalPhaseNumerator/n)`,
  `criticalPhaseNumerator = 84·cutPi`, and `(84 : ℚ) = 2 / alphaStar`. No physics name does any
  logical work.

  ── NOT FREE-FLOATING (STANDARD §3) ──
  Every TYPE cites the banked derived objects: `rungExponent` (N329), `scalingDim` (N377),
  `criticalPhaseNumerator` (N329), `alphaStar` (N316), `finrank ℚ {ImO, spaceSub, selfAdj}`
  (N314/N43/N-tower). The weld is a CONCRETE fact about the two banked functions on the shared
  banked budget — NOT a generic statement about arbitrary reciprocals.

  Foundations-only: `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`. No posited axiom,
  no proof-hole tactic, no kernel-trust bypass, no heartbeat-ceiling raise, no asserted value.
  ℝ-vigilance: builds ONLY on the derived `Cut` + banked `rungExponent`/`scalingDim`/
  `criticalPhaseNumerator`/`alphaStar`/`finrank`; NO Mathlib real/complex number system as content.
-/
import Phys.Algebra.PathIntegralMeasureRenorm
import Phys.Algebra.ScaleTowerNumeratorLock
import Mathlib.Tactic

namespace Phys.Algebra.ReciprocalSpectrum

open Phys.Foundation.ContinuumQ
open Phys.Algebra
open Phys.Algebra.PathIntegral
open Phys.Algebra.Universality

noncomputable section

/-! ## §1 — THE WELD: the scale-tower rung and the RG eigenvalue are reciprocals of ONE budget. -/

/-- ★★★ THE RECIPROCAL WELD. The arc-B scale-tower rung exponent `rungExponent n = 84·cutPi / n`
    (the e-folds for a face with `n` units to complete its share of the budget, N329) and the
    arc-G RG scaling dimension `scalingDim n = −n / (84·cutPi)` (the `n`-th eigenvalue of the
    linearized totalization at the closure fixed point, N377) are EXACT RECIPROCALS: their product
    is `−1`. Two banked functions built in DIFFERENT arcs for DIFFERENT purposes, welded through
    the SAME banked budget `criticalPhaseNumerator`. The `−1` is the mechanical shadow of "one
    number, two regimes". -/
theorem rung_scaling_reciprocal (n : ℕ) (hn : (n : Cut) ≠ 0) :
    rungExponent n * scalingDim n = -1 := by
  unfold rungExponent scalingDim
  have hD : criticalPhaseNumerator ≠ 0 := ne_of_gt criticalPhaseNumerator_pos
  field_simp

/-- The reciprocal form: the RG eigenvalue is `−1` over the scale-tower rung. `scalingDim n =
    −1 / rungExponent n` — the eigenvalue and the hierarchy exponent are two faces of ONE budget. -/
theorem scalingDim_eq_neg_inv_rung (n : ℕ) (hn : (n : Cut) ≠ 0) :
    scalingDim n = -1 / rungExponent n := by
  have hD : criticalPhaseNumerator ≠ 0 := ne_of_gt criticalPhaseNumerator_pos
  unfold rungExponent scalingDim
  field_simp

/-! ## §2 — THE THREE RG EIGENVALUES at the banked structural counts {7, 9, 28}. -/

/-- ★ THE `n = dim ImO = 7` RG EIGENVALUE (physics prose: the QCD running-depth face): `λ₇ =
    −7/(84·cutPi)`. FALLS OUT of the banked `scalingDim_eq` and `finrank_ImO`. -/
theorem scalingDim_at_imO :
    scalingDim (Module.finrank ℚ ImO) = -(7 : Cut) / (84 * cutPi) := by
  rw [scalingDim_eq, finrank_ImO]; push_cast; ring

/-- ★ THE `n = dim spaceSub = 9` RG EIGENVALUE (physics prose: the electroweak F₄ dual-Coxeter
    face): `λ₉ = −9/(84·cutPi)`. FALLS OUT of `scalingDim_eq` and `finrank_spaceSub`. -/
theorem scalingDim_at_spaceSub :
    scalingDim (Module.finrank ℚ spaceSub) = -(9 : Cut) / (84 * cutPi) := by
  rw [scalingDim_eq, finrank_spaceSub]; push_cast; ring

/-- ★ THE `n = dim selfAdj = 28` RG EIGENVALUE (physics prose: the gravitational Spin(8)
    saturation channel): `λ₂₈ = −28/(84·cutPi)`. FALLS OUT of `scalingDim_eq` and
    `finrank_selfAdj_eq_28`. -/
theorem scalingDim_at_selfAdj :
    scalingDim (Module.finrank ℚ (bornBil).selfAdjointSubmodule) = -(28 : Cut) / (84 * cutPi) := by
  rw [scalingDim_eq, finrank_selfAdj_eq_28]; push_cast; ring

/-! ## §3 — THE WELD EVALUATED at the three banked counts: product `−1` at every rung. -/

/-- The weld at `n = dim ImO = 7`: `rungExponent 7 · scalingDim 7 = −1`. -/
theorem reciprocal_at_imO :
    rungExponent (Module.finrank ℚ ImO) * scalingDim (Module.finrank ℚ ImO) = -1 := by
  apply rung_scaling_reciprocal; rw [finrank_ImO]; norm_num

/-- The weld at `n = dim spaceSub = 9`: `rungExponent 9 · scalingDim 9 = −1`. -/
theorem reciprocal_at_spaceSub :
    rungExponent (Module.finrank ℚ spaceSub) * scalingDim (Module.finrank ℚ spaceSub) = -1 := by
  apply rung_scaling_reciprocal; rw [finrank_spaceSub]; norm_num

/-- The weld at `n = dim selfAdj = 28`: `rungExponent 28 · scalingDim 28 = −1`. -/
theorem reciprocal_at_selfAdj :
    rungExponent (Module.finrank ℚ (bornBil).selfAdjointSubmodule)
      * scalingDim (Module.finrank ℚ (bornBil).selfAdjointSubmodule) = -1 := by
  apply rung_scaling_reciprocal; rw [finrank_selfAdj_eq_28]; norm_num

/-! ## §4 — ★★★ THE ONE-SPECTRUM CAPSTONE (arc B + G2 + G5 in one statement). -/

/-- ★★★ THE ONE-SPECTRUM CAPSTONE. The three structural counts `{7, 9, 28}` give the SAME weld
    `rungExponent n · scalingDim n = −1` at every rung (the arc-B scale hierarchy and the arc-G RG
    eigenvalue are reciprocal), the shared budget IS the banked `84·cutPi = criticalPhaseNumerator`
    (N329, arc B), and that `84` IS the banked universality/renormalizability numerator `2/α*`
    (N314/G2 `scaleTowerNumerator_eq`). ONE derived number `84π = 2π/α*`, TWO regimes (scale
    hierarchies and RG critical scaling) — the spine tying the scale tower (B), universality (G2),
    and the renormalizability ladder (G5) into one spectrum. -/
theorem one_spectrum_three_counts :
    rungExponent (Module.finrank ℚ ImO) * scalingDim (Module.finrank ℚ ImO) = -1
    ∧ rungExponent (Module.finrank ℚ spaceSub) * scalingDim (Module.finrank ℚ spaceSub) = -1
    ∧ rungExponent (Module.finrank ℚ (bornBil).selfAdjointSubmodule)
        * scalingDim (Module.finrank ℚ (bornBil).selfAdjointSubmodule) = -1
    ∧ criticalPhaseNumerator = 84 * cutPi
    ∧ (84 : ℚ) = 2 / alphaStar :=
  ⟨reciprocal_at_imO, reciprocal_at_spaceSub, reciprocal_at_selfAdj,
   criticalPhaseNumerator_eq, (scaleTowerNumerator_eq).1⟩

/-! ## §5 — W8 NON-VACUITY: the weld genuinely bites; the spectrum is non-degenerate. -/

/-- ★★ W8 (the SIGN genuinely bites): the weld product is `−1`, GENUINELY NOT `+1`. A mis-reading
    where the RG eigenvalue carried the wrong sign (the "irrelevant directions are actually
    relevant" collapse) or where the two arcs used unrelated budgets (product `≠ −1`) would gut
    the reciprocal spectrum. The negative sign IS the fact that the higher directions are
    irrelevant (`scalingDim_nonpos`, N377). -/
theorem reciprocal_ne_one :
    rungExponent (Module.finrank ℚ ImO) * scalingDim (Module.finrank ℚ ImO) ≠ 1 := by
  rw [reciprocal_at_imO]; norm_num

/-- ★★ W8 (the spectrum is non-degenerate): the RG eigenvalues at the three counts are genuinely
    DISTINCT — `λ₇ ≠ λ₂₈` (`−7/(84π) ≠ −28/(84π)`). A degenerate reading collapsing all three to
    one eigenvalue would trivialize the three-count spectrum. -/
theorem eigenvalues_imO_ne_selfAdj :
    scalingDim (Module.finrank ℚ ImO)
      ≠ scalingDim (Module.finrank ℚ (bornBil).selfAdjointSubmodule) := by
  rw [scalingDim_at_imO, scalingDim_at_selfAdj]
  intro h
  have hpi := cutPi_pos
  have hden : (84 * cutPi : Cut) ≠ 0 := by positivity
  rw [div_eq_div_iff hden hden] at h
  nlinarith [hpi]

end

end Phys.Algebra.ReciprocalSpectrum
