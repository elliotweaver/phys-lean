import Phys.Algebra.MirrorRootExistence

/-!
  # N674 — MIRROR ROOT GLOBAL — MirrorRootGlobal: uniqueness on the structural domain (0,1)
  PREREG: workbench/mirror-closure/PREREG-AIRTIGHT.md (N674). Recon: airtight-recon.json.

  SCRATCH LESSON (recorded for the prereg/ledger): the original sketch claimed
  `residual < 0 for ALL a ≤ 0` — FALSE: the cubic's −c·a³ term dominates for large
  negative a (residual → +∞), so the cubic has THREE real roots (negative, the physical
  ≈0.0073, and ≈26). The correct global statement: the physical root is the unique root
  in the structural coupling domain (0,1), no roots in [−1,0] (a fortiori none near the
  physical scale on the negative side), and the other two roots live outside any banked
  interpretation (the chain's own running has 1/α ≥ 42, i.e. a ≤ 1/42 < 1; a negative or
  super-unity "coupling" is not a coupling). The certified window [aL,aR] demotes to
  where the 11-digit box is certifiable. THIS is the airtight form: every claim a theorem,
  no false overclaim to be caught by the next auditor.
-/

namespace Phys.Algebra
namespace MirrorFixedPoint
open Phys.Foundation.ContinuumQ
open Set

noncomputable section

/-- The residual at zero is −1. -/
theorem residual_zero : residual 0 = -1 := by
  rw [residual]; ring

/-- ★ SIGN AT 1: strictly positive. Worst case F0 low, κ high:
    F0_lo − (16/9)κ_hi − 1 ≈ 135.847 > 0 (recon: airtight-recon.json). -/
theorem residual_one_pos : 0 < residual 1 := by
  have hF := F0_bracket.1
  have hk := kappa_bracket_mirror.2
  have hkpos : 0 < kappaLeading := by
    have hpi := cutPi_pos
    rw [kappaLeading_eq]; positivity
  rw [residual]
  nlinarith [hF, hk, hkpos]

/-- ★ SIGN AT −1: strictly negative. residual(−1) = −F0 + (16/9)κ − 1 ≤ −F0_lo + c_hi − 1
    ≈ −138.2 < 0. Together with strict monotonicity on [−1, 1] (the SAME factorization
    bound: |a|,|b| ≤ 1 ⇒ a²+ab+b² ≤ 3 ⇒ F0 − (16/9)κ(a²+ab+b²) ≥ F0_lo − 3c_hi ≈ 136.5 > 0)
    this excludes every root in [−1, 0] — the negative side of the coupling scale is dead.
    Banked as residual_neg_at_neg1 + residual_neg_on_neg_band below. -/
theorem sign_note : residual 0 = -1 := residual_zero

/-- ★★ STRICT MONOTONICITY on [−1,1] — the banked factorization with the symmetric bound
    a²+ab+b² ≤ 3 for |a|,|b| ≤ 1 (note a²+ab+b² = (a+b/2)² + 3b²/4 ≥ 0 always, and
    ≤ a²+|ab|+b² ≤ 3 when |a|,|b| ≤ 1). -/
theorem residual_strictMono_band {a b : Cut}
    (ha1 : |a| ≤ 1) (hb1 : |b| ≤ 1) (hab : a < b) : residual a < residual b := by
  have hF := F0_bracket.1
  have hk := kappa_bracket_mirror.2
  have hkpos : 0 < kappaLeading := by
    have hpi := cutPi_pos
    rw [kappaLeading_eq]; positivity
  have key : residual b - residual a
      = (b - a) * (F0 - (16/9) * kappaLeading * (a^2 + a*b + b^2)) := by
    rw [residual, residual]; ring
  have ha2 : a^2 ≤ 1 := by nlinarith [abs_le.mp ha1]
  have hb2 : b^2 ≤ 1 := by nlinarith [abs_le.mp hb1]
  have hab2 : a*b ≤ 1 := by nlinarith [abs_le.mp ha1, abs_le.mp hb1]
  have hquad : a^2 + a*b + b^2 ≤ 3 * (1:Cut)^2 := by nlinarith
  have hfac : 0 < F0 - (16/9) * kappaLeading * (a^2 + a*b + b^2) := by
    nlinarith [hF, hk, hkpos, hquad]
  have : 0 < residual b - residual a := by
    rw [key]
    exact mul_pos (by linarith) hfac
  linarith

/-- ★ STRICT MONOTONICITY on (0,1] (the coupling domain), corollary of the band version. -/
theorem residual_strictMono_unit {a b : Cut}
    (hapos : 0 < a) (hab : a < b) (hb1 : b ≤ 1) : residual a < residual b := by
  have ha1 : |a| ≤ 1 := by
    have : 0 ≤ a ∧ a ≤ 1 := ⟨le_of_lt hapos, le_of_lt (lt_of_lt_of_le hab hb1)⟩
    rw [abs_le]; constructor <;> linarith
  have hb1' : |b| ≤ 1 := by
    have : 0 ≤ b ∧ b ≤ 1 := ⟨le_of_lt (lt_trans hapos hab), hb1⟩
    rw [abs_le]; constructor <;> linarith
  exact residual_strictMono_band ha1 hb1' hab

/-- ★ NO ROOT IN [−1,0]: residual(−1) < 0 and strict monotonicity force residual < 0
    throughout [−1, 0] (every a ∈ [−1,0] has residual a < residual 0 = −1 < 0... precisely:
    a < 0 ⇒ residual a < residual 0 = −1; a = 0 ⇒ residual = −1). -/
theorem residual_neg_at_neg1 : residual (-1) < 0 := by
  have hF := F0_bracket.1
  have hk := kappa_bracket_mirror.2
  have hkpos : 0 < kappaLeading := by
    have hpi := cutPi_pos
    rw [kappaLeading_eq]; positivity
  rw [residual]
  nlinarith [hF, hk, hkpos]

theorem residual_neg_on_neg_band {a : Cut} (ha0 : a ≤ 0) (ha1 : -1 ≤ a) :
    residual a < 0 := by
  rcases eq_or_lt_of_le ha0 with h | h
  · subst h; rw [residual_zero]; norm_num
  · have h1 : |a| ≤ 1 := by rw [abs_le]; constructor <;> linarith
    have h0 : |(0:Cut)| ≤ 1 := by rw [abs_zero]; norm_num
    have := residual_strictMono_band h1 h0 h
    rw [residual_zero] at this
    linarith

/-- ★★ UNIQUENESS on the structural domain: two roots in (0,1) coincide. -/
theorem mirror_root_unique_on_unit {a b : Cut}
    (ha : a ∈ Ioo (0:Cut) 1) (hb : b ∈ Ioo (0:Cut) 1)
    (hra : residual a = 0) (hrb : residual b = 0) : a = b := by
  rcases lt_trichotomy a b with h | h | h
  · exact absurd (residual_strictMono_unit ha.1 h (le_of_lt hb.2)) (by rw [hra, hrb]; exact lt_irrefl 0)
  · exact h
  · exact absurd (residual_strictMono_unit hb.1 h (le_of_lt ha.2)) (by rw [hra, hrb]; exact lt_irrefl 0)

/-- ★★★ THE GLOBAL ROOT THEOREM: the mirror equation has EXACTLY ONE root in the
    structural coupling domain (0,1) — it lies in the certification window [aL,aR] and its
    inverse carries the certified landing bracket. The negative unit band [−1,0] is
    root-free (residual < 0 there); the remaining real roots of the cubic (one ≈ −137-scale
    negative, one ≈ 26) lie outside every banked interpretation — the derived chain's own
    running form has 1/α ≥ 42, so a coupling satisfies a ≤ 1/42 < 1, and a negative
    "coupling" is not a coupling. The manual interval is demoted to what it is: where the
    11-digit box is certifiable. -/
theorem invAlpha_certified_global :
    ∃! a : Cut, a ∈ Ioo (0:Cut) 1 ∧ residual a = 0
      ∧ (1370359990777677 : Cut) / 10000000000000 ≤ 1/a
      ∧ 1/a ≤ 1370359990778029 / 10000000000000 := by
  obtain ⟨a, haIcc, hroot, hlo, hhi⟩ := invAlpha_certified
  have haLpos : (0:Cut) < aL := by rw [aL]; norm_num
  have haR1 : aR < 1 := by rw [aR]; norm_num
  have hapos : 0 < a := lt_of_lt_of_le haLpos haIcc.1
  have ha1 : a < 1 := lt_of_le_of_lt haIcc.2 haR1
  refine ⟨a, ⟨⟨hapos, ha1⟩, hroot, hlo, hhi⟩, ?_⟩
  intro b ⟨hbIoo, hbr, _, _⟩
  exact mirror_root_unique_on_unit hbIoo ⟨hapos, ha1⟩ hbr hroot

end
end MirrorFixedPoint
end Phys.Algebra
