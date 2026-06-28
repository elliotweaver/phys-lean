import Phys.Algebra.LorentzContinuumCliffordSpinCover

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- the even/Spin composition law (lever from probe1/probe3)
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

-- W8 teeth A: the sign-free Spin composition scalar at the timelike generator is 1
-- (the even cover carries NO reflection sign; the two single-generator signs cancel to +1).
theorem cover_spin_scalar_timelike_unit :
    (QvC (mTimeUnit : STVC))⁻¹ * (QvC (mTimeUnit : STVC))⁻¹ = 1 := by
  have : QvC (mTimeUnit : STVC) = 1 := by rw [← BvC_self]; exact BvC_mTimeUnit_self
  rw [this, inv_one, mul_one]

-- W8 teeth B: the double timelike reflection lifts to the identity on the spinor module
-- (the Spin square ι mt · ι mt = 1 covers identity — the cover is a homomorphism).
theorem cover_timelike_double_eq_id (v : STVC) :
    CliffordAlgebra.ι QvCQuad
        (houseHolderM (mTimeUnit : STVC) (houseHolderM (mTimeUnit : STVC) v))
      = CliffordAlgebra.ι QvCQuad v := by
  have hmt : BvC (mTimeUnit : STVC) (mTimeUnit : STVC) ≠ 0 := by
    rw [BvC_mTimeUnit_self]; exact one_ne_zero
  have hid : houseHolderM (mTimeUnit : STVC) (houseHolderM (mTimeUnit : STVC) v) = v := by
    rw [← Module.End.mul_apply, houseHolderM_involutive hmt, Module.End.one_apply]
  rw [hid]

end

end Phys.Algebra
