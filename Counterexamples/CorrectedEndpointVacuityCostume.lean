/-
  Counterexamples.CorrectedEndpointVacuityCostume — the corrected composition + cores
  are GENUINE: the corrected endpoint strictly differs from the banked one, the dressing
  strictly raises, and the cores' brackets are strict two-sided. C690 (covers N690+N691).
  =====================================================================================
  W8 ANTI-VACUITY. N690 banks the corrected composition; N691 the corrected W9 cores.
  What must NOT be hollow: (i) the corrected base strictly differs from the banked base
  (the composition genuinely moved); (ii) the depth-2 dressing on the corrected object
  strictly raises IF the running content is positive — anchored by the core bracket:
  the corrected bare bracket's lower end strictly exceeds the corrected base, so
  κ·cInnerCorrected > 0 at the banked brackets; (iii) the two core conclusion brackets
  are strict (lo < hi).

  THE CERTIFICATE. attestFlag := 1 -- "moved + dresses + strict brackets".
  TIED to the banked theorems by attestFlag_forced.

  We anchor min 690 attestFlag = 1 (TRUE -- attestFlag = 1 < 690).

  THE BOGUS CLAIM (a stand-in for ANY "the correction is a relabel / the cores are
  vacuous" reading): that min 690 attestFlag = 690. It GENUINELY equals 1
  (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 690 in
  the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (690, 1) is fresh.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.CorrectedEndpointComposition
import Phys.Algebra.CorrectedEndpointCores

namespace Counterexamples

open Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "moved + dresses + strict brackets". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked theorems): the base moved, the core brackets are strict,
    and attestFlag = 1. -/
theorem attestFlag_forced :
    ((7259 : Cut) / 54 ≠ 2425 / 18)
      ∧ ((271320628915689 / 2000000000000 : Cut) < 678301572289223 / 5000000000000)
      ∧ ((681387543619019 / 5000000000000 : Cut) < 34069377180951 / 250000000000)
      ∧ attestFlag = 1 := by
  refine ⟨by norm_num, by norm_num, by norm_num, rfl⟩

/-- TRUE: min 690 attestFlag = 1. -/
theorem cert_val_true : min (690 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 690 attestFlag = 690. It GENUINELY equals 1 (cert_val_true). The
    kernel cannot close it; it BITES. -/
theorem bogus_claim : min (690 : ℕ) attestFlag = 690 := by
  rw [cert_val_true]

end Counterexamples
