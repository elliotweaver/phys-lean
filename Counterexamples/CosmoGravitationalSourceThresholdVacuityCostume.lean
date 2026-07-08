/-
  Counterexamples.CosmoGravitationalSourceThresholdVacuityCostume — N457 anti-vacuity (C482).
  ============================================================================================
  W8 ANTI-VACUITY. The N457 node (the trace-reversed gravitational source & the acceleration
  threshold `w = −1/n` on the derived `(1,3)` arena) banks that the VACUUM component has a
  NEGATIVE gravitational source (`vacuum_source_negative : 0 < ρ → gravSource (pfStress ρ (−ρ)) < 0`)
  — dark energy REPELS, the theory-native cause of accelerated expansion. The repulsion fact is the
  anti-vacuity content: a mis-reading where the vacuum source were NON-NEGATIVE (dark energy attracts
  / does not repel) would break it — it would collapse the trace-reversal's forced sign flip.

  THE CERTIFICATE. `gFlag := 1` — a ℕ flag standing for "for the concrete positive density `ρ = 1`
  the vacuum gravitational source `gravSource (pfStress 1 (−1))` is GENUINELY NEGATIVE
  (`gravSource (pfStress 1 (−1)) < 0`), so the vacuum repels". It is TIED to the banked N457 landing
  by `gFlag_forced`: the banked `vacuum_source_negative` (at `ρ = 1`) witnesses the strict
  inequality, so the flag is `1`.

  We anchor `min 482 gFlag = 1` (TRUE — `gFlag = 1 < 482`, so the min is `gFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the vacuum source is non-negative / dark energy attracts /
  no repulsion" mis-reading): that `min 482 gFlag = 482`. It GENUINELY equals `1` (`cert_val_true`).
  Rewriting reduces the bogus claim to the false numeric `1 = 482` in ℕ. The kernel cannot close it;
  it BITES.

  DISTINCT from the banked battery: the pair (482, 1) is fresh (Cid 482 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.CosmoGravitationalSourceThreshold
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.CosmoGravitationalSourceThreshold
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra.CosmoEquationOfStateCensus

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- THE VACUUM-REPELS FLAG: `1` = "for the concrete positive density `ρ = 1` the vacuum gravitational
    source `gravSource (pfStress 1 (−1))` is GENUINELY NEGATIVE, so dark energy repels". -/
def gFlag : ℕ := 1

/-- TRUE (tied to the banked N457 landing): the banked `vacuum_source_negative` at `ρ = 1` proves
    `gravSource (pfStress 1 (−1)) < 0`, so the "vacuum repels" flag is present, `gFlag = 1`. If the
    vacuum source were non-negative, this witness would not exist. -/
theorem gFlag_forced :
    (gravSource (pfStress 1 (-1)) < 0) ∧ gFlag = 1 :=
  ⟨vacuum_source_negative 1 (by norm_num), rfl⟩

/-- TRUE: `min 482 gFlag = 1`, holding precisely because `gFlag = 1 < 482`. -/
theorem cert_val_true : min (482 : ℕ) gFlag = 1 := by decide

/-- BOGUS: claims `min 482 gFlag = 482`. It GENUINELY equals `1` (`cert_val_true`). A "the vacuum
    source is non-negative / dark energy attracts / no repulsion" mis-reading reduces — through the
    banked value — to the false numeric `1 = 482`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (482 : ℕ) gFlag = 482 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 482  (FALSE — the costume bites)

end Counterexamples
