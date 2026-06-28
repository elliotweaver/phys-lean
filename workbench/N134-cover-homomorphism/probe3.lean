import Phys.Algebra.LorentzContinuumCliffordSpinCover

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- the even/Spin composition law (probe1, re-proved here as the lever)
theorem cover_compose_two {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0) (v : STVC) :
    CliffordAlgebra.ι QvCQuad (houseHolderM a (houseHolderM b v))
      = ((QvC a)⁻¹ * (QvC b)⁻¹) •
          (CliffordAlgebra.ι QvCQuad a * CliffordAlgebra.ι QvCQuad b
            * CliffordAlgebra.ι QvCQuad v
            * CliffordAlgebra.ι QvCQuad b * CliffordAlgebra.ι QvCQuad a) := by
  rw [reflection_clifford_conj ha (houseHolderM b v), reflection_clifford_conj hb v]
  set ιa := CliffordAlgebra.ι QvCQuad a
  set ιb := CliffordAlgebra.ι QvCQuad b
  set ιv := CliffordAlgebra.ι QvCQuad v
  rw [mul_smul_comm, smul_mul_assoc, smul_smul, neg_mul_neg]
  congr 1
  noncomm_ring

-- THE LITERAL COVER MAP at the two-generator (Spin) level: conjugation by the even unit
-- u = ι a · ι b sends ι v to ι(composed reflection), SIGN-FREE.
-- u⁻¹ = (QvC b)⁻¹ ι b · (QvC a)⁻¹ ι a (the explicit inverse of the even unit).
theorem cover_conj_even {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0) (v : STVC) :
    (CliffordAlgebra.ι QvCQuad a * CliffordAlgebra.ι QvCQuad b)
      * CliffordAlgebra.ι QvCQuad v
      * (((QvC b)⁻¹ • CliffordAlgebra.ι QvCQuad b) * ((QvC a)⁻¹ • CliffordAlgebra.ι QvCQuad a))
      = CliffordAlgebra.ι QvCQuad (houseHolderM a (houseHolderM b v)) := by
  rw [cover_compose_two ha hb v]
  set ιa := CliffordAlgebra.ι QvCQuad a
  set ιb := CliffordAlgebra.ι QvCQuad b
  set ιv := CliffordAlgebra.ι QvCQuad v
  rw [mul_smul_comm, smul_mul_assoc, smul_smul]
  rw [mul_smul_comm]
  congr 1
  noncomm_ring

end

end Phys.Algebra
