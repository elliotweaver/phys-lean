/-
  Counterexamples.TowerGatherReductiveGaugeLieWrongValueCostume — N247 anti-vacuity (C278).
  ===========================================================================
  W8 ANTI-VACUITY. The N247 node banks THE REDUCTIVE GAUGE LIE ALGEBRA u(1) ⊕ su(3) AS ONE LIE
  SUBALGEBRA OF so(7): the join `chargeLine ⊔ colourImg` is a genuine LieSubalgebra `chargeColourLie`
  of `Module.End ℚ ImO`, bracket-closed, sitting inside so(7), with the u(1) charge line a central
  ideal and the derived subalgebra landing in colour su(3). The load-bearing quantitative fact is
  that this reductive Lie algebra is EXACTLY `9`-dimensional
  (`chargeColourLie_finrank : finrank ℚ chargeColourLie.toSubmodule = 9`), the `1 + 8` forced by the
  trivial intersection (charge ∉ colour, N246). It is NOT `8` (the charge line ABSORBED into colour,
  i.e. `chargeOp ∈ range imRepL` — false, N246 `chargeOp_not_mem_range_imRep`) and NOT `1` (colour
  trivial, contradicting `finrank_colourImg = 8`).

  The anchor is that genuine dimension, packaged as the clean equality
  `min 278 (finrank ℚ chargeColourLie.toSubmodule) = 9` (which holds precisely BECAUSE
  `chargeColourLie_finrank`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the reductive gauge Lie algebra is collapsed /
  the charge line is absorbed into colour / the join is not the 9): that
  `min 278 (finrank ℚ chargeColourLie.toSubmodule)` equals `278`. It GENUINELY equals `9`
  (`reductive_lie_dim_true`). Rewriting the banked value reduces the bogus claim to the false numeric
  `9 = 278` in ℕ. The kernel cannot close it; the costume BITES (exit 1).

  The bite is name-independent: delete every comment and for `O ℚ = CD (H ℚ)`, the carrier of the
  Lie subalgebra `chargeColourLie` inside `End ℚ ImO` has `finrank` `9`, so
  `min 278 (finrank ℚ chargeColourLie.toSubmodule) = 9`, and claiming it equals `278` is genuinely
  FALSE (9 ≠ 278).

  DISTINCT from the banked battery (… C275 = 1=275, C276 = 6=276, C277 = 9=277): the pair (278, 9)
  is fresh (RHS 278 distinct from every prior right-hand value; the LHS anchor is the NEW N247
  reductive-gauge-Lie-algebra dimension — the 9 = 1 + 8 transported to the LieSubalgebra object,
  a DIFFERENT declaration `chargeColourLie_finrank` from N246's `finrank_chargeLine_sup_colourImg`).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherReductiveGaugeLie

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE: `min 278 (finrank ℚ chargeColourLie.toSubmodule) = 9`, holding precisely because the
    reductive gauge Lie algebra u(1) ⊕ su(3) inside so(7) is the `9`-dimensional join of the 1-dim
    charge line and the 8-dim colour su(3) (banked `chargeColourLie_finrank`). -/
theorem reductive_lie_dim_true :
    min 278 (Module.finrank ℚ chargeColourLie.toSubmodule) = 9 := by
  rw [chargeColourLie_finrank]; decide

/-- BOGUS: claims `min 278 (finrank ℚ chargeColourLie.toSubmodule) = 278`. It GENUINELY equals `9`
    (`reductive_lie_dim_true`). The WRONG claim (the reductive gauge Lie algebra collapsed / the
    charge line absorbed into colour) reduces — through the banked value — to the false numeric
    `9 = 278`, so this must NOT compile. -/
theorem reductive_lie_dim_wrong_BOGUS :
    min 278 (Module.finrank ℚ chargeColourLie.toSubmodule) = 278 := by
  rw [reductive_lie_dim_true]
  -- ⊢ (9 : ℕ) = 278  (FALSE — the costume bites)

end Counterexamples
