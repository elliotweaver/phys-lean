/-
  Counterexamples.TowerGatherObstructionWrongValueCostume — N219 anti-vacuity (C251).
  ===========================================================================
  W8 ANTI-VACUITY. The N219 node banks THE EXPLICIT GLUING-OBSTRUCTION COCYCLE: the
  obstruction to two worlds gluing is the explicit map `gluingDefect a b : x ↦
  (a·b)·x − a·(b·x)`, which on the octonion rung `O Q` IS the banked associator
  `[a,b,·]`. A KEY clause is that this obstruction is ALTERNATING on `O Q`: its
  DIAGONAL vanishes, `gluingDefect a a = 0` (`o_gluingDefect_self`, via the banked
  left-alternative law `alt_left`), so a world still SELF-glues at the octonion rung.

  THE GENUINE VALUE. The diagonal (self-)obstruction is the associator `[a,a,·]`,
  which vanishes by left-alternativity. In particular, at the cascade's own triple,
  its `im.im.im` coordinate is genuinely 0:

      (assoc (ι(ιJ)) (ι(ιJ)) e2).im.im.im  =  0     (`self_obstr_coord_true`, TRUE),

  because `assoc a a x = 0` (`alt_left`). A naive "the octonion self-obstruction is
  nonzero / a world does NOT self-glue at O Q / the associator does not alternate"
  reading would predict a nonzero coordinate — it MISSES left-alternativity. The
  genuine self-obstruction coordinate is 0, NOT nonzero.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the octonion self-obstruction is
  nonzero / `O Q` self-gluing fails / the associator does NOT alternate at `O Q` / the
  gather loses self-coherence one rung too early): that this coordinate equals
  (251 : Q). Rewriting the banked witness shows the bogus claim reduces to the false
  numeric 0 = 251 in Q. The kernel cannot close it; the costume BITES (lean leaves the
  unsolved false goal, exit 1).

  The bite is name-independent: delete every comment and for the octonion shape
  O Q = CD (H Q), the diagonal associator coordinate (assoc a a e2).im.im.im equals 0
  (left-alternativity), so claiming it is 251 is genuinely FALSE (0 /= 251).

  DISTINCT from the banked battery (... C249 = 217, C250 = 2=217): the pair (251, 0) is
  fresh (LHS 251 distinct from every prior left-hand value).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherObstruction

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-- TRUE: the octonion diagonal (self-)obstruction coordinate is genuinely `0` — a world
    self-glues at `O Q` because the associator alternates (`alt_left`: `[a,a,·] = 0`). -/
theorem self_obstr_coord_true :
    (Phys.Algebra.assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (ιJ ℚ) : O ℚ) (CD.e2 : O ℚ)).im.im.im
      = (0 : ℚ) := by
  rw [Phys.Algebra.alt_left]
  simp only [CD.zero_im, Dbl.zero_im]

/-- BOGUS: claims the octonion self-obstruction coordinate is `251`. It GENUINELY equals
    `0` (`self_obstr_coord_true`). The WRONG claim (the octonion self-obstruction is nonzero
    / `O Q` self-gluing fails / the associator does not alternate) reduces — through the
    banked value — to the false numeric `0 = 251`, so this must NOT compile. -/
theorem self_obstr_coord_wrong_BOGUS :
    (Phys.Algebra.assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (ιJ ℚ) : O ℚ) (CD.e2 : O ℚ)).im.im.im
      = (251 : ℚ) := by
  rw [self_obstr_coord_true]
  -- ⊢ (0 : ℚ) = 251  (FALSE — the costume bites)

end Counterexamples
