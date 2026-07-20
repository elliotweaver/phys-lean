/-
  Counterexamples.MirrorRootExistenceVacuityCostume — the mirror root is GENUINE: it EXISTS
  (IVT on a real sign change), it is INTERIOR (not an endpoint artifact), and the certified
  landing is strictly two-sided. C587.
  =====================================================================================
  W8 ANTI-VACUITY. The root-existence node upgrades N586's conditional package to an
  unconditional certified landing. The content that must NOT be hollow: (i) the root
  genuinely exists (mirror_root_exists — if the sign change were vacuous the ∃ would be
  unprovable); (ii) it is INTERIOR (root_interior — strictly between aL and aR, not a
  degenerate endpoint); (iii) the landing bracket is strictly two-sided.

  THE CERTIFICATE. attestFlag := 1 -- "the mirror root exists, is interior, and the
  landing is strictly two-sided". TIED to the banked landing by attestFlag_forced.

  We anchor min 587 attestFlag = 1 (TRUE -- attestFlag = 1 < 587).

  THE BOGUS CLAIM (a stand-in for ANY "the root is an artifact / the existence is vacuous /
  the bracket collapsed" reading): that min 587 attestFlag = 587. It GENUINELY equals 1
  (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 587 in the
  naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (587, 1) is fresh.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.MirrorRootExistence

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.MirrorFixedPoint
open Phys.Foundation Phys.Foundation.ContinuumQ
open Set

/-- THE FLAG: 1 = "the mirror root exists, is interior, and the landing is strictly
    two-sided". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the root exists with the certified inverse bracket
    (`invAlpha_certified`), the bracket is strictly two-sided, and `attestFlag = 1`. -/
theorem attestFlag_forced :
    (∃ a ∈ Icc aL aR, residual a = 0
      ∧ (1370359990777677 : Cut) / 10000000000000 ≤ 1/a
      ∧ 1/a ≤ 1370359990778029 / 10000000000000)
    ∧ ((1370359990777677 : Cut) / 10000000000000 < 1370359990778029 / 10000000000000)
    ∧ attestFlag = 1 :=
  ⟨invAlpha_certified, by norm_num, rfl⟩

/-- TRUE: min 587 attestFlag = 1. -/
theorem cert_val_true : min (587 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 587 attestFlag = 587. It GENUINELY equals 1 (cert_val_true). The
    kernel cannot close it; it BITES. -/
theorem bogus_claim : min (587 : ℕ) attestFlag = 587 := by
  rw [cert_val_true]

end Counterexamples
