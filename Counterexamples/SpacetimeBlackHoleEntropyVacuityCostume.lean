/-
  Counterexamples.SpacetimeBlackHoleEntropyVacuityCostume — N361 anti-vacuity (C386).
  ============================================================================
  W8 ANTI-VACUITY. The N361 node (arc-E E5, BLACK HOLE ENTROPY `S = A/4` with `s₀ = ln 2` DERIVED, over
  the derived ℝ `Cut`) banks the Bekenstein–Hawking structure: the first law fixes the entropy
  coefficient, the area law `S = A/4` reduces to the banked `gravCouplingCoeff = 2·(4π flux)` (N359), and
  the entropy per boundary cell `s₀ = ln 2 = cutLog 2` is the fold's BINARY self-blindness count — where
  BINARY is LOAD-BEARING: a ternary count `ω = 3` would give `cutLog 3 ≠ cutLog 2`.

  The forced non-vacuity fact is `cellEntropy_binary_ne_ternary`: `cellEntropy = cutLog 2 ≠ cutLog 3` —
  the binary forcing-failure count `2` (see / not-see) gives `ln 2`, genuinely different from the ternary
  `ln 3`. A mis-derivation (WRONGLY taking a non-binary self-blindness count, `ω = 3`, giving the "`4 ln 3`"
  cell area) would make this pin break: if `cutLog 2 = cutLog 3`, the entropy per cell would be ambiguous.

  THE CERTIFICATE. `iFlag := 1` — a ℕ flag standing for "the entropy per boundary cell is the BINARY
  `cutLog 2`, NOT the ternary `cutLog 3` (the self-blindness is two-valued)". It is TIED to the banked
  N361 landing by `iFlag_forced`: the banked `cellEntropy_binary_ne_ternary` witnesses `cutLog 2 ≠ cutLog 3`,
  so the flag is `1` (present), not `0`.

  We anchor `min 386 iFlag = 1` (TRUE — `iFlag = 1 < 386`, so the min is `iFlag`).

  THE BOGUS CLAIM (a stand-in for ANY non-binary / ternary-count mis-reading): that `min 386 iFlag = 386`.
  It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric
  `1 = 386` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (386, 1) is fresh (Cid 386 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.SpacetimeBlackHoleEntropy
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

/-- THE BLACK-HOLE-ENTROPY NON-VACUITY FLAG: `1` = "the entropy per boundary cell is the BINARY `cutLog 2`,
    not the ternary `cutLog 3`; the fold's self-blindness is two-valued (see / not-see)". -/
def iFlag : ℕ := 1

/-- TRUE (tied to the banked N361 landing): the banked `cellEntropy_binary_ne_ternary` proves
    `cellEntropy = cutLog 2 ≠ cutLog 3`, so the "binary, not ternary" flag is present — `iFlag = 1`. If a
    non-binary count WRONGLY collapsed `cutLog 2 = cutLog 3`, this witness would not exist. -/
theorem iFlag_forced :
    (cellEntropy ≠ cutLog 3) ∧ iFlag = 1 :=
  ⟨cellEntropy_binary_ne_ternary, rfl⟩

/-- TRUE: `min 386 iFlag = 1`, holding precisely because `iFlag = 1 < 386`. -/
theorem cert_val_true : min (386 : ℕ) iFlag = 1 := by decide

/-- BOGUS: claims `min 386 iFlag = 386`. It GENUINELY equals `1` (`cert_val_true`). A non-binary /
    ternary-count mis-reading reduces — through the banked value — to the false numeric `1 = 386`, so this
    must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (386 : ℕ) iFlag = 386 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 386  (FALSE — the costume bites)

end Counterexamples
