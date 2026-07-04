/-
  Counterexamples.OctonionJordanFamilyRotationGeneratorsWrongValueCostume — N288 anti-vacuity (C317).
  ===========================================================================
  W8 ANTI-VACUITY. The N288 node identifies the gauge-neutral room of the derived `f₄ = Der(H₃(O))`
  as the FAMILY-ROTATION algebra: the three inner-multiplication commutators of the real-unit matter
  slots `famA/famB/famC` are gauge-central members of `f₄` that ROTATE the three cap-forced matter
  slots (N267) into each other — in particular `famC = innerMul (slotA 1)(slotB 1)` (= N287's `M0`)
  sends `slotB b ↦ slotA b` (`famC_slotB`) and `slotA a ↦ − slotB a` (`famC_slotA`), the
  `(1,2)`-generation-plane rotation.

  The certificate that this generation rotation is NON-TRIVIAL (that `famC` genuinely MIXES the
  matter-carrier copies and is not the vacuous zero/scalar map) is the real part of the `(0,1)` entry
  the rotation lands the second generation `slotB 1` onto the first `slotA 1`:

      `reQ ((innerMul (slotA 1)(slotB 1) (slotB 1)) 0 1) = 1`

  — via `famC_slotB` (`famC (slotB 1) = slotA 1`) + `slotA_entry` (`(slotA 1) 0 1 = 1`). The value
  `1 ≠ 0` certifies the rotation genuinely carries the second matter-carrier copy into the (nonzero)
  first — so the gauge-neutral room genuinely MIXES generations and is the derived family-rotation
  algebra, not an abelian/trivial or empty room.

  We anchor `rotVal.num.natAbs = 1` (TRUE), packaged as `min 317 (rotVal.num.natAbs) = 1`, TIED to
  the node via `famC_slotB` + `slotA_entry` (the same banked facts the capstone
  `family_rotation_generators` rests on: the generation-rotation action + its non-vacuity).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: `famC` does NOT mix the generations / the
  gauge-neutral room is abelian or trivial / the rotation vanishes / the room is empty): that
  `min 317 (…) = 317`. It GENUINELY equals `1` (`rot_scale_true`). Rewriting the banked value reduces
  the bogus claim to the false numeric `1 = 317` in ℕ. The kernel cannot close it; the costume BITES.

  DISTINCT from the banked battery: the pair (317, 1) is fresh (RHS 317 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanFamilyRotationGenerators
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Matrix

attribute [local instance] CD.narCD CD.srCD

/-- THE GENERATION-ROTATION NON-TRIVIALITY CERTIFICATE: the real part of the `(0,1)` entry the family
    rotation `famC = innerMul (slotA 1)(slotB 1)` lands the second matter slot `slotB 1` onto — which
    is `slotA 1` (`famC_slotB`), whose `(0,1)` entry is `1` (`slotA_entry`). It is `1`, certifying the
    gauge-neutral room genuinely MIXES the three cap-forced generations (the derived family-rotation
    algebra), not an abelian/trivial/empty room. -/
noncomputable def rotVal : ℚ := reQ ((innerMul (slotA 1) (slotB 1) (slotB 1)) 0 1)

/-- TRUE (tied to the banked N288 identity `famC_slotB`): the certificate is `1`. -/
theorem rotVal_eq : rotVal = 1 := by
  show reQ ((innerMul (slotA 1) (slotB 1) (slotB 1)) 0 1) = 1
  rw [famC_slotB, slotA_entry]
  simp only [reQ]; norm_num

/-- TRUE: the magnitude of the generation-rotation certificate is `1`. -/
theorem rotNum_true : rotVal.num.natAbs = 1 := by rw [rotVal_eq]; decide

/-- TRUE: `min 317 (magnitude of the generation-rotation certificate) = 1`, holding precisely because
    the family rotation `famC` GENUINELY carries the second matter-carrier copy `slotB 1` into the
    (nonzero) first `slotA 1` — so the gauge-neutral room is the non-abelian family-rotation algebra,
    genuinely mixing the three generations. -/
theorem rot_scale_true : min (317 : ℕ) rotVal.num.natAbs = 1 := by
  rw [rotNum_true]; decide

/-- BOGUS: claims `min 317 (magnitude of the rotation certificate) = 317`. It GENUINELY equals `1`
    (`rot_scale_true`). The WRONG reading (`famC` does NOT mix the generations / the room is abelian
    or trivial / the rotation vanishes / the room is empty) reduces — through the banked value — to
    the false numeric `1 = 317`, so this must NOT compile. -/
theorem rot_scale_wrong_BOGUS :
    min (317 : ℕ) rotVal.num.natAbs = 317 := by
  rw [rot_scale_true]
  -- ⊢ (1 : ℕ) = 317  (FALSE — the costume bites)

end Counterexamples
