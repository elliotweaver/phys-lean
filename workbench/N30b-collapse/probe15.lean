import Phys.Algebra.DerivationSimpleCollapse

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
attribute [local instance] derivationLieQ_semisimple

noncomputable section

-- PROBE: bracket-zero membership. From ⁅I,J⁆=⊥, get ⁅J.incl y, I.incl x⁆ = 0.
example (I J : LieIdeal ℚ derivationLieQ) (hIJ : (⁅I, J⁆ : LieIdeal ℚ derivationLieQ) = ⊥)
    (x : I) (y : J) : (⁅(J.incl y : derivationLieQ), (I.incl x : derivationLieQ)⁆ : derivationLieQ) = 0 := by
  -- ⁅I.incl x, J.incl y⁆ ∈ ⁅I,J⁆ = ⊥, then antisymmetry
  have hmem : (⁅(I.incl x : derivationLieQ), (J.incl y : derivationLieQ)⁆ : derivationLieQ)
      ∈ (⁅I, J⁆ : LieIdeal ℚ derivationLieQ) :=
    LieSubmodule.lie_mem_lie (LieIdeal.incl_mem x) (LieIdeal.incl_mem y)
  rw [hIJ, LieSubmodule.mem_bot] at hmem
  -- ⁅J.incl y, I.incl x⁆ = -⁅I.incl x, J.incl y⁆ = -0 = 0
  rw [← lie_skew, hmem, neg_zero]

end
end Phys.Algebra
