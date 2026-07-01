/-
  Counterexamples.TowerGatherCoherenceWrongValueCostume — N218T anti-vacuity (C250).
  ===========================================================================
  W8 ANTI-VACUITY. The N218T node banks THE GATHER ON THE TOWER: the rung-by-rung
  behaviour of INTER-WORLD gluing (the left regular representation `worldMap a = L_a`)
  across the derived Cayley-Dickson tower `Dbl Q -> H Q -> O Q -> S Q`. Its terminal
  clause is that even SELF-gluing FAILS at the sedenion rung `S Q` — the world of the
  banked zero-divisor standpoint `zdX` does NOT compose with itself into the world of
  its square (`s_world_not_self_glue`), because `S Q` has LOST left-alternativity.

  THE GENUINE VALUE. The self-gluing defect is witnessed at a single coordinate: for the
  banked `zdX` and the point `wY` (= e4 in flat coordinates),

      (zdX * (zdX * wY)).im.im.im.im  =  -2      (`s_self_glue_fail` below, TRUE),

  whereas the composed-square side `((zdX * zdX) * wY).im.im.im.im = 0`. The two disagree
  (`-2 /= 0`), so the world `zdX` does NOT self-glue: left-alternativity is genuinely lost
  at `S Q`. A naive "self-gluing always holds / the regular representation is always at
  least left-alternative" reading would predict these two coincide (defect 0) — it MISSES
  the sedenion loss. The genuine defect coordinate is -2, NOT 0.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the sedenion world self-glues / the
  gather coheres with itself at every rung / left-alternativity survives past the octonions):
  that this coordinate equals (217 : Q). Rewriting the banked witness shows the bogus claim
  reduces to the false numeric -2 = 217 in Q. The kernel cannot close it; the costume BITES
  (lean leaves the unsolved false goal, exit 1).

  The bite is name-independent: delete every comment and for the Cayley-Dickson double
  S Q = CD (O Q), the coordinate (zdX * (zdX * wY)).im.im.im.im equals -2, so claiming it is
  217 is genuinely FALSE (-2 /= 217).

  DISTINCT from the banked battery (... C248 = 216, C249 = 217): the pair (217, -2) is fresh
  (the value -2 distinct from every prior left-hand value).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherCoherence

namespace Counterexamples

open Phys.Algebra Phys.Cascade

/-- The self-glue-failure point in `S Q` (the same `wY` the node uses; `e4` in flat coords). -/
def wY : S ℚ := ⟨⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨1, 0⟩, ⟨0, 0⟩⟩⟩, ⟨⟨⟨0, 0⟩, ⟨0, 0⟩⟩, ⟨⟨0, 0⟩, ⟨0, 0⟩⟩⟩⟩

set_option maxHeartbeats 1000000 in
/-- TRUE: the sedenion self-gluing defect coordinate for the banked zero-divisor standpoint
    `zdX` is genuinely `-2` (nonzero — so `zdX` does NOT self-glue, left-alternativity lost). -/
theorem self_glue_defect_true :
    (zdX * (zdX * wY)).im.im.im.im = (-2 : ℚ) := by
  simp only [zdX, wY, CD.mul_re, CD.mul_im, Dbl.mul_re, Dbl.mul_im]
  norm_num

set_option maxHeartbeats 1000000 in
/-- BOGUS: claims the sedenion self-gluing defect coordinate is `217`. It GENUINELY equals
    `-2` (`self_glue_defect_true`). The WRONG claim (the sedenion world self-glues / the gather
    coheres with itself at every rung / left-alternativity survives past `O Q`) reduces —
    through the banked value — to the false numeric `-2 = 217`, so this must NOT compile. -/
theorem self_glue_defect_wrong_BOGUS :
    (zdX * (zdX * wY)).im.im.im.im = (217 : ℚ) := by
  rw [self_glue_defect_true]
  -- ⊢ (-2 : ℚ) = 217  (FALSE — the costume bites)

end Counterexamples
