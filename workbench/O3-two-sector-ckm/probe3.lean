import Phys.Algebra.CascadeFoldPhase
import Phys.Algebra.GenerationJarlskogInvariantNumeric
import Phys.Cascade.ComplexUnit
import Mathlib.Tactic

namespace Phys.Algebra.CKMProbe3
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD
noncomputable section

def phaseEl (θ : Cut) : Dbl Cut := ⟨cutCos θ, cutSin θ⟩
theorem phaseEl_normSq (θ : Cut) :
    (phaseEl θ).re * (phaseEl θ).re + (phaseEl θ).im * (phaseEl θ).im = 1 := by
  simp only [phaseEl]
  have := cutSin_sq_add_cutCos_sq θ; linarith

end
end Phys.Algebra.CKMProbe3
