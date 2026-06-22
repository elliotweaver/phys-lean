/-
  Phys.Algebra.HermitianJordan.CompCentral — N5d: composition-centrality of the
  involution (the nuclear-involution ingredient of the H₃ Jordan cap).
  ===========================================================================
  The second of the three ingredients the entrywise order-3 Jordan-identity assembly
  (`jdef_H3 = 0`) consumes. `Phys/Algebra/Alternative.lean` banked ingredient (1),
  alternativity; `Phys/Algebra/HermitianJordan/Helpers.lean` banked ingredient (3),
  centrality of the real diagonal `ocR r`. This module banks ingredient (2): the
  COMPOSITION-CENTRALITY (nuclearity) of the Cayley–Dickson involution on the octonion
  shape `CD (CD B)`.

  WHAT COMPOSITION-CENTRALITY MEANS. For any element `a` of the octonion shape, the
  symmetric TRACE `a + star a` and the NORM `a * star a` are CENTRAL: they commute and
  associate (in every position) with the whole algebra. This is the classical
  Jacobson/Schafer condition under which `H₃(A)` is a Jordan algebra — `A` alternative
  AND its involution nuclear (symmetric parts central). It is derived here FORWARD from
  the banked Cayley–Dickson product, with NO Mathlib composition-algebra import (the
  POSIT-vs-DERIVE moat). It traces back, in the chain, to N2's banked self-overlap norm
  `Nrm` / the scaling law (the multiplicative norm of the cascade).

  WHY THESE, AND WHY NOW (the corrected N5d relation set). The structural numerics in
  workbench/N5-jordan-cap establish that the alternating-form laws ALONE do not kill the
  entrywise Jordan defect (`cert_span.py`: every entry NO-SOLUTION in the ℚ-span of
  alternating-law instances, even over a 129 600-instance pool). The faithful
  split-octonion model (`cert_confirm.py`) confirms the defect vanishes for the
  real-diagonal Hermitian 3×3 once one ALSO has the involution's composition-centrality
  banked here. (See FINDINGS.md for the run-48 sharpening of how these enter the proof:
  the norm reduction is degree-LOWERING, so it enters as a rewrite — Cayley–Hamilton
  `sq_ch` — not as a flat span column.)

  WHAT IS DERIVED (forward; each a theorem, foundations-only):

    tr_comm          — ★ TRACE COMMUTES: `(a + star a) * x = x * (a + star a)`.
    tr_assocL/M/R    — ★ TRACE ASSOCIATES in every position.
    nrm_comm         — ★ NORM COMMUTES: `(a * star a) * x = x * (a * star a)`.
    nrm_assocL/M/R   — ★ NORM ASSOCIATES in every position.
    nrm_symm         — ★ NORM SYMMETRY: `a * star a = star a * a`.
    sq_ch            — ★ CAYLEY–HAMILTON (addition form): `a*a + a*star a = (a+star a)*a`,
                       i.e. the square reduces to a trace-multiple minus the (central)
                       norm — the degree-lowering reduction the assembly uses.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). No physics words: every statement is a
  pure algebraic identity asserting that the trace and norm of the Cayley–Dickson
  involution are central in the double of a double, and the rank-2 (Cayley–Hamilton)
  reduction of a square. Nothing to delete.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.HermitianJordan.Setup
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD

section
variable {B : Type*} [CommRing B] [StarRing B]
attribute [local instance] CD.narCD CD.srCD

/-- The simp normal form that reduces a `CD (CD B)` identity to ground-ring `ring`
    goals: unfold every projection of the Cayley–Dickson product / conjugation / sums
    down to the commutative ground ring `B`. -/
local macro "cdsimp" : tactic =>
  `(tactic| simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add])

set_option maxHeartbeats 1000000 in
/-- ★ THE TRACE COMMUTES with everything: `(a + star a) * x = x * (a + star a)`. The
    symmetric part of the involution is central. -/
theorem tr_comm (a x : CD (CD B)) : (a + star a) * x = x * (a + star a) := by
  ext <;> cdsimp <;> ring

set_option maxHeartbeats 1000000 in
/-- ★ THE TRACE ASSOCIATES (left): `(a + star a) * (x * y) = ((a + star a) * x) * y`. -/
theorem tr_assocL (a x y : CD (CD B)) :
    (a + star a) * (x * y) = ((a + star a) * x) * y := by
  ext <;> cdsimp <;> ring

set_option maxHeartbeats 1000000 in
/-- ★ THE TRACE ASSOCIATES (middle): `(x * (a + star a)) * y = x * ((a + star a) * y)`. -/
theorem tr_assocM (a x y : CD (CD B)) :
    (x * (a + star a)) * y = x * ((a + star a) * y) := by
  ext <;> cdsimp <;> ring

set_option maxHeartbeats 1000000 in
/-- ★ THE TRACE ASSOCIATES (right): `(x * y) * (a + star a) = x * (y * (a + star a))`. -/
theorem tr_assocR (a x y : CD (CD B)) :
    (x * y) * (a + star a) = x * (y * (a + star a)) := by
  ext <;> cdsimp <;> ring

set_option maxHeartbeats 1000000 in
/-- ★ THE NORM COMMUTES with everything: `(a * star a) * x = x * (a * star a)`. The
    self-overlap (norm) of the involution is central. -/
theorem nrm_comm (a x : CD (CD B)) : (a * star a) * x = x * (a * star a) := by
  ext <;> cdsimp <;> ring

set_option maxHeartbeats 1000000 in
/-- ★ THE NORM ASSOCIATES (left): `(a * star a) * (x * y) = ((a * star a) * x) * y`. -/
theorem nrm_assocL (a x y : CD (CD B)) :
    (a * star a) * (x * y) = ((a * star a) * x) * y := by
  ext <;> cdsimp <;> ring

set_option maxHeartbeats 1000000 in
/-- ★ THE NORM ASSOCIATES (middle): `(x * (a * star a)) * y = x * ((a * star a) * y)`. -/
theorem nrm_assocM (a x y : CD (CD B)) :
    (x * (a * star a)) * y = x * ((a * star a) * y) := by
  ext <;> cdsimp <;> ring

set_option maxHeartbeats 1000000 in
/-- ★ THE NORM ASSOCIATES (right): `(x * y) * (a * star a) = x * (y * (a * star a))`. -/
theorem nrm_assocR (a x y : CD (CD B)) :
    (x * y) * (a * star a) = x * (y * (a * star a)) := by
  ext <;> cdsimp <;> ring

set_option maxHeartbeats 1000000 in
/-- ★ NORM SYMMETRY: `a * star a = star a * a`. The two orders of the self-overlap agree
    (both equal the central scalar norm). -/
theorem nrm_symm (a : CD (CD B)) : a * star a = star a * a := by
  ext <;> cdsimp <;> ring

set_option maxHeartbeats 1000000 in
/-- ★ THE CAYLEY–HAMILTON (rank-2) REDUCTION, addition form: `a*a + a*star a = (a+star a)*a`.
    Equivalently `a*a = (a + star a)*a − a*star a`: the square of `a` reduces to a
    trace-multiple of `a` minus the central norm. This is the degree-LOWERING reduction
    the entrywise assembly uses to collapse the Jordan defect (the norm `a*star a` being
    central by `nrm_comm`/`nrm_assoc*`). -/
theorem sq_ch (a : CD (CD B)) : a * a + a * star a = (a + star a) * a := by
  ext <;> cdsimp <;> ring

end

end Phys.Algebra.HJ
