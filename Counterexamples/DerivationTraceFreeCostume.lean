/-
  Counterexamples.DerivationTraceFreeCostume — N18 costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE WITNESS for the N18 trace-free law: every Leibniz-derivation of the
  terminal algebra `O ℚ` is TRACE-FREE — its output has zero real part
  (`reQ (D x) = 0`, `deriv_reQ_zero`: `D` maps `O` into the 7-dim imaginary
  subspace, the structural constraint refining `Der(O ℚ) ⊆ so(Born) = so(7)`).
  The garbage claim: the banked NONZERO derivation `witnessDeriv` (N6,
  `= innerDeriv e₂`) produces a UNIT real part `reQ (witnessDeriv (ι(ιJ))) = 1`
  instead of `0`.

  `witnessDeriv` is genuinely nonzero as an endomorphism (banked
  `witnessDeriv_ne_zero`), so it is a real derivation — but every derivation is
  trace-free (`witnessDeriv_reQ_zero`, the concrete instance of `deriv_reQ_zero`).
  So `reQ (witnessDeriv (ι(ιJ))) = 0`. After `rw [witnessDeriv_reQ_zero]` the claim
  reduces to the FALSE numeric core `0 = 1` over the cascade ground ring `ℚ`. The
  kernel must REJECT it.

  This is the anti-vacuity teeth (docs/RUNBOOK.md W8) on the trace-free refinement
  of the structural reduction the dimension count (= 14 = dim g₂) rests on: if the
  trace-freeness were vacuous (e.g. only the zero map satisfied it), the
  Im-preservation placing `Der(𝕆)` inside the orthogonal Lie algebra of the Born
  form would carry no content. It is not — a NONZERO derivation is trace-free.

  The manifest's PASS_SIGNATURE matches the elaboration error below.
-/
import Phys.Algebra.DerivationTraceFree

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-- WRONG: claiming the nonzero derivation `witnessDeriv` produces a unit real part
    `reQ (witnessDeriv (ι(ιJ))) = 1`. False — every derivation is trace-free
    (`witnessDeriv_reQ_zero`), so `reQ (witnessDeriv (ι(ιJ))) = 0`, forcing
    `0 = 1`. Must FAIL. -/
theorem witnessDeriv_trace_BOGUS :
    reQ (witnessDeriv (CD.iota (ιJ ℚ) : O ℚ)) = (1 : ℚ) := by
  rw [witnessDeriv_reQ_zero]

end Counterexamples
