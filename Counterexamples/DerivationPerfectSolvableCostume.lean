/-
  Counterexamples.DerivationPerfectSolvableCostume — N23 costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE CLAIM for the N23 perfectness / non-solvability result. N23 banks that
  the 14-dim derivation Lie algebra `derivationLieQ` is PERFECT (`⁅⊤,⊤⁆ = ⊤`,
  `derivationLieQ_perfect`) and hence NOT solvable (`derivationLieQ_not_solvable`) and
  NOT abelian (`derivationLieQ_not_lieAbelian`). The structural engine is the banked
  91-pair bracket table: a NONZERO generator bracket exists, e.g.
  `⁅bL 0, bL 1⁆ = -2 • bL 2` (banked `cert2`/`br_0_1`) with `bL 2 ≠ 0`.

  THE GARBAGE CLAIM the kernel MUST reject (anti-vacuity, W8): that the algebra is
  ABELIAN — i.e. that generator bracket VANISHES, `⁅bL 0, bL 1⁆ = 0`. This is the
  hypothesis a "solvable / non-perfect derivation algebra" would need. It is FALSE:
  the banked `cert2` proves `⁅bL 0, bL 1⁆ = -2 • bL 2`, and `bL 2 ≠ 0` (a basis
  vector), so `-2 • bL 2 ≠ 0`. The proof rewrites the claimed-zero bracket by `cert2`
  and is left with the false numeric core `(-2 : ℚ) • bL 2 = 0`, forcing
  `(2 : ℚ) = 0` after killing the nonzero basis vector — which the kernel cannot
  close. An abelian (hence solvable) reading of `derivationLieQ` would erase the
  entire g₂ bracket structure; W8 demands this bite.

  The manifest's PASS_SIGNATURE matches the elaboration error below.
-/
import Phys.Algebra.DerivationPerfect

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- WRONG: claiming the generator bracket `⁅bL 0, bL 1⁆` vanishes — i.e. the
    derivation Lie algebra is abelian (hence solvable, hence NOT perfect). False:
    `cert2` proves `⁅bL 0, bL 1⁆ = -2 • bL 2` with `bL 2 ≠ 0`. Rewriting by `cert2`
    leaves the false core `(-2 : ℚ) • bL 2 = 0`; the nonzero basis vector forces
    `(2 : ℚ) = 0`, which the kernel cannot close. Must FAIL. -/
theorem derivationLieQ_abelian_BOGUS : ⁅bL 0, bL 1⁆ = (0 : derivationLieQ) := by
  rw [cert2]
  norm_num

end Counterexamples
