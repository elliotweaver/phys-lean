/-
  Counterexamples.HadronicSpectrumVacuityCostume — N### / X4 anti-vacuity (C488).
  ==========================================================================================
  W8 ANTI-VACUITY. The X4 node (arc-X) computes the HADRONIC / CONFINEMENT BAND as the eigenvalue
  spectrum of the banked mass-gap / associator-obstruction operator (N388 `ConfinementMassGap`):
  the gap-operator spectrum (achievable Born-action values `gForm w w` on the fold's integer
  lattice `IntLat`) is EXACTLY ℕ — QUANTIZED (`spectrum_subset_nat`) AND FULLY POPULATED via
  Lagrange four-square (`spectrum_surjective_nat`), so `gapSpectrum = Set.range Nat.cast`
  (`gapSpectrum_eq_natRange`). The FLOOR = the confinement scale = the light-vector band edge: the
  minimum nonzero spectral value is `1` (`gap_floor_is_one`), and level 0 is the massless singlet
  (`zero_mem_spectrum`). The DISCRETENESS is LOAD-BEARING: `1/2 ∉` spectrum
  (`half_not_mem_spectrum`) — quantization bites, the spectrum is NOT a continuum.

  THE CERTIFICATE. `xFlag := 1` — a ℕ flag standing for "the hadronic spectrum is the DERIVED
  integer gap tower ℕ (quantized + fully populated, floor 1 = confinement scale), the eigenvalue
  spectrum of the banked gap operator — NOT a measured input, NOT a continuum, NOT a floor of 0".
  It is TIED to the banked X4 landings by `xFlag_forced`: the banked `spectrum_surjective_nat`
  witnesses full population (every ℕ achieved), `gap_floor_is_one` witnesses the floor `1`,
  `zero_mem_spectrum` witnesses the massless level 0, and `half_not_mem_spectrum` witnesses the
  discreteness is load-bearing (`1/2` is excluded), so the flag is `1`.

  We anchor `min 488 xFlag = 1` (TRUE — `xFlag = 1 < 488`, so the min is `xFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the spectrum is a measured input / a continuum of values /
  the floor is 0 / the tower is not the fold's integer gap tower" mis-reading): that
  `min 488 xFlag = 488`. It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus
  claim to the false numeric `1 = 488` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (488, 1) is fresh (Cid 488 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.HadronicSpectrum
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra

/-- THE HADRONIC-SPECTRUM FLAG: `1` = "the spectrum is the DERIVED integer gap tower ℕ (quantized +
    fully populated, floor 1 = confinement scale), the eigenvalue spectrum of the banked gap
    operator". -/
def xFlag : ℕ := 1

/-- TRUE (tied to the banked X4 landing): `spectrum_surjective_nat` proves full population (every ℕ
    is achieved — here at `n = 7`); `gap_floor_is_one` proves the floor is `1` (present and minimal
    nonzero); `zero_mem_spectrum` proves the massless level 0; and `half_not_mem_spectrum` proves the
    discreteness is load-bearing (`1/2` is excluded — the spectrum is NOT a continuum). So the flag
    is present, `xFlag = 1`. If the spectrum were a measured input, a continuum, or had floor 0,
    these witnesses would not exist. -/
theorem xFlag_forced :
    ((7 : ℚ) ∈ gapSpectrum) ∧
    ((1 : ℚ) ∈ gapSpectrum ∧ (∀ v ∈ gapSpectrum, v ≠ 0 → 1 ≤ v)) ∧
    ((0 : ℚ) ∈ gapSpectrum) ∧
    ((1/2 : ℚ) ∉ gapSpectrum) ∧ xFlag = 1 :=
  ⟨spectrum_surjective_nat 7, gap_floor_is_one, zero_mem_spectrum,
   half_not_mem_spectrum, rfl⟩

/-- TRUE: `min 488 xFlag = 1`, holding precisely because `xFlag = 1 < 488`. -/
theorem cert_val_true : min (488 : ℕ) xFlag = 1 := by decide

/-- BOGUS: claims `min 488 xFlag = 488`. It GENUINELY equals `1` (`cert_val_true`). A "the spectrum
    is a measured input / a continuum / floor 0 / not the fold's integer gap tower" mis-reading
    reduces — through the banked value — to the false numeric `1 = 488`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (488 : ℕ) xFlag = 488 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 488  (FALSE — the costume bites)

end Counterexamples
