import Phys.Algebra.LorentzContinuumSpectralExistFull

/-! MEASURE-FIRST probe N86a (extended): the GLOBAL POSITIVE PART of the polar decomposition
    + the eigenvector action + the strict-positivity-via-injectivity lever. -/

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators
variable {g h : Module.End Cut STVC}

-- (A) THE EIGENVECTOR ACTION: specOpN c u (u k) = c k • u k over an orthonormal family.
theorem specOpN_eigenvector {n : ℕ} {c : Fin n → Cut} {u : Fin n → STVC}
    (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) (k : Fin n) :
    specOpN c u (u k) = c k • u k := by
  rw [specOpN_apply]
  rw [Finset.sum_eq_single k]
  · rw [horth k k]; simp
  · intro i _ hik
    rw [horth i k, if_neg hik, mul_zero, zero_smul]
  · intro hk; exact absurd (Finset.mem_univ k) hk

-- (B) THE UNIT IS NONZERO: a unit vector (EvC u u = 1) is nonzero.
theorem orth_ne_zero {n : ℕ} {u : Fin n → STVC}
    (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) (k : Fin n) : u k ≠ 0 := by
  intro h0
  have hkk : EvC (u k) (u k) = 1 := by rw [horth k k]; simp
  rw [(EvC_eq_zero_iff (u k)).mpr h0] at hkk
  exact one_ne_zero hkk.symm

-- (C) THE EIGENVALUE-POSITIVITY (nonneg)
theorem specExists_eigen_nonneg {n : ℕ} {c : Fin n → Cut} {u : Fin n → STVC}
    (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0)
    (hpos : ∀ p, 0 ≤ EvC (specOpN c u p) p) (k : Fin n) : 0 ≤ c k := by
  have hk := hpos (u k)
  rwa [specOpN_read horth k] at hk

-- (D) STRICT-POSITIVITY-VIA-INJECTIVITY: if specOpN c u is injective then no eigenvalue is 0.
theorem specExists_eigen_ne_zero {n : ℕ} {c : Fin n → Cut} {u : Fin n → STVC}
    (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0)
    (hinj : Function.Injective (specOpN c u)) (k : Fin n) : c k ≠ 0 := by
  intro hck
  have hev : specOpN c u (u k) = specOpN c u 0 := by
    rw [specOpN_eigenvector horth k, hck, zero_smul, map_zero]
  exact orth_ne_zero horth k (hinj hev)

-- (E) STRICT-POSITIVITY: nonneg + injective → strictly positive eigenvalue (the invertibility lever).
theorem specExists_eigen_pos {n : ℕ} {c : Fin n → Cut} {u : Fin n → STVC}
    (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0)
    (hpos : ∀ p, 0 ≤ EvC (specOpN c u p) p) (hinj : Function.Injective (specOpN c u)) (k : Fin n) :
    0 < c k :=
  lt_of_le_of_ne (specExists_eigen_nonneg horth hpos k)
    (Ne.symm (specExists_eigen_ne_zero horth hinj k))

-- (F) THE GLOBAL POSITIVE PART (existence form): g*g = specOpN c u with nonneg eigenvalues.
theorem comp_specExists_nonneg (H : IsEvCAdjoint g h) :
    ∃ (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      (∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) ∧
      (∀ i, 0 ≤ c i) ∧ h.comp g = specOpN c u := by
  obtain ⟨n, c, u, horth, heq⟩ := stvc_selfadj_specExists H.comp_isEvCSymm
  refine ⟨n, c, u, horth, ?_, heq⟩
  intro k
  apply specExists_eigen_nonneg horth ?_ k
  intro p
  rw [← heq]
  exact H.comp_nonneg p

-- (G) THE GLOBAL POSITIVE OPERATOR SQUARE ROOT of g*g (the p^{1/2} factor of the polar decomp).
theorem comp_op_sqrt_exists (H : IsEvCAdjoint g h) :
    ∃ s : Module.End Cut STVC, IsEvCOpSqrt s (h.comp g) := by
  obtain ⟨n, c, u, horth, hc, heq⟩ := comp_specExists_nonneg H
  refine ⟨specOpN (fun i => cutSqrt (c i)) u, ?_⟩
  rw [heq]
  exact specOpN_op_sqrt hc horth

-- (H) NON-VACUITY: the self-adjoint boost generator's g*g has a positive operator square root.
theorem boostGenC_comp_op_sqrt_exists :
    ∃ s : Module.End Cut STVC, IsEvCOpSqrt s (boostGenC.comp boostGenC) :=
  comp_op_sqrt_exists boostGenC_self_adjoint

end

end Phys.Algebra
