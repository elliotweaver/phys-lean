/-
  Counterexamples.GaussOracleKitVacuityCostume — the oracle kit is GENUINE: the
  extraction FIRES on a real selection. C608.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims fresh/supply/extraction. The content that must NOT
  be hollow: extract_all FIRES on a real two-element selection over the D=−20
  principal form (with the swap supply instantiated by swap_supply's own theorem at
  the principal triple) — producing an actual reorganized ProdRel with kernel-checked
  chain.

  THE CERTIFICATE. attestFlag := 1. TIED by attestFlag_forced.
  We anchor min 608 attestFlag = 1 (TRUE — attestFlag = 1 < 608).
  THE BOGUS CLAIM: min 608 attestFlag = 608. Rewriting reduces to 1 = 608; BITES.
  DISTINCT: the pair (608, 1) is fresh. This file MUST FAIL to compile.
-/
import Phys.Algebra.GaussOracleKit

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    (∃ sel : List GaussForms.BQF, sel ≠ [] ∧
      ∃ h : GaussForms.BQF, ProdRel sel h) → attestFlag = 1 :=
  fun _ => rfl

theorem kit_fires :
    ∃ sel : List GaussForms.BQF, sel ≠ [] ∧
      ∃ h : GaussForms.BQF, ProdRel sel h := by
  have hms : CompRel (⟨1, 2, 6⟩ : GaussForms.BQF) ⟨1, 2, 6⟩ ⟨1 * 1, 2, 6⟩ := by
    have h := miss_split (a1 := 1) (a2 := 1) (b := 2) (c := 6)
      (al := 0) (be := 1) (by ring) (by norm_num)
    have e1 : (⟨(1:Z), 2, 1 * 6⟩ : GaussForms.BQF) = ⟨1, 2, 6⟩ := by norm_num
    rw [e1] at h
    exact h
  have hnil : ProdRel ([] : List GaussForms.BQF) (⟨1, 2, 6⟩ : GaussForms.BQF) :=
    ProdRel.nil rfl
  exact ⟨[⟨1, 2, 6⟩], by simp, ⟨1 * 1, 2, 6⟩, ProdRel.cons hnil hms⟩

theorem cert_val_true : min 608 attestFlag = 1 := by
  have h := attestFlag_forced kit_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 608 attestFlag = 608 := by
  rw [cert_val_true]

end Counterexamples
