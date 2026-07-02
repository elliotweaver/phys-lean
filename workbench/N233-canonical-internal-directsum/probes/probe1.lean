/-
  Probe1 for N233 — canonical internal direct sum of the four g₂-submodules.
  Standalone: mirrors production; test before promotion.
-/
import Phys.Algebra.TowerGatherAmbientProjection1And27

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)
open Submodule

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 1000000

noncomputable section

/-- The four g₂-submodules of `End ℚ ImO`: `1 ⊕ 7 ⊕ 14 ⊕ 27`. -/
def gatherFamily : Fin 4 → Submodule ℚ (Module.End ℚ ImO) :=
  ![trivialLine, LinearMap.range crossEmb, LinearMap.range imRepL, tracelessSym]

@[simp] theorem gatherFamily_zero : gatherFamily 0 = trivialLine := rfl
@[simp] theorem gatherFamily_one : gatherFamily 1 = LinearMap.range crossEmb := rfl
@[simp] theorem gatherFamily_two : gatherFamily 2 = LinearMap.range imRepL := rfl
@[simp] theorem gatherFamily_three : gatherFamily 3 = tracelessSym := rfl

/-! ## `iSup = ⊤` from the four-way resolution. -/

theorem gatherFamily_iSup_eq_top : iSup gatherFamily = ⊤ := by
  rw [eq_top_iff]
  intro X _
  have hres := projTrivial_add_proj27_add_proj7_add_proj14 X
  -- X = projTrivial X + proj27 X + proj7 X + proj14 X, each in its summand
  have h0 : projTrivial X ∈ gatherFamily 0 := by rw [gatherFamily_zero]; exact projTrivial_apply_mem X
  have h1 : proj7 X ∈ gatherFamily 1 := by rw [gatherFamily_one]; exact proj7_apply_mem X
  have h2 : proj14 X ∈ gatherFamily 2 := by rw [gatherFamily_two]; exact proj14_apply_mem X
  have h3 : proj27 X ∈ gatherFamily 3 := by rw [gatherFamily_three]; exact proj27_apply_mem X
  have hle : ∀ i, gatherFamily i ≤ iSup gatherFamily := fun i => le_iSup gatherFamily i
  have hX : X = projTrivial X + proj27 X + proj7 X + proj14 X := hres.symm
  rw [hX]
  refine Submodule.add_mem _ (Submodule.add_mem _ (Submodule.add_mem _ ?_ ?_) ?_) ?_
  · exact hle 0 h0
  · exact hle 3 h3
  · exact hle 1 h1
  · exact hle 2 h2

/-! ## `iSupIndep` from the four orthogonal idempotents. -/

/-- Disjointness of one summand from the sup of the others, via the fixing/killing projector. -/
theorem gatherFamily_iSupIndep : iSupIndep gatherFamily := by
  rw [iSupIndep_def]
  intro i
  rw [Submodule.disjoint_def]
  intro x hxi hxsup
  -- strategy: the i-th projector fixes x (x ∈ A i) and kills x (x ∈ ⨆ j≠i A j) ⟹ x = 0.
  fin_cases i
  · -- i = 0, projector projTrivial, A 0 = trivialLine
    -- fixed: projTrivial x = x ; killed: projTrivial x = 0
    have hfix : projTrivial x = x := projTrivial_apply_triv (by simpa using hxi)
    have hkill : projTrivial x = 0 := by
      -- x ∈ ⨆ j≠0, A j; A 1,2 ⊆ so(7) (killed by skew), A 3 = tracelessSym (killed)
      have : (⨆ (j : Fin 4) (_ : j ≠ 0), gatherFamily j) ≤ LinearMap.ker projTrivial := by
        apply iSup_le; intro j; apply iSup_le; intro hj
        fin_cases j
        · exact absurd rfl hj
        · intro y hy; rw [LinearMap.mem_ker]
          exact projTrivial_apply_skew (crossEmb_range_le_so7' (by simpa using hy))
        · intro y hy; rw [LinearMap.mem_ker]
          exact projTrivial_apply_skew (imRep_range_le_so7 (by simpa using hy))
        · intro y hy; rw [LinearMap.mem_ker]
          exact projTrivial_apply_tracefree (by simpa using hy)
      exact LinearMap.mem_ker.1 (this hxsup)
    rw [← hfix, hkill]
  · -- i = 1, projector proj7, A 1 = range crossEmb
    have hfix : proj7 x = x := proj7_apply_fun (by simpa using hxi)
    have hkill : proj7 x = 0 := by
      have : (⨆ (j : Fin 4) (_ : j ≠ 1), gatherFamily j) ≤ LinearMap.ker proj7 := by
        apply iSup_le; intro j; apply iSup_le; intro hj
        fin_cases j
        · intro y hy; rw [LinearMap.mem_ker]
          exact proj7_apply_self (trivialLine_le_selfAdj (by simpa using hy))
        · exact absurd rfl hj
        · intro y hy; rw [LinearMap.mem_ker]
          exact proj7_apply_adj (by simpa using hy)
        · intro y hy; rw [LinearMap.mem_ker]
          exact proj7_apply_self (tracelessSym_le_selfAdj (by simpa using hy))
      exact LinearMap.mem_ker.1 (this hxsup)
    rw [← hfix, hkill]
  · -- i = 2, projector proj14, A 2 = range imRepL
    have hfix : proj14 x = x := proj14_apply_adj (by simpa using hxi)
    have hkill : proj14 x = 0 := by
      have : (⨆ (j : Fin 4) (_ : j ≠ 2), gatherFamily j) ≤ LinearMap.ker proj14 := by
        apply iSup_le; intro j; apply iSup_le; intro hj
        fin_cases j
        · intro y hy; rw [LinearMap.mem_ker]
          exact proj14_apply_self (trivialLine_le_selfAdj (by simpa using hy))
        · intro y hy; rw [LinearMap.mem_ker]
          exact proj14_apply_fun (by simpa using hy)
        · exact absurd rfl hj
        · intro y hy; rw [LinearMap.mem_ker]
          exact proj14_apply_self (tracelessSym_le_selfAdj (by simpa using hy))
      exact LinearMap.mem_ker.1 (this hxsup)
    rw [← hfix, hkill]
  · -- i = 3, projector proj27, A 3 = tracelessSym
    have hfix : proj27 x = x := proj27_apply_tracefree (by simpa using hxi)
    have hkill : proj27 x = 0 := by
      have : (⨆ (j : Fin 4) (_ : j ≠ 3), gatherFamily j) ≤ LinearMap.ker proj27 := by
        apply iSup_le; intro j; apply iSup_le; intro hj
        fin_cases j
        · intro y hy; rw [LinearMap.mem_ker]
          exact proj27_apply_triv (by simpa using hy)
        · intro y hy; rw [LinearMap.mem_ker]
          exact proj27_apply_skew (crossEmb_range_le_so7' (by simpa using hy))
        · intro y hy; rw [LinearMap.mem_ker]
          exact proj27_apply_skew (imRep_range_le_so7 (by simpa using hy))
        · exact absurd rfl hj
      exact LinearMap.mem_ker.1 (this hxsup)
    rw [← hfix, hkill]

/-! ## THE CANONICAL INTERNAL DIRECT SUM. -/

theorem gatherFamily_isInternal : DirectSum.IsInternal gatherFamily :=
  DirectSum.isInternal_submodule_of_iSupIndep_of_iSup_eq_top
    gatherFamily_iSupIndep gatherFamily_iSup_eq_top

/-! ## DIMENSION IDENTITY. -/

theorem gather_finrank_sum :
    Module.finrank ℚ (gatherFamily 0) + Module.finrank ℚ (gatherFamily 1)
      + Module.finrank ℚ (gatherFamily 2) + Module.finrank ℚ (gatherFamily 3)
      = Module.finrank ℚ (Module.End ℚ ImO) := by
  rw [gatherFamily_zero, gatherFamily_one, gatherFamily_two, gatherFamily_three,
    finrank_trivialLine, finrank_crossEmb_range, finrank_imRep_range,
    finrank_tracelessSym_eq_27, finrank_end_eq_49]

/-! ## EACH SUMMAND g₂-STABLE. -/

theorem gatherFamily_adEnd_inv (D : derivationLieQ) (i : Fin 4) {X : Module.End ℚ ImO}
    (hX : X ∈ gatherFamily i) : adEnd D X ∈ gatherFamily i := by
  fin_cases i
  · exact trivialLine_adEnd_inv D X (by simpa using hX)
  · rw [gatherFamily_one] at hX ⊢; rw [adEnd_apply]; exact crossEmb_range_g2_invariant D hX
  · rw [gatherFamily_two] at hX ⊢; rw [adEnd_apply]; exact imRep_range_g2_invariant D hX
  · exact tracelessSym_adEnd_inv D X (by simpa using hX)

/-! ## CAPSTONE. -/

theorem canonical_internal_directSum_structure :
    DirectSum.IsInternal gatherFamily ∧
    (Module.finrank ℚ (gatherFamily 0) + Module.finrank ℚ (gatherFamily 1)
      + Module.finrank ℚ (gatherFamily 2) + Module.finrank ℚ (gatherFamily 3)
      = Module.finrank ℚ (Module.End ℚ ImO)) ∧
    (∀ (D : derivationLieQ) (i : Fin 4) {X : Module.End ℚ ImO},
      X ∈ gatherFamily i → adEnd D X ∈ gatherFamily i) :=
  ⟨gatherFamily_isInternal, gather_finrank_sum, fun D i hX => gatherFamily_adEnd_inv D i hX⟩

end

end Phys.Algebra
