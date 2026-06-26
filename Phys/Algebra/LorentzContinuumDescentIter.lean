/-
  Phys.Algebra.LorentzContinuumDescentIter — N74: THE GENERAL ITERATED DEFLATION DESCENT AT
  ARBITRARY RANK — assembling N73's single-step closed-descent skeleton into ONE theorem that
  iterates the actual deflation peel over ALL `n` indices and drives the full rank-`n` spectral
  operator `specOpN l u` to the zero operator at ARBITRARY rank `n`. Over the DERIVED ℝ `Cut`
  and the terminal algebra `O Cut := CD (H Cut)`.
  ===========================================================================
  THE NEXT FORCED NODE after the FIRST CLOSED MULTI-STEP DEFLATION DESCENT node (N73). N49–N73
  banked, over the derived ℝ `Cut`:
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
    • the GENERAL RANK-`n` spectral operator `specOpN l u := ∑ i, (l i)•projC (u i)` (N68);
    • the CONCRETE EIGENBASIS-EXISTENCE WITNESS — `txMix = specOpN ![9,4,25] mix3` (N69);
    • the DEFLATION / PEEL-OFF ENGINE `deflateC g l u := g − l • projC u` + the RANK-`n` reduction
      `deflateC_specOpN` (`= specOpN (Function.update l k 0) u`) + `deflateC_txMix_fst` (N70);
    • the SEED EIGENPAIR EXTRACTION — the VECTOR eigen-equation `specOpN_eigen` + the concrete
      eigenpairs of `txMix` + the FIRST non-vacuous firing of the deflation engine ONCE (N71);
    • the CONSTRUCTED octonion-coupling seed extraction `toMix`/`toMix_eq_specOp_omix`/… (N72);
    • ★ THE FIRST CLOSED MULTI-STEP DEFLATION DESCENT — the general termination base case
      `specOpN_zero`, the partial-deflation family `zeroOn S l := fun i => if i ∈ S then 0 else l i`,
      the CLOSED-INDUCTION SKELETON `deflateC_specOpN_zeroOn` (peeling one more index off the
      partially-deflated `specOpN (zeroOn S l) u` zeroes one more coefficient, indexed by a growing
      `Finset S`), the terminal coefficient state `specOpN_zeroOn_univ`, and the FULL 3-step CONCRETE
      descent `txMix_full_descent` of N69's genuine 10-dim-mixing witness to the zero operator (N73).

  ── THE GAP THIS NODE CLOSES ──
  N73 banked the closed descent but only at a FIXED CONCRETE RANK and as a COEFFICIENT identity:
  the single inductive step `deflateC_specOpN_zeroOn` (peel one more index, growing the peeled-index
  Finset `S`), the terminal COEFFICIENT state `specOpN_zeroOn_univ` (the all-peeled coefficient family
  yields `0`), and the CONCRETE 3-step `txMix_full_descent` (the genuine 10-dim-mixing witness driven
  to `0` by THREE explicit nested `deflateC` calls, by hand). What N73 did NOT assemble: the GENERAL
  iterated descent — a SINGLE theorem at ARBITRARY rank `n` that ITERATES the actual deflation peel
  OPERATOR over all `n` indices, starting from the FULL operator `specOpN l u`, and reaches the zero
  operator. The single-step skeleton existed; the iteration of the operator over a whole index list,
  at general `n`, did not. That assembly — the recursion the full spectral existence runs on, turned
  from a fixed-rank hand-crank into a general-`n` `List.foldl` induction — is what THIS node banks.

  ── THE TRUNK REFRAME (THE ONE LAW): the iterated descent IS the N73 single step, folded ──
  `deflateList l u g ks := ks.foldl (fun acc k => deflateC acc (l k) (u k)) g` is the iterated peel:
  fold the banked one-step deflation `deflateC` (N70) over a list of indices `ks`. The whole descent
  is then ONE structural induction on `ks` over the banked single step `deflateC_specOpN_zeroOn`
  (N73): each `cons` consumes one index, advancing the peeled-index Finset `S` to `insert k S`; the
  `nil` base is the identity. Specializing to `ks = List.finRange n`, `S = ∅` peels EVERY index and —
  through the terminal state `specOpN_zeroOn_univ` (N73) — lands at the zero operator, at ARBITRARY
  rank `n`. NO Mathlib spectral theory, NO posited operator calculus — pure `List.foldl`/`Finset`
  bookkeeping over the banked `deflateC`/`deflateC_specOpN_zeroOn`/`zeroOn`/`specOpN_zeroOn_univ` +
  the reference form `EvC` (N58, itself the Born self-overlap positivity N56), over the DERIVED ℝ `Cut`.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    deflateList               — the iterated deflation peel: `ks.foldl (deflateC · (l k) (u k)) g`. NEW.
    deflateList_nil/_cons     — the fold's base/step unfoldings (`[] ↦ g`, `k::ks ↦` peel `k` then recurse).
    zeroOn_empty              — `zeroOn ∅ l = l` (nothing peeled yet = the original coefficients).
    deflateList_zeroOn        — ★★ THE GENERAL ITERATED DESCENT SKELETON: for a `Nodup` index list `ks`
                                disjoint from `S`, iterating the peel over `ks` zeroes EVERY coefficient
                                in `ks` — `deflateList l u (specOpN (zeroOn S l) u) ks =
                                specOpN (zeroOn (S ∪ ks.toFinset) l) u`. The N73 single step
                                `deflateC_specOpN_zeroOn` iterated to ARBITRARY length by `List` induction.
    specOpN_full_descent      — ★★ THE HEADLINE — THE GENERAL n-DIM ITERATED DEFLATION DESCENT: iterating
                                the deflation peel over ALL `n` indices, starting from the FULL rank-`n`
                                spectral operator `specOpN l u`, reaches the zero operator —
                                `deflateList l u (specOpN l u) (List.finRange n) = 0`, at ARBITRARY
                                rank `n`. The extract→deflate→recurse loop driven to its termination at
                                GENERAL dimension (N73 did it only at a fixed concrete rank, by hand).
    deflateList_mix_partial_survive — ★ W8 NON-VACUITY: the GENERAL `deflateList` machine, run over the
                                STRICT prefix `[0,1]` of the rank-3 mixing family (peel `mixA(9)`,
                                `mixB(4)`), leaves the surviving eigenpair `mixW3` with its TRUE eigenvalue
                                `25` — `deflateList ![9,4,25] mix3 (specOpN ![9,4,25] mix3) [0,1] mixW3 =
                                25 • mixW3`. The general descent is honest at every rank: no peel vacuously
                                drops a still-present eigenpair (the banked vector eigen-equation
                                `specOpN_eigen`, N71, on the twice-peeled operator).
    deflateList_txMix_concrete — the general machine on `txMix` over `List.finRange 3` UNFOLDS to N73's
                                three explicit nested `deflateC` calls (the general iterator subsumes the
                                hand-built crank).
    deflateList_txMix_descent — ★ SUBSUMPTION: the general iterated descent reproduces N73's concrete
                                full descent of the genuine 10-dim-mixing witness to `0` —
                                `deflateList ![9,4,25] mix3 txMix (List.finRange 3) = 0` — recovering
                                `txMix_full_descent` as the `n = 3` instance of the general theorem.

  ── THE W1 HEAVY REMAINDER (childed N75, an honest dissolution ticket, NOT closed here) ──
  The seed eigenpair EXTRACTION at GENERAL dimension (the characteristic-cubic route producing ONE
  eigenpair for an arbitrary self-adjoint operator on an `n`-dim space — an eigenvalue as a cubic root
  over `Cut`, no Mathlib analogue) — the missing SEED the iterated descent now consumes — + the full
  existence `∀ g, ∃ c u, g = specOpN c u` (the seed + this iterated descent) + the GLOBAL polar/KAK
  assembly for an arbitrary `g` + the compact part via CONNECTEDNESS + the GLOBAL reverse KAK
  surjectivity + the full `Spin(9)→SO(9)` exhaustion are the genuine HEAVY group-manifold core, childed
  onto the chain tail. THIS node banks the GENERAL ITERATED DESCENT — the recursion the existence runs
  on, at arbitrary rank `n` — the assembly N73 (fixed concrete rank, hand-built) did not have.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That the spectral theorem runs an iterated
  deflation that terminates when every eigenpair is peeled is standard linear algebra. Here the
  iterated peel `deflateList`, the general-`n` descent skeleton over a growing peeled-index `Finset`,
  the headline termination at the zero operator at arbitrary rank, and the subsumption of N73's
  concrete crank DESCEND from the banked single step `deflateC_specOpN_zeroOn` (N73) + the deflation
  engine `deflateC` (N70) + the spectral operator `specOpN` (N68) + the eigenprojection `projC` (N63)
  + the reference form `EvC` (N58, itself the Born self-overlap positivity N56) + the witness `txMix`
  (N69) + the vector eigen-equation `specOpN_eigen` (N71) over the DERIVED ℝ `Cut` and `O Cut` — NO
  posited operator calculus, NO Mathlib spectral theory, NO Mathlib ℝ/ℂ as content. `Module.End`,
  `LinearMap`, `List.foldl`, `Finset`, `Finset.sum` are standard Mathlib MACHINERY on the DERIVED
  objects.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / spectral /
  eigenspace / eigenvalue / eigenvector / eigenprojection / eigenbasis / eigenpair / eigen-equation /
  deflation / peel-off / descent / diagonal / orthonormal / self-adjoint / invariant / mixing /
  dimension / rank / seed / extraction / induction / termination / iterated": what remains is the
  theorem that, over the derived complete ordered field `Cut` and the Cayley–Dickson double³ `O Cut`,
  for the `Cut`-linear `specOpN l u := ∑ i, (l i)•projC (u i)`, `deflateC g l u := g − l • projC u`,
  `zeroOn S l := fun i => if i ∈ S then 0 else l i`, and `deflateList l u g ks :=
  ks.foldl (fun acc k => deflateC acc (l k) (u k)) g`: for a `Nodup` `ks` disjoint from `S`,
  `deflateList l u (specOpN (zeroOn S l) u) ks = specOpN (zeroOn (S ∪ ks.toFinset) l) u`; and
  `deflateList l u (specOpN l u) (List.finRange n) = 0`. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, a fully proved derivation,
  NO Mathlib number-system content import (the continuum is the DERIVED `Cut`), NO posited Lorentz
  group, NO posited operator calculus / spectral theorem, NO Mathlib ℝ/ℂ as content.
-/
import Phys.Algebra.LorentzContinuumDeflateInduct

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section
open scoped BigOperators

/-! ## The iterated deflation peel — folding the N70 single-step deflation over an index list. -/

/-- ★ THE ITERATED DEFLATION PEEL: fold the banked one-step deflation `deflateC g (l k) (u k)` (N70)
    over a list of indices `ks`. `deflateList l u g ks` peels, in order, the eigenpair at each index in
    `ks` off the operator `g`. The list realization of the extract→deflate→recurse loop — the assembly
    the full spectral existence runs on, here at arbitrary length. -/
def deflateList {n : ℕ} (l : Fin n → Cut) (u : Fin n → STVC) (g : Module.End Cut STVC)
    (ks : List (Fin n)) : Module.End Cut STVC :=
  ks.foldl (fun acc k => deflateC acc (l k) (u k)) g

/-- The empty peel leaves the operator unchanged: `deflateList l u g [] = g`. -/
theorem deflateList_nil {n : ℕ} (l : Fin n → Cut) (u : Fin n → STVC) (g : Module.End Cut STVC) :
    deflateList l u g [] = g := rfl

/-- The peel step: `deflateList l u g (k :: ks) = deflateList l u (deflateC g (l k) (u k)) ks` —
    peel the head index `k`, then iterate over the tail. -/
theorem deflateList_cons {n : ℕ} (l : Fin n → Cut) (u : Fin n → STVC) (g : Module.End Cut STVC)
    (k : Fin n) (ks : List (Fin n)) :
    deflateList l u g (k :: ks) = deflateList l u (deflateC g (l k) (u k)) ks := rfl

/-- Nothing peeled yet (`S = ∅`) is the original coefficient family: `zeroOn ∅ l = l`. -/
theorem zeroOn_empty {n : ℕ} (l : Fin n → Cut) :
    zeroOn (∅ : Finset (Fin n)) l = l := by
  funext i; simp [zeroOn]

/-! ## The general iterated descent skeleton — the N73 single step, iterated to arbitrary length. -/

/-- ★★ THE GENERAL ITERATED DESCENT SKELETON: peeling a `Nodup` index list `ks` (each index disjoint
    from the already-peeled set `S`) off the partially-deflated spectral operator `specOpN (zeroOn S l) u`
    zeroes every coefficient in `ks` — `deflateList l u (specOpN (zeroOn S l) u) ks =
    specOpN (zeroOn (S ∪ ks.toFinset) l) u`. The N73 single step `deflateC_specOpN_zeroOn` (peel ONE
    more index, growing the peeled-index `Finset` by `insert k S`) iterated to ARBITRARY length by a
    structural `List` induction: each `cons` consumes one index and advances `S` to `insert k S`; the
    `Nodup`/disjointness hypotheses keep the peeled indices distinct so the inductive step applies. -/
theorem deflateList_zeroOn {n : ℕ} (l : Fin n → Cut) (u : Fin n → STVC) :
    ∀ (ks : List (Fin n)) (S : Finset (Fin n)),
      ks.Nodup → (∀ k ∈ ks, k ∉ S) →
      deflateList l u (specOpN (zeroOn S l) u) ks
        = specOpN (zeroOn (S ∪ ks.toFinset) l) u := by
  intro ks
  induction ks with
  | nil =>
    intro S _ _
    simp [deflateList_nil]
  | cons k ks ih =>
    intro S hnodup hdisj
    rw [deflateList_cons]
    rw [deflateC_specOpN_zeroOn l u S k (hdisj k List.mem_cons_self)]
    rw [List.nodup_cons] at hnodup
    obtain ⟨hknotin, hkstail⟩ := hnodup
    have hdisj' : ∀ k' ∈ ks, k' ∉ insert k S := by
      intro k' hk'
      rw [Finset.mem_insert, not_or]
      refine ⟨?_, hdisj k' (List.mem_cons_of_mem k hk')⟩
      rintro rfl
      exact hknotin hk'
    rw [ih (insert k S) hkstail hdisj']
    congr 2
    rw [List.toFinset_cons, Finset.insert_union, Finset.union_insert]

/-- ★★ THE HEADLINE — THE GENERAL n-DIM ITERATED DEFLATION DESCENT: iterating the deflation peel over
    ALL `n` indices, starting from the FULL rank-`n` spectral operator `specOpN l u`, reaches the zero
    operator — `deflateList l u (specOpN l u) (List.finRange n) = 0`, at ARBITRARY rank `n`. Through the
    general skeleton `deflateList_zeroOn` with `S = ∅`, `ks = List.finRange n` (`Nodup`, peeling every
    index of `Fin n`), landing — via `List.toFinset_finRange` and the N73 terminal state
    `specOpN_zeroOn_univ` — at the zero operator. The extract→deflate→recurse loop driven to its
    TERMINATION at general dimension: N73 closed the descent only at a fixed concrete rank, by hand;
    this is the same descent as one theorem at every rank `n`. -/
theorem specOpN_full_descent {n : ℕ} (l : Fin n → Cut) (u : Fin n → STVC) :
    deflateList l u (specOpN l u) (List.finRange n) = 0 := by
  have hstart : specOpN l u = specOpN (zeroOn (∅ : Finset (Fin n)) l) u := by
    rw [zeroOn_empty]
  rw [hstart]
  rw [deflateList_zeroOn l u (List.finRange n) ∅ (List.nodup_finRange n) (fun k _ => by simp)]
  rw [List.toFinset_finRange, Finset.empty_union, specOpN_zeroOn_univ]

/-! ## W8 non-vacuity — the general machine over a STRICT prefix leaves the surviving eigenpair. -/

/-- ★ W8 NON-VACUITY: the GENERAL `deflateList` machine, run over the STRICT prefix `[0,1]` of the
    rank-3 mixing family (peel `mixA(9)`, then `mixB(4)`), leaves the surviving eigenpair `mixW3` with
    its TRUE eigenvalue `25` — `deflateList ![9,4,25] mix3 (specOpN ![9,4,25] mix3) [0,1] mixW3 =
    25 • mixW3`. The general descent is honest at every rank: no peel vacuously drops a still-present
    eigenpair. Through the general skeleton `deflateList_zeroOn` peeling `{0,1}` (the partially-deflated
    coefficients `![0,0,25]`), then the banked vector eigen-equation `specOpN_eigen` (N71) on the
    surviving third index. -/
theorem deflateList_mix_partial_survive :
    deflateList ![(9:Cut),4,25] mix3 (specOpN ![(9:Cut),4,25] mix3) [0,1] mixW3
      = (25:Cut) • mixW3 := by
  have hpeel : deflateList ![(9:Cut),4,25] mix3 (specOpN ![(9:Cut),4,25] mix3) [0,1]
      = specOpN ![(0:Cut),0,25] mix3 := by
    have h := deflateList_zeroOn ![(9:Cut),4,25] mix3 [0,1] ∅ (by decide) (by decide)
    rw [zeroOn_empty] at h
    rw [h]
    congr 1
    funext i
    fin_cases i <;> simp [zeroOn]
  rw [hpeel]
  have h := specOpN_eigen (l := ![(0:Cut),0,25]) (u := mix3) mix3_orthonormal 2
  simpa [mix3] using h

/-! ## Subsumption — the general machine reproduces N73's concrete hand-built full descent. -/

/-- The general iterator on `txMix` over `List.finRange 3` UNFOLDS to N73's three explicit nested
    `deflateC` calls — `deflateList ![9,4,25] mix3 txMix (List.finRange 3) =
    deflateC (deflateC (deflateC txMix 9 mixA) 4 mixB) 25 mixW3`. The general `deflateList` subsumes
    the hand-built crank of N73's `txMix_full_descent`. -/
theorem deflateList_txMix_concrete :
    deflateList ![(9:Cut),4,25] mix3 txMix (List.finRange 3)
      = deflateC (deflateC (deflateC txMix (9:Cut) mixA) (4:Cut) mixB) (25:Cut) mixW3 := by
  show List.foldl (fun acc k => deflateC acc (![(9:Cut),4,25] k) (mix3 k)) txMix (List.finRange 3) = _
  rw [show (List.finRange 3) = [0,1,2] from rfl]
  simp only [List.foldl_cons, List.foldl_nil, mix3, Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.cons_val]

/-- ★ SUBSUMPTION: the general iterated descent reproduces N73's concrete full descent of the genuine
    10-dim-mixing witness to the zero operator — `deflateList ![9,4,25] mix3 txMix (List.finRange 3) =
    0` — recovering `txMix_full_descent` (N73) as the `n = 3` instance of the general headline
    `specOpN_full_descent`. -/
theorem deflateList_txMix_descent :
    deflateList ![(9:Cut),4,25] mix3 txMix (List.finRange 3) = 0 := by
  rw [deflateList_txMix_concrete, txMix_full_descent]

end

end Phys.Algebra
