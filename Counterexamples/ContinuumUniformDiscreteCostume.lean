/-
  Counterexamples.ContinuumUniformDiscreteCostume — N36 costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE CLAIM for the N36 UNIFORM-STRUCTURE rung over the DERIVED ℝ `ContinuumQ.Cut`.
  N36 banks the group uniformity `instUniformSpaceCut` whose induced topology EQUALS the banked
  order topology `instTopologicalSpaceCut` (`cut_uniformSpace_toTopologicalSpace_eq`, by
  construction) — the topology-agreement that makes the uniform structure a genuine refinement of
  the order topology rather than an arbitrary (e.g. discrete) overwrite.

  THE GARBAGE CLAIM the kernel MUST reject (anti-vacuity, W8): that the topology INDUCED by the
  uniform structure is the DISCRETE topology `⊥`. If the agreement were hollow — if the uniform
  structure secretly carried the discrete topology instead of the order topology — this would be
  provable. It is NOT: the banked agreement reduces the claim to `instTopologicalSpaceCut = ⊥`,
  and the order topology of the derived ℝ is NOT discrete (it is densely ordered with no maximum,
  so `𝓝[>] 0` is `NeBot` — there are points arbitrarily close above `0`, contradicting an
  isolated `0`). The garbage claim therefore cannot be discharged. (A uniform structure whose
  induced topology is discrete is exactly a violation of the topology-agreement the node banks.)

  This costume DIRECTLY exercises the NEW N36 content: it routes through
  `cut_uniformSpace_toTopologicalSpace_eq` (the agreement theorem) and `instUniformSpaceCut` (the
  uniform structure), NOT merely the inherited order topology — deleting the N36 agreement theorem
  breaks this costume's reduction. The manifest's PASS_SIGNATURE matches the elaboration error
  below (`instTopologicalSpaceCut = ⊥`).
-/
import Phys.Foundation.ContinuumUniform

namespace Counterexamples

open Phys.Foundation Phys.Foundation.ContinuumQ Filter Set
open scoped Topology Uniformity

noncomputable section

/-- WRONG: claiming the topology induced by the group uniformity on the derived ℝ is the DISCRETE
    topology. The banked `cut_uniformSpace_toTopologicalSpace_eq` reduces this to
    `instTopologicalSpaceCut = ⊥`, which is false (the order topology is densely ordered, not
    discrete). Must FAIL to compile. -/
theorem uniform_topology_discrete_BOGUS :
    instUniformSpaceCut.toTopologicalSpace = (⊥ : TopologicalSpace Cut) := by
  rw [cut_uniformSpace_toTopologicalSpace_eq]

end

end Counterexamples
