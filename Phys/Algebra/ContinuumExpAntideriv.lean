/-
  # N379 — arc-H H1 (MACHINERY BUILD): the derived-ℝ `cutExp` ANTIDERIVATIVE —
  #         the INTEGRAL side of the analytic fold (the accumulated Born self-overlap flux).
  =============================================================================================
  Over the DERIVED ℝ `ContinuumQ.Cut`, the banked Born-positive self-overlap exponential `cutExp`
  (N174), and the banked trunk-native derivative `CutHasDerivAt` with the full calculus (N369 the
  analytic fold `cutExp' = cutExp` + the chain rule `cutExp_scale_hasDerivAt`; N370 the
  scalar-multiple / negation / subtraction / product rules). The directed single successor of N378
  (arc-G complete → arc-H H1).

  ⭐ SIXTH-ARC OWNER-AUTHORIZED SEED — COSMOLOGY COMPLETION, TARGET H1
  (`docs/SEED_COSMOLOGY_COMPLETION.md` §H1 — "the derived-ℝ `cutExp` calculus, a MACHINERY BUILD;
  discharges the N364 childed slow-roll debt"). A FRESH-WORKER SELECT (docs/NODE_SELECTION.md IN
  FULL; kanban comment 287) found that the DERIVATIVE side of this calculus is ALREADY banked
  (N369/N370), and that the one genuinely-missing integral-side primitive the slow-roll e-fold count
  needs is the ANTIDERIVATIVE of the fold's OWN exponential `cutExp`. N328 (`ContinuumSphereFlux`)
  already banked the FTC-antiderivative for the SINE series (`∫₀ˣ cutSin = 1 − cutCos x`); THIS node
  is the exact twin for `cutExp`.

  ## THE THEORY-NATIVE READING (why this is FORCED — the integral side of the analytic fold)

  N369 gave the DIFFERENTIAL side: the fold's rate of self-change reproduces itself,
  `cutExp' = cutExp` (the analytic fold). Its DUAL is the ACCUMULATED Born self-overlap flux from the
  fold-origin along a trajectory. Over the derived continuum, that accumulation is the definite
  integral of the fold's own Born-positive `cutExp`, and — because the antiderivative of `cutExp` is
  a shift of `cutExp` itself — it has the exact closed form

      `∫₀ˣ cutExp = cutExp x − 1`     (`expAntideriv_eq`)

  the accumulated self-overlap from the closure origin (where `cutExp 0 − 1 = 0`) outward. N328
  already established "definite integral = accumulated return-surface flux" for the circular
  functions; this is the same accumulation for the fold's OWN exponential — and the fundamental
  theorem of calculus closes the loop: this accumulated flux differentiates BACK to the integrand
  (`expAntideriv_hasDerivAt : CutHasDerivAt expAntideriv (cutExp x) x`).

  ## WHY THIS UNBLOCKS THE SLOW-ROLL (H2)

  The slow-roll parameters `ε = ½(V′/V)²` and `η = V″/V` are RATIOS of the banked plateau-potential
  derivatives (N370 `foldPotentialDeriv`, `foldPotentialDeriv_hasDerivAt`), needing NO integral. The
  ONLY integral the e-fold count `N = ∫ V/V′ dφ` needs is the SCALED exponential antiderivative
  `∫₀ˣ cutExp(a·t) dt = (cutExp(a·x) − 1)/a` (`expScaleAntideriv`, `expScaleAntideriv_hasDerivAt`).
  This node builds exactly that and no more (W4.5 sufficiency — not the trig antiderivative, not the
  logarithm derivative, which the plateau slow-roll does not use).

  ## WHAT THIS NODE BANKS

  - `expAntiderivTerm x n = x^(n+1)/(n+1)!` — the termwise antiderivative; it IS the next exp term
    (`expAntiderivTerm_eq_expTermC_succ : = expTermC x (n+1)`), summable by a shift of the banked
    `expTermC_summable`.
  - `expAntideriv x = ∑' n, expAntiderivTerm x n` — the derived-ℝ definite integral `∫₀ˣ cutExp` as
    the `tsum` of termwise antiderivatives (the accumulated flux vanishing at `0`), a `tsum` over the
    Cauchy-complete `Cut`, NOT a Mathlib interval-integral.
  - ★★ `expAntideriv_eq : ∫₀ˣ cutExp = cutExp x − 1` — the FTC antiderivative-difference form, by
    peeling the head term `expTermC x 0 = 1` of the banked exponential series (`tsum_eq_zero_add`).
    NO integral apparatus.
  - `expAntideriv_zero : ∫₀⁰ cutExp = 0` (accumulation from the origin is empty at the origin).
  - ★★ `expAntideriv_hasDerivAt : CutHasDerivAt expAntideriv (cutExp x) x` — the FUNDAMENTAL THEOREM
    OF CALCULUS: the accumulated flux differentiates back to the integrand `cutExp`.
  - `cutHasDerivAt_id : CutHasDerivAt (fun y => y) 1 x` — the identity-map derivative (the cheap
    helper the `−φ` term of the e-fold integral needs; unbanked until now).
  - `expScaleAntideriv a x = (cutExp(a·x) − 1)/a` — the SCALED e-fold integral `∫₀ˣ cutExp(a·t) dt`,
    tied to the base antiderivative by `expScaleAntideriv_eq_base` (`= expAntideriv(a·x)/a`, `a ≠ 0`).
  - ★ `expScaleAntideriv_hasDerivAt : CutHasDerivAt (fun y => expScaleAntideriv a y) (cutExp(a·x)) x`
    (`a ≠ 0`) — the exact integrand the slow-roll e-fold count consumes (chain rule + linearity).
  - `expAntideriv_ftc` — the capstone bundle (the difference form, vanishing at `0`, the FTC).
  - non-vacuity teeth (W8, C404): `expAntideriv_pos` (`0 < ∫₀ˣ cutExp` for `x > 0`) and the
    LOAD-BEARING `expAntideriv_zero_ne_cutExp_zero` (`∫₀⁰ cutExp = 0 ≠ 1 = cutExp 0` — the
    antiderivative genuinely VANISHES at the basepoint, distinguishing it from `cutExp` itself; a
    wrong "`∫₀ˣ cutExp = cutExp x`" that drops the `−1` would fail).

  ## PHYSICS-WORDS-REMOVABLE (STANDARD §2, G5)

  There are NO physics words in this file. Delete "flux / accumulated / e-fold / slow-roll /
  inflation": it is the pure statement that over the completion-of-the-gather-of-closures of the
  derived rationals, the `tsum` `∑' n, x^(n+1)/(n+1)!` equals `E(x) − 1` (with `E(x) = ∑' n, xⁿ/n!`),
  vanishes at `0`, has trunk-native difference-quotient derivative `E(x)`, and the scaled form
  `(E(a·x) − 1)/a` has derivative `E(a·x)`. No name is load-bearing.

  ## THE ONE CAUSE (THE ONE LAW)

  The SAME C6 eternal-approach + order completeness (N33) + order topology (N34) + Cauchy
  completeness (N37) that built the derived ℝ, made its exp series converge, and gave the fold's own
  rate reproducing itself (N369, the differential side) now gives the accumulated self-overlap flux
  (the integral side) and closes the FTC loop. One engine (the eternal approach), several
  terminations — the convergent series, the self-reproducing rate, and now the accumulated flux that
  differentiates back to the integrand.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, NO Mathlib number-system
  content import, NO ℝ-valued `Norm`, NO `Real.exp`/`Real.pi`, NO Mathlib `HasDerivAt`/`deriv`/
  `NormedField`, NO Mathlib integral/interval-integral as content. The field, the series, the limit,
  and the derivative are ALL the derived `Cut`.
-/
import Phys.Algebra.FoldPotentialCriticality

namespace Phys.Foundation.ContinuumQ

open Filter Set
open scoped Topology BigOperators

noncomputable section

/-! ## (1) The termwise antiderivative of the exponential series over the derived ℝ. -/

/-- The `n`-th termwise antiderivative of the exponential series: the integral of `expTermC x n =
    xⁿ/n!` from `0` to `x`, namely `x^(n+1)/(n+1)!`. MACHINERY (`pow`/`div`/factorial cast) on the
    DERIVED `Cut`, NOT a posited integral. -/
def expAntiderivTerm (x : Cut) (n : ℕ) : Cut :=
  x ^ (n + 1) / (((n + 1).factorial : ℕ) : Cut)

/-- ★ THE KEY TERM IDENTITY: the `n`-th exponential-antiderivative term is exactly the `(n+1)`-th
    exponential term `expTermC x (n+1)`. This is the termwise fundamental theorem of calculus
    `d/dx [x^(n+1)/(n+1)!] = xⁿ/n!` read backwards — the antiderivative of the `n`-th exp term is
    the `(n+1)`-th exp term. -/
theorem expAntiderivTerm_eq_expTermC_succ (x : Cut) (n : ℕ) :
    expAntiderivTerm x n = expTermC x (n + 1) := rfl

/-- The antiderivative terms are summable over the derived ℝ — a shift of the BANKED exponential
    summability (N174 `expTermC_summable`). NO new majorant. -/
theorem expAntiderivTerm_summable (x : Cut) : Summable (expAntiderivTerm x) := by
  have h : Summable (fun n => expTermC x (n + 1)) :=
    (summable_nat_add_iff 1).mpr (expTermC_summable x)
  exact h.congr (fun n => (expAntiderivTerm_eq_expTermC_succ x n).symm)

/-! ## (2) THE DERIVED DEFINITE INTEGRAL `∫₀ˣ cutExp` and the FTC difference form. -/

/-- ★ THE DERIVED DEFINITE INTEGRAL `∫₀ˣ cutExp` over the derived ℝ, as the `tsum` of the termwise
    antiderivatives (the accumulated Born self-overlap flux vanishing at `0`). The derived-ℝ
    integration primitive the slow-roll e-fold count needs — a `tsum` over the Cauchy-complete
    `Cut`, NOT a Mathlib interval-integral. -/
def expAntideriv (x : Cut) : Cut := ∑' n, expAntiderivTerm x n

/-- ★★ THE FUNDAMENTAL THEOREM OF CALCULUS (antiderivative-difference form) over the derived ℝ:
    `∫₀ˣ cutExp = cutExp x − 1`. The termwise antiderivatives sum to `∑' n, expTermC x (n+1)`, which
    is `(∑' n, expTermC x n) − expTermC x 0 = cutExp x − 1` by peeling the head term `expTermC x 0 =
    1` (`tsum_eq_zero_add`) of the BANKED exponential series. NO integral apparatus — pure `tsum`
    reindex. -/
theorem expAntideriv_eq (x : Cut) : expAntideriv x = cutExp x - 1 := by
  unfold expAntideriv
  have hstep : (∑' n, expAntiderivTerm x n) = ∑' n, expTermC x (n + 1) := by
    apply tsum_congr; intro n; exact expAntiderivTerm_eq_expTermC_succ x n
  rw [hstep]
  have hz := (expTermC_summable x).tsum_eq_zero_add
  have h0 : expTermC x 0 = 1 := by unfold expTermC; simp
  rw [h0] at hz
  have hcut : cutExp x = ∑' n, expTermC x n := rfl
  rw [← hcut] at hz
  linarith [hz]

/-- The integral vanishes at the basepoint: `∫₀⁰ cutExp = 0` (the accumulated flux from the origin
    is empty at the origin). -/
theorem expAntideriv_zero : expAntideriv 0 = 0 := by
  rw [expAntideriv_eq, cutExp_zero]; ring

/-- ★★ THE FUNDAMENTAL THEOREM OF CALCULUS (derivative form) over the derived ℝ: the accumulated
    flux `∫₀ˣ cutExp` differentiates BACK to the integrand `cutExp x`:
    `CutHasDerivAt expAntideriv (cutExp x) x`. Since `∫₀ˣ cutExp = cutExp x − 1` (`expAntideriv_eq`),
    it is `cutExp` plus a constant, whose derivative is `cutExp' = cutExp` (N369) plus `0` (the
    constant rule). -/
theorem expAntideriv_hasDerivAt (x : Cut) :
    CutHasDerivAt expAntideriv (cutExp x) x := by
  have hfun : expAntideriv = fun y => cutExp y + (-1 : Cut) := by
    funext y; rw [expAntideriv_eq]; ring
  rw [hfun]
  have h := (cutExp_hasDerivAt x).add (cutHasDerivAt_const (-1) x)
  simpa using h

/-! ## (3) THE IDENTITY-MAP DERIVATIVE (the cheap helper the `−φ` term of the e-fold integral needs). -/

/-- THE IDENTITY-MAP DERIVATIVE over the derived ℝ: `d/dx [x] = 1`, i.e.
    `CutHasDerivAt (fun y => y) 1 x`. The difference quotient `h⁻¹((x+h) − x) = h⁻¹·h = 1` on the
    punctured neighbourhood, whose limit is the constant `1`. -/
theorem cutHasDerivAt_id (x : Cut) : CutHasDerivAt (fun y => y) 1 x := by
  unfold CutHasDerivAt
  have h1 : Tendsto (fun _ : Cut => (1 : Cut)) (𝓝[≠] (0 : Cut)) (𝓝 1) := tendsto_const_nhds
  refine h1.congr' ?_
  filter_upwards [self_mem_nhdsWithin] with h hh
  simp only [mem_compl_iff, mem_singleton_iff] at hh
  have hxh : x + h - x = h := by ring
  rw [hxh]
  field_simp

/-! ## (4) THE SCALED e-fold integral `∫₀ˣ cutExp(a·t) dt = (cutExp(a·x) − 1)/a`. -/

/-- THE SCALED DEFINITE INTEGRAL `∫₀ˣ cutExp(a·t) dt = (cutExp(a·x) − 1)/a` — the exact integral the
    slow-roll e-fold count `N = ∫ V/V′ dφ` reduces to on the fold plateau (whose leading behaviour is
    governed by `cutExp(a·φ)`). Closed form on the derived `Cut`. -/
def expScaleAntideriv (a x : Cut) : Cut := (cutExp (a * x) - 1) / a

/-- The scaled integral is the base antiderivative at `a·x`, rescaled: `(cutExp(a·x) − 1)/a =
    (∫₀^{a·x} cutExp)/a` (`a ≠ 0`) — tying the closed form to the derived `tsum` integral. -/
theorem expScaleAntideriv_eq_base (a x : Cut) (_ha : a ≠ 0) :
    expScaleAntideriv a x = expAntideriv (a * x) / a := by
  unfold expScaleAntideriv
  rw [expAntideriv_eq]

/-- ★ THE SCALED FTC (derivative form): `d/dx [(cutExp(a·x) − 1)/a] = cutExp(a·x)` for `a ≠ 0` — the
    exact integrand the slow-roll e-fold count consumes. From the banked chain rule
    `cutExp_scale_hasDerivAt` (`d/dx cutExp(a·x) = a·cutExp(a·x)`), the constant rule, and the
    scalar-multiple rule (`·a⁻¹`), whose value collapses `a⁻¹·(a·cutExp(a·x)) = cutExp(a·x)`. -/
theorem expScaleAntideriv_hasDerivAt (a x : Cut) (ha : a ≠ 0) :
    CutHasDerivAt (fun y => expScaleAntideriv a y) (cutExp (a * x)) x := by
  have hscale := cutExp_scale_hasDerivAt a x ha
  have hsum := hscale.add (cutHasDerivAt_const (-1) x)
  have hcm := hsum.const_mul a⁻¹
  have hfun : (fun y => a⁻¹ * (cutExp (a * y) + (-1 : Cut)))
      = fun y => expScaleAntideriv a y := by
    funext y; unfold expScaleAntideriv; rw [div_eq_inv_mul]; ring_nf
  have hval : a⁻¹ * (a * cutExp (a * x) + 0) = cutExp (a * x) := by
    rw [add_zero, ← mul_assoc, inv_mul_cancel₀ ha, one_mul]
  rw [hfun, hval] at hcm
  exact hcm

/-! ## (5) THE CAPSTONE BUNDLE (the FTC on the derived ℝ). -/

/-- ★★ THE FUNDAMENTAL THEOREM OF CALCULUS on the derived ℝ, bundled: the accumulated flux
    `∫₀ˣ cutExp` equals `cutExp x − 1`, vanishes at the origin, and differentiates back to the
    integrand `cutExp x`. -/
theorem expAntideriv_ftc (x : Cut) :
    expAntideriv x = cutExp x - 1
      ∧ expAntideriv 0 = 0
      ∧ CutHasDerivAt expAntideriv (cutExp x) x :=
  ⟨expAntideriv_eq x, expAntideriv_zero, expAntideriv_hasDerivAt x⟩

/-! ## (6) NON-VACUITY TEETH (W8). -/

/-- The accumulated flux is strictly positive for `x > 0`: `∫₀ˣ cutExp = cutExp x − 1 > 0` because
    `1 + x ≤ cutExp x` (banked `one_add_le_cutExp`) and `x > 0`. -/
theorem expAntideriv_pos (x : Cut) (hx : 0 < x) : 0 < expAntideriv x := by
  rw [expAntideriv_eq]
  have h := one_add_le_cutExp x (le_of_lt hx)
  linarith

/-- ★ W8 TEETH (LOAD-BEARING): the accumulated flux genuinely VANISHES at the basepoint and so is
    NOT `cutExp` itself: `∫₀⁰ cutExp = 0 ≠ 1 = cutExp 0`. A wrong "`∫₀ˣ cutExp = cutExp x`" that
    dropped the `−1` FTC constant would fail. This is the fact the C404 costume rejects. -/
theorem expAntideriv_zero_ne_cutExp_zero : expAntideriv 0 ≠ cutExp 0 := by
  rw [expAntideriv_zero, cutExp_zero]; norm_num

end

end Phys.Foundation.ContinuumQ
