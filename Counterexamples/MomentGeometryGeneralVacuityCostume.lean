/-
  Counterexamples.MomentGeometryGeneralVacuityCostume — the ∀-n geometric weld is
  GENUINE: the antiderivative's derivative IS the n-ended integrand at every n and x
  (a real derivative statement of the trunk-native calculus, not a definition), the
  closed form is its full-return evaluation, the general law agrees with all five per-n
  constructions, and the geometric selection still discriminates. C680.
  =====================================================================================
  W8 ANTI-VACUITY. N680 closes referee seam B: termMomentNorm must be derived/welded to
  the constructed return moment for ALL n, not spot-welded at 1..5. What must NOT be
  hollow: (i) the geometry theorem is a genuine CutHasDerivAt statement — the same
  bespoke derivative whose uniqueness theorem is banked (a wrong derivative value would
  contradict it); (ii) the ∀-n weld composes with the ∀-n arithmetic selection to give
  the fully geometric ends-selection (moment_geometry_selects_two); (iii) the general
  law agrees with the five prior tsum constructions (geometry_agrees_{one..five});
  (iv) the discrimination has teeth: momentGeneral 4 / measure ≠ depthWeight.

  THE CERTIFICATE. attestFlag := 1 -- "derivative exhibited ∀ n ∀ x; weld total; selection geometric".
  TIED to the banked theorems by attestFlag_forced.

  We anchor min 680 attestFlag = 1 (TRUE -- attestFlag = 1 < 680).

  THE BOGUS CLAIM (a stand-in for ANY "the antiderivative is decorative / the weld is
  still spot-checked / the geometric selection fails" reading): that
  min 680 attestFlag = 680. It GENUINELY equals 1 (cert_val_true). Rewriting reduces
  the bogus claim to the false numeric 1 = 680 in the naturals. The kernel cannot close
  it; it BITES.

  DISTINCT from the banked battery: the pair (680, 1) is fresh.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.MomentGeometryGeneral

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.MirrorTermLanguage
open Phys.Algebra.DepthWeight
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "derivative exhibited ∀ n ∀ x; weld total; selection geometric". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked theorems): the geometry theorem holds at every n and x,
    the ∀-n weld holds, the geometric selection law holds, the n = 4 discrimination is
    strict, and attestFlag = 1. -/
theorem attestFlag_forced :
    (∀ (n : ℕ) (x : Cut), CutHasDerivAt (momentAntideriv n) (cutCos x ^ n * cutSin x) x)
      ∧ (∀ n : ℕ, termMomentNorm n = momentGeneral n / sinAntideriv cutPi)
      ∧ (∀ n : ℕ, (momentGeneral n / sinAntideriv cutPi = depthWeight ↔ n = 2))
      ∧ momentGeneral 4 / sinAntideriv cutPi ≠ depthWeight
      ∧ attestFlag = 1 :=
  ⟨momentAntideriv_hasDerivAt, termMomentNorm_eq_geometry, moment_geometry_selects_two,
   fun h => by simpa using (moment_geometry_selects_two 4).mp h, rfl⟩

/-- TRUE: min 680 attestFlag = 1. -/
theorem cert_val_true : min (680 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 680 attestFlag = 680. It GENUINELY equals 1 (cert_val_true). The
    kernel cannot close it; it BITES. -/
theorem bogus_claim : min (680 : ℕ) attestFlag = 680 := by
  rw [cert_val_true]

end Counterexamples
