import Phys.Algebra.LorentzContinuumCliffordCoverHom
import Mathlib.LinearAlgebra.CliffordAlgebra.Conjugation

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- MEASURE (A): the sign-free generator cover via the twisted adjoint (grade involution).
-- involute(ι a) · ι v · ((QvC a)⁻¹ • ι a) = ι(houseHolderM a v), the textbook Pin cover, sign-free.
example {a : STVC} (ha : BvC a a ≠ 0) (v : STVC) :
    CliffordAlgebra.involute (CliffordAlgebra.ι QvCQuad a)
      * CliffordAlgebra.ι QvCQuad v
      * ((QvC a)⁻¹ • CliffordAlgebra.ι QvCQuad a)
      = CliffordAlgebra.ι QvCQuad (houseHolderM a v) := by
  rw [CliffordAlgebra.involute_ι, reflection_clifford_conj ha v,
      mul_smul_comm, neg_smul, ← smul_neg]
  congr 1
  noncomm_ring

-- MEASURE (B-seed): involute is multiplicative (AlgHom), so the cover composes.
example (x y : CliffC) :
    CliffordAlgebra.involute (x * y)
      = CliffordAlgebra.involute x * CliffordAlgebra.involute y := by
  rw [map_mul]

-- MEASURE: the Clifford unit as a genuine unit, and its inverse value.
example {a : STVC} (ha : BvC a a ≠ 0) :
    ((cliff_unit_isUnit ha).unit : CliffC) = CliffordAlgebra.ι QvCQuad a := rfl

end

end Phys.Algebra
