import Phys.Algebra.DerivationSimpleCollapse
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
attribute [local instance] derivationLieQ_semisimple
noncomputable section

-- helper: ⁅I,J⁆=⊥ ⟹ for a∈I, b∈J, ⁅a,b⁆=0
example (I J : LieIdeal ℚ derivationLieQ) (h : (⁅I, J⁆ : LieIdeal ℚ derivationLieQ) = ⊥)
    (a b : derivationLieQ) (ha : a ∈ I) (hb : b ∈ J) : (⁅a, b⁆ : derivationLieQ) = 0 := by
  have hmem : (⁅a, b⁆ : derivationLieQ) ∈ (⁅I, J⁆ : LieIdeal ℚ derivationLieQ) :=
    LieSubmodule.lie_mem_lie ha hb
  rw [h, LieSubmodule.mem_bot] at hmem
  exact hmem

end
end Phys.Algebra
