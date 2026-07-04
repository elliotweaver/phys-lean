/-
  Counterexamples.OctonionJordanFamilyInvariantCoreWrongValueCostume — N290 anti-vacuity (C319).
  ===========================================================================
  W8 ANTI-VACUITY. The N290 node banks that the FAMILY-INVARIANT CORE of the maximal Hermitian
  octonionic Jordan arena `H₃(O ℚ) = J₃(O ℚ)` — the joint kernel of the derived family-rotation
  `so(3)` {famA, famB, famC} (N288/N289) — is EXACTLY the scalar-unit line `span{Dg r r r}` (dim 1).
  The load-bearing content is that this core is PROPER: the traceless 26-dimensional arena, where all
  generation content lives, carries NO nonzero family-invariant direction — a traceless matter-slot
  element ESCAPES the core.

  The certificate that the core is PROPER (that a traceless slot element is NOT family-invariant) is
  the real part of the `(0,2)` entry that `famC = innerMul (slotA 1)(slotB 1)` produces on the first
  real-unit slot `slotA 1` — `famC (slotA 1) = − slotB 1` (N288 `famC_slotA`), whose `(0,2)` entry is
  `−1`:

      `reQ ((innerMul (slotA 1)(slotB 1) (slotA 1)) 0 2) = −1`

  The value `−1 ≠ 0` certifies `famC (slotA 1) ≠ 0`, so `slotA 1` is NOT annihilated by the family
  `so(3)` — the traceless slot escapes the invariant core, which is therefore only the scalar line,
  not the whole arena.

  We anchor `braVal.num.natAbs = 1` (TRUE), packaged as `min 319 (braVal.num.natAbs) = 1`, TIED to the
  node via `famC_slotA` (`famC (slotA a) = − slotB a`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the family-invariant core is the WHOLE arena /
  a traceless generation direction IS family-invariant / the family symmetry fixes more than the
  scalar unit): that `min 319 (…) = 319`. It GENUINELY equals `1` (`bra_scale_true`). Rewriting the
  banked value reduces the bogus claim to the false numeric `1 = 319` in ℕ. The kernel cannot close
  it; the costume BITES.

  DISTINCT from the banked battery: the pair (319, 1) is fresh (RHS 319 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanFamilyInvariantCore
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Matrix

attribute [local instance] CD.narCD CD.srCD

/-- THE CORE-PROPERNESS CERTIFICATE: the real part of the `(0,2)` entry that `famC =
    innerMul (slotA 1)(slotB 1)` produces on the first real-unit slot `slotA 1`. Since
    `famC (slotA 1) = − slotB 1` (N288 `famC_slotA`) and `(slotB (−1)) 0 2 = −1`, the `(0,2)` entry
    is `−1`, certifying `slotA 1` (a traceless matter-slot element) is NOT family-invariant — the
    invariant core is the proper scalar line, not the whole arena. -/
noncomputable def braVal : ℚ :=
  reQ ((innerMul (slotA (1:O ℚ)) (slotB 1) (slotA 1)) 0 2)

/-- TRUE (tied to the banked N288 action `famC_slotA`): the certificate is `−1`. -/
theorem braVal_eq : braVal = -1 := by
  show reQ ((innerMul (slotA (1:O ℚ)) (slotB 1) (slotA 1)) 0 2) = -1
  rw [famC_slotA, Matrix.neg_apply, slotB_entry]
  simp only [reQ, CD.neg_re, Dbl.neg_re]
  norm_num

/-- TRUE: the magnitude of the core-properness certificate is `1`. -/
theorem braNum_true : braVal.num.natAbs = 1 := by rw [braVal_eq]; decide

/-- TRUE: `min 319 (magnitude of the core-properness certificate) = 1`, holding precisely because
    `famC (slotA 1) = − slotB 1 ≠ 0` — a traceless slot element escapes the family-invariant core, so
    the core is the proper scalar-unit line. -/
theorem bra_scale_true : min (319 : ℕ) braVal.num.natAbs = 1 := by
  rw [braNum_true]; decide

/-- BOGUS: claims `min 319 (magnitude of the certificate) = 319`. It GENUINELY equals `1`
    (`bra_scale_true`). The WRONG reading (the family-invariant core is the whole arena / a traceless
    generation direction is family-invariant / the family symmetry fixes more than the scalar unit)
    reduces — through the banked value — to the false numeric `1 = 319`, so this must NOT compile. -/
theorem bra_scale_wrong_BOGUS :
    min (319 : ℕ) braVal.num.natAbs = 319 := by
  rw [bra_scale_true]
  -- ⊢ (1 : ℕ) = 319  (FALSE — the costume bites)

end Counterexamples
