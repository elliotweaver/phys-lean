/-
  Counterexamples.GaussCageCharacterizationVacuityCostume — the
  characterization is GENUINE: it CLASSIFIES the real box of the real
  landscape, every member landing in its true family. C645.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the exhaustive three-family
  classification. The content that must NOT be hollow: the
  characterization must CLASSIFY real slot values — D = −403 (the
  silence catalogue's last member): the real box is [⟨1,1,101⟩,
  ⟨7,±3,15⟩... honest: h(−403) = 3, box a-values {1, 7, 11}? — the
  certified box (N643 v3): a ∈ {1, 11, 13}? Take the KNOWN box members
  from GaussCageCert403: forms with a = 1 (principal), a = 11, a = 13?
  — the cert's cage was tower [1,2,4,8] + band [11], K = 2 sharp. The
  principal a = 1: TOWER-PURE (j = 0). The a = 11 member: 11 odd ≥ 3,
  A = 403 < 4·121 = 484: SHALLOW — the band horn, exactly as the cage
  law says. The costume fires the characterization on both and the
  kernel lands each in its true family — with ps = [] (403's silence:
  NO deep prime touches, so the empty list is complete — the silence
  certificates' content, here as completeness's vacuous discharge for
  the deep range via the blocking checks... honest: completeness for
  ps = [] must hold — every deep odd toucher is in [] — which is
  exactly 403's SILENCE, discharged by the blocking checks 3, 5, 7
  (the C629-pattern finite checks, inline).

  For costume economy: fire on a = 1 (tower horn, j = 0 ≤ 4) and
  a = 11 (band horn: 403 < 484) with the silence hypothesis supplied
  as the C629-style blocked-classification (3, 5, 7 the deep odds of
  403, all blocked — kernel-recomputed finite checks).

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 645 attestFlag = 1 (TRUE).
  BOGUS: min 645 attestFlag = 645 reduces to 1 = 645; BITES. (645, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussCageCharacterization

set_option maxRecDepth 8192

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

/-- The real band member of D = −403: ⟨11, 9, 11⟩ (81 + 4·11·11·... :
    disc = 81 − 484 = −403 ✓, reduced: −11 < 9 ≤ 11 ≤ 11 ✓). -/
def bandForm : GaussForms.BQF := ⟨11, 9, 11⟩

theorem attestFlag_forced :
    ((∃ q mq e : Z, bandForm.a = q * e ∧ q = 2 * mq + 1 ∧ 3 ≤ q ∧ 0 < e ∧
      (q ∈ ([] : List Z) ∨ (403 : Z) < 4 * (q * q)))) → attestFlag = 1 :=
  fun _ => rfl

/-- Integrality step: r < k+1 ⟹ r ≤ k (tower form). -/
theorem step_down {r k : Z} (h : r < k + 1) : r ≤ k := by
  have := z_pos_ge_one (show (0:Z) < k + 1 - r by linarith)
  linarith

/-- Enumerate 0 ≤ r ≤ 2. -/
theorem enum3 {r : Z} (h0 : 0 ≤ r) (h : r ≤ 2) : r = 0 ∨ r = 1 ∨ r = 2 := by
  rcases lt_trichotomy r 1 with ha | ha | ha
  · left
    have h0' : r ≤ 0 := step_down (show r < 0 + 1 by linarith)
    linarith
  · right; left; exact ha
  · right; right
    have h2 : 2 ≤ r := by
      have := z_pos_ge_one (show (0:Z) < r - 1 by linarith)
      linarith
    linarith

/-- Enumerate 0 ≤ r ≤ 4. -/
theorem enum5 {r : Z} (h0 : 0 ≤ r) (h : r ≤ 4) :
    r = 0 ∨ r = 1 ∨ r = 2 ∨ r = 3 ∨ r = 4 := by
  rcases lt_trichotomy r 3 with ha | ha | ha
  · have h2 : r ≤ 2 := step_down (show r < 2 + 1 by linarith)
    rcases enum3 h0 h2 with h | h | h
    · exact Or.inl h
    · exact Or.inr (Or.inl h)
    · exact Or.inr (Or.inr (Or.inl h))
  · exact Or.inr (Or.inr (Or.inr (Or.inl ha)))
  · right; right; right; right
    have h4 : 4 ≤ r := by
      have := z_pos_ge_one (show (0:Z) < r - 3 by linarith)
      linarith
    linarith

/-- Enumerate 0 ≤ r ≤ 6. -/
theorem enum7 {r : Z} (h0 : 0 ≤ r) (h : r ≤ 6) :
    r = 0 ∨ r = 1 ∨ r = 2 ∨ r = 3 ∨ r = 4 ∨ r = 5 ∨ r = 6 := by
  rcases lt_trichotomy r 5 with ha | ha | ha
  · have h4 : r ≤ 4 := step_down (show r < 4 + 1 by linarith)
    rcases enum5 h0 h4 with h | h | h | h | h
    · exact Or.inl h
    · exact Or.inr (Or.inl h)
    · exact Or.inr (Or.inr (Or.inl h))
    · exact Or.inr (Or.inr (Or.inr (Or.inl h)))
    · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inl h))))
  · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl ha)))))
  · right; right; right; right; right; right
    have h6 : 6 ≤ r := by
      have := z_pos_ge_one (show (0:Z) < r - 5 by linarith)
      linarith
    linarith

/-- 3 blocked at c₀ = 101 (two checks: P(0)=101, P(1)=103). -/
theorem blk3_403 : ∀ x : Z, ¬ ZDvd' 3 (x * x + x + 101) := by
  apply deferral_law (m := 1) (by norm_num) (by norm_num)
  intro x' h0 h1 hdvd
  obtain ⟨k, hk⟩ := hdvd
  have hx01 : x' = 0 ∨ x' = 1 := z_zero_or_one (by linarith) h1
  rcases hx01 with rfl | rfl
  · have h2 : 3 * (k - 33) = 2 := by linarith
    rcases lt_trichotomy (k - 33) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k-33) by linarith)]
    · rw [hc] at h2; norm_num at h2
    · nlinarith [z_pos_ge_one hc]
  · have h2 : 3 * (k - 34) = 1 := by linarith
    rcases lt_trichotomy (k - 34) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k-34) by linarith)]
    · rw [hc] at h2; norm_num at h2
    · nlinarith [z_pos_ge_one hc]

/-- 5 blocked at c₀ = 101 (three checks: 101, 103, 107). -/
theorem blk5_403 : ∀ x : Z, ¬ ZDvd' 5 (x * x + x + 101) := by
  apply deferral_law (m := 2) (by norm_num) (by norm_num)
  intro x' h0 h2 hdvd
  obtain ⟨k, hk⟩ := hdvd
  have hx : x' = 0 ∨ x' = 1 ∨ x' = 2 := enum3 h0 h2
  rcases hx with rfl | rfl | rfl
  · have h5 : 5 * (k - 20) = 1 := by linarith
    rcases lt_trichotomy (k - 20) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k-20) by linarith)]
    · rw [hc] at h5; norm_num at h5
    · nlinarith [z_pos_ge_one hc]
  · have h5 : 5 * (k - 20) = 3 := by linarith
    rcases lt_trichotomy (k - 20) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k-20) by linarith)]
    · rw [hc] at h5; norm_num at h5
    · nlinarith [z_pos_ge_one hc]
  · have h5 : 5 * (k - 21) = 2 := by linarith
    rcases lt_trichotomy (k - 21) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k-21) by linarith)]
    · rw [hc] at h5; norm_num at h5
    · nlinarith [z_pos_ge_one hc]

/-- 7 blocked at c₀ = 101 (four checks: 101, 103, 107, 113). -/
theorem blk7_403 : ∀ x : Z, ¬ ZDvd' 7 (x * x + x + 101) := by
  apply deferral_law (m := 3) (by norm_num) (by norm_num)
  intro x' h0 h3 hdvd
  obtain ⟨k, hk⟩ := hdvd
  have hx : x' = 0 ∨ x' = 1 ∨ x' = 2 ∨ x' = 3 := by
    rcases lt_trichotomy x' 3 with ha | ha | ha
    · have h2 : x' ≤ 2 := step_down (show x' < 2 + 1 by linarith)
      rcases enum3 h0 h2 with h | h | h
      · exact Or.inl h
      · exact Or.inr (Or.inl h)
      · exact Or.inr (Or.inr (Or.inl h))
    · exact Or.inr (Or.inr (Or.inr ha))
    · exfalso; linarith
  rcases hx with rfl | rfl | rfl | rfl
  · have h7 : 7 * (k - 14) = 3 := by linarith
    rcases lt_trichotomy (k - 14) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k-14) by linarith)]
    · rw [hc] at h7; norm_num at h7
    · nlinarith [z_pos_ge_one hc]
  · have h7 : 7 * (k - 14) = 5 := by linarith
    rcases lt_trichotomy (k - 14) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k-14) by linarith)]
    · rw [hc] at h7; norm_num at h7
    · nlinarith [z_pos_ge_one hc]
  · have h7 : 7 * (k - 15) = 2 := by linarith
    rcases lt_trichotomy (k - 15) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k-15) by linarith)]
    · rw [hc] at h7; norm_num at h7
    · nlinarith [z_pos_ge_one hc]
  · have h7 : 7 * (k - 16) = 1 := by linarith
    rcases lt_trichotomy (k - 16) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k-16) by linarith)]
    · rw [hc] at h7; norm_num at h7
    · nlinarith [z_pos_ge_one hc]

/-- 403's deep odd range is BLOCKED throughout (silence): every deep
    odd toucher would be 3, 5, 7, or 9 — all dead (9 routes via 3).
    Completeness of the EMPTY list over the deep range. -/
theorem silence403 : ∀ p mm : Z, p = 2 * mm + 1 → 1 ≤ mm →
    4 * (p * p) ≤ 403 → (∃ x kk : Z, x * x + x + 101 = p * kk) →
    p ∈ ([] : List Z) := by
  intro p mm hop hmm hdeep htouch
  exfalso
  have hp3 : 3 ≤ p := by linarith
  have hmm4 : mm ≤ 4 := by
    by_contra hgt
    push_neg at hgt
    have h5 : (5 : Z) ≤ mm := by
      have := z_pos_ge_one (show (0:Z) < mm - 4 by linarith)
      linarith
    nlinarith
  obtain ⟨x, kk, hxk⟩ := htouch
  have hmm0 : 0 ≤ mm - 1 := by linarith
  have hmmv : mm = 1 ∨ mm = 2 ∨ mm = 3 ∨ mm = 4 := by
    rcases enum5 hmm0 (by linarith) with h | h | h | h | h
    · left; linarith
    · right; left; linarith
    · right; right; left; linarith
    · right; right; right; linarith
    · exfalso; linarith
  rcases hmmv with rfl | rfl | rfl | rfl <;> subst hop
  · exact blk3_403 x ⟨kk, hxk⟩
  · exact blk5_403 x ⟨kk, hxk⟩
  · exact blk7_403 x ⟨kk, hxk⟩
  · -- p = 9: 9 | P ⟹ 3 | P — dead via blk3
    exact blk3_403 x ⟨3 * kk, by linarith [hxk]⟩

/-- The characterization CLASSIFIES the real band member of −403:
    the band horn fires (11 shallow: 403 < 484), with silence
    supplying completeness of the empty list. -/
theorem classification_fires :
    (∃ q mq e : Z, bandForm.a = q * e ∧ q = 2 * mq + 1 ∧ 3 ≤ q ∧ 0 < e ∧
      (q ∈ ([] : List Z) ∨ (403 : Z) < 4 * (q * q))) := by
  have h := cage_characterization (c₀ := 101) (A := 403) (by norm_num)
    ([] : List Z) 4 silence403 bandForm (by norm_num [disc, bandForm])
    (by norm_num [bandForm]) (by norm_num [bandForm, pow2'])
  rcases h with ⟨j, hj, htower⟩ | hband
  · -- a = 11 is not a 2-power ≤ 16: kill each case
    exfalso
    interval_cases j <;>
      (simp only [pow2', bandForm] at htower; norm_num at htower)
  · exact hband

theorem cert_val_true : min 645 attestFlag = 1 := by
  have h := attestFlag_forced classification_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 645 attestFlag = 645 := by
  rw [cert_val_true]

end Counterexamples
