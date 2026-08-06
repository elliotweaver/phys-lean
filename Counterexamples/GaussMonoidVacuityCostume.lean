/-
  Counterexamples.GaussMonoidVacuityCostume — the monoid layer is GENUINE: the p-th
  product FIRES on real second powers. C611.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims swap/mediality/p-th products/merge. The content
  that must NOT be hollow: pth_product FIRES on the real D=−20 principal form's
  second powers — P1 = P2 = e² = (1·1,2,6), their composite from miss_split — and
  the kernel produces an actual w12 with an actual 2-power landing.

  THE CERTIFICATE. attestFlag := 1. TIED by attestFlag_forced.
  We anchor min 611 attestFlag = 1 (TRUE — attestFlag = 1 < 611).
  THE BOGUS CLAIM: min 611 attestFlag = 611. Rewriting reduces to 1 = 611; BITES.
  DISTINCT: the pair (611, 1) is fresh. This file MUST FAIL to compile.
-/
import Phys.Algebra.GaussMonoid

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    (∃ w12 : GaussForms.BQF,
      CompRel (⟨1, 2, 6⟩ : GaussForms.BQF) ⟨1, 2, 6⟩ w12 ∧
      PowRel w12 (Re.step (Re.step Re.void)) ⟨1 * 1, 2, 6⟩) →
    attestFlag = 1 :=
  fun _ => rfl

theorem product_fires :
    ∃ w12 : GaussForms.BQF,
      CompRel (⟨1, 2, 6⟩ : GaussForms.BQF) ⟨1, 2, 6⟩ w12 ∧
      PowRel w12 (Re.step (Re.step Re.void)) ⟨1 * 1, 2, 6⟩ := by
  have hms : CompRel (⟨1, 2, 6⟩ : GaussForms.BQF) ⟨1, 2, 6⟩ ⟨1 * 1, 2, 6⟩ := by
    have h := miss_split (a1 := 1) (a2 := 1) (b := 2) (c := 6)
      (al := 0) (be := 1) (by ring) (by norm_num)
    have e1 : (⟨(1:Z), 2, 1 * 6⟩ : GaussForms.BQF) = ⟨1, 2, 6⟩ := by norm_num
    rw [e1] at h
    exact h
  have he11 : (⟨(1:Z) * 1, 2, 6⟩ : GaussForms.BQF) = ⟨1, 2, 6⟩ := by norm_num
  have hpow2 : PowRel (⟨1, 2, 6⟩ : GaussForms.BQF) (Re.step (Re.step Re.void))
      ⟨1 * 1, 2, 6⟩ :=
    PowRel.succ (PowRel.one (Chain.refl _)) hms
  have hQ : CompRel (⟨(1:Z) * 1, 2, 6⟩ : GaussForms.BQF) ⟨1 * 1, 2, 6⟩
      ⟨1 * 1, 2, 6⟩ := by
    rw [he11]
    exact hms
  obtain ⟨w12, hw12, hQpow⟩ := pth_product
    (w1 := (⟨1, 2, 6⟩ : GaussForms.BQF)) (w2 := ⟨1, 2, 6⟩)
    ⟨-5, 0, 1, by show (-5:Z) * 1 + 0 * 2 + 1 * 6 = 1; norm_num⟩
    ⟨-5, 0, 1, by show (-5:Z) * 1 + 0 * 2 + 1 * 6 = 1; norm_num⟩
    ⟨by norm_num, by norm_num⟩ ⟨by norm_num, by norm_num⟩
    (by show disc (⟨1, 2, 6⟩ : GaussForms.BQF) < 0; unfold disc; norm_num)
    rfl hpow2 hpow2 hQ
  exact ⟨w12, hw12, hQpow⟩

theorem cert_val_true : min 611 attestFlag = 1 := by
  have h := attestFlag_forced product_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 611 attestFlag = 611 := by
  rw [cert_val_true]

end Counterexamples
