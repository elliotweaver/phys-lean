/-
  Counterexamples.GeneratedModuleCommCostume — N4 anti-vacuity / generating-relation
  costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE WITNESS for the N4 generating relations, in the precise wrong shape the
  task names: claiming that two DISTINCT imaginary basis units COMMUTE, contradicting
  the derived whole-basis ANTICOMMUTATION (`Phys/Algebra/GeneratedModule.lean`,
  `Lbasis_anticomm` / `ortho_anticomm_op`).

  The whole new content of N4(i) is that distinct orthonormal imaginary units
  ANTICOMMUTE: `eᵢ · eⱼ = − eⱼ · eᵢ` (the base fact that forces
  `Lop eᵢ * Lop eⱼ + Lop eⱼ * Lop eᵢ = 0` in the operator ring). Claiming the canonical
  distinct pair `ebasis 0`, `ebasis 1` COMMUTES — `ebasis 0 · ebasis 1 = ebasis 1 ·
  ebasis 0` — is FALSE on the terminal algebra `O ℚ`: the octonion product of two
  distinct orthogonal imaginary units is anticommutative, so componentwise the claim
  leaves the false core `1 = -1`. The manifest PASS_SIGNATURE matches that core.

  This guards the ANTICOMMUTATION generating relation (docs/RUNBOOK.md W8): if distinct
  basis units COMMUTED, the generated operator algebra would be commutative — the wrong
  (degenerate) structure, not the derived Clifford structure (`gen_noncomm` proves it is
  genuinely non-commutative). The kernel must REJECT it. (Distinct from C16, which
  guards the SQUARE sign `Lop e₂ ² = +1`; this guards the distinct-pair anticommutation,
  the relation N4 adds.)
-/
import Phys.Algebra.GeneratedModule
import Mathlib.Tactic

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra

namespace Counterexamples

attribute [local instance] CD.narCD CD.srCD

/-- WRONG (COMMUTING) GENERATING RELATION: that the distinct imaginary basis units
    `ebasis 0`, `ebasis 1` COMMUTE under the terminal-algebra product. The derived
    relation is ANTICOMMUTATION (`eᵢ · eⱼ = − eⱼ · eᵢ`, powering `Lbasis_anticomm`);
    commuting is false. Reducing componentwise on `O ℚ` leaves the false core `1 = -1`,
    so this must FAIL to elaborate. -/
theorem generated_module_comm_BOGUS :
    (ebasis 0 : O ℚ) * ebasis 1 = ebasis 1 * ebasis 0 := by
  ext <;>
    simp only [ebasis, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      CD.add_re, CD.add_im, CD.neg_re, CD.neg_im, CD.zero_re, CD.zero_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.add_re, Dbl.add_im,
      Dbl.neg_re, Dbl.neg_im, Dbl.zero_re, Dbl.zero_im,
      mul_zero, mul_one, zero_mul, one_mul, add_zero, zero_add, neg_zero, neg_neg]

end Counterexamples
