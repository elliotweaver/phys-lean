import Phys.Algebra.DerivationOTangent
import Phys.Foundation.ContinuumScalarDeriv2

namespace Phys.Algebra

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix Filter
open scoped BigOperators Topology

noncomputable section

attribute [local instance] CD.narCD CD.srCD

theorem expTerm_two_entry (M : Matrix (Fin 8) (Fin 8) Cut) (i j : Fin 8) :
    expTerm M 2 i j = (1 / 2 : Cut) * (M ^ 2) i j := by
  unfold expTerm
  simp [Nat.factorial, Matrix.smul_apply, smul_eq_mul]

theorem expMap_entry_tangent2 (M : Matrix (Fin 8) (Fin 8) Cut) (i j : Fin 8) :
    Tendsto (fun t : Cut => (t ^ 2)⁻¹ *
        (expMap (t • M) i j - (1 : Matrix (Fin 8) (Fin 8) Cut) i j - t * M i j))
      (𝓝[≠] (0 : Cut)) (𝓝 (expTerm M 2 i j)) := by
  have hps := cut_powerseries_deriv2 (fun n => expTerm M n i j)
    (expTerm_entry_abs_summable M i j)
  refine hps.congr' ?_
  filter_upwards with t
  rw [expMap_smul_entry, expTerm_zero_entry, expTerm_one_entry]

theorem expMap_smul_tangent2 (M : Matrix (Fin 8) (Fin 8) Cut) :
    Tendsto (fun t : Cut => (t ^ 2)⁻¹ • (expMap (t • M) - 1 - t • M))
      (𝓝[≠] (0 : Cut)) (𝓝 ((1 / 2 : Cut) • M ^ 2)) := by
  refine tendsto_pi_nhds.mpr (fun i => tendsto_pi_nhds.mpr (fun j => ?_))
  have htgt : ((1 / 2 : Cut) • M ^ 2) i j = expTerm M 2 i j := by
    rw [expTerm_two_entry]; simp [Matrix.smul_apply, smul_eq_mul]
  rw [htgt]
  refine (expMap_entry_tangent2 M i j).congr' ?_
  filter_upwards with t
  simp only [Matrix.smul_apply, Matrix.sub_apply, smul_eq_mul]

theorem expMap_vec_tangent2 (M : Matrix (Fin 8) (Fin 8) Cut) (v : Fin 8 → Cut) :
    Tendsto (fun t : Cut => (t ^ 2)⁻¹ • (expMap (t • M) *ᵥ v - v - t • (M *ᵥ v)))
      (𝓝[≠] (0 : Cut)) (𝓝 ((1 / 2 : Cut) • (M ^ 2 *ᵥ v))) := by
  have h := ((mulVecHom_continuous v).tendsto ((1 / 2 : Cut) • M ^ 2)).comp
    (expMap_smul_tangent2 M)
  have htgt : mulVecHom v ((1 / 2 : Cut) • M ^ 2) = (1 / 2 : Cut) • (M ^ 2 *ᵥ v) := by
    show ((1 / 2 : Cut) • M ^ 2) *ᵥ v = (1 / 2 : Cut) • (M ^ 2 *ᵥ v)
    rw [Matrix.smul_mulVec]
  rw [htgt] at h
  refine h.congr' ?_
  filter_upwards with t
  show mulVecHom v ((t ^ 2)⁻¹ • (expMap (t • M) - 1 - t • M))
      = (t ^ 2)⁻¹ • (expMap (t • M) *ᵥ v - v - t • (M *ᵥ v))
  show ((t ^ 2)⁻¹ • (expMap (t • M) - 1 - t • M)) *ᵥ v
      = (t ^ 2)⁻¹ • (expMap (t • M) *ᵥ v - v - t • (M *ᵥ v))
  rw [Matrix.smul_mulVec, Matrix.sub_mulVec, Matrix.sub_mulVec, Matrix.one_mulVec,
    Matrix.smul_mulVec]

theorem expO_tangent2 (D' : Module.End Cut (O Cut)) (x : O Cut) :
    Tendsto (fun t : Cut => (t ^ 2)⁻¹ • (expO ((t • D').restrictScalars ℤ) x - x - t • (D' x)))
      (𝓝[≠] (0 : Cut)) (𝓝 ((1 / 2 : Cut) • ((D' ^ 2) x))) := by
  have hDx : coordOCut (D' x) = derivMatrix D' *ᵥ coordOCut x := by
    have h := expO_matrix_rep D' 1 x; simpa using h
  have himg : Tendsto
      (fun t : Cut => coordOCut ((t ^ 2)⁻¹ • (expO ((t • D').restrictScalars ℤ) x - x - t • (D' x))))
      (𝓝[≠] (0 : Cut)) (𝓝 (coordOCut ((1 / 2 : Cut) • ((D' ^ 2) x)))) := by
    have hrw : (fun t : Cut => coordOCut ((t ^ 2)⁻¹ • (expO ((t • D').restrictScalars ℤ) x - x - t • (D' x))))
        = (fun t : Cut => (t ^ 2)⁻¹ • (expMap (t • derivMatrix D') *ᵥ coordOCut x
            - coordOCut x - t • (derivMatrix D' *ᵥ coordOCut x))) := by
      funext t
      rw [map_smul, map_sub, map_sub, map_smul, coordOCut_expO, derivMatrix_smul, hDx]
    rw [hrw]
    have htgt : coordOCut ((1 / 2 : Cut) • ((D' ^ 2) x))
        = (1 / 2 : Cut) • (derivMatrix D' ^ 2 *ᵥ coordOCut x) := by
      rw [map_smul, expO_matrix_rep D' 2 x]
    rw [htgt]
    exact expMap_vec_tangent2 (derivMatrix D') (coordOCut x)
  have hpull := (coordOCut_symm_continuous.tendsto (coordOCut ((1 / 2 : Cut) • ((D' ^ 2) x)))).comp himg
  simp only [Function.comp_def, LinearEquiv.symm_apply_apply] at hpull
  exact hpull

theorem expO_tangent2_zero (x : O Cut) :
    Tendsto (fun t : Cut => (t ^ 2)⁻¹ •
        (expO ((t • (0 : Module.End Cut (O Cut))).restrictScalars ℤ) x - x - t • ((0 : Module.End Cut (O Cut)) x)))
      (𝓝[≠] (0 : Cut)) (𝓝 ((1 / 2 : Cut) • (((0 : Module.End Cut (O Cut)) ^ 2) x))) :=
  expO_tangent2 0 x

end

end Phys.Algebra

#print axioms Phys.Algebra.expTerm_two_entry
#print axioms Phys.Algebra.expMap_entry_tangent2
#print axioms Phys.Algebra.expMap_smul_tangent2
#print axioms Phys.Algebra.expMap_vec_tangent2
#print axioms Phys.Algebra.expO_tangent2
#print axioms Phys.Algebra.expO_tangent2_zero
