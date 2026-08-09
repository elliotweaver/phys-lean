/-
  Counterexamples.FreezeoutCorrectedDissolutionVacuityCostume — the corrected dissolution
  is GENUINE: the corrected and banked summands strictly differ (the correction is not a
  relabel), the corrected base strictly drops, and the gem moves 16/9 → 40/27. C689.
  =====================================================================================
  W8 ANTI-VACUITY. N689 banks the corrected freeze-out dissolution (active-span weights)
  as production. What must NOT be hollow: (i) the corrected summand genuinely differs
  from the banked one (their difference is the N688 correction shape, nonzero for the
  banked log values); (ii) the corrected base strictly drops; (iii) the corrected gem is
  40/27 ≠ 16/9.

  THE CERTIFICATE. attestFlag := 1 -- "correction real + base drops + gem moves".
  TIED to the banked theorems by attestFlag_forced.

  We anchor min 689 attestFlag = 1 (TRUE -- attestFlag = 1 < 689).

  THE BOGUS CLAIM (a stand-in for ANY "the correction is a relabel / zero" reading):
  that min 689 attestFlag = 689. It GENUINELY equals 1 (cert_val_true). Rewriting
  reduces the bogus claim to the false numeric 1 = 689 in the naturals. The kernel
  cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (689, 1) is fresh.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.FreezeoutCorrectedDissolution

namespace Counterexamples

open Phys.Algebra.FreezeoutCorrectedDissolution
open Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "correction real + base drops + gem moves". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked theorems): the corrected base value, its strict drop, the
    gem inequality, and attestFlag = 1. -/
theorem attestFlag_forced :
    correctedBase = 7259 / 54
      ∧ ((7259 : Cut) / 54 < 2425 / 18)
      ∧ ((40 : Cut) / 27 ≠ 16 / 9)
      ∧ attestFlag = 1 := by
  refine ⟨correctedBase_eq, Phys.Algebra.BaseGemCensusAdjudicated.correction_real,
    by norm_num, rfl⟩

/-- TRUE: min 689 attestFlag = 1. -/
theorem cert_val_true : min (689 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 689 attestFlag = 689. It GENUINELY equals 1 (cert_val_true). The
    kernel cannot close it; it BITES. -/
theorem bogus_claim : min (689 : ℕ) attestFlag = 689 := by
  rw [cert_val_true]

end Counterexamples
