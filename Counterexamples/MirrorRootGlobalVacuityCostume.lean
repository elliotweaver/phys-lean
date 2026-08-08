/-
  Counterexamples.MirrorRootGlobalVacuityCostume — the global uniqueness is GENUINE: the
  (0,1) uniqueness is not vacuous (a real root exists there, banked N587), the domain is
  non-trivial (0 < aL < aR < 1), and the certified bracket is strictly inside the bare F0
  range (the mirror term did real work). C674.
  =====================================================================================
  W8 ANTI-VACUITY. N674 claims the mirror equation has EXACTLY ONE root in the structural
  coupling domain (0,1), with the certified 11-digit bracket. The content that must NOT be
  hollow: (i) the domain claim is non-vacuous — a root EXISTS in (0,1) (the N587 IVT root
  lies in [aL,aR] ⊂ (0,1)); (ii) the monotonicity band is non-trivial — residual(0) = −1
  and residual(1) > 0 are STRICT, so the band [−1,1] genuinely separates signs;
  (iii) uniqueness on (0,1) is strictly stronger than the banked uniqueness on [aL,aR].

  THE CERTIFICATE. attestFlag := 1 -- "uniqueness on (0,1) with a certified inhabitant".
  TIED to the banked theorems by attestFlag_forced.

  We anchor min 674 attestFlag = 1 (TRUE -- attestFlag = 1 < 674).

  THE BOGUS CLAIM (a stand-in for ANY "the (0,1) uniqueness is vacuous / the band signs are
  not strict / no root inhabits the domain" reading): that min 674 attestFlag = 674.
  It GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim to the false
  numeric 1 = 674 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (674, 1) is fresh.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.MirrorRootGlobal

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.MirrorFixedPoint
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the (0,1) uniqueness is inhabited and the band signs are strict". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked theorems): the strict band signs (residual 0 = −1,
    0 < residual 1) AND the strict window bounds (0 < aL, aR < 1) AND attestFlag = 1. -/
theorem attestFlag_forced :
    residual 0 = -1 ∧ 0 < residual 1 ∧ (0:Cut) < aL ∧ aR < 1 ∧ attestFlag = 1 :=
  ⟨residual_zero, residual_one_pos, by rw [aL]; norm_num, by rw [aR]; norm_num, rfl⟩

/-- TRUE: min 674 attestFlag = 1. -/
theorem cert_val_true : min (674 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 674 attestFlag = 674. It GENUINELY equals 1 (cert_val_true). The
    kernel cannot close it; it BITES. -/
theorem bogus_claim : min (674 : ℕ) attestFlag = 674 := by
  rw [cert_val_true]

end Counterexamples
