/-
  Counterexamples.TowerGatherUniqueColourFixedAxisWrongValueCostume — N252 anti-vacuity (C283).
  ===========================================================================
  W8 ANTI-VACUITY. The N252 node banks THE UNIQUE COLOUR-FIXED AXIS: the colour-invariant subspace
  of the fundamental 7 `ImO` (the joint kernel `colourInvariants = ⨅ D : colourCentralizer,
  ker (imRep D)`) is EXACTLY the 1-dimensional branching singlet `span{sgl} = span{u1}`
  (`colourInvariants_eq_span_sgl`). The load-bearing quantitative fact — the W8 TEETH anchoring the
  "UNIQUE axis" claim — is that this colour-fixed subspace is EXACTLY `1`-dimensional
  (`finrank_colourInvariants`): not `0` (the singlet IS colour-fixed) and not larger (the charged
  complement `Vsub = 3 ⊕ 3̄` carries NO colour-fixed direction). A single line — one axis — is
  what makes the u(1) charge DIRECTION forced rather than chosen.

  The anchor is that genuine colour-fixed dimension, packaged as the clean equality
  `min 283 (finrank ℚ colourInvariants) = 1` (which holds precisely BECAUSE
  `finrank ℚ colourInvariants = 1`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the colour-fixed subspace is bigger than one
  line / the charged complement DOES carry a colour-fixed direction / the charge axis is not
  unique / there is an embedding to choose): that `min 283 (finrank ℚ colourInvariants)` equals
  `283`. It GENUINELY equals `1` (`unique_axis_dim_true`). Rewriting the banked value reduces the
  bogus claim to the false numeric `1 = 283` in ℕ. The kernel cannot close it; the costume BITES
  (exit 1).

  The bite is name-independent: delete every comment and for `O ℚ = CD (H ℚ)`, the joint kernel
  `colourInvariants = ⨅ D : colourCentralizer, ker (imRep D)` on `ImO` — the subspace fixed by
  every derivation commuting with the fixed complex structure `JO = L_{u1}` — has `finrank` `1`, so
  `min 283 (finrank ℚ colourInvariants) = 1`, and claiming it equals `283` is genuinely FALSE
  (1 ≠ 283).

  DISTINCT from the banked battery (… C281 = 8=281, C282 = 8=282): the pair (283, 1) is fresh (RHS
  283 distinct from every prior right-hand value; the LHS anchor is the N252 colour-FIXED-subspace
  dimension — the unique-axis TEETH — DIFFERENT from C282's N251 consolidated-image dimension and
  C280/C281's faithful-embedding domain/image dimensions).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherUniqueColourFixedAxis

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE: `min 283 (finrank ℚ colourInvariants) = 1`, holding precisely because the colour-invariant
    subspace of the fundamental 7 is EXACTLY the 1-dimensional branching singlet `span{u1}` — the
    unique colour-fixed axis (banked `finrank_colourInvariants`). -/
theorem unique_axis_dim_true :
    min 283 (Module.finrank ℚ colourInvariants) = 1 := by
  rw [finrank_colourInvariants]; decide

/-- BOGUS: claims `min 283 (finrank ℚ colourInvariants) = 283`. It GENUINELY equals `1`
    (`unique_axis_dim_true`). The WRONG claim (the colour-fixed subspace is bigger than one line /
    the charged complement carries a colour-fixed direction / the charge axis is not unique)
    reduces — through the banked value — to the false numeric `1 = 283`, so this must NOT compile. -/
theorem unique_axis_dim_wrong_BOGUS :
    min 283 (Module.finrank ℚ colourInvariants) = 283 := by
  rw [unique_axis_dim_true]
  -- ⊢ (1 : ℕ) = 283  (FALSE — the costume bites)

end Counterexamples
