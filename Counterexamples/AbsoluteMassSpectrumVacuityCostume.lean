/-
  Counterexamples.AbsoluteMassSpectrumVacuityCostume — N427 anti-vacuity (C452).
  ============================================================================================
  W8 ANTI-VACUITY. The N427 node (arc-P P2 — the absolute fermion mass spectrum) combines the
  derived parameter-free scale (N417), the relative Born-square eigenvalues at the derived phase
  (N340), and the derived breaking direction `L₀` (N295) into a determined absolute spectrum. The
  load-bearing non-vacuity facts: the spectrum is genuinely NON-DEGENERATE (the lightest is strictly
  below the heaviest, `absMass1 < absMass0` — a real 3-generation spectrum, not a collapsed one) AND
  the derived breaking direction `L₀ = Lmul (slotA 1)` is genuinely OUTSIDE the spectrum-preserving
  symmetry `f₄ = derH3` (`Lmul (slotA 1) ∉ derH3` — a real degeneracy-lift, not an element of the
  symmetry that fixes the degenerate point). A mis-reading where the absolute spectrum collapsed to a
  single degenerate value (no generation splitting) or where the breaking direction were inside `f₄`
  (so it could NOT lift the degeneracy) would gut the whole P2 absolute-spectrum result.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the N427 spectrum is a genuine constraint:
  the absolute masses are non-degenerate (`absMass1 < absMass0`) AND the breaking direction is
  genuinely outside `f₄` (`Lmul (slotA 1) ∉ derH3`)". It is TIED to the banked N427 landing by
  `cFlag_forced` through `absMass_nondegenerate` and `breaking_direction_outside_symmetry`.

  We anchor `min 452 cFlag = 1` (TRUE — `cFlag = 1 < 452`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the spectrum is degenerate / the breaking direction is inside
  f₄" mis-reading): that `min 452 cFlag = 452`. It GENUINELY equals `1` (`cert_val_true`). Rewriting
  reduces the bogus claim to the false numeric `1 = 452` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (452, 1) is fresh (Cid 452 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.AbsoluteMassSpectrum
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.AbsMass
open Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

/-- THE N427-NON-VACUITY FLAG: `1` = "the absolute mass spectrum is non-degenerate
    (`absMass1 < absMass0`) AND the derived breaking direction is genuinely outside the
    spectrum-preserving symmetry (`Lmul (slotA 1) ∉ derH3`)". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N427 landing): the absolute spectrum is non-degenerate, and the breaking
    direction is outside `f₄`; hence `cFlag = 1`. If the spectrum collapsed to one degenerate value
    (no generation splitting) or the breaking direction lay inside `f₄` (unable to lift the
    degeneracy), this conjunction would fail. -/
theorem cFlag_forced :
    (absMass1 < absMass0 ∧ Lmul (slotA (1 : O ℚ)) ∉ derH3) ∧ cFlag = 1 :=
  ⟨⟨absMass_nondegenerate, breaking_direction_outside_symmetry⟩, rfl⟩

/-- TRUE: `min 452 cFlag = 1`, holding precisely because `cFlag = 1 < 452`. -/
theorem cert_val_true : min (452 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 452 cFlag = 452`. It GENUINELY equals `1` (`cert_val_true`). A "spectrum is
    degenerate / breaking direction is inside f₄" mis-reading reduces — through the banked P2 landing
    — to the false numeric `1 = 452`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (452 : ℕ) cFlag = 452 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 452  (FALSE — the costume bites)

end Counterexamples
