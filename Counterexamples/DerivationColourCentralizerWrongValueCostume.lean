/-
  Counterexamples.DerivationColourCentralizerWrongValueCostume — N201 anti-vacuity (C233).
  ===========================================================================
  W8 ANTI-VACUITY. The N201 node banks a genuinely-NEW, genuinely-DIFFERENT physics joint:
  the COLOUR su(3) IS THE CENTRALIZER OF THE COLOUR COMPLEX STRUCTURE J = L_{u1} inside
  g₂ = Der(O Q). The operator centralizer {D in g₂ : D o JO = JO o D} of the colour complex
  structure equals the colour stabilizer stabLieQ (N42a) -- the symmetry preserving J is exactly
  the symmetry fixing its generator u1 -- and its dimension is exactly 8, the su(3) value (N42b),
  derived via the derivation-vs-left-multiplication law [D, L_{u1}] = L_{D u1}.

  THE GENUINE VALUE. The dimension of the colour centralizer
  (finrank_colourCentralizer_eq_eight, transported through colourCentralizer = stabLieQ from
  N42b's finrank_stabLieQ) is exactly 8. The centralizer is a PROPER, NONTRIVIAL subalgebra
  (colourCentralizer_ne_bot / colourCentralizer_ne_top): 0 < 8 < 14, so su(3) sits strictly
  inside g₂.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the colour complex structure is central in
  g₂ / every derivation commutes with J / the centralizer is the whole 14-dim algebra / su(3) =
  g₂ / the centralizer is trivial): that this dimension equals (201 : Nat). The banked value is
  exactly 8, so the claim reduces to the false numeric 201 = 8 in Nat. The kernel cannot close
  it; the costume BITES (lean leaves the unsolved false goal, exit 1).

  The bite is name-independent: delete "colour / su(3) / g₂ / complex structure / gauge" and for
  left-multiplication JO by the fixed square-root-of-(-1) u1 on the Cayley-Dickson double
  O Q = CD (H Q), the Leibniz-derivations commuting with JO form a subspace of dimension 8 inside
  the 14-dim derivation algebra -- so claiming 201 is genuinely FALSE (201 /= 8).

  DISTINCT from the banked battery (... C230 198 = 1, C231 199 = 0, C232 200 = -2): the pair
  (201, 8) is fresh (LHS 201 and RHS 8 both distinct from every recent pair).
-/
import Phys.Algebra.DerivationColourCentralizer

namespace Counterexamples

open Phys.Algebra

/-- TRUE: the dimension of the colour centralizer (the centralizer of the colour complex
    structure J = L_{u1} inside g₂) is exactly `8` -- the su(3) value. -/
theorem centralizer_dim_true :
    Module.finrank ℚ colourCentralizer.toSubmodule = 8 :=
  finrank_colourCentralizer_eq_eight

/-- BOGUS: claims the colour-centralizer dimension is `201`. It GENUINELY equals `8`
    (`centralizer_dim_true`). The WRONG claim (the colour complex structure is central in g₂ /
    every derivation commutes with J / su(3) = g₂ / the centralizer is the whole 14-dim algebra)
    reduces to the false numeric `201 = 8`, so this must NOT compile. -/
theorem centralizer_dim_wrong_BOGUS :
    (201 : ℕ) = Module.finrank ℚ colourCentralizer.toSubmodule := by
  rw [centralizer_dim_true]

end Counterexamples
