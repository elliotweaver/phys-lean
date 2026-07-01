/-
  Phys.Algebra.OctonionJordanCubicNorm — N215: THE CUBIC NORM (the Freudenthal reduced
  determinant) on the exceptional Jordan algebra J₃(O), and its WELL-DEFINEDNESS — the
  bracketing-independence AND cyclic symmetry of its trilinear cross-term — FORCED by the
  real-part trace-associativity of the octonion product.
  ===========================================================================
  THE NAMED-ASCENT FORWARD STEP (RUNBOOK W1 — the repeated-deferral signal), step 4 (the
  invariant tower). The invariants of `J₃(O)` climb by degree: the LINEAR trace (`jTr`, N214),
  the QUADRATIC trace form / Cartan–Killing metric (`jTraceForm`, N214), and now the CUBIC norm
  `jN` — the genuinely-cubic invariant that is the DEFINING feature of the exceptional (Albert)
  algebra. It is unbanked (no prior `cubicNorm`/`jN`/`determinant` on `J₃(O)` anywhere in the
  chain), and it is the natural next structural object of the ascent toward the forced charge
  anchor.

  N5 banked the `J₃(O)` CARRIER (`Hm d0 d1 d2 a b c` — real diagonal `ocR dᵢ`, arbitrary
  octonion off-diagonals `a` at `(0,1)`, `b` at `(0,2)`, `c` at `(1,2)`, conjugates below). N24
  banked the Born self-overlap form `gForm v w = reQ (v · star w)` (the octonion norm on the
  diagonal: `gForm a a = |a|²`). N210 banked the real-part TRACE-ASSOCIATIVITY
  `reQ ((x·y)·z) = reQ (x·(y·z))` (`reQ_mul_assoc3`) and the trace-commutativity
  `reQ (x·y) = reQ (y·x)` (`reQ_mul_comm`). This module assembles them.

  ★ THE CUBIC NORM. For the general Hermitian `Hm d0 d1 d2 a b c` over `O ℚ`, since `O ℚ` is
  NONcommutative the `CommRing`-valued `Matrix.det` does not typecheck; the Freudenthal cubic
  norm is the ℚ-valued replacement
      `jN d0 d1 d2 a b c :=`
      `  d0·d1·d2 − d0·|c|² − d1·|b|² − d2·|a|² + 2·reQ ((a·c)·star b)`.
  On the diagonal Cartan it is the product of the three real eigenvalues
  `jN d0 d1 d2 0 0 0 = d0·d1·d2` (`jN_diag`); the identity has unit norm `jN 1 1 1 0 0 0 = 1`
  (`jN_one`); a primitive frame idempotent has vanishing norm `jN 1 0 0 0 0 0 = 0` (`jN_frame0`,
  it is rank 1).

  ★★ THE WELL-DEFINEDNESS — THE STRUCTURAL HEADLINE. The trilinear cross-term
  `reQ ((a·c)·star b)` would, over a GENERIC nonassociative ring, depend on which factor the
  reduced-determinant cofactor expansion starts at. Here it is fully invariant:
    • BRACKETING-INDEPENDENT `reQ ((a·c)·star b) = reQ (a·(c·star b))` (`jN_cross_assoc`) —
      the real part does not see the associator;
    • CYCLIC `reQ ((a·c)·star b) = reQ ((c·star b)·a) = reQ ((star b·a)·c)`
      (`jN_cross_cyclic1`, `jN_cross_cyclic2`) — the three octonion factors rotate freely.
  BOTH are FORCED by the SAME two banked facts: the real part is trace-associative
  (`reQ_mul_assoc3`) and trace-commutative (`reQ_mul_comm`). This is the structural REASON the
  reduced determinant of a Hermitian matrix over the octonions is well-defined — the identical
  one-cause that made the calibration 3-form cyclic (N209/N210) — and it FAILS beyond the
  octonions (the sedenions lose the alternativity that trace-associativity rests on, N200): the
  cubic norm exists up to `O` and no further.

  THE ONE LAW REFRAME (docs/STANDARD.md; RUNBOOK W1). Nothing bashes octonion coordinates. `jN`
  is assembled from the banked scalar forms `gForm`/`reQ`; its diagonal and spectral values
  collapse by `simp` on the definitions; its well-definedness is two rewrites through the banked
  trace-associativity/commutativity lemmas — NO octonion coordinate ring, default heartbeats.

  THE MOAT (docs/STANDARD.md §0). The division-algebra-physics field POSITS `J₃(O)` and writes
  its cubic norm/determinant down by hand; here the carrier was DERIVED from the cascade (N5),
  the Born norm from N24, and the cubic norm's WELL-DEFINEDNESS — the fact that makes it a
  genuine invariant rather than an expression that depends on a bracketing convention — is
  DERIVED as a structural consequence of octonion trace-associativity. One cause (the real part
  is associative though the product is not), the well-defined cubic invariant, no posit.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete 'cubic-norm / determinant / Freudenthal /
  Albert / Jordan / eigenvalue / frame / idempotent / rank': what remains is — over the derived
  field ℚ and the Cayley–Dickson double `O ℚ = CD (H ℚ)`, for the ℚ-valued form
  `jN d0 d1 d2 a b c = d0·d1·d2 − d0·gForm c c − d1·gForm b b − d2·gForm a a + 2·reQ ((a·c)·star b)`,
  `jN d0 d1 d2 0 0 0 = d0·d1·d2`, `jN 1 1 1 0 0 0 = 1`, `jN 1 0 0 0 0 0 = 0`,
  `reQ ((a·c)·star b) = reQ (a·(c·star b)) = reQ ((c·star b)·a) = reQ ((star b·a)·c)`, and a
  nonzero off-diagonal witness `jN 0 0 0 1 1 1 = 2`; pure algebra over the derived field and the
  derived rung. No theorem statement carries a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.OctonionJordanTraceForm
import Phys.Algebra.OctonionAssociative3Form
import Phys.Algebra.DerivationCompact
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

/-! ### The cubic norm. -/

/-- ★ THE CUBIC NORM (the Freudenthal reduced determinant) of the general Hermitian matrix
    `Hm d0 d1 d2 a b c` over the terminal algebra `O ℚ`. Because `O ℚ` is NONcommutative the
    `CommRing`-valued `Matrix.det` does not typecheck; this ℚ-valued cubic form is the reduced
    determinant: `d0·d1·d2 − d0·|c|² − d1·|b|² − d2·|a|² + 2·Re((a·c)·b̄)`, where `gForm v v`
    is the octonion norm `|v|²` and `reQ` the real part. -/
noncomputable def jN (d0 d1 d2 : ℚ) (a b c : O ℚ) : ℚ :=
  d0 * d1 * d2
    - d0 * gForm c c
    - d1 * gForm b b
    - d2 * gForm a a
    + 2 * reQ ((a * c) * star b)

/-- `jN` on the diagonal Cartan is the product of the three real eigenvalues `d0·d1·d2`. -/
theorem jN_diag (d0 d1 d2 : ℚ) : jN d0 d1 d2 0 0 0 = d0 * d1 * d2 := by
  unfold jN gForm reQ
  simp

/-- The identity matrix has unit cubic norm `jN 1 1 1 0 0 0 = 1`. -/
theorem jN_one : jN 1 1 1 0 0 0 = 1 := by
  unfold jN gForm reQ; simp

/-- A primitive frame idempotent `E0` has vanishing cubic norm `jN 1 0 0 0 0 0 = 0` (rank 1). -/
theorem jN_frame0 : jN 1 0 0 0 0 0 = 0 := by
  unfold jN gForm reQ; simp

/-! ### THE WELL-DEFINEDNESS OF THE TRILINEAR CROSS-TERM — the structural headline. -/

/-- ★★ WELL-DEFINEDNESS (bracketing). The trilinear cross-term is bracketing-INDEPENDENT:
    `reQ ((a·c)·star b) = reQ (a·(c·star b))` — the real part does not see the associator.
    FORCED by octonion trace-associativity (`reQ_mul_assoc3`, N210). -/
theorem jN_cross_assoc (a b c : O ℚ) :
    reQ ((a * c) * star b) = reQ (a * (c * star b)) :=
  reQ_mul_assoc3 a c (star b)

/-- ★★ WELL-DEFINEDNESS (cyclic, step 1). The trilinear cross-term is invariant under a cyclic
    rotation of its three octonion factors: `reQ ((a·c)·star b) = reQ ((c·star b)·a)`. Forced by
    trace-associativity (`reQ_mul_assoc3`) then trace-commutativity (`reQ_mul_comm`). -/
theorem jN_cross_cyclic1 (a b c : O ℚ) :
    reQ ((a * c) * star b) = reQ ((c * star b) * a) := by
  rw [reQ_mul_assoc3 a c (star b), reQ_mul_comm a (c * star b)]

/-- ★★ WELL-DEFINEDNESS (cyclic, step 2). The other cyclic rotation:
    `reQ ((a·c)·star b) = reQ ((star b·a)·c)`. Forced by the same two banked facts. Together with
    `jN_cross_cyclic1` this is the full cyclic symmetry that makes the reduced determinant of a
    Hermitian matrix over the NONassociative octonions well-defined independent of the vertex the
    cofactor expansion starts at — the same one-cause (real-part trace-associativity) that made
    the calibration 3-form cyclic, failing beyond the octonions. -/
theorem jN_cross_cyclic2 (a b c : O ℚ) :
    reQ ((a * c) * star b) = reQ ((star b * a) * c) := by
  rw [reQ_mul_comm (a * c) (star b), reQ_mul_assoc3 (star b) a c]

/-! ### W8 anti-vacuity teeth — the cubic norm genuinely depends on the off-diagonal. -/

/-- W8 TEETH: a genuine off-diagonal contribution — the `(0,1)`-slot generator `a = 1` reduces
    the norm from the diagonal `2·2·2 = 8` to `8 − 2·1 = 6`. The cubic norm is NOT the trivial
    diagonal product. -/
theorem jN_witness_a : jN 2 2 2 1 0 0 = 6 := by
  unfold jN gForm reQ; simp; norm_num

/-- W8 TEETH: the PURE trilinear cross-term. With zero diagonal `jN 0 0 0 a b c = 2·reQ((a·c)·b̄)`;
    for `a = b = c = 1` this is `2` — the genuinely-cubic cross-term is nonzero and DISTINCT from
    the diagonal product `0`. -/
theorem jN_witness_cross : jN 0 0 0 1 1 1 = 2 := by
  unfold jN gForm reQ; simp

/-- W8 TEETH: the pure trilinear cross-term value is nonzero — the cubic norm carries genuine
    off-diagonal (non-diagonal) content. -/
theorem jN_witness_cross_ne : jN 0 0 0 1 1 1 ≠ 0 := by
  rw [jN_witness_cross]; norm_num

end Phys.Algebra.HJ
