/-
  Counterexamples.GeneratedModuleCommCostume — N4 anti-vacuity / generating-relation
  costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE WITNESS for the N4 generating relations, in the precise wrong shape the
  task names: claiming that two DISTINCT imaginary basis units COMMUTE under
  left-multiplication, contradicting the derived whole-basis ANTICOMMUTATION
  (`Phys/Algebra/GeneratedModule.lean`, `Lbasis_anticomm` / `ortho_anticomm_op`).

  The whole content of N4(i) is that the imaginary basis-unit operators ANTICOMMUTE
  (`Lop eᵢ * Lop eⱼ + Lop eⱼ * Lop eᵢ = 0` for `i ≠ j`) — never COMMUTE. The two
  notions agree only when the product `Lop eᵢ * Lop eⱼ` vanishes, which it does not
  (the generated algebra is non-commutative, `gen_noncomm`). Claiming the canonical
  distinct pair `ebasis 0`, `ebasis 1` commutes at the operator level is FALSE.

  Applying the asserted operator identity at `1 : O ℚ` reduces (`(f*g) 1 = f (g 1)`,
  `Lop a y = a · y`, `· * 1 = id`) to `ebasis 0 · ebasis 1 = ebasis 1 · ebasis 0` in
  `O ℚ`; the octonionic product is anticommutative on distinct orthogonal imaginary
  units, so componentwise this leaves the false core `1 = -1`. The manifest
  PASS_SIGNATURE matches that core.

  This guards the ANTICOMMUTATION generating relation (docs/RUNBOOK.md W8): if the
  distinct basis units COMMUTED under `Lop`, the generated operator algebra would be
  commutative — the wrong (degenerate) structure, not the derived Clifford structure.
  The kernel must REJECT it.
-/
import Phys.Algebra.GeneratedModule
import Mathlib.Tactic

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra

namespace Counterexamples

attribute [local instance] CD.narCD CD.srCD

/-- WRONG (COMMUTING) GENERATING RELATION: that the distinct imaginary basis-unit
    operators `Lop (ebasis 0)`, `Lop (ebasis 1)` COMMUTE in `End (O ℚ)`. The derived
    relation is ANTICOMMUTATION (`Lbasis_anticomm`); commuting is false. Applying at
    `1` and reducing the octonion product leaves the false core `1 = -1`, so this must
    FAIL to elaborate. -/
theorem generated_module_comm_BOGUS :
    Lop (ebasis 0 : O ℚ) * Lop (ebasis 1 : O ℚ)
      = Lop (ebasis 1 : O ℚ) * Lop (ebasis 0 : O ℚ) := by
  have h1 : (ebasis 0 : O ℚ) * ((ebasis 1 : O ℚ) * 1)
      = (ebasis 1 : O ℚ) * ((ebasis 0 : O ℚ) * 1) := by
    rw [mul_one, mul_one]
    ext <;>
      simp only [ebasis, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
        CD.add_re, CD.add_im, CD.neg_re, CD.neg_im, CD.zero_re, CD.zero_im,
        Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.add_re, Dbl.add_im,
        Dbl.neg_re, Dbl.neg_im, Dbl.zero_re, Dbl.zero_im,
        mul_zero, mul_one, zero_mul, one_mul, add_zero, zero_add, neg_zero, neg_neg]
  exact AddMonoidHom.ext fun y => by
    show (ebasis 0 : O ℚ) * ((ebasis 1 : O ℚ) * y) = (ebasis 1 : O ℚ) * ((ebasis 0 : O ℚ) * y)
    sorry

end Counterexamples
