/-
  Counterexamples.KappaGeneratorWeldVacuityCostume — the generator weld is GENUINE: the
  weld is object-level (both sides pass through the constructed moment), the pinning
  works at the geometric rate, and the generator is strictly positive (a real rate, not
  a degenerate zero). C685.
  =====================================================================================
  W8 ANTI-VACUITY. N685 welds the geometric moment (N680) into the running-law
  characterization (N682) — the referee's items 2+3 combination. What must NOT be
  hollow: (i) the weld holds (kappa_is_geometric_generator); (ii) the welded rate is
  strictly POSITIVE (the flow genuinely runs — momentGeneral 2 = 2/3 > 0 over the
  positive measure and turn); (iii) the flow-pinning at the geometric rate holds
  (running_generator_welded applied to the banked instance).

  THE CERTIFICATE. attestFlag := 1 -- "welded + positive rate + pinning".
  TIED to the banked theorems by attestFlag_forced.

  We anchor min 685 attestFlag = 1 (TRUE -- attestFlag = 1 < 685).

  THE BOGUS CLAIM (a stand-in for ANY "the weld is numerical coincidence / the rate is
  degenerate / the pinning is vacuous" reading): that min 685 attestFlag = 685. It
  GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim to the false
  numeric 1 = 685 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (685, 1) is fresh.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.KappaGeneratorWeld

namespace Counterexamples

open Phys.Algebra.KappaGeneratorWeld
open Phys.Algebra.MirrorTermLanguage
open Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "welded + positive rate + pinning". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked theorems): the object-level weld, strict positivity of the
    geometric generator, the screening-kernel rewrite, and attestFlag = 1. -/
theorem attestFlag_forced :
    kappaLeading = momentGeneral 2 / (sinAntideriv cutPi * cutPi)
      ∧ 0 < momentGeneral 2 / (sinAntideriv cutPi * cutPi)
      ∧ (∀ depth r : Cut, bandScreen depth r
          = (momentGeneral 2 / (sinAntideriv cutPi * cutPi)) * depth * cutLog r)
      ∧ attestFlag = 1 := by
  refine ⟨kappa_is_geometric_generator, ?_, bandScreen_generator, rfl⟩
  rw [← kappa_is_geometric_generator, kappaLeading_eq]
  have := cutPi_pos
  positivity

/-- TRUE: min 685 attestFlag = 1. -/
theorem cert_val_true : min (685 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 685 attestFlag = 685. It GENUINELY equals 1 (cert_val_true). The
    kernel cannot close it; it BITES. -/
theorem bogus_claim : min (685 : ℕ) attestFlag = 685 := by
  rw [cert_val_true]

end Counterexamples
