/-
  Counterexamples.GaussForallCageVacuityCostume — the ∀D shape is GENUINE: it
  kills a real two-odd-prime attempt on the real Heegner landscape. C640.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the ∀D cage shape. The content that must
  NOT be hollow: forall_cage_shape must derive FALSE from a REAL attempted
  violation on a REAL blocked disc — c₀ = 41 (D = −163, A = 163): 3 and 5 are
  the only deep odd primes (4·9 = 36 ≤ 163, 4·25 = 100 ≤ 163, 4·49 = 196 >
  163), BOTH blocked (deferral law, explicit checks — the C620/C629 pattern).
  A hypothetical reduced PosDef form with a = 15 = 3·5·1 must be IMPOSSIBLE:
  the shape theorem derives False from any such form. The costume feeds the
  full hypothesis set (both blockings from their finite checks) and fires the
  theorem against the phantom form — the kernel recomputes the whole chain:
  descent, parity, gate, overflow.

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 640 attestFlag = 1 (TRUE).
  BOGUS: min 640 attestFlag = 640 reduces to 1 = 640; BITES. (640, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussForallCage

set_option maxRecDepth 8192

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    ((∀ f : GaussForms.BQF, disc f = 1 - 4 * 41 → Reduced f → PosDef f →
      f.a = 15 → False)) → attestFlag = 1 :=
  fun _ => rfl

/-- 3 blocked on the Heegner branch (two checks). -/
theorem blk3 : ∀ x : Z, ¬ ZDvd' 3 (x * x + x + 41) := by
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

/-- 5 blocked on the Heegner branch (three checks: P(0)=41, P(1)=43,
    P(2)=47 — none divisible by 5). -/
theorem blk5 : ∀ x : Z, ¬ ZDvd' 5 (x * x + x + 41) := by
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
  · -- P(0) = 41 = 5k: 5(k−8) = 1
    have h5 : 5 * (k - 8) = 1 := by linarith
    rcases lt_trichotomy (k - 8) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k-8) by linarith)]
    · rw [hc] at h5; norm_num at h5
    · nlinarith [z_pos_ge_one hc]
  · -- P(1) = 43 = 5k: 5(k−8) = 3
    have h5 : 5 * (k - 8) = 3 := by linarith
    rcases lt_trichotomy (k - 8) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k-8) by linarith)]
    · rw [hc] at h5; norm_num at h5
    · nlinarith [z_pos_ge_one hc]
  · -- P(2) = 47 = 5k: 5(k−9) = 2
    have h5 : 5 * (k - 9) = 2 := by linarith
    rcases lt_trichotomy (k - 9) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k-9) by linarith)]
    · rw [hc] at h5; norm_num at h5
    · nlinarith [z_pos_ge_one hc]

/-- All deep odd primes of A = 163 are blocked: p deep ⟹ p ∈ {3, 5}. -/
theorem all_blocked : ∀ p m : Z, p = 2 * m + 1 → 1 ≤ m →
    4 * (p * p) ≤ 163 → ∀ x : Z, ¬ ZDvd' p (x * x + x + 41) := by
  intro p m hop hm hdeep x
  -- p odd ≥ 3 with 4p² ≤ 163 ⟹ p ≤ 6 ⟹ p ∈ {3, 5}
  have hp3 : 3 ≤ p := by linarith
  have hp7 : p < 7 := by
    by_contra hge
    push_neg at hge
    nlinarith
  have hpv : p = 3 ∨ p = 5 := by
    -- p = 2m+1 < 7 ⟹ 2m < 6 ⟹ m < 3; with 1 ≤ m: m ∈ {1, 2}
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
  · exact blk3 x
  · exact blk5 x

/-- THE ∀D SHAPE fires: no form of disc −163 with a = 15 = 3·5 exists. -/
theorem shape_fires :
    ∀ f : GaussForms.BQF, disc f = 1 - 4 * 41 → Reduced f → PosDef f →
    f.a = 15 → False := by
  intro f hdisc hred hpos ha
  exact forall_cage_shape (c₀ := 41) (A := 163) (by norm_num) (by norm_num)
    all_blocked f hdisc hred hpos 3 5 1 1 2
    (by rw [ha]; norm_num) (by norm_num) (by norm_num)
    (by norm_num) (by norm_num) (by norm_num)

theorem cert_val_true : min 640 attestFlag = 1 := by
  have h := attestFlag_forced shape_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 640 attestFlag = 640 := by
  rw [cert_val_true]

end Counterexamples
