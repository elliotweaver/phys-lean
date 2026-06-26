import Phys.Algebra.DerivationOAutomorphism
import Phys.Foundation.ContinuumScalarDeriv

namespace Phys.Algebra
open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix Filter
open scoped BigOperators Topology
noncomputable section

attribute [local instance] CD.narCD CD.srCD

-- B1: derivMatrix homogeneity
theorem derivMatrix_smul (t : Cut) (D' : Module.End Cut (O Cut)) :
    derivMatrix (t • D') = t • derivMatrix D' := by
  unfold derivMatrix
  ext i j
  simp only [Matrix.smul_apply, smul_eq_mul, LinearMap.toMatrix'_apply]
  rw [LinearEquiv.conjRingEquiv_apply_apply, LinearEquiv.conjRingEquiv_apply_apply]
  simp [LinearMap.smul_apply, map_smul]

-- helper: expTerm M 0 i j = (1:Matrix) i j
theorem expTerm_zero_entry (M : Matrix (Fin 8) (Fin 8) Cut) (i j : Fin 8) :
    expTerm M 0 i j = (1 : Matrix (Fin 8) (Fin 8) Cut) i j := by
  unfold expTerm
  simp [Nat.factorial]

-- helper: expTerm M 1 i j = M i j
theorem expTerm_one_entry (M : Matrix (Fin 8) (Fin 8) Cut) (i j : Fin 8) :
    expTerm M 1 i j = M i j := by
  unfold expTerm
  simp [Nat.factorial]

-- entry projection as a continuous AddMonoidHom (eval ∘ eval), the exact HasSum.map pattern
def entryHom (i j : Fin 8) : Matrix (Fin 8) (Fin 8) Cut →+ Cut :=
  (Pi.evalAddMonoidHom (fun _ : Fin 8 => Cut) j).comp (Pi.evalAddMonoidHom (fun _ : Fin 8 => (Fin 8 → Cut)) i)

theorem entryHom_continuous (i j : Fin 8) : Continuous (entryHom i j) :=
  (continuous_apply j).comp (continuous_apply i)

-- B3: entry-tsum via HasSum.map through the entry projection
theorem expMap_smul_entry (t : Cut) (M : Matrix (Fin 8) (Fin 8) Cut) (i j : Fin 8) :
    expMap (t • M) i j = ∑' n, t ^ n * expTerm M n i j := by
  have hmap := (expMap_hasSum (t • M)).map (entryHom i j) (entryHom_continuous i j)
  have hterm : (⇑(entryHom i j) ∘ expTerm (t • M)) = (fun n => t ^ n * expTerm M n i j) := by
    funext n
    show expTerm (t • M) n i j = t ^ n * expTerm M n i j
    unfold expTerm
    rw [smul_pow]
    simp only [Matrix.smul_apply, smul_eq_mul]
    ring
  rw [hterm] at hmap
  show entryHom i j (expMap (t • M)) = ∑' n, t ^ n * expTerm M n i j
  exact hmap.tsum_eq.symm

-- per-entry derivative — the heart
theorem expMap_entry_tangent (M : Matrix (Fin 8) (Fin 8) Cut) (i j : Fin 8) :
    Tendsto (fun t : Cut => t⁻¹ * (expMap (t • M) i j - (1 : Matrix (Fin 8) (Fin 8) Cut) i j))
      (𝓝[≠] (0 : Cut)) (𝓝 (M i j)) := by
  have hps := cut_powerseries_deriv (fun n => expTerm M n i j)
    (expTerm_entry_abs_summable M i j)
  simp only [expTerm_one_entry] at hps
  refine hps.congr' ?_
  filter_upwards with t
  rw [expMap_smul_entry, expTerm_zero_entry]

end
end Phys.Algebra
