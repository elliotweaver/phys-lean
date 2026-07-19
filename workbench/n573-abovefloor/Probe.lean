-- N573 PROBE (VERIFIED — compiled clean against Phys.Algebra.HadronicLevelWeights, ~7s replay).
-- KEY FINDING: the above-floor occupancy does NOT decay. At every level k^2 there are >=16
-- configurations (scaled signed units k*(±e_i)), so occupancy is UNBOUNDED above. The raw-count
-- "series" is therefore NOT a convergent/monotone/<1e-12-bracketable object. A per-level ENTRY
-- (suppression) weight into the coupling would be needed to make a convergent series — and that
-- weight is NOT banked (FreezeoutReweightingBounded already named it unidentified).
import Phys.Algebra.HadronicLevelWeights
import Mathlib.Tactic

namespace Phys.Algebra.N573Probe

open Phys.Algebra
open Phys.Algebra.HadronicLevelWeights
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD

noncomputable section

attribute [local instance] CD.narCD CD.srCD

def scaledUnit (k : ℤ) (i : Fin 8) (s : Bool) : O ℚ :=
  coordO.symm (Pi.single i (if s then (k : ℚ) else -(k : ℚ)))

theorem coordO_scaledUnit (k : ℤ) (i : Fin 8) (s : Bool) :
    coordO (scaledUnit k i s) = Pi.single i (if s then (k : ℚ) else -(k : ℚ)) := by
  unfold scaledUnit; exact coordO.apply_symm_apply _

theorem gForm_scaledUnit (k : ℤ) (i : Fin 8) (s : Bool) :
    gForm (scaledUnit k i s) (scaledUnit k i s) = ((k^2 : ℤ) : ℚ) := by
  rw [gForm_polar, coordO_scaledUnit]
  rw [Finset.sum_eq_single i]
  · simp only [Pi.single_eq_same]; cases s <;> simp <;> push_cast <;> ring
  · intro j _ hj; rw [Pi.single_eq_of_ne hj]; ring
  · intro h; exact absurd (Finset.mem_univ i) h

theorem scaledUnit_intLat (k : ℤ) (i : Fin 8) (s : Bool) : IntLat (scaledUnit k i s) := by
  rw [intLat_iff_coordO]
  intro j
  rw [coordO_scaledUnit]
  by_cases hj : j = i
  · subst hj; rw [Pi.single_eq_same]; cases s
    · exact ⟨-k, by push_cast; ring⟩
    · exact ⟨k, by norm_num⟩
  · rw [Pi.single_eq_of_ne hj]; exact ⟨0, by norm_num⟩

theorem scaledUnit_mem_level (k : ℕ) (i : Fin 8) (s : Bool) :
    scaledUnit (k : ℤ) i s ∈ levelOccupancy (k^2) := by
  refine ⟨scaledUnit_intLat _ i s, ?_⟩
  rw [gForm_scaledUnit]; push_cast; ring

theorem scaledLabel_injective (k : ℤ) (hk : k ≠ 0) :
    Function.Injective (fun p : Bool × Fin 8 => scaledUnit k p.2 p.1) := by
  rintro ⟨s, i⟩ ⟨t, j⟩ hst
  have h := congrArg coordO hst
  rw [coordO_scaledUnit, coordO_scaledUnit] at h
  have hij : i = j := by
    by_contra hne
    have hc := congrFun h i
    rw [Pi.single_eq_same, Pi.single_eq_of_ne hne] at hc
    cases s <;> simp_all <;> exact hk (by exact_mod_cast hc.symm)
  subst hij
  have hsign := congrFun h i
  rw [Pi.single_eq_same, Pi.single_eq_same] at hsign
  have hst2 : s = t := by
    cases s <;> cases t <;> first
      | rfl
      | (exfalso; apply hk
         have hk0 : (k : ℚ) = 0 := by simp only [Bool.false_eq_true, if_true, if_false] at hsign; linarith
         exact_mod_cast hk0)
  subst hst2; rfl

end

end Phys.Algebra.N573Probe
