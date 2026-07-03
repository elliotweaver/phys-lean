import Phys.Algebra.TowerGatherForcedHyperchargeDirection
import Phys.Algebra.TowerGatherForcedChargeColourComplementary
import Phys.Algebra.TowerGatherReductiveGaugeLie
import Phys.Algebra.DerivationColourIsospinTraceForm
import Phys.Algebra.DerivationColourIsospinMeet
import Phys.Algebra.TowerGatherIsometry
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

noncomputable section

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- PIECE 1: isospinSpan bracket-closed
example (x y : derivationLieQ) (hx : x ∈ isospinSpan) (hy : y ∈ isospinSpan) :
    ⁅x, y⁆ ∈ isospinSpan := by
  have mDI : DI ∈ isospinSpan := Submodule.subset_span (by simp [isospinSpan])
  have mDJ : DJ ∈ isospinSpan := Submodule.subset_span (by simp [isospinSpan])
  have mDK : DK ∈ isospinSpan := Submodule.subset_span (by simp [isospinSpan])
  rw [isospinSpan, Submodule.mem_span_triple] at hx hy
  obtain ⟨a1, a2, a3, rfl⟩ := hx
  obtain ⟨b1, b2, b3, rfl⟩ := hy
  have hII : (⁅DI, DI⁆ : derivationLieQ) = 0 := lie_self DI
  have hJJ : (⁅DJ, DJ⁆ : derivationLieQ) = 0 := lie_self DJ
  have hKK : (⁅DK, DK⁆ : derivationLieQ) = 0 := lie_self DK
  have hIJ : (⁅DI, DJ⁆ : derivationLieQ) = (2:ℚ) • DK := bracket_DI_DJ_eq
  have hJK : (⁅DJ, DK⁆ : derivationLieQ) = (2:ℚ) • DI := bracket_DJ_DK_eq
  have hKI : (⁅DK, DI⁆ : derivationLieQ) = (2:ℚ) • DJ := bracket_DK_DI_eq
  have hJI : (⁅DJ, DI⁆ : derivationLieQ) = -((2:ℚ) • DK) := by
    rw [← lie_skew DJ DI, hIJ]
  have hKJ : (⁅DK, DJ⁆ : derivationLieQ) = -((2:ℚ) • DI) := by
    rw [← lie_skew DK DJ, hJK]
  have hIK : (⁅DI, DK⁆ : derivationLieQ) = -((2:ℚ) • DJ) := by
    rw [← lie_skew DI DK, hKI]
  simp only [add_lie, lie_add, smul_lie, lie_smul, hII, hJJ, hKK, hIJ, hJK, hKI, hJI, hKJ, hIK,
    smul_zero, add_zero, zero_add, smul_neg]
  repeat' first
    | exact Submodule.zero_mem _
    | exact mDI
    | exact mDJ
    | exact mDK
    | apply Submodule.add_mem
    | apply Submodule.neg_mem
    | apply Submodule.smul_mem

end

end Phys.Algebra
