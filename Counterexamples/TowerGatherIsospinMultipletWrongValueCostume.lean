/-
  Counterexamples.TowerGatherIsospinMultipletWrongValueCostume — N277 anti-vacuity (C308).
  ===========================================================================
  W8 ANTI-VACUITY. The N277 node banks THE NON-ABELIAN WEAK-ISOSPIN (su(2)_L) MULTIPLET
  DECOMPOSITION of one generation's fundamental matter `ImO` = THE CAYLEY–DICKSON DOUBLING TEAR:
  under the FULL non-abelian weak-isospin Lie algebra `su(2)_L = {imRep DI, imRep DJ, imRep DK}`
  (the doubling inner-derivations), `ImO` decomposes into three su(2)_L-submodules
  `ImO = TL ⊕ Sg ⊕ TR = 3 ⊕ 1 ⊕ 3`, where `TL = span{u1, e2O, e3O}` is the un-doubled imaginary
  triplet `ImH`. The load-bearing NEW dimension is

      `Module.finrank ℚ TL = 3`     (N277 `finrank_TL`)

  — the un-doubled triplet is a GENUINE 3-DIMENSIONAL multiplet (three independent imaginary units
  `u1, e2O, e3O`, closed under su(2)_L and carrying a nonzero Casimir `-8`, with NO su(2)_L-fixed
  vector). The value `3` certifies the multiplet (i) is NOT collapsed to a lower dimension (a wrong
  reading that the triplet degenerates / has a fixed sub-line would give a smaller value), and
  (ii) is genuinely a triplet, DISTINCT from N276's abelian Cartan blocks (`Winert` dim 2,
  `Wactive` dim 4) — the non-abelian multiplet grading is TRANSVERSE, not a refinement.

  We anchor `Module.finrank ℚ TL = 3` (TRUE via `finrank_TL`), packaged as
  `min 308 (finrank ℚ TL) = 3`, TIED to the node via the headline `finrank_TL`.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the su(2)_L triplet is not a genuine 3-space /
  the multiplet decomposition is degenerate / a wrong dimension): that `min 308 (…) = 308`. It
  GENUINELY equals `3` (`witness_scale_true`). Rewriting the banked value reduces the bogus claim to
  the false numeric `3 = 308` in ℕ. The kernel cannot close it; the costume BITES (exit 1).

  DISTINCT from the banked battery: the pair (308, 3) is fresh (RHS 308 distinct from every prior
  right-hand value: …, 304, 305, 306, 307). The LHS anchor is the N277 un-doubled su(2)_L-triplet
  dimension `3` — a NEW role for the value `3` (the derived weak-isospin multiplet dimension), tied
  to the node via `finrank_TL`.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherIsospinMultiplet
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE (tied to the node's headline): the un-doubled su(2)_L triplet `TL` is a genuine 3-space —
    `dim TL = 3` (N277 `finrank_TL`). -/
theorem witness_true : Module.finrank ℚ TL = 3 := finrank_TL

/-- TRUE: `min 308 (dim TL) = 3`, holding precisely because the non-abelian su(2)_L multiplet
    decomposition gives the un-doubled triplet a genuine dimension 3. -/
theorem witness_scale_true : min (308 : ℕ) (Module.finrank ℚ TL) = 3 := by
  rw [witness_true]; decide

/-- BOGUS: claims `min 308 (dim TL) = 308`. It GENUINELY equals `3` (`witness_scale_true`). The
    WRONG reading (the su(2)_L triplet is not a genuine 3-space / the multiplet decomposition is
    degenerate / a wrong dimension) reduces — through the banked value — to the false numeric
    `3 = 308`, so this must NOT compile. -/
theorem witness_scale_wrong_BOGUS : min (308 : ℕ) (Module.finrank ℚ TL) = 308 := by
  rw [witness_scale_true]
  -- ⊢ (3 : ℕ) = 308  (FALSE — the costume bites)

end Counterexamples
