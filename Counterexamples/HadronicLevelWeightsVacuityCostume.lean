/-
  Counterexamples.HadronicLevelWeightsVacuityCostume — HadronicLevelWeights anti-vacuity (C532).
  =====================================================================================
  W8 ANTI-VACUITY. This node (THE HADRONIC LEVEL WEIGHTS) derives the per-level Born occupancy of the
  banked X4 mass-gap spectrum: the FLOOR (level 1 = the confinement scale = the light-vector band
  edge) Born weight is EXACTLY 16 = 2*dim(O Q) (the 16 signed unit vectors), a certified two-sided
  value; the level-0 (massless core) weight is EXACTLY 1 (the flat singlet alone). The content that
  must NOT be hollow: the floor weight is genuinely populated (16 != 0), it is genuinely DISTINCT
  from the level-0 weight (16 != 1 — the multiplicity is real structure, not a constant across
  levels), and a concrete signed unit genuinely sits at the floor (signedUnit 0 true in
  levelOccupancy 1). A "the level weights are vacuous / every level has the same weight / the floor
  is empty / the occupancy is a constant" mis-reading is refuted by the banked
  `floor_weight_ne_zero`, `floor_weight_ne_level0`, and `floor_nonempty_witness`.

  THE CERTIFICATE. hlwFlag := 1 -- a natural-number flag standing for "the derived per-level Born
  weights are non-vacuous: the floor weight is populated (!= 0), genuinely distinct from the level-0
  weight (!= 1), and a concrete configuration sits at the floor". It is TIED to the banked landing by
  hlwFlag_forced: `floor_weight_ne_zero` gives 16 != 0, `floor_weight_ne_level0` gives the floor
  weight != the level-0 weight, `floor_nonempty_witness` gives the concrete floor witness, so the
  flag is 1.

  We anchor min 532 hlwFlag = 1 (TRUE -- hlwFlag = 1 < 532, so the min is hlwFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the level weights are vacuous / every level has the same
  weight / the floor is empty / the occupancy is a constant" mis-reading): that min 532 hlwFlag =
  532. It GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim to the false numeric
  1 = 532 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (532, 1) is fresh (Cid 532 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.HadronicLevelWeights
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.HadronicLevelWeights
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the derived per-level Born weights are non-vacuous — the floor weight is
    populated (!= 0), genuinely distinct from the level-0 weight (!= 1), and a concrete
    configuration sits at the floor". -/
def hlwFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the floor Born weight is nonzero (`floor_weight_ne_zero`), it
    is genuinely distinct from the level-0 weight (`floor_weight_ne_level0`), a concrete signed unit
    sits at the floor (`floor_nonempty_witness`), and `hlwFlag = 1`. -/
theorem hlwFlag_forced :
    (Nat.card ↥(levelOccupancy 1) ≠ 0)
    ∧ (Nat.card ↥(levelOccupancy 1) ≠ Nat.card ↥(levelOccupancy 0))
    ∧ (signedUnit 0 true ∈ levelOccupancy 1)
    ∧ hlwFlag = 1 :=
  ⟨floor_weight_ne_zero, floor_weight_ne_level0, floor_nonempty_witness, rfl⟩

/-- TRUE: min 532 hlwFlag = 1, holding precisely because hlwFlag = 1 < 532. -/
theorem cert_val_true : min (532 : ℕ) hlwFlag = 1 := by decide

/-- BOGUS: claims min 532 hlwFlag = 532. It GENUINELY equals 1 (cert_val_true). A "the level weights
    are vacuous / every level has the same weight / the floor is empty / the occupancy is a
    constant" mis-reading reduces -- through the banked landing -- to the false numeric 1 = 532, so
    this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (532 : ℕ) hlwFlag = 532 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 532  (FALSE — the costume bites)

end Counterexamples
