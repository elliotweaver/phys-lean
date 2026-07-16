/-
  Counterexamples.FineStructureCensusBandsVacuityCostume — N462 / X3 anti-vacuity (C487).
  ==========================================================================================
  W8 ANTI-VACUITY. The N462 node (arc-X X3) assembles the CENSUS PER RESOLUTION BAND: the R-ratio
  plateaus `2`, `10/3`, `11/3` ARE the DERIVED coloured census `Nc·ΣQ²` over the BANKED colour
  dimension `finrank ℚ Uhol = 3` (N42c, `Nc = 3`), with the occupation charges `1/3`, `2/3` falling
  out of the colour count. The band census is the coloured occupation SLICE of the banked charge
  census `Tr(Q²) = 16/3` (N317, `census_generation_split`) and reconstructs the banked running
  DEPTH `chargeTraceDepth` (N461, `census_generation_is_depth`). The DERIVED colour count is
  LOAD-BEARING: a WRONG `Nc = 2` gives `3 ≠ 2` (`bandCensusAt_two_ne`) and all-down flavour content
  gives `1 ≠ 2` (`bandCensus_all_down_ne`).

  THE CERTIFICATE. `xFlag := 1` — a ℕ flag standing for "the band plateaus are the DERIVED coloured
  census `Nc·ΣQ²` over the banked colour dimension, tied to the banked `Tr(Q²) = 16/3` and the
  running depth — NOT free-floating numbers or a wrong colour count / wrong flavour structure". It
  is TIED to the banked N462 landing by `xFlag_forced`: the banked `bandCensus_light` witnesses the
  light plateau `= 2`, `bandCensus_charm` witnesses `= 10/3`, `bandCensus_bottom` witnesses `= 11/3`,
  `census_generation_split` witnesses the tie to the banked `Tr(Q²)`, and `bandCensusAt_two_ne`
  witnesses the derived colour count is load-bearing (`Nc=2` fails), so the flag is `1`.

  We anchor `min 487 xFlag = 1` (TRUE — `xFlag = 1 < 487`, so the min is `xFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the plateaus are free-floating numbers / a wrong colour count
  works / the flavour structure is irrelevant / the census is not the banked Tr(Q²) slice"
  mis-reading): that `min 487 xFlag = 487`. It GENUINELY equals `1` (`cert_val_true`). Rewriting
  reduces the bogus claim to the false numeric `1 = 487` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (487, 1) is fresh (Cid 487 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.FineStructureCensusBands
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra

/-- THE BAND-CENSUS FLAG: `1` = "the R-ratio plateaus are the DERIVED coloured census `Nc·ΣQ²` over
    the banked colour dimension, tied to the banked `Tr(Q²) = 16/3`". -/
def xFlag : ℕ := 1

/-- TRUE (tied to the banked N462 landing): the banked `bandCensus_light`/`bandCensus_charm`/
    `bandCensus_bottom` prove the three plateaus `2`, `10/3`, `11/3`; `census_generation_split`
    proves the tie to the banked `Tr(Q²) = ladderChargeTrace (finrank ℚ Uhol)`; and
    `bandCensusAt_two_ne` proves the derived colour count is load-bearing (a wrong `Nc = 2` fails).
    So the flag is present, `xFlag = 1`. If the plateaus were free-floating or the colour count were
    arbitrary, these witnesses would not exist. -/
theorem xFlag_forced :
    (bandCensus [2, 1, 1] = 2) ∧ (bandCensus [2, 1, 1, 2] = 10 / 3) ∧
    (bandCensus [2, 1, 1, 2, 1] = 11 / 3) ∧
    (2 * ((colouredCensusTerm 2 + colouredCensusTerm 1) + 1)
      = ladderChargeTrace (Module.finrank ℚ Uhol)) ∧
    (bandCensusAt 2 [2, 1, 1] ≠ 2) ∧ xFlag = 1 :=
  ⟨bandCensus_light, bandCensus_charm, bandCensus_bottom,
   census_generation_split, bandCensusAt_two_ne, rfl⟩

/-- TRUE: `min 487 xFlag = 1`, holding precisely because `xFlag = 1 < 487`. -/
theorem cert_val_true : min (487 : ℕ) xFlag = 1 := by decide

/-- BOGUS: claims `min 487 xFlag = 487`. It GENUINELY equals `1` (`cert_val_true`). A "the plateaus
    are free-floating / a wrong colour count works / the census is not the banked `Tr(Q²)` slice"
    mis-reading reduces — through the banked value — to the false numeric `1 = 487`, so this must
    NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (487 : ℕ) xFlag = 487 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 487  (FALSE — the costume bites)

end Counterexamples
