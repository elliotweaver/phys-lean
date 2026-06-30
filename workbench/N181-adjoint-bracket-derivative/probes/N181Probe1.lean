import Phys.Algebra.DerivationOTangent
import Phys.Algebra.DerivationOCommutingFlow

/-!  N181 probe1 — MEASURE the two crux infrastructure lemmas (W9 measure-first).
     (a) matrix-mul-of-tendsto entrywise; (b) expMap continuity at 0 (from the banked tangent). -/

namespace Phys.Algebra

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix
open Filter
open scoped BigOperators Topology

noncomputable section

attribute [local instance] CD.narCD CD.srCD

/-- (a) MATRIX-MUL-OF-TENDSTO (entrywise). -/
theorem matrix_mul_tendsto {l : Filter Cut}
    (F G : Cut → Matrix (Fin 8) (Fin 8) Cut) (A B : Matrix (Fin 8) (Fin 8) Cut)
    (hF : Tendsto F l (𝓝 A)) (hG : Tendsto G l (𝓝 B)) :
    Tendsto (fun t => F t * G t) l (𝓝 (A * B)) := by
  refine tendsto_pi_nhds.mpr (fun i => tendsto_pi_nhds.mpr (fun j => ?_))
  -- goal: Tendsto (fun t => (F t * G t) i j) l (𝓝 ((A*B) i j))
  have hentry : (fun t => (F t * G t) i j) = (fun t => ∑ k, F t i k * G t k j) := by
    funext t; rw [Matrix.mul_apply]
  rw [hentry]
  have htgt : (A * B) i j = ∑ k, A i k * B k j := Matrix.mul_apply
  rw [htgt]
  apply tendsto_finset_sum
  intro k _
  have hFik : Tendsto (fun t => F t i k) l (𝓝 (A i k)) :=
    (tendsto_pi_nhds.mp ((tendsto_pi_nhds.mp hF) i)) k
  have hGkj : Tendsto (fun t => G t k j) l (𝓝 (B k j)) :=
    (tendsto_pi_nhds.mp ((tendsto_pi_nhds.mp hG) k)) j
  exact hFik.mul hGkj

/-- (b) expMap CONTINUITY AT 0 (entrywise) over the derived ℝ, from the banked first-order tangent. -/
theorem expMap_tendsto_one (M : Matrix (Fin 8) (Fin 8) Cut) :
    Tendsto (fun t : Cut => expMap (t • M)) (𝓝[≠] (0 : Cut)) (𝓝 (1 : Matrix (Fin 8) (Fin 8) Cut)) := by
  refine tendsto_pi_nhds.mpr (fun i => tendsto_pi_nhds.mpr (fun j => ?_))
  -- show expMap (t • M) i j → 1 i j
  have htan := expMap_entry_tangent M i j  -- t⁻¹ * (expMap(t•M) i j - 1 i j) → M i j
  have htto0 : Tendsto (fun t : Cut => t) (𝓝[≠] (0:Cut)) (𝓝 0) :=
    tendsto_id.mono_left nhdsWithin_le_nhds
  have hprod := htto0.mul htan
  have hcong : Tendsto (fun t : Cut => expMap (t • M) i j - (1 : Matrix (Fin 8) (Fin 8) Cut) i j)
      (𝓝[≠] (0:Cut)) (𝓝 (0 * M i j)) := by
    refine hprod.congr' ?_
    filter_upwards [eventually_mem_nhdsWithin] with t ht
    have htne : t ≠ 0 := ht
    field_simp
  simp only [zero_mul] at hcong
  have := hcong.add_const ((1 : Matrix (Fin 8) (Fin 8) Cut) i j)
  simpa using this

end

end Phys.Algebra
