/-
  Counterexamples.DerivationColourIsospinTraceFormWrongValueCostume — N204 anti-vacuity (C236).
  ===========================================================================
  W8 ANTI-VACUITY. The N204 node banks a genuinely-NEW, genuinely-DIFFERENT physics joint: the
  invariant trace form of g₂ = Der(O Q) takes the GRAM MATRIX -16 . I3 on the embedded weak-isospin
  triple DI, DJ, DK. The single non-mechanical datum is the explicit invariant LENGTH of the shared
  Cartan generator, traceForm_DI_DI : B DI DI = -16, where B = LieModule.traceForm Q derivationLieQ
  (O Q) is the banked negative-definite defining trace form (N24). Equinormalization and
  orthogonality of the triple propagate from this ONE value by the invariance identity. The value
  -16 is the metric embedding/normalization index, invisible to the scale-covariant structure
  constants.

  THE GENUINE VALUE. B DI DI = -16 (traceForm_DI_DI): the canonical invariant length the unique
  invariant form of the simple ambient g₂ assigns to the weak-isospin generator.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the trace form restricts trivially / the length
  is zero / null / the generator is not compact / the normalization is anything other than -16):
  that this length equals (204 : Q). Rewriting the banked value shows the bogus claim reduces to the
  false numeric 204 = -16 in Q. The kernel cannot close it; the costume BITES (lean leaves the
  unsolved false goal, exit 1).

  The bite is name-independent: delete "colour / isospin / su(2) / g₂ / Cartan / gauge / normalize /
  compact / Killing / trace form" and for the Cayley-Dickson double O Q = CD (H Q), the defining
  trace form of the inner-derivation Lie algebra takes value -16 on the inner derivation innerDeriv
  hI (= DI), so claiming the value is 204 is genuinely FALSE (204 /= -16).

  DISTINCT from the banked battery (... C233 201 = 8, C234 202 = 1, C235 203 = 2): the pair
  (204, -16) is fresh (LHS 204 and RHS -16 distinct from every recent pair).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.DerivationColourIsospinTraceForm

namespace Counterexamples

open Phys.Algebra Phys.Cascade

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE: the canonical invariant length of the weak-isospin Cartan generator inside g₂ is `-16`:
    `B DI DI = -16`. -/
theorem length_true :
    LieModule.traceForm ℚ derivationLieQ (O ℚ) DI DI = -16 := traceForm_DI_DI

/-- BOGUS: claims the invariant length is `204`. It GENUINELY equals `-16` (`length_true`).
    The WRONG claim (the trace form restricts trivially / the length is zero / null / the
    normalization is not `-16`) reduces — through the banked value — to the false numeric
    `204 = -16`, so this must NOT compile. -/
theorem length_wrong_BOGUS :
    LieModule.traceForm ℚ derivationLieQ (O ℚ) DI DI = (204 : ℚ) := by
  rw [length_true]
  -- ⊢ (-16 : ℚ) = 204  (FALSE — the costume bites)

end Counterexamples
