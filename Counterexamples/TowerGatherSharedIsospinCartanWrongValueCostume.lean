/-
  Counterexamples.TowerGatherSharedIsospinCartanWrongValueCostume — N259 anti-vacuity (C290).
  ===========================================================================
  W8 ANTI-VACUITY. The N259 node banks THE SHARED ISOSPIN CARTAN: the two derived Standard-Model
  reductive Lie subalgebras of `Module.End ℚ ImO` — the colour-charge factor `chargeColourLie`
  (dim 9, N247) and the electroweak factor `electroweakLie` (dim 4, N258), both split across the
  gather tear `so(7) = 14 (Der O) ⊕ 7 (crossEmb)` of the octonion rung `O ℚ = CD (H ℚ)` — are NOT
  a direct product. They MEET in EXACTLY the one-dimensional isospin Cartan line `span ℚ {imRepL DI}`
  (`shared_cartan`), forced by the single fold-root `u1` (`DI_mem_colour`, N202) and the tear
  separation `inter_eq_bot` (N225).

  The load-bearing quantitative fact — the W8 TEETH anchoring the "shared Cartan / not-a-direct-
  product" claim — is that the intersection is EXACTLY `1`-dimensional (`finrank_inf_sharedCartan :
  finrank ℚ (chargeColourLie.toSubmodule ⊓ electroweakLie.toSubmodule) = 1`): the two factors share
  exactly ONE generator, the isospin Cartan `T3 = imRep DI`. NOT `0` (the factors would be a direct
  product, sharing nothing) and NOT larger (they would share more than the single Cartan line). This
  exact dimension is precisely the forced overlap of the two reductive factors inside the single
  so(7).

  The anchor is that genuine dimension, packaged as the clean equality
  `min 290 (finrank ℚ (chargeColourLie.toSubmodule ⊓ electroweakLie.toSubmodule)) = 1` (which holds
  precisely BECAUSE `finrank_inf_sharedCartan = 1`, so `min 290 1 = 1`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the two factors share nothing / form a direct
  product / share more than the isospin Cartan / the meet is a whole factor): that
  `min 290 (finrank ℚ (chargeColourLie.toSubmodule ⊓ electroweakLie.toSubmodule))` equals `290`. It
  GENUINELY equals `1` (`sharedCartan_finrank_true`). Rewriting the banked value reduces the bogus
  claim to the false numeric `1 = 290` in ℕ. The kernel cannot close it; the costume BITES (exit 1).

  The bite is name-independent: delete every comment and for `O ℚ = CD (H ℚ)`, the two Lie
  subalgebras `chargeColourLie`/`electroweakLie` of `Module.End ℚ ImO` meet in a submodule of
  `finrank ℚ … = 1`, so `min 290 (finrank …) = 1`, and claiming it equals `290` is genuinely FALSE
  (1 ≠ 290).

  DISTINCT from the banked battery (… C288 = 6=288, C289 = 4=289): the pair (290, 1) is fresh (RHS
  290 distinct from every prior right-hand value; the LHS anchor is the N259 shared-isospin-Cartan
  intersection DIMENSION `1` — the not-a-direct-product TEETH — DIFFERENT from C289's N258 electroweak
  reductive dimension `4`, C288's N257 gather-isometry scale `−6`, and C287's N256 isospin-fixed
  dimension; here the anchor is the FORCED 1-dimensionality of the OVERLAP of the two reductive
  factors, never before costumed).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherSharedIsospinCartan

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE: `min 290 (finrank ℚ (chargeColourLie ⊓ electroweakLie)) = 1`, holding precisely because
    the two derived SM reductive factors meet in EXACTLY the 1-dim isospin Cartan line (banked
    `finrank_inf_sharedCartan`). -/
theorem sharedCartan_finrank_true :
    min (290 : ℕ) (Module.finrank ℚ (chargeColourLie.toSubmodule ⊓ electroweakLie.toSubmodule
      : Submodule ℚ (Module.End ℚ ImO))) = 1 := by
  rw [finrank_inf_sharedCartan]; norm_num

/-- BOGUS: claims `min 290 (finrank ℚ (chargeColourLie ⊓ electroweakLie)) = 290`. It GENUINELY equals
    `1` (`sharedCartan_finrank_true`). The WRONG claim (the two factors share nothing / form a direct
    product / share more than the isospin Cartan) reduces — through the banked value — to the false
    numeric `1 = 290`, so this must NOT compile. -/
theorem sharedCartan_finrank_wrong_BOGUS :
    min (290 : ℕ) (Module.finrank ℚ (chargeColourLie.toSubmodule ⊓ electroweakLie.toSubmodule
      : Submodule ℚ (Module.End ℚ ImO))) = 290 := by
  rw [sharedCartan_finrank_true]
  -- ⊢ (1 : ℕ) = 290  (FALSE — the costume bites)

end Counterexamples
