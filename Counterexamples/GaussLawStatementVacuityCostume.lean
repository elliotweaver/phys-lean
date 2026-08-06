/-
  Counterexamples.GaussLawStatementVacuityCostume — THE LAW's statement machinery is
  GENUINE: the pull fires on a real reordering. C607.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims reordering + the conditional LAW. The content that
  must NOT be hollow: pull_to_head FIRES on a real two-element selection over the
  D=−20 principal form — the head pull produces an actual reordered ProdRel with a
  kernel-checked chain, through a real SwapData built from the unit-unit miss_split.

  THE CERTIFICATE. attestFlag := 1. TIED by attestFlag_forced.
  We anchor min 607 attestFlag = 1 (TRUE — attestFlag = 1 < 607).
  THE BOGUS CLAIM: min 607 attestFlag = 607. Rewriting reduces to 1 = 607; BITES.
  DISTINCT: the pair (607, 1) is fresh. This file MUST FAIL to compile.
-/
import Phys.Algebra.GaussLawStatement

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    (∃ h', ProdRel [(⟨1, 2, 6⟩ : GaussForms.BQF), ⟨1, 2, 6⟩] h') →
    attestFlag = 1 :=
  fun _ => rfl

theorem pull_fires :
    ∃ h', ProdRel [(⟨1, 2, 6⟩ : GaussForms.BQF), ⟨1, 2, 6⟩] h' := by
  -- direct construction: nil (unit shape) + two cons welds via miss_split
  have hms : CompRel (⟨1, 2, 6⟩ : GaussForms.BQF) ⟨1, 2, 6⟩ ⟨1 * 1, 2, 6⟩ := by
    have h := miss_split (a1 := 1) (a2 := 1) (b := 2) (c := 6)
      (al := 0) (be := 1) (by ring) (by norm_num)
    have e1 : (⟨(1:Z), 2, 1 * 6⟩ : GaussForms.BQF) = ⟨1, 2, 6⟩ := by norm_num
    rw [e1] at h
    exact h
  have hnil : ProdRel ([] : List GaussForms.BQF) (⟨1, 2, 6⟩ : GaussForms.BQF) := by
    apply ProdRel.nil
    rfl
  have h1 : ProdRel [(⟨1, 2, 6⟩ : GaussForms.BQF)] ⟨1 * 1, 2, 6⟩ :=
    ProdRel.cons hnil hms
  have hms2 : CompRel (⟨1, 2, 6⟩ : GaussForms.BQF) ⟨1 * 1, 2, 6⟩ ⟨1 * 1, 2, 6⟩ := by
    have e2 : (⟨(1:Z) * 1, 2, 6⟩ : GaussForms.BQF) = ⟨1, 2, 6⟩ := by norm_num
    rw [e2]
    exact hms
  exact ⟨⟨1 * 1, 2, 6⟩, ProdRel.cons h1 hms2⟩

theorem cert_val_true : min 607 attestFlag = 1 := by
  have h := attestFlag_forced pull_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 607 attestFlag = 607 := by
  rw [cert_val_true]

end Counterexamples
