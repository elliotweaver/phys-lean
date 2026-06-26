/-
  Phys.Algebra.LorentzContinuumDeflation — N70: THE DEFLATION / PEEL-OFF ENGINE — the inductive
  STEP of the full spectral existence theorem (peel one eigenpair, restrict to its EvC-orthogonal
  complement, recurse). Over the DERIVED ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)`.
  ===========================================================================
  THE NEXT FORCED NODE after the CONCRETE EIGENBASIS-EXISTENCE WITNESS node (N69). N49–N69 banked,
  over the derived ℝ `Cut`:
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
      + `EvC_add_left`/`EvC_add_right`/`IsEvCSymm_add`/`IsEvCSymm_smul` (N63);
    • the general/equal/full-unequal-diagonal `(t,x)`-plane eigenbasis `txOp` (N64–N65);
    • the FIRST concrete polar factorization `g = k·exp(p)` (N66);
    • the FIRST 10-dim-MIXING spectral square root + the RANK-3 spectral operator `specOp3` (N67);
    • ★ the GENERAL RANK-`n` spectral operator `specOpN l u := ∑ i, (l i)•projC (u i)` with
      `specOpN_apply`/`specOpN_isEvCSymm`/`specOpN_read`/`EvCLeft`/`EvCRight`, the bundled reference
      forms used for `map_sum`/`map_sub` (N68);
    • ★ the CONCRETE EIGENBASIS-EXISTENCE WITNESS — the coordinate (NON-eigen-form) time↔octonion-real
      mixing operator `txMix` PROVED `= specOpN ![9,4,25] mix3` (`txMix_eq_specOpN`), `mix3 := ![mixA,
      mixB,mixW3]` EvC-orthonormal (`mix3_orthonormal`), √(txMix) read off (`txMix_op_sqrt`) (N69).

  ── THE TARGET (N70) AND THE W3 DECOMPOSITION ──
  The ticket TARGET is the HEAVY group-manifold core: the FULL n-dim spectral EXISTENCE (that an
  ARBITRARY — not concretely-chosen — EvC-self-adjoint EvC-positive-semidefinite operator HAS an
  EvC-orthonormal eigen-family, so equals `specOpN c u` for some `c,u`), the GLOBAL polar/KAK assembly
  for an arbitrary `g`, connectedness, the GLOBAL reverse KAK surjectivity (`qvIsomMonoidC` on the
  connected component `≤ genIsomMonoidC2`), and the full `Spin(9)→SO(9)` exhaustion. MEASURE-FIRST
  (ROADMAP §N70 priority (i)) confirms: the EXISTENCE for an ARBITRARY operator over `Cut` (the
  eigenvalue/eigenvector EXTRACTION) and the connectedness/surjectivity/exhaustion each need
  group-manifold machinery Mathlib lacks over `Cut` — the genuine HEAVY sub-nodes (childed N71).

  ── THE IMMEDIATELY-BANKABLE STRUCTURAL ESCALATION (THE INDUCTIVE STEP) ──
  N63–N69 banked the FORWARD direction of the spectral theorem: GIVEN an EvC-orthonormal eigen-family
  (or, in N69, a concrete coordinate operator already shown to BE diagonal over a given family), the
  diagonal operator `Σᵢ λᵢ Pᵢ` and its `cutSqrt`-per-eigenprojection square root, at every finite
  rank. The MISSING HALF — the engine that an existence proof actually runs — is the REVERSE STEP: the
  spectral theorem is proved by INDUCTION on dimension, and its inductive step is DEFLATION (peel one
  eigenpair off, restrict to its EvC-orthogonal complement, recurse on a strictly smaller space). The
  roadmap's named priority-(i) lever is precisely "formulate the inductive 'peel off one eigenpair,
  restrict to its EvC-orthogonal complement, recurse' step." This node banks that engine — fully
  general for ANY EvC-self-adjoint operator and ANY unit eigenpair, with NO eigenbasis given in
  advance: it is the structural machine that CONSUMES one eigenpair and PRODUCES a strictly smaller
  sub-problem, the half of the existence proof N63–N69 did not have.

  ── THE TRUNK REFRAME (THE ONE LAW): deflation IS subtracting the trunk eigenprojection ──
  Given an EvC-self-adjoint `g` and a unit eigenpair `(l, u)` (`EvC u u = 1`, `g u = l • u`), define
      `deflateC g l u := g − l • projC u`
  (the banked EvC-orthogonal eigenprojection `projC u`, N63). The three structural facts that ARE the
  complete inductive step:
    (1) `deflateC g l u` is still EvC-self-adjoint (`g` is, and `projC u` is, and self-adjointness is
        closed under `−`/`•` — the bundled reference forms `EvCLeft`/`EvCRight` give `map_sub`, N68);
    (2) it ANNIHILATES the peeled eigenvector: `deflateC g l u u = g u − (l·EvC u u)•u = l•u − l•u = 0`
        (the eigenvector leaves the picture — the rank drops by one);
    (3) its ENTIRE IMAGE is EvC-orthogonal to `u`: `EvC u (deflateC g l u w) = 0` for ALL `w`. By the
        preserved self-adjointness, `EvC u (deflateC g l u w) = EvC (deflateC g l u u) w = EvC 0 w = 0`.
        So the EvC-orthogonal complement of `u` is an INVARIANT subspace — the recursion stays inside a
        strictly smaller space, and the spectral existence proof descends by induction on dimension.
  Nothing posited: each fact is forced linear algebra over the trunk reference form `EvC` (N58, itself
  the Born self-overlap positivity N56) and the trunk eigenprojection `projC` (N63), over the DERIVED
  ℝ `Cut`. The concrete rank-`n` reduction `deflateC (specOpN l u) (l k) (u k) = specOpN (l[k←0]) u`
  turns the crank visibly — deflating the rank-`n` spectral operator at its `k`-th eigenpair zeroes
  coefficient `k`, lowering the effective rank — and on N69's coordinate witness, `deflateC txMix 9 mixA
  = specOpN ![0,4,25] mix3` peels the `mixA` eigenvalue `9` off the 10-dim-mixing operator.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    EvC_sub_left/_right   — `EvC` is additive over subtraction in each slot (`map_sub` of the bundled
                            `EvCLeft`/`EvCRight`, N68) — the bilinearity `deflateC`'s symmetry needs.
    IsEvCSymm_sub         — EvC-self-adjointness is closed under `−` (the operator-structure closure
                            completing `IsEvCSymm_add`/`IsEvCSymm_smul` of N63).
    EvC_zero_left         — `EvC 0 w = 0` (the reference form vanishes on the zero vector).
    deflateC g l u        — ★ THE DEFLATED OPERATOR `g − l • projC u` — the inductive-step machine.
    deflateC_apply        — its action `p ↦ g p − (l · EvC u p) • u`.
    deflateC_isEvCSymm    — (1) EvC-self-adjointness PRESERVED for any EvC-self-adjoint `g`.
    deflateC_eigen_kills  — (2) ANNIHILATES the peeled eigenvector for a UNIT eigenpair.
    deflateC_image_orth   — (3) ★★ THE RECURSION ENABLER: the entire image is EvC-orthogonal to `u`,
                            so its EvC-orthogonal complement is invariant — the inductive descent.
    deflateC_specOpN      — ★ THE RANK-`n` REDUCTION: deflating `specOpN l u` at its `k`-th eigenpair
                            zeroes coefficient `k` (`= specOpN (Function.update l k 0) u`) — the crank
                            rank-`n` → rank-`(n−1)`, the inductive step on the spectral operator itself.
    deflateC_txMix_fst    — ★ NON-VACUITY (W8): on N69's coordinate witness, `deflateC txMix 9 mixA
                            = specOpN ![0,4,25] mix3` — the `mixA` eigenvalue `9` peeled off the genuine
                            10-dim-mixing operator, lowering its effective rank.

  ── THE W1 HEAVY REMAINDER (childed N71, an honest dissolution ticket, NOT closed here) ──
  The FULL n-dim spectral EXISTENCE — that an ARBITRARY EvC-self-adjoint EvC-positive-semidefinite
  operator HAS an EvC-orthonormal eigen-family (the eigenvalue/eigenvector EXTRACTION that SEEDS the
  deflation recursion — producing the FIRST eigenpair from nothing, no Mathlib analogue over `Cut`),
  assembled by induction on dimension USING this deflation engine — + the GLOBAL polar/KAK assembly for
  an arbitrary `g` + the compact part via CONNECTEDNESS + the GLOBAL reverse KAK surjectivity + the full
  `Spin(9)→SO(9)` exhaustion are the genuine HEAVY group-manifold core, childed onto the chain tail.
  THIS node banks the INDUCTIVE STEP of the existence proof: given one eigenpair, deflation produces a
  strictly smaller invariant sub-problem — the engine the full existence runs on, the missing reverse
  half of what N63–N69 banked forward.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That the spectral theorem is proved by deflation —
  peel an eigenpair, restrict to its orthogonal complement, recurse — is standard linear algebra. Here
  the deflated operator, its preserved self-adjointness, its annihilation of the eigenvector, the
  orthogonality of its image to the peeled direction, and the rank-`n` reduction DESCEND from the banked
  EvC-orthogonal eigenprojection `projC` (N63) + the reference form `EvC` (N58, itself the Born
  self-overlap positivity N56) + the rank-`n` spectral operator `specOpN` (N68) + the coordinate witness
  `txMix` (N69) over the DERIVED ℝ `Cut` and `O Cut` — NO posited operator calculus, NO Mathlib spectral
  theory, NO posited inner product, NO Mathlib ℝ/ℂ as content. `Module.End`, `LinearMap`, `Function.update`,
  `Finset.sum`, `map_sub` are standard Mathlib MACHINERY operating on the DERIVED objects.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / spectral /
  eigenspace / eigenvalue / eigenvector / eigenprojection / eigenbasis / eigenpair / eigen-family /
  deflation / peel-off / diagonal / orthonormal / self-adjoint / positive-semidefinite / isometry /
  Spin / SO(9) / KAK / polar / Cartan / invariant / recursion / dimension / rank": what remains is the
  theorem that, over the derived complete ordered field `Cut` and the Cayley–Dickson double³ `O Cut`,
  for the symmetric bilinear form `EvC`, the `Cut`-linear `projC u := p ↦ (EvC u p)•u`, and the
  `Cut`-linear map `deflateC g l u := g − l • projC u`: `deflateC g l u` is `EvC`-symmetric when `g` is;
  for `EvC u u = 1` and `g u = l • u` it sends `u` to `0` and satisfies `EvC u (deflateC g l u w) = 0`
  for all `w`; and `deflateC (specOpN l u) (l k) (u k) = specOpN (Function.update l k 0) u`, with
  `deflateC txMix 9 mixA = specOpN ![0,4,25] ![mixA,mixB,mixW3]`. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, a fully proved derivation,
  NO Mathlib number-system content import (the continuum is the DERIVED `Cut`), NO posited Lorentz
  group, NO posited operator calculus / spectral theorem, NO Mathlib ℝ/ℂ as content.
-/
import Phys.Algebra.LorentzContinuumSpectralExist

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section
open scoped BigOperators

/-! ## The reference form over subtraction, the zero vector, and self-adjointness closure under `−`. -/

/-- `EvC` is additive over subtraction in the left slot: `EvC (p₁ − p₂) q = EvC p₁ q − EvC p₂ q`.
    The bilinearity of the reference form, lifted through the bundled `Cut`-linear map `EvCLeft` (N68)
    via `map_sub`. -/
theorem EvC_sub_left (p₁ p₂ q : STVC) : EvC (p₁ - p₂) q = EvC p₁ q - EvC p₂ q :=
  map_sub (EvCLeft q) p₁ p₂

/-- `EvC` is additive over subtraction in the right slot: `EvC p (q₁ − q₂) = EvC p q₁ − EvC p q₂`. -/
theorem EvC_sub_right (p q₁ q₂ : STVC) : EvC p (q₁ - q₂) = EvC p q₁ - EvC p q₂ :=
  map_sub (EvCRight p) q₁ q₂

/-- `EvC 0 w = 0` — the reference form vanishes on the zero vector in its left slot. -/
theorem EvC_zero_left (w : STVC) : EvC (0 : STVC) w = 0 := by
  show (0:Cut) * w.1 + (0:Cut) * w.2.1 + gFormC (0 : O Cut) w.2.2 = 0
  rw [gFormC_zero_left]; ring

/-- EvC-self-adjointness is closed under subtraction: `IsEvCSymm S → IsEvCSymm T → IsEvCSymm (S − T)`.
    The operator-structure closure completing N63's `IsEvCSymm_add`/`IsEvCSymm_smul` — what makes the
    deflated operator `g − l • projC u` self-adjoint when both summands are. -/
theorem IsEvCSymm_sub {S T : Module.End Cut STVC} (hS : IsEvCSymm S) (hT : IsEvCSymm T) :
    IsEvCSymm (S - T) := by
  intro p q
  rw [LinearMap.sub_apply, LinearMap.sub_apply, EvC_sub_left, EvC_sub_right, hS, hT]

/-! ## The deflated operator — the inductive-step machine of the spectral existence theorem. -/

/-- ★ THE DEFLATED OPERATOR `deflateC g l u := g − l • projC u` — the inductive STEP of the spectral
    existence theorem. Given an EvC-self-adjoint operator `g` and a unit eigenpair `(l, u)`, deflation
    subtracts the banked EvC-orthogonal eigenprojection `l • projC u` (N63), removing the peeled
    eigenvalue/eigenvector and leaving an operator on the EvC-orthogonal complement of `u` — the
    strictly-smaller sub-problem the existence proof recurses on. The REVERSE engine to N63–N69's
    forward `Σᵢ λᵢ Pᵢ` assembly: an operator + one eigenpair ⇒ a smaller operator. -/
def deflateC (g : Module.End Cut STVC) (l : Cut) (u : STVC) : Module.End Cut STVC :=
  g - l • projC u

/-- The deflated operator acts as `p ↦ g p − (l · EvC u p) • u`. -/
theorem deflateC_apply (g : Module.End Cut STVC) (l : Cut) (u p : STVC) :
    deflateC g l u p = g p - (l * EvC u p) • u := by
  show (g - l • projC u) p = _
  rw [LinearMap.sub_apply, LinearMap.smul_apply, projC_apply, smul_smul]

/-- (1) EvC-SELF-ADJOINTNESS PRESERVED: for any EvC-self-adjoint `g`, the deflated operator
    `deflateC g l u` is EvC-self-adjoint (`g` is, `projC u` is `projC_isEvCSymm`, and self-adjointness
    is closed under `−`/`•` — `IsEvCSymm_sub`/`IsEvCSymm_smul`). The inductive step stays inside the
    self-adjoint class. -/
theorem deflateC_isEvCSymm {g : Module.End Cut STVC} (hg : IsEvCSymm g) (l : Cut) (u : STVC) :
    IsEvCSymm (deflateC g l u) :=
  IsEvCSymm_sub hg (IsEvCSymm_smul l (projC_isEvCSymm u))

/-- (2) ANNIHILATES THE PEELED EIGENVECTOR: for a UNIT eigenpair (`EvC u u = 1`, `g u = l • u`),
    `deflateC g l u u = g u − (l · EvC u u) • u = l • u − l • u = 0`. The peeled eigenvector leaves the
    picture — the effective rank drops by one. -/
theorem deflateC_eigen_kills {g : Module.End Cut STVC} {l : Cut} {u : STVC}
    (hu : EvC u u = 1) (heig : g u = l • u) :
    deflateC g l u u = 0 := by
  rw [deflateC_apply, heig, hu, mul_one]
  abel

/-- (3) ★★ THE RECURSION ENABLER: the ENTIRE IMAGE of `deflateC g l u` is EvC-orthogonal to the peeled
    direction `u` — `EvC u (deflateC g l u w) = 0` for ALL `w`. By the preserved self-adjointness,
    `EvC u (deflateC g l u w) = EvC (deflateC g l u u) w = EvC 0 w = 0` (using `deflateC_eigen_kills`).
    So the EvC-orthogonal complement of `u` is an INVARIANT subspace: the deflated operator restricts to
    it, and the spectral existence proof descends by induction on dimension. This is exactly the
    inductive step "peel one eigenpair, restrict to its EvC-orthogonal complement, recurse." -/
theorem deflateC_image_orth {g : Module.End Cut STVC} {l : Cut} {u : STVC}
    (hg : IsEvCSymm g) (hu : EvC u u = 1) (heig : g u = l • u) (w : STVC) :
    EvC u (deflateC g l u w) = 0 := by
  have hsa := deflateC_isEvCSymm hg l u
  rw [← hsa u w, deflateC_eigen_kills hu heig, EvC_zero_left]

/-! ## The rank-`n` reduction — turning the inductive crank on the spectral operator itself. -/

/-- ★ THE RANK-`n` REDUCTION: deflating the general rank-`n` spectral operator `specOpN l u` (N68) at
    its `k`-th eigenpair zeroes coefficient `k` — `deflateC (specOpN l u) (l k) (u k) =
    specOpN (Function.update l k 0) u`. The crank rank-`n` → rank-`(n−1)`: removing the `k`-th
    eigenprojection from the spectral sum leaves the same sum with eigenvalue `k` set to `0`. The
    inductive step realized on the spectral operator itself (no orthonormality needed — pure
    `Finset.sum` bookkeeping over `projC`). -/
theorem deflateC_specOpN {n : ℕ} (l : Fin n → Cut) (u : Fin n → STVC) (k : Fin n) :
    deflateC (specOpN l u) (l k) (u k) = specOpN (Function.update l k 0) u := by
  have hfun : (fun i => (Function.update l k 0 i) • projC (u i))
      = Function.update (fun i => l i • projC (u i)) k 0 := by
    funext i
    by_cases hik : i = k
    · subst hik; simp
    · rw [Function.update_of_ne hik, Function.update_of_ne hik]
  show specOpN l u - l k • projC (u k) = ∑ i, (Function.update l k 0 i) • projC (u i)
  rw [hfun, Finset.sum_update_of_mem (Finset.mem_univ k), specOpN,
    ← Finset.add_sum_erase _ (fun i => l i • projC (u i)) (Finset.mem_univ k), Finset.erase_eq]
  abel

/-! ## Non-vacuity (W8) — deflating N69's 10-dim-mixing coordinate witness. -/

/-- ★ NON-VACUITY (W8): deflating N69's coordinate (NON-eigen-form) time↔octonion-real mixing operator
    `txMix` at its `mixA` eigenpair (eigenvalue `9`) peels that eigenvalue off — `deflateC txMix 9 mixA
    = specOpN ![0,4,25] mix3` — lowering the effective rank of the genuine 10-dim-mixing operator to the
    remaining `{mixB (4), mixW3 (25)}`. The inductive step applied to a concrete operator NOT presented
    in eigen-form: through the existence identification `txMix = specOpN ![9,4,25] mix3` (N69), the
    rank-`n` reduction `deflateC_specOpN` zeroes the first coefficient. -/
theorem deflateC_txMix_fst :
    deflateC txMix (9:Cut) mixA = specOpN ![(0:Cut),4,25] mix3 := by
  have h := deflateC_specOpN ![(9:Cut),4,25] mix3 0
  rw [show (specOpN (Function.update ![(9:Cut),4,25] 0 0) mix3) = specOpN ![(0:Cut),4,25] mix3 from by
        congr 1; funext i; fin_cases i <;> simp [Function.update]] at h
  rw [txMix_eq_specOpN]
  exact h

end

end Phys.Algebra
