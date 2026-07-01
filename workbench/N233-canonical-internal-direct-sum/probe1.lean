import Phys.Algebra.TowerGatherAmbientProjection1And27

namespace N233Probe

open Phys.Algebra Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)
open Submodule

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 1000000

noncomputable section

/-- The four g₂-submodules of `End ℚ ImO`: 1 ⊕ 7 ⊕ 14 ⊕ 27. -/
def fourSummands : Fin 4 → Submodule ℚ (Module.End ℚ ImO) :=
  ![trivialLine, LinearMap.range crossEmb, LinearMap.range imRepL, tracelessSym]

/-- The four matched ambient projectors. -/
def fourProj : Fin 4 → Module.End ℚ (Module.End ℚ ImO) :=
  ![projTrivial, proj7, proj14, proj27]

-- TEST 1: does `![...]` reduce for concrete indices?
example : fourSummands 0 = trivialLine := rfl
example : fourSummands 1 = LinearMap.range crossEmb := rfl
example : fourSummands 2 = LinearMap.range imRepL := rfl
example : fourSummands 3 = tracelessSym := rfl
example : fourProj 0 = projTrivial := rfl
example : fourProj 3 = proj27 := rfl

-- TEST 2: FIX family — P i fixes A i.
theorem proj_fix : ∀ (i : Fin 4), ∀ X ∈ fourSummands i, fourProj i X = X := by
  intro i X hX
  fin_cases i
  · exact projTrivial_apply_triv hX
  · exact proj7_apply_fun hX
  · exact proj14_apply_adj hX
  · exact proj27_apply_tracefree hX

-- TEST 3: KILL family — A j ≤ ker (P i) for j ≠ i.
theorem proj_kill : ∀ (i j : Fin 4), j ≠ i → fourSummands j ≤ LinearMap.ker (fourProj i) := by
  intro i j hij X hX
  rw [LinearMap.mem_ker]
  fin_cases i <;> fin_cases j <;>
    simp_all only [ne_eq, not_true_eq_false] <;>
    first
      | (exact projTrivial_apply_skew (crossEmb_range_le_so7' hX))
      | (exact projTrivial_apply_skew (imRep_range_le_so7 hX))
      | (exact projTrivial_apply_tracefree hX)
      | (exact proj7_apply_self (trivialLine_le_selfAdj hX))
      | (exact proj7_apply_adj hX)
      | (exact proj7_apply_self (tracelessSym_le_selfAdj hX))
      | (exact proj14_apply_self (trivialLine_le_selfAdj hX))
      | (exact proj14_apply_fun hX)
      | (exact proj14_apply_self (tracelessSym_le_selfAdj hX))
      | (exact proj27_apply_triv hX)
      | (exact proj27_apply_skew (crossEmb_range_le_so7' hX))
      | (exact proj27_apply_skew (imRep_range_le_so7 hX))

end

end N233Probe
