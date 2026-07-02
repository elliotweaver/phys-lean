/-
  Counterexamples.TowerGatherImageColourSubalgebraWrongValueCostume — N250 anti-vacuity (C281).
  ===========================================================================
  W8 ANTI-VACUITY. The N250 node banks THE IMAGE of the faithful colour su(3)-representation as a
  CONCRETE dim-`8` LIE SUBALGEBRA of `Module.End ℚ Vsub`, landing in the commutant of the charge
  complex structure `chargeOpV`: `colourRepImg := colourRepV.range`, its dimension
  (`finrank_colourRepImg : finrank ℚ colourRepImg.toSubmodule = 8`), the commutant containment
  (`colourRepImg_le_commutant`), non-vacuity (`colourRepImg_ne_bot`), and the capstone
  `image_colour_subalgebra_structure`. The load-bearing quantitative fact anchoring the REALIZATION
  is that the IMAGE of the faithful embedding — the range `colourRepImg` of the injective induced
  colour rep `colourRepV` — is EXACTLY `8`-dimensional (`finrank_colourRepImg`). This is the FIRST
  downstream use of N249's injectivity: image dim = domain dim = `8` REQUIRES faithfulness. The full
  dim-`8` colour su(3) sits as a concrete dim-`8` Lie subalgebra of `Module.End ℚ Vsub`: the image is
  the FULL `8`, NOT a collapsed image (were the rep NOT faithful the image would be strictly smaller
  than `8` — but `colourRepV_faithful` shows nothing is killed) and NOT `0` (the image is nonzero,
  `colourRepImg_ne_bot`).

  The anchor is that genuine IMAGE dimension, packaged as the clean equality
  `min 281 (finrank ℚ colourRepImg.toSubmodule) = 8` (which holds precisely BECAUSE
  `finrank ℚ colourRepImg.toSubmodule = 8`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the image is not of the full 8 / the realized
  subalgebra is collapsed / the image dimension drops below the faithful domain): that
  `min 281 (finrank ℚ colourRepImg.toSubmodule)` equals `281`. It GENUINELY equals `8`
  (`image_dim_true`). Rewriting the banked value reduces the bogus claim to the false numeric
  `8 = 281` in ℕ. The kernel cannot close it; the costume BITES (exit 1).

  The bite is name-independent: delete every comment and for `O ℚ = CD (H ℚ)`, the range
  `colourRepImg = colourRepV.range` of the injective restriction rep `colourRepV` — the IMAGE of the
  faithful embedding — has `finrank` `8`, so `min 281 (finrank ℚ colourRepImg.toSubmodule) = 8`, and
  claiming it equals `281` is genuinely FALSE (8 ≠ 281).

  DISTINCT from the banked battery (… C277 = 9=277, C278 = 9=278, C279 = 6=279, C280 = 8=280): the
  pair (281, 8) is fresh (RHS 281 distinct from every prior right-hand value; the LHS anchor is the
  N250 faithful-embedding IMAGE dimension — the dim-8 colour su(3) realized as the range
  `colourRepImg` via the injective `colourRepV`, `finrank_colourRepImg` in a NEW role — the FAITHFUL
  EMBEDDING IMAGE — DIFFERENT from C280's use of `finrank_colourCentralizer_eq_eight` in the
  faithful-embedding DOMAIN dimension, and DIFFERENT from C278's use in the reductive-gauge-Lie
  dimension `9 = 1 + 8`).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherImageColourSubalgebra

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE: `min 281 (finrank ℚ colourRepImg.toSubmodule) = 8`, holding precisely because the image
    `colourRepImg = colourRepV.range` — the IMAGE of the faithful (injective) induced colour
    su(3)-representation `colourRepV` — is the `8`-dimensional colour su(3) realized as a concrete
    Lie subalgebra of `Module.End ℚ Vsub` (banked `finrank_colourRepImg`, the first downstream use
    of N249's injectivity). -/
theorem image_dim_true :
    min 281 (Module.finrank ℚ colourRepImg.toSubmodule) = 8 := by
  rw [finrank_colourRepImg]; decide

/-- BOGUS: claims `min 281 (finrank ℚ colourRepImg.toSubmodule) = 281`. It GENUINELY equals `8`
    (`image_dim_true`). The WRONG claim (the image is not of the full 8 / the realized subalgebra is
    collapsed / the image dimension drops below the faithful domain) reduces — through the banked
    value — to the false numeric `8 = 281`, so this must NOT compile. -/
theorem image_dim_wrong_BOGUS :
    min 281 (Module.finrank ℚ colourRepImg.toSubmodule) = 281 := by
  rw [image_dim_true]
  -- ⊢ (8 : ℕ) = 281  (FALSE — the costume bites)

end Counterexamples
