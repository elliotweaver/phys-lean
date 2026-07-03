import Phys.Algebra.TowerGatherElectroweakReductiveLie

/-! N259 scratch — de-risk the crux pieces of the shared-isospin-Cartan intersection. -/

open scoped Classical
noncomputable section

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)

set_option synthInstance.maxHeartbeats 400000

-- Piece A: colourImg ⊓ isospinImg = span{imRep DI}, via map_inf + meet_eq_span_DI.
example : colourImg ⊓ isospinImg = Submodule.span ℚ {imRepL DI} := by
  rw [colourImg, isospinImg,
      ← Submodule.map_inf imRepL imRep_injective,
      inf_comm,
      meet_eq_span_DI,
      Submodule.map_span]
  simp

-- Piece A': imRepL DI = imRep DI (defeq check) — should be rfl.
example : imRepL DI = imRep DI := rfl

-- Piece B: chargeLine ⊓ hyperLine = ⊥.
example : chargeLine ⊓ hyperLine = ⊥ := by
  rw [eq_bot_iff]
  intro x hx
  rw [Submodule.mem_inf] at hx
  obtain ⟨hxc, hxh⟩ := hx
  rw [chargeLine, Submodule.mem_span_singleton] at hxc
  rw [hyperLine, Submodule.mem_span_singleton] at hxh
  obtain ⟨a, ha⟩ := hxc
  obtain ⟨b, hb⟩ := hxh
  have hax : x = a • chargeOp := ha.symm
  have hbx : x = b • hyperOp := hb.symm
  have key : a * (-6 : ℚ) = 0 := by
    have e1 : traceForm7 x chargeOp = a * traceForm7 chargeOp chargeOp := by
      rw [hax]; simp [traceForm7, map_smul]
    have e2 : traceForm7 x chargeOp = b * traceForm7 hyperOp chargeOp := by
      rw [hbx]; simp [traceForm7, map_smul]
    rw [B_chargeOp_chargeOp_via_isometry] at e1
    rw [traceForm7_symm hyperOp chargeOp, B_chargeOp_hyperOp] at e2
    rw [e1] at e2; simpa using e2.symm
  have ha0 : a = 0 := by
    have h6 : (-6 : ℚ) ≠ 0 := by norm_num
    rcases mul_eq_zero.mp key with h | h
    · exact h
    · exact absurd h h6
  rw [hax, ha0, zero_smul]
  exact Submodule.zero_mem _

end Phys.Algebra
