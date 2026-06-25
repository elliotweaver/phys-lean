import Phys.Algebra.DerivationOAutomorphism
import Phys.Foundation.ContinuumScalarDeriv

namespace Phys.Algebra
open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix Filter
open scoped BigOperators Topology
noncomputable section

attribute [local instance] CD.narCD CD.srCD

variable (entry_tangent : ∀ (M : Matrix (Fin 8) (Fin 8) Cut) (i j : Fin 8),
    Tendsto (fun t : Cut => t⁻¹ * (expMap (t • M) i j - (1 : Matrix (Fin 8) (Fin 8) Cut) i j))
      (𝓝[≠] (0 : Cut)) (𝓝 (M i j)))

-- VECTOR level
example (M : Matrix (Fin 8) (Fin 8) Cut) (v : Fin 8 → Cut) :
    Tendsto (fun t : Cut => t⁻¹ • (expMap (t • M) *ᵥ v - v))
      (𝓝[≠] (0 : Cut)) (𝓝 (M *ᵥ v)) := by
  rw [tendsto_pi_nhds]
  intro m
  have hlim : Tendsto
      (fun t : Cut => ∑ j, (t⁻¹ * (expMap (t • M) m j - (1 : Matrix (Fin 8) (Fin 8) Cut) m j)) * v j)
      (𝓝[≠] (0 : Cut)) (𝓝 (∑ j, M m j * v j)) := by
    apply tendsto_finset_sum
    intro j _
    exact (entry_tangent M m j).mul_const (v j)
  have htgt : (M *ᵥ v) m = ∑ j, M m j * v j := rfl
  rw [htgt]
  refine hlim.congr' ?_
  filter_upwards with t
  simp only [Pi.smul_apply, Pi.sub_apply, smul_eq_mul]
  rw [Matrix.mulVec, dotProduct]
  have hone : v m = ∑ j, (1 : Matrix (Fin 8) (Fin 8) Cut) m j * v j := by
    have h2 : ((1 : Matrix (Fin 8) (Fin 8) Cut) *ᵥ v) m = v m := by rw [Matrix.one_mulVec]
    rw [← h2, Matrix.mulVec, dotProduct]
  rw [hone, ← Finset.sum_sub_distrib, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro j _
  ring

end
end Phys.Algebra
