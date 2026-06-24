/-
  Counterexamples.DerivationWrongStructureConstantCostume — N21 costume (REJECTED).
  ===========================================================================
  THE GARBAGE WITNESS for the N21 g₂ structure constants: the commutator of the two
  banked derivations `D0E, D1E` has the PROVED structure constant
  `⁅D0E, D1E⁆ = (-2 : ℚ) • D2E` (`br_0_1`). The garbage claim: `⁅D0E, D1E⁆ = D2E`
  — i.e. structure constant `+1` instead of the true `-2`.

  This is the anti-vacuity teeth (docs/RUNBOOK.md W8) the ticket demands EXPLICITLY:
  a WRONG structure constant — claiming `⁅DiE,DjE⁆ = DkE` for a coefficient the
  coordinates refute — must FAIL to compile. Rewriting the bogus goal with the banked
  `br_0_1` reduces it to `(-2 : ℚ) • D2E = D2E`; evaluating at the basis unit `e3`
  (where `D2E` has the value `1` in the `c2`-coordinate) forces `-2 = 1` — at the
  `c2`-coordinate `(re.im.re)`, the BOGUS map sends `e3 ↦ 1` while `(-2)•D2E` sends
  `e3 ↦ -2`. `norm_num` refutes `(-2 : ℚ) = 1`. A node that proved the WRONG constant
  (or left the table free) would accept this; the kernel must REJECT it.

  The manifest's PASS_SIGNATURE matches the elaboration error below.
-/
import Phys.Algebra.DerivationStructureConstants

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- WRONG: claiming the structure constant `⁅D0E, D1E⁆ = D2E` (coefficient `+1`).
    False — the banked `br_0_1` proves the coefficient is `-2`. Rewriting with `br_0_1`
    reduces the goal to `(-2 : ℚ) • D2E = D2E`; coordinate extensionality leaves the
    symbolic identity `-2 * z.re.im.im = z.re.im.im`, which is NOT a ring identity and
    cannot close. Must FAIL. -/
theorem br_0_1_BOGUS_eq_D2E : ⁅D0E, D1E⁆ = D2E := by
  rw [br_0_1]
  ext z <;>
    simp only [LinearMap.smul_apply, D2E, c2, c3, c4, c5, LinearMap.coe_mk,
      AddHom.coe_mk, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

end Counterexamples
