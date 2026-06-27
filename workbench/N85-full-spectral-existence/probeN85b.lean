import Phys.Algebra.LorentzContinuumSubSeed

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut
noncomputable section
open scoped BigOperators
open Polynomial

theorem specOpN_snoc {n : ℕ} (l : Fin n → Cut) (u : Fin n → STVC) (μ : Cut) (uk : STVC) :
    specOpN (Fin.snoc l μ) (Fin.snoc u uk) = specOpN l u + μ • projC uk := by
  unfold specOpN
  rw [Fin.sum_univ_castSucc]
  simp only [Fin.snoc_castSucc, Fin.snoc_last]

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

/-- THE FULL SPECTRAL EXISTENCE HELPER — strong induction on `finrank W`. -/
theorem specExists_aux : ∀ (m : ℕ) (h : Module.End Cut STVC), IsEvCSymm h →
    ∀ (W : Submodule Cut STVC), Module.finrank Cut W = m → (∀ p, h p ∈ W) →
    ∃ (n : ℕ) (l : Fin n → Cut) (u : Fin n → STVC),
      (∀ i, u i ∈ W) ∧ (∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) ∧ h = specOpN l u := by
  intro m
  induction m with
  | zero =>
    intro h hh W hW hmap
    -- finrank W = 0, STVC finite-dim ⟹ W = ⊥ ⟹ h = 0
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
    -- restrict h to W
    have hWinv : ∀ x ∈ W, h x ∈ W := fun x _ => hmap x
    set T : Module.End Cut W := h.restrict hWinv with hT
    have hTcoe : ∀ p : W, (T p : STVC) = h (p : STVC) := fun p => rfl
    have hTsym : IsEvCSymmSub T := by
      intro p q
      rw [hTcoe, hTcoe]; exact hh (p : STVC) (q : STVC)
    obtain ⟨μ, hev⟩ := submodule_selfadj_has_eigenvalue hTsym
    obtain ⟨w, hw⟩ := hev.exists_hasEigenvector
    -- w : W, w ≠ 0, T w = μ • w
    have hwne : (w : STVC) ≠ 0 := fun hc => hw.2 (Subtype.ext (by rw [hc]; rfl))
    have hweig : h (w : STVC) = μ • (w : STVC) := by
      have := congrArg (Subtype.val) hw.apply_eq_smul
      rw [hTcoe] at this
      rw [this]; rfl
    -- normalize to unit u
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
    -- deflate
    set h' : Module.End Cut STVC := deflateC h μ u with hh'
    have hh'sym : IsEvCSymm h' := deflateC_isEvCSymm hh μ u
    -- image of h' ⊆ W ⊓ uPerp u
    have hh'map : ∀ p, h' p ∈ (W ⊓ uPerp u : Submodule Cut STVC) := by
      intro p
      rw [Submodule.mem_inf]
      refine ⟨?_, ?_⟩
      · rw [hh', deflateC_apply]
        exact W.sub_mem (hmap p) (W.smul_mem _ huW)
      · rw [mem_uPerp]
        exact deflateC_image_orth hh huu hueig p
    -- finrank drop
    have hfr : Module.finrank Cut (W ⊓ uPerp u : Submodule Cut STVC) = k := by
      rw [finrank_inf_uPerp_within huu huW, hW]
      omega
    obtain ⟨n', l', u', hu'mem, hu'orth, hh'eq⟩ := ih h' hh'sym (W ⊓ uPerp u) hfr hh'map
    -- reconstruct
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

/-- ★★★ THE FULL n-DIM SPECTRAL EXISTENCE: every `EvC`-self-adjoint operator on `STVC` equals
    `specOpN l u` for an EvC-orthonormal eigen-family. -/
theorem stvc_selfadj_specExists {g : Module.End Cut STVC} (hg : IsEvCSymm g) :
    ∃ (n : ℕ) (l : Fin n → Cut) (u : Fin n → STVC),
      (∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) ∧ g = specOpN l u := by
  obtain ⟨n, l, u, _, horth, hgeq⟩ :=
    specExists_aux (Module.finrank Cut (⊤ : Submodule Cut STVC)) g hg ⊤ rfl
      (fun p => Submodule.mem_top)
  exact ⟨n, l, u, horth, hgeq⟩

#print axioms specOpN_snoc
#print axioms finrank_inf_uPerp_within
#print axioms specExists_aux
#print axioms stvc_selfadj_specExists

end
end Phys.Algebra
