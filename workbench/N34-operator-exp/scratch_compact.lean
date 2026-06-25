import Phys.Foundation.ContinuumTopology
import Phys.Algebra.DerivationAutCompact
import Mathlib.Topology.Constructions
import Mathlib.Topology.Order.Compact
import Mathlib.Topology.Algebra.Order.Field

namespace Phys.Algebra

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-- The set of 8×8 matrices over the derived ℝ whose columns are orthonormal for the standard
    sum (= the Born form in the bO frame). -/
def bornIsometrySet : Set (Fin 8 → Fin 8 → Cut) :=
  {M | ∀ j k : Fin 8, ∑ i : Fin 8, M i j * M i k = if j = k then 1 else 0}

/-- single-entry continuity over the product topology. -/
theorem entry_continuous (i j : Fin 8) :
    Continuous (fun M : Fin 8 → Fin 8 → Cut => M i j) :=
  (continuous_apply j).comp (continuous_apply i)

/-- the column bilinear form is continuous. -/
theorem colBilin_continuous (j k : Fin 8) :
    Continuous (fun M : Fin 8 → Fin 8 → Cut => ∑ i : Fin 8, M i j * M i k) := by
  apply continuous_finset_sum
  intro i _
  exact (entry_continuous i j).mul (entry_continuous i k)

/-- the orthogonal-isometry set is CLOSED (intersection of continuous-equation conditions). -/
theorem bornIsometry_isClosed : IsClosed bornIsometrySet := by
  have : bornIsometrySet =
      ⋂ (j : Fin 8), ⋂ (k : Fin 8),
        {M : Fin 8 → Fin 8 → Cut | ∑ i : Fin 8, M i j * M i k = if j = k then 1 else 0} := by
    ext M; simp only [bornIsometrySet, Set.mem_setOf_eq, Set.mem_iInter]
  rw [this]
  exact isClosed_iInter (fun j => isClosed_iInter (fun k =>
    isClosed_eq (colBilin_continuous j k) continuous_const))

/-- the matrix box `[-1,1]^(8×8)` over the derived ℝ. -/
def matBox : Set (Fin 8 → Fin 8 → Cut) :=
  Set.univ.pi (fun _ : Fin 8 => Set.univ.pi (fun _ : Fin 8 => Set.Icc (-1 : Cut) 1))

theorem matBox_isCompact : IsCompact matBox :=
  isCompact_univ_pi (fun _ => isCompact_univ_pi (fun _ => isCompact_Icc))

/-- the orthogonal-isometry set sits inside the unit box (the diagonal condition bounds entries). -/
theorem bornIsometry_subset_box : bornIsometrySet ⊆ matBox := by
  intro M hM
  simp only [matBox, Set.mem_pi, Set.mem_univ, true_implies, Set.mem_Icc]
  intro i j
  have hdiag : ∑ i' : Fin 8, M i' j * M i' j = 1 := by
    have := hM j j; simpa using this
  have hsq : (M i j)^2 ≤ 1 := by
    have hle : M i j * M i j ≤ ∑ i' : Fin 8, M i' j * M i' j :=
      Finset.single_le_sum (f := fun i' => M i' j * M i' j)
        (fun i' _ => mul_self_nonneg _) (Finset.mem_univ i)
    rw [hdiag] at hle
    nlinarith [hle]
  constructor
  · nlinarith [sq_nonneg (M i j + 1)]
  · nlinarith [sq_nonneg (M i j - 1)]

/-- ★★ THE ORTHOGONAL-ISOMETRY SET IS TOPOLOGICALLY COMPACT (Heine–Borel: closed ⊆ compact box). -/
theorem bornIsometry_isCompact : IsCompact bornIsometrySet :=
  matBox_isCompact.of_isClosed_subset bornIsometry_isClosed bornIsometry_subset_box

/-- the coordinate matrix of an automorphism, cast into the derived ℝ. -/
def autMatrix (φ : AutO) : Fin 8 → Fin 8 → Cut :=
  fun i j => ((coordO ((φ : O ℚ ≃ₗ[ℚ] O ℚ) (bO j)) i : ℚ) : Cut)

/-- ★ THE AUTOMORPHISM GROUP'S COORDINATE IMAGE LANDS IN THE COMPACT ORTHOGONAL-ISOMETRY SET. -/
theorem autMatrix_mem_bornIsometry (φ : AutO) : autMatrix φ ∈ bornIsometrySet := by
  intro j k
  have h := AutO_col_orthogonal φ j k
  have hcast : (∑ i : Fin 8, autMatrix φ i j * autMatrix φ i k)
      = (((∑ i : Fin 8, coordO ((φ : O ℚ ≃ₗ[ℚ] O ℚ) (bO j)) i
            * coordO ((φ : O ℚ ≃ₗ[ℚ] O ℚ) (bO k)) i) : ℚ) : Cut) := by
    unfold autMatrix; push_cast; ring
  rw [hcast, h]
  by_cases hjk : j = k <;> simp [hjk]

/-- NON-VACUITY (W8): the identity automorphism's coordinate matrix is in the set (so the compact
    set is nonempty and the bound is saturated). -/
theorem one_autMatrix_mem_bornIsometry :
    autMatrix (⟨1, one_mem_AutO⟩ : AutO) ∈ bornIsometrySet :=
  autMatrix_mem_bornIsometry _

end

end Phys.Algebra

#print axioms Phys.Algebra.bornIsometry_isClosed
#print axioms Phys.Algebra.bornIsometry_isCompact
#print axioms Phys.Algebra.autMatrix_mem_bornIsometry
#print axioms Phys.Algebra.one_autMatrix_mem_bornIsometry
