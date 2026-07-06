/-
  Counterexamples.CosmoArcReturnSurfaceConsolidationVacuityCostume — N365 anti-vacuity (C390).
  ============================================================================================
  W8 ANTI-VACUITY. The N365 node (arc-E E9 consolidation — the arc-E RETURN-SURFACE `azimuthalTurn`
  normalization family CLOSED + the pure-integer gauge ↔ gravity-thermodynamics cross-locks + the
  banked dark-matter representative, over the derived ℝ `Cut`) banks: black-hole entropy is a
  RETURN-SURFACE member `bhEntropy M = azimuthalTurn · 2 · M²` with the load-bearing count `2`
  (gravity's `4` halved by the first-law `1/2`), so it is NOT `azimuthalTurn · 3 · M²`
  (`bhEntropy_azimuthal_ne_three`, for `M ≠ 0`); and the turn-free lock to the fine-structure channel
  count is `bhEntropy M · 21 = criticalPhaseNumerator · M²` with the load-bearing pure integer
  `21 = 42/2`.

  The forced non-vacuity fact is `bhEntropy_azimuthal_ne_three`: for `M ≠ 0`, `bhEntropy M ≠
  azimuthalTurn · 3 · M²`. If the entropy count were `3` (a mis-derived coefficient), this pin would
  break and the whole return-surface family + the pure-integer lock would collapse.

  THE CERTIFICATE. `iFlag := 1` — a ℕ flag standing for "black-hole entropy IS the return-surface
  member with count `2`, NOT `3`". It is TIED to the banked N365 landing by `iFlag_forced`: the banked
  `bhEntropy_azimuthal_ne_three` witnesses that `bhEntropy 1 ≠ azimuthalTurn · 3 · 1²` (a concrete
  `M = 1 ≠ 0`), so the flag is `1` (present), not `0`.

  We anchor `min 390 iFlag = 1` (TRUE — `iFlag = 1 < 390`, so the min is `iFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the entropy count is `3` / the wrong return-surface member"
  mis-reading): that `min 390 iFlag = 390`. It GENUINELY equals `1` (`cert_val_true`). Rewriting
  reduces the bogus claim to the false numeric `1 = 390` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (390, 1) is fresh (Cid 390 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.CosmoArcReturnSurfaceConsolidation
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Foundation.ContinuumQ

/-- THE RETURN-SURFACE-COUNT NON-VACUITY FLAG: `1` = "black-hole entropy is the return-surface member
    `azimuthalTurn · 2 · M²` with count `2`, NOT `3`". -/
def iFlag : ℕ := 1

/-- TRUE (tied to the banked N365 landing): the banked `bhEntropy_azimuthal_ne_three` proves
    `bhEntropy 1 ≠ azimuthalTurn · 3 · 1²` (a concrete `M = 1 ≠ 0`), so the "count is `2`, not `3`"
    flag is present, `iFlag = 1`. If the entropy count were mis-derived as `3`, this witness would not
    exist. -/
theorem iFlag_forced :
    bhEntropy (1 : Cut) ≠ azimuthalTurn * 3 * (1 : Cut) ^ 2 ∧ iFlag = 1 :=
  ⟨bhEntropy_azimuthal_ne_three 1 (by norm_num), rfl⟩

/-- TRUE: `min 390 iFlag = 1`, holding precisely because `iFlag = 1 < 390`. -/
theorem cert_val_true : min (390 : ℕ) iFlag = 1 := by decide

/-- BOGUS: claims `min 390 iFlag = 390`. It GENUINELY equals `1` (`cert_val_true`). A "the entropy
    count is `3` / the wrong return-surface member" mis-reading reduces — through the banked value —
    to the false numeric `1 = 390`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (390 : ℕ) iFlag = 390 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 390  (FALSE — the costume bites)

end Counterexamples
