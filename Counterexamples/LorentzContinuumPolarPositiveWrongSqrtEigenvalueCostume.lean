import Phys.Algebra.LorentzContinuumPolarPositive

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C117): A BOGUS POSITIVE OPERATOR SQUARE ROOT AT THE HEART OF THE GLOBAL POLAR
-- POSITIVE PART. N86 banks `comp_op_sqrt_exists`: for an arbitrary operator g with an EvC-adjoint,
-- g*g ALWAYS has a positive operator square root `specOpN (cutSqrt ∘ c) u`, computed eigenvalue-by-
-- eigenvalue. The LOAD-BEARING fact is the rank-`n` spectral composition law `specOpN_comp` (N68):
-- over an EvC-orthonormal eigen-family the operator squares eigenvalue-by-eigenvalue, so the diagonal
-- eigenblock reader `specOpN_read` recovers the SQUARED eigenvalue. On the banked space-frame unit
-- `mixB` (`mixB_norm : EvC mixB mixB = 1`, the N67 unit), the rank-1 spectral operator with eigenvalue
-- 6 squares to eigenvalue 36 — `EvC ((specOpN ![6] ![mixB])∘(specOpN ![6] ![mixB]) mixB) mixB = 36`.
-- A BOGUS claim that this squared eigenvalue reads as `9` (i.e. that 6 were a square root of 9, the
-- square-root assembly of the polar positive part mis-computed eigenvalue-by-eigenvalue) reduces,
-- through the genuine value `36`, to the false numeric `36 = 9`, and MUST FAIL to compile.
--   CORRECT: the spectral square reads the TRUE squared eigenvalue `6·6 = 36`, NOT `9`; the positive
--            operator square root is `cutSqrt` per eigenvalue (so √(specOpN ![36] ![mixB]) has
--            eigenvalue 6, never the other way round).
-- The bite is `36 = 9` (distinct from … C115 1=7, C116 4=13, C91 25=7, C97 25=9, and the rest of the
-- equality battery).

/-- The singleton eigen-family `![mixB]` is EvC-orthonormal (one diagonal entry, `mixB_norm = 1`). -/
theorem mixB_singleton_orth :
    ∀ i j : Fin 1, EvC ((![mixB] : Fin 1 → STVC) i) ((![mixB] : Fin 1 → STVC) j)
      = if i = j then 1 else 0 := by
  intro i j
  fin_cases i
  fin_cases j
  simp only [Matrix.cons_val_fin_one]
  rw [mixB_norm]; rfl

/-- The eigenvalue squares pointwise: `(fun i => 6 * 6) = ![36]` at rank 1. -/
theorem squared_funext :
    (fun i => (![(6:Cut)] i) * (![(6:Cut)] i)) = (![(36:Cut)] : Fin 1 → Cut) := by
  funext i; fin_cases i; norm_num

/-- BOGUS: the spectral square of the eigenvalue-6 rank-1 operator on `mixB` reads `9`. The genuine
    value is `6·6 = 36` (`specOpN_comp` + `specOpN_read`), so this forces `36 = 9` and must NOT compile. -/
theorem polarpositive_wrong_sqrt_eigenvalue_BOGUS :
    EvC (((specOpN ![(6:Cut)] ![mixB]).comp (specOpN ![(6:Cut)] ![mixB])) mixB) mixB = 9 := by
  rw [specOpN_comp mixB_singleton_orth, squared_funext]
  show EvC (specOpN ![(36:Cut)] ![mixB] ((![mixB] : Fin 1 → STVC) 0)) ((![mixB] : Fin 1 → STVC) 0) = 9
  rw [specOpN_read mixB_singleton_orth 0]
  show (36:Cut) = 9

end

end Counterexamples
