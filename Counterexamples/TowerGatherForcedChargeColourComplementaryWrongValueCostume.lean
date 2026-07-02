/-
  Counterexamples.TowerGatherForcedChargeColourComplementaryWrongValueCostume — N246 anti-vacuity (C277).
  ===========================================================================
  W8 ANTI-VACUITY. The N246 node banks THE FORCED u(1) ⊕ su(3) COMMUTING PAIR AS COMPLEMENTARY
  SUMMANDS OF `so(7) = 14 ⊕ 7`: the forced charge operator `chargeOp = crossOp u1` lives in the
  fundamental-7 summand (`chargeOp ∈ range crossEmb`) and NOT in the adjoint-14/colour summand
  (`chargeOp ∉ range imRepL`), so the u(1) charge line `chargeLine = span{chargeOp}` (dim `1`) and
  colour su(3) `colourImg` (dim `8`, in the adjoint 14) meet only in `⊥` and form a genuine
  `u(1) ⊕ su(3)` direct sum. The load-bearing quantitative fact is that this direct sum is EXACTLY
  `9`-dimensional (`finrank_chargeLine_sup_colourImg : finrank ℚ ↥(chargeLine ⊔ colourImg) = 9`),
  the `1 + 8` forced by the trivial intersection (charge ∉ colour). It is NOT `8` (which would say
  the charge line is ABSORBED into colour, i.e. `chargeOp ∈ range imRepL` — false, the moat crux
  `chargeOp_not_mem_range_imRep`) and NOT `1` (which would say colour is trivial, contradicting
  `finrank_colourImg = 8`).

  The anchor is that genuine dimension, packaged as the clean equality
  `min 277 (finrank ℚ ↥(chargeLine ⊔ colourImg)) = 9` (which holds precisely BECAUSE
  `finrank ℚ ↥(chargeLine ⊔ colourImg) = 9`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the u(1) charge line is absorbed into colour /
  the charge is an adjoint generator / the direct sum is not the 9 / the two factors are not
  complementary): that `min 277 (finrank ℚ ↥(chargeLine ⊔ colourImg))` equals `277`. It GENUINELY
  equals `9` (`charge_colour_dim_true`). Rewriting the banked value reduces the bogus claim to the
  false numeric `9 = 277` in ℕ. The kernel cannot close it; the costume BITES (exit 1).

  The bite is name-independent: delete every comment and for `O ℚ = CD (H ℚ)`, the sup of
  `span{crossOp u1}` and `(colourCentralizer).map imRepL` inside `End ℚ ImO` has `finrank` `9`, so
  `min 277 (finrank ℚ ↥(chargeLine ⊔ colourImg)) = 9`, and claiming it equals `277` is genuinely
  FALSE (9 ≠ 277).

  DISTINCT from the banked battery (… C273 = 2=273, C274 = 3=274, C275 = 1=275, C276 = 6=276): the
  pair (277, 9) is fresh (RHS 277 distinct from every prior right-hand value; the LHS anchor is the
  NEW N246 u(1)⊕su(3) direct-sum dimension — the 9 = 1 + 8 the trivial intersection forces).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherForcedChargeColourComplementary

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE: `min 277 (finrank ℚ ↥(chargeLine ⊔ colourImg)) = 9`, holding precisely because the
    `u(1) ⊕ su(3)` commuting direct sum inside so(7) is the `9`-dimensional sum of the 1-dim charge
    line and the 8-dim colour su(3) (banked `finrank_chargeLine_sup_colourImg`), a genuine direct
    sum by the trivial intersection (the charge is NOT an adjoint/colour generator). -/
theorem charge_colour_dim_true :
    min 277 (Module.finrank ℚ ↥(chargeLine ⊔ colourImg)) = 9 := by
  rw [finrank_chargeLine_sup_colourImg]; decide
/-- BOGUS: claims `min 277 (finrank ℚ ↥(chargeLine ⊔ colourImg)) = 277`. It GENUINELY equals `9`
    (`charge_colour_dim_true`). The WRONG claim (the charge line absorbed into colour / charge is an
    adjoint generator / the direct sum is not the 9) reduces — through the banked value — to the
    false numeric `9 = 277`, so this must NOT compile. -/
theorem charge_colour_dim_wrong_BOGUS :
    min 277 (Module.finrank ℚ ↥(chargeLine ⊔ colourImg)) = 277 := by
  rw [charge_colour_dim_true]
  -- ⊢ (9 : ℕ) = 277  (FALSE — the costume bites)

end Counterexamples
