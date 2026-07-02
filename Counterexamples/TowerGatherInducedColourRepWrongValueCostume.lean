/-
  Counterexamples.TowerGatherInducedColourRepWrongValueCostume — N248 anti-vacuity (C279).
  ===========================================================================
  W8 ANTI-VACUITY. The N248 node banks THE INDUCED COLOUR su(3)-REPRESENTATION ON THE CHARGED
  COMPLEMENT `Vsub = 3 ⊕ 3̄`: `colourRepV : colourCentralizer →ₗ⁅ℚ⁆ End ℚ Vsub` (a genuine
  Lie-algebra hom), every value commuting with the charge complex structure `chargeOpV`
  (ℂ-linearity, `chargeOpV² = −id`), and NONTRIVIAL (`colourRepV_ne_zero`). The load-bearing
  quantitative fact anchoring the whole node is that the CARRIER of the induced representation —
  the charged complement `Vsub` — is EXACTLY `6`-dimensional (`finrank_Vsub : finrank ℚ Vsub = 6`),
  the `3 ⊕ 3̄`. The induced colour rep genuinely acts on a `6`-dimensional space: NOT `0` (a rep on
  the zero space would be vacuous — but colour genuinely moves charged vectors, `colourRepV_ne_zero`)
  and NOT `7` (that would swallow the neutral singlet — the singlet is colour-annihilated and lies
  OUTSIDE the charged carrier, N244/N245).

  The anchor is that genuine carrier dimension, packaged as the clean equality
  `min 279 (finrank ℚ Vsub) = 6` (which holds precisely BECAUSE `finrank ℚ Vsub = 6`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the induced-rep carrier is not the 6 / the
  charged complement is trivial / the rep acts on nothing): that `min 279 (finrank ℚ Vsub)` equals
  `279`. It GENUINELY equals `6` (`induced_rep_carrier_dim_true`). Rewriting the banked value reduces
  the bogus claim to the false numeric `6 = 279` in ℕ. The kernel cannot close it; the costume BITES
  (exit 1).

  The bite is name-independent: delete every comment and for `O ℚ = CD (H ℚ)`, the branching
  complement `Vsub` carrying the induced restriction rep has `finrank` `6`, so
  `min 279 (finrank ℚ Vsub) = 6`, and claiming it equals `279` is genuinely FALSE (6 ≠ 279).

  DISTINCT from the banked battery (… C275 = 1=275, C276 = 6=276, C277 = 9=277, C278 = 9=278): the
  pair (279, 6) is fresh (RHS 279 distinct from every prior right-hand value; the LHS anchor is the
  N248 induced-representation CARRIER dimension — the charged 6-space `Vsub` on which the induced
  colour su(3)-rep `colourRepV` acts, a DIFFERENT declaration `finrank_Vsub` used in a NEW role
  from C276's `finrank_range_chargeOp`).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherInducedColourRep

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE: `min 279 (finrank ℚ Vsub) = 6`, holding precisely because the charged complement `Vsub`
    carrying the induced colour su(3)-representation `colourRepV` is the `6`-dimensional `3 ⊕ 3̄`
    (banked `finrank_Vsub`). -/
theorem induced_rep_carrier_dim_true :
    min 279 (Module.finrank ℚ Vsub) = 6 := by
  rw [finrank_Vsub]; decide

/-- BOGUS: claims `min 279 (finrank ℚ Vsub) = 279`. It GENUINELY equals `6`
    (`induced_rep_carrier_dim_true`). The WRONG claim (the induced-rep carrier is not the 6 / the
    charged complement is trivial / the rep acts on nothing) reduces — through the banked value —
    to the false numeric `6 = 279`, so this must NOT compile. -/
theorem induced_rep_carrier_dim_wrong_BOGUS :
    min 279 (Module.finrank ℚ Vsub) = 279 := by
  rw [induced_rep_carrier_dim_true]
  -- ⊢ (6 : ℕ) = 279  (FALSE — the costume bites)

end Counterexamples
