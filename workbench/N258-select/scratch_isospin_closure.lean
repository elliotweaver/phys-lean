import Phys.Algebra.TowerGatherForcedHyperchargeDirection
import Phys.Algebra.TowerGatherForcedChargeColourComplementary
import Phys.Algebra.TowerGatherReductiveGaugeLie
import Phys.Algebra.DerivationColourIsospinTraceForm
import Phys.Algebra.DerivationColourIsospinMeet
import Phys.Algebra.TowerGatherIsometry
import Mathlib.Tactic

/-!
SCRATCH N258 — assemble the electroweak reductive Lie algebra su(2)_L ⊕ u(1)_Y.
Test the trickiest pieces first: isospinSpan bracket-closure, finrank_isospinSpan = 3.
-/

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

noncomputable section

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- ================= PIECE 1: isospinSpan is bracket-closed =================
-- isospinSpan = Submodule.span ℚ {DI, DJ, DK} in derivationLieQ.
-- The 9 su(2) brackets: ⁅DI,DJ⁆=2•DK, ⁅DJ,DK⁆=2•DI, ⁅DK,DI⁆=2•DJ (+ anti-sym + self=0).

example (x y : derivationLieQ) (hx : x ∈ isospinSpan) (hy : y ∈ isospinSpan) :
    ⁅x, y⁆ ∈ isospinSpan := by
  rw [isospinSpan, Submodule.mem_span_triple] at hx hy
  obtain ⟨a1, a2, a3, rfl⟩ := hx
  obtain ⟨b1, b2, b3, rfl⟩ := hy
  -- expand bilinearly; each ⁅Dp, Dq⁆ is 0 or ±2•Dr
  have hII : (⁅DI, DI⁆ : derivationLieQ) = 0 := lie_self DI
  have hJJ : (⁅DJ, DJ⁆ : derivationLieQ) = 0 := lie_self DJ
  have hKK : (⁅DK, DK⁆ : derivationLieQ) = 0 := lie_self DK
  have hIJ : (⁅DI, DJ⁆ : derivationLieQ) = (2:ℚ) • DK := bracket_DI_DJ_eq
  have hJK : (⁅DJ, DK⁆ : derivationLieQ) = (2:ℚ) • DI := bracket_DJ_DK_eq
  have hKI : (⁅DK, DI⁆ : derivationLieQ) = (2:ℚ) • DJ := bracket_DK_DI_eq
  have hJI : (⁅DJ, DI⁆ : derivationLieQ) = -((2:ℚ) • DK) := by
    rw [← neg_neg (⁅DJ, DI⁆ : derivationLieQ), ← lie_skew, hIJ]
  have hKJ : (⁅DK, DJ⁆ : derivationLieQ) = -((2:ℚ) • DI) := by
    rw [← neg_neg (⁅DK, DJ⁆ : derivationLieQ), ← lie_skew, hJK]
  have hIK : (⁅DI, DK⁆ : derivationLieQ) = -((2:ℚ) • DJ) := by
    rw [← neg_neg (⁅DI, DK⁆ : derivationLieQ), ← lie_skew, hKI]
  simp only [add_lie, lie_add, smul_lie, lie_smul, hII, hJJ, hKK, hIJ, hJK, hKI, hJI, hKJ, hIK]
  -- now a linear combination of DI, DJ, DK — must be in span
  -- membership of span{DI,DJ,DK}: use that DI,DJ,DK ∈ isospinSpan and submodule closed under +/•
  have mDI : DI ∈ isospinSpan := Submodule.subset_span (by simp [isospinSpan])
  have mDJ : DJ ∈ isospinSpan := Submodule.subset_span (by simp [isospinSpan])
  have mDK : DK ∈ isospinSpan := Submodule.subset_span (by simp [isospinSpan])
  -- close by submodule membership
  apply Submodule.add_mem
  apply Submodule.add_mem
  all_goals first
    | (apply Submodule.smul_mem; assumption)
    | (apply Submodule.add_mem <;> (apply Submodule.smul_mem; assumption))
    | (apply Submodule.neg_mem; apply Submodule.smul_mem; assumption)
    | skip

end

end Phys.Algebra
