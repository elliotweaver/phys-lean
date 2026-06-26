/-
  Phys.Algebra.LorentzContinuumSpectralExist — N69: THE CONCRETE EIGENBASIS-EXISTENCE WITNESS —
  a TIME↔OCTONION-MIXING operator GIVEN IN COORDINATE (NON-EIGEN) FORM, proved to BE the rank-`n`
  spectral operator `specOpN` over an explicit EvC-orthonormal mixing eigen-family, so N68
  `specOpN_op_sqrt` reads off its positive operator square root for an operator NOT presented in
  eigen-form. Over the DERIVED ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)`.
  ===========================================================================
  THE NEXT FORCED NODE after the GENERAL RANK-`n` SPECTRAL OPERATOR node (N68). N49–N68 banked,
  over the derived ℝ `Cut`:
    • the continuum Born form `QvC`, the isometry monoid `qvIsomMonoidC` (N49), `gFormC_comp` (N50);
    • the tangent Lie algebra `infIsomLieAlg` + `BvC` + `boostGenC`/`rotGenC a` (N51);
    • the FORWARD soundness `genIsomMonoidC2 ≤ qvIsomMonoidC` with `biMulFun u u'` (N52–N55);
    • the BORN POSITIVITY `gFormC_nonneg` + the (1,9) signature split (N56);
    • the POSITIVE-DEFINITE SCALAR square root `cutSqrt` (N57);
    • the INFINITESIMAL CARTAN reference form `EvC` (N58);
    • the OPERATOR FORM-ADJOINT `IsEvCAdjoint` + `comp_nonneg` (N59);
    • the POSITIVE OPERATOR SQUARE-ROOT predicate `IsEvCOpSqrt` + the scalar root (N60);
    • the 2-block / octonion-internal coordinate-diagonal operator square roots (N61–N62);
    • the EvC-ORTHOGONAL EIGENPROJECTION `projC` + the rank-2 rotated-basis spectral operator `specOp`
      + `specOp_op_sqrt` (N63);
    • the general/equal/full-unequal-diagonal `(t,x)`-plane eigenbasis `txOp` (N64–N65);
    • the FIRST concrete polar factorization `g = k·exp(p)` (N66);
    • the FIRST 10-dim-MIXING spectral square root `mixA`/`mixB`/`specOp_mix_op_sqrt` + the RANK-3
      spectral operator `specOp3` (N67);
    • ★ the GENERAL RANK-`n` spectral operator `specOpN l u := ∑ i, (l i)•projC (u i)` with
      `specOpN_isEvCSymm`/`specOpN_nonneg`/`specOpN_comp`/`specOpN_read`/`specOpN_op_sqrt` at ARBITRARY
      finite rank, the rank-4 mixing witness `mix4`/`specOpN_mix4_witness`, and the subsumption
      `specOpN_eq_specOp`/`specOpN_eq_specOp3` (N68).

  ── THE TARGET (N69) AND THE W3 DECOMPOSITION ──
  The ticket TARGET is the HEAVY group-manifold core: the FULL n-dim spectral EXISTENCE (that an
  ARBITRARY EvC-self-adjoint EvC-positive-semidefinite operator HAS an EvC-orthonormal eigen-family,
  so equals `specOpN c u` for some `c,u`), the GLOBAL polar/KAK assembly for an arbitrary `g`,
  connectedness, the GLOBAL reverse KAK surjectivity (`qvIsomMonoidC` on the connected component
  `≤ genIsomMonoidC2`), and the full `Spin(9)→SO(9)` exhaustion. MEASURE-FIRST (ROADMAP §N69 priority
  (i)) confirms: the EXISTENCE for an ARBITRARY self-adjoint operator over `Cut`, and the
  connectedness/surjectivity/exhaustion, each need group-manifold machinery Mathlib lacks over `Cut`
  — the genuine HEAVY sub-nodes (childed N70).

  ── THE IMMEDIATELY-BANKABLE STRUCTURAL ESCALATION (THE EXISTENCE LEVER) ──
  N63–N68 banked the spectral operator `Σᵢ λᵢ Pᵢ` and its `cutSqrt`-per-eigenprojection square root
  at every finite rank GIVEN a mutually-EvC-orthonormal eigen-FAMILY — i.e. they bank the
  decomposition for operators ALREADY PRESENTED IN EIGEN-FORM (built as sums of scaled `projC`s).
  The genuine LEVER from "the diagonal law holds at every rank" (N68, banked) to "an arbitrary
  operator IS in that diagonal form" (the existence content) is to take a self-adjoint operator GIVEN
  IN COORDINATE (NON-EIGEN) FORM — written by its action on `(t,x,v)` with NO `projC` — and PROVE it
  equals `specOpN c u` for an explicit EvC-orthonormal family. N64/N65 did exactly this for the PURE
  `(t,x)` plane (`txOp a b d = specOp …`). What was missing: a TIME↔OCTONION-MIXING operator written
  purely in coordinates, proved to be in spectral diagonal form over a genuinely 10-dim-mixing
  eigen-family — the existence direction in the mixing sector, the cleanest concrete entry to the
  full n-dim existence.

  ── THE TRUNK REFRAME (THE ONE LAW): the coordinate operator IS the spectral sum ──
  Define `txMix : Module.End Cut STVC` by the coordinate action (`r := gFormC 1 v` the octonion-real
  part of `v`):
      `txMix (t,x,v) = ((29/5)·t + (12/5)·r ,  25·x ,  ((12/5)·t + (36/5)·r)•1₍O₎)` ,
  a symmetric `Cut`-linear map that genuinely couples the time axis to the octonion-real direction
  `1₍O₎` (off-diagonal `12/5` shared) — NO `projC` anywhere in its definition. The banked mixing
  3-frame `mix3 := ![mixA, mixB, mixW3]` (`mixA = (3/5,0,(4/5)•1)`, `mixB = (4/5,0,(−3/5)•1)`,
  `mixW3 = (0,1,0)`) is EvC-orthonormal (`mix3_orthonormal`, the nine pairings from the banked
  unit/orthogonality facts of N67). The reframe: `txMix = specOp3 9 4 25 mixA mixB mixW3`
  (`txMix_eq_specOp3`, the coordinate components matching the spectral action via `specOp3_apply` and
  the overlaps `EvC mixA (t,x,v) = (3/5)t + (4/5)r`, etc.) — and hence `txMix = specOpN ![9,4,25] mix3`
  (`txMix_eq_specOpN`, through N68 `specOpN_eq_specOp3`). With the coordinate operator now in
  rank-`n` spectral form, N68 `specOpN_op_sqrt` reads off its positive operator square root directly:
  `specOpN ![3,2,5] mix3` (eigenvalues `cutSqrt 9 = 3`, `cutSqrt 4 = 2`, `cutSqrt 25 = 5`) squares to
  `txMix` (`txMix_op_sqrt`). NO Mathlib spectral theory; the existence is exhibited concretely and the
  root is `cutSqrt` per eigenvalue on its EvC-orthogonal eigenprojection.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    txMix             — the coordinate (NON-eigen-form) time↔octonion-real mixing operator.
    txMix_apply       — its coordinate action.
    mix3 / mix3_orthonormal — the banked time/octonion-real/space EvC-orthonormal mixing 3-frame.
    txMix_eq_specOp3  — ★ THE EXISTENCE/DIAGONALIZATION: the coordinate operator IS the rank-3 spectral
                        operator `specOp3 9 4 25 mixA mixB mixW3` over the mixing eigen-family.
    txMix_eq_specOpN  — ★ the same in rank-`n` form: `txMix = specOpN ![9,4,25] mix3` (through N68).
    txMix_op_sqrt     — ★★ √(txMix) READ OFF: `specOpN ![3,2,5] mix3` is the positive operator square
                        root of the coordinate-given `txMix` — N68 `specOpN_op_sqrt` applied to an
                        operator NOT presented in eigen-form.

  ── THE W1 HEAVY REMAINDER (childed N70, an honest dissolution ticket, NOT closed here) ──
  The FULL n-dim spectral EXISTENCE — that an ARBITRARY (not concretely-chosen) EvC-self-adjoint
  EvC-positive-semidefinite operator HAS an EvC-orthonormal eigen-family, so equals `specOpN c u` for
  some `c,u` (no Mathlib analogue over `Cut`) — + the GLOBAL polar/KAK assembly for an arbitrary `g`
  + the compact part via CONNECTEDNESS + the GLOBAL reverse KAK surjectivity + the full `Spin(9)→SO(9)`
  exhaustion are the genuine HEAVY group-manifold core, childed onto the chain tail. THIS node banks
  the CONCRETE existence witness in the mixing sector: a coordinate operator exhibited in spectral
  diagonal form over an explicit mixing eigen-family, with its square root read off — the lever from
  "diagonal law at every rank" to "an arbitrary operator IS diagonalizable".

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That a symmetric coordinate operator is
  orthogonally diagonalizable and its positive square root is computed eigenvalue-by-eigenvalue is
  standard spectral theory. Here the coordinate operator `txMix`, its identification with the rank-`n`
  spectral operator over the explicit mixing eigen-family, and its square root DESCEND from the banked
  `specOp3` (N67) / `specOpN` (N68) + `projC` (N63) + scalar `cutSqrt` (N57) + reference form `EvC`
  (N58) + the octonion bilinear `gFormC` over the DERIVED ℝ `Cut` and `O Cut` — NO posited operator
  calculus, NO Mathlib spectral theory, NO posited inner product, NO Mathlib ℝ/ℂ as content.
  `Module.End`, `LinearMap`, `Fin n`-indexing are standard Mathlib MACHINERY on the DERIVED objects.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / spectral /
  eigenspace / eigenvalue / eigenprojection / eigenbasis / eigen-family / diagonal / orthonormal /
  mixing / time / octonion-real / existence / square-root / self-adjoint / positive-semidefinite /
  isometry / Spin / SO(9) / KAK / polar / Cartan / dimension / rank": what remains is the theorem
  that, over the derived complete ordered field `Cut` and the Cayley–Dickson double³ `O Cut`, for the
  symmetric bilinear form `EvC` and the explicitly-defined `Cut`-linear map
  `txMix (t,x,v) = ((29/5)t + (12/5)·gFormC 1 v, 25 x, ((12/5)t + (36/5)·gFormC 1 v)•1)`:
  `txMix = specOpN ![9,4,25] ![mixA,mixB,mixW3]` and `specOpN ![3,2,5] ![mixA,mixB,mixW3]` squares to
  `txMix`. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, a fully proved derivation,
  NO Mathlib number-system content import (the continuum is the DERIVED `Cut`), NO posited Lorentz
  group, NO posited operator calculus / spectral theorem, NO Mathlib ℝ/ℂ as content.
-/
import Phys.Algebra.LorentzContinuumSpectralN

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section
open scoped BigOperators

/-! ## The coordinate (NON-eigen-form) time↔octonion-real mixing operator. -/

/-- ★ THE COORDINATE (NON-EIGEN-FORM) TIME↔OCTONION-REAL MIXING OPERATOR. With `r := gFormC 1 v` the
    octonion-real part of `v`, `txMix (t,x,v) := ((29/5)t + (12/5)r, 25x, ((12/5)t + (36/5)r)•1₍O₎)`
    — a symmetric `Cut`-linear map written PURELY IN COORDINATES (NO `projC`), genuinely coupling the
    time axis to the octonion-real direction `1₍O₎` (shared off-diagonal `12/5`). The "arbitrary
    operator" side of the existence lever: it is NOT presented as a sum of scaled eigenprojections;
    that it equals one is the content of `txMix_eq_specOpN` below. -/
def txMix : Module.End Cut STVC where
  toFun p := ((29/5 : Cut) * p.1 + (12/5 : Cut) * gFormC 1 p.2.2,
              (25 : Cut) * p.2.1,
              ((12/5 : Cut) * p.1 + (36/5 : Cut) * gFormC 1 p.2.2) • (1 : O Cut))
  map_add' p q := by
    obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', v'⟩ := q
    refine Prod.ext ?_ (Prod.ext ?_ ?_)
    · show (29/5 : Cut) * (t + t') + (12/5 : Cut) * gFormC 1 (v + v')
         = ((29/5 : Cut) * t + (12/5 : Cut) * gFormC 1 v)
         + ((29/5 : Cut) * t' + (12/5 : Cut) * gFormC 1 v')
      rw [gFormC_add_right]; ring
    · show (25 : Cut) * (x + x') = (25 : Cut) * x + (25 : Cut) * x'; ring
    · show ((12/5 : Cut) * (t + t') + (36/5 : Cut) * gFormC 1 (v + v')) • (1 : O Cut)
         = ((12/5 : Cut) * t + (36/5 : Cut) * gFormC 1 v) • (1 : O Cut)
         + ((12/5 : Cut) * t' + (36/5 : Cut) * gFormC 1 v') • (1 : O Cut)
      rw [gFormC_add_right, ← add_smul]; congr 1; ring
  map_smul' c p := by
    obtain ⟨t, x, v⟩ := p
    refine Prod.ext ?_ (Prod.ext ?_ ?_)
    · show (29/5 : Cut) * (c * t) + (12/5 : Cut) * gFormC 1 (c • v)
         = c * ((29/5 : Cut) * t + (12/5 : Cut) * gFormC 1 v)
      rw [gFormC_smul_right]; ring
    · show (25 : Cut) * (c * x) = c * ((25 : Cut) * x); ring
    · show ((12/5 : Cut) * (c * t) + (36/5 : Cut) * gFormC 1 (c • v)) • (1 : O Cut)
         = c • (((12/5 : Cut) * t + (36/5 : Cut) * gFormC 1 v) • (1 : O Cut))
      rw [gFormC_smul_right, smul_smul]; congr 1; ring

/-- The coordinate operator acts as
    `(t,x,v) ↦ ((29/5)t + (12/5)·gFormC 1 v, 25x, ((12/5)t + (36/5)·gFormC 1 v)•1)`. -/
theorem txMix_apply (p : STVC) :
    txMix p = ((29/5 : Cut) * p.1 + (12/5 : Cut) * gFormC 1 p.2.2,
               (25 : Cut) * p.2.1,
               ((12/5 : Cut) * p.1 + (36/5 : Cut) * gFormC 1 p.2.2) • (1 : O Cut)) := rfl

/-! ## The banked mixing 3-frame as the explicit EvC-orthonormal eigen-family. -/

/-- The mixing 3-frame `![mixA, mixB, mixW3]` — the banked time/octonion-real/space EvC-orthonormal
    eigen-family of N67 (`mixA,mixB` coupling time to `1₍O₎`, `mixW3` the pure-space unit). -/
def mix3 : Fin 3 → STVC := ![mixA, mixB, mixW3]

/-- The orthonormality matrix of the mixing 3-frame: `EvC (mix3 i) (mix3 j) = δᵢⱼ`. The nine pairings
    reduce to the banked unit/orthogonality facts of `{mixA,mixB,mixW3}` (N67). -/
theorem mix3_orthonormal (i j : Fin 3) : EvC (mix3 i) (mix3 j) = if i = j then 1 else 0 := by
  fin_cases i <;> fin_cases j
  · show EvC mixA mixA = 1; rw [mixA_norm]
  · show EvC mixA mixB = 0; rw [mix_orth]
  · show EvC mixA mixW3 = 0; rw [mixA_mixW3_orth]
  · show EvC mixB mixA = 0; rw [EvC_symm, mix_orth]
  · show EvC mixB mixB = 1; rw [mixB_norm]
  · show EvC mixB mixW3 = 0; rw [mixB_mixW3_orth]
  · show EvC mixW3 mixA = 0; rw [EvC_symm, mixA_mixW3_orth]
  · show EvC mixW3 mixB = 0; rw [EvC_symm, mixB_mixW3_orth]
  · show EvC mixW3 mixW3 = 1; rw [mixW3_norm]

/-! ## THE EXISTENCE: the coordinate operator IS the spectral operator over the mixing eigen-family. -/

/-- ★ THE EXISTENCE / DIAGONALIZATION: the coordinate operator `txMix` IS the rank-3 spectral operator
    `specOp3 9 4 25 mixA mixB mixW3` — diagonal in the explicit mixing EvC-orthonormal eigen-family
    `{mixA,mixB,mixW3}`, eigenvalues `9,4,25`. An operator GIVEN IN COORDINATE form is proved to be
    in spectral diagonal form: the existence direction of the spectral theorem in the genuinely
    10-dim-mixing sector. The coordinate components match the spectral action via `specOp3_apply` and
    the overlaps `EvC mixA (t,x,v) = (3/5)t + (4/5)·gFormC 1 v`, `EvC mixB (t,x,v) = (4/5)t − (3/5)·gFormC 1 v`,
    `EvC mixW3 (t,x,v) = x`. -/
theorem txMix_eq_specOp3 : txMix = specOp3 9 4 25 mixA mixB mixW3 := by
  apply LinearMap.ext
  intro p
  obtain ⟨t, x, v⟩ := p
  rw [txMix_apply, specOp3_apply]
  have eA : EvC mixA (t, x, v) = (3/5 : Cut) * t + (4/5 : Cut) * gFormC 1 v := by
    show (3/5 : Cut) * t + (0:Cut) * x + gFormC ((4/5 : Cut) • (1 : O Cut)) v
       = (3/5 : Cut) * t + (4/5 : Cut) * gFormC 1 v
    rw [gFormC_smul_left]; ring
  have eB : EvC mixB (t, x, v) = (4/5 : Cut) * t - (3/5 : Cut) * gFormC 1 v := by
    show (4/5 : Cut) * t + (0:Cut) * x + gFormC ((-3/5 : Cut) • (1 : O Cut)) v
       = (4/5 : Cut) * t - (3/5 : Cut) * gFormC 1 v
    rw [gFormC_smul_left]; ring
  have eW : EvC mixW3 (t, x, v) = x := by
    show (0 : Cut) * t + (1:Cut) * x + gFormC (0 : O Cut) v = x
    rw [gFormC_zero_left]; ring
  rw [eA, eB, eW]
  simp only [mixA, mixB, mixW3, Prod.smul_mk, smul_eq_mul, Prod.mk_add_mk, smul_zero,
    add_zero, smul_smul]
  refine Prod.ext ?_ (Prod.ext ?_ ?_)
  · show (29/5 : Cut) * t + (12/5 : Cut) * gFormC 1 v
       = (9 * ((3/5) * t + (4/5) * gFormC 1 v)) * (3/5)
       + (4 * ((4/5) * t - (3/5) * gFormC 1 v)) * (4/5)
       + (25 * x) * 0
    ring
  · show (25 : Cut) * x
       = (9 * ((3/5) * t + (4/5) * gFormC 1 v)) * 0
       + (4 * ((4/5) * t - (3/5) * gFormC 1 v)) * 0
       + (25 * x) * 1
    ring
  · show ((12/5 : Cut) * t + (36/5 : Cut) * gFormC 1 v) • (1 : O Cut)
       = ((9 * ((3/5) * t + (4/5) * gFormC 1 v)) * (4/5)) • (1 : O Cut)
       + ((4 * ((4/5) * t - (3/5) * gFormC 1 v)) * (-3/5)) • (1 : O Cut)
    rw [← add_smul]; congr 1; ring

/-- ★ THE EXISTENCE in rank-`n` form: `txMix = specOpN ![9,4,25] mix3` — the coordinate operator is
    the GENERAL rank-`n` spectral operator (N68) over the mixing 3-frame, through the subsumption
    `specOpN_eq_specOp3`. With `txMix` now in `specOpN` form, N68 `specOpN_op_sqrt` applies directly. -/
theorem txMix_eq_specOpN : txMix = specOpN ![(9:Cut),4,25] mix3 := by
  rw [txMix_eq_specOp3, ← specOpN_eq_specOp3]
  rfl

/-! ## √(txMix) read off via the general rank-`n` spectral square root (N68). -/

/-- ★★ √(txMix) READ OFF: `specOpN ![3,2,5] mix3` is the positive operator square root of the
    COORDINATE-GIVEN operator `txMix` — eigenvalues `cutSqrt 9 = 3`, `cutSqrt 4 = 2`, `cutSqrt 25 = 5`.
    N68 `specOpN_op_sqrt` applied to an operator NOT presented in eigen-form, through the existence
    identification `txMix_eq_specOpN`. The full lever: a coordinate self-adjoint operator's positive
    square root is read off by exhibiting its eigen-family and applying `cutSqrt` per eigenvalue —
    NO Mathlib spectral theory, NO posited operator calculus. -/
theorem txMix_op_sqrt :
    IsEvCOpSqrt (specOpN ![(3:Cut),2,5] mix3) txMix := by
  rw [txMix_eq_specOpN]
  have h := specOpN_op_sqrt (c := ![(9:Cut),4,25]) (by intro i; fin_cases i <;> norm_num)
    mix3_orthonormal
  have e : (fun i => cutSqrt (![(9:Cut),4,25] i)) = ![(3:Cut),2,5] := by
    funext i
    fin_cases i
    · show cutSqrt (9:Cut) = 3; exact (cutSqrt_unique (by norm_num) (by norm_num)).symm
    · show cutSqrt (4:Cut) = 2; exact (cutSqrt_unique (by norm_num) (by norm_num)).symm
    · show cutSqrt (25:Cut) = 5; exact (cutSqrt_unique (by norm_num) (by norm_num)).symm
  rwa [e] at h

end

end Phys.Algebra
