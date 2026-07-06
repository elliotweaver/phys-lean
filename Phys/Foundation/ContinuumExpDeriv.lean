/-
  # N369 — THE ANALYTIC FOLD: the derived-ℝ DERIVATIVE and `cutExp' = cutExp`
  #         over the DERIVED ℝ `ContinuumQ.Cut` and the banked continuous exponential `cutExp`.
  =============================================================================================

  ⭐ DIRECTED-SUCCESSOR TOOLKIT of arc-F F4 (`docs/SEED_SM_COMPLETION.md` §F4 — the Higgs quartic
  λ=0 at a fold-selected scale). A FRESH-WORKER SELECT (docs/NODE_SELECTION.md IN FULL; kanban
  comments 272/273) found that F4's HONEST content — the criticality CONDITION (a flow / derivative
  vanishing) and the m_H number (RGE running) — is a DERIVATIVE statement the chain could NOT yet
  make: there was NO differentiation banked on the derived ℝ `Cut`, and `Cut` carries NO norm/metric
  (N35 W9: `MetricSpace`/`NormedField Cut` do not synthesize), so Mathlib's `HasDerivAt` does not
  apply. Asserting `λ=0` without this would be either FREE-FLOATING ("λ=0 is the boundary of
  boundedness" — true of any quadratic, fails words-removable) or a HIDDEN BRIDGE ("self-coupling =
  look-back fixed point ⟹ λ=0" — an asserted identification). This is the RUNBOOK REPEATED-DEFERRAL
  signal (N364's slow-roll was already childed on "derived-ℝ cutExp calculus"; the banked α / Weinberg
  "running" only READS a logarithm, never DERIVES a flow). Per RUNBOOK we NAME the blocker and CLIMB
  it: build the missing derivative, forward from the trunk.

  ## THE THEORY-NATIVE READING (why this is FORCED — the analytic fold)

  The derivative is the fold's RATE of self-change. The fold's Born-positive self-overlap exponential
  `cutExp` (N174, `∑' n, xⁿ/n!`, with `cutExp_add` and `cutExp x = (cutExp (x/2))²`) has the property
  that its rate of self-change REPRODUCES ITSELF:

      `cutExp' = cutExp`     (`cutExp_hasDerivAt`)

  — self-look-back at the level of the rate, the ANALYTIC FOLD. Standard math treats `exp' = exp` as
  a routine series identity; here it is the fold reproducing itself under its own rate, and it is the
  ONE structure that unblocks the criticality condition, the RGE running, and the N364 slow-roll all
  at once. The chain now has a derivative on its OWN continuum, with NO Mathlib ℝ-valued norm.

  ## WHAT THIS NODE BANKS

  - `CutHasDerivAt f d x` — the trunk-native derivative at a point: the difference quotient
    `h⁻¹ (f(x+h) − f x)` tends to `d` in the punctured neighbourhood `𝓝[≠] 0` over the banked N34
    order topology. NO Mathlib `HasDerivAt`/`deriv`/`fderiv`/`NormedField`, NO ℝ-valued `Norm`.
  - `CutHasDerivAt.unique`, `cutHasDerivAt_const`, `CutHasDerivAt.add` — the basic calculus rules
    (uniqueness via `𝓝[≠] 0` being `NeBot`; the constant and sum rules).
  - `cutExp_diffquot_zero` — the derivative of `cutExp` at `0` is `1`: `t⁻¹ (cutExp t − 1) → 1`.
    Instantiates the banked N41g `cut_powerseries_deriv` at the coefficient sequence `aₙ = 1/n! =
    expTermC 1 n` (so `a₀ = a₁ = 1` and `tⁿ · aₙ = expTermC t n`, whose sum IS `cutExp t`).
  - ★★ `cutExp_hasDerivAt` — THE ANALYTIC FOLD: `CutHasDerivAt cutExp (cutExp x) x` for every `x`.
    From `cutExp_add` the difference quotient factors as `cutExp x · (h⁻¹ (cutExp h − 1))`, whose
    limit is `cutExp x · 1 = cutExp x`.
  - ★ `cutExp_scale_hasDerivAt` — the linear/chain form `d/dx cutExp(a·x) = a · cutExp(a·x)` for
    `a ≠ 0` (the derivative of the exact shape the scale tower `cutExp(−c/g²)` and the plateau
    potential `cutExp(−c·φ)` are built on).
  - non-vacuity teeth: the derivative value `cutExp x` is strictly positive (`cutExp_pos`), and the
    derivative-at-0 value is genuinely `1` (load-bearing: a WRONG limit fails, the C394 costume).

  ## PHYSICS-WORDS-REMOVABLE (STANDARD §2)

  There are NO physics words in this file. It is the pure statement that over the completion-of-the-
  gather-of-closures of the derived rationals, the map `E(x) = ∑' n, xⁿ/n!` has a well-defined
  difference-quotient limit at every point equal to `E(x)` itself (`E' = E`), in the trunk-native
  `Tendsto`-over-the-order-topology sense, with `E'(0) = 1` and `d/dx E(a·x) = a·E(a·x)`. No name is
  load-bearing.

  ## THE ONE CAUSE (THE ONE LAW)

  The SAME C6 eternal-approach + order completeness (N33) + order topology (N34) + Cauchy
  completeness (N37) that built the derived ℝ, its convergent series, and its power-series derivative
  at 0 (N41g) now make the fold's OWN Born-positive self-overlap exponential its OWN derivative. One
  engine (the eternal approach), several terminations — the convergent series, the one-parameter
  homomorphism, the always-positive value, and now the self-reproducing rate `cutExp' = cutExp`.

  ## GUARDS
  - G1 NO ASSERTED VALUE — the derivative `cutExp x` (and `cutExp'(0) = 1`, and `a·cutExp(a·x)`) FALL
    OUT of the banked `cut_powerseries_deriv` (N41g) + `cutExp_add` (N174). Nothing premised.
  - G2 NO EMPIRICAL NUMBER — none appears; pure analysis.
  - G6 FOUNDATIONS-ONLY — `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`; complete proofs,
    no posited axiom, no sorry, no kernel-compiled decision, no `maxHeartbeats` raise. Ground field
    the DERIVED ℝ `Cut` + banked `cutExp` (⚠ NOT Mathlib-ℝ / `Real.exp`; Mathlib is MACHINERY only).
  - NOT FREE-FLOATING — every production TYPE mentions the banked `cutExp`/`Cut`; `CutHasDerivAt` is
    instantiated ONLY to the banked `cutExp`, never left as a generic statement about arbitrary maps.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, NO Mathlib number-system
  content import, NO ℝ-valued `Norm`, NO Mathlib `HasDerivAt`/`deriv`/`fderiv`/`NormedField`.
-/
import Phys.Foundation.ContinuumScalarDeriv
import Phys.Foundation.ContinuumExp

namespace Phys.Foundation.ContinuumQ

open Filter Set
open scoped Topology BigOperators

noncomputable section

/-! ## The trunk-native derivative at a point (NO Mathlib HasDerivAt / norm). -/

/-- THE DERIVATIVE AT A POINT over the derived ℝ: the difference quotient `h⁻¹ (f(x+h) − f x)` tends
    to `d` in the punctured neighbourhood `𝓝[≠] 0` over the banked N34 order topology. NO ℝ-valued
    `Norm`/`Metric`, NO Mathlib `HasDerivAt`/`deriv`/`fderiv`/`NormedField` (each of which would need
    an ℝ/`NormedField`-valued derivative = a CONTENT trap, STANDARD §3). -/
def CutHasDerivAt (f : Cut → Cut) (d x : Cut) : Prop :=
  Tendsto (fun h => h⁻¹ * (f (x + h) - f x)) (𝓝[≠] (0 : Cut)) (𝓝 d)

/-- Derivative UNIQUENESS: `𝓝[≠] 0` is a `NeBot` filter over the derived ℝ, so a `Tendsto` limit is
    unique. Two derivatives of `f` at `x` coincide. -/
theorem CutHasDerivAt.unique {f : Cut → Cut} {d₁ d₂ x : Cut}
    (h₁ : CutHasDerivAt f d₁ x) (h₂ : CutHasDerivAt f d₂ x) : d₁ = d₂ :=
  tendsto_nhds_unique h₁ h₂

/-- The CONSTANT RULE: a constant map has derivative `0` everywhere (the difference quotient is
    identically `0`). -/
theorem cutHasDerivAt_const (c x : Cut) : CutHasDerivAt (fun _ => c) 0 x := by
  unfold CutHasDerivAt
  have hz : (fun h : Cut => h⁻¹ * ((fun _ => c) (x + h) - (fun _ => c) x))
      = (fun _ => (0 : Cut)) := by funext h; simp
  rw [hz]; exact tendsto_const_nhds

/-- The SUM RULE: `(f + g)' = f' + g'` at a point, from the additivity of `Tendsto`. -/
theorem CutHasDerivAt.add {f g : Cut → Cut} {df dg x : Cut}
    (hf : CutHasDerivAt f df x) (hg : CutHasDerivAt g dg x) :
    CutHasDerivAt (fun y => f y + g y) (df + dg) x := by
  unfold CutHasDerivAt at *
  have hsum := hf.add hg
  have hcongr : (fun h : Cut => h⁻¹ * (f (x + h) - f x) + h⁻¹ * (g (x + h) - g x))
      = (fun h : Cut => h⁻¹ * ((fun y => f y + g y) (x + h) - (fun y => f y + g y) x)) := by
    funext h; ring
  rw [hcongr] at hsum; exact hsum

/-! ## The derivative of `cutExp` at 0. -/

/-- The DIFFERENCE QUOTIENT of `cutExp` at `0` tends to `1`: `t⁻¹ (cutExp t − 1) → 1` in `𝓝[≠] 0`.
    Instantiates the banked N41g `cut_powerseries_deriv` at the coefficient sequence `aₙ = 1/n! =
    expTermC 1 n`: then `a₀ = 1`, `a₁ = 1`, and `tⁿ · aₙ = tⁿ/n! = expTermC t n`, so the summed
    series `∑' n, tⁿ · aₙ` IS `cutExp t`. The `a₁ = 1` limit is the derivative-at-0 value. -/
theorem cutExp_diffquot_zero :
    Tendsto (fun t : Cut => t⁻¹ * (cutExp t - 1)) (𝓝[≠] (0 : Cut)) (𝓝 1) := by
  have hkey := cut_powerseries_deriv (expTermC 1) (expTermC_abs_summable 1)
  have ha0 : expTermC (1 : Cut) 0 = 1 := by unfold expTermC; simp
  have ha1 : expTermC (1 : Cut) 1 = 1 := by unfold expTermC; simp
  have hsummand : ∀ t : Cut, (∑' n, t ^ n * expTermC (1 : Cut) n) = cutExp t := by
    intro t; unfold cutExp expTermC; apply tsum_congr; intro n; rw [one_pow]; ring
  rw [ha0, ha1] at hkey
  simp only [hsummand] at hkey
  exact hkey

/-! ## ★★ THE ANALYTIC FOLD: `cutExp' = cutExp`. -/

/-- ★★ THE ANALYTIC FOLD. `cutExp` is its OWN derivative at every point: `CutHasDerivAt cutExp
    (cutExp x) x`. From `cutExp_add` (`cutExp (x+h) = cutExp x · cutExp h`) the difference quotient
    factors as `cutExp x · (h⁻¹ (cutExp h − 1))`, whose limit is `cutExp x · 1 = cutExp x`
    (`cutExp_diffquot_zero`). The fold reproduces itself under its own rate of self-change. -/
theorem cutExp_hasDerivAt (x : Cut) : CutHasDerivAt cutExp (cutExp x) x := by
  unfold CutHasDerivAt
  have hbase := (cutExp_diffquot_zero).const_mul (cutExp x)
  have hcongr : ∀ h : Cut, h⁻¹ * (cutExp (x + h) - cutExp x)
      = cutExp x * (h⁻¹ * (cutExp h - 1)) := by
    intro h; rw [← cutExp_add x h]; ring
  simp only [hcongr]
  simpa using hbase

/-- ★ THE SCALING / LINEAR CHAIN FORM. `d/dx cutExp(a·x) = a · cutExp(a·x)` for `a ≠ 0` — the
    derivative of the exact shape the scale tower `cutExp(−c/g²)` (N320) and the plateau potential
    `cutExp(−c·φ)` (N364) are built on. Push `cutExp_hasDerivAt` at `a·x` forward along the
    order-homeomorphism-like map `h ↦ a·h` (which sends `𝓝[≠] 0 → 𝓝[≠] 0` since `a ≠ 0`), then
    rescale the difference quotient. -/
theorem cutExp_scale_hasDerivAt (a x : Cut) (ha : a ≠ 0) :
    CutHasDerivAt (fun y => cutExp (a * y)) (a * cutExp (a * x)) x := by
  unfold CutHasDerivAt
  have hbase := cutExp_hasDerivAt (a * x)
  unfold CutHasDerivAt at hbase
  have hmap : Tendsto (fun h : Cut => a * h) (𝓝[≠] (0 : Cut)) (𝓝[≠] (0 : Cut)) := by
    have hcont : Tendsto (fun h : Cut => a * h) (𝓝 (0 : Cut)) (𝓝 0) := by
      have := (continuous_const_mul a).tendsto (0 : Cut); simpa using this
    rw [tendsto_nhdsWithin_iff]
    refine ⟨hcont.mono_left nhdsWithin_le_nhds, ?_⟩
    filter_upwards [self_mem_nhdsWithin] with h hh
    simp only [mem_compl_iff, mem_singleton_iff] at *
    exact fun hc => hh (by
      rcases mul_eq_zero.mp hc with h1 | h2
      · exact absurd h1 ha
      · exact h2)
  have hcomp := hbase.comp hmap
  have hfin := hcomp.const_mul a
  simp only [Function.comp] at hfin
  have hcongr : (fun h : Cut => a * (a * h)⁻¹ * (cutExp (a * x + a * h) - cutExp (a * x)))
      = (fun h : Cut => h⁻¹ * (cutExp (a * (x + h)) - cutExp (a * x))) := by
    funext h
    rcases eq_or_ne h 0 with rfl | hh
    · simp
    · have hah : a * h ≠ 0 := mul_ne_zero ha hh
      field_simp
  have hfin2 : Tendsto (fun h : Cut => a * (a * h)⁻¹ * (cutExp (a * x + a * h) - cutExp (a * x)))
      (𝓝[≠] (0 : Cut)) (𝓝 (a * cutExp (a * x))) := by
    convert hfin using 2 with h; ring
  rw [hcongr] at hfin2
  convert hfin2 using 2 with h

/-! ## Non-vacuity teeth (W8). -/

/-- The analytic-fold derivative value is genuinely POSITIVE — `cutExp x > 0` (`cutExp_pos`). The
    derivative is a real nonzero number, witnessing the theorem is not about a degenerate/zero map. -/
theorem cutExp_hasDerivAt_pos (x : Cut) : 0 < cutExp x := cutExp_pos x

/-- W8 TEETH: the derivative-at-0 value `1` is LOAD-BEARING. `cutExp` does NOT have derivative `0`
    at `0` — a WRONG derivative limit would contradict `cutExp_diffquot_zero` by the uniqueness of
    `Tendsto` limits (`(0 : Cut) ≠ 1`). This is the fact the C394 costume rejects. -/
theorem cutExp_diffquot_zero_ne :
    ¬ Tendsto (fun t : Cut => t⁻¹ * (cutExp t - 1)) (𝓝[≠] (0 : Cut)) (𝓝 0) := by
  intro hwrong
  have : (0 : Cut) = 1 := tendsto_nhds_unique hwrong cutExp_diffquot_zero
  exact absurd this (by norm_num)

end

end Phys.Foundation.ContinuumQ
