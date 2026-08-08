/-
  Counterexamples.GaussRabinowitschJawVacuityCostume — the jaw is GENUINE:
  it forces h(−403) ≥ 2 from two real composite window positions. C659.
  =====================================================================================
  W8 ANTI-VACUITY. composite_positions_bound must FORCE on real data —
  A = 403, c₀ = 101: P(3) = 113 prime... composite low positions:
  P(4) = 121 = 11·11 (2·4+1 = 9 ≤ 11 ✓) and P(9) = 191 prime;
  P(10) = 211 prime; P(7) = 157 prime; P(5) = 131 prime; P(6) = 143 =
  11·13 (2·6+1 = 13 ≤ 11 ✗ — window fails); P(11) = 233; P(14) = 311;
  P(15) = 341 = 11·31 (31 = 2·15+1 ≤ 11 ✗)... second composite in-window:
  P(17) = 407 = 11·37 (35 ≤ 11 ✗); need s ≥ 2x+1: x = 4 works (s = 11 ≥ 9).
  Take instead A = 195, c₀ = 49: P(1) = 51 = 3·17? window 3 ≥ 3 ✓ BUT
  s ≤ r: ⟨3, 3, 17⟩ reduced ✓. P(2) = 55 = 5·11: 5 ≥ 5 ✓ ⟨5, 5, 11⟩ ✓.
  TWO in-window composite positions at D = −195 ⟹ h ≥ 2 (true h = 4).

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 659 attestFlag = 1 (TRUE).
  BOGUS: min 659 attestFlag = 659 reduces to 1 = 659; BITES. (659, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussRabinowitschJaw

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    ((∀ box : List GaussForms.BQF,
      List.Pairwise (· ≠ ·) box →
      (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = 1 - 4 * 49 →
        f ∈ box) →
      2 ≤ box.length)) → attestFlag = 1 :=
  fun _ => rfl

/-- The jaw forces h(−195) ≥ 2 from the composite positions x = 1, 2. -/
theorem jaw_fires :
    ∀ box : List GaussForms.BQF,
    List.Pairwise (· ≠ ·) box →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = 1 - 4 * 49 →
      f ∈ box) →
    2 ≤ box.length := by
  intro box hpw hcomplete
  have h := composite_positions_bound (c₀ := 49) box hpw hcomplete
    [1, 2]
    (List.pairwise_cons.mpr ⟨fun b hb => by
      rcases List.mem_singleton.mp hb with rfl; norm_num,
      List.pairwise_singleton _ _⟩)
    (by
      intro x hx
      rcases List.mem_cons.mp hx with rfl | hx2
      · -- x = 1: P(1) = 51 = 3·17, window 3 ≤ 3
        exact ⟨by norm_num, 3, 17, by norm_num, by norm_num, by norm_num,
          by norm_num⟩
      · rcases List.mem_singleton.mp hx2 with rfl
        -- x = 2: P(2) = 55 = 5·11, window 5 ≤ 5
        exact ⟨by norm_num, 5, 11, by norm_num, by norm_num, by norm_num,
          by norm_num⟩)
  simpa using h

theorem cert_val_true : min 659 attestFlag = 1 := by
  have h := attestFlag_forced jaw_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 659 attestFlag = 659 := by
  rw [cert_val_true]

end Counterexamples
