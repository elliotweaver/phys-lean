/-
  Counterexamples.OctonionJordanDerivationAlgebraWrongValueCostume — N284 anti-vacuity (C313).
  ===========================================================================
  W8 ANTI-VACUITY. The N284 node builds THE DERIVED ARENA'S JORDAN-DERIVATION LIE ALGEBRA `jDer`
  (the f₄-ambient) and embeds the derived gauge `g₂ = Der(O ℚ)` into it as a BUNDLED, FAITHFUL Lie
  hom `g2ToJDer`, landing SKEW-ADJOINT in the arena's UNIQUE invariant form — the banked
  POSITIVE-DEFINITE trace form `jTraceForm` (N214/N270). The load-bearing NEW content is the
  UNIQUE-FORM ANCHOR `jActL_skew_jTraceForm`: the embedded gauge preserves `jTraceForm`, which is
  the single simple ambient's invariant form the ≥11×-deferred weak-mixing front (N283 INPUT A)
  structurally requires. A form that is DEGENERATE / trivial would supply no such ambient.

  The certificate that the arena's invariant form is GENUINELY NON-DEGENERATE at the fold's own
  matter direction is its value on the fold-unit matter slot `Hm 0 0 0 1 0 0` (`= slotA 1`, the
  octonion unit at position (0,1)):

      `reQ (jTraceForm (Hm 0 0 0 1 0 0) (Hm 0 0 0 1 0 0)) = 4`

  — via `reQ_jTraceForm_self` (`reQ (jTraceForm A A) = 2·jQ A`, N270) and the banked off-diagonal
  witness `jQ_witness_offdiag` (`jQ (Hm 0 0 0 1 0 0) = 2`, N270). The value `4 = 2·2 > 0` is the
  POSITIVE, non-degenerate reading of the invariant form on the fold's own matter slot — the
  certificate that the ambient `so(jTraceForm)` into which g₂ embeds skew-adjointly is a genuine
  (non-degenerate) form, NOT the zero form (which would make the "unique invariant form" vacuous and
  the skew-adjointness content empty).

  We anchor `traceFormUnit.num.natAbs = 4` (TRUE), packaged as `min 313 (traceFormUnit.num.natAbs) = 4`,
  TIED to the node via `reQ_jTraceForm_self` + `jQ_witness_offdiag` (the same banked facts B6 rests on).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the invariant form is degenerate / vanishes on
  the fold's matter slot / the skew-adjoint embedding is into a trivial form): that
  `min 313 (…) = 313`. It GENUINELY equals `4` (`witness_scale_true`). Rewriting the banked value
  reduces the bogus claim to the false numeric `4 = 313` in ℕ. The kernel cannot close it; the
  costume BITES (exit 1).

  DISTINCT from the banked battery: the pair (313, 4) is fresh (RHS 313 distinct from every prior).
  The LHS anchor is the N284 unique-invariant-form non-degeneracy certificate `4` — the positive
  value of the arena's g₂-invariant trace form on the fold's own matter slot, the form the bundled
  gauge embedding is skew-adjoint in.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanDerivationAlgebra
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Matrix

attribute [local instance] CD.narCD CD.srCD

/-- The value of the arena's UNIQUE invariant form `jTraceForm` (the form the N284 bundled gauge
    embedding is skew-adjoint in, B6) on the fold-unit matter slot `Hm 0 0 0 1 0 0` (`= slotA 1`).
    It is `4` (via `reQ_jTraceForm_self` + `jQ_witness_offdiag`), the positive non-degeneracy
    certificate of the ambient invariant form. -/
noncomputable def traceFormUnit : ℚ := reQ (jTraceForm (Hm 0 0 0 1 0 0) (Hm 0 0 0 1 0 0))

/-- TRUE (tied to the banked facts B6 rests on): the invariant-form value on the fold's matter slot
    is `4`. -/
theorem traceFormUnit_eq : traceFormUnit = 4 := by
  show reQ (jTraceForm (Hm 0 0 0 1 0 0) (Hm 0 0 0 1 0 0)) = 4
  rw [reQ_jTraceForm_self, jQ_witness_offdiag]; norm_num

/-- TRUE: the magnitude of the invariant-form value is `4` (the non-degeneracy certificate). -/
theorem traceFormNum_true : traceFormUnit.num.natAbs = 4 := by rw [traceFormUnit_eq]; decide

/-- TRUE: `min 313 (magnitude of the invariant-form value) = 4`, holding precisely because the
    arena's g₂-invariant form (the unique ambient form the skew-adjoint embedding lands in) is
    genuinely NON-DEGENERATE on the fold's own matter slot — positive value `4`, not the zero of a
    degenerate form. -/
theorem witness_scale_true : min (313 : ℕ) traceFormUnit.num.natAbs = 4 := by
  rw [traceFormNum_true]; decide

/-- BOGUS: claims `min 313 (magnitude of the invariant-form value) = 313`. It GENUINELY equals `4`
    (`witness_scale_true`). The WRONG reading (the invariant form is degenerate / vanishes on the
    fold's matter slot / the skew-adjoint embedding is into a trivial form) reduces — through the
    banked value — to the false numeric `4 = 313`, so this must NOT compile. -/
theorem witness_scale_wrong_BOGUS :
    min (313 : ℕ) traceFormUnit.num.natAbs = 313 := by
  rw [witness_scale_true]
  -- ⊢ (4 : ℕ) = 313  (FALSE — the costume bites)

end Counterexamples
