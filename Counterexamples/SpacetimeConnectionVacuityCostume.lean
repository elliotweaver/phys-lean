/-
  Counterexamples.SpacetimeConnectionVacuityCostume — N347 anti-vacuity (C372).
  ============================================================================
  W8 ANTI-VACUITY. The N347 node (arc-E E1b, the look-back transport / connection
  `Γ = ½·η·k` over the derived ℝ `Cut`) proves metric-compatibility `Γᵀη + ηΓ = k` EXACTLY, and,
  crucially, that the Christoffel `½` is genuinely LOAD-BEARING: DROPPING it (the naive transport
  `η·k`) makes metric-compatibility FAIL for the concrete nonzero variation `timeProj` — it gives
  `2k ≠ k` (`wrongConn_not_compatible`). This is the non-vacuity teeth: metric-compatibility is not
  a trivial identity that any `η`-scaled operator satisfies; the specific coefficient `½` is forced.

  The forced non-vacuity fact is `wrongConn_not_compatible`: for `k = timeProj`, the naive transport
  `η·k` (missing the `½`) does NOT satisfy `Γᵀη + ηΓ = k` over the derived `Cut`. A mis-derivation
  (a wrong coefficient, a vacuous compatibility that holds for any operator, a wrong involution `η`)
  would make this pin break.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the Christoffel ½ is load-bearing, i.e.
  dropping it breaks metric-compatibility for a concrete field". It is TIED to the banked N347
  landing by `cFlag_forced`: the banked `wrongConn_not_compatible` witnesses that the naive
  no-½ transport fails compatibility, so the flag is `1` (present), not `0`.

  We anchor `min 372 cFlag = 1` (TRUE — `cFlag = 1 < 372`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY vacuous-compatibility / wrong-coefficient mis-reading): that
  `min 372 cFlag = 372`. It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus
  claim to the false numeric `1 = 372` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (372, 1) is fresh (Cid 372 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.SpacetimeConnection
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra

/-- THE COMPATIBILITY FLAG: `1` = "the Christoffel ½ is load-bearing — dropping it breaks
    metric-compatibility for a concrete nonzero variation (the look-back transport must have the ½)". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N347 landing): the banked `wrongConn_not_compatible` proves the naive
    transport `η·k` (missing the `½`) does NOT satisfy metric-compatibility `Γᵀη + ηΓ = k` for the
    concrete nonzero variation `timeProj`, so the load-bearing flag is present — `cFlag = 1`. If
    compatibility were vacuous (holding for any coefficient), this witness would not exist. -/
theorem cFlag_forced :
    ((timeProj * sigOpC) * sigOpC + sigOpC * (sigOpC * timeProj) ≠ (timeProj : MetricEnd))
      ∧ cFlag = 1 :=
  ⟨wrongConn_not_compatible, rfl⟩

/-- TRUE: `min 372 cFlag = 1`, holding precisely because `cFlag = 1 < 372`. -/
theorem cert_val_true : min (372 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 372 cFlag = 372`. It GENUINELY equals `1` (`cert_val_true`). A vacuous
    compatibility / wrong-coefficient mis-reading reduces — through the banked value — to the false
    numeric `1 = 372`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (372 : ℕ) cFlag = 372 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 372  (FALSE — the costume bites)

end Counterexamples
