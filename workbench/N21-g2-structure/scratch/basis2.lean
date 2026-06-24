import Phys.Algebra.DerivationUpperBound
import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas
import Mathlib.LinearAlgebra.Basis.Defs
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- The 14 derivations as elements of the submodule derivationQ.
def Dsub : Fin 14 → derivationQ := fun i =>
  ⟨![D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E] i,
   Dvec_mem i⟩

-- subtype ∘ Dsub = the End-level vector (defeq).
theorem subtype_comp_Dsub :
    (Submodule.subtype derivationQ) ∘ Dsub
      = ![D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E] := rfl

-- MEASURE: independence inside the submodule, lifted from the banked End-level independence.
theorem Dsub_indep : LinearIndependent ℚ Dsub := by
  have h : LinearIndependent ℚ ((Submodule.subtype derivationQ) ∘ Dsub) := by
    rw [subtype_comp_Dsub]; exact Dvec_linearIndependent
  exact h.of_comp _

-- MEASURE: the basis from independence + card = finrank.
def derivBasis : Module.Basis (Fin 14) ℚ derivationQ :=
  basisOfLinearIndependentOfCardEqFinrank Dsub_indep (by
    rw [finrank_derivationQ_eq_14]; rfl)

end

end Phys.Algebra
