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

-- ===== NOVEL PIECE A: hyperOp brackets to 0 against all of isospinSpan (centrality core) =====
theorem hyperOp_bracket_isospinSpan (d : derivationLieQ) (hd : d ∈ isospinSpan) :
    ⁅imRep d, hyperOp⁆ = 0 := by
  rw [isospinSpan, Submodule.mem_span_triple] at hd
  obtain ⟨a, b, c, rfl⟩ := hd
  rw [map_add, map_add, map_smul, map_smul, map_smul, add_lie, add_lie,
      smul_lie, smul_lie, smul_lie, hyperOp_bracket_DI, hyperOp_bracket_DJ, hyperOp_bracket_DK,
      smul_zero, smul_zero, smul_zero, add_zero, add_zero]

-- ===== NOVEL PIECE B: right scalar linearity of traceForm7 (for W8 teeth) =====
theorem traceForm7_right (A B : Module.End ℚ ImO) (c : ℚ) :
    traceForm7 A (c • B) = c * traceForm7 A B := by
  unfold traceForm7
  rw [mul_smul_comm, map_smul, smul_eq_mul]

-- ===== NOVEL PIECE C: the W8-teeth contradiction core =====
-- if chargeOp = c • hyperOp then False (via B_chargeOp_chargeOp = -6, B_chargeOp_hyperOp = 0)
example (c : ℚ) (hc : chargeOp = c • hyperOp) : False := by
  have key : traceForm7 chargeOp chargeOp = c * traceForm7 chargeOp hyperOp := by
    nth_rewrite 2 [hc]; exact traceForm7_right chargeOp hyperOp c
  rw [B_chargeOp_chargeOp, B_chargeOp_hyperOp, mul_zero] at key
  norm_num at key

end

end Phys.Algebra
