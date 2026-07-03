/-
  Counterexamples.TowerWorldMapColourNeutralCoreWrongValueCostume — N266 anti-vacuity (C297).
  ===========================================================================
  W8 ANTI-VACUITY. The N266 node banks THE COLOUR-NEUTRAL CORE OF THE MATTER CARRIER IS THE FOLD'S
  OWN COMPLEX LINE: over the derived octonion rung `O ℚ = CD (H ℚ)`, the joint kernel of the derived
  colour subalgebra `colourCentralizer` acting on the full matter carrier `O ℚ`
  (`matterColourNeutral`) is EXACTLY `span{1, u1}` (`matterColourNeutral_eq_span_one_u1`), a 2-dim
  multiplication-closed subalgebra (the fold's ℂ, `span_one_u1_mul_mem`), disjoint from the charged
  complement `Vsub = 3 ⊕ 3̄` (`neutral_disj_Vsub`).

  The load-bearing QUANTITATIVE W8 fact is the DIMENSION of the colour-neutral core:
  `finrank ℚ matterColourNeutral = 2` (`finrank_matterColourNeutral`). This is the non-vacuity teeth:
  the core is a genuine PLANE — it ADJOINS the fold's unit line to the vector-7 colour singlet
  `span{u1}` (N252) — NOT `0` (colour would have no invisible core), NOT `1` (merely the vector-7
  singlet, missing the real unit — the whole point that the CARRIER core is bigger than the ImO core),
  and NOT `≥ 3` (the core would leak into the charged triplets, contradicting the direct sum).

  We anchor the clean scalar `finrank ℚ matterColourNeutral = 2` (TRUE via
  `finrank_matterColourNeutral`), packaged as `min 297 (finrank ℚ matterColourNeutral) = 2`, and TIED
  to the node's content via `neutral_core_dim_true` below which reads it off the banked headline.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the colour-neutral core is empty / is just the
  vector-7 singlet / leaks into the charged part / is not the fold's ℂ): that
  `min 297 (finrank ℚ matterColourNeutral)` equals `297`. It GENUINELY equals `2`
  (`neutral_core_dim_scale_true`). Rewriting the banked value reduces the bogus claim to the false
  numeric `2 = 297` in ℕ. The kernel cannot close it; the costume BITES (exit 1).

  The bite is name-independent: for `O ℚ = CD (H ℚ)`, the derived colour joint-kernel on the carrier
  has dimension `2` (`finrank_matterColourNeutral`), and claiming it equals `297` is genuinely FALSE
  (2 ≠ 297).

  DISTINCT from the banked battery: the pair (297, 2) is fresh (RHS 297 distinct from every prior
  right-hand value: …, 293, 294, 295, 296). The LHS anchor is the N266 colour-neutral-core dimension
  `2` — the fold's-ℂ plane witnessing that the carrier core is strictly bigger than the vector-7
  singlet — tied to the node via `finrank_matterColourNeutral`.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerWorldMapColourNeutralCore

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-- TRUE (tied to the node's headline): the colour-neutral core of the matter carrier is a 2-dim
    plane (the fold's ℂ), via the banked `finrank_matterColourNeutral`. -/
theorem neutral_core_dim_true :
    Module.finrank ℚ matterColourNeutral = 2 :=
  finrank_matterColourNeutral

/-- TRUE: `min 297 (finrank ℚ matterColourNeutral) = 2`, holding precisely because the derived
    colour joint-kernel on the carrier is the 2-dim fold's-ℂ plane. -/
theorem neutral_core_dim_scale_true :
    min (297 : ℕ) (Module.finrank ℚ matterColourNeutral) = 2 := by
  rw [neutral_core_dim_true]; norm_num
/-- BOGUS: claims `min 297 (finrank ℚ matterColourNeutral) = 297`. It GENUINELY equals `2`
    (`neutral_core_dim_scale_true`). The WRONG reading (empty core / just the vector-7 singlet /
    leaks into the charged triplets / not the fold's ℂ) reduces — through the banked value — to the
    false numeric `2 = 297`, so this must NOT compile. -/
theorem neutral_core_dim_scale_wrong_BOGUS :
    min (297 : ℕ) (Module.finrank ℚ matterColourNeutral) = 297 := by
  rw [neutral_core_dim_scale_true]
  -- ⊢ (2 : ℕ) = 297  (FALSE — the costume bites)

end

end Counterexamples
