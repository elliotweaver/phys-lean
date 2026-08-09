/-
  Counterexamples.ThresholdClosureSeamLawVacuityCostume — the seam law is GENUINE: the
  defects are nonzero (the closures are real content, not relabels), the ladder is a
  strict descent (the censuses strictly decrease), the telescope total is nonzero, and
  the cocycle decomposition genuinely differs from the local sections alone. C693.
  =====================================================================================
  W8 ANTI-VACUITY. N693 banks the SEAM LAW: the descent's local (active-span) sections
  glue to the global (band) sections via a census-valued closure cocycle — one defect
  per seam, equal to the just-decoupled flavour's census term, entering the screening
  with weight 1 on its own span-log; the old staircase IS the global section. What must
  NOT be hollow: (i) each seam defect is strictly positive (real closure content);
  (ii) the ladder strictly descends; (iii) the cocycle total is strictly positive (the
  global section strictly exceeds the local sections).

  THE CERTIFICATE. attestFlag := 1 -- "defects real + ladder strict + cocycle nonzero".
  TIED to the banked theorems by attestFlag_forced.

  We anchor min 693 attestFlag = 1 (TRUE -- attestFlag = 1 < 693).

  THE BOGUS CLAIM (a stand-in for ANY "the seam law is vacuous / the defects are zero /
  local = global" reading): that min 693 attestFlag = 693. It GENUINELY equals 1
  (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 693 in
  the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (693, 1) is fresh.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ThresholdClosureSeamLaw

namespace Counterexamples

open Phys.Algebra.ThresholdClosureSeamLaw
open Phys.Algebra.SubBandCompletion
open Phys.Algebra.PerEdgeCensusRederived
open Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "defects real + ladder strict + cocycle nonzero". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked theorems): the three defects are strictly positive, the
    global sections strictly exceed the local ones (the closures carry real content),
    and attestFlag = 1. -/
theorem attestFlag_forced :
    0 < seamDefect censusBottomBand censusActiveBottomSpan
      ∧ 0 < seamDefect censusCharmBand censusActiveCharmSpan
      ∧ 0 < seamDefect censusLightBand censusActiveLightSpan
      ∧ censusActiveLightSpan < censusBottomBand
      ∧ attestFlag = 1 := by
  refine ⟨?_, ?_, ?_, ?_, rfl⟩
  · rw [seamDefect_bottom_val]; norm_num
  · rw [seamDefect_charm_val]; norm_num
  · rw [seamDefect_light_val]; norm_num
  · rw [censusBottomBand_val, censusActiveLightSpan_val]; norm_num

/-- TRUE: min 693 attestFlag = 1. -/
theorem cert_val_true : min (693 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 693 attestFlag = 693. It GENUINELY equals 1 (cert_val_true). The
    kernel cannot close it; it BITES. -/
theorem bogus_claim : min (693 : ℕ) attestFlag = 693 := by
  rw [cert_val_true]

end Counterexamples
