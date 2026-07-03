import Phys.Algebra.TowerGatherForcedHyperchargeDirection
import Phys.Algebra.TowerGatherReductiveGaugeLie
import Phys.Algebra.DerivationColourIsospinTraceForm
import Phys.Algebra.DerivationColourIsospinMeet
import Phys.Algebra.TowerGatherIsometry
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

noncomputable section

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

local notation "B" => isospinTraceForm

theorem isospin_indep3 (a b c : ℚ) (h : a • DI + b • DJ + c • DK = 0) :
    a = 0 ∧ b = 0 ∧ c = 0 := by
  have hIJ : B DI DJ = 0 := traceForm_DI_DJ
  have hJK : B DJ DK = 0 := traceForm_DJ_DK
  have hKI : B DK DI = 0 := traceForm_DK_DI
  have hJI : B DJ DI = 0 := by rw [LieModule.traceForm_comm ℚ derivationLieQ (O ℚ) DJ DI]; exact hIJ
  have hKJ : B DK DJ = 0 := by rw [LieModule.traceForm_comm ℚ derivationLieQ (O ℚ) DK DJ]; exact hJK
  have hIK : B DI DK = 0 := by rw [LieModule.traceForm_comm ℚ derivationLieQ (O ℚ) DI DK]; exact hKI
  have hII : B DI DI = -16 := traceForm_DI_DI
  have hJJ : B DJ DJ = -16 := traceForm_DJ_DJ
  have hKK : B DK DK = -16 := traceForm_DK_DK
  have eI : B (a • DI + b • DJ + c • DK) DI = 0 := by rw [h]; simp
  have eJ : B (a • DI + b • DJ + c • DK) DJ = 0 := by rw [h]; simp
  have eK : B (a • DI + b • DJ + c • DK) DK = 0 := by rw [h]; simp
  simp only [map_add, LinearMap.add_apply, map_smul, LinearMap.smul_apply, smul_eq_mul,
    hII, hJJ, hKK, hIJ, hJK, hKI, hJI, hKJ, hIK] at eI eJ eK
  exact ⟨by linarith, by linarith, by linarith⟩

-- linear independence of the family ![DI,DJ,DK]
theorem isospin_linearIndependent : LinearIndependent ℚ ![DI, DJ, DK] := by
  rw [Fintype.linearIndependent_iff]
  intro g hg
  have h : g 0 • DI + g 1 • DJ + g 2 • DK = 0 := by
    have := hg
    simp only [Fin.sum_univ_three, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.cons_val_two, Matrix.tail_cons] at this
    linear_combination (norm := abel) this
  obtain ⟨h0, h1, h2⟩ := isospin_indep3 (g 0) (g 1) (g 2) h
  intro i; fin_cases i <;> assumption

-- finrank of the span
theorem finrank_isospinSpan : Module.finrank ℚ isospinSpan = 3 := by
  have : isospinSpan = Submodule.span ℚ (Set.range ![DI, DJ, DK]) := by
    rw [isospinSpan]; congr 1
    rw [Matrix.range_cons, Matrix.range_cons, Matrix.range_cons, Matrix.range_empty]
    ext x; simp only [Set.mem_insert_iff, Set.mem_singleton_iff, Set.union_empty,
      Set.mem_union]
  rw [this, finrank_span_eq_card isospin_linearIndependent]
  simp

end

end Phys.Algebra
