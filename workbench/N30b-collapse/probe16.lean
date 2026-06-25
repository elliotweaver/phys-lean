import Phys.Algebra.DerivationSimpleCollapse

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
attribute [local instance] derivationLieQ_semisimple

noncomputable section

-- membership of I.incl x in I
example (I : LieIdeal ℚ derivationLieQ) (x : I) : (I.incl x : derivationLieQ) ∈ I := by
  rw [LieSubmodule.incl_apply]; exact x.2

-- bracket-zero from ⁅I,J⁆=⊥
example (I J : LieIdeal ℚ derivationLieQ) (hIJ : (⁅I, J⁆ : LieIdeal ℚ derivationLieQ) = ⊥)
    (x : I) (y : J) : (⁅(J.incl y : derivationLieQ), (I.incl x : derivationLieQ)⁆ : derivationLieQ) = 0 := by
  have hxI : (I.incl x : derivationLieQ) ∈ I := by rw [LieSubmodule.incl_apply]; exact x.2
  have hyJ : (J.incl y : derivationLieQ) ∈ J := by rw [LieSubmodule.incl_apply]; exact y.2
  have hmem : (⁅(I.incl x : derivationLieQ), (J.incl y : derivationLieQ)⁆ : derivationLieQ)
      ∈ (⁅I, J⁆ : LieIdeal ℚ derivationLieQ) :=
    LieSubmodule.lie_mem_lie hxI hyJ
  rw [hIJ, LieSubmodule.mem_bot] at hmem
  rw [← lie_skew, hmem, neg_zero]

end
end Phys.Algebra
