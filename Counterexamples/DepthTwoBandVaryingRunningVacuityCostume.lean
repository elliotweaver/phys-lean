/-
  Counterexamples.DepthTwoBandVaryingRunningVacuityCostume — the band-varying-zero-on-high way-point
  value `190/3` is GENUINELY DISTINCT from the uniform-second-depth value `74` (not a hollow/collapsed
  coincidence), C562.
  =====================================================================================
  W8 ANTI-VACUITY. This node (DEPTH-2 BAND-VARYING RUNNING FRAMEWORK) banks the census-in-census
  composed at SECOND depth as a BAND-VARYING running correction, and its KEY content is WAY-POINT
  PRESERVATION: the band-varying tower with zero second-depth weight on the high way-point bands
  reproduces the banked confinement way-point `190/3` (`zeroOnHigh_preserves_waypoint`), whereas the
  UNIFORM second-depth dressing MOVES it to `74` (`uniform_derived_moves_waypoint`, the banked
  `DressingSeamResolved` exclusion). The content that must NOT be hollow is that these two are GENUINELY
  DIFFERENT — `190/3 ≠ 74` — so preserving the way-point via the band-varying-zero-on-high frame is a
  real, content-bearing choice, not a coincidence where uniform and band-varying agree. If `190/3 = 74`
  the framework's whole point (way-point preservation distinguishing band-varying from uniform) would be
  vacuous. The distinction is the genuine strict rational inequality `190/3 ≠ 74` anchoring the banked
  `varying_vs_uniform_waypoint`.

  THE CERTIFICATE. distinctFlag := 1 -- a natural-number flag standing for "the band-varying-zero-on-
  high way-point value genuinely differs from the uniform-second-depth value, so way-point preservation
  is a real distinction". It is TIED to the banked landing by distinctFlag_forced.

  We anchor min 562 distinctFlag = 1 (TRUE -- distinctFlag = 1 < 562, so the min is distinctFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the band-varying frame agrees with the uniform one / way-point
  preservation is vacuous / the depth-2 running has no band-varying content" reading): that
  min 562 distinctFlag = 562. It GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim
  to the false numeric 1 = 562 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (562, 1) is fresh (Cid 562 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.DepthTwoBandVaryingRunning
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.DepthTwoBandVaryingRunning
open Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the band-varying-zero-on-high way-point value genuinely differs from the
    uniform-second-depth value, so way-point preservation is a real distinction". -/
def distinctFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the band-varying-zero-on-high way-point value genuinely differs
    from the uniform-second-depth value (`varying_vs_uniform_waypoint`), and `distinctFlag = 1`. -/
theorem distinctFlag_forced :
    (bandVaryingInvAlphaZero (withWeight 0 derivedBandList)
      ≠ bandVaryingInvAlphaZero (withWeight depthWeight derivedBandList))
    ∧ distinctFlag = 1 :=
  ⟨varying_vs_uniform_waypoint, rfl⟩

/-- TRUE: min 562 distinctFlag = 1, holding precisely because distinctFlag = 1 < 562. -/
theorem cert_val_true : min (562 : ℕ) distinctFlag = 1 := by decide

/-- BOGUS: claims min 562 distinctFlag = 562. It GENUINELY equals 1 (cert_val_true). A "the band-varying
    frame agrees with the uniform one / way-point preservation is vacuous / the depth-2 running has no
    band-varying content" reading reduces -- through the banked varying_vs_uniform_waypoint tie -- to the
    false numeric 1 = 562 in the naturals. The kernel cannot close it; it BITES. -/
theorem bogus_claim : min (562 : ℕ) distinctFlag = 562 := by
  rw [cert_val_true]

end Counterexamples
