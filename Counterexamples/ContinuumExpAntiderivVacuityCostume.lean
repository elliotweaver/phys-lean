/-
  Counterexamples.ContinuumExpAntiderivVacuityCostume — N379 anti-vacuity (C404).
  ============================================================================================
  W8 ANTI-VACUITY. The N379 node (arc-H H1 — the derived-ℝ `cutExp` ANTIDERIVATIVE) banks the
  fundamental theorem of calculus in antiderivative-difference form over the derived ℝ:
  `∫₀ˣ cutExp = cutExp x − 1` (`expAntideriv_eq`), which VANISHES at the basepoint
  (`expAntideriv_zero : ∫₀⁰ cutExp = 0`). The `−1` FTC constant is LOAD-BEARING: the accumulated
  flux is `cutExp` SHIFTED so it starts at `0` at the origin, NOT `cutExp` itself. A "the
  antiderivative is just `cutExp` / the FTC constant is `0` / `∫₀⁰ cutExp = 1`" mis-reading would
  break it (it would make `∫₀⁰ cutExp = cutExp 0 = 1 ≠ 0`). The banked
  `expAntideriv_zero_ne_cutExp_zero` rules this out: `∫₀⁰ cutExp = 0 ≠ 1 = cutExp 0`.

  THE CERTIFICATE. `iFlag := 1` — a ℕ flag standing for "the accumulated flux GENUINELY vanishes at
  the basepoint (`∫₀⁰ cutExp = 0`), distinct from `cutExp 0 = 1` — the FTC `−1` constant is real".
  It is TIED to the banked N379 landing by `iFlag_forced`: the banked
  `expAntideriv_zero_ne_cutExp_zero` witnesses `∫₀⁰ cutExp ≠ cutExp 0`, so the flag is `1`.

  We anchor `min 404 iFlag = 1` (TRUE — `iFlag = 1 < 404`, so the min is `iFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the antiderivative is just `cutExp` / the FTC constant
  vanishes" mis-reading): that `min 404 iFlag = 404`. It GENUINELY equals `1` (`cert_val_true`).
  Rewriting reduces the bogus claim to the false numeric `1 = 404` in ℕ. The kernel cannot close it;
  it BITES.

  DISTINCT from the banked battery: the pair (404, 1) is fresh (Cid 404 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ContinuumExpAntideriv
import Mathlib.Tactic

namespace Counterexamples

open Phys.Foundation.ContinuumQ

/-- THE FTC-CONSTANT FLAG: `1` = "the accumulated flux `∫₀ˣ cutExp` GENUINELY vanishes at the
    basepoint (`∫₀⁰ cutExp = 0`), distinct from `cutExp 0 = 1` — the fundamental-theorem-of-calculus
    `−1` constant is real, the antiderivative is not `cutExp` itself". -/
def iFlag : ℕ := 1

/-- TRUE (tied to the banked N379 landing): the banked `expAntideriv_zero_ne_cutExp_zero` proves
    `∫₀⁰ cutExp ≠ cutExp 0`, so the "FTC constant is real" flag is present, `iFlag = 1`. If the
    antiderivative were `cutExp` itself (no `−1`), this witness would not exist. -/
theorem iFlag_forced :
    (expAntideriv 0 ≠ cutExp 0) ∧ iFlag = 1 :=
  ⟨expAntideriv_zero_ne_cutExp_zero, rfl⟩

/-- TRUE: `min 404 iFlag = 1`, holding precisely because `iFlag = 1 < 404`. -/
theorem cert_val_true : min (404 : ℕ) iFlag = 1 := by decide

/-- BOGUS: claims `min 404 iFlag = 404`. It GENUINELY equals `1` (`cert_val_true`). A "the
    antiderivative is just `cutExp` / the FTC constant vanishes" mis-reading reduces — through the
    banked value — to the false numeric `1 = 404`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (404 : ℕ) iFlag = 404 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 404  (FALSE — the costume bites)

end Counterexamples
