import Phys.Algebra.LorentzContinuumSpectralExistFull
import Phys.Algebra.LorentzContinuumEigenExtract

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C116): A BOGUS APPENDED EIGENVALUE IN THE SNOC RECONSTRUCTION, AT THE HEART OF THE
-- FULL n-DIM SPECTRAL EXISTENCE. N85 banks `specOpN_snoc`: appending one eigenpair `(μ, uₖ)` to the
-- rank-`n` spectral family adds exactly one scaled eigenprojection — `specOpN (snoc l μ) (snoc u uₖ)
-- = specOpN l u + μ • projC uₖ`. This is the forward reconstruction the existence induction
-- accumulates with (the N70 deflation peel reversed); it is LOAD-BEARING — the final step of
-- `specExists_aux` rewrites by it to assemble `h = h' + μ • projC u`. Reading the reconstructed
-- operator's reference-form eigenvalue on the appended UNIT direction `mixB` (`mixB_norm : EvC mixB
-- mixB = 1`, the banked space-frame unit of N67) recovers the appended eigenvalue exactly: starting
-- from the empty rank-0 family (`specOpN ![] ![] = 0`) and appending `(4, mixB)`,
-- `EvC (specOpN (snoc ![] 4) (snoc ![] mixB) mixB) mixB = 4`. A BOGUS claim that this appended
-- eigenvalue reads as `13` reduces, through the genuine value `4`, to the false numeric `4 = 13`,
-- and MUST FAIL to compile.
--   CORRECT: the snoc reconstruction adds the appended eigenprojection with its TRUE eigenvalue `4`,
--            NOT `13`; the forward reconstruction is the exact reverse of the deflation peel.
-- The bite is `4 = 13` (distinct from … C109 9=13, C107 6=13, C105 25=13, C115 1=7, C114 2=5,
-- C113 1=15, and the rest of the equality battery).

theorem spectralexist_wrong_snoc_eigenvalue_BOGUS :
    EvC (specOpN (Fin.snoc (![] : Fin 0 → Cut) (4:Cut)) (Fin.snoc (![] : Fin 0 → STVC) mixB) mixB) mixB
      = 13 := by
  rw [specOpN_snoc]
  simp only [LinearMap.add_apply, LinearMap.smul_apply]
  have hz : specOpN (![] : Fin 0 → Cut) (![] : Fin 0 → STVC) = 0 := by simp [specOpN]
  rw [hz]
  simp only [LinearMap.zero_apply, zero_add]
  rw [projC_apply, mixB_norm, one_smul, EvC_smul_left, mixB_norm, mul_one]

end

end Counterexamples
