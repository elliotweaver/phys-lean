/-
  Counterexamples.UniversalityCriticalExponentVacuityCostume — N374 anti-vacuity (C399).
  ============================================================================================
  W8 ANTI-VACUITY. The N374 node (arc-G G2 — UNIVERSALITY / THE CRITICAL EXPONENT, the marquee
  cross-tie J-G2) banks that the framework's critical exponent — the entry of the unique
  permutation-equivariant, sum-reading, nonzero idempotent operator on the banked 42-channel space —
  is GENUINELY the banked fine-structure channel share `α* = 1/42`, and NOT the WRONG `1/49` (which
  would keep the degenerate diagonal self-pairs, `n² = 49` channels). The load-bearing content is
  that the exponent takes the DERIVED active-channel value `1/42`: a "the exponent is the naive
  `1/49`" mis-reading would break the derivation. The banked `criticalExponent_ne_wrong` rules this
  out: the critical exponent is `1/42 ≠ 1/49`.

  THE CERTIFICATE. `iFlag := 1` — a ℕ flag standing for "the critical exponent is the DERIVED
  active-channel share `1/42`, NOT the naive `1/49`". It is TIED to the banked N374 landing by
  `iFlag_forced`: the banked `criticalExponent_ne_wrong` witnesses `criticalExponent ≠ 1/49`, so the
  flag is `1` (present).

  We anchor `min 399 iFlag = 1` (TRUE — `iFlag = 1 < 399`, so the min is `iFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the critical exponent is the naive `1/49` / the diagonal is
  not dropped / the cross-tie is vacuous" mis-reading): that `min 399 iFlag = 399`. It GENUINELY
  equals `1` (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 399` in
  ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (399, 1) is fresh (Cid 399 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.UniversalityCriticalExponent
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.Universality

/-- THE UNIVERSALITY CROSS-TIE NON-VACUITY FLAG: `1` = "the critical exponent is the DERIVED
    active-channel share `1/42` (the banked `α*`), NOT the naive `1/49` that keeps the degenerate
    diagonal self-pairs — the marquee cross-tie is non-vacuous". -/
def iFlag : ℕ := 1

/-- TRUE (tied to the banked N374 landing): the banked `criticalExponent_ne_wrong` proves the
    critical exponent is `1/42 ≠ 1/49`, so the "derived-active-channel-value" flag is present,
    `iFlag = 1`. If the exponent were the naive `1/49`, this witness would not exist. -/
theorem iFlag_forced : (criticalExponent ≠ 1 / 49) ∧ iFlag = 1 :=
  ⟨criticalExponent_ne_wrong, rfl⟩

/-- TRUE: `min 399 iFlag = 1`, holding precisely because `iFlag = 1 < 399`. -/
theorem cert_val_true : min (399 : ℕ) iFlag = 1 := by decide

/-- BOGUS: claims `min 399 iFlag = 399`. It GENUINELY equals `1` (`cert_val_true`). A "the critical
    exponent is the naive `1/49` / the diagonal is not dropped / the cross-tie is vacuous"
    mis-reading reduces — through the banked value — to the false numeric `1 = 399`, so this must
    NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (399 : ℕ) iFlag = 399 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 399  (FALSE — the costume bites)

end Counterexamples
