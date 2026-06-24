import Phys.Algebra.DerivationUpperBound
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- The 14 derivations as elements of the submodule derivationQ.
def Dsub : Fin 14 → derivationQ := fun i =>
  ⟨![D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E] i,
   Dvec_mem i⟩

-- MEASURE: independence inside the submodule, lifted from the banked End-level independence.
theorem Dsub_indep : LinearIndependent ℚ Dsub := by
  have h := Dvec_linearIndependent
  -- Dsub composed with the subtype embedding is the End-level vector.
  rw [← linearIndependent_iff'] at *
  sorry

end

end Phys.Algebra
