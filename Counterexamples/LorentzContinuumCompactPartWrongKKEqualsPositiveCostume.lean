import Phys.Algebra.LorentzContinuumCompactPart

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C120): A BOGUS COMPACT PART — "THE COMPACT PART k*k EQUALS THE POSITIVE PART p".
-- N89 banks `comp_polar_decomposition`: for an injective `g` with EvC-adjoint `h`, the polar/KAK
-- assembly `g = k·p^{1/2}` splits into the POSITIVE part `p^{1/2} = specOpN (cutSqrt∘c) u` and the
-- COMPACT/ORTHOGONAL part `k := g∘(p^{1/2})⁻¹`, and the DEFINING property of the orthogonal factor
-- is `k*k = 1` (its EvC-adjoint composed with itself is the IDENTITY — eigenvalue 1 at every
-- eigenblock). This is what makes `k` an isometry, distinct from the POSITIVE factor `p^{1/2}`
-- whose self-composite is `p = g*g` (the eigenvalue, NOT 1). Confusing the two — claiming the
-- compact factor `k*k` equals the positive part `p` (so its eigenblock reads the eigenvalue rather
-- than 1) — collapses the polar decomposition.
--   The LOAD-BEARING fact is the two-family spectral composition law `specOpN_comp_two` (N87)
-- closed by the diagonal reader `specOpN_read` (N68): over an EvC-orthonormal eigen-family the
-- operator composes eigenvalue-by-eigenvalue. For `k*k` to be the IDENTITY (eigenvalue 1 at every
-- eigenblock), the reciprocal-root cancellations `(p^{1/2})⁻¹∘p^{1/2} = id` must run; the bare
-- POSITIVE-part self-composite `p^{1/2}∘p^{1/2}` instead reads the PRODUCT eigenvalue `5·5 = 25`
-- (it is `p` = g*g, eigenvalue 25), NOT 1.
--   On the banked space-frame unit `mixB` (`mixB_norm : EvC mixB mixB = 1`, the N67 unit), take a
-- positive-square-root eigenvalue `5` (= `cutSqrt` of a g*g-eigenvalue `25`). A BOGUS claim that
-- the COMPACT part `k*k` equals the POSITIVE part `p^{1/2}∘p^{1/2}` AND reads `1` at the eigenblock
-- (i.e. the orthogonal factor is confused with the positive factor) reduces, through the genuine
-- value `25`, to the false numeric `25 = 1`, and MUST FAIL to compile.
--   CORRECT: the COMPACT part satisfies `k*k = 1` (eigenblock reads 1) via the two-sided inverse
--            cancellation (`comp_polar_decomposition`); the POSITIVE part's self-composite
--            `p^{1/2}∘p^{1/2}` reads the TRUE product `5·5 = 25` at the eigenblock (it is `p` = g*g,
--            eigenvalue 25), and is the POSITIVE factor, NEVER the compact factor `1`.
-- The bite is `25 = 1` (distinct from … C115 1=7, C116 4=13, C117 36=9, C118 21=1, C119 16=1).

/-- The singleton eigen-family `![mixB]` is EvC-orthonormal (one diagonal entry, `mixB_norm = 1`). -/
theorem mixB_singleton_orth_cp :
    ∀ i j : Fin 1, EvC ((![mixB] : Fin 1 → STVC) i) ((![mixB] : Fin 1 → STVC) j)
      = if i = j then 1 else 0 := by
  intro i j
  fin_cases i
  fin_cases j
  simp only [Matrix.cons_val_fin_one]
  rw [mixB_norm]; rfl

/-- The eigenvalues multiply pointwise: `(fun i => 5 * 5) = ![25]` at rank 1. -/
theorem product_funext_cp :
    (fun i => (![(5:Cut)] i) * (![(5:Cut)] i)) = (![(25:Cut)] : Fin 1 → Cut) := by
  funext i; fin_cases i; norm_num

/-- BOGUS: the COMPACT part `k*k` is claimed to equal the POSITIVE part `p^{1/2}∘p^{1/2}` (eigenvalue
    5 composed with itself) AND to read `1` at the `mixB` eigenblock (the orthogonal factor confused
    with the positive factor). The genuine positive-part product is `5·5 = 25` (it is `p` = g*g,
    eigenvalue 25) by `specOpN_comp_two` + `specOpN_read`, while the genuine compact factor `k*k = 1`;
    so this forces `25 = 1` and must NOT compile. -/
theorem compactpart_wrong_kk_equals_positive_BOGUS :
    EvC (((specOpN ![(5:Cut)] ![mixB]).comp (specOpN ![(5:Cut)] ![mixB])) mixB) mixB = 1 := by
  rw [specOpN_comp_two mixB_singleton_orth_cp, product_funext_cp]
  show EvC (specOpN ![(25:Cut)] ![mixB] ((![mixB] : Fin 1 → STVC) 0)) ((![mixB] : Fin 1 → STVC) 0) = 1
  rw [specOpN_read mixB_singleton_orth_cp 0]
  show (25:Cut) = 1

end

end Counterexamples
