import Phys.Algebra.DerivationOExp
import Phys.Algebra.DerivationCompact
import Phys.Algebra.DerivationAutExp
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.Topology.Algebra.InfiniteSum.Module

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- matrix-rep identity for a Cut-linear endomorphism of (Fin 8 → Cut)
example (E : Module.End Cut (Fin 8 → Cut)) (n : ℕ) (v : Fin 8 → Cut) :
    (LinearMap.toMatrix' E) ^ n *ᵥ v = (E ^ n) v := by
  have hpow : (LinearMap.toMatrix' E) ^ n = LinearMap.toMatrix' (E ^ n) := by
    rw [← LinearMap.toMatrixAlgEquiv'_apply']  -- probe name
    sorry
  sorry

-- conjugation map_pow: conjRingEquiv as RingEquiv preserves powers
example (e : O Cut ≃ₗ[Cut] (Fin 8 → Cut)) (D' : Module.End Cut (O Cut)) (n : ℕ) (x : O Cut) :
    e ((D' ^ n) x) = ((e.conjRingEquiv D') ^ n) (e x) := by
  rw [map_pow]
  rw [LinearEquiv.conjRingEquiv_apply_apply]  -- probe name
  sorry

-- mulVec as additive continuous map in the matrix slot
example (v : Fin 8 → Cut) : Continuous (fun M : Matrix (Fin 8) (Fin 8) Cut => M *ᵥ v) := by
  exact?

end
