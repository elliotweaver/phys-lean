/-
  Counterexamples.TowerGatherFaithfulColourRepWrongValueCostume — N249 anti-vacuity (C280).
  ===========================================================================
  W8 ANTI-VACUITY. The N249 node banks THE FAITHFULNESS of the induced colour su(3)-representation
  on the charged complement `Vsub = 3 ⊕ 3̄`: `colourRepV_faithful : Function.Injective colourRepV`
  (the induced colour rep is INJECTIVE — NO nonzero colour element acts as the zero endomorphism),
  its kernel form `colourRepV_ker_eq_bot`, and the capstone `faithful_colour_rep_structure`. The
  load-bearing quantitative fact anchoring the FAITHFULNESS is that the DOMAIN of the faithful
  embedding — the colour centralizer `colourCentralizer` (`= su(3)`) — is EXACTLY `8`-dimensional
  (`finrank_colourCentralizer_eq_eight : finrank ℚ colourCentralizer.toSubmodule = 8`). The whole
  dim-`8` colour su(3) embeds FAITHFULLY (injectively) into `Module.End ℚ Vsub`: the faithful
  embedding is of the FULL `8`, NOT of a smaller collapsed image (a rep that killed part of su(3)
  would NOT be faithful — but `colourRepV_faithful` shows nothing is killed) and NOT of `0` (a
  faithful rep of the zero algebra would be vacuous — but su(3) is genuinely `8`-dimensional).

  The anchor is that genuine domain dimension, packaged as the clean equality
  `min 280 (finrank ℚ colourCentralizer.toSubmodule) = 8` (which holds precisely BECAUSE
  `finrank ℚ colourCentralizer.toSubmodule = 8`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the faithful embedding is not of the full 8 /
  the colour domain is trivial / faithfulness is of a collapsed image): that
  `min 280 (finrank ℚ colourCentralizer.toSubmodule)` equals `280`. It GENUINELY equals `8`
  (`faithful_embedding_domain_dim_true`). Rewriting the banked value reduces the bogus claim to the
  false numeric `8 = 280` in ℕ. The kernel cannot close it; the costume BITES (exit 1).

  The bite is name-independent: delete every comment and for `O ℚ = CD (H ℚ)`, the operator
  centralizer `colourCentralizer` of the colour complex structure — the DOMAIN of the injective
  restriction rep `colourRepV` — has `finrank` `8`, so `min 280 (finrank ℚ colourCentralizer.toSubmodule)
  = 8`, and claiming it equals `280` is genuinely FALSE (8 ≠ 280).

  DISTINCT from the banked battery (… C276 = 6=276, C277 = 9=277, C278 = 9=278, C279 = 6=279): the
  pair (280, 8) is fresh (RHS 280 distinct from every prior right-hand value; the LHS anchor is the
  N249 faithful-embedding DOMAIN dimension — the dim-8 colour su(3) `colourCentralizer` that embeds
  injectively via `colourRepV`, `finrank_colourCentralizer_eq_eight` in a NEW role — the FAITHFUL
  EMBEDDING DOMAIN — DIFFERENT from C278's use of the same declaration in the reductive-gauge-Lie
  dimension `9 = 1 + 8`).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherFaithfulColourRep

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE: `min 280 (finrank ℚ colourCentralizer.toSubmodule) = 8`, holding precisely because the
    colour centralizer `colourCentralizer` — the DOMAIN of the faithful (injective) induced colour
    su(3)-representation `colourRepV` — is the `8`-dimensional colour su(3) (banked
    `finrank_colourCentralizer_eq_eight`). -/
theorem faithful_embedding_domain_dim_true :
    min 280 (Module.finrank ℚ colourCentralizer.toSubmodule) = 8 := by
  rw [finrank_colourCentralizer_eq_eight]; decide

/-- BOGUS: claims `min 280 (finrank ℚ colourCentralizer.toSubmodule) = 280`. It GENUINELY equals
    `8` (`faithful_embedding_domain_dim_true`). The WRONG claim (the faithful embedding is not of
    the full 8 / the colour domain is trivial / faithfulness is of a collapsed image) reduces —
    through the banked value — to the false numeric `8 = 280`, so this must NOT compile. -/
theorem faithful_embedding_domain_dim_wrong_BOGUS :
    min 280 (Module.finrank ℚ colourCentralizer.toSubmodule) = 280 := by
  rw [faithful_embedding_domain_dim_true]
  -- ⊢ (8 : ℕ) = 280  (FALSE — the costume bites)

end Counterexamples
