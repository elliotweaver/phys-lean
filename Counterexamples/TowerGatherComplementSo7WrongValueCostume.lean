/-
  Counterexamples.TowerGatherComplementSo7WrongValueCostume — N225 anti-vacuity (C257).
  ===========================================================================
  W8 ANTI-VACUITY. The N225 node banks the EXPLICIT g2-MODULE COMPLEMENT
  `so(7) = imRep(g2) (+) crossEmb(7)`: over the banked octonion rung `O Q` with the banked
  fundamental 7-module `ImO` (N22) and the Born form `bornBil` on it, the adjoint g2 (`range imRep`,
  dim 14) and the fundamental 7 (`range crossEmb`, dim 7) meet trivially, span so(7), and account
  for its FULL DIMENSION:

      finrank Q (bornBil).skewAdjointSubmodule = 21   (`finrank_so7_eq_21`, TRUE),

  the `21 = 14 + 7` dimension of so(7), forced by the trivial intersection (banked simplicity
  `derivationLieQ_isSimpleOrder` N28) filling the `<= C(7,2) = 21`-dim skew-adjoint algebra
  (banked `finrank_skewAdjoint_le_choose` N28).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: so(7) has some dimension other than 21 / the
  complement does not span / the summands overlap / the 14 and 7 do not sum to the full so(7)):
  that this dimension equals (257 : N). Rewriting the banked value shows the bogus claim reduces to
  the false numeric `21 = 257` in N. The kernel cannot close it; the costume BITES (lean leaves the
  unsolved false goal, exit 1).

  The bite is name-independent: delete every comment and for the octonion shape O Q = CD (H Q),
  the dimension `finrank Q (bornBil).skewAdjointSubmodule` is genuinely 21 (banked
  `finrank_so7_eq_21`), so claiming it is 257 is genuinely FALSE (21 /= 257).

  DISTINCT from the banked battery (... C255 = 0=255, C256 = 7=256): the pair (257, 21) is fresh
  (RHS 257 distinct from every prior right-hand value).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherObstructionComplementSo7

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE: so(7) has dimension exactly 21 = 14 + 7 (the banked `finrank_so7_eq_21`). The adjoint 14
    and the fundamental 7 span it and meet trivially. -/
theorem so7_dim_true :
    Module.finrank ℚ (bornBil).skewAdjointSubmodule = 21 :=
  Phys.Algebra.finrank_so7_eq_21

/-- BOGUS: claims so(7) has dimension `257`. It GENUINELY equals `21` (`so7_dim_true`). The WRONG
    claim (the complement does not fill so(7) / the summands overlap / the dimension is not 14 + 7)
    reduces — through the banked value — to the false numeric `21 = 257`, so this must NOT
    compile. -/
theorem so7_dim_wrong_BOGUS :
    Module.finrank ℚ (bornBil).skewAdjointSubmodule = 257 := by
  rw [so7_dim_true]
  -- ⊢ (21 : ℕ) = 257  (FALSE — the costume bites)

end Counterexamples
