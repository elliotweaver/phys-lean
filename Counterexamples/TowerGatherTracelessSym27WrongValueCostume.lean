/-
  Counterexamples.TowerGatherTracelessSym27WrongValueCostume — N228 anti-vacuity (C260).
  ===========================================================================
  W8 ANTI-VACUITY. The N228 node banks the FINER SPLIT of the symmetric `28`:
  over the banked octonion rung `O Q` with the banked fundamental 7-module `ImO` (N22), the Born
  form `bornBil` (N223/N225) and its self-adjoint (symmetric `Sym²7`) side (N227), the trivial rep
  line `ℚ·1` and the traceless-symmetric intersection `selfAdj ⊓ ker(trace)` split it as
  `Sym²7 = 1 ⊕ 27`, where the traceless-symmetric side is 27-dimensional (`28 − 1`):

      finrank Q (tracelessSym) = 27   (`finrank_tracelessSym_eq_27`, TRUE),

  the traceless-symmetric side is neither the zero submodule nor a degenerate collapse — it is
  genuinely the 27-dimensional complement of the trivial line inside the 28 (`finrank_sup_add_
  finrank_inf_eq` + banked `finrank_selfAdj_eq_28`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the traceless side collapses / equals the whole
  28 / has some dimension other than 28−1): that this dimension equals (260 : N). Rewriting the
  banked value shows the bogus claim reduces to the false numeric `27 = 260` in N. The kernel cannot
  close it; the costume BITES (lean leaves the unsolved false goal, exit 1).

  The bite is name-independent: delete every comment and for the octonion shape O Q = CD (H Q), the
  dimension `finrank Q (tracelessSym)` is genuinely 27 (banked `finrank_tracelessSym_eq_27`), so
  claiming it is 260 is genuinely FALSE (27 /= 260).

  DISTINCT from the banked battery (... C258 = 7=258, C259 = 28=259): the pair (260, 27) is fresh
  (RHS 260 distinct from every prior right-hand value).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherTracelessSym27

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE: the traceless-symmetric side is the full 27-dimensional complement of the trivial line
    inside the symmetric 28 (the banked `finrank_tracelessSym_eq_27`). -/
theorem tracelessSym_dim_true :
    Module.finrank ℚ tracelessSym = 27 :=
  Phys.Algebra.finrank_tracelessSym_eq_27

/-- BOGUS: claims the traceless-symmetric side has dimension `260`. It GENUINELY equals `27`
    (`tracelessSym_dim_true`). The WRONG claim (the traceless side collapses / is not the 28−1
    complement of the trivial rep) reduces — through the banked value — to the false numeric
    `27 = 260`, so this must NOT compile. -/
theorem tracelessSym_dim_wrong_BOGUS :
    Module.finrank ℚ tracelessSym = 260 := by
  rw [tracelessSym_dim_true]
  -- ⊢ (27 : ℕ) = 260  (FALSE — the costume bites)

end Counterexamples
