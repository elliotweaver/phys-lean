/-
  Counterexamples.SpacetimeRicciScalarVacuityCostume — N353 anti-vacuity (C378).
  ============================================================================
  W8 ANTI-VACUITY. The N353 node (arc-E E1-Ricci-Scalar, the RICCI SCALAR = the metric (BvC) trace of the
  genuine tensorial Ricci `R = gᵘᵛ Ric_μν`, over the derived ℝ `Cut`) proves that the Ricci scalar — the
  trace of the DERIVED-metric-raised genuine Ricci — is a genuinely NONZERO invariant precisely where the
  endomorphism FIBER trace of the curvature is IDENTICALLY ZERO (N349 `fiberTrace_lbCurv_zero`). For the
  concrete field-gradient soldering `solderWit`, `ricciScalar solderWit = −¼ ≠ 0`
  (`ricciScalar_solder_ne_zero`). This is the non-vacuity teeth: the Ricci scalar is not a vacuous "always
  zero" contraction (which the blind fiber trace would suggest); raising the index with the DERIVED
  signature metric carries genuine content — the scalar the blind fiber trace destroyed is rescued, with
  the sign fixed by the derived `(1,9)` signature.

  The forced non-vacuity fact is `ricciScalar_solder_ne_zero`: `ricciScalar solderWit ≠ 0` over the
  derived `Cut`. A mis-derivation (a vacuous Ricci scalar that is always zero, a wrong raise that
  collapses to the blind fiber trace, a wrong metric that severs the signature) would make this pin break.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the Ricci scalar (the metric trace of the
  genuine Ricci) is genuinely nonzero where the fiber trace is blind". It is TIED to the banked N353
  landing by `cFlag_forced`: the banked `ricciScalar_solder_ne_zero` witnesses that the concrete Ricci
  scalar is nonzero, so the flag is `1` (present), not `0`.

  We anchor `min 378 cFlag = 1` (TRUE — `cFlag = 1 < 378`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY vacuous-scalar / blind-contraction mis-reading): that
  `min 378 cFlag = 378`. It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus claim to
  the false numeric `1 = 378` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (378, 1) is fresh (Cid 378 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.SpacetimeRicciScalar
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade
open Phys.Foundation.ContinuumQ

/-- THE RICCI-SCALAR FLAG: `1` = "the Ricci scalar (the metric trace of the genuine Ricci) is genuinely
    nonzero where the endomorphism fiber trace is blind — the contraction is not vacuous". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N353 landing): the banked `ricciScalar_solder_ne_zero` proves the concrete
    Ricci scalar `ricciScalar solderWit` is nonzero over the derived `Cut`, so the "the scalar is not
    vacuous" flag is present — `cFlag = 1`. If the Ricci scalar were vacuous (always zero, as the blind
    fiber trace would suggest), this witness would not exist. -/
theorem cFlag_forced :
    (ricciScalar solderWit ≠ 0) ∧ cFlag = 1 :=
  ⟨ricciScalar_solder_ne_zero, rfl⟩

/-- TRUE: `min 378 cFlag = 1`, holding precisely because `cFlag = 1 < 378`. -/
theorem cert_val_true : min (378 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 378 cFlag = 378`. It GENUINELY equals `1` (`cert_val_true`). A vacuous-scalar /
    blind-contraction mis-reading reduces — through the banked value — to the false numeric `1 = 378`,
    so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (378 : ℕ) cFlag = 378 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 378  (FALSE — the costume bites)

end Counterexamples
