import Phys.Algebra.LorentzContinuumGGFamilyInverse

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C119): A BOGUS g*g-FAMILY INVERSE — "THE POSITIVE SQUARE ROOT IS ITS OWN INVERSE".
-- N88 banks `comp_specInverse_exists`: for an injective `g` with EvC-adjoint `h`, the g*g-family
-- (the EvC-orthonormal family `comp_specExists_nonneg` returns on `g*g`) RESOLVES the identity
-- (`specOpN_resolution_of_injective` — read off INJECTIVITY, NO dimension count), so the positive
-- operator square root `p^{1/2} = specOpN (cutSqrt∘c) u` has the CONCRETE two-sided inverse
-- `(p^{1/2})⁻¹ = specOpN ((cutSqrt∘c)⁻¹) u` — the RECIPROCAL-ROOT operator. The LOAD-BEARING fact
-- is the two-family spectral composition law `specOpN_comp_two` (N87) closed by the diagonal reader
-- `specOpN_read` (N68): over an EvC-orthonormal eigen-family the operator composes eigenvalue-by-
-- eigenvalue. For the composite to be the identity (eigenvalue 1 at every eigenblock), the second
-- family MUST be the RECIPROCAL `(cutSqrt∘c)⁻¹`, NOT the square root itself.
--   On the banked space-frame unit `mixB` (`mixB_norm : EvC mixB mixB = 1`, the N67 unit), take the
-- positive-square-root eigenvalue `4` (= `cutSqrt` of a g*g-eigenvalue `16`). The composite of the
-- eigenvalue-4 operator WITH ITSELF reads the PRODUCT eigenvalue `4·4 = 16` at the `mixB` eigenblock
-- (`specOpN_comp_two` + `specOpN_read`). A BOGUS claim that `p^{1/2}` is its OWN inverse (the
-- composite is the identity, so the eigenblock reads `1`) — when the genuine inverse is the
-- eigenvalue-`4⁻¹` operator, NOT the eigenvalue-`4` operator — reduces, through the genuine value
-- `16`, to the false numeric `16 = 1`, and MUST FAIL to compile.
--   CORRECT: the inverse of the eigenvalue-4 (positive square root) operator is the eigenvalue-4⁻¹
--            operator (`comp_specInverse_exists`, `4 · 4⁻¹ = 1`), NOT the eigenvalue-4 operator
--            itself; the composite of `p^{1/2}` with itself reads the TRUE product `4·4 = 16` at the
--            eigenblock (it is `p` = g*g, eigenvalue 16), never `1`.
-- The bite is `16 = 1` (distinct from … C115 1=7, C116 4=13, C117 36=9, C118 21=1).

/-- The singleton eigen-family `![mixB]` is EvC-orthonormal (one diagonal entry, `mixB_norm = 1`). -/
theorem mixB_singleton_orth_ggi :
    ∀ i j : Fin 1, EvC ((![mixB] : Fin 1 → STVC) i) ((![mixB] : Fin 1 → STVC) j)
      = if i = j then 1 else 0 := by
  intro i j
  fin_cases i
  fin_cases j
  simp only [Matrix.cons_val_fin_one]
  rw [mixB_norm]; rfl

/-- The eigenvalues multiply pointwise: `(fun i => 4 * 4) = ![16]` at rank 1. -/
theorem product_funext_ggi :
    (fun i => (![(4:Cut)] i) * (![(4:Cut)] i)) = (![(16:Cut)] : Fin 1 → Cut) := by
  funext i; fin_cases i; norm_num

/-- BOGUS: the positive square root `p^{1/2}` (eigenvalue 4) composed WITH ITSELF reads `1` at the
    `mixB` eigenblock — i.e. `p^{1/2}` is claimed to be its OWN inverse. The genuine product is
    `4·4 = 16` (it is `p` = g*g, eigenvalue 16) by `specOpN_comp_two` + `specOpN_read`, so this
    forces `16 = 1` and must NOT compile. -/
theorem ggfamily_wrong_sqrt_selfinverse_BOGUS :
    EvC (((specOpN ![(4:Cut)] ![mixB]).comp (specOpN ![(4:Cut)] ![mixB])) mixB) mixB = 1 := by
  rw [specOpN_comp_two mixB_singleton_orth_ggi, product_funext_ggi]
  show EvC (specOpN ![(16:Cut)] ![mixB] ((![mixB] : Fin 1 → STVC) 0)) ((![mixB] : Fin 1 → STVC) 0) = 1
  rw [specOpN_read mixB_singleton_orth_ggi 0]
  show (16:Cut) = 1

end

end Counterexamples
