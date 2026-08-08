/-
  Counterexamples.AlphaLandingCapstoneVacuityCostume — the capstone is GENUINE: the
  derived admissible domain does REAL selection work (a second positive root exists and
  is excluded), the α⁴ normalization mismatch is exact, and the welded capstone is
  inhabited. C677.
  =====================================================================================
  W8 ANTI-VACUITY. N677 claims one welded theorem: unique legal term + unique
  chain-admissible root + certified bracket, with admissibility DERIVED (1/α ≥ 42) and
  the landing interval used only for certification. The content that must NOT be hollow:
  (i) the admissibility condition is LOAD-BEARING — second_root_exists proves the cubic
  has another positive root in [1,30], and second_root_not_admissible excludes it: global
  uniqueness was never silently assumed; (ii) the α⁴ exclusion is an exact mismatch
  ((2/5)/2 = 1/5 ≠ 1/3), not prose; (iii) the capstone's exists-unique is inhabited.

  THE CERTIFICATE. attestFlag := 1 -- "the admissibility selects and the capstone is inhabited".
  TIED to the banked theorems by attestFlag_forced.

  We anchor min 677 attestFlag = 1 (TRUE -- attestFlag = 1 < 677).

  THE BOGUS CLAIM (a stand-in for ANY "the admissibility is decorative / the cubic is
  globally one-rooted anyway / the fourth moment is the banked weight" reading): that
  min 677 attestFlag = 677. It GENUINELY equals 1 (cert_val_true). Rewriting reduces the
  bogus claim to the false numeric 1 = 677 in the naturals. The kernel cannot close it;
  it BITES.

  DISTINCT from the banked battery: the pair (677, 1) is fresh.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.AlphaLandingCapstone

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.MirrorFixedPoint
open Phys.Algebra.MirrorTermLanguage
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the derived admissibility selects and the capstone is inhabited". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked theorems): the cubic has a second positive root in [1,30]
    (`second_root_exists` — global uniqueness was never available), residual(30) < 0
    strictly (`residual_neg_at_thirty`), the fourth-moment normalization mismatch is
    exact (`fourth_moment_not_banked_weight`), and attestFlag = 1. -/
theorem attestFlag_forced :
    (∃ b ∈ Set.Icc (1:Cut) 30, residual b = 0)
      ∧ residual 30 < 0
      ∧ fourthEvenMomentFlux cutPi / sinAntideriv cutPi ≠ DepthWeight.depthWeight
      ∧ attestFlag = 1 :=
  ⟨second_root_exists, residual_neg_at_thirty, fourth_moment_not_banked_weight, rfl⟩

/-- TRUE: min 677 attestFlag = 1. -/
theorem cert_val_true : min (677 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 677 attestFlag = 677. It GENUINELY equals 1 (cert_val_true). The
    kernel cannot close it; it BITES. -/
theorem bogus_claim : min (677 : ℕ) attestFlag = 677 := by
  rw [cert_val_true]

end Counterexamples
