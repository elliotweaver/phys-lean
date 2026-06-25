/-
  Counterexamples.DerivationAutOpNormMultiplicativeCostume — N38 costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE CLAIM for the N38 OPERATOR-NORM rung over the DERIVED ℝ `ContinuumQ.Cut`.
  N38 (part b) banks the Cut-valued operator norm `opNorm M = ∑ᵢⱼ |Mᵢⱼ|` on the 8×8 coordinate
  matrices over the derived ℝ, with `opNorm_mul_le` proving it is SUBMULTIPLICATIVE
  (`opNorm (M * N) ≤ opNorm M * opNorm N`) — an INEQUALITY, NOT an equality — and `opNorm_one`
  proving `opNorm 1 = 8` (the 8 diagonal ones). Submultiplicativity (not multiplicativity) is the
  load-bearing property the exponential-series convergence rests on.

  THE GARBAGE CLAIM the kernel MUST reject (anti-vacuity, W8): that the operator norm is
  MULTIPLICATIVE on the identity — `opNorm (1 * 1) = 64`, where `64 = opNorm 1 * opNorm 1 = 8 * 8`
  is the value multiplicativity would force. The banked `opNorm_one` (= 8) and `mul_one` reduce the
  left side to `8`, so the bogus claim collapses to `8 = 64`, which cannot be discharged. This is
  exactly the STRICT sub-multiplicativity on the identity (`opNorm (1*1) = 8 < 64 = opNorm 1 * opNorm
  1`): the norm is genuinely submultiplicative (`opNorm_mul_le`), NOT multiplicative, and if the value
  of `opNorm 1` were wrong this would not reduce to the false numeric `8 = 64`.

  This costume DIRECTLY exercises the NEW N38 content: it uses `opNorm_one` (the banked identity
  value) on the matrix algebra over the derived ℝ; deleting the N38 operator-norm file removes the
  `opNorm`/`opNorm_one` the costume's rewrite resolves against. The manifest's PASS_SIGNATURE matches
  the elaboration error below (`⊢ 8 = 64`).
-/
import Phys.Algebra.DerivationAutOpNorm

namespace Counterexamples

open Phys.Algebra Phys.Foundation.ContinuumQ

noncomputable section

/-- WRONG: claiming the Cut-valued operator norm is MULTIPLICATIVE on the identity, with the
    multiplicative value `64 = 8 * 8` pre-computed. `mul_one` collapses `1 * 1` to `1`, `opNorm_one`
    (N38) evaluates the left side to `8`, and the claim reduces to `(8 : Cut) = 64`. The true
    submultiplicative value is `8 < 64`. Must FAIL to compile. -/
theorem opNorm_multiplicative_BOGUS :
    opNorm ((1 : Matrix (Fin 8) (Fin 8) Cut) * 1) = 64 := by
  rw [mul_one, opNorm_one]

end

end Counterexamples
