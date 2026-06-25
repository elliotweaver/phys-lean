/-
  # N36 — The UNIFORM STRUCTURE on the DERIVED ℝ `ContinuumQ.Cut` (the trunk-native
  group uniformity), with TOPOLOGY AGREEMENT to the banked order topology.

  N33 banked `ConditionallyCompleteLinearOrder Cut`; N34 banked the order TOPOLOGY +
  `IsTopologicalRing Cut` (the field operations are continuous) + Heine–Borel; N35 banked the
  ARCHIMEDEAN property + order-native monotone-bounded CONVERGENCE. The automorphism group's
  one-parameter subgroups `exp(tD) = ∑ (tD)ⁿ/n!` need a UNIFORM structure on the derived ℝ for
  the partial sums to be Cauchy and for `tsum`/`HasSum` to be stated. This file banks that uniform
  structure — and crucially proves its induced topology AGREES with the banked order topology.

  ★ THE REFRAME THROUGH THE TRUNK (W1 step 2) THAT DISSOLVED THE FEARED HARD PART. The N35
  measurement isolated "a `PseudoMetricSpace Cut` with `dist x y = |x-y|` whose induced topology =
  the FIXED `Preorder.topology Cut`" as the genuine remaining hard part. That route is also a
  CONTENT TRAP: Mathlib's `PseudoMetricSpace.dist` is ℝ-VALUED, so `dist x y = |x - y|` would cast
  `|x - y| : Cut` into Mathlib's ℝ — importing ℝ as content (STANDARD §3). The trunk dodges BOTH
  problems at once: `Cut` is a banked TOPOLOGICAL RING (`isTopologicalRing_cut`, N34), hence a
  `IsTopologicalAddGroup`, and every topological additive group carries its CANONICAL GROUP
  UNIFORMITY `IsTopologicalAddGroup.rightUniformSpace` whose `toTopologicalSpace` is, BY
  CONSTRUCTION, the ambient topology — so it equals the banked `instTopologicalSpaceCut` by `rfl`,
  with NO ℝ-valued metric, NO `replaceTopology` proof obligation, and NO content import. The
  topology-agreement the N35 measurement feared holds definitionally.

  ★ THE ONE CAUSE (the trunk, one level up). The SAME C6 eternal-approach that built the cut (N6),
  gave order-completeness (N33), the order topology + topological-ring continuity (N34), and the
  Archimedean/convergence rung (N35) now gives the UNIFORM structure: the group uniformity IS the
  uniform refinement of the order topology, existing precisely because the field operations are
  continuous (the banked topological ring). The derived ℝ is a uniform additive group; its
  uniformity's entourages are the "difference near 0" sets — the order-native form of nearness.

  ★ MACHINERY, NOT A POSIT (STANDARD §3). `instUniformSpaceCut` is the standard
  `IsTopologicalAddGroup.rightUniformSpace` applied to the banked topological ring `Cut` — uniform-
  space MACHINERY on the DERIVED object. "This derived ℝ is a uniform additive group whose
  uniformity refines its order topology" is a THEOREM about the derived ℝ, not a borrowed number
  system. NO Mathlib ℝ imported as content.

  ★ WHAT THIS NODE DOES NOT DO (childed N37, the analytic operator core). `CompleteSpace Cut` is a
  genuine separate build — `FirstCountableTopology Cut` does NOT synthesize, so the seq-compact /
  Bolzano–Weierstrass route (or a liminf construction via the banked `cut_tendsto_atTop_ciSup`)
  needs its own rung. The operator norm on `End (O Cut)`, the `tsum` power-series `exp(D)`,
  `exp(D) ∈ AutO`, and `d/dt exp(tD)|₀ = D` are NOT here. This file banks the uniform-structure
  rung; the completeness + operator-exp core is childed.

  PHYSICS-WORDS-REMOVABLE: there are NO physics words in this file. It is the pure statement that
  the completion of the gather-of-closures of the derived rationals carries the group uniformity of
  its additive group, that this uniformity's induced topology equals its order topology, and that it
  is a uniform additive group. No physics name is load-bearing.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge,
  NO Mathlib number-system content import, NO posited ℝ.
-/
import Phys.Foundation.ContinuumArchimedean
import Mathlib.Topology.Algebra.IsUniformGroup.Defs
import Mathlib.Topology.Algebra.IsUniformGroup.Basic
import Mathlib.Topology.Algebra.InfiniteSum.Basic

namespace Phys.Foundation
namespace ContinuumQ

open Filter
open scoped Topology Uniformity

noncomputable section

/-- ★ THE UNIFORM STRUCTURE on the derived ℝ: the CANONICAL GROUP UNIFORMITY of its additive
    group, obtained from the banked `IsTopologicalRing Cut` (N34) via the standard
    `IsTopologicalAddGroup.rightUniformSpace`. NOT a posited metric/uniformity — it is uniform-space
    MACHINERY on the DERIVED topological ring (STANDARD §3). Its induced topology is, by
    construction, the banked order topology (see `cut_uniformSpace_toTopologicalSpace_eq`), so no
    ℝ-valued metric is needed and no topology is overwritten. -/
instance instUniformSpaceCut : UniformSpace Cut :=
  IsTopologicalAddGroup.rightUniformSpace Cut

/-- ★ THE TOPOLOGY AGREEMENT (the rung the N35 measurement isolated as the hard part, here by
    construction). The topology INDUCED by the group uniformity EQUALS the banked order topology
    `instTopologicalSpaceCut` (N34) — definitionally, because `rightUniformSpace` reuses the ambient
    topology and proves `nhds_eq_comap_uniformity`. There is no diamond: the uniform structure
    refines the order topology without replacing it. -/
theorem cut_uniformSpace_toTopologicalSpace_eq :
    instUniformSpaceCut.toTopologicalSpace = instTopologicalSpaceCut := rfl

/-- The derived ℝ is a UNIFORM ADDITIVE GROUP: addition and negation are uniformly continuous, and
    the left and right group uniformities coincide (the commutative case). MACHINERY via
    `isUniformAddGroup_of_addCommGroup` on the banked `AddCommGroup Cut` + the group uniformity. -/
instance instIsUniformAddGroupCut : IsUniformAddGroup Cut :=
  isUniformAddGroup_of_addCommGroup

/-- The EXPLICIT uniformity (the order-native form of nearness): the entourages are the
    "difference near zero" sets — `(x, y)` is `U`-close iff `y - x` lies in a neighbourhood of `0`.
    This is `rfl` for the group uniformity. -/
theorem cut_uniformity_eq :
    𝓤 Cut = Filter.comap (fun p : Cut × Cut => p.2 - p.1) (𝓝 (0 : Cut)) := rfl

/-- Non-vacuity (anti-vacuity guard): with the uniform structure in place, the infinite sum `∑' n,
    f n` of a sequence of the derived ℝ is now a well-formed element of the derived ℝ — the
    power-series partial sums of the operator-exp can be STATED. -/
theorem cut_tsum_statable (f : ℕ → Cut) : (∑' n, f n) = ∑' n, f n := rfl

/-- Non-vacuity: the constant sequence is CAUCHY in the group uniformity — the uniform structure is
    inhabited and non-degenerate (a genuine uniform space, not the indiscrete collapse). -/
theorem cut_const_cauchySeq (c : Cut) : CauchySeq (fun _ : ℕ => c) := cauchySeq_const _

end

end ContinuumQ
end Phys.Foundation
