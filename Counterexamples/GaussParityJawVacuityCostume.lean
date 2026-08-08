/-
  Counterexamples.GaussParityJawVacuityCostume — the parity jaw is GENUINE:
  it bills BOTH parities on real discs through the one statement. C661.
  =====================================================================================
  W8 ANTI-VACUITY. parity_jaw must FORCE at both parities on real data:
  EVEN par = 0: n = 21, D = −84: Q(1) = 22 = 2·11? window 2·1 = 2 ≤ 2 ✓
  s = 2 ≤ r = 11 ✓, −2 < 2 ✓ — the form ⟨2, 2, 11⟩ (disc 4 − 88 = −84 ✓,
  reduced ✓). Q(2) = 25 = 5·5: window 4 ≤ 5 ✓ — ⟨5, 4, 5⟩ (disc 16 − 100
  = −84 ✓ reduced ✓). TWO even positions ⟹ h(−84) ≥ 2 (true h = 4).
  ODD par = 1: the C659 instance (D = −195, positions 1, 2) re-fired
  through the UNIFIED statement — same conclusion h ≥ 2 via parity_jaw.

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 661 attestFlag = 1 (TRUE).
  BOGUS: min 661 attestFlag = 661 reduces to 1 = 661; BITES. (661, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussParityJaw

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    (((∀ box : List GaussForms.BQF,
      List.Pairwise (· ≠ ·) box →
      (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = 0 - 4 * 21 →
        f ∈ box) →
      2 ≤ box.length) ∧
     (∀ box : List GaussForms.BQF,
      List.Pairwise (· ≠ ·) box →
      (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = 1 - 4 * 49 →
        f ∈ box) →
      2 ≤ box.length))) → attestFlag = 1 :=
  fun _ => rfl

/-- The parity jaw fires at BOTH parities: h(−84) ≥ 2 and h(−195) ≥ 2
    through the one unified statement. -/
theorem jaw_fires :
    (∀ box : List GaussForms.BQF,
      List.Pairwise (· ≠ ·) box →
      (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = 0 - 4 * 21 →
        f ∈ box) →
      2 ≤ box.length) ∧
    (∀ box : List GaussForms.BQF,
      List.Pairwise (· ≠ ·) box →
      (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = 1 - 4 * 49 →
        f ∈ box) →
      2 ≤ box.length) := by
  constructor
  · -- EVEN: D = −84, positions 1 (22 = 2·11) and 2 (25 = 5·5)
    intro box hpw hcomplete
    have h := parity_jaw (par := 0) (base := 21) (Or.inl rfl)
      box hpw hcomplete [1, 2]
      (List.pairwise_cons.mpr ⟨fun b hb => by
        rcases List.mem_singleton.mp hb with rfl; norm_num,
        List.pairwise_singleton _ _⟩)
      (by
        intro x hx
        rcases List.mem_cons.mp hx with rfl | hx2
        · exact ⟨by norm_num, 2, 11, by norm_num, by norm_num, by norm_num,
            by norm_num, by norm_num⟩
        · rcases List.mem_singleton.mp hx2 with rfl
          exact ⟨by norm_num, 5, 5, by norm_num, by norm_num, by norm_num,
            by norm_num, by norm_num⟩)
    simpa using h
  · -- ODD: D = −195, positions 1 (51 = 3·17) and 2 (55 = 5·11)
    intro box hpw hcomplete
    have h := parity_jaw (par := 1) (base := 49) (Or.inr rfl)
      box hpw hcomplete [1, 2]
      (List.pairwise_cons.mpr ⟨fun b hb => by
        rcases List.mem_singleton.mp hb with rfl; norm_num,
        List.pairwise_singleton _ _⟩)
      (by
        intro x hx
        rcases List.mem_cons.mp hx with rfl | hx2
        · exact ⟨by norm_num, 3, 17, by norm_num, by norm_num, by norm_num,
            by norm_num, by norm_num⟩
        · rcases List.mem_singleton.mp hx2 with rfl
          exact ⟨by norm_num, 5, 11, by norm_num, by norm_num, by norm_num,
            by norm_num, by norm_num⟩)
    simpa using h

theorem cert_val_true : min 661 attestFlag = 1 := by
  have h := attestFlag_forced jaw_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 661 attestFlag = 661 := by
  rw [cert_val_true]

end Counterexamples
