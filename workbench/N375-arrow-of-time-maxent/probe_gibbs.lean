import Phys.Foundation.ContinuumLog
import Mathlib.Tactic
import Mathlib.Algebra.BigOperators.Fin

namespace Phys.Foundation.ContinuumQ

open Filter Set Finset
open scoped Topology BigOperators
noncomputable section

-- assume the banked tangent lemmas exist (they compiled in probe_tangent):
axiom cutLog_lt_sub_one (x : Cut) (hx : 0 < x) (hne : x ≠ 1) : cutLog x < x - 1
axiom cutLog_le_sub_one (x : Cut) (hx : 0 < x) : cutLog x ≤ x - 1

/-! PROBE: the Gibbs inequality. p,q : Fin n → Cut, both positive, both summing to 1.
    relInfo p q = ∑ pᵢ (cutLog pᵢ − cutLog qᵢ). Claim relInfo ≥ 0, =0 iff p=q, >0 if p≠q.
    Route: −relInfo = ∑ pᵢ cutLog(qᵢ/pᵢ) ≤ ∑ pᵢ (qᵢ/pᵢ − 1) = ∑qᵢ − ∑pᵢ = 0. -/

def relInfo {n : ℕ} (p q : Fin n → Cut) : Cut :=
  ∑ i, p i * (cutLog (p i) - cutLog (q i))

-- The key per-term bound: for pᵢ>0, qᵢ>0,  pᵢ cutLog(pᵢ) − pᵢ cutLog(qᵢ) ≥ pᵢ − qᵢ.
-- Because cutLog(qᵢ/pᵢ) ≤ qᵢ/pᵢ − 1, multiply by pᵢ>0: pᵢ cutLog(qᵢ/pᵢ) ≤ qᵢ − pᵢ.
-- And cutLog(qᵢ/pᵢ) = cutLog qᵢ − cutLog pᵢ.
theorem gibbs_term {p q : Cut} (hp : 0 < p) (hq : 0 < q) :
    q - p ≥ p * (cutLog q - cutLog p) := by
  have hlog : cutLog (q / p) = cutLog q - cutLog p := by
    rw [div_eq_mul_inv, cutLog_mul hq (inv_pos.mpr hp)]
    have : cutLog p⁻¹ = - cutLog p := by
      have h := cutLog_mul hp (inv_pos.mpr hp)
      rw [mul_inv_cancel₀ (ne_of_gt hp), cutLog_one] at h
      linarith
    rw [this]; ring
  have hqp : 0 < q / p := div_pos hq hp
  have htan : cutLog (q / p) ≤ q / p - 1 := cutLog_le_sub_one _ hqp
  rw [hlog] at htan
  -- multiply by p > 0: p*(cutLog q - cutLog p) ≤ p*(q/p - 1) = q - p
  have hmul : p * (cutLog q - cutLog p) ≤ p * (q / p - 1) :=
    mul_le_mul_of_nonneg_left htan (le_of_lt hp)
  have hrhs : p * (q / p - 1) = q - p := by
    rw [mul_sub, mul_div_cancel₀ _ (ne_of_gt hp), mul_one]
  rw [hrhs] at hmul; linarith

-- GIBBS ≥ 0: relInfo p q ≥ 0 for positive prob vectors summing to 1.
theorem gibbs_nonneg {n : ℕ} (p q : Fin n → Cut)
    (hp : ∀ i, 0 < p i) (hq : ∀ i, 0 < q i)
    (hsp : ∑ i, p i = 1) (hsq : ∑ i, q i = 1) :
    0 ≤ relInfo p q := by
  unfold relInfo
  -- ∑ pᵢ(log pᵢ - log qᵢ) ≥ ∑ (pᵢ - qᵢ) = 1 - 1 = 0
  have hbound : ∀ i ∈ Finset.univ, p i - q i ≤ p i * (cutLog (p i) - cutLog (q i)) := by
    intro i _
    have := gibbs_term (hp i) (hq i)
    linarith [this]
  have hsum := Finset.sum_le_sum hbound
  have hlhs : ∑ i, (p i - q i) = 0 := by
    rw [Finset.sum_sub_distrib, hsp, hsq]; ring
  rw [hlhs] at hsum; exact hsum

-- STRICTNESS: if p ≠ q (as functions), relInfo p q > 0.
theorem gibbs_pos {n : ℕ} (p q : Fin n → Cut)
    (hp : ∀ i, 0 < p i) (hq : ∀ i, 0 < q i)
    (hsp : ∑ i, p i = 1) (hsq : ∑ i, q i = 1) (hpq : p ≠ q) :
    0 < relInfo p q := by
  unfold relInfo
  -- ∃ j, p j ≠ q j; at that j the tangent bound is STRICT (q/p ≠ 1)
  obtain ⟨j, hj⟩ := Function.ne_iff.mp hpq
  have hbound : ∀ i ∈ Finset.univ, p i - q i ≤ p i * (cutLog (p i) - cutLog (q i)) := by
    intro i _; have := gibbs_term (hp i) (hq i); linarith [this]
  have hstrict : ∃ i ∈ Finset.univ, p i - q i < p i * (cutLog (p i) - cutLog (q i)) := by
    refine ⟨j, Finset.mem_univ j, ?_⟩
    -- strict tangent at j: q/p ≠ 1
    have hqp : 0 < q j / p j := div_pos (hq j) (hp j)
    have hne1 : q j / p j ≠ 1 := by
      intro h; rw [div_eq_one_iff_eq (ne_of_gt (hp j))] at h; exact hj h.symm
    have hlog : cutLog (q j / p j) = cutLog (q j) - cutLog (p j) := by
      rw [div_eq_mul_inv, cutLog_mul (hq j) (inv_pos.mpr (hp j))]
      have hinv : cutLog (p j)⁻¹ = - cutLog (p j) := by
        have h := cutLog_mul (hp j) (inv_pos.mpr (hp j))
        rw [mul_inv_cancel₀ (ne_of_gt (hp j)), cutLog_one] at h; linarith
      rw [hinv]; ring
    have htan : cutLog (q j / p j) < q j / p j - 1 := cutLog_lt_sub_one _ hqp hne1
    rw [hlog] at htan
    have hmul : p j * (cutLog (q j) - cutLog (p j)) < p j * (q j / p j - 1) :=
      mul_lt_mul_of_pos_left htan (hp j)
    have hrhs : p j * (q j / p j - 1) = q j - p j := by
      rw [mul_sub, mul_div_cancel₀ _ (ne_of_gt (hp j)), mul_one]
    rw [hrhs] at hmul; linarith
  have hsum := Finset.sum_lt_sum hbound hstrict
  have hlhs : ∑ i, (p i - q i) = 0 := by
    rw [Finset.sum_sub_distrib, hsp, hsq]; ring
  rw [hlhs] at hsum; exact hsum

end
end Phys.Foundation.ContinuumQ
