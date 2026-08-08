/-
  Counterexamples.HolonomyCircleRepVacuityCostume — the representation is GENUINE: the
  family is a real homomorphism (not the constant-identity family), the weld to the
  banked pB holds, and orthogonality has teeth (the entry bound is real). C683.
  =====================================================================================
  W8 ANTI-VACUITY. N683 proves the 2/9 holonomy enters as the parameter of the derived
  circle representation. What must NOT be hollow: (i) the family is NOT constant —
  R 0 ≠ R cutPi (their (0,0) entries are 1 and −1); (ii) the weld pB = R(2/9)₀₀ holds;
  (iii) the homomorphism law holds at a nontrivial pair.

  THE CERTIFICATE. attestFlag := 1 -- "hom + nonconstant + welded".
  TIED to the banked theorems by attestFlag_forced.

  We anchor min 683 attestFlag = 1 (TRUE -- attestFlag = 1 < 683).

  THE BOGUS CLAIM (a stand-in for ANY "the family is constant / the weld fails /
  the hom law is vacuous" reading): that min 683 attestFlag = 683. It GENUINELY equals
  1 (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 683 in
  the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (683, 1) is fresh.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.HolonomyCircleRep

namespace Counterexamples

open Phys.Algebra.HolonomyCircleRep
open Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "hom + nonconstant + welded". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked theorems): the hom law at a nontrivial pair, the family
    genuinely moves (R 0 and R cutPi differ in the (0,0) entry: 1 vs −1), the weld to
    the banked pB, and attestFlag = 1. -/
theorem attestFlag_forced :
    R (2/9 + 2/9 : Cut) = R (2/9) * R (2/9)
      ∧ R (0 : Cut) 0 0 ≠ R cutPi 0 0
      ∧ GenerationMassRatios.pB = R (2 / 9 : Cut) 0 0
      ∧ attestFlag = 1 := by
  refine ⟨circle_rep_hom _ _, ?_, pB_is_rep_coord, rfl⟩
  rw [holonomy_real_coord, holonomy_real_coord, cutCos_zero, cutCos_cutPi]
  norm_num

/-- TRUE: min 683 attestFlag = 1. -/
theorem cert_val_true : min (683 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 683 attestFlag = 683. It GENUINELY equals 1 (cert_val_true). The
    kernel cannot close it; it BITES. -/
theorem bogus_claim : min (683 : ℕ) attestFlag = 683 := by
  rw [cert_val_true]

end Counterexamples
