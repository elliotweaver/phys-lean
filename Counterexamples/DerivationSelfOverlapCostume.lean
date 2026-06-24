/-
  Counterexamples.DerivationSelfOverlapCostume — N17 costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE WITNESS for the N17 structural-reduction law: a Leibniz-derivation of
  the terminal algebra `O ℚ` KILLS the Born self-overlap `u · star u`
  (`deriv_real_zero` applied to `selfMul_selfconj` — the coordinate-free heart of the
  containment `Der(O ℚ) ⊆ so(Born) = so(7)`). The garbage claim: the banked NONZERO
  derivation `witnessDeriv` (N6, `= innerDeriv e₂`) sends the self-overlap to `1`
  instead of `0`.

  `witnessDeriv` is genuinely nonzero as an endomorphism (banked `witnessDeriv_ne_zero`),
  so it is a real derivation — but the Born self-overlap `x · star x` is self-conjugate
  (`selfMul_selfconj`), and EVERY derivation annihilates every self-conjugate element
  (`deriv_real_zero`). So `witnessDeriv (u · star u) = 0`. After
  `rw [deriv_real_zero ...]` the claim reduces to the FALSE numeric core `0 = 1` over the
  cascade ground ring `ℚ`. The kernel must REJECT it.

  This is the anti-vacuity teeth (docs/RUNBOOK.md W8) on the structural reduction the
  dimension count (= 14 = dim g₂) rests on: if the skew-adjointness / self-overlap-kill
  were vacuous (e.g. only the zero map satisfied it), the containment in so(7) would carry
  no content. It is not — a NONZERO derivation kills the self-overlap, which is exactly the
  orthogonality placing `Der(𝕆)` inside the orthogonal Lie algebra of the Born form.

  The manifest's PASS_SIGNATURE matches the elaboration error below.
-/
import Phys.Algebra.DerivationSkew

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-- WRONG: claiming the nonzero derivation `witnessDeriv` sends the Born self-overlap
    `u · star u` to `1`. False — the self-overlap is self-conjugate (`selfMul_selfconj`)
    and every derivation kills every self-conjugate element (`deriv_real_zero`), so
    `witnessDeriv (u · star u) = 0`, forcing `0 = 1`. Must FAIL. -/
theorem witnessDeriv_selfoverlap_BOGUS :
    witnessDeriv (CD.iota (ιJ ℚ) * star (CD.iota (ιJ ℚ)) : O ℚ) = (1 : O ℚ) := by
  rw [deriv_real_zero witnessDeriv witnessDeriv_isDeriv _ (selfMul_selfconj _)]

end Counterexamples
