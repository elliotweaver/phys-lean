import Phys.Algebra.MirrorFixedPoint
import Phys.Foundation.ContinuumTopology
import Mathlib.Topology.Order.IntermediateValue

/-
  # THE MIRROR ROOT EXISTS — the fixed point is UNCONDITIONAL (IVT over the derived Cut)
  ======================================================================================
  MANAGER-AS-PROVER NODE (worker retired; owner-directed). Directed successor of N586
  (MirrorFixedPoint). PREREG: workbench/mirror-closure/PREREG.md (Node 2, part (a)).

  N586 banked the CONDITIONAL package: sign change of the fixed-point residual across
  [aL, aR], strict monotonicity there (uniqueness), and the solution bracket FOR ANY ROOT.
  This node supplies the ROOT: the residual h(a) = a·F0 − (16/9)·κ·a³ − 1 is a polynomial
  in a over the derived Cut, hence CONTINUOUS (the banked `isTopologicalRing_cut` — the
  field operations of the derived ℝ are continuous; N34), so the banked sign change
  (`residual_neg_at_aL` / `residual_pos_at_aR`) feeds the INTERMEDIATE VALUE THEOREM on
  the Cauchy-complete Cut (`intermediate_value_Icc`, the same machinery that constructed
  cutPi in N325) and a root EXISTS in [aL, aR]. With N586's strict monotonicity it is the
  UNIQUE root there, and with N586's `solution_bracket` the certified landing

      137.0359990777677 ≤ 1/α★ ≤ 137.0359990778029

  becomes UNCONDITIONAL: the derived chain's mirror equation HAS a solution, exactly one
  solution in the bracketed interval, and its inverse is pinned to width ≈ 3.5×10⁻¹¹.

  ★ THE ONE CAUSE (THE ONE LAW). The SAME C6 completeness that built the derived ℝ, gave
  cutExp its inverse, and forced cutPi's least zero now delivers the mirror fixed point:
  one engine, one more termination.

  PHYSICS-WORDS-REMOVABLE: delete mirror/coupling — the statements are: a cubic polynomial
  over the completion-of-the-gather-of-closures changes sign on a rational interval, is
  continuous, hence has exactly one root there, whose inverse lies in a stated rational
  bracket. No name is load-bearing.

  NO-FIT: measured 1/α(0) ≈ 137.036 is REMOVABLE ORIENTATION PROSE (in no statement, no
  proof). The Mathlib used is IVT/topology MACHINERY on the derived Cut — no number-system
  content import.

  Foundations-only expected: Classical.choice enters only via IVT, exactly as in N325.
-/

namespace Phys.Algebra
namespace MirrorFixedPoint
open Phys.Foundation.ContinuumQ
open Set

noncomputable section

/-- The residual is CONTINUOUS: it is a polynomial in `a` over the derived topological
    ring Cut (banked `isTopologicalRing_cut`). -/
theorem residual_continuous : Continuous residual := by
  have : residual = fun a : Cut => a * F0 - (16/9) * kappaLeading * a^3 - 1 := rfl
  rw [this]
  fun_prop

/-- ★★★ THE ROOT EXISTS — IVT on the banked sign change: some a ∈ [aL, aR] has
    residual a = 0. -/
theorem mirror_root_exists : ∃ a ∈ Icc aL aR, residual a = 0 := by
  have haLR : aL ≤ aR := by
    rw [aL, aR]; norm_num
  have hcont : ContinuousOn residual (Icc aL aR) := residual_continuous.continuousOn
  have hmem : (0 : Cut) ∈ Icc (residual aL) (residual aR) :=
    ⟨le_of_lt residual_neg_at_aL, le_of_lt residual_pos_at_aR⟩
  obtain ⟨a, ha, haval⟩ := (intermediate_value_Icc haLR hcont) hmem
  exact ⟨a, ha, haval⟩

/-- ★★ THE ROOT IS UNIQUE in [aL, aR] — from the banked strict monotonicity. -/
theorem mirror_root_unique {a b : Cut}
    (ha : a ∈ Icc aL aR) (hb : b ∈ Icc aL aR)
    (hra : residual a = 0) (hrb : residual b = 0) : a = b := by
  rcases lt_trichotomy a b with h | h | h
  · exact absurd (residual_strictMono ha.1 hb.2 h) (by rw [hra, hrb]; exact lt_irrefl 0)
  · exact h
  · exact absurd (residual_strictMono hb.1 ha.2 h) (by rw [hra, hrb]; exact lt_irrefl 0)

/-- ★★★ THE UNCONDITIONAL CERTIFIED LANDING — the mirror equation HAS a (unique-in-interval)
    solution and its inverse is certified: 1370359990777677/10¹³ ≤ 1/α★ ≤ 1370359990778029/10¹³.
    Assembled from mirror_root_exists + the banked N586 solution_bracket. -/
theorem invAlpha_certified :
    ∃ a ∈ Icc aL aR, residual a = 0
      ∧ (1370359990777677 : Cut) / 10000000000000 ≤ 1/a
      ∧ 1/a ≤ 1370359990778029 / 10000000000000 := by
  obtain ⟨a, ha, haval⟩ := mirror_root_exists
  obtain ⟨hlo, hhi⟩ := solution_bracket ha.1 ha.2 haval
  exact ⟨a, ha, haval, hlo, hhi⟩

/-- ★ W8 TEETH: the root is INTERIOR — residual is nonzero at BOTH endpoints (the strict
    sign change), so the root is not a degenerate endpoint artifact. -/
theorem root_interior {a : Cut} (ha : a ∈ Icc aL aR) (hroot : residual a = 0) :
    aL < a ∧ a < aR := by
  constructor
  · rcases eq_or_lt_of_le ha.1 with h | h
    · exact absurd (h ▸ hroot).symm (ne_of_lt residual_neg_at_aL)
    · exact h
  · rcases eq_or_lt_of_le ha.2 with h | h
    · exact absurd (h ▸ hroot) (ne_of_gt residual_pos_at_aR)
    · exact h

/-- ★ W8 TEETH: at the root, the fixed-point equation holds in its named form —
    1/α★ = F0 − (16/9)·κ·α★² — and the landing sits strictly below the bare F0. -/
theorem root_is_fixed_point {a : Cut} (ha : a ∈ Icc aL aR) (hroot : residual a = 0) :
    1/a = F0 - (16/9) * kappaLeading * a^2 ∧ 1/a < F0 := by
  have hapos : (0:Cut) < a := by
    have h0 : (0:Cut) < 2918941 / 400000000 := by norm_num
    have := ha.1; rw [aL] at this; linarith
  exact ⟨root_inverse_form hapos hroot, mirror_strictly_lowers ha.1 hroot⟩

end
end MirrorFixedPoint
end Phys.Algebra
