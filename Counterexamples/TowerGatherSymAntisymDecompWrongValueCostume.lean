/-
  Counterexamples.TowerGatherSymAntisymDecompWrongValueCostume — N227 anti-vacuity (C259).
  ===========================================================================
  W8 ANTI-VACUITY. The N227 node banks the SYMMETRIC / ANTISYMMETRIC SPLIT of `7 ⊗ 7`:
  over the banked octonion rung `O Q` with the banked fundamental 7-module `ImO` (N22) and the Born
  form `bornBil` (N223/N225), the transpose involution `bAdj` of the nondegenerate symmetric
  `bornBil` splits `End Q ImO = Sym²7 (+) Λ²7`, where `Λ²7 = so(7)` is the banked 21 (N225) and the
  SYMMETRIC complement `Sym²7` is 28-dimensional (`49 − 21`):

      finrank Q (bornBil.selfAdjointSubmodule) = 28   (`finrank_selfAdj_eq_28`, TRUE),

  the symmetric side is neither the zero submodule nor a degenerate collapse — it is genuinely the
  28-dimensional self-adjoint half (`Module.finrank_add_eq_of_isCompl` + banked `finrank_so7_eq_21`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the symmetric side collapses / is not the
  self-adjoint complement of so(7) / has some dimension other than 49−21): that this dimension
  equals (259 : N). Rewriting the banked value shows the bogus claim reduces to the false numeric
  `28 = 259` in N. The kernel cannot close it; the costume BITES (lean leaves the unsolved false
  goal, exit 1).

  The bite is name-independent: delete every comment and for the octonion shape O Q = CD (H Q), the
  dimension `finrank Q (bornBil.selfAdjointSubmodule)` is genuinely 28 (banked
  `finrank_selfAdj_eq_28`), so claiming it is 259 is genuinely FALSE (28 /= 259).

  DISTINCT from the banked battery (... C257 = 21=257, C258 = 7=258): the pair (259, 28) is fresh
  (RHS 259 distinct from every prior right-hand value).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherSymAntisymDecomp

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE: the symmetric side is the full 28-dimensional self-adjoint complement of `so(7)` (the
    banked `finrank_selfAdj_eq_28`). -/
theorem selfAdj_dim_true :
    Module.finrank ℚ (bornBil).selfAdjointSubmodule = 28 :=
  Phys.Algebra.finrank_selfAdj_eq_28

/-- BOGUS: claims the symmetric side has dimension `259`. It GENUINELY equals `28` (`selfAdj_dim_true`).
    The WRONG claim (the symmetric side collapses / is not the 49−21 complement of so(7)) reduces —
    through the banked value — to the false numeric `28 = 259`, so this must NOT compile. -/
theorem selfAdj_dim_wrong_BOGUS :
    Module.finrank ℚ (bornBil).selfAdjointSubmodule = 259 := by
  rw [selfAdj_dim_true]
  -- ⊢ (28 : ℕ) = 259  (FALSE — the costume bites)

end Counterexamples
