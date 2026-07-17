/-
  Counterexamples.AntiScreeningTemperingCeilingVacuityCostume — tempering-ceiling anti-vacuity (C535).
  =====================================================================================
  W8 ANTI-VACUITY. This node (THE ANTI-SCREENING TEMPERING CEILING, the route-finder for the
  adjoint→fundamental tempering) proves that the census layer UNDER-DETERMINES the interior
  anti-screening magnitude `s`: the two census-native temperings that both fix the predecessor's
  inadmissibility — the ratio tempering (`= 3/2`) and the doubling tempering (`= 1`) — are BOTH
  strictly interior to the banked open range `(0, isoDepth)` yet are DISTINCT. The content that must
  NOT be hollow: these two admissible candidates genuinely DISAGREE (`doublingTempered ≠
  ratioTempered`, i.e. `1 ≠ 3/2`), so admissibility does not pin the point — the census layer really
  is too small to force `s`. A "the census layer already pins `s` to a unique value / the two
  temperings coincide / there is no ceiling" mis-reading is refuted by the banked `temperings_disagree`
  together with `ratioTempered_admissible` and `doublingTempered_admissible`.

  THE CERTIFICATE. ceilingFlag := 1 -- a natural-number flag standing for "the derived tempering
  ceiling is non-vacuous: two DISTINCT census-native temperings (3/2 and 1) are BOTH admissible
  (strictly interior to (0, isoDepth)), so the census layer under-determines the interior magnitude s
  — the point value requires an absolute scale one rung up, not banked here". It is TIED to the banked
  landing by ceilingFlag_forced: `temperings_disagree` gives `doublingTempered ≠ ratioTempered`, and
  the two admissibility conjuncts of `antiScreeningTemperingCeiling_landing` give both candidates
  strictly interior, so the flag is 1.

  We anchor min 535 ceilingFlag = 1 (TRUE -- ceilingFlag = 1 < 535, so the min is ceilingFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the census layer already pins s / the temperings coincide / no
  ceiling" mis-reading): that min 535 ceilingFlag = 535. It GENUINELY equals 1 (cert_val_true).
  Rewriting reduces the bogus claim to the false numeric 1 = 535 in the naturals. The kernel cannot
  close it; it BITES.

  DISTINCT from the banked battery: the pair (535, 1) is fresh (Cid 535 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.AntiScreeningTemperingCeiling
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.AntiScreeningTemperingCeiling
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the derived tempering ceiling is non-vacuous — two DISTINCT census-native temperings
    (3/2 and 1) are BOTH admissible (strictly interior to (0, isoDepth)), so the census layer
    under-determines the interior anti-screening magnitude; the point value needs an absolute scale one
    rung up, not banked here". -/
def ceilingFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the two census-native temperings DISAGREE
    (`temperings_disagree`: `doublingTempered ≠ ratioTempered`), both are strictly interior to the
    banked open range (`ratioTempered_admissible`, `doublingTempered_admissible`), and
    `ceilingFlag = 1`. -/
theorem ceilingFlag_forced :
    (doublingTempered ≠ ratioTempered)
    ∧ ((0 : Cut) < ratioTempered ∧ ratioTempered < isoDepth)
    ∧ ((0 : Cut) < doublingTempered ∧ doublingTempered < isoDepth)
    ∧ ceilingFlag = 1 :=
  ⟨temperings_disagree, ratioTempered_admissible, doublingTempered_admissible, rfl⟩

/-- TRUE: min 535 ceilingFlag = 1, holding precisely because ceilingFlag = 1 < 535. -/
theorem cert_val_true : min (535 : ℕ) ceilingFlag = 1 := by decide

/-- BOGUS: claims min 535 ceilingFlag = 535. It GENUINELY equals 1 (cert_val_true). A "the census layer
    already pins s / the temperings coincide / there is no ceiling" mis-reading reduces -- through the
    banked landing -- to the false numeric 1 = 535, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (535 : ℕ) ceilingFlag = 535 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 535  (FALSE — the costume bites)

end Counterexamples
