/-
  Counterexamples.OctonionJordanInnerMultiplicationWrongValueCostume — N274 anti-vacuity (C305).
  ===========================================================================
  W8 ANTI-VACUITY. The N274 node banks THE ARENA'S INNER-MULTIPLICATION COMMUTATOR — the derived
  operator COUPLING the charge-weight space (N213) to the octonion family-coupling (N272). Over the
  derived octonion rung `O ℚ = CD (H ℚ)` and the maximal Hermitian octonionic Jordan arena
  `J₃(O ℚ) = H₃(O ℚ)`, the arena's OWN Jordan-multiplication operator `Lmul A := (X ↦ jb A X)` and
  its inner commutator `innerMul A B := Lmul A ∘ₗ Lmul B - Lmul B ∘ₗ Lmul A` satisfy the HEADLINE
  charge-weight ↔ coupling identity

      `innerMul (slotA a) (slotB b) (Dg d0 d1 d2) = slotC ((d2 - d1) • (star a * b))`     (N274)

  — the inner commutator reads the diagonal position-weight DIFFERENCE `d2 - d1` (the N213
  trace-zero charge-space coordinate) into the octonion entry-gauge coupling `star a * b` (the N272
  inter-generation coupling). This is the derived direction-mixing operator N273 flagged as the
  missing S₃-breaking structure — it MOVES matter that neither the derived gauge `jAct`
  (diagonal-FIXING) nor the family symmetry `framePerm` (position-PERMUTING) can produce.

  The load-bearing QUANTITATIVE W8 fact anchored here is the CONCRETE octonion value the commutator
  produces at the witness `a = 1`, `b = u1` (the fold-root √−1), `Dg 0 0 1` (weight difference
  `d2 - d1 = 1 - 0 = 1`). The headline gives
  `innerMul (slotA 1) (slotB u1) (Dg 0 0 1) = slotC ((1 - 0) • (star 1 * u1)) = slotC u1`, whose
  `(1,2)` entry is `u1` (via `slotC_entry`), and `u1.re.re.im = +1`. The value `+1` is precisely the
  fingerprint that the commutator (i) carries the NON-ZERO weight difference `d2 - d1 = 1` (a wrong
  reading that the diagonal split is invisible would give the coefficient `0`, hence `0`), AND (ii)
  carries the octonion coupling `star 1 * u1 = u1` (the entry-gauge axis). So `+1` (not `0`, not any
  other value) certifies the derived direction-mixing is genuinely non-trivial.

  We anchor `((innerMul (slotA 1) (slotB u1) (Dg 0 0 1)) 1 2).re.re.im = 1` (TRUE via
  `innerMul_slot_diag` + `slotC_entry`), packaged as `min 305 (…) = 1`, TIED to the node via the
  headline `innerMul_slot_diag`.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the inner commutator does NOT couple the weight
  difference to the coupling / the diagonal split is invisible to it / the direction-mixing is
  trivial / a wrong value): that `min 305 (…) = 305`. It GENUINELY equals `1` (`witness_scale_true`).
  Rewriting the banked value reduces the bogus claim to the false numeric `1 = 305` in ℚ. The kernel
  cannot close it; the costume BITES (exit 1).

  The bite is name-independent: for `O ℚ = CD (H ℚ)`, the inner commutator's `(1,2)` entry at the
  witness has imaginary part genuinely `1` (`innerMul_slot_diag`), so claiming `min 305 1 = 305` is
  genuinely FALSE (1 ≠ 305).

  DISTINCT from the banked battery: the pair (305, 1) is fresh (RHS 305 distinct from every prior
  right-hand value: …, 301, 302, 303, 304). The LHS anchor is the N274 charge-weight↔coupling
  witness `+1` — the derived operator's direction-mixing surfacing as the octonion coupling carried
  by the non-zero weight difference — tied to the node via `innerMul_slot_diag`.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanInnerMultiplication
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-- TRUE (tied to the node's headline / the charge-weight↔coupling identity): the `(1,2)` entry of
    the inner-multiplication commutator at the witness `a = 1`, `b = u1`, `Dg 0 0 1` has imaginary
    part `+1` — the fingerprint that the derived operator carries the NON-ZERO weight difference
    `d2 - d1 = 1` into the octonion coupling `star 1 * u1 = u1` (N274 `innerMul_slot_diag`). -/
theorem witness_true :
    ((innerMul (slotA (1 : O ℚ)) (slotB u1) (Dg 0 0 1)) 1 2).re.re.im = (1 : ℚ) := by
  rw [innerMul_slot_diag, slotC_entry]
  rw [star_one, one_mul, sub_zero, one_smul]
  simp only [u1]

/-- TRUE: `min 305 (…) = 1`, holding precisely because the inner commutator couples the non-zero
    weight difference to the octonion coupling (the direction-mixing reads `+1`, not `0`). -/
theorem witness_scale_true :
    min (305 : ℚ) ((innerMul (slotA (1 : O ℚ)) (slotB u1) (Dg 0 0 1)) 1 2).re.re.im = 1 := by
  rw [witness_true]; norm_num

/-- BOGUS: claims `min 305 (…) = 305`. It GENUINELY equals `1` (`witness_scale_true`). The WRONG
    reading (the inner commutator does not couple the weight difference to the coupling / the
    diagonal split is invisible to it / the direction-mixing is trivial / a wrong value) reduces —
    through the banked value — to the false numeric `1 = 305`, so this must NOT compile. -/
theorem witness_scale_wrong_BOGUS :
    min (305 : ℚ) ((innerMul (slotA (1 : O ℚ)) (slotB u1) (Dg 0 0 1)) 1 2).re.re.im = 305 := by
  rw [witness_scale_true]
  -- ⊢ (1 : ℚ) = 305  (FALSE — the costume bites)

end

end Counterexamples
