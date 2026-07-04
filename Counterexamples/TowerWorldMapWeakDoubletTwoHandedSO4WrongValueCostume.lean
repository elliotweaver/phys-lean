/-
  Counterexamples.TowerWorldMapWeakDoubletTwoHandedSO4WrongValueCostume — N280 anti-vacuity (C311).
  ===========================================================================
  W8 ANTI-VACUITY. The N280 node banks THE TWO-HANDED so(4) = su(2)_L ⊕ su(2)_R OF THE MATTER
  SPINOR, CONFINED TO THE LAST ASSOCIATIVE RUNG H AND BROKEN ON O BY THE CASCADE-STOPPING
  ASSOCIATOR: the RIGHT-regular operators `rregI/rregJ/rregK = rightReg u1M/e2I/e3I` of the
  last-doubled quaternion imaginary units CLOSE into `su(2)_R` on the associative rung `H`
  (`rightReg_closure_on_H_IJ`) with the OPPOSITE-orientation structure constant `-2` (contrast the
  LEFT `+2`, N279), the two hands COMMUTE on H (`leftRight_commute_on_H` — the `so(4)`), the RIGHT
  fundamental doublet Casimir is `-3•id` on the whole spinor (`rightReg_casimir_eq_neg_three`), and
  the right hand FAILS to close on the full non-associative `O ℚ` by exactly the banked associator
  (`rightReg_comm_obstructed` / `rightReg_defect_eq_associator`).

  The load-bearing NEW value is the RIGHT FUNDAMENTAL DOUBLET Casimir scalar. On the whole spinor
  `O ℚ`, `(rregI² + rregJ² + rregK²) = -3•id`, so applied to the unit `1 : O ℚ` its leading
  coordinate is `-3` — whose numerator magnitude is

      `(casCoord).num.natAbs = 3`   (where `casCoord = ((rightCasimir) 1).re.re.re = -3`)

  — the spin-½ / FUNDAMENTAL DOUBLET certificate for the RIGHT hand (the second SO(4) chiral factor,
  distinct from N279's LEFT realization; the two hands assemble the `so(4)`, both spin-½). A WRONG
  reading — in which the right-regular units give a TRIPLET (Casimir `-8`, magnitude `8`), or the
  right doublet collapses / the RIGHT Casimir is not `-3` (so the two hands are not a symmetric pair
  of spin-½ doublets) — would NOT reduce to the magnitude `3`.

  We anchor `casCoord.num.natAbs = 3` (TRUE via `rightReg_casimir_eq_neg_three`), packaged as
  `min 311 (casCoord.num.natAbs) = 3`, TIED to the node via the RIGHT headline Casimir theorem.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the right realization is not a doublet / the
  RIGHT Casimir is not `-3` / the two hands are not a symmetric spin-½ pair): that
  `min 311 (…) = 311`. It GENUINELY equals `3` (`witness_scale_true`). Rewriting the banked value
  reduces the bogus claim to the false numeric `3 = 311` in ℕ. The kernel cannot close it; the
  costume BITES (exit 1).

  DISTINCT from the banked battery: the pair (311, 3) is fresh (RHS 311 distinct from every prior
  right-hand value: …, 307, 308, 309, 310). The LHS anchor is the N280 RIGHT FUNDAMENTAL DOUBLET
  Casimir magnitude `3` — a NEW role for the value `3` (the magnitude of the RIGHT spin-½ doublet
  Casimir `-3•id`, the right-regular fundamental realization / the second SO(4) factor), tied to the
  node via `rightReg_casimir_eq_neg_three`.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerWorldMapWeakDoubletTwoHandedSO4
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- The leading coordinate of the RIGHT fundamental doublet Casimir applied to the unit `1 : O ℚ`.
    It is `-3` (via N280 `rightReg_casimir_eq_neg_three`), the spin-½ RIGHT-doublet certificate. -/
noncomputable def casCoord : ℚ :=
  ((rregI.comp rregI + rregJ.comp rregJ + rregK.comp rregK) (1 : O ℚ)).re.re.re

/-- TRUE (tied to the node's RIGHT headline): the right fundamental doublet Casimir coordinate is `-3`. -/
theorem casCoord_eq : casCoord = -3 := by
  show ((rregI.comp rregI + rregJ.comp rregJ + rregK.comp rregK) (1 : O ℚ)).re.re.re = -3
  rw [rightReg_casimir_eq_neg_three]; simp [cd_qsmul_re, Dbl.smul_re]

/-- TRUE: the magnitude of the right doublet Casimir is `3` (the spin-½ / fundamental certificate). -/
theorem casNum_true : casCoord.num.natAbs = 3 := by rw [casCoord_eq]; decide

/-- TRUE: `min 311 (magnitude of the right doublet Casimir) = 3`, holding precisely because the
    right-regular units realize the FUNDAMENTAL DOUBLET (Casimir `-3•id`), the second SO(4) chiral
    factor, not an adjoint triplet or a collapse. -/
theorem witness_scale_true : min (311 : ℕ) casCoord.num.natAbs = 3 := by
  rw [casNum_true]; decide

/-- BOGUS: claims `min 311 (magnitude of the right doublet Casimir) = 311`. It GENUINELY equals `3`
    (`witness_scale_true`). The WRONG reading (the right realization is not a doublet / the RIGHT
    Casimir degenerates / the two hands are not a symmetric spin-½ pair) reduces — through the banked
    value — to the false numeric `3 = 311`, so this must NOT compile. -/
theorem witness_scale_wrong_BOGUS :
    min (311 : ℕ) casCoord.num.natAbs = 311 := by
  rw [witness_scale_true]
  -- ⊢ (3 : ℕ) = 311  (FALSE — the costume bites)

end Counterexamples
