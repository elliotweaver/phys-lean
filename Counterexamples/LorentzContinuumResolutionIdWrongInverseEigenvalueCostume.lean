import Phys.Algebra.LorentzContinuumResolutionId

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C118): A BOGUS OPERATOR INVERSE AT THE HEART OF THE RESOLUTION-OF-IDENTITY /
-- (p^{1/2})⁻¹ STEP. N87 banks `specOpN_inverse`: for an EvC-orthonormal eigen-family resolving
-- the identity (`∑ projC u_i = id`) with every eigenvalue nonzero, the reciprocal-eigenvalue
-- spectral operator is a two-sided inverse — `specOpN c u ∘ specOpN (c⁻¹) u = id`. The LOAD-BEARING
-- fact is the TWO-FAMILY spectral composition law `specOpN_comp_two` (N87, generalizing N68
-- `specOpN_comp`): over an EvC-orthonormal eigen-family the operator composes eigenvalue-by-
-- eigenvalue, so the diagonal eigenblock reader `specOpN_read` recovers the PRODUCT eigenvalue.
-- For the composite to be the identity (eigenvalue 1 at every eigenblock), the eigenvalue product
-- MUST be 1, i.e. the second family must be the RECIPROCAL c⁻¹. On the banked space-frame unit
-- `mixB` (`mixB_norm : EvC mixB mixB = 1`, the N67 unit), the rank-1 operator with eigenvalue 7
-- composed with the rank-1 operator with eigenvalue 3 reads the PRODUCT eigenvalue 7·3 = 21 at the
-- `mixB` eigenblock (`specOpN_comp_two` + `specOpN_read`). A BOGUS claim that eigenvalue 3 INVERTS
-- eigenvalue 7 (that the composite is the identity, so the eigenblock reads `1`) — when the genuine
-- inverse eigenvalue is 7⁻¹, NOT 3 — reduces, through the genuine value `21`, to the false numeric
-- `21 = 1`, and MUST FAIL to compile.
--   CORRECT: the inverse of the eigenvalue-7 operator is the eigenvalue-7⁻¹ operator (`specOpN_inverse`,
--            `7 · 7⁻¹ = 1`), NOT the eigenvalue-3 operator; the composite of eigenvalue 7 and
--            eigenvalue 3 reads the TRUE product `7·3 = 21` at the eigenblock, never `1`.
-- The bite is `21 = 1` (distinct from … C114 2=5, C115 1=7, C116 4=13, C117 36=9, C113 1=15).

/-- The singleton eigen-family `![mixB]` is EvC-orthonormal (one diagonal entry, `mixB_norm = 1`). -/
theorem mixB_singleton_orth_inv :
    ∀ i j : Fin 1, EvC ((![mixB] : Fin 1 → STVC) i) ((![mixB] : Fin 1 → STVC) j)
      = if i = j then 1 else 0 := by
  intro i j
  fin_cases i
  fin_cases j
  simp only [Matrix.cons_val_fin_one]
  rw [mixB_norm]; rfl

/-- The eigenvalues multiply pointwise: `(fun i => 7 * 3) = ![21]` at rank 1. -/
theorem product_funext :
    (fun i => (![(7:Cut)] i) * (![(3:Cut)] i)) = (![(21:Cut)] : Fin 1 → Cut) := by
  funext i; fin_cases i; norm_num

/-- BOGUS: the composite of the eigenvalue-7 operator with the eigenvalue-3 operator reads `1` at the
    `mixB` eigenblock — i.e. eigenvalue 3 is claimed to INVERT eigenvalue 7. The genuine product is
    `7·3 = 21` (`specOpN_comp_two` + `specOpN_read`), so this forces `21 = 1` and must NOT compile. -/
theorem resolutionid_wrong_inverse_eigenvalue_BOGUS :
    EvC (((specOpN ![(7:Cut)] ![mixB]).comp (specOpN ![(3:Cut)] ![mixB])) mixB) mixB = 1 := by
  rw [specOpN_comp_two mixB_singleton_orth_inv, product_funext]
  show EvC (specOpN ![(21:Cut)] ![mixB] ((![mixB] : Fin 1 → STVC) 0)) ((![mixB] : Fin 1 → STVC) 0) = 1
  rw [specOpN_read mixB_singleton_orth_inv 0]
  show (21:Cut) = 1

end

end Counterexamples
