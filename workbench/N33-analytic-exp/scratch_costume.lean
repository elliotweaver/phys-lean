/-
  N33 COSTUME SCRATCH — find a clean bite for the completeness claim.
-/
import Phys.Foundation.ContinuumCCLO

namespace Counterexamples
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- The GARBAGE claim: sSup {0} = 1 (truth: sSup {0} = 0). Should reduce to ⊢ 0 = 1 and FAIL.
theorem sSup_singleton_BOGUS : sSup ({0} : Set Cut) = 1 := by
  have hne : ({0} : Set Cut).Nonempty := ⟨0, rfl⟩
  have hbdd : BddAbove ({0} : Set Cut) := ⟨0, fun x hx => le_of_eq hx⟩
  have h0 : sSup ({0} : Set Cut) = 0 := (isLUB_csSupCut {0} hbdd hne).unique isLUB_singleton
  rw [h0]

end
end Counterexamples
