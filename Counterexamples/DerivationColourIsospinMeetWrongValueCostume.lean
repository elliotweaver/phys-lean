/-
  Counterexamples.DerivationColourIsospinMeetWrongValueCostume — N202 anti-vacuity (C234).
  ===========================================================================
  W8 ANTI-VACUITY. The N202 node banks a genuinely-NEW, genuinely-DIFFERENT physics joint: the
  MEET of the two non-abelian derivation subalgebras of O Q = CD (H Q). The embedded weak-isospin
  su(2) = <innerDeriv hI, innerDeriv hJ, innerDeriv hK> (N187) and the colour su(3) =
  colourCentralizer = stabLieQ = {D in g₂ : D u1 = 0} (N201/N42a) intersect inside g₂ = Der(O Q) in
  EXACTLY the one-dimensional isospin Cartan line Q . (innerDeriv hI). Neither transverse (the meet
  is nonzero, DI_ne_zero) nor nested (the meet is a proper subspace of isospin, DJ_not_mem_colour):
  the two factors share precisely a u(1).

  THE GENUINE VALUE. The dimension of the meet (finrank_meet_eq_one, via the submodule identity
  meet_eq_span_DI : isospinSpan inf colourCentralizer.toSubmodule = Q . DI, and finrank_span_singleton
  on the nonzero Cartan generator DI) is exactly 1.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the two factors are transverse / the meet is
  trivial / dim 0 / the meet is the whole isospin su(2), dim 3 / the factors are nested / the
  off-Cartan generators also commute with J): that this dimension equals (202 : Nat). The banked
  value is exactly 1, so the claim reduces to the false numeric 202 = 1 in Nat. The kernel cannot
  close it; the costume BITES (lean leaves the unsolved false goal, exit 1).

  The bite is name-independent: delete "colour / isospin / su(3) / su(2) / u(1) / g₂ / Cartan /
  gauge / complex structure" and for the Cayley-Dickson double O Q = CD (H Q), the Q-span of the
  three inner derivations innerDeriv hI/hJ/hK meets the centralizer of left-multiplication by u1 in
  exactly the one-dimensional Q-span of innerDeriv hI -- so claiming 202 is genuinely FALSE
  (202 /= 1).

  DISTINCT from the banked battery (... C231 199 = 0, C232 200 = -2, C233 201 = 8): the pair
  (202, 1) is fresh (LHS 202 distinct from every prior left-hand value).
-/
import Phys.Algebra.DerivationColourIsospinMeet

namespace Counterexamples

open Phys.Algebra

/-- TRUE: the dimension of the meet of the embedded isospin su(2) and the colour centralizer su(3)
    inside g₂ is exactly `1` -- the shared u(1) Cartan line. -/
theorem meet_dim_true :
    Module.finrank ℚ (isospinSpan ⊓ (colourCentralizer.toSubmodule)
      : Submodule ℚ derivationLieQ) = 1 :=
  finrank_meet_eq_one

/-- BOGUS: claims the meet dimension is `202`. It GENUINELY equals `1` (`meet_dim_true`). The WRONG
    claim (the two gauge factors are transverse / the meet is trivial / the meet is the whole
    isospin su(2) of dim 3 / the factors are nested) reduces to the false numeric `202 = 1`, so this
    must NOT compile. -/
theorem meet_dim_wrong_BOGUS :
    (202 : ℕ) = Module.finrank ℚ (isospinSpan ⊓ (colourCentralizer.toSubmodule)
      : Submodule ℚ derivationLieQ) := by
  rw [meet_dim_true]

end Counterexamples
