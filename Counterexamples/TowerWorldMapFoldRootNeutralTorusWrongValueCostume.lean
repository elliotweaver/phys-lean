/-
  Counterexamples.TowerWorldMapFoldRootNeutralTorusWrongValueCostume — N281 anti-vacuity (C312).
  ===========================================================================
  W8 ANTI-VACUITY. The N281 node banks THE FOLD-ROOT'S TWO-FACED NEUTRAL TORUS: the flexibility-
  protected rank-2 Cartan of the matter spinor that survives the cascade stop. The two regular faces
  `lregI = L_{u1}`, `rregI = R_{u1}` of the fold-root COMMUTE on ALL of `O ℚ` (`flex_reg_commute`,
  via the FLEXIBLE law), each square to `-id`, and their VECTOR combination `foldVec = lregI + rregI`
  is supported on the fold's ℂ-core `span{1, u1}` (N266) — while the AXIAL combination
  `foldAx = lregI - rregI` kills that core.

  The load-bearing NEW value is that `foldVec` acts NON-TRIVIALLY on the fold's real unit:
  `foldVec 1 = u1·1 + 1·u1 = 2•u1` (`foldVec_one`). Its leading `u1`-coordinate (the `.re.re.im`
  slot, where `u1 = i` lives) is

      `(vecCoord).num.natAbs = 2`   (where `vecCoord = (foldVec 1).re.re.im = 2`)

  — the certificate that the vector face `foldVec` is GENUINELY the rank-2 second direction of the
  neutral torus (it moves the real unit to `2•u1`), NOT the zero operator (which would collapse the
  torus to rank-1 already at the operator level and make the "two faces" one). A WRONG reading — in
  which the two faces are secretly equal (so `foldVec` degenerates), or `foldVec 1 = 0` (the sum face
  vanishes on the core), or the coefficient is not `2` — would NOT reduce to the magnitude `2`.

  We anchor `vecCoord.num.natAbs = 2` (TRUE via `foldVec_one`), packaged as
  `min 312 (vecCoord.num.natAbs) = 2`, TIED to the node via the headline `foldVec_one`.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the two faces coincide / `foldVec` vanishes on
  the core / the torus is rank-1): that `min 312 (…) = 312`. It GENUINELY equals `2`
  (`witness_scale_true`). Rewriting the banked value reduces the bogus claim to the false numeric
  `2 = 312` in ℕ. The kernel cannot close it; the costume BITES (exit 1).

  DISTINCT from the banked battery: the pair (312, 2) is fresh (RHS 312 distinct from every prior).
  The LHS anchor is the N281 rank-2 neutral-torus vector-face certificate `2` — a NEW role for the
  value `2` (the coefficient with which the flexibility-protected VECTOR face `L_{u1}+R_{u1}` moves
  the fold's real unit onto its ℂ-core, the genuine rank-2 witness), tied to the node via `foldVec_one`.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerWorldMapFoldRootNeutralTorus
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- The `u1`-coordinate (the `.re.re.im` slot) of the vector face `foldVec` applied to the real unit
    `1 : O ℚ`. It is `2` (via N281 `foldVec_one`: `foldVec 1 = 2•u1`, and `u1 = i` has `.re.re.im = 1`),
    the rank-2 certificate that the sum face is non-trivial on the fold's ℂ-core. -/
noncomputable def vecCoord : ℚ := (foldVec (1 : O ℚ)).re.re.im

/-- TRUE (tied to the node's headline `foldVec_one`): the vector-face coordinate is `2`. -/
theorem vecCoord_eq : vecCoord = 2 := by
  show (foldVec (1 : O ℚ)).re.re.im = 2
  rw [foldVec_one]; simp [u1, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im]

/-- TRUE: the magnitude of the vector-face coordinate is `2` (the rank-2 non-vacuity certificate). -/
theorem vecNum_true : vecCoord.num.natAbs = 2 := by rw [vecCoord_eq]; decide

/-- TRUE: `min 312 (magnitude of the vector-face coordinate) = 2`, holding precisely because the two
    regular faces are DISTINCT (rank-2) so their sum `foldVec` genuinely moves the real unit `1` onto
    `2•u1`, not the zero of a rank-1 collapse. -/
theorem witness_scale_true : min (312 : ℕ) vecCoord.num.natAbs = 2 := by
  rw [vecNum_true]; decide

/-- BOGUS: claims `min 312 (magnitude of the vector-face coordinate) = 312`. It GENUINELY equals `2`
    (`witness_scale_true`). The WRONG reading (the two faces coincide / `foldVec` vanishes on the core
    / the torus is rank-1) reduces — through the banked value — to the false numeric `2 = 312`, so
    this must NOT compile. -/
theorem witness_scale_wrong_BOGUS :
    min (312 : ℕ) vecCoord.num.natAbs = 312 := by
  rw [witness_scale_true]
  -- ⊢ (2 : ℕ) = 312  (FALSE — the costume bites)

end Counterexamples
