import Phys.Algebra.DerivationIrreducible
import Phys.Algebra.DerivationLowerBound

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

-- T4: the eigenvalue-zero lemma. If D is a derivation and D v = λ • v (common eigenvector),
-- then skew-adjointness forces λ = 0 (so D v = 0). This is the heart of d=1 exclusion.
example (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) (v : O ℚ) (hv : v ≠ 0)
    (lam : ℚ) (heig : D v = lam • v) : lam = 0 := by
  -- skew: gForm (D v) v + gForm v (D v) = 0
  have hsk := gFormQ_skew D hD v v
  rw [heig] at hsk
  -- gForm (lam • v) v + gForm v (lam • v) = 0
  -- gForm is bilinear: = lam * gForm v v + lam * gForm v v = 2 lam gForm v v
  have hl : gForm (lam • v) v = lam * gForm v v := by
    simp only [gForm, qsmul_mul_left, reQ_smul]
  have hr : gForm v (lam • v) = lam * gForm v v := by
    rw [gForm_symm]; simp only [gForm, qsmul_mul_left, reQ_smul]
  rw [hl, hr] at hsk
  have hpos : gForm v v ≠ 0 := fun h => hv (gForm_self_eq_zero.mp h)
  have : (lam + lam) * gForm v v = 0 := by ring_nf; ring_nf at hsk; linarith
  rcases mul_eq_zero.mp this with h | h
  · linarith
  · exact absurd h hpos

end
end Phys.Algebra
