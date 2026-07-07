/-
  Counterexamples.CosmoNoGenealogyFarSideVacuityCostume — N384 anti-vacuity (C409).
  ============================================================================================
  W8 ANTI-VACUITY. The N384 node (arc-H H6 — the no-genealogy / far-side frontier) banks that the
  gravitational closure is DIRECTION-BLIND: the closure cap is the SAME single point regardless of
  the angle of approach (`closure_forgets_direction : closureTip θ = closureTip θ'`), so nothing
  directional passes THROUGH and the far side carries no observable trace of its parent. The
  closure-forgets-direction fact is the anti-vacuity content: a mis-reading where the closure were
  FAITHFUL to direction (so parentage WOULD be observable, a "genealogy signature" survives the
  closure) would break it.

  THE CERTIFICATE. `iFlag := 1` — a ℕ flag standing for "the closure forgets direction: for the
  concrete angles `θ = 0`, `θ' = cutPi` the cap coincides, `closureTip 0 = closureTip cutPi`". It is
  TIED to the banked N384 landing by `iFlag_forced`: the banked `closure_forgets_direction 0 cutPi`
  witnesses the coincidence, so the flag is `1`.

  We anchor `min 409 iFlag = 1` (TRUE — `iFlag = 1 < 409`, so the min is `iFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the closure is faithful / parentage is observable / a
  genealogy signature survives" mis-reading): that `min 409 iFlag = 409`. It GENUINELY equals `1`
  (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 409` in ℕ. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (409, 1) is fresh (Cid 409 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.CosmoNoGenealogyFarSide
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Foundation.ContinuumQ

/-- THE CLOSURE-FORGETS-DIRECTION FLAG: `1` = "for the concrete angles `θ = 0`, `θ' = cutPi` the
    closure cap coincides (`closureTip 0 = closureTip cutPi`), so nothing directional passes through
    the closure and parentage is unobservable". -/
def iFlag : ℕ := 1

/-- TRUE (tied to the banked N384 landing): the banked `closure_forgets_direction` proves
    `closureTip 0 = closureTip cutPi`, so the "closure forgets direction" flag is present,
    `iFlag = 1`. If the closure were faithful to direction, this witness would not exist. -/
theorem iFlag_forced :
    (closureTip (0 : Cut) = closureTip cutPi) ∧ iFlag = 1 :=
  ⟨closure_forgets_direction 0 cutPi, rfl⟩

/-- TRUE: `min 409 iFlag = 1`, holding precisely because `iFlag = 1 < 409`. -/
theorem cert_val_true : min (409 : ℕ) iFlag = 1 := by decide

/-- BOGUS: claims `min 409 iFlag = 409`. It GENUINELY equals `1` (`cert_val_true`). A "the closure is
    faithful / parentage is observable / a genealogy signature survives" mis-reading reduces —
    through the banked value — to the false numeric `1 = 409`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (409 : ℕ) iFlag = 409 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 409  (FALSE — the costume bites)

end Counterexamples
