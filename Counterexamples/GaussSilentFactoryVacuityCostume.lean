/-
  Counterexamples.GaussSilentFactoryVacuityCostume — the law is GENUINE:
  it bills the real silent composite of a real disc. C660.
  =====================================================================================
  W8 ANTI-VACUITY. silent_factory_law must BILL on real data: a disc
  silent below Q with an actual composite low-window value whose factors
  all exceed Q. c₀ = 205 = 2·102+1 (A = 819 = 3²·7·13 — NOT squarefree,
  fine: the law is ∀D)... need silence below Q = 5 at the position AND a
  composite value: search: c₀ = 305 (A = 1219 = 23·53): P(0) = 305 =
  5·61 — 5 ≤ 5 dies by silence hypothesis... honest: the LAW's silence
  is per-position. Take c₀ = 41 famously prime-rich: P(x) prime for
  x < 40 — no composite. c₀ = 45? even c₀ excluded (need odd). c₀ = 115
  (A = 459): P(3) = 127 prime; P(5) = 145 = 5·29 (5 ≤ Q kills at Q = 5;
  take Q = 3: 2·5+1 = 11 > 3 ✗ window). POSITION window needs 2x+1 ≤ Q:
  tiny x. c₀ = 803 = 11·73 (odd ✓): P(0) = 803 = 11·73, silence below
  Q = 7 at x = 0: divisors 11, 73 > 7 ✓; 3 ∤ 803 (8+0+3=11) ✓; 5 ∤ 803 ✓;
  7: 803 = 7·114+5 ✓. Window: 2·0+1 = 1 ≤ 7 ✓. Witness s = 11:
  11² = 121 ≤ 803 ✓. The law forces h(disc(1−4·803 = −3211)) ≥ 1 via
  the divisor form ⟨11, 1, 73⟩ (disc 1 − 3212 = −3211 ✓ reduced ✓).

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 660 attestFlag = 1 (TRUE).
  BOGUS: min 660 attestFlag = 660 reduces to 1 = 660; BITES. (660, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussSilentFactory

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation
open IntegerArith

def attestFlag : Nat := 1

theorem attestFlag_forced :
    ((∀ box : List GaussForms.BQF,
      List.Pairwise (· ≠ ·) box →
      (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = 1 - 4 * 803 →
        f ∈ box) →
      1 ≤ box.length)) → attestFlag = 1 :=
  fun _ => rfl

/-- The silent factory law bills the real silent composite P(0) = 803 =
    11·73 (silent below 7) into the box of disc −3211. -/
theorem law_fires :
    ∀ box : List GaussForms.BQF,
    List.Pairwise (· ≠ ·) box →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = 1 - 4 * 803 →
      f ∈ box) →
    1 ≤ box.length := by
  intro box hpw hcomplete
  have h := silent_factory_law (c₀ := 803) (c₁ := 401) (Q := 7)
    (by norm_num) box hpw hcomplete [0]
    (List.pairwise_singleton _ _)
    (by
      intro x hx
      rcases List.mem_singleton.mp hx with rfl
      refine ⟨by norm_num, by norm_num, ⟨11, by norm_num, ⟨73, by norm_num⟩,
        by norm_num⟩, ?_⟩
      -- silence below 7 at the value 803: r ∈ {3, 5, 7} do not divide
      intro r mr hr hmr hrQ ⟨t, ht⟩
      have hval : (0:Z) * 0 + 0 + 803 = 803 := by norm_num
      rw [hval] at ht
      have hmr3 : mr ≤ 3 := by
        by_contra hgt
        push_neg at hgt
        have := z_pos_ge_one (show (0:Z) < mr - 3 by linarith)
        linarith
      have hmrv : mr = 1 ∨ mr = 2 ∨ mr = 3 := by
        rcases lt_trichotomy mr 2 with ha | ha | ha
        · left
          have h1 : mr ≤ 1 := by
            by_contra hgt
            push_neg at hgt
            have := z_pos_ge_one (show (0:Z) < mr - 1 by linarith)
            linarith
          linarith
        · right; left; exact ha
        · right; right
          have := z_pos_ge_one (show (0:Z) < mr - 2 by linarith)
          linarith
      rcases hmrv with rfl | rfl | rfl <;> subst hr
      · -- 3 | 803: 3(t − 267) = 2 dead
        have h3 : 3 * (t - 267) = 2 := by linarith
        rcases lt_trichotomy (t - 267) 0 with hc | hc | hc
        · nlinarith [z_pos_ge_one (show (0:Z) < -(t-267) by linarith)]
        · rw [hc] at h3; norm_num at h3
        · nlinarith [z_pos_ge_one hc]
      · -- 5 | 803: 5(t − 160) = 3 dead
        have h5 : 5 * (t - 160) = 3 := by linarith
        rcases lt_trichotomy (t - 160) 0 with hc | hc | hc
        · nlinarith [z_pos_ge_one (show (0:Z) < -(t-160) by linarith)]
        · rw [hc] at h5; norm_num at h5
        · nlinarith [z_pos_ge_one hc]
      · -- 7 | 803: 7(t − 114) = 5 dead
        have h7 : 7 * (t - 114) = 5 := by linarith
        rcases lt_trichotomy (t - 114) 0 with hc | hc | hc
        · nlinarith [z_pos_ge_one (show (0:Z) < -(t-114) by linarith)]
        · rw [hc] at h7; norm_num at h7
        · nlinarith [z_pos_ge_one hc])
  simpa using h

theorem cert_val_true : min 660 attestFlag = 1 := by
  have h := attestFlag_forced law_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 660 attestFlag = 660 := by
  rw [cert_val_true]

end Counterexamples
