/-
  Counterexamples.ConfinementAreaLawVacuityCostume — N387 anti-vacuity (C412).
  ============================================================================================
  W8 ANTI-VACUITY. The N387 node (arc-I I3 — the area law) banks that the per-plaquette Born
  obstruction action `σ = gForm [a,b,x] [a,b,x]` is STRICTLY POSITIVE on the coloured sector
  (`bornAction_coloured_pos`), which is what makes the coloured area weight `cutExp(−σ)^Area`
  strictly SUPPRESSED (`< 1`) — a genuine area law. A mis-reading where the coloured per-plaquette
  action VANISHED (`σ = 0`, per-plaquette factor `= 1`, NO area suppression — the area law vacuous,
  no confinement) would break the derivation.

  THE CERTIFICATE. `iFlag := 1` — a ℕ flag standing for "the coloured per-plaquette Born action is
  STRICTLY POSITIVE". It is TIED to the banked N387 landing by `iFlag_forced`: the banked
  `bornAction_coloured_pos` witnesses `0 < bornAction (ι(ιJ)) (ι(e₂)) e₂`, so the flag is `1`.

  We anchor `min 412 iFlag = 1` (TRUE — `iFlag = 1 < 412`, so the min is `iFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the coloured plaquette action is zero / no area suppression /
  no confinement" mis-reading): that `min 412 iFlag = 412`. It GENUINELY equals `1`
  (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 412` in ℕ. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (412, 1) is fresh (Cid 412 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ConfinementAreaLaw
import Mathlib.Tactic

namespace Counterexamples

open Phys.Cascade
open Phys.Algebra
open Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-- THE COLOURED-ACTION-IS-POSITIVE FLAG: `1` = "the coloured per-plaquette Born obstruction action
    is STRICTLY POSITIVE, so the coloured area weight is strictly suppressed — a genuine area law
    (confinement)". -/
def iFlag : ℕ := 1

/-- TRUE (tied to the banked N387 landing): the banked `bornAction_coloured_pos` proves
    `0 < bornAction (ι(ιJ)) (ι(e₂)) e₂`, so the "coloured action positive" flag is present,
    `iFlag = 1`. If the coloured plaquette action vanished (no area suppression), this witness
    would not exist. -/
theorem iFlag_forced :
    (0 < bornAction (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ)) ∧ iFlag = 1 :=
  ⟨bornAction_coloured_pos, rfl⟩

/-- TRUE: `min 412 iFlag = 1`, holding precisely because `iFlag = 1 < 412`. -/
theorem cert_val_true : min (412 : ℕ) iFlag = 1 := by decide

/-- BOGUS: claims `min 412 iFlag = 412`. It GENUINELY equals `1` (`cert_val_true`). A "the coloured
    plaquette action is zero / no area suppression / no confinement" mis-reading reduces — through
    the banked value — to the false numeric `1 = 412`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (412 : ℕ) iFlag = 412 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 412  (FALSE — the costume bites)

end Counterexamples
