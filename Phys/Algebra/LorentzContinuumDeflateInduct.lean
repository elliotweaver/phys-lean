/-
  Phys.Algebra.LorentzContinuumDeflateInduct — N73: THE FIRST CLOSED MULTI-STEP DEFLATION DESCENT
  — assembling the N70/N71/N72 deflation engine into a closed extract→deflate→recurse loop that
  TERMINATES at the zero operator. Over the DERIVED ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)`.
  ===========================================================================
  THE NEXT FORCED NODE after the CONSTRUCTED SEED EIGENPAIR EXTRACTION node (N72). N49–N72 banked,
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
      + `IsEvCSymm_add`/`IsEvCSymm_smul` (N63);
    • the general/equal/full-unequal-diagonal `(t,x)`-plane eigenbasis `txOp` (N64–N65);
    • the FIRST concrete polar factorization `g = k·exp(p)` (N66);
    • the FIRST 10-dim-MIXING spectral square root + the RANK-3 spectral operator `specOp3` (N67);
    • ★ the GENERAL RANK-`n` spectral operator `specOpN l u := ∑ i, (l i)•projC (u i)` (N68);
    • ★ the CONCRETE EIGENBASIS-EXISTENCE WITNESS — `txMix = specOpN ![9,4,25] mix3`, `mix3 :=
      ![mixA,mixB,mixW3]` EvC-orthonormal, √(txMix) read off (N69);
    • ★ the DEFLATION / PEEL-OFF ENGINE `deflateC g l u := g − l • projC u` with `deflateC_eigen_kills`,
      `deflateC_image_orth` (the recursion enabler), the RANK-`n` reduction `deflateC_specOpN`
      (`= specOpN (Function.update l k 0) u`), and `deflateC_txMix_fst` (N70);
    • ★ the SEED EIGENPAIR EXTRACTION — the genuine VECTOR eigen-equation `specOpN_eigen :
      specOpN l u (u k) = (l k)•(u k)` + the concrete eigenpairs of `txMix` + the FIRST non-vacuous
      firing of the deflation engine ONCE (peel `mixA(9)`, `mixB(4)` survives) (N71);
    • ★ the CONSTRUCTED octonion-coupling seed extraction `toMix`/`toMix_eq_specOp_omix`/
      `toMix_deflate_kills_seed`/`toMix_deflate_image_orth` — the deflation firing ONCE on a CONSTRUCTED
      (not given) octonion-coupling eigenbasis (N72).

  ── THE TARGET (N73) AND THE W3 DECOMPOSITION ──
  The ticket TARGET is the HEAVY group-manifold core: the FULL n-dim spectral EXISTENCE (an ARBITRARY
  EvC-self-adjoint EvC-positive-semidefinite operator HAS an EvC-orthonormal eigenbasis), the GLOBAL
  polar/KAK assembly for an arbitrary `g`, connectedness, the GLOBAL reverse KAK surjectivity, and the
  full `Spin(9)→SO(9)` exhaustion. MEASURE-FIRST (ROADMAP §N73 priority (i)) confirms: the seed
  eigenpair EXTRACTION at GENERAL dimension (the characteristic-cubic route beyond the 2×2 block) and
  the connectedness/surjectivity/exhaustion each need group-manifold machinery Mathlib lacks over
  `Cut` — the genuine HEAVY sub-nodes (childed N74).

  ── THE IMMEDIATELY-BANKABLE STRUCTURAL ESCALATION (THE CLOSED DESCENT — THE MISSING ASSEMBLY) ──
  N70 banked the SINGLE inductive step `deflateC_specOpN`; N71/N72 each FIRED the deflation engine
  exactly ONCE (peel one eigenpair, exhibit that the next survives). The chain NEVER CHAINED the
  deflation engine to its TERMINATION: the extract→deflate→recurse loop — the closed induction the full
  spectral existence runs on — had never been assembled even at a fixed small rank. This node banks
  THE FIRST CLOSED MULTI-STEP DESCENT: the GENERAL termination base case (the zero-coefficient spectral
  operator IS the zero operator), the GENERAL partial-deflation inductive skeleton (peeling one more
  index off the partially-deflated spectral operator zeroes one more coefficient, indexed by a growing
  `Finset`), the terminal state (peeling ALL indices yields the zero operator), and — turning the crank
  to its end on a concrete operator — the FULL 3-step closed descent of N69's genuine 10-dim-mixing
  witness `txMix`: peel `mixA(9)`, then `mixB(4)`, then `mixW3(25)`, and the operator VANISHES.

  ── THE TRUNK REFRAME (THE ONE LAW): the descent IS iterated subtraction of the trunk eigenprojections ──
  `specOpN l u = ∑ᵢ lᵢ • projC (u i)` (N68) is a finite sum of the banked EvC-orthogonal eigenprojections
  `projC` (N63). Each deflation peel removes one `l k • projC (u k)` term (the N70 rank-`n` reduction
  `deflateC_specOpN` zeroes coefficient `k`); after all `n` peels the sum is empty and the operator is
  `0`. NO Mathlib spectral theory, NO posited operator calculus — pure `Finset.sum` bookkeeping over the
  banked `projC`/`specOpN`/`deflateC` + the reference form `EvC` (N58, itself the Born self-overlap
  positivity N56), over the DERIVED ℝ `Cut`. Each intermediate peel exposes the GENUINE surviving
  eigenpair (the banked vector eigen-equation `specOpN_eigen`, N71), so the descent is honest at every
  step — no vacuity, no skipped rank.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    specOpN_zero            — ★ GENERAL TERMINATION BASE CASE: `specOpN (fun _ => 0) u = 0`. The descent
                              terminates at the zero operator once every coefficient is peeled. NEW.
    zeroOn S l              — the partial-deflation coefficient family `fun i => if i ∈ S then 0 else l i`
                              (`S` = the indices already peeled).
    zeroOn_not_mem          — `k ∉ S → zeroOn S l k = l k` (the eigenvalue of an unpeeled index).
    deflateC_specOpN_zeroOn — ★★ THE CLOSED-INDUCTION SKELETON: for `k ∉ S`, deflating the partially-
                              deflated `specOpN (zeroOn S l) u` at its `k`-th eigenpair zeroes one more
                              coefficient — `= specOpN (zeroOn (insert k S) l) u`. The genuine recursive
                              step over a growing peeled-index set, the engine the full induction runs on.
    zeroOn_univ             — `zeroOn Finset.univ l = fun _ => 0` (every index peeled).
    specOpN_zeroOn_univ     — ★ THE TERMINAL STATE: peeling ALL indices yields the zero operator.
    deflateC_specOpN_step2  — ★ concrete step 2: `deflateC (specOpN ![0,4,25] mix3) 4 mixB =
                              specOpN ![0,0,25] mix3` — peel `mixB(4)` off the once-deflated `txMix`.
    deflateC_specOpN_step3  — ★ concrete step 3: `deflateC (specOpN ![0,0,25] mix3) 25 mixW3 =
                              specOpN ![0,0,0] mix3` — peel `mixW3(25)`, the last eigenpair.
    specOpN_mix3_zero       — `specOpN ![0,0,0] mix3 = 0` (the concrete terminal operator is zero).
    deflateC_step2_survive  — ★ SURVIVING-EIGENPAIR HONESTY: `mixW3` survives the second peel with its
                              genuine eigenvalue — `deflateC (specOpN ![0,4,25] mix3) 4 mixB mixW3 =
                              25 • mixW3` (no vacuity: the descent is real at every rank).
    txMix_full_descent      — ★★ THE HEADLINE: the FULL 3-step closed descent of the genuine 10-dim-mixing
                              operator to the zero operator — `deflateC (deflateC (deflateC txMix 9 mixA)
                              4 mixB) 25 mixW3 = 0`. Peel all three eigenpairs and the operator VANISHES:
                              the first concrete extract→deflate→recurse loop closed to its termination.

  ── THE W1 HEAVY REMAINDER (childed N74, an honest dissolution ticket, NOT closed here) ──
  The seed eigenpair EXTRACTION at GENERAL dimension (the characteristic-cubic route producing ONE
  eigenpair for an arbitrary self-adjoint operator on an `n`-dim space, no Mathlib analogue over `Cut`)
  + assembling the closed descent into a general induction on `n` that DRIVES the full existence
  (`∀ g, ∃ c u, g = specOpN c u`) + the GLOBAL polar/KAK assembly for an arbitrary `g` + the compact
  part via CONNECTEDNESS + the GLOBAL reverse KAK surjectivity + the full `Spin(9)→SO(9)` exhaustion are
  the genuine HEAVY group-manifold core, childed onto the chain tail. THIS node banks the CLOSED DESCENT
  itself — the general termination, the inductive skeleton over a growing peeled-index set, and the
  first concrete loop run to its end — the assembly that N70/N71/N72 (single peels) did not have.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That the spectral theorem runs an iterated
  deflation that terminates when every eigenpair is peeled is standard linear algebra. Here the
  termination base case, the closed inductive skeleton over a growing peeled-index set, the terminal
  state, and the concrete full descent of `txMix` DESCEND from the banked rank-`n` reduction
  `deflateC_specOpN` (N70) + the spectral operator `specOpN` (N68) + the eigenprojection `projC` (N63)
  + the reference form `EvC` (N58, itself the Born self-overlap positivity N56) + the witness `txMix`
  (N69) + the vector eigen-equation `specOpN_eigen` (N71) over the DERIVED ℝ `Cut` and `O Cut` — NO
  posited operator calculus, NO Mathlib spectral theory, NO Mathlib ℝ/ℂ as content. `Module.End`,
  `LinearMap`, `Function.update`, `Finset`, `Finset.sum` are standard Mathlib MACHINERY on the DERIVED
  objects.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / spectral /
  eigenspace / eigenvalue / eigenvector / eigenprojection / eigenbasis / eigenpair / eigen-equation /
  deflation / peel-off / descent / diagonal / orthonormal / self-adjoint / invariant / mixing /
  dimension / rank / seed / extraction / induction / termination": what remains is the theorem that,
  over the derived complete ordered field `Cut` and the Cayley–Dickson double³ `O Cut`, for the
  `Cut`-linear `specOpN l u := ∑ i, (l i)•projC (u i)` and `deflateC g l u := g − l • projC u`:
  `specOpN (fun _ => 0) u = 0`; for `k ∉ S`, `deflateC (specOpN (zeroOn S l) u) (l k) (u k) =
  specOpN (zeroOn (insert k S) l) u`; `specOpN (zeroOn univ l) u = 0`; the concrete steps over
  `mix3 = ![mixA,mixB,mixW3]`; and `deflateC (deflateC (deflateC txMix 9 mixA) 4 mixB) 25 mixW3 = 0`.
  No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, a fully proved derivation,
  NO Mathlib number-system content import (the continuum is the DERIVED `Cut`), NO posited Lorentz
  group, NO posited operator calculus / spectral theorem, NO Mathlib ℝ/ℂ as content.
-/
import Phys.Algebra.LorentzContinuumEigenExtract

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section
open scoped BigOperators

/-! ## The general termination base case — the zero-coefficient spectral operator is the zero op. -/

/-- ★ GENERAL TERMINATION BASE CASE: the rank-`n` spectral operator with ALL coefficients zero is the
    zero operator — `specOpN (fun _ => 0) u = 0`. The deflation descent terminates here, once every
    eigenpair has been peeled: each summand `0 • projC (u i)` vanishes, the finite sum is `0`. -/
theorem specOpN_zero {n : ℕ} (u : Fin n → STVC) :
    specOpN (fun _ => (0:Cut)) u = 0 := by
  simp [specOpN]

/-! ## The partial-deflation index family and the closed inductive skeleton. -/

/-- The partial-deflation coefficient family: `zeroOn S l i = 0` for indices `i` already peeled
    (`i ∈ S`), and `l i` for the eigenvalues not yet removed. The descent advances by growing `S`. -/
def zeroOn {n : ℕ} (S : Finset (Fin n)) (l : Fin n → Cut) : Fin n → Cut :=
  fun i => if i ∈ S then 0 else l i

/-- The eigenvalue of an unpeeled index is unchanged: `k ∉ S → zeroOn S l k = l k`. -/
theorem zeroOn_not_mem {n : ℕ} (S : Finset (Fin n)) (l : Fin n → Cut) {k : Fin n} (hk : k ∉ S) :
    zeroOn S l k = l k := by simp [zeroOn, hk]

/-- ★★ THE CLOSED-INDUCTION SKELETON: for an index `k` not yet peeled (`k ∉ S`), deflating the
    partially-deflated spectral operator `specOpN (zeroOn S l) u` at its `k`-th eigenpair zeroes one
    more coefficient — `deflateC (specOpN (zeroOn S l) u) (l k) (u k) = specOpN (zeroOn (insert k S) l) u`.
    The genuine recursive step of the spectral existence proof, over a growing peeled-index set `S`:
    the N70 rank-`n` reduction `deflateC_specOpN` (zeroing coefficient `k` via `Function.update`)
    re-expressed as advancing `S` to `insert k S`. The engine the full induction on dimension runs on. -/
theorem deflateC_specOpN_zeroOn {n : ℕ} (l : Fin n → Cut) (u : Fin n → STVC)
    (S : Finset (Fin n)) (k : Fin n) (hk : k ∉ S) :
    deflateC (specOpN (zeroOn S l) u) (l k) (u k)
      = specOpN (zeroOn (insert k S) l) u := by
  have hstep := deflateC_specOpN (zeroOn S l) u k
  rw [zeroOn_not_mem S l hk] at hstep
  rw [hstep]
  congr 1
  funext i
  by_cases hik : i = k
  · subst hik; simp [zeroOn, Function.update]
  · simp [zeroOn, Finset.mem_insert, hik]

/-- Peeling EVERY index zeroes EVERY coefficient: `zeroOn Finset.univ l = fun _ => 0`. -/
theorem zeroOn_univ {n : ℕ} (l : Fin n → Cut) :
    zeroOn (Finset.univ : Finset (Fin n)) l = (fun _ => (0:Cut)) := by
  funext i; simp [zeroOn]

/-- ★ THE TERMINAL STATE: once every index is peeled, the spectral operator is the zero operator —
    `specOpN (zeroOn Finset.univ l) u = 0`. The endpoint of the closed deflation descent. -/
theorem specOpN_zeroOn_univ {n : ℕ} (l : Fin n → Cut) (u : Fin n → STVC) :
    specOpN (zeroOn Finset.univ l) u = 0 := by
  rw [zeroOn_univ, specOpN_zero]

/-! ## The concrete full descent — turning the crank to its end on N69's 10-dim-mixing witness. -/

/-- ★ CONCRETE STEP 2: peel the `mixB` eigenpair (eigenvalue `4`) off the once-deflated `txMix` —
    `deflateC (specOpN ![0,4,25] mix3) 4 mixB = specOpN ![0,0,25] mix3`. Through the N70 rank-`n`
    reduction `deflateC_specOpN` at the index `1`, zeroing the second coefficient. -/
theorem deflateC_specOpN_step2 :
    deflateC (specOpN ![(0:Cut),4,25] mix3) (4:Cut) mixB = specOpN ![(0:Cut),0,25] mix3 := by
  have h := deflateC_specOpN ![(0:Cut),4,25] mix3 1
  rw [show (specOpN (Function.update ![(0:Cut),4,25] 1 0) mix3) = specOpN ![(0:Cut),0,25] mix3 from by
        congr 1; funext i; fin_cases i <;> simp [Function.update]] at h
  simpa [mix3] using h

/-- ★ CONCRETE STEP 3: peel the last eigenpair `mixW3` (eigenvalue `25`) off the twice-deflated `txMix`
    — `deflateC (specOpN ![0,0,25] mix3) 25 mixW3 = specOpN ![0,0,0] mix3`. -/
theorem deflateC_specOpN_step3 :
    deflateC (specOpN ![(0:Cut),0,25] mix3) (25:Cut) mixW3 = specOpN ![(0:Cut),0,0] mix3 := by
  have h := deflateC_specOpN ![(0:Cut),0,25] mix3 2
  rw [show (specOpN (Function.update ![(0:Cut),0,25] 2 0) mix3) = specOpN ![(0:Cut),0,0] mix3 from by
        congr 1; funext i; fin_cases i <;> simp [Function.update]] at h
  simpa [mix3] using h

/-- The concrete terminal operator (all three coefficients peeled) is the zero operator. -/
theorem specOpN_mix3_zero : specOpN ![(0:Cut),0,0] mix3 = 0 := by
  have h : (![(0:Cut),0,0] : Fin 3 → Cut) = (fun _ => (0:Cut)) := by
    funext i; fin_cases i <;> rfl
  rw [h, specOpN_zero]

/-- ★ SURVIVING-EIGENPAIR HONESTY (W8 anti-vacuity): after peeling `mixA(9)` and `mixB(4)`, the last
    eigenpair `mixW3` SURVIVES in the twice-deflated operator with its genuine eigenvalue `25` —
    `deflateC (specOpN ![0,4,25] mix3) 4 mixB mixW3 = 25 • mixW3`. The descent is real at every rank:
    each peel leaves the remaining eigenpairs genuinely present (the banked vector eigen-equation
    `specOpN_eigen`, N71, on the once-deflated operator), so the termination at `0` is not vacuous. -/
theorem deflateC_step2_survive :
    deflateC (specOpN ![(0:Cut),4,25] mix3) (4:Cut) mixB mixW3 = (25:Cut) • mixW3 := by
  rw [deflateC_specOpN_step2]
  have h := specOpN_eigen (l := ![(0:Cut),0,25]) (u := mix3) mix3_orthonormal 2
  simpa [mix3] using h

/-- ★★ THE HEADLINE — THE FIRST CLOSED MULTI-STEP DEFLATION DESCENT: peel all three eigenpairs of N69's
    genuine 10-dim-mixing operator `txMix` in turn — `mixA(9)`, then `mixB(4)`, then `mixW3(25)` — and
    the operator VANISHES: `deflateC (deflateC (deflateC txMix 9 mixA) 4 mixB) 25 mixW3 = 0`. The
    extract→deflate→recurse loop the full spectral existence runs on, closed to its TERMINATION on a
    concrete operator for the first time: through the N70 first crank `deflateC_txMix_fst`, then the two
    concrete steps `deflateC_specOpN_step2`/`_step3`, ending at the terminal zero operator
    `specOpN_mix3_zero`. N70/N71/N72 fired the deflation engine ONCE each; this CHAINS it to the end. -/
theorem txMix_full_descent :
    deflateC (deflateC (deflateC txMix (9:Cut) mixA) (4:Cut) mixB) (25:Cut) mixW3 = 0 := by
  rw [deflateC_txMix_fst, deflateC_specOpN_step2, deflateC_specOpN_step3, specOpN_mix3_zero]

end

end Phys.Algebra
