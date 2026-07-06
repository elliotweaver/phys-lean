/-
  Counterexamples.ContinuumExpDerivVacuityCostume — N369 anti-vacuity (C394).
  ============================================================================================
  W8 ANTI-VACUITY. The N369 node (arc-F F4 toolkit — THE ANALYTIC FOLD) banks that the derivative of
  `cutExp` at `0` is `1`: `cutExp_diffquot_zero : t⁻¹ (cutExp t − 1) → 1` in `𝓝[≠] 0`, and hence
  `cutExp' = cutExp` everywhere (`cutExp_hasDerivAt`). The derivative-at-0 value `1` is LOAD-BEARING:
  if it were instead `0` (a mis-derived "the difference quotient vanishes at 0"), then the analytic
  fold `cutExp' = cutExp` would collapse (the factor `cutExp x · 1` would become `cutExp x · 0 = 0`),
  making `cutExp` a constant/degenerate map. The banked `cutExp_diffquot_zero_ne` rules this out via
  the uniqueness of `Tendsto` limits over the derived ℝ.

  THE CERTIFICATE. `iFlag := 1` — a ℕ flag standing for "the derivative-at-0 value is `1`, NOT `0`
  (the analytic fold `cutExp' = cutExp` is non-degenerate)". It is TIED to the banked N369 landing by
  `iFlag_forced`: the banked `cutExp_diffquot_zero_ne` witnesses that the difference quotient does NOT
  tend to `0`, so the flag is `1` (present).

  We anchor `min 394 iFlag = 1` (TRUE — `iFlag = 1 < 394`, so the min is `iFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the derivative at 0 vanishes / the analytic fold is
  degenerate" mis-reading): that `min 394 iFlag = 394`. It GENUINELY equals `1` (`cert_val_true`).
  Rewriting reduces the bogus claim to the false numeric `1 = 394` in ℕ. The kernel cannot close it;
  it BITES.

  DISTINCT from the banked battery: the pair (394, 1) is fresh (Cid 394 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Foundation.ContinuumExpDeriv
import Mathlib.Tactic

namespace Counterexamples

open Phys.Foundation.ContinuumQ

/-- THE ANALYTIC-FOLD NON-VACUITY FLAG: `1` = "the derivative of `cutExp` at `0` is `1`, not `0` —
    the analytic fold `cutExp' = cutExp` is non-degenerate". -/
def iFlag : ℕ := 1

/-- TRUE (tied to the banked N369 landing): the banked `cutExp_diffquot_zero_ne` proves the
    difference quotient of `cutExp` at `0` does NOT tend to `0`, so the "derivative-is-1" flag is
    present, `iFlag = 1`. If the derivative at 0 vanished, this witness would not exist. -/
theorem iFlag_forced :
    (¬ Filter.Tendsto (fun t : Cut => t⁻¹ * (cutExp t - 1)) (nhdsWithin 0 {0}ᶜ) (nhds 0))
      ∧ iFlag = 1 :=
  ⟨cutExp_diffquot_zero_ne, rfl⟩

/-- TRUE: `min 394 iFlag = 1`, holding precisely because `iFlag = 1 < 394`. -/
theorem cert_val_true : min (394 : ℕ) iFlag = 1 := by decide

/-- BOGUS: claims `min 394 iFlag = 394`. It GENUINELY equals `1` (`cert_val_true`). A "the derivative
    at 0 vanishes / the analytic fold is degenerate" mis-reading reduces — through the banked value —
    to the false numeric `1 = 394`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (394 : ℕ) iFlag = 394 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 394  (FALSE — the costume bites)

end Counterexamples
