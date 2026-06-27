/-
  Phys/Algebra/LorentzContinuumSpectralExistFull.lean — N85

  THE FULL n-DIM SPECTRAL EXISTENCE  `∀ g, IsEvCSymm g → ∃ n l u, (orthonormal) ∧ g = specOpN l u`.

  Over the derived ℝ `Cut` (the order-complete `ContinuumQ.Cut`) and the terminal algebra
  `O Cut := CD (H Cut)`, this is the headline group-manifold core: every `EvC`-self-adjoint
  endomorphism `g` of the finite-dimensional space `STVC = Cut × Cut × O Cut` equals the rank-`n`
  spectral operator `specOpN l u := ∑ i, (l i) • projC (u i)` for an `EvC`-ORTHONORMAL eigen-family
  `{u i}`. Equivalently: every symmetric operator has an orthonormal eigenbasis — the spectral
  theorem, derived entirely inside the chain with NO Mathlib spectral theory, NO Mathlib ℝ/ℂ.

  HOW (W1 reframe — the deflation peel IS the reconstruction, the nested complement IS the
  bookkeeping). The two subtle parts the N85 frontier flagged DISSOLVE under the trunk:

  (a) The forward reconstruction is NOT a fresh `Σᵢ λᵢ Pᵢ` sum: since
      `deflateC h μ u = h − μ • projC u`, the accumulation `specOpN (snoc l μ) (snoc u uₖ) =
      specOpN l u + μ • projC uₖ` (`specOpN_snoc`, a one-line `Fin.sum_univ_castSucc`) reverses the
      peel exactly — `h = deflateC h μ u + μ • projC u`.
  (b) The nested-complement orthonormality is carried by a single invariant: the strong induction
      runs over a SUPPORT submodule `W` with `image(h) ⊆ W`, peeling into `W ⊓ uPerp u` each rung.
      Every previously-peeled direction is `EvC`-orthogonal to the current `W` by construction
      (`uPerp u`), so `snoc` preserves orthonormality with a two-line `Fin.lastCases` split.

  The genuine new technical lemma is the codim-one drop WITHIN a submodule:
  `finrank (W ⊓ uPerp u) = finrank W − 1` for a UNIT `u ∈ W` (`finrank_inf_uPerp_within`),
  rank–nullity on the surjective functional `p ↦ EvC u p` restricted to `W` (`equivMapOfInjective`
  identifies `ker` with the intersection). The induction is `Nat`-recursion on `m = finrank W`:
  base `m = 0` ⟹ `W = ⊥` ⟹ `g = 0 = specOpN ![] ![]`; step extracts a unit eigenpair via the
  PARITY-FREE submodule seed `submodule_selfadj_has_eigenvalue` (N84, no `Odd`), deflates, and
  recurses on the strictly-smaller `W ⊓ uPerp u` (`finrank` drops by exactly one). The even-rung
  obstruction that gated N78–N84 is GONE — the induction closes with NO parity case-split.

  DERIVED from the trunk: the real eigenvalue at every rung DESCENDS from `submodule_selfadj_has_eigenvalue`
  (N84) → `cut_no_root_factors_negDisc` (N83) → `cuti_isAlgClosed` (N82) → `cut_isRealClosed` (N77)
  → the order-completeness of the derived ℝ `Cut`; the eigenprojection is the positive-definite Born
  form `EvC` (N58); the unit normalization is `cutSqrt` (N57); the deflation engine is `deflateC`
  (N70); the codim-one complement is `uPerp` (N79); the spectral operator is `specOpN` (N68).
  `Fin.sum_univ_castSucc`, `Fin.snoc`, `Fin.lastCases`, `LinearMap.finrank_range_add_finrank_ker`,
  `Submodule.equivMapOfInjective`, `Submodule.finrank_eq_zero`, `Module.nontrivial_of_finrank_pos`,
  `LinearMap.restrict`, `HasEigenvector.exists_hasEigenvector` are standard MACHINERY operating on
  the DERIVED objects. NO posited ℝ/ℂ as content, NO Mathlib `Real`/`Complex`, NO posited inner
  product / spectral theorem, NO posited Lorentz group, NO bridge.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / spectral /
  eigenvalue / eigenvector / eigenbasis / eigen-family / self-adjoint / orthonormal / diagonal /
  positive-definite / seed / re-seed / deflation / peel / descent / dimension / rank / existence /
  complement / Spin / SO(9) / isometry / polar / KAK": what remains is — over the derived complete
  ordered field `Cut` and the symmetric positive-definite bilinear form `EvC`, every `EvC`-symmetric
  endomorphism of the finite-dimensional `Cut`-space `STVC` equals `∑ i, (l i) • projC (u i)` for a
  family `{u i}` with `EvC (u i) (u j) = δᵢⱼ`. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, a fully proved derivation,
  NO Mathlib number-system content import (the field is the DERIVED `Cut`).
-/
import Phys.Algebra.LorentzContinuumSubSeed

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators
open Polynomial

/-! ## The snoc accumulation — the deflation peel reversed into a forward reconstruction. -/

/-- ★ THE SNOC ACCUMULATION: appending one eigenpair `(μ, uₖ)` to the rank-`n` spectral family adds
    exactly one scaled eigenprojection — `specOpN (Fin.snoc l μ) (Fin.snoc u uₖ) = specOpN l u +
    μ • projC uₖ`. The forward reconstruction the existence induction accumulates with: NOT a fresh
    `Σᵢ λᵢ Pᵢ` sum but the reverse of the N70 deflation peel `deflateC h μ u = h − μ • projC u`.
    A one-line `Fin.sum_univ_castSucc`. -/
theorem specOpN_snoc {n : ℕ} (l : Fin n → Cut) (u : Fin n → STVC) (μ : Cut) (uk : STVC) :
    specOpN (Fin.snoc l μ) (Fin.snoc u uk) = specOpN l u + μ • projC uk := by
  unfold specOpN
  rw [Fin.sum_univ_castSucc]
  simp only [Fin.snoc_castSucc, Fin.snoc_last]

/-! ## The codim-one drop WITHIN a submodule — the genuine new finrank bookkeeping. -/

/-- ★★ THE CODIM-ONE DROP WITHIN `W`: for a UNIT `u ∈ W`, intersecting the support submodule `W`
    with the EvC-orthogonal complement `uPerp u` drops the dimension by exactly one —
    `finrank (W ⊓ uPerp u) = finrank W − 1`. Rank–nullity on the functional `φ : W →ₗ Cut`,
    `p ↦ EvC u p` (the ambient `EvCRight u` precomposed with `W.subtype`): `φ` is SURJECTIVE for a
    unit `u ∈ W` (`c ↦ c • u`), so `finrank (range φ) = 1`, and `Submodule.equivMapOfInjective`
    identifies `ker φ` (under `W.subtype`) with `W ⊓ uPerp u`. The within-`W` analogue of N79's
    `uPerp_finrank` — the `finrank` bookkeeping the full-existence deflation induction recurses on,
    each peel dropping the support dimension by exactly one. -/
theorem finrank_inf_uPerp_within {W : Submodule Cut STVC} {u : STVC}
    (hu : EvC u u = 1) (huW : u ∈ W) :
    Module.finrank Cut (W ⊓ uPerp u : Submodule Cut STVC) = Module.finrank Cut W - 1 := by
  set φ : W →ₗ[Cut] Cut := (EvCRight u).comp W.subtype with hφ
  have hsurj : Function.Surjective φ := by
    intro c
    refine ⟨⟨c • u, W.smul_mem c huW⟩, ?_⟩
    show EvC u (c • u) = c
    rw [EvC_smul_right, hu, mul_one]
  have hrn := φ.finrank_range_add_finrank_ker
  have hr : Module.finrank Cut (LinearMap.range φ) = 1 := by
    have h : LinearMap.range φ = ⊤ := LinearMap.range_eq_top.mpr hsurj
    rw [h, finrank_top]; simp
  have hmap : Submodule.map W.subtype (LinearMap.ker φ) = W ⊓ uPerp u := by
    ext x
    simp only [Submodule.mem_map, LinearMap.mem_ker, Submodule.mem_inf, mem_uPerp]
    constructor
    · rintro ⟨p, hp, rfl⟩
      exact ⟨p.2, by simpa [hφ, EvCRight] using hp⟩
    · rintro ⟨hxW, hxu⟩
      exact ⟨⟨x, hxW⟩, by simpa [hφ, EvCRight] using hxu, rfl⟩
  have hfeq : Module.finrank Cut (Submodule.map W.subtype (LinearMap.ker φ))
      = Module.finrank Cut (LinearMap.ker φ) := by
    apply LinearEquiv.finrank_eq
    exact (Submodule.equivMapOfInjective W.subtype (Subtype.coe_injective) (LinearMap.ker φ)).symm
  rw [hmap] at hfeq
  rw [hfeq]
  omega

/-! ## The full spectral existence — strong induction on `finrank W`. -/

/-- THE EXISTENCE HELPER (`Nat`-recursion on `m = finrank W`): every `EvC`-self-adjoint `h` whose
    image lies inside a support submodule `W` of dimension `m` equals `specOpN l u` for an
    EvC-orthonormal family `{u i}` all lying inside `W`. The inductive backbone: base `m = 0` ⟹
    `W = ⊥` ⟹ `h = 0`; step peels a unit eigenpair (PARITY-FREE submodule seed N84) and recurses on
    `W ⊓ uPerp u` (`finrank` drops by one). NO parity case-split. -/
theorem specExists_aux : ∀ (m : ℕ) (h : Module.End Cut STVC), IsEvCSymm h →
    ∀ (W : Submodule Cut STVC), Module.finrank Cut W = m → (∀ p, h p ∈ W) →
    ∃ (n : ℕ) (l : Fin n → Cut) (u : Fin n → STVC),
      (∀ i, u i ∈ W) ∧ (∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) ∧ h = specOpN l u := by
  intro m
  induction m with
  | zero =>
    intro h hh W hW hmap
    haveI : Module.Finite Cut W := Module.Finite.of_injective W.subtype Subtype.coe_injective
    have hbot : W = ⊥ := Submodule.finrank_eq_zero.mp hW
    have hh0 : h = 0 := by
      apply LinearMap.ext
      intro p
      have hp : h p ∈ W := hmap p
      rw [hbot, Submodule.mem_bot] at hp
      rw [hp]; rfl
    refine ⟨0, ![], ![], ?_, ?_, ?_⟩
    · intro i; exact i.elim0
    · intro i; exact i.elim0
    · rw [hh0]; simp [specOpN]
  | succ k ih =>
    intro h hh W hW hmap
    haveI : Module.Finite Cut W := Module.Finite.of_injective W.subtype Subtype.coe_injective
    haveI : Nontrivial W := Module.nontrivial_of_finrank_pos (by rw [hW]; omega)
    have hWinv : ∀ x ∈ W, h x ∈ W := fun x _ => hmap x
    set T : Module.End Cut W := h.restrict hWinv with hT
    have hTcoe : ∀ p : W, (T p : STVC) = h (p : STVC) := fun p => rfl
    have hTsym : IsEvCSymmSub T := by
      intro p q
      rw [hTcoe, hTcoe]; exact hh (p : STVC) (q : STVC)
    obtain ⟨μ, hev⟩ := submodule_selfadj_has_eigenvalue hTsym
    obtain ⟨w, hw⟩ := hev.exists_hasEigenvector
    have hwne : (w : STVC) ≠ 0 := fun hc => hw.2 (Subtype.ext (by rw [hc]; rfl))
    have hweig : h (w : STVC) = μ • (w : STVC) := by
      have := congrArg (Subtype.val) hw.apply_eq_smul
      rw [hTcoe] at this
      rw [this]; rfl
    have hwpos : 0 < EvC (w : STVC) (w : STVC) :=
      lt_of_le_of_ne (EvC_nonneg _) (fun hc => hwne ((EvC_eq_zero_iff _).mp hc.symm))
    set s : Cut := (cutSqrt (EvC (w:STVC) (w:STVC)))⁻¹ with hs
    set u : STVC := s • (w : STVC) with hu
    have huW : u ∈ W := by rw [hu]; exact W.smul_mem s w.2
    have huu : EvC u u = 1 := by
      rw [hu, EvC_smul_left, EvC_smul_right, hs, ← mul_assoc,
        show (cutSqrt (EvC (w:STVC) (w:STVC)))⁻¹ * (cutSqrt (EvC (w:STVC) (w:STVC)))⁻¹ * EvC (w:STVC) (w:STVC)
          = (cutSqrt (EvC (w:STVC) (w:STVC)) * cutSqrt (EvC (w:STVC) (w:STVC)))⁻¹ * EvC (w:STVC) (w:STVC) by rw [mul_inv],
        cutSqrt_sq (le_of_lt hwpos), inv_mul_cancel₀ (ne_of_gt hwpos)]
    have hueig : h u = μ • u := by
      rw [hu, map_smul, hweig, smul_comm]
    set h' : Module.End Cut STVC := deflateC h μ u with hh'
    have hh'sym : IsEvCSymm h' := deflateC_isEvCSymm hh μ u
    have hh'map : ∀ p, h' p ∈ (W ⊓ uPerp u : Submodule Cut STVC) := by
      intro p
      rw [Submodule.mem_inf]
      refine ⟨?_, ?_⟩
      · rw [hh', deflateC_apply]
        exact W.sub_mem (hmap p) (W.smul_mem _ huW)
      · rw [mem_uPerp]
        exact deflateC_image_orth hh huu hueig p
    have hfr : Module.finrank Cut (W ⊓ uPerp u : Submodule Cut STVC) = k := by
      rw [finrank_inf_uPerp_within huu huW, hW]
      omega
    obtain ⟨n', l', u', hu'mem, hu'orth, hh'eq⟩ := ih h' hh'sym (W ⊓ uPerp u) hfr hh'map
    refine ⟨n' + 1, Fin.snoc l' μ, Fin.snoc u' u, ?_, ?_, ?_⟩
    · intro i
      refine Fin.lastCases ?_ ?_ i
      · rw [Fin.snoc_last]; exact huW
      · intro j; rw [Fin.snoc_castSucc]; exact (hu'mem j).1
    · intro i j
      refine Fin.lastCases ?_ ?_ i <;> refine Fin.lastCases ?_ ?_ j
      · rw [Fin.snoc_last, huu]; simp
      · intro jj
        rw [Fin.snoc_last, Fin.snoc_castSucc]
        have huperp : EvC u (u' jj) = 0 := (mem_uPerp u (u' jj)).mp (hu'mem jj).2
        rw [huperp, if_neg (Fin.castSucc_lt_last jj).ne']
      · intro ii
        rw [Fin.snoc_castSucc, Fin.snoc_last]
        have huperp : EvC u (u' ii) = 0 := (mem_uPerp u (u' ii)).mp (hu'mem ii).2
        rw [EvC_symm (u' ii) u, huperp, if_neg (Fin.castSucc_lt_last ii).ne]
      · intro a b
        rw [Fin.snoc_castSucc, Fin.snoc_castSucc, hu'orth b a]
        simp only [Fin.castSucc_inj]
    · rw [specOpN_snoc, ← hh'eq, hh', deflateC]
      abel

/-- ★★★ THE FULL n-DIM SPECTRAL EXISTENCE: every `EvC`-self-adjoint operator `g` on `STVC` equals
    the rank-`n` spectral operator `specOpN l u` for an `EvC`-ORTHONORMAL eigen-family `{u i}` — the
    spectral theorem over the derived ℝ `Cut` and the positive-definite Born form `EvC`, with NO
    Mathlib spectral theory. The `W = ⊤` specialization of `specExists_aux`: the whole space is the
    initial support submodule, the existence induction peels every direction. This is the heavy
    group-manifold core the N78–N84 arc fed: every symmetric operator now has an explicit orthonormal
    eigen-decomposition `∑ i, (l i) • projC (u i)`, the spectral input the global polar/KAK assembly
    consumes (the operator square root of `g*g` is `specOpN (cutSqrt ∘ l) u`, N68 `specOpN_op_sqrt`). -/
theorem stvc_selfadj_specExists {g : Module.End Cut STVC} (hg : IsEvCSymm g) :
    ∃ (n : ℕ) (l : Fin n → Cut) (u : Fin n → STVC),
      (∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) ∧ g = specOpN l u := by
  obtain ⟨n, l, u, _, horth, hgeq⟩ :=
    specExists_aux (Module.finrank Cut (⊤ : Submodule Cut STVC)) g hg ⊤ rfl
      (fun p => Submodule.mem_top)
  exact ⟨n, l, u, horth, hgeq⟩

end

end Phys.Algebra
