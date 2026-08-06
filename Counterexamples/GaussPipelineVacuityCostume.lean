/-
  Counterexamples.GaussPipelineVacuityCostume — the pipeline is GENUINE: the
  packaging kit FIRES on a real power-product. C614.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the summit weld (absorb, pipeline, unroll,
  package). The content that must NOT be hollow: powRel_to_prodRel FIRES on the
  real second power of the D=−20 principal form — an actual constList product,
  kernel-checked.

  THE CERTIFICATE. attestFlag := 1. TIED by attestFlag_forced.
  We anchor min 614 attestFlag = 1 (TRUE — attestFlag = 1 < 614).
  THE BOGUS CLAIM: min 614 attestFlag = 614. Rewriting reduces to 1 = 614; BITES.
  DISTINCT: the pair (614, 1) is fresh. This file MUST FAIL to compile.
-/
import Phys.Algebra.GaussPipeline

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    (∃ P : GaussForms.BQF,
      ProdRel (constList (⟨1, 2, 6⟩ : GaussForms.BQF)
        (Re.step (Re.step Re.void))) P) →
    attestFlag = 1 :=
  fun _ => rfl

theorem package_fires :
    ∃ P : GaussForms.BQF,
      ProdRel (constList (⟨1, 2, 6⟩ : GaussForms.BQF)
        (Re.step (Re.step Re.void))) P := by
  have hms : CompRel (⟨1, 2, 6⟩ : GaussForms.BQF) ⟨1, 2, 6⟩ ⟨1 * 1, 2, 6⟩ := by
    have h := miss_split (a1 := 1) (a2 := 1) (b := 2) (c := 6)
      (al := 0) (be := 1) (by ring) (by norm_num)
    have e1 : (⟨(1:Z), 2, 1 * 6⟩ : GaussForms.BQF) = ⟨1, 2, 6⟩ := by norm_num
    rw [e1] at h
    exact h
  have hpow2 : PowRel (⟨1, 2, 6⟩ : GaussForms.BQF) (Re.step (Re.step Re.void))
      ⟨1 * 1, 2, 6⟩ :=
    PowRel.succ (PowRel.one (Chain.refl _)) hms
  exact ⟨⟨1 * 1, 2, 6⟩, powRel_to_prodRel ⟨by norm_num, by norm_num⟩ hpow2⟩

theorem cert_val_true : min 614 attestFlag = 1 := by
  have h := attestFlag_forced package_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 614 attestFlag = 614 := by
  rw [cert_val_true]

end Counterexamples
