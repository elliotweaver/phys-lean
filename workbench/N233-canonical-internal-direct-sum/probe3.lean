import Phys.Algebra.TowerGatherAmbientProjection1And27

namespace N233Probe

open Phys.Algebra Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)
open Submodule

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 1000000

noncomputable section

def fourSummands : Fin 4 → Submodule ℚ (Module.End ℚ ImO) :=
  ![trivialLine, LinearMap.range crossEmb, LinearMap.range imRepL, tracelessSym]

def fourProj : Fin 4 → Module.End ℚ (Module.End ℚ ImO) :=
  ![projTrivial, proj7, proj14, proj27]

theorem proj_fix : ∀ (i : Fin 4), ∀ X ∈ fourSummands i, fourProj i X = X := by
  intro i X hX
  fin_cases i
  · exact projTrivial_apply_triv hX
  · exact proj7_apply_fun hX
  · exact proj14_apply_adj hX
  · exact proj27_apply_tracefree hX

theorem proj_kill : ∀ (i j : Fin 4), j ≠ i → fourSummands j ≤ LinearMap.ker (fourProj i) := by
  intro i j hij X hX
  rw [LinearMap.mem_ker]
  fin_cases i
  · fin_cases j
    · exact absurd rfl hij
    · exact projTrivial_apply_skew (crossEmb_range_le_so7' hX)
    · exact projTrivial_apply_skew (imRep_range_le_so7 hX)
    · exact projTrivial_apply_tracefree hX
  · fin_cases j
    · exact proj7_apply_self (trivialLine_le_selfAdj hX)
    · exact absurd rfl hij
    · exact proj7_apply_adj hX
    · exact proj7_apply_self (tracelessSym_le_selfAdj hX)
  · fin_cases j
    · exact proj14_apply_self (trivialLine_le_selfAdj hX)
    · exact proj14_apply_fun hX
    · exact absurd rfl hij
    · exact proj14_apply_self (tracelessSym_le_selfAdj hX)
  · fin_cases j
    · exact proj27_apply_triv hX
    · exact proj27_apply_skew (crossEmb_range_le_so7' hX)
    · exact proj27_apply_skew (imRep_range_le_so7 hX)
    · exact absurd rfl hij

-- Each summand membership of the four terms (unfolds ![...]).
theorem term0_mem (X : Module.End ℚ ImO) : projTrivial X ∈ fourSummands 0 := projTrivial_apply_mem X
theorem term1_mem (X : Module.End ℚ ImO) : proj7 X ∈ fourSummands 1 := proj7_apply_mem X
theorem term2_mem (X : Module.End ℚ ImO) : proj14 X ∈ fourSummands 2 := proj14_apply_mem X
theorem term3_mem (X : Module.End ℚ ImO) : proj27 X ∈ fourSummands 3 := proj27_apply_mem X

-- iSup A = ⊤ from the four-way resolution.
theorem fourSummands_iSup_eq_top : iSup fourSummands = ⊤ := by
  rw [eq_top_iff]
  intro X _
  have hle : ∀ i, fourSummands i ≤ iSup fourSummands := fun i => le_iSup fourSummands i
  have h4 : projTrivial X + proj27 X + proj7 X + proj14 X = X :=
    projTrivial_add_proj27_add_proj7_add_proj14 X
  rw [← h4]
  refine Submodule.add_mem _ (Submodule.add_mem _ (Submodule.add_mem _ ?_ ?_) ?_) ?_
  · exact hle 0 (term0_mem X)
  · exact hle 3 (term3_mem X)
  · exact hle 1 (term1_mem X)
  · exact hle 2 (term2_mem X)

-- iSupIndep A.
theorem fourSummands_iSupIndep : iSupIndep fourSummands := by
  rw [iSupIndep_def]
  intro i
  rw [Submodule.disjoint_def]
  intro x hxi hxsup
  have hfix : fourProj i x = x := proj_fix i x hxi
  have hsuple : (⨆ (j) (_ : j ≠ i), fourSummands j) ≤ LinearMap.ker (fourProj i) :=
    iSup₂_le (fun j hj => proj_kill i j hj)
  have hkill : fourProj i x = 0 := LinearMap.mem_ker.1 (hsuple hxsup)
  rw [hfix] at hkill
  exact hkill

-- IsInternal.
theorem fourSummands_isInternal : DirectSum.IsInternal fourSummands :=
  DirectSum.isInternal_submodule_of_iSupIndep_of_iSup_eq_top
    fourSummands_iSupIndep fourSummands_iSup_eq_top

end

end N233Probe
