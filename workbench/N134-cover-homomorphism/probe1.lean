import Phys.Algebra.LorentzContinuumCliffordSpinCover

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

theorem cover_compose_two_PROBE {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0) (v : STVC) :
    CliffordAlgebra.ι QvCQuad (houseHolderM a (houseHolderM b v))
      = ((QvC a)⁻¹ * (QvC b)⁻¹) •
          (CliffordAlgebra.ι QvCQuad a * CliffordAlgebra.ι QvCQuad b
            * CliffordAlgebra.ι QvCQuad v
            * CliffordAlgebra.ι QvCQuad b * CliffordAlgebra.ι QvCQuad a) := by
  rw [reflection_clifford_conj ha (houseHolderM b v), reflection_clifford_conj hb v]
  set ιa := CliffordAlgebra.ι QvCQuad a with hιa
  set ιb := CliffordAlgebra.ι QvCQuad b with hιb
  set ιv := CliffordAlgebra.ι QvCQuad v with hιv
  rw [mul_smul_comm, smul_mul_assoc, smul_smul, neg_mul_neg]
  -- goal now: ((QvC a)⁻¹ * (QvC b)⁻¹) • (ιa * (ιb * ιv * ιb) * ιa)
  --         = ((QvC a)⁻¹ * (QvC b)⁻¹) • (ιa * ιb * ιv * ιb * ιa)
  congr 1
  rw [mul_assoc, mul_assoc, mul_assoc, mul_assoc]

end

end Phys.Algebra
