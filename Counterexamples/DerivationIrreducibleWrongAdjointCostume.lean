/-
  Counterexamples.DerivationIrreducibleWrongAdjointCostume — N26 costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE CLAIM for the N26 compact-embedding pin. N26 banks that the whole 14-dim
  derivation Lie algebra `derivationLieQ` lands in the SKEW-ADJOINT operators of the
  POSITIVE-DEFINITE Born self-overlap form `gBil` (`derivationLieQ_le_skewAdjoint`,
  `deriv_isSkewAdjoint_gBil`): every derivation `D` satisfies `g(D x, y) = - g(x, D y)`.
  This is the compact signature at the representation level — `g₂ ↪ so(7)` with `so(7)`
  the COMPACT (definite) orthogonal algebra. The anti-vacuity teeth: the algebra is
  faithful and nonzero (the banked `witnessDerivQ_ne_zero`), so the embedding is not
  "the zero algebra is trivially skew."

  THE GARBAGE CLAIM the kernel MUST reject (anti-vacuity, W8): that the nonzero witness
  derivation is SELF-ADJOINT (symmetric) for the Born form rather than SKEW — i.e.
  `g(w x, y) = g(x, w y)` for all `x, y` (the WRONG sign, a symmetric / non-compact
  reading). This is genuinely FALSE: `w` is a NONZERO skew operator of an ANISOTROPIC form,
  so it is not symmetric. The banked skew-adjointness gives `g(w x, y) + g(x, w y) = 0`;
  from that alone one CANNOT prove the symmetric equality `g(w x, y) = g(x, w y)` (it would
  require `g(x, w y) = 0` for all `x, y`, i.e. `w = 0`). So the proof below — discharging the
  bogus self-adjointness from the banked skew identity — leaves `linarith` unable to derive
  the equality `g(w x, y) = g(x, w y)` from `g(w x, y) + g(x, w y) = 0`, and the kernel
  rejects the file. A symmetric (self-adjoint) reading of the derivation action would
  destroy the compact-form `so(7)` embedding; W8 demands this bite.

  The manifest's PASS_SIGNATURE matches the elaboration error below.
-/
import Phys.Algebra.DerivationIrreducible

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- WRONG: claiming the nonzero witness derivation is SELF-ADJOINT (symmetric) for the
    Born form — `g(w x, y) = g(x, w y)`. The banked skew-adjointness gives the OPPOSITE
    sign, `g(w x, y) + g(x, w y) = 0`; `linarith` cannot prove the symmetric equality from
    the antisymmetric one (that would force the form to vanish, i.e. `w = 0`, contradicting
    `witnessDerivQ_ne_zero`). Must FAIL to compile. -/
theorem witness_selfAdjoint_BOGUS (x y : O ℚ) :
    gForm (witnessDerivQ x) y = gForm x (witnessDerivQ y) := by
  have hsk := gFormQ_skew witnessDerivQ witnessDerivQ_isDerivQ x y
  linarith [hsk]

end Counterexamples
