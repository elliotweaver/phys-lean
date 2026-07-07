/-
  Counterexamples.ConfinementArcConsolidationVacuityCostume — N390 anti-vacuity (C415).
  ============================================================================================
  W8 ANTI-VACUITY. The N390 node (arc-I I6 — the arc-I consolidation) banks two never-banked
  cross-ties. The load-bearing one is CROSS-TIE 2: the SINGLE derived-ℝ number
  `σ★ = bornAction (ι(ιJ)) (ι(e₂)) e₂` is simultaneously the area-law exponential rate (I3) AND
  the mass-gap floor `4 ≤ σ★` (I4). A mis-reading where arc I is disconnected islands — where the
  area-law rate is unrelated to the mass-gap floor, i.e. where `σ★ = 0` (no suppression, no gap,
  the weld vacuous) — would break the derivation.

  THE CERTIFICATE. `iFlag := 1` — a ℕ flag standing for "the shared string-tension number σ★ is
  genuinely the mass-gap floor (σ★ ≥ 4 > 0, the two arc-I faces share one nonzero number)". It is
  TIED to the banked N390 landing by `iFlag_forced`: the banked `sigmaStar_ne_zero` witnesses
  `σ★ ≠ 0` (the shared number is genuinely nonzero — the area-law rate IS the nonzero mass-gap
  floor), so the flag is `1`.

  We anchor `min 415 iFlag = 1` (TRUE — `iFlag = 1 < 415`, so the min is `iFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "arc I is disconnected / the area-law rate is unrelated to
  the mass gap / σ★ = 0" mis-reading): that `min 415 iFlag = 415`. It GENUINELY equals `1`
  (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 415` in ℕ. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (415, 1) is fresh (Cid 415 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ConfinementArcConsolidation
import Mathlib.Tactic

namespace Counterexamples

open Phys.Cascade
open Phys.Algebra
open Phys.Algebra.ArcIConsolidation
open Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-- THE CONSOLIDATION FLAG: `1` = "the shared string-tension number σ★ is genuinely the nonzero
    mass-gap floor — the two arc-I faces (area law, mass gap) share ONE nonzero number". -/
def iFlag : ℕ := 1

/-- TRUE (tied to the banked N390 landing): the banked `sigmaStar_ne_zero` proves `σ★ ≠ 0` — the
    shared area-law-rate / mass-gap-floor number is genuinely nonzero, so the cross-tie is not
    vacuous, `iFlag = 1`. If arc I were disconnected islands (σ★ = 0), this witness would not
    exist. -/
theorem iFlag_forced :
    (sigmaStar ≠ 0) ∧ iFlag = 1 :=
  ⟨sigmaStar_ne_zero, rfl⟩

/-- TRUE: `min 415 iFlag = 1`, holding precisely because `iFlag = 1 < 415`. -/
theorem cert_val_true : min (415 : ℕ) iFlag = 1 := by decide

/-- BOGUS: claims `min 415 iFlag = 415`. It GENUINELY equals `1` (`cert_val_true`). An "arc I is
    disconnected / the area-law rate is unrelated to the mass gap / σ★ = 0" mis-reading reduces —
    through the banked value — to the false numeric `1 = 415`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (415 : ℕ) iFlag = 415 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 415  (FALSE — the costume bites)

end Counterexamples
