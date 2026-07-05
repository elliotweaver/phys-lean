/-
  Counterexamples.OctonionJordanFamilyMassMixingOrbitWrongValueCostume — N301 anti-vacuity (C330).
  ===========================================================================
  W8 ANTI-VACUITY. The N301 node banks that the derived FAMILY generator
  `famC = innerMul (slotA 1)(slotB 1) ∈ f₄ = derH3` ROTATES the diagonal mass-splitting sector
  `Lmul (Dg t)` of the mass-texture module `L₀` into the off-diagonal generation-mixing sector
  `Lmul (slotC v)` (and back), isospectrally. The load-bearing NON-TRIVIALITY is that the rotation
  is GENUINELY NONZERO — the family symmetry actually MOVES the mass-splitting mover into a nonzero
  mixing mover (`family_rotates_split_to_mix_ne`). If the rotation acted trivially (the commutator
  vanished), the whole mass-splitting↔mixing joint would be vacuous.

  The certificate is the magnitude of the produced mixing coordinate. Take the traceless unit split
  `Dg 0 0 1`; the family generator sends `Lmul (Dg 0 0 1)` to `Lmul (slotC (1 • 1))`
  (`family_rotates_split_to_mix`), so applied to `1` it yields `slotC 1 + slotC 1`, whose `(1,2)`
  deep-real coordinate is `1 + 1 = 2`, of magnitude `2`:

      `certVal := ((⁅famC, Lmul (Dg 0 0 1)⁆ 1) 1 2).re.re.re   (= 2)`.

  We anchor `certVal.num.natAbs = 2` (TRUE), packaged as `min 330 (certVal.num.natAbs) = 2`, TIED to
  the node via `family_rotates_split_to_mix` (the family rotation genuinely produces the mixing
  coordinate `2`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the family generator FIXES the mover / the
  rotation is trivial / the mass-splitting and mixing sectors are NOT one orbit): that
  `min 330 (…) = 330`. It GENUINELY equals `2` (`cert_val_true`). Rewriting the banked value reduces
  the bogus claim to the false numeric `2 = 330` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (330, 2) is fresh (RHS 330 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanFamilyMassMixingOrbit
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Matrix

attribute [local instance] CD.narCD CD.srCD

/-- THE MIXING CERTIFICATE: the deep-real `(1,2)` coordinate of the family rotation of the
    traceless unit split `Lmul (Dg 0 0 1)`, applied to `1`. By `family_rotates_split_to_mix` this
    is `Lmul (slotC (1•1)) 1 = slotC 1 + slotC 1`, whose `(1,2)` entry is `1 + 1 = 2`. -/
noncomputable def certVal : ℚ :=
  (((⁅innerMul (slotA (1:O ℚ)) (slotB 1), Lmul (Dg 0 0 1)⁆ 1) 1 2).re.re.re)

/-- TRUE (tied to the banked N301 law `family_rotates_split_to_mix`): the family rotation genuinely
    produces the mixing coordinate `2`. -/
theorem certVal_eq : certVal = 2 := by
  unfold certVal
  rw [family_rotates_split_to_mix 0 0 1 Matrix.conjTranspose_one, Lmul_one,
      Matrix.add_apply, slotC_entry]
  simp only [sub_zero, one_smul]
  show ((1:O ℚ) + 1).re.re.re = 2
  simp only [CD.add_re, CD.one_re, Dbl.add_re, Dbl.one_re]
  norm_num

/-- TRUE: the magnitude of the mixing coordinate is `2`. -/
theorem certNum_true : certVal.num.natAbs = 2 := by rw [certVal_eq]; decide

/-- TRUE: `min 330 (magnitude of the certificate) = 2`, holding precisely because the family
    generator genuinely ROTATES the mass-splitting mover into a nonzero mixing mover — the
    mass-splitting↔mixing orbit is non-vacuous. -/
theorem cert_val_true : min (330 : ℕ) certVal.num.natAbs = 2 := by
  rw [certNum_true]; decide

/-- BOGUS: claims `min 330 (magnitude of the certificate) = 330`. It GENUINELY equals `2`
    (`cert_val_true`). The WRONG reading (the family generator fixes the mover / the rotation is
    trivial / the two sectors are not one orbit) reduces — through the banked value — to the false
    numeric `2 = 330`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (330 : ℕ) certVal.num.natAbs = 330 := by
  rw [cert_val_true]
  -- ⊢ (2 : ℕ) = 330  (FALSE — the costume bites)

end Counterexamples
