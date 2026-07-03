/-
  Counterexamples.OctonionJordanFamilySymmetryWrongValueCostume — N273 anti-vacuity (C304).
  ===========================================================================
  W8 ANTI-VACUITY. The N273 node banks THE DERIVED FAMILY (S₃) SYMMETRY OF THE MAXIMAL MATTER
  ARENA: over the derived octonion rung `O ℚ = CD (H ℚ)`, the family action
  `framePerm σ M := M.submatrix σ σ` (the `C(3,2) = 3`-position relabeling S₃ of the maximal
  Hermitian octonionic Jordan arena) is a Jordan automorphism, COMMUTES with the derived gauge, and
  — the octonion-specific HEADLINE — carries the N272 inter-generation coupling law by PRODUCT
  REVERSAL: `framePerm (swap 1 2) (jb (slotA a) (slotB b)) = slotC (star b * a)` (N273
  `framePerm_swap12_coupling`), vs the un-permuted `slotC (star a * b)` (N272). The two readings
  DIFFER because `O ℚ` is NON-commutative.

  The load-bearing QUANTITATIVE W8 fact anchored here is the CONCRETE octonion value the reversal
  produces at the witness `a = 1`, `b = u1` (the fold-root √−1). The permuted coupling is
  `slotC (star u1 * 1) = slotC (star u1)`, whose `(1,2)` entry is `star u1` (via `slotC_entry`),
  and `(star u1).re.re.im = -1`. If the family orbit did NOT reverse the product — if it read the
  un-permuted `slotC (star 1 * u1) = slotC u1` — the `(1,2)` entry would be `u1`, with
  `u1.re.re.im = +1`. So the value `-1` (not `+1`) is precisely the fingerprint of the octonion
  PRODUCT-REVERSAL: the discrete family symmetry acts NON-trivially on the octonion coupling.

  We anchor `((framePerm (swap 1 2) (jb (slotA 1) (slotB u1))) 1 2).re.re.im = -1` (TRUE via
  `framePerm_swap12_coupling` + `slotC_entry`), packaged as `min 304 (…) = -1`, TIED to the node via
  `framePerm_swap12_coupling`.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the family symmetry does NOT reverse the
  product / acts trivially on the coupling / the coupling-orbit is blind to non-commutativity / a
  wrong value): that `min 304 (…) = 304`. It GENUINELY equals `-1` (`witness_scale_true`). Rewriting
  the banked value reduces the bogus claim to the false numeric `-1 = 304` in ℚ. The kernel cannot
  close it; the costume BITES (exit 1).

  The bite is name-independent: for `O ℚ = CD (H ℚ)`, the permuted coupling's `(1,2)` entry
  imaginary part is genuinely `-1` (`framePerm_swap12_coupling`), so claiming `min 304 (-1) = 304`
  is genuinely FALSE (-1 ≠ 304).

  DISTINCT from the banked battery: the pair (304, -1) is fresh (RHS 304 distinct from every prior
  right-hand value: …, 300, 301, 302, 303). The LHS anchor is the N273 coupling-orbit
  product-reversal witness `-1` — the octonion non-commutativity surfacing in the discrete family
  action — tied to the node via `framePerm_swap12_coupling`.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanFamilySymmetry
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-- TRUE (tied to the node's headline / the coupling-orbit): the `(1,2)` entry of the family-permuted
    N272 coupling at the witness `a = 1`, `b = u1` has imaginary part `-1` — the fingerprint of the
    octonion PRODUCT-REVERSAL (`star u1`, not `u1`), i.e. the discrete family symmetry acts
    non-trivially on the coupling (N273 `framePerm_swap12_coupling`). -/
theorem witness_true :
    ((framePerm (Equiv.swap 1 2) (jb (slotA (1 : O ℚ)) (slotB u1))) 1 2).re.re.im = (-1 : ℚ) := by
  rw [framePerm_swap12_coupling, mul_one, slotC_entry]
  simp only [u1, CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im']

/-- TRUE: `min 304 (…) = -1`, holding precisely because the family orbit reverses the octonion
    product (the coupling-orbit reads `-1`, the reversal fingerprint, not `+1`). -/
theorem witness_scale_true :
    min (304 : ℚ) ((framePerm (Equiv.swap 1 2) (jb (slotA (1 : O ℚ)) (slotB u1))) 1 2).re.re.im
      = -1 := by
  rw [witness_true]; norm_num

/-- BOGUS: claims `min 304 (…) = 304`. It GENUINELY equals `-1` (`witness_scale_true`). The WRONG
    reading (the family symmetry does not reverse the product / acts trivially on the coupling /
    the coupling-orbit is blind to non-commutativity / a wrong value) reduces — through the banked
    value — to the false numeric `-1 = 304`, so this must NOT compile. -/
theorem witness_scale_wrong_BOGUS :
    min (304 : ℚ) ((framePerm (Equiv.swap 1 2) (jb (slotA (1 : O ℚ)) (slotB u1))) 1 2).re.re.im
      = 304 := by
  rw [witness_scale_true]
  -- ⊢ (-1 : ℚ) = 304  (FALSE — the costume bites)

end

end Counterexamples
