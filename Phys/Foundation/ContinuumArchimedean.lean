/-
  # N35 — The ARCHIMEDEAN / C6-eternal-approach analytic foundation rung of the DERIVED ℝ

  N33 banked the derived ℝ `ContinuumQ.Cut` as a `ConditionallyCompleteLinearOrder`; N34 banked
  the standard ORDER TOPOLOGY on it (Heine–Borel, `IsTopologicalRing`). The automorphism group's
  one-parameter subgroups `exp(tD)` — the analytic half of the Lie-algebra ↔ Lie-group
  correspondence — ride the power series `exp(D) = ∑ Dⁿ/n!`, whose partial sums converge by the
  eternal approach of bounded monotone magnitudes. This file banks the FIRST analytic rung that
  convergence rests on, BELOW the metric/uniform structure: that the derived ℝ is ARCHIMEDEAN and
  that its bounded monotone sequences converge to their suprema in the (banked) order topology.

  ★ THE REFRAME THROUGH THE TRUNK (W1 step 2) + THE ONE CAUSE. The Archimedean property IS the
  C6 eternal-approach / no-infinite-element fact one level up: the gather of cuts has no point
  beyond every natural number — the approach is never trapped at an infinite magnitude. Monotone
  bounded convergence IS the same eternal-approach read as an analytic limit: a bounded increasing
  sequence eternally approaches and converges to its supremum (the gather's coherence point,
  banked N33 as `isLUB_csSupCut`). The SAME engine that built the cut is the convergence the exp's
  partial sums will ride.

  ★ MACHINERY, NOT A POSIT (STANDARD §3). `Archimedean Cut` is obtained from the banked
  `Field Cut` + `ConditionallyCompleteLinearOrder Cut` (N33) + `IsStrictOrderedRing Cut` via the
  standard `ConditionallyCompleteLinearOrderedField.to_archimedean` — a property OF the derived ℝ,
  the metalanguage in which "this derived ℝ is Archimedean" is a theorem, NOT a borrowed number
  system. The convergence reuses the banked order topology (N34) + `SupConvergenceClass`
  (`LinearOrder.supConvergenceClass` from `OrderTopology`). NO Mathlib ℝ imported as content.

  ★ WHAT THIS NODE DOES NOT DO (childed N36, the genuine multi-file W1 analytic core). The
  metric / uniform / Cauchy-complete structure on `Cut` and on `End (O Cut)`, the operator norm,
  the power-series `tsum exp`, `exp(D) ∈ AutO`, and `d/dt exp(tD)|₀ = D` are NOT here. A bounded
  W9 measurement (workbench/N35-operator-exp/) established that `UniformSpace`/`MetricSpace`/
  `CompleteSpace Cut` do NOT synthesize and that there is no generic "metric from order topology"
  — building a `PseudoMetricSpace Cut` whose induced topology equals the fixed `Preorder.topology`
  is a genuine multi-file build. This file banks the cheaply-reachable Archimedean + order-native
  convergence rung; the metric/uniform/exp core is childed.

  PHYSICS-WORDS-REMOVABLE: there are NO physics words in this file. It is the pure statement that
  the completion of the gather-of-closures of the derived rationals is Archimedean (no infinite
  element) and that its bounded monotone sequences converge to their suprema/infima in the order
  topology. No physics name is load-bearing.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge,
  NO Mathlib number-system content import, NO posited ℝ.
-/
import Phys.Foundation.ContinuumTopology
import Mathlib.Algebra.Order.CompleteField
import Mathlib.Topology.Order.MonotoneConvergence

namespace Phys.Foundation
namespace ContinuumQ

open Filter
open scoped Topology

noncomputable section

/-- ★ THE C6 ETERNAL-APPROACH at the continuum level: the derived ℝ is ARCHIMEDEAN. There is no
    infinite element — every magnitude is exceeded by some natural number. Obtained as MACHINERY
    from the banked `Field` + `ConditionallyCompleteLinearOrder` (N33) + `IsStrictOrderedRing`
    via `ConditionallyCompleteLinearOrderedField.to_archimedean`: a property OF the derived ℝ,
    not a posited number system. This is the gather-of-closures having no point beyond every
    natural — the eternal approach never trapped at an infinite magnitude. -/
instance instArchimedeanCut : Archimedean Cut :=
  ConditionallyCompleteLinearOrderedField.to_archimedean

/-- The EXPLICIT eternal-approach: every element `x` of the derived ℝ is exceeded by some natural
    number `n`. The no-infinite-element form of the Archimedean property. -/
theorem cut_exists_nat_gt (x : Cut) : ∃ n : ℕ, x < (n : Cut) := exists_nat_gt x

/-- ★ THE C6 ETERNAL-APPROACH as analytic CONVERGENCE: a bounded monotone (increasing) sequence
    of the derived ℝ converges, in the banked order topology, to its supremum. This is the eternal
    approach spoken as a limit — the bounded increasing approach tends to its coherence point
    (the LUB, banked N33). The convergence the exp's partial sums will ride, with NO metric. -/
theorem cut_tendsto_atTop_ciSup (f : ℕ → Cut) (hmono : Monotone f)
    (hbdd : BddAbove (Set.range f)) : Tendsto f atTop (𝓝 (⨆ i, f i)) :=
  tendsto_atTop_ciSup hmono hbdd

/-- The antitone/inf dual: a bounded monotone (decreasing) sequence converges to its infimum. -/
theorem cut_tendsto_atTop_ciInf (f : ℕ → Cut) (hanti : Antitone f)
    (hbdd : BddBelow (Set.range f)) : Tendsto f atTop (𝓝 (⨅ i, f i)) :=
  tendsto_atTop_ciInf hanti hbdd

/-- The general least-upper-bound form: a monotone sequence whose range has LUB `a` converges to
    `a` in the order topology. (`⨆`-free phrasing, directly on `IsLUB` — the N33 idiom.) -/
theorem cut_tendsto_atTop_isLUB (f : ℕ → Cut) (a : Cut) (hmono : Monotone f)
    (ha : IsLUB (Set.range f) a) : Tendsto f atTop (𝓝 a) :=
  tendsto_atTop_isLUB hmono ha

/-- Non-vacuity (anti-vacuity guard): a concrete instance of the eternal approach — `1 < 2` over
    the derived ℝ, witnessing that the Archimedean exceedance is not the empty statement. -/
theorem cut_one_lt_two_nat : (1 : Cut) < (2 : ℕ) := by norm_num

/-- Non-vacuity: a constant sequence converges (the trivial monotone-bounded case is inhabited). -/
theorem cut_const_tendsto (c : Cut) : Tendsto (fun _ : ℕ => c) atTop (𝓝 c) :=
  tendsto_const_nhds

end

end ContinuumQ
end Phys.Foundation
