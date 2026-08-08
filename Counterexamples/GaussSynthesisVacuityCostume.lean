/-
  Counterexamples.GaussSynthesisVacuityCostume — the synthesis kit is
  GENUINE: the conversion counts real supply; the silent-distinctness
  kills real sharing. C664.
  =====================================================================================
  W8 ANTI-VACUITY. Two fires: (1) supply_to_seedcount on the REAL supply
  of D = −195: qs = [3, 5] (both touch — P(1) = 51 = 3·17, P(2) = 55 =
  5·11 — both deep) forces every complete touching list ≥ 2. (2)
  silent_supply_distinct's teeth on the REAL sharing pair of c₀ = 5:
  P(0) = 5 = 5·1, P(4) = 25 = 5·5 share s = 5; the theorem derives
  False from span 0+4+1 = 5 ≤ Q = 4 — fired as the conditional
  (span ≤ 4 → False), which is its exact synthesis use (sharing forces
  span > Q: the composites diversify).

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 664 attestFlag = 1 (TRUE).
  BOGUS: min 664 attestFlag = 664 reduces to 1 = 664; BITES. (664, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussSynthesis

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation
open IntegerArith

def attestFlag : Nat := 1

def fiveRe : Re := Re.step (Re.step (Re.step (Re.step (Re.step Re.void))))

theorem attestFlag_forced :
    (((∀ ps : List Z,
      (∀ p mp : Z, p = 2 * mp + 1 → 1 ≤ mp →
        4 * (p * p) ≤ (195 : Z) → (∃ x w : Z, x * x + x + 49 = p * w) →
        p ∈ ps) →
      List.Pairwise (· ≠ ·) ps →
      2 ≤ ps.length) ∧
     ((0 : Z) + 4 + 1 ≤ 4 → False))) → attestFlag = 1 :=
  fun _ => rfl

theorem ofRe_five : Z.ofRe fiveRe = (5 : Z) := by
  show Z.ofRe (Re.step (Re.step (Re.step (Re.step (Re.step Re.void))))) = (5 : Z)
  have h1 : Re.step (Re.step (Re.step (Re.step (Re.step Re.void))))
      = Re.step (Re.step (Re.step (Re.step Re.void))) + Re.step Re.void := by
    rw [Re.step_add]
    rfl
  have h2 : Re.step (Re.step (Re.step (Re.step Re.void)))
      = Re.step (Re.step (Re.step Re.void)) + Re.step Re.void := by
    rw [Re.step_add]
    rfl
  have h3 : Re.step (Re.step (Re.step Re.void))
      = Re.step (Re.step Re.void) + Re.step Re.void := by
    rw [Re.step_add]
    rfl
  rw [h1, Z.ofRe_add, h2, Z.ofRe_add, h3, Z.ofRe_add]
  have hv : Z.ofRe (Re.step Re.void) = (1 : Z) := Z.ofRe_one
  have h2' : Z.ofRe (Re.step (Re.step Re.void)) = (2 : Z) := ofRe_two
  rw [h2', hv]
  norm_num

/-- PrimeRe 5 — the C647 divisor-shape pattern at 5. -/
theorem prime_five : PrimeRe fiveRe := by
  constructor
  · refine lt_iff_step_le.mpr ⟨Re.step (Re.step (Re.step Re.void)), ?_⟩
    show fiveRe = Re.step oneR + Re.step (Re.step (Re.step Re.void))
    rfl
  · intro d hd
    obtain ⟨c, hc⟩ := hd
    have hz : Z.ofRe d * Z.ofRe c = (5 : Z) := by
      rw [← Z.ofRe_mul, ← hc, ofRe_five]
    have hd0 := ofRe_nonneg d
    have hc0 := ofRe_nonneg c
    have hc1 : (1 : Z) ≤ Z.ofRe c := by
      rcases lt_trichotomy (Z.ofRe c) 1 with h | h | h
      · exfalso
        have hceq : Z.ofRe c = 0 := by
          rcases lt_trichotomy (Z.ofRe c) 0 with hh | hh | hh
          · linarith
          · exact hh
          · exfalso; have := z_pos_ge_one hh; linarith
        rw [hceq, mul_zero] at hz
        norm_num at hz
      · linarith
      · linarith
    have hd1 : (1 : Z) ≤ Z.ofRe d := by
      rcases lt_trichotomy (Z.ofRe d) 1 with h | h | h
      · exfalso
        have hdeq : Z.ofRe d = 0 := by
          rcases lt_trichotomy (Z.ofRe d) 0 with hh | hh | hh
          · linarith
          · exact hh
          · exfalso; have := z_pos_ge_one hh; linarith
        rw [hdeq, zero_mul] at hz
        norm_num at hz
      · linarith
      · linarith
    have hd5 : Z.ofRe d ≤ 5 := by nlinarith
    have hdv : Z.ofRe d = 1 ∨ Z.ofRe d = 2 ∨ Z.ofRe d = 3 ∨
        Z.ofRe d = 4 ∨ Z.ofRe d = 5 := by
      rcases lt_trichotomy (Z.ofRe d) 2 with h | h | h
      · left
        have : Z.ofRe d ≤ 1 := by
          by_contra hgt
          push_neg at hgt
          have := z_pos_ge_one (show (0:Z) < Z.ofRe d - 1 by linarith)
          linarith
        linarith
      · right; left; exact h
      · rcases lt_trichotomy (Z.ofRe d) 3 with h3 | h3 | h3
        · exfalso
          have := z_pos_ge_one (show (0:Z) < Z.ofRe d - 2 by linarith)
          linarith
        · right; right; left; exact h3
        · rcases lt_trichotomy (Z.ofRe d) 4 with h4 | h4 | h4
          · exfalso
            have := z_pos_ge_one (show (0:Z) < Z.ofRe d - 3 by linarith)
            linarith
          · right; right; right; left; exact h4
          · right; right; right; right
            have : (5:Z) ≤ Z.ofRe d := by
              have := z_pos_ge_one (show (0:Z) < Z.ofRe d - 4 by linarith)
              linarith
            linarith
    rcases hdv with hv | hv | hv | hv | hv
    · left
      apply Z.ofRe_injective
      rw [hv]
      exact Z.ofRe_one.symm
    · exfalso
      rw [hv] at hz
      have h2 : 2 * (Z.ofRe c - 2) = 1 := by linarith
      rcases lt_trichotomy (Z.ofRe c - 2) 0 with hcc | hcc | hcc
      · nlinarith [z_pos_ge_one (show (0:Z) < -(Z.ofRe c - 2) by linarith)]
      · rw [hcc] at h2; norm_num at h2
      · nlinarith [z_pos_ge_one hcc]
    · exfalso
      rw [hv] at hz
      have h3 : 3 * (Z.ofRe c - 1) = 2 := by linarith
      rcases lt_trichotomy (Z.ofRe c - 1) 0 with hcc | hcc | hcc
      · nlinarith [z_pos_ge_one (show (0:Z) < -(Z.ofRe c - 1) by linarith)]
      · rw [hcc] at h3; norm_num at h3
      · nlinarith [z_pos_ge_one hcc]
    · exfalso
      rw [hv] at hz
      have h4 : 4 * (Z.ofRe c - 1) = 1 := by linarith
      rcases lt_trichotomy (Z.ofRe c - 1) 0 with hcc | hcc | hcc
      · nlinarith [z_pos_ge_one (show (0:Z) < -(Z.ofRe c - 1) by linarith)]
      · rw [hcc] at h4; norm_num at h4
      · nlinarith [z_pos_ge_one hcc]
    · right
      apply Z.ofRe_injective
      rw [hv]
      exact ofRe_five.symm

/-- Both synthesis pieces fire on real data. -/
theorem synthesis_fires :
    (∀ ps : List Z,
      (∀ p mp : Z, p = 2 * mp + 1 → 1 ≤ mp →
        4 * (p * p) ≤ (195 : Z) → (∃ x w : Z, x * x + x + 49 = p * w) →
        p ∈ ps) →
      List.Pairwise (· ≠ ·) ps →
      2 ≤ ps.length) ∧
    ((0 : Z) + 4 + 1 ≤ 4 → False) := by
  constructor
  · intro ps hcomplete hpw
    have h := supply_to_seedcount (c₀ := 49) (A := 195) [3, 5]
      (List.pairwise_cons.mpr ⟨fun b hb => by
        rcases List.mem_singleton.mp hb with rfl; norm_num,
        List.pairwise_singleton _ _⟩)
      (by
        intro q hq
        rcases List.mem_cons.mp hq with rfl | hq5
        · exact ⟨⟨1, by norm_num, by norm_num⟩, by norm_num,
            ⟨1, 17, by norm_num⟩⟩
        · rcases List.mem_singleton.mp hq5 with rfl
          exact ⟨⟨2, by norm_num, by norm_num⟩, by norm_num,
            ⟨2, 11, by norm_num⟩⟩)
      ps hcomplete hpw
    simpa using h
  · intro hspan
    exact silent_supply_distinct (c₀ := 5) (Q := 4) (s := 5)
      (x := 0) (x' := 4) (w := 1) (w' := 5) (p := fiveRe)
      ofRe_five.symm prime_five (by norm_num)
      (by norm_num) (by norm_num) (by norm_num) (by norm_num) hspan

theorem cert_val_true : min 664 attestFlag = 1 := by
  have h := attestFlag_forced synthesis_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 664 attestFlag = 664 := by
  rw [cert_val_true]

end Counterexamples
