import Phys.Algebra.DerivationStabilizerDim
import Phys.Algebra.Alternative
import Phys.Algebra.DerivationRep7

open Phys.Cascade Phys.Cascade.CD Phys.Algebra
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

namespace N42cBig2
noncomputable section

def imBasis : Fin 7 → O ℚ := ![u1, e2O, e3O, e4O, e5O, e6O, e7O]
-- (assume imBasis_indep, imBasis_mem_ImO proven as in probe_big)
axiom imBasis_indep : LinearIndependent ℚ imBasis
axiom imBasis_mem_ImO : ∀ i, imBasis i ∈ ImO

-- span imBasis = ImO  (both dim 7, span ≤ ImO).
theorem span_imBasis_le_ImO : Submodule.span ℚ (Set.range imBasis) ≤ ImO := by
  rw [Submodule.span_le, Set.range_subset_iff]
  intro i; exact imBasis_mem_ImO i

theorem span_imBasis_eq_ImO : Submodule.span ℚ (Set.range imBasis) = ImO := by
  apply Submodule.eq_of_le_of_finrank_eq span_imBasis_le_ImO
  rw [finrank_span_eq_card imBasis_indep, finrank_ImO]
  rfl

-- finrank of span imBasis = 7
example : Module.finrank ℚ (Submodule.span ℚ (Set.range imBasis)) = 7 := by
  rw [finrank_span_eq_card imBasis_indep]; rfl

end
end N42cBig2
