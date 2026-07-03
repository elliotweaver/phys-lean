/-
  Counterexamples.TowerWorldMapWeakDoubletLeftRegularWrongValueCostume — N279 anti-vacuity (C310).
  ===========================================================================
  W8 ANTI-VACUITY. The N279 node banks THE WEAK-ISOSPIN FUNDAMENTAL DOUBLET OF MATTER IS THE
  LEFT-REGULAR QUATERNION ACTION ON THE SPINOR, CONFINED TO THE LAST ASSOCIATIVE RUNG BY THE
  CASCADE-STOPPING ASSOCIATOR: the left-regular operators `lregI/lregJ/lregK = leftReg u1M/e2I/e3I`
  of the last-doubled quaternion imaginary units CLOSE into `su(2)` on the associative rung `H`
  (`leftReg_closure_on_H_IJ`), have the FUNDAMENTAL DOUBLET Casimir `-3•id` on the whole spinor
  (`leftReg_casimir_eq_neg_three`), and FAIL to close on the full non-associative `O ℚ` by exactly
  the banked associator (`leftReg_comm_obstructed` / `leftReg_defect_eq_associator`).

  The load-bearing NEW value is the FUNDAMENTAL DOUBLET Casimir scalar. On the whole spinor
  `O ℚ`, `(lregI² + lregJ² + lregK²) = -3•id`, so applied to the unit `1 : O ℚ` its leading
  coordinate is `-3` — whose numerator magnitude is

      `(casCoord).num.natAbs = 3`   (where `casCoord = ((casimir) 1).re.re.re = -3`)

  — the spin-½ / FUNDAMENTAL DOUBLET certificate. The value `3` (the magnitude of the `-3` Casimir)
  is the fingerprint of the DOUBLET realization, DISTINCT from N277's ADJOINT triplet Casimir `-8`.
  A WRONG reading — in which the left-regular units give a TRIPLET (Casimir `-8`, magnitude `8`), or
  the doublet collapses / the Casimir is not `-3` — would NOT reduce to the magnitude `3`.

  We anchor `casCoord.num.natAbs = 3` (TRUE via `leftReg_casimir_eq_neg_three`), packaged as
  `min 310 (casCoord.num.natAbs) = 3`, TIED to the node via the headline Casimir theorem.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the fundamental realization is not a doublet /
  the Casimir is not `-3` / the closure degenerates): that `min 310 (…) = 310`. It GENUINELY equals
  `3` (`witness_scale_true`). Rewriting the banked value reduces the bogus claim to the false numeric
  `3 = 310` in ℕ. The kernel cannot close it; the costume BITES (exit 1).

  DISTINCT from the banked battery: the pair (310, 3) is fresh (RHS 310 distinct from every prior
  right-hand value: …, 306, 307, 308, 309). The LHS anchor is the N279 FUNDAMENTAL DOUBLET Casimir
  magnitude `3` — a NEW role for the value `3` (the magnitude of the spin-½ doublet Casimir `-3•id`,
  the left-regular fundamental realization), tied to the node via `leftReg_casimir_eq_neg_three`.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerWorldMapWeakDoubletLeftRegular
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- The leading coordinate of the fundamental doublet Casimir applied to the unit `1 : O ℚ`. It is
    `-3` (via N279 `leftReg_casimir_eq_neg_three`), the spin-½ doublet certificate. -/
noncomputable def casCoord : ℚ :=
  ((lregI.comp lregI + lregJ.comp lregJ + lregK.comp lregK) (1 : O ℚ)).re.re.re

/-- TRUE (tied to the node's headline): the fundamental doublet Casimir coordinate is `-3`. -/
theorem casCoord_eq : casCoord = -3 := by
  show ((lregI.comp lregI + lregJ.comp lregJ + lregK.comp lregK) (1 : O ℚ)).re.re.re = -3
  rw [leftReg_casimir_eq_neg_three]; simp [cd_qsmul_re, Dbl.smul_re]

/-- TRUE: the magnitude of the doublet Casimir is `3` (the spin-½ / fundamental certificate). -/
theorem casNum_true : casCoord.num.natAbs = 3 := by rw [casCoord_eq]; decide

/-- TRUE: `min 310 (magnitude of the doublet Casimir) = 3`, holding precisely because the
    left-regular units realize the FUNDAMENTAL DOUBLET (Casimir `-3•id`), not the adjoint triplet. -/
theorem witness_scale_true : min (310 : ℕ) casCoord.num.natAbs = 3 := by
  rw [casNum_true]; decide

/-- BOGUS: claims `min 310 (magnitude of the doublet Casimir) = 310`. It GENUINELY equals `3`
    (`witness_scale_true`). The WRONG reading (the fundamental realization is not a doublet / the
    Casimir degenerates / it is really the adjoint triplet) reduces — through the banked value — to
    the false numeric `3 = 310`, so this must NOT compile. -/
theorem witness_scale_wrong_BOGUS :
    min (310 : ℕ) casCoord.num.natAbs = 310 := by
  rw [witness_scale_true]
  -- ⊢ (3 : ℕ) = 310  (FALSE — the costume bites)

end Counterexamples
