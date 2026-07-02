/-
  Counterexamples.TowerGatherUniqueIsospinFixedAxisWrongValueCostume — N256 anti-vacuity (C287).
  ===========================================================================
  W8 ANTI-VACUITY. The N256 node banks THE UNIQUE ISOSPIN-FIXED AXIS: the isospin-invariant subspace
  of the fundamental 7 `ImO` (the joint kernel `isospinInvariants = ker(imRep DI) ⊓ ker(imRep DJ) ⊓
  ker(imRep DK)`) is EXACTLY the 1-dimensional branching singlet `span{kap1' = ⟨kappaO 1⟩}`
  (`isospinInvariants_eq_span_kap`) — the vector-level TWIN of N252's unique colour-fixed axis. The
  load-bearing quantitative fact — the W8 TEETH anchoring the "UNIQUE axis" claim — is that this
  isospin-fixed subspace is EXACTLY `1`-dimensional (`finrank_isospinInvariants`): not `0` (the
  singlet IS isospin-fixed, `D_kappaO_one_zero`) and not larger (the charged complement carries NO
  isospin-fixed direction, forced by the PAIR `{DI, DJ}`). A single line — one axis — is what makes
  the hypercharge DIRECTION forced-and-UNIQUE (grounding N255's forced EXISTENCE), rather than a
  chosen GUT embedding.

  The anchor is that genuine isospin-fixed dimension, packaged as the clean equality
  `min 287 (finrank ℚ isospinInvariants) = 1` (which holds precisely BECAUSE
  `finrank ℚ isospinInvariants = 1`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the isospin-fixed subspace is bigger than one
  line / the charged complement DOES carry an isospin-fixed direction / the hypercharge axis is not
  unique / the isospin-fixed axis coincides with the colour axis): that
  `min 287 (finrank ℚ isospinInvariants)` equals `287`. It GENUINELY equals `1`
  (`unique_isospin_axis_dim_true`). Rewriting the banked value reduces the bogus claim to the false
  numeric `1 = 287` in ℕ. The kernel cannot close it; the costume BITES (exit 1).

  The bite is name-independent: delete every comment and for `O ℚ = CD (H ℚ)`, the joint kernel
  `isospinInvariants = ker(imRep DI) ⊓ ker(imRep DJ) ⊓ ker(imRep DK)` on `ImO` — the subspace fixed
  by the three inner derivations `DI, DJ, DK` — has `finrank` `1`, so
  `min 287 (finrank ℚ isospinInvariants) = 1`, and claiming it equals `287` is genuinely FALSE
  (1 ≠ 287).

  DISTINCT from the banked battery (… C285 = 1=285, C286 = 0=286): the pair (287, 1) is fresh (RHS
  287 distinct from every prior right-hand value; the LHS anchor is the N256 isospin-FIXED-subspace
  dimension — the unique-isospin-axis TEETH — DIFFERENT from C283's N252 colour-fixed-subspace
  dimension, C285's N254 grading-misalignment charge coordinate, and C286's N255 isospin-commuting
  vanishing bracket).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherUniqueIsospinFixedAxis

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE: `min 287 (finrank ℚ isospinInvariants) = 1`, holding precisely because the isospin-invariant
    subspace of the fundamental 7 is EXACTLY the 1-dimensional branching singlet `span{kappaO 1}` —
    the unique isospin-fixed axis (banked `finrank_isospinInvariants`). -/
theorem unique_isospin_axis_dim_true :
    min 287 (Module.finrank ℚ isospinInvariants) = 1 := by
  rw [finrank_isospinInvariants]; decide

/-- BOGUS: claims `min 287 (finrank ℚ isospinInvariants) = 287`. It GENUINELY equals `1`
    (`unique_isospin_axis_dim_true`). The WRONG claim (the isospin-fixed subspace is bigger than one
    line / the charged complement carries an isospin-fixed direction / the hypercharge axis is not
    unique / it coincides with the colour axis) reduces — through the banked value — to the false
    numeric `1 = 287`, so this must NOT compile. -/
theorem unique_isospin_axis_dim_wrong_BOGUS :
    min 287 (Module.finrank ℚ isospinInvariants) = 287 := by
  rw [unique_isospin_axis_dim_true]
  -- ⊢ (1 : ℕ) = 287  (FALSE — the costume bites)

end Counterexamples
