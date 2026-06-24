import Phys.Algebra.DerivationIrreducible
import Phys.Algebra.DerivationLowerBound
import Mathlib.LinearAlgebra.Dimension.FreeAndStrongRankCondition

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

-- Assume the assembled no_common_eigenvector_ImO is available (proved in T5):
axiom no_common_eigenvector_ImO (v : O ℚ) (hv : v ∈ ImO) (hvne : v ≠ 0)
    (hspan : ∀ D : Module.End ℚ (O ℚ), IsDerivQ D → ∃ lam : ℚ, D v = lam • v) : False

-- T6: connect to a 1-dim invariant subspace. W ≤ ImO, finrank W = 1, invariant ⟹ False.
example (W : Submodule ℚ (O ℚ)) (hWle : W ≤ ImO) (hW1 : Module.finrank ℚ W = 1)
    (hinv : ∀ D : Module.End ℚ (O ℚ), IsDerivQ D → ∀ x ∈ W, D x ∈ W) : False := by
  -- extract a generator v of W
  rw [finrank_eq_one_iff'] at hW1
  obtain ⟨⟨v, hvW⟩, hvne0, hgen⟩ := hW1
  have hvne : v ≠ 0 := fun h => hvne0 (Subtype.ext h)
  have hvImO : v ∈ ImO := hWle hvW
  apply no_common_eigenvector_ImO v hvImO hvne
  intro D hD
  -- D v ∈ W (invariance), so D v = c • v for some c (W is spanned by v)
  have hDvW : D v ∈ W := hinv D hD v hvW
  obtain ⟨c, hc⟩ := hgen ⟨D v, hDvW⟩
  exact ⟨c, by have := congrArg Subtype.val hc; simpa using this.symm⟩

end
end Phys.Algebra
