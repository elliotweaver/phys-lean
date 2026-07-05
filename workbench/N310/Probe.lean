/-
  MEASURE-FIRST probe for N310 (seed T7): the quark associator deviation / separation.
  Goal: measure whether the two NEW lemmas are ℚ-exact LIGHT (structural rewriting on the
  banked octonion associator `assoc` + banked central line `ocR`/`u1`), NOT a coordinate bash.

    (A) central-scaling HOMOGENEITY of the banked associator:
          Phys.Algebra.assoc (ocR a * u)(ocR b * v)(ocR c * w) = ocR (a*b*c) * assoc u v w
        -> the amplitude scalar factors OUT: vanishing of assoc is a DIRECTION-only property,
           independent of the amplitude magnitudes. This is the separation mechanism.

    (B) the ASSOCIATIVE ℂ-line (leptons): cline a b := ocR a + ocR b * u1 is closed under
        multiplication (cline_mul) and ASSOCIATES, so its triple associator VANISHES (I₃=0).

    (C) the Fano line (quarks): banked assoc_nonvanishing gives I₃ ≠ 0  -- reuse, no new work.
-/
import Phys.Algebra.Alternative
import Phys.Algebra.OctonionJordanGenerationMassRatios
import Phys.Algebra.HermitianJordan.Helpers
import Phys.Algebra.DerivationUpperBound
import Mathlib.Tactic

namespace N310Probe

open Phys.Algebra Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-! banked ℂ-line arithmetic we will use:
    ocR_mul  : ocR r * ocR s = ocR (r*s)
    ocR_comm : ocR r * x = x * ocR r
    ocR_assocL/M/R : central reassociation
    complexUnit_sq : u1 * u1 = -1
    u1_entry_prod : (ocR p * u1)*(ocR q * u1) = - ocR (p*q)
    u1_ocR_entry  : (ocR p * u1) * ocR q = ocR (p*q) * u1
    ocR_u1_entry  : ocR p * (ocR q * u1) = ocR (p*q) * u1
-/

/-- The scaled product pulls the central scalars out: `(ocR a·u)(ocR b·v) = ocR(a·b)·(u·v)`. -/
theorem scaled_mul (a b : ℚ) (u v : O ℚ) :
    (ocR a * u) * (ocR b * v) = ocR (a * b) * (u * v) := by
  rw [← ocR_assocL, ocR_assocM, ← ocR_comm b u, ← ocR_assocL, ocR_assocL, ocR_mul]

/-- (A) CENTRAL-SCALING HOMOGENEITY of the banked associator. -/
theorem assoc_central_homogeneous (a b c : ℚ) (u v w : O ℚ) :
    Phys.Algebra.assoc (ocR a * u) (ocR b * v) (ocR c * w) = ocR (a * b * c) * Phys.Algebra.assoc u v w := by
  unfold Phys.Algebra.assoc
  rw [scaled_mul, scaled_mul, scaled_mul, scaled_mul,
      show a * b * c = a * b * c from rfl,
      show a * (b * c) = a * b * c by ring]
  rw [mul_sub]

end N310Probe
