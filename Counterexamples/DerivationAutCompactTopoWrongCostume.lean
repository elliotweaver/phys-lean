/-
  Counterexamples.DerivationAutCompactTopoWrongCostume — N34 costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE CLAIM for the N34 TOPOLOGICAL COMPACTNESS of the automorphism group over the
  DERIVED ℝ `ContinuumQ.Cut`. N34 banks that the coordinate matrix of every automorphism of the
  terminal Cayley–Dickson algebra lands in the orthogonal-isometry set `bornIsometrySet`
  (`MᵀM = I` over the derived ℝ) — `autMatrix_mem_bornIsometry` — which is topologically COMPACT
  (`bornIsometry_isCompact`: closed, inside the unit box, Heine–Borel). Membership means the
  column-pair sums satisfy `∑ i, M i j * M i k = δⱼₖ` over the derived ℝ.

  THE GARBAGE CLAIM the kernel MUST reject (anti-vacuity, W8): that a GENUINE automorphism's
  coordinate matrix has a column whose self-overlap sum over the derived ℝ equals `2` instead of
  `1` — i.e. that it is NOT an isometry / NOT in the compact orthogonal-isometry set. Applied to
  the identity automorphism (`1 ∈ AutO`, `one_mem_AutO`) at column `j = k = 0`, the banked
  membership `autMatrix_mem_bornIsometry` forces the diagonal sum to `1` (since `j = k`), so the
  bogus claim collapses to `(1 : Cut) = 2`, which cannot be discharged. If the automorphism's
  coordinate image did NOT lie in the compact orthogonal-isometry set — if the Heine–Borel
  compactness over the derived ℝ were hollow / `autMatrix_mem_bornIsometry` vacuous — this costume
  would be provable; W8 demands it bite. (A column with self-overlap `2` over the derived ℝ is
  exactly a matrix OUTSIDE the compact isometry box — the negation of the whole node.)

  The manifest's PASS_SIGNATURE matches the elaboration error below (`⊢ 1 = 2`).
-/
import Phys.Algebra.DerivationAutCompactTopo

namespace Counterexamples

open Phys.Algebra Phys.Foundation Phys.Foundation.ContinuumQ Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-- WRONG: claiming the identity automorphism's coordinate matrix over the derived ℝ has its
    column-0 self-overlap equal to `2` — i.e. it is NOT in the compact orthogonal-isometry set.
    The banked `autMatrix_mem_bornIsometry` (the `j = k = 0` case) proves the sum equals `1`, so
    the claim reduces to `(1 : Cut) = 2`. Must FAIL to compile. -/
theorem autMatrix_mem_bornIsometry_BOGUS :
    (∑ i : Fin 8, autMatrix (⟨1, one_mem_AutO⟩ : AutO) i 0
        * autMatrix (⟨1, one_mem_AutO⟩ : AutO) i 0) = (2 : Cut) := by
  have h := autMatrix_mem_bornIsometry (⟨1, one_mem_AutO⟩ : AutO) 0 0
  rw [if_pos rfl] at h
  rw [h]

end

end Counterexamples
