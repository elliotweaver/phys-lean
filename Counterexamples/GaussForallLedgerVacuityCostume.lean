/-
  Counterexamples.GaussForallLedgerVacuityCostume — the ledger link is
  GENUINE: it kills the phantom box member on the real landscape. C641.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the box-level cage. The content that must
  NOT be hollow: forall_box_caged must kill a REAL phantom — a claimed box
  member with a = 15 = 3·5 inside a box of disc −163 forms (the real Heegner
  landscape, blockings from their finite checks — the C640 hypothesis stack
  reused). Any singleton box [f] with f reduced/posdef/disc −163 and
  f.a = 15 derives False through the box-level transport.

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 641 attestFlag = 1 (TRUE).
  BOGUS: min 641 attestFlag = 641 reduces to 1 = 641; BITES. (641, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussForallLedger

set_option maxRecDepth 8192

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    ((∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = 1 - 4 * 41 →
      f.a = 15 → False)) → attestFlag = 1 :=
  fun _ => rfl

/-- 3 blocked (two checks) — C640 stack. -/
theorem blk3' : ∀ x : Z, ¬ ZDvd' 3 (x * x + x + 41) := by
  apply deferral_law (m := 1) (by norm_num) (by norm_num)
  intro x' h0 h1 hdvd
  obtain ⟨k, hk⟩ := hdvd
  have hx01 : x' = 0 ∨ x' = 1 := z_zero_or_one (by linarith) h1
  rcases hx01 with rfl | rfl
  · have h2 : 3 * (k - 13) = 2 := by linarith
    rcases lt_trichotomy (k - 13) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k-13) by linarith)]
    · rw [hc] at h2; norm_num at h2
    · nlinarith [z_pos_ge_one hc]
  · have h2 : 3 * (k - 14) = 1 := by linarith
    rcases lt_trichotomy (k - 14) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k-14) by linarith)]
    · rw [hc] at h2; norm_num at h2
    · nlinarith [z_pos_ge_one hc]

/-- 5 blocked (three checks) — C640 stack. -/
theorem blk5' : ∀ x : Z, ¬ ZDvd' 5 (x * x + x + 41) := by
  apply deferral_law (m := 2) (by norm_num) (by norm_num)
  intro x' h0 h2 hdvd
  obtain ⟨k, hk⟩ := hdvd
  have hx : x' = 0 ∨ x' = 1 ∨ x' = 2 := by
    rcases lt_trichotomy x' 1 with ha | ha | ha
    · left
      have := z_zero_or_one (b := x') (by linarith) (by linarith)
      rcases this with h | h
      · exact h
      · linarith
    · right; left; exact ha
    · right; right
      have hge2 : (2 : Z) ≤ x' := by
        have := z_pos_ge_one (show (0:Z) < x' - 1 by linarith)
        linarith
      linarith
  rcases hx with rfl | rfl | rfl
  · have h5 : 5 * (k - 8) = 1 := by linarith
    rcases lt_trichotomy (k - 8) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k-8) by linarith)]
    · rw [hc] at h5; norm_num at h5
    · nlinarith [z_pos_ge_one hc]
  · have h5 : 5 * (k - 8) = 3 := by linarith
    rcases lt_trichotomy (k - 8) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k-8) by linarith)]
    · rw [hc] at h5; norm_num at h5
    · nlinarith [z_pos_ge_one hc]
  · have h5 : 5 * (k - 9) = 2 := by linarith
    rcases lt_trichotomy (k - 9) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k-9) by linarith)]
    · rw [hc] at h5; norm_num at h5
    · nlinarith [z_pos_ge_one hc]

theorem all_blocked' : ∀ p m : Z, p = 2 * m + 1 → 1 ≤ m →
    4 * (p * p) ≤ 163 → ∀ x : Z, ¬ ZDvd' p (x * x + x + 41) := by
  intro p m hop hm hdeep x
  have hp3 : 3 ≤ p := by linarith
  have hp7 : p < 7 := by
    by_contra hge
    push_neg at hge
    nlinarith
  have hpv : p = 3 ∨ p = 5 := by
    have hm2 : m ≤ 2 := by
      by_contra hgt
      push_neg at hgt
      have h3 : (3 : Z) ≤ m := by
        have := z_pos_ge_one (show (0:Z) < m - 2 by linarith)
        linarith
      linarith
    have hmv : m = 1 ∨ m = 2 := by
      rcases lt_trichotomy m 2 with ha | ha | ha
      · left
        have := z_zero_or_one (b := m - 1) (by linarith) (by linarith)
        rcases this with h | h
        · linarith
        · linarith
      · right; exact ha
      · linarith
    rcases hmv with rfl | rfl
    · left; linarith
    · right; linarith
  rcases hpv with rfl | rfl
  · exact blk3' x
  · exact blk5' x

/-- The ledger link kills the phantom through the BOX-level statement:
    the singleton box [f]. -/
theorem link_fires :
    ∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = 1 - 4 * 41 →
    f.a = 15 → False := by
  intro f hred hpos hdisc ha
  exact forall_box_caged (c₀ := 41) (A := 163) (by norm_num) (by norm_num)
    all_blocked' [f] (fun g hg => by
      rcases List.mem_singleton.mp hg with rfl
      exact ⟨hred, hpos, hdisc⟩)
    f (List.mem_singleton.mpr rfl) 3 5 1 1 2
    (by rw [ha]; norm_num) (by norm_num) (by norm_num)
    (by norm_num) (by norm_num) (by norm_num)

theorem cert_val_true : min 641 attestFlag = 1 := by
  have h := attestFlag_forced link_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 641 attestFlag = 641 := by
  rw [cert_val_true]

end Counterexamples
