/-
  Phys.Algebra.LorentzContinuumEigenExtract — N71: THE SEED EIGENPAIR EXTRACTION — the genuine
  VECTOR eigen-equation that DRIVES the N70 deflation induction, and the first NON-VACUOUS firing
  of the N70 deflation / peel-off engine on a concrete coordinate operator. Over the DERIVED ℝ `Cut`
  and the terminal algebra `O Cut := CD (H Cut)`.
  ===========================================================================
  THE NEXT FORCED NODE after the DEFLATION / PEEL-OFF ENGINE node (N70). N49–N70 banked, over the
  derived ℝ `Cut`:
    • the continuum Born form `QvC`, the isometry monoid `qvIsomMonoidC` (N49), `gFormC_comp` (N50);
    • the tangent Lie algebra `infIsomLieAlg` + `BvC` + `boostGenC`/`rotGenC a` (N51);
    • the FORWARD soundness `genIsomMonoidC2 ≤ qvIsomMonoidC` with `biMulFun u u'` (N52–N55);
    • the BORN POSITIVITY `gFormC_nonneg` + the (1,9) signature split (N56);
    • the POSITIVE-DEFINITE SCALAR square root `cutSqrt` (N57);
    • the INFINITESIMAL CARTAN reference form `EvC` + `EvC_symm`/`EvC_smul_*` (N58);
    • the OPERATOR FORM-ADJOINT `IsEvCAdjoint` + `comp_nonneg` (N59);
    • the POSITIVE OPERATOR SQUARE-ROOT predicate `IsEvCOpSqrt` + the scalar root (N60);
    • the 2-block / octonion-internal coordinate-diagonal operator square roots (N61–N62);
    • the EvC-ORTHOGONAL EIGENPROJECTION `projC` + the rank-2 rotated-basis spectral operator `specOp`
      + `IsEvCSymm_add`/`IsEvCSymm_smul` (N63);
    • the general/equal/full-unequal-diagonal `(t,x)`-plane eigenbasis `txOp` (N64–N65);
    • the FIRST concrete polar factorization `g = k·exp(p)` (N66);
    • the FIRST 10-dim-MIXING spectral square root + the RANK-3 spectral operator `specOp3` (N67);
    • ★ the GENERAL RANK-`n` spectral operator `specOpN l u := ∑ i, (l i)•projC (u i)` with
      `specOpN_apply`/`specOpN_isEvCSymm`/`specOpN_read` (the eigenblock QUADRATIC reader) (N68);
    • ★ the CONCRETE EIGENBASIS-EXISTENCE WITNESS — the coordinate (NON-eigen-form) operator
      `txMix` PROVED `= specOpN ![9,4,25] mix3` (`txMix_eq_specOpN`), `mix3 := ![mixA,mixB,mixW3]`
      EvC-orthonormal (`mix3_orthonormal`), √(txMix) read off (`txMix_op_sqrt`) (N69);
    • ★ the DEFLATION / PEEL-OFF ENGINE — `deflateC g l u := g − l • projC u` with
      `deflateC_eigen_kills` (kills a UNIT eigenpair), `deflateC_image_orth` (image EvC-orthogonal to
      the peeled direction — the recursion enabler), `deflateC_specOpN`/`deflateC_txMix_fst` (N70).

  ── THE TARGET (N71) AND THE W3 DECOMPOSITION ──
  The ticket TARGET is the HEAVY group-manifold core: the FULL n-dim spectral EXISTENCE (that an
  ARBITRARY EvC-self-adjoint EvC-positive-semidefinite operator HAS an EvC-orthonormal eigenbasis),
  the GLOBAL polar/KAK assembly, connectedness, the GLOBAL reverse KAK surjectivity, and the full
  `Spin(9)→SO(9)` exhaustion. MEASURE-FIRST (ROADMAP §N71 priority (i)) confirms: producing the seed
  eigenpair from an ARBITRARY operator with NO given eigenbasis (the characteristic-equation /
  fixed-point root-finding over `Cut`), assembling the full deflation induction to general `n`, and
  the connectedness/surjectivity/exhaustion each need group-manifold machinery Mathlib lacks over
  `Cut` — the genuine HEAVY sub-nodes (childed N72).

  ── THE IMMEDIATELY-BANKABLE STRUCTURAL ESCALATION (THE SEED EIGENPAIR — THE MISSING JOINT) ──
  N68 banked the eigenblock QUADRATIC reader `specOpN_read : EvC (specOpN l u (u k)) (u k) = l k` —
  the scalar/quadratic-form value at an eigenblock. The chain NEVER banked the genuine VECTOR
  eigen-equation `specOpN l u (u k) = (l k) • (u k)`. This matters because N70's deflation engine —
  `deflateC_eigen_kills` and `deflateC_image_orth`, the entire inductive step — BOTH take the VECTOR
  eigen-equation `g u = l • u` as a HYPOTHESIS, and NOTHING in N49–N70 produces a concrete operator
  satisfying it. So the N70 deflation engine, though proved, had never FIRED: the joint between the
  rank-`n` spectral operator (N68) / the concrete witness `txMix` (N69) and the deflation step (N70)
  was missing. This node banks that joint — the SEED eigenpair extraction in the form the deflation
  engine consumes — and FIRES the N70 deflation engine NON-VACUOUSLY on N69's concrete coordinate
  operator `txMix`, exhibiting the inductive descent on a real operator: peel `mixA` (eigenvalue `9`),
  and the surviving operator still has `mixB` (eigenvalue `4`) as an eigenpair.

  ── THE TRUNK REFRAME (THE ONE LAW): the eigen-equation IS the orthonormality collapse ──
  For an EvC-orthonormal family `{u i}` (`EvC (u i) (u j) = δᵢⱼ`, N69 `mix3_orthonormal` /
  N68 setting), the rank-`n` spectral operator acts on its own `k`-th eigenvector by collapsing the
  sum to its diagonal term: `specOpN l u (u k) = ∑ i, (l i · EvC (u i) (u k)) • u i = (l k) • (u k)`
  (`Finset.sum_eq_single` on the orthonormality matrix). NO Mathlib spectral theory, NO posited
  operator calculus: the eigen-equation is forced linear algebra over the trunk reference form `EvC`
  (N58, itself the Born self-overlap positivity N56) and the eigenprojection `projC` (N63), over the
  DERIVED ℝ `Cut`. Through N69's existence identification `txMix = specOpN ![9,4,25] mix3`, the
  concrete operator `txMix` inherits the eigenpairs `(9, mixA)`, `(4, mixB)`, `(25, mixW3)` in genuine
  VECTOR form — the seed eigenpairs that satisfy exactly the hypothesis the N70 deflation engine takes.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    specOpN_eigen           — ★ THE GENERAL VECTOR EIGEN-EQUATION: for an EvC-orthonormal family,
                              `specOpN l u (u k) = (l k) • (u k)`. NEW — the chain had only the
                              quadratic reader `specOpN_read`; this is the genuine vector eigenpair,
                              the seed the deflation engine consumes.
    txMix_isEvCSymm         — `txMix` is EvC-self-adjoint (through `txMix_eq_specOpN`).
    txMix_eigen_mixA/_mixB/_mixW3 — ★ the concrete VECTOR eigenpairs of N69's coordinate operator:
                              `txMix mixA = 9•mixA`, `txMix mixB = 4•mixB`, `txMix mixW3 = 25•mixW3`.
    txMix_deflate_kills_mixA — ★★ N70 `deflateC_eigen_kills` FIRES NON-VACUOUSLY: `deflateC txMix 9 mixA
                              mixA = 0` — the eigen-equation hypothesis is now SATISFIED, so the peeled
                              eigenvector genuinely leaves the picture on a concrete operator.
    txMix_deflate_image_orth — ★★ N70 `deflateC_image_orth` FIRES NON-VACUOUSLY: `EvC mixA
                              (deflateC txMix 9 mixA w) = 0` for ALL `w` — the EvC-orthogonal complement
                              of `mixA` is an INVARIANT subspace of the deflated concrete operator.
    txMix_deflate_eigen_mixB — ★★ THE INDUCTIVE DESCENT REALIZED: after peeling `mixA`, the eigenpair
                              `mixB` SURVIVES in the deflated operator — `deflateC txMix 9 mixA mixB =
                              4•mixB` — exactly the recursion step "peel one, the rest survive on the
                              complement," now on a concrete 10-dim-mixing operator. The N68→N69→N70
                              joint completed: rank-`n` operator → concrete witness → deflation FIRES.

  ── THE W1 HEAVY REMAINDER (childed N72, an honest dissolution ticket, NOT closed here) ──
  Producing the seed eigenpair from an ARBITRARY operator with NO given eigenbasis (the
  characteristic-equation / fixed-point root-finding route over `Cut`, no Mathlib analogue) +
  assembling the full deflation induction over `deflateC` to general `n` (existence) + the GLOBAL
  polar/KAK assembly + the compact part via CONNECTEDNESS + the GLOBAL reverse KAK surjectivity + the
  full `Spin(9)→SO(9)` exhaustion are the genuine HEAVY group-manifold core, childed onto the chain
  tail. THIS node banks the SEED eigenpair in the form the deflation engine consumes and exhibits the
  inductive descent firing on a concrete operator — the joint that was missing between N68/N69 and N70.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That a self-adjoint operator acts on its
  eigenvector by scalar multiplication, and that deflation peels an eigenpair leaving the rest on the
  orthogonal complement, is standard linear algebra. Here the vector eigen-equation, the concrete
  eigenpairs of the coordinate operator `txMix`, and the non-vacuous firing of the deflation engine
  DESCEND from the banked `specOpN`/`specOpN_apply` (N68) + the eigenprojection `projC` (N63) + the
  reference form `EvC` (N58, itself the Born self-overlap positivity N56) + the witness `txMix` (N69)
  + the deflation engine `deflateC` (N70) over the DERIVED ℝ `Cut` and `O Cut` — NO posited operator
  calculus, NO Mathlib spectral theory, NO posited inner product, NO Mathlib ℝ/ℂ as content.
  `Module.End`, `LinearMap`, `Finset.sum_eq_single` are standard Mathlib MACHINERY on the DERIVED
  objects.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / spectral /
  eigenspace / eigenvalue / eigenvector / eigenpair / eigenbasis / eigen-family / eigen-equation /
  deflation / peel-off / diagonal / orthonormal / self-adjoint / invariant / mixing / dimension /
  rank / seed / extraction / descent": what remains is the theorem that, over the derived complete
  ordered field `Cut` and the Cayley–Dickson double³ `O Cut`, for the symmetric bilinear form `EvC`,
  the `Cut`-linear `specOpN l u := ∑ i, (l i)•projC (u i)`, and `deflateC g l u := g − l • projC u`:
  for a family with `EvC (u i)(u j) = δᵢⱼ`, `specOpN l u (u k) = (l k)•(u k)`; `txMix mixA = 9•mixA`,
  `txMix mixB = 4•mixB`, `txMix mixW3 = 25•mixW3`; `deflateC txMix 9 mixA mixA = 0`;
  `EvC mixA (deflateC txMix 9 mixA w) = 0` for all `w`; and `deflateC txMix 9 mixA mixB = 4•mixB`.
  No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, a fully proved derivation,
  NO Mathlib number-system content import (the continuum is the DERIVED `Cut`), NO posited Lorentz
  group, NO posited operator calculus / spectral theorem, NO Mathlib ℝ/ℂ as content.
-/
import Phys.Algebra.LorentzContinuumDeflation

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section
open scoped BigOperators

/-! ## The general vector eigen-equation — the seed the deflation engine consumes. -/

/-- ★ THE GENERAL VECTOR EIGEN-EQUATION: for a mutually-EvC-orthonormal eigen-family `{u i}`
    (`EvC (u i) (u j) = δᵢⱼ`), the rank-`n` spectral operator `specOpN l u` (N68) acts on its own
    `k`-th eigenvector by scalar multiplication — `specOpN l u (u k) = (l k) • (u k)`. The chain had
    only the eigenblock QUADRATIC reader `specOpN_read` (`EvC (specOpN l u (u k)) (u k) = l k`); this
    is the genuine VECTOR eigenpair, exactly the hypothesis `g u = l • u` the N70 deflation engine
    (`deflateC_eigen_kills`/`deflateC_image_orth`) consumes. The off-diagonal terms vanish by the
    orthonormality matrix, collapsing the spectral sum to its diagonal term (`Finset.sum_eq_single`). -/
theorem specOpN_eigen {n : ℕ} {l : Fin n → Cut} {u : Fin n → STVC}
    (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) (k : Fin n) :
    specOpN l u (u k) = (l k) • (u k) := by
  rw [specOpN_apply]
  rw [Finset.sum_eq_single k]
  · rw [horth k k]; simp
  · intro i _ hik
    rw [horth i k, if_neg hik]; simp
  · intro hk; exact absurd (Finset.mem_univ k) hk

/-! ## The concrete operator `txMix` is self-adjoint and has explicit vector eigenpairs. -/

/-- `txMix` (N69's coordinate, NON-eigen-form operator) is EvC-self-adjoint — through the existence
    identification `txMix = specOpN ![9,4,25] mix3` (N69) and `specOpN_isEvCSymm` (N68). The
    self-adjointness hypothesis the deflation `deflateC_image_orth` needs. -/
theorem txMix_isEvCSymm : IsEvCSymm txMix := by
  rw [txMix_eq_specOpN]; exact specOpN_isEvCSymm _ _

/-- ★ THE CONCRETE VECTOR EIGENPAIR `(9, mixA)`: `txMix mixA = 9 • mixA`. N69's coordinate operator,
    written purely in `(t,x,v)` coordinates with no projection, acts on the explicit mixing direction
    `mixA` (coupling time to the octonion-real axis `1₍O₎`) by scalar `9` — the seed eigenpair in
    genuine vector form, through `txMix_eq_specOpN` + `specOpN_eigen` + `mix3_orthonormal`. -/
theorem txMix_eigen_mixA : txMix mixA = (9:Cut) • mixA := by
  have h := specOpN_eigen (l := ![(9:Cut),4,25]) (u := mix3) mix3_orthonormal 0
  rw [txMix_eq_specOpN]
  simpa [mix3] using h

/-- ★ THE CONCRETE VECTOR EIGENPAIR `(4, mixB)`: `txMix mixB = 4 • mixB`. -/
theorem txMix_eigen_mixB : txMix mixB = (4:Cut) • mixB := by
  have h := specOpN_eigen (l := ![(9:Cut),4,25]) (u := mix3) mix3_orthonormal 1
  rw [txMix_eq_specOpN]
  simpa [mix3] using h

/-- ★ THE CONCRETE VECTOR EIGENPAIR `(25, mixW3)`: `txMix mixW3 = 25 • mixW3` (the pure-space unit). -/
theorem txMix_eigen_mixW3 : txMix mixW3 = (25:Cut) • mixW3 := by
  have h := specOpN_eigen (l := ![(9:Cut),4,25]) (u := mix3) mix3_orthonormal 2
  rw [txMix_eq_specOpN]
  simpa [mix3] using h

/-! ## The N70 deflation engine FIRES non-vacuously on the concrete operator. -/

/-- ★★ N70 `deflateC_eigen_kills` FIRES NON-VACUOUSLY: `deflateC txMix 9 mixA mixA = 0`. The
    deflation engine of N70 took `g u = l • u` as an unfulfilled hypothesis; now `txMix_eigen_mixA`
    SATISFIES it, so the peeled eigenvector `mixA` genuinely leaves the picture on the concrete
    coordinate operator `txMix` — the inductive step's rank-drop, realized. -/
theorem txMix_deflate_kills_mixA : deflateC txMix (9:Cut) mixA mixA = 0 := by
  have hu : EvC mixA mixA = 1 := by have := mix3_orthonormal 0 0; simpa [mix3] using this
  exact deflateC_eigen_kills hu txMix_eigen_mixA

/-- ★★ N70 `deflateC_image_orth` FIRES NON-VACUOUSLY: the ENTIRE IMAGE of `deflateC txMix 9 mixA` is
    EvC-orthogonal to the peeled direction `mixA` — `EvC mixA (deflateC txMix 9 mixA w) = 0` for ALL
    `w`. So the EvC-orthogonal complement of `mixA` is an INVARIANT subspace of the deflated concrete
    operator — the recursion enabler, the inductive descent on dimension, realized on a real operator. -/
theorem txMix_deflate_image_orth (w : STVC) :
    EvC mixA (deflateC txMix (9:Cut) mixA w) = 0 := by
  have hu : EvC mixA mixA = 1 := by have := mix3_orthonormal 0 0; simpa [mix3] using this
  exact deflateC_image_orth txMix_isEvCSymm hu txMix_eigen_mixA w

/-- ★★ THE INDUCTIVE DESCENT REALIZED: after peeling the `mixA` eigenpair (eigenvalue `9`), the
    eigenpair `(4, mixB)` SURVIVES in the deflated operator — `deflateC txMix 9 mixA mixB = 4 • mixB`.
    Exactly the recursion step "peel one eigenpair, the rest survive on the EvC-orthogonal complement,"
    now exhibited on a concrete 10-dim-mixing operator: through N70's rank-`n` reduction
    `deflateC_txMix_fst` (`deflateC txMix 9 mixA = specOpN ![0,4,25] mix3`) the deflated operator is
    again a rank-`n` spectral operator, on which `specOpN_eigen` reads `mixB`'s surviving eigenvalue
    `4`. The N68→N69→N70 joint completed and turned one full crank of the existence induction. -/
theorem txMix_deflate_eigen_mixB : deflateC txMix (9:Cut) mixA mixB = (4:Cut) • mixB := by
  rw [deflateC_txMix_fst]
  have h := specOpN_eigen (l := ![(0:Cut),4,25]) (u := mix3) mix3_orthonormal 1
  simpa [mix3] using h

end

end Phys.Algebra
