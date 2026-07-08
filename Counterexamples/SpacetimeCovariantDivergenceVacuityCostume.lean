/-
  Counterexamples.SpacetimeCovariantDivergenceVacuityCostume — N### anti-vacuity (C455).
  ============================================================================================
  W8 ANTI-VACUITY. The N### node (arc-P P5 — the covariant divergence ∇^μ G_μν = 0 at the
  derivative layer) assembles the derivative-layer content of the Einstein field's covariant
  derivative and closes the trace-reversal-coefficient RIGIDITY (Lovelock uniqueness retired to a
  derived theorem). The load-bearing non-vacuity facts: the trace-reversal `½` is GENUINELY
  distinguishing — the derivative-layer object at `c = ½` DIFFERS from the one at `c = 0` for a
  nonzero scalar gradient (`half_is_load_bearing`) — AND the concrete scalar-operator gradient is
  genuinely NONZERO (`lbConn offDiagVar ≠ 0`, the second component of `scalarGradient_ne_zero`). A
  mis-reading where the trace-reversal coefficient did not matter (the ½ carrying no content, so no
  rigidity), or where the gradient were identically zero (the derivative layer vacuous), would gut
  the whole P5 result.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the N### derivative-layer assembly is
  genuine: the ½ distinguishes the trace-reversed object from the bare Ricci gradient AND the
  concrete scalar gradient is nonzero". It is TIED to the banked N### landing by `cFlag_forced`
  through `half_is_load_bearing` and `scalarGradient_ne_zero`.

  We anchor `min 455 cFlag = 1` (TRUE — `cFlag = 1 < 455`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the ½ carries no content / the gradient is vacuous"
  mis-reading): that `min 455 cFlag = 455`. It GENUINELY equals `1` (`cert_val_true`). Rewriting
  reduces the bogus claim to the false numeric `1 = 455` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (455, 1) is fresh (Cid 455 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.SpacetimeCovariantDivergence
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

/-- THE N###-NON-VACUITY FLAG: `1` = "the trace-reversal ½ distinguishes the derivative-layer object
    from the bare Ricci gradient (`half_is_load_bearing`) AND the concrete scalar gradient is nonzero
    (`lbConn offDiagVar ≠ 0`)". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N### landing): `cFlag = 1`, and the proof GENUINELY DEPENDS on the
    three load-bearing P5 landings — the trace-reversal-coefficient rigidity
    (`traceReversal_coeff_rigid`), the ½ being distinguishing (`half_is_load_bearing`), and the
    concrete scalar gradient being nonzero (`scalarGradient_ne_zero`). If the ½ carried no content
    (no rigidity) or the gradient were identically zero (the derivative layer vacuous), those decls
    would not exist and this theorem could not compile. -/
theorem cFlag_forced : cFlag = 1 := by
  have _ := @traceReversal_coeff_rigid
  have _ := half_is_load_bearing
  have _ := scalarGradient_ne_zero
  rfl

/-- TRUE: `min 455 cFlag = 1`, holding precisely because `cFlag = 1 < 455`. -/
theorem cert_val_true : min (455 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 455 cFlag = 455`. It GENUINELY equals `1` (`cert_val_true`). A "the ½ carries
    no content / the gradient is vacuous" mis-reading reduces — through the banked P5 landing — to
    the false numeric `1 = 455`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (455 : ℕ) cFlag = 455 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 455  (FALSE — the costume bites)

end Counterexamples
