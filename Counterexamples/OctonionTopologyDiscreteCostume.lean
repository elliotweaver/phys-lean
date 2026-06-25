/-
  Counterexamples.OctonionTopologyDiscreteCostume — N41b costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE CLAIM for the N41b TOPOLOGICAL `*`-ALGEBRA rung on the octonion algebra `O Cut`
  over the DERIVED ℝ `ContinuumQ.Cut`. N41b (`Phys/Cascade/OctonionTopology.lean`) banks the
  complete topological `*`-algebra structure on `O Cut = CD (CD (Dbl Cut))` by COMPLETELY INDUCED
  transfer along the pair projection `CD.toProd : CD A → A × A`: the uniform structure is
  `UniformSpace.comap CD.toProd`, and the headline theorems `oCut_t2Space`, `oCut_t3Space`,
  `oCut_completeSpace`, `oCut_continuousAdd/Mul/Star/SMul`, `oCut_isTopologicalSemiring` all
  follow because the doubled operations are continuous polynomials in the (continuous) base
  operations.

  ★ THE NON-VACUITY THIS COSTUME GUARDS (W8): every one of those headline continuity/separation/
  completeness theorems is TRIVIALLY TRUE under the DISCRETE topology `⊥` — in the discrete
  topology every map is continuous, every space is `T2`/`T3`, and (being the order-induced
  product topology done right) the whole structure would be a hollow shell if the transferred
  topology had secretly collapsed to discrete. The banked structure is genuine precisely because
  its topology is the order-pullback `TopologicalSpace.induced CD.toProd` of the densely-ordered
  derived ℝ, which is NOT discrete (the derived ℝ `Cut` is densely ordered with no isolated
  points — N34/N36 — so neither is any pair-induced double over it).

  THE GARBAGE CLAIM the kernel MUST reject: that the genuine topology on `O Cut` — the one
  induced by the banked uniform structure `CD.instUniformSpace` — is the DISCRETE topology `⊥`.
  Routing it through the banked agreement `CD.topology_eq_induced` (the new N41b theorem that the
  uniform structure's topology equals `TopologicalSpace.induced CD.toProd inferInstance`, by
  `rfl`, so there is NO topology/uniformity diamond) reduces the bogus claim to
      `⊢ TopologicalSpace.induced CD.toProd inferInstance = ⊥`,
  which is FALSE and cannot be discharged: the induced topology of the densely-ordered derived ℝ
  product is not discrete. (A topological `*`-algebra whose topology is secretly discrete would
  make every continuity theorem in the rung vacuous — this costume is exactly the guard against
  that hollow case.)

  This costume DIRECTLY exercises the NEW N41b content: it routes through `CD.topology_eq_induced`
  (the agreement theorem) and `CD.instUniformSpace` (the induced uniform structure on the double),
  NOT merely an inherited topology — deleting `Phys/Cascade/OctonionTopology.lean` removes both,
  so the costume would fail with a DIFFERENT (unknown-identifier) error and the PASS_SIGNATURE
  would not match. The manifest's PASS_SIGNATURE matches the elaboration error below
  (`TopologicalSpace.induced CD.toProd inferInstance = ⊥`).

  PHYSICS-WORDS-REMOVABLE: delete "octonion": the costume is the false claim that the
  pair-induced topology on the iterated Cayley–Dickson double of the densely-ordered complete
  derived ℝ is the discrete topology. No physics word does logical work.
-/
import Phys.Cascade.OctonionTopology

namespace Counterexamples

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

attribute [local instance] CD.narCD CD.srCD

/-- WRONG: claiming the genuine topology on `O Cut` (the one induced by the banked uniform
    structure `CD.instUniformSpace`) is the DISCRETE topology `⊥`. The banked
    `CD.topology_eq_induced` rewrites the LHS to `TopologicalSpace.induced CD.toProd inferInstance`,
    leaving `⊢ TopologicalSpace.induced CD.toProd inferInstance = ⊥`, which is false (the
    densely-ordered derived ℝ product topology is not discrete) and is left unsolved. Under the
    discrete topology every continuity/separation theorem in the N41b rung would be vacuous — this
    is the anti-vacuity guard. Must FAIL to compile. -/
theorem oCut_topology_discrete_BOGUS :
    (CD.instUniformSpace : UniformSpace (O Cut)).toTopologicalSpace
      = (⊥ : TopologicalSpace (O Cut)) := by
  rw [CD.topology_eq_induced]

end

end Counterexamples
