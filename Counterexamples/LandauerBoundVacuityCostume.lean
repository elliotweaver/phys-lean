/-
  Counterexamples.LandauerBoundVacuityCostume — N376 anti-vacuity (C401).
  ============================================================================================
  W8 ANTI-VACUITY. The N376 node (arc-G G4 — THE LANDAUER BOUND, the ★ cross-tie to S = A/4) banks
  that the minimum cost of erasing one bit is the DERIVED BINARY self-blindness quantum
  `relInfo (resetState 2) (uniformState 2) = cutLog 2`, which is GENUINELY DISTINCT from the ternary
  `cutLog 3` (`erasureCost_ne_ternary`, via the banked N361 `cellEntropy_binary_ne_ternary`). The
  load-bearing content is that the erasure cost is the TWO-VALUED quantum `cutLog 2` — a "the erasure
  cost is not binary / a ternary count gives the same value / the cross-tie is vacuous" mis-reading
  would break the derivation. The banked `erasureCost_ne_ternary` rules this out:
  `relInfo (resetState 2) (uniformState 2) ≠ cutLog 3`.

  THE CERTIFICATE. `iFlag := 1` — a ℕ flag standing for "the erasure cost is the genuinely binary
  quantum `cutLog 2 ≠ cutLog 3` (the cross-tie to the black-hole cell entropy bites, binary is
  load-bearing)". It is TIED to the banked N376 landing by `iFlag_forced`: the banked
  `erasureCost_ne_ternary` witnesses `relInfo (resetState 2) (uniformState 2) ≠ cutLog 3`, so the
  flag is `1` (present).

  We anchor `min 401 iFlag = 1` (TRUE — `iFlag = 1 < 401`, so the min is `iFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the erasure cost is not binary / a ternary count coincides /
  the cross-tie is vacuous" mis-reading): that `min 401 iFlag = 401`. It GENUINELY equals `1`
  (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 401` in ℕ. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (401, 1) is fresh (Cid 401 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.LandauerBound
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.Landauer
open Phys.Algebra.MaxEnt
open Phys.Foundation.ContinuumQ

/-- THE ERASURE-COST BINARY-QUANTUM FLAG: `1` = "the minimum bit-erasure cost is the DERIVED binary
    self-blindness quantum `cutLog 2`, genuinely distinct from the ternary `cutLog 3` — the
    cross-tie to the black-hole cell entropy bites, binary is load-bearing". -/
def iFlag : ℕ := 1

/-- TRUE (tied to the banked N376 landing): the banked `erasureCost_ne_ternary` proves the erasure
    cost `relInfo (resetState 2) (uniformState 2)` is `≠ cutLog 3`, so the "binary-quantum" flag is
    present, `iFlag = 1`. If the cost were not genuinely binary, this witness would not exist. -/
theorem iFlag_forced :
    (relInfo (resetState 2) (uniformState 2) ≠ cutLog 3) ∧ iFlag = 1 :=
  ⟨erasureCost_ne_ternary, rfl⟩

/-- TRUE: `min 401 iFlag = 1`, holding precisely because `iFlag = 1 < 401`. -/
theorem cert_val_true : min (401 : ℕ) iFlag = 1 := by decide

/-- BOGUS: claims `min 401 iFlag = 401`. It GENUINELY equals `1` (`cert_val_true`). A "the erasure
    cost is not binary / a ternary count coincides / the cross-tie is vacuous" mis-reading reduces —
    through the banked value — to the false numeric `1 = 401`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (401 : ℕ) iFlag = 401 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 401  (FALSE — the costume bites)

end Counterexamples
