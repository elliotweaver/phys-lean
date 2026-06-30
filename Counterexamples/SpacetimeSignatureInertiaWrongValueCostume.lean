/-
  Counterexamples.SpacetimeSignatureInertiaWrongValueCostume — N198 anti-vacuity (C230).
  ===========================================================================
  W8 ANTI-VACUITY. The N198 node banks the genuinely-NEW inertia-invariance content: the
  Sylvester signature of the Born determinant form on the self-adjoint 2x2 matrices over the
  terminal algebra O Q = CD (H Q) is INVARIANTLY (1,9). N43 only EXHIBITED one (1,9) split;
  N198 proves the inertia is forced -- every subspace on which the form is positive-definite
  has finrank <= 1 (the UNIQUE time) and every subspace on which it is negative-definite has
  finrank <= 9, both bounds achieved by the banked N43 blocks.

  The positive (timelike) index is genuinely 1: the banked time line timeSub = <(1,0,0)> has
  finrank exactly 1 (finrank_timeSub, N43) AND no timelike subspace can exceed it
  (timelike_index_le_one) -- so the maximal timelike dimension, the positive inertia index, is
  exactly 1. The single time direction is FORCED, not a coordinate artifact of the chosen split.

  THE GENUINE VALUE. Module.finrank Q timeSub = 1 (time_index_true below, = finrank_timeSub).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: time is not unique / a higher-dimensional
  timelike subspace exists / the positive inertia index is larger than 1 / the (1,9) split is
  a coordinate artifact not the invariant signature): that this dimension equals (198 : Q-as-
  Nat). The banked value is exactly 1, so the claim reduces to the false numeric 198 = 1 in
  the naturals. The kernel cannot close it; the costume BITES (lean leaves the unsolved false
  goal, exit 1).

  The bite is name-independent: delete "time / space / Lorentzian / signature / Minkowski /
  timelike / spacelike / inertia" and for the Born quadratic form Qv on the 10-dim Q-space
  STV = Q x Q x O Q the maximal-positive-definite-subspace dimension equals 1 -- so claiming
  198 is genuinely FALSE (198 /= 1).

  DISTINCT from the banked battery (... C227 195 = -2, C228 196 = 1, C229 197 = -2): the pair
  (198, 1) is fresh (LHS 198 distinct from every prior left-hand value).
-/
import Phys.Algebra.SpacetimeSignatureInertia

namespace Counterexamples

open Phys.Algebra Phys.Cascade

/-- TRUE: the positive (timelike) inertia index -- the dimension of the maximal positive-definite
    subspace, achieved by the banked time line -- is `1`. The single time is forced. -/
theorem time_index_true : Module.finrank ℚ timeSub = 1 := finrank_timeSub

/-- BOGUS: claims this dimension is `198`. It GENUINELY equals `1` (`time_index_true`). The WRONG
    claim (time is not unique / a higher-dim timelike subspace exists / the positive index is
    larger / the (1,9) split is a non-invariant coordinate artifact) reduces to the false numeric
    `198 = 1`, so this must NOT compile. -/
theorem time_index_wrong_BOGUS : (198 : ℕ) = Module.finrank ℚ timeSub := by
  rw [time_index_true]

end Counterexamples
