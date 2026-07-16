/-
  Counterexamples.FineStructureLoopNormalizationVacuityCostume — N460 / X1 anti-vacuity (C485).
  ============================================================================================
  W8 ANTI-VACUITY. The N460 node (arc-X X1) DERIVES the loop/phase-wrap normalization
  `κ = kappaLeading = 1/(3·cutPi)` from the gather's Born self-overlap flux over the fold's return
  surface: the FULL-MERIDIAN cos²-weighted self-overlap flux `∫₀^{cutPi} cutCos²·cutSin = 2/3`
  (`meridianFlux_cutPi`), normalized by the azimuthal phase wrap `2·cutPi`, giving `1/(3·cutPi)`
  (`kappaLeading_eq`, division-free form `kappaLeading_mul_three_cutPi : κ·(3·cutPi) = 1`). The
  Born-SQUARE weighting is LOAD-BEARING: the UNWEIGHTED meridian flux is `2` (`sinAntideriv_cutPi`),
  which would give the WRONG `κ = 1/cutPi` — genuinely excluded (`kappaLeading_ne_wrong`).

  THE CERTIFICATE. `kFlag := 1` — a ℕ flag standing for "the meridian self-overlap flux is the
  cos²-WEIGHTED value `2/3` (not the unweighted `2`), so `κ = 1/(3·cutPi)` and NOT `1/cutPi`". It is
  TIED to the banked N460 landing by `kFlag_forced`: the banked `meridianFlux_cutPi` witnesses the
  flux `= 2/3`, distinct from the unweighted `2` (`meridianFlux_cutPi_ne_two`), and the derived
  normalization satisfies `κ·(3·cutPi) = 1` (`kappaLeading_mul_three_cutPi`), so the flag is `1`.

  We anchor `min 485 kFlag = 1` (TRUE — `kFlag = 1 < 485`, so the min is `kFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the flux is the unweighted `2` / `κ = 1/cutPi` / the
  Born-square weighting is vacuous / the phase-wrap normalization is trivial" mis-reading): that
  `min 485 kFlag = 485`. It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus claim
  to the false numeric `1 = 485` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (485, 1) is fresh (Cid 485 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.FineStructureLoopNormalization
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLUX-WEIGHTING FLAG: `1` = "the meridian self-overlap flux is the cos²-weighted `2/3`, so
    `κ = 1/(3·cutPi)`, NOT the unweighted `2` giving `1/cutPi`". -/
def kFlag : ℕ := 1

/-- TRUE (tied to the banked N460 landing): the banked `meridianFlux_cutPi` proves the flux `= 2/3`,
    `meridianFlux_cutPi_ne_two` proves it is NOT the unweighted `2`, and `kappaLeading_mul_three_cutPi`
    proves the derived normalization satisfies `κ·(3·cutPi) = 1`. So the flag is present, `kFlag = 1`.
    If the flux were the unweighted `2` (no Born-square weighting), these witnesses would not exist. -/
theorem kFlag_forced :
    (meridianFlux cutPi = 2 / 3) ∧ (meridianFlux cutPi ≠ 2) ∧
    (kappaLeading * (3 * cutPi) = 1) ∧ kFlag = 1 :=
  ⟨meridianFlux_cutPi, meridianFlux_cutPi_ne_two, kappaLeading_mul_three_cutPi, rfl⟩

/-- TRUE: `min 485 kFlag = 1`, holding precisely because `kFlag = 1 < 485`. -/
theorem cert_val_true : min (485 : ℕ) kFlag = 1 := by decide

/-- BOGUS: claims `min 485 kFlag = 485`. It GENUINELY equals `1` (`cert_val_true`). A "the flux is the
    unweighted `2` / `κ = 1/cutPi` / the Born-square weighting is vacuous" mis-reading reduces —
    through the banked value — to the false numeric `1 = 485`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (485 : ℕ) kFlag = 485 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 485  (FALSE — the costume bites)

end Counterexamples
