/-
  MEASURE-FIRST probe 2 for N310 (seed T7): the LEPTON-EXACT side.
  The associative ℂ-line: cline a b := ocR a + ocR b * u1  (span of 1 and the fold-root unit).
  Measure:
   (B1) cline closure:  cline a b * cline c d = cline (a*c - b*d) (a*d + b*c)   [complex mult]
   (B2) associator VANISHES on the ℂ-line: assoc (cline ..) (cline ..) (cline ..) = 0
        -> leptons on the associative line: I₃ = 0, the 45° Koide balance is EXACT.
-/
import Phys.Algebra.Alternative
import Phys.Algebra.OctonionAssociative3Form
import Phys.Algebra.HermitianJordan.Helpers
import Phys.Algebra.OctonionJordanColourCentralizerCosetClosure
import Phys.Algebra.DerivationUpperBound
import Mathlib.Tactic

namespace N310Probe2

open Phys.Algebra Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-- The associative complex line spanned by `1` and the banked fold-root unit `u1`. -/
noncomputable def cline (a b : ℚ) : O ℚ := ocR a + ocR b * u1

/-- (B1) ℂ-LINE CLOSURE = complex multiplication. Uses banked ocR/u1 entry laws. -/
theorem cline_mul (a b c d : ℚ) :
    cline a b * cline c d = cline (a * c - b * d) (a * d + b * c) := by
  unfold cline
  -- (ocR a + ocR b·u1)(ocR c + ocR d·u1)
  rw [add_mul, mul_add, mul_add]
  rw [ocR_mul,                        -- ocR a * ocR c = ocR (a*c)
      ocR_u1_entry,                   -- ocR a * (ocR d * u1) = ocR (a*d) * u1
      u1_ocR_entry,                   -- (ocR b * u1) * ocR c = ocR (b*c) * u1
      u1_entry_prod]                  -- (ocR b * u1)*(ocR d * u1) = - ocR (b*d)
  -- expand RHS: ocR(a*c-b*d)=ocR(a*c)-ocR(b*d); ocR(a*d+b*c)*u1 splits via add_mul
  rw [ocR_sub, ← ocR_add (a * d) (b * c), add_mul]
  abel

/-- (B2) THE ASSOCIATOR VANISHES ON THE ℂ-LINE: three ℂ-line elements associate.
    Both bracketings reduce (via cline_mul) to the same ℂ-line element, so their
    difference — the associator — is zero. I₃ = 0 on the associative line. -/
theorem cline_assoc_zero (a₁ b₁ a₂ b₂ a₃ b₃ : ℚ) :
    Phys.Algebra.assoc (cline a₁ b₁) (cline a₂ b₂) (cline a₃ b₃) = 0 := by
  unfold Phys.Algebra.assoc
  rw [cline_mul, cline_mul, cline_mul, cline_mul]
  -- both sides are cline of equal ℚ pairs
  rw [show (a₁ * a₂ - b₁ * b₂) * a₃ - (a₁ * b₂ + b₁ * a₂) * b₃
        = a₁ * (a₂ * a₃ - b₂ * b₃) - b₁ * (a₂ * b₃ + b₂ * a₃) by ring,
      show (a₁ * a₂ - b₁ * b₂) * b₃ + (a₁ * b₂ + b₁ * a₂) * a₃
        = a₁ * (a₂ * b₃ + b₂ * a₃) + b₁ * (a₂ * a₃ - b₂ * b₃) by ring]
  rw [sub_self]

end N310Probe2
