/-
  Counterexamples.OctonionJordanHermTraceCoefficientWrongValueCostume — N300 anti-vacuity (C329).
  ===========================================================================
  W8 ANTI-VACUITY. The N300 node banks the trace-COEFFICIENT proportionality `φ (C) = k · rtr C`
  (`phi_proportional`, `k = 2·dim hermSub / 3 ≠ 0`) and the FULL `f₄`-annihilation of the linear
  trace `∀ T ∈ derH3, jTr (T A) = 0` (`derH3_kills_jTr`). The load-bearing NON-TRIVIALITY is that the
  27-dim operator trace is pinned by the arena's SYMMETRIES, and in particular that a single SIGN
  FLIP genuinely NEGATES an off-diagonal slot (`csign_flip_pair`) — the mechanism that forces the
  slot's trace to `0`. If the sign reweighting acted trivially (`csign = id`), the whole
  symmetry-pinning argument would be vacuous.

  The certificate is the magnitude of the flipped off-diagonal coordinate. Take the Hermitian pair
  `P := pairPart 0 1 M` of a matrix `M` carrying `1 : O ℚ` at entry `(0,1)`; apply the sign flip
  `csign (flip 0)`. By `csign_flip_pair` the result is `-P`, so its `(0,1)` deep-real coordinate is
  `-1`, of magnitude `1`:

      `certVal := (csign (flip 0) (pairPart 0 1 M)) 0 1 |>.re.re.re   (= -1)`.

  We anchor `certVal.num.natAbs = 1` (TRUE), packaged as `min 329 (certVal.num.natAbs) = 1`, TIED to
  the node via `csign_flip_pair` (the sign flip genuinely negates the slot).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the sign reweighting is the identity / the slot
  is FIXED not negated / the symmetry-pinning is vacuous): that `min 329 (…) = 329`. It GENUINELY
  equals `1` (`cert_val_true`). Rewriting the banked value reduces the bogus claim to the false
  numeric `1 = 329` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (329, 1) is fresh (RHS 329 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanHermTraceCoefficient
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Matrix

attribute [local instance] CD.narCD CD.srCD

/-- A Hermitian matrix carrying `1 : O ℚ` at entry `(0,1)` (and its conjugate at `(1,0)`). -/
noncomputable def Mwit : Matrix (Fin 3) (Fin 3) (O ℚ) :=
  Matrix.of (fun i j => if i = 0 ∧ j = 1 then 1 else if i = 1 ∧ j = 0 then 1 else 0)

/-- THE SIGN-FLIP CERTIFICATE: the deep-real `(0,1)` coordinate of the sign-flipped off-diagonal
    pair `csign (flip 0) (pairPart 0 1 Mwit)`. By `csign_flip_pair` this is `-(pairPart 0 1 Mwit)`,
    whose `(0,1)` entry is `-1` — certifying the sign reweighting genuinely NEGATES the slot. -/
noncomputable def certVal : ℚ :=
  ((csign (fun i => if i = 0 then -1 else 1) (pairPart 0 1 Mwit)) 0 1).re.re.re

/-- TRUE (tied to the banked N300 law `csign_flip_pair`): the sign flip negates the pair, so the
    `(0,1)` coordinate is `-(pairPart 0 1 Mwit) 0 1 = -1`. -/
theorem certVal_eq : certVal = -1 := by
  unfold certVal
  rw [csign_flip_pair 0 1 (by decide)]
  simp only [Matrix.neg_apply, pairPart, Mwit, Matrix.of_apply]
  norm_num

/-- TRUE: the magnitude of the flipped coordinate is `1`. -/
theorem certNum_true : certVal.num.natAbs = 1 := by rw [certVal_eq]; decide

/-- TRUE: `min 329 (magnitude of the certificate) = 1`, holding precisely because the sign
    reweighting `csign (flip 0)` genuinely NEGATES the off-diagonal slot — the symmetry-pinning of
    the trace functional is non-vacuous. -/
theorem cert_val_true : min (329 : ℕ) certVal.num.natAbs = 1 := by
  rw [certNum_true]; decide

/-- BOGUS: claims `min 329 (magnitude of the certificate) = 329`. It GENUINELY equals `1`
    (`cert_val_true`). The WRONG reading (the sign reweighting is the identity / the slot is fixed /
    the symmetry-pinning is vacuous) reduces — through the banked value — to the false numeric
    `1 = 329`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (329 : ℕ) certVal.num.natAbs = 329 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 329  (FALSE — the costume bites)

end Counterexamples
