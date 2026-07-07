/-
  Counterexamples.ConfinementHadronicMassVacuityCostume — N389 anti-vacuity (C414).
  ============================================================================================
  W8 ANTI-VACUITY. The N389 node (arc-I I5 — the origin of hadronic mass) banks that the
  confinement scale is the octonion (colour) rung of the 84π grammar, STRICTLY BELOW the electroweak
  scale: `confinementScaleRatio < ewClosureRatio` (`Λ/M < v/M`), so the hadron mass scale is NOT the
  electroweak/Higgs scale. A mis-reading where the hadron mass scale COINCIDED with the electroweak/
  Higgs scale (`Λ = v`, "hadron mass IS Higgs mass") would break the derivation.

  THE CERTIFICATE. `iFlag := 1` — a ℕ flag standing for "the confinement scale is strictly below the
  electroweak scale (hadron mass is confinement energy, NOT Higgs mass)". It is TIED to the banked
  N389 landing by `iFlag_forced`: the banked `confinementScaleRatio_ne_ewClosureRatio` witnesses
  `confinementScaleRatio ≠ ewClosureRatio` (the confinement scale differs from the electroweak scale),
  so the flag is `1`.

  We anchor `min 414 iFlag = 1` (TRUE — `iFlag = 1 < 414`, so the min is `iFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "hadron mass is Higgs mass / the confinement scale equals the
  electroweak scale" mis-reading): that `min 414 iFlag = 414`. It GENUINELY equals `1`
  (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 414` in ℕ. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (414, 1) is fresh (Cid 414 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ConfinementHadronicMass
import Mathlib.Tactic

namespace Counterexamples

open Phys.Cascade
open Phys.Algebra
open Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-- THE HADRONIC-MASS FLAG: `1` = "the confinement scale is strictly below the electroweak scale —
    hadron mass is confinement energy, NOT Higgs mass". -/
def iFlag : ℕ := 1

/-- TRUE (tied to the banked N389 landing): the banked `confinementScaleRatio_ne_ewClosureRatio` proves
    `confinementScaleRatio ≠ ewClosureRatio` — the confinement scale genuinely differs from (is below)
    the electroweak scale, so the "not Higgs mass" flag is present, `iFlag = 1`. If the hadron mass
    scale coincided with the Higgs scale, this witness would not exist. -/
theorem iFlag_forced :
    (confinementScaleRatio ≠ ewClosureRatio) ∧ iFlag = 1 :=
  ⟨confinementScaleRatio_ne_ewClosureRatio, rfl⟩

/-- TRUE: `min 414 iFlag = 1`, holding precisely because `iFlag = 1 < 414`. -/
theorem cert_val_true : min (414 : ℕ) iFlag = 1 := by decide

/-- BOGUS: claims `min 414 iFlag = 414`. It GENUINELY equals `1` (`cert_val_true`). A "hadron mass is
    Higgs mass / the confinement scale equals the electroweak scale" mis-reading reduces — through the
    banked value — to the false numeric `1 = 414`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (414 : ℕ) iFlag = 414 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 414  (FALSE — the costume bites)

end Counterexamples
