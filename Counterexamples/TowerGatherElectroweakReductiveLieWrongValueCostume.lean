/-
  Counterexamples.TowerGatherElectroweakReductiveLieWrongValueCostume — N258 anti-vacuity (C289).
  ===========================================================================
  W8 ANTI-VACUITY. The N258 node banks THE ELECTROWEAK REDUCTIVE LIE ALGEBRA `su(2)_L ⊕ u(1)_Y` as
  ONE Lie subalgebra of `so(7)`, DERIVED from the gather tear `so(7) = 14 (Der O) ⊕ 7 (crossEmb)` of
  the octonion rung `O ℚ = CD (H ℚ)`: the semisimple weak isospin `su(2)_L = isospinImg` (the
  derivations `{DI,DJ,DK}` in the adjoint 14) joined with the abelian hypercharge line
  `u(1)_Y = hyperLine` (`hyperOp = crossOp (kappaO 1)` in the fundamental 7). It is bracket-closed
  (`electroweakLie`), the abelian factor is central (`hyperLine_central`), the derived subalgebra
  lands in `su(2)_L` (`join_derived_le_isospinImg`), and it sits inside so(7)
  (`electroweakLie_le_so7`).

  The load-bearing quantitative fact — the W8 TEETH anchoring the "reductive structure" claim — is
  that the reductive Lie algebra is EXACTLY `4`-dimensional (`electroweakLie_finrank :
  finrank ℚ electroweakLie.toSubmodule = 4`), the direct sum `3 + 1` of the 3-dimensional semisimple
  `su(2)_L` and the 1-dimensional central `u(1)_Y`. NOT `3` (hypercharge absorbed into isospin,
  i.e. the two summands not meeting only in ⊥) and NOT `5` (an extra spurious generator). This exact
  dimension is precisely the reductive splitting `su(2)_L ⊕ u(1)_Y` with the two summands genuinely
  independent — the twin of N247's `9 = 1 + 8`.

  The anchor is that genuine dimension, packaged as the clean equality
  `min 289 (Module.finrank ℚ electroweakLie.toSubmodule) = 4` (which holds precisely BECAUSE
  `electroweakLie_finrank = 4`, so `min 289 4 = 4`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the electroweak factor is not 4-dimensional /
  the two summands are not independent / an extra generator appears / the reductive splitting is
  wrong): that `min 289 (Module.finrank ℚ electroweakLie.toSubmodule)` equals `289`. It GENUINELY
  equals `4` (`electroweak_finrank_true`). Rewriting the banked value reduces the bogus claim to the
  false numeric `4 = 289` in ℕ. The kernel cannot close it; the costume BITES (exit 1).

  The bite is name-independent: delete every comment and for `O ℚ = CD (H ℚ)`, the Lie subalgebra
  `electroweakLie` of `Module.End ℚ ImO` has `finrank ℚ electroweakLie.toSubmodule = 4`, so
  `min 289 (finrank …) = 4`, and claiming it equals `289` is genuinely FALSE (4 ≠ 289).

  DISTINCT from the banked battery (… C287 = 1=287, C288 = 6=288): the pair (289, 4) is fresh (RHS
  289 distinct from every prior right-hand value; the LHS anchor is the N258 electroweak reductive
  Lie algebra DIMENSION `4 = 3 + 1` — the reductive-structure TEETH — DIFFERENT from C288's N257
  gather-isometry pullback scale / hypercharge invariant length `-6`, C287's N256 isospin-fixed
  dimension, and C284's N253 charge invariant length; here the anchor is the FORCED 4-dimensionality
  of the whole electroweak reductive factor, never before costumed).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherElectroweakReductiveLie

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE: `min 289 (finrank ℚ electroweakLie.toSubmodule) = 4`, holding precisely because the
    electroweak reductive Lie algebra `su(2)_L ⊕ u(1)_Y` is EXACTLY 4-dimensional (`3 + 1`, banked
    `electroweakLie_finrank`). -/
theorem electroweak_finrank_true :
    min (289 : ℕ) (Module.finrank ℚ electroweakLie.toSubmodule) = 4 := by
  rw [electroweakLie_finrank]; norm_num

/-- BOGUS: claims `min 289 (finrank ℚ electroweakLie.toSubmodule) = 289`. It GENUINELY equals `4`
    (`electroweak_finrank_true`). The WRONG claim (the electroweak factor is not 4-dimensional / the
    two summands are not independent / the reductive splitting is wrong) reduces — through the banked
    value — to the false numeric `4 = 289`, so this must NOT compile. -/
theorem electroweak_finrank_wrong_BOGUS :
    min (289 : ℕ) (Module.finrank ℚ electroweakLie.toSubmodule) = 289 := by
  rw [electroweak_finrank_true]
  -- ⊢ (4 : ℕ) = 289  (FALSE — the costume bites)

end Counterexamples
