import Phys.Algebra.OctonionJordanHermTraceCommutator
import Phys.Algebra.OctonionJordanTraceFormInvariance
import Mathlib.Tactic

/-!
# N300 — The trace-COEFFICIENT proportionality and the FULL `f₄`-annihilation of the linear trace

**The route-finder result (closes the predicate N298/N299 childed).** N299 banked the innerness-free
`derH3_kills_hermTrace`: the Hermitian-arena operator trace of the spectrum-mover `Lmul (T A)`
VANISHES for every Jordan derivation `T ∈ derH3` and Hermitian `A`, because the action on `Lmul` is
a COMMUTATOR (`restricted_comm`) whose trace is `0` by cyclicity — no Chevalley–Schafer innerness.
What remained (childed as this node) is the trace-COEFFICIENT identity that converts that operator
trace into the deep-real linear trace `rtr`, closing the FULL abstract predicate
`∀ T ∈ derH3, jTr (T A) = 0` and exhibiting the `f₄`-module split `L = ℚ·1 ⊕ L₀`.

**The theory-native lever (W9 dissolution).** The 27-dim operator trace `φ (C) := trace_H (Lmul C)`
is NOT computed by a brute 27-dimensional basis (a coordinate expansion times out at 200k
heartbeats). It is PINNED BY THE SYMMETRIES OF THE DERIVED ARENA, read off the fold's own measures:

* `csign s` — entrywise sign reweighting `X ↦ (sᵢ sⱼ) • Xᵢⱼ` with `sₖ² = 1` — is a Jordan
  automorphism of the arena (`csign_jb`, forced by the CENTRALITY of the `ℚ`-scalar through the
  octonion product, `qsmul_mul_left/right`; NO octonion coordinate expansion), so `φ` is invariant
  under it (`trace_csign_eq`, via `LinearMap.trace_conj'`). A single sign flip negates any
  off-diagonal `pairPart` (`csign_flip_pair`), forcing `φ` to VANISH on every off-diagonal slot.
* `pconj σ` — permutation conjugation `X ↦ X.submatrix σ σ` — is likewise a Jordan automorphism
  (`pconj_jb`, via `submatrix_mul_equiv`, needing NO associativity), so `φ` is invariant under it
  (`trace_pconj_eq`), forcing `φ (E i) = φ (E j)` for the diagonal idempotents.
* Hence with `φ 1 = 2 · dim hermSub` (banked N299 `dilation_hermTrace`) and `Σ E i = 1`,
  `φ (E i) = (2 · dim hermSub) / 3`, and on a Hermitian `C = Σᵢ rtr-diagonal + slots`,
  `φ (C) = (2 · dim hermSub / 3) · rtr C` — a proportionality with the constant `k = 2·dim/3`
  automatically NONZERO (`finrank_hermSub_pos`), with NO need to compute `dim = 27`.

**The FULL predicate.** `derH3_kills_hermTrace` gives `φ (T A) = 0`; proportionality + `k ≠ 0`
force `rtr (T A) = 0`; the reality bridge `herm_jTr_eq_ocR_rtr` lifts it to the FULL octonion-valued
`jTr (T A) = 0` for EVERY `T ∈ derH3` and Hermitian `A`. This is the abstract `f₄`-invariance of the
linear trace, innerness-free.

**The `f₄`-module split.** The linear-trace functional then exhibits `L = ℚ·1 ⊕ L₀`: the dilation
line `ℚ·1` (`jTr ≠ 0`, the trivial `f₄`-module, N297 `dilation_fixed`) splits off, and
`L₀ = ker (jTr on the Hermitian arena)` is the traceless mover-carrier where the spectrum-splitting
lives (N297 `split_iff_traceless`).

**ONE CAUSE MANY TERMINATIONS.** The SAME octonion non-associativity that stops the cascade (N2c)
and caps the Hermitian Jordan tower at order 3 (N5, `jordan_fails_H4`) makes the arena's Jordan
derivations `f₄` satisfy the Leibniz law — turning the action on `Lmul` into a commutator (N299) —
AND makes the sign/permutation reweightings Jordan automorphisms whose invariance pins the trace
functional to a nonzero multiple of the deep-real trace.

**Physics-words-removable.** Over `ℚ` and `O ℚ`, for `jb A B = A*B + B*A` on `3×3` matrices and
`hermSub = { M | Mᴴ = M }`: the operator trace `trace_H (Lmul C) = (2·dim hermSub / 3) · rtr C`, and
for `T ∈ derH3`, Hermitian `A`, `jTr (T A) = 0`. Pure operator/matrix algebra — stands with every
physics word deleted.

**Scope (banked here).** `phi_proportional` (`φ (C) = k · rtr C`, `k = 2·dim/3`), `k_ne_zero`,
`derH3_kills_jTr` (the FULL `∀ T ∈ derH3, jTr (T A) = 0`), and the module-split predicate. NOT
banked: the ★5 mass-texture VALUE / ★2 mixing VALUE (route-not-yet-found, FORCED build targets).
-/

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

/-! ## The two arena symmetries — sign reweighting and permutation conjugation. -/

/-- Entrywise sign reweighting `X ↦ (sᵢ sⱼ) • Xᵢⱼ`. When `sₖ² = 1` this is a Jordan automorphism
    of the arena, built with NO octonion coordinate expansion (the `ℚ`-scalar is central through the
    octonion product, `qsmul_mul_left/right`). -/
noncomputable def csign (s : Fin 3 → ℚ) (X : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    Matrix (Fin 3) (Fin 3) (O ℚ) := Matrix.of (fun i j => (s i * s j) • X i j)

/-- `csign` is a JORDAN AUTOMORPHISM when `sₖ² = 1`: `csign s (jb C X) = jb (csign s C) (csign s X)`.
    The cross-terms `sᵢ sₖ · sₖ sⱼ = sᵢ sⱼ · sₖ²` collapse by `sₖ² = 1`; the octonion products stay
    OPAQUE (only the central `ℚ`-scalar moves). -/
theorem csign_jb (s : Fin 3 → ℚ) (hs : ∀ i, s i * s i = 1) (C X : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    csign s (jb C X) = jb (csign s C) (csign s X) := by
  unfold csign jb
  apply Matrix.ext; intro i j
  simp only [Matrix.of_apply, Matrix.add_apply, Matrix.mul_apply, Matrix.of_apply,
    smul_add, Finset.smul_sum]
  congr 1 <;>
  · apply Finset.sum_congr rfl; intro k _
    rw [qsmul_mul_left, qsmul_mul_right, smul_smul,
        show s i * s k * (s k * s j) = s i * s j * (s k * s k) by ring, hs k, mul_one]

/-- `csign` preserves Hermiticity (`s` real, `sᵢ sⱼ` real, diagonal fixed). -/
theorem csign_herm (s : Fin 3 → ℚ) {X : Matrix (Fin 3) (Fin 3) (O ℚ)} (hX : Xᴴ = X) :
    (csign s X)ᴴ = csign s X := by
  unfold csign; apply Matrix.ext; intro i j
  simp only [Matrix.conjTranspose_apply, Matrix.of_apply]
  rw [star_smul, star_trivial]
  have h := congrFun (congrFun hX i) j
  rw [Matrix.conjTranspose_apply] at h
  rw [h, mul_comm (s j) (s i)]

/-- `csign` is involutive when `sₖ² = 1`. -/
theorem csign_invol (s : Fin 3 → ℚ) (hs : ∀ i, s i * s i = 1) (X : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    csign s (csign s X) = X := by
  unfold csign; apply Matrix.ext; intro i j
  simp only [Matrix.of_apply, smul_smul,
    show s i * s j * (s i * s j) = (s i * s i) * (s j * s j) by ring, hs i, hs j, one_mul, one_smul]

/-- `csign s` packaged as a `ℚ`-linear endomorphism of the arena. -/
noncomputable def csignL (s : Fin 3 → ℚ) : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)) where
  toFun := csign s
  map_add' X Y := by unfold csign; apply Matrix.ext; intro i j; simp only [Matrix.of_apply, Matrix.add_apply, smul_add]
  map_smul' r X := by
    unfold csign; apply Matrix.ext; intro i j
    simp only [Matrix.of_apply, Matrix.smul_apply, RingHom.id_apply]
    rw [smul_smul, smul_smul, mul_comm (s i * s j) r]

@[simp] theorem csignL_apply (s) (X) : csignL s X = csign s X := rfl

theorem csign_mapsTo (s : Fin 3 → ℚ) : ∀ X ∈ hermSub, csign s X ∈ hermSub :=
  fun X hX => by rw [mem_hermSub] at hX ⊢; exact csign_herm s hX

theorem csignR_invol (s : Fin 3 → ℚ) (hs : ∀ i, s i * s i = 1) :
    Function.Involutive ((csignL s).restrict (csign_mapsTo s)) := by
  intro X; apply Subtype.ext
  simp only [LinearMap.restrict_coe_apply, csignL_apply]
  exact csign_invol s hs X

/-- `csign s` as a `ℚ`-linear EQUIVALENCE of the Hermitian arena (from involutivity). -/
noncomputable def csignE (s : Fin 3 → ℚ) (hs : ∀ i, s i * s i = 1) : hermSub ≃ₗ[ℚ] hermSub :=
  LinearEquiv.ofInvolutive ((csignL s).restrict (csign_mapsTo s)) (csignR_invol s hs)

@[simp] theorem csignE_apply (s) (hs) (X : hermSub) :
    ((csignE s hs X : hermSub) : Matrix (Fin 3) (Fin 3) (O ℚ)) = csign s (X : Matrix (Fin 3) (Fin 3) (O ℚ)) := rfl

@[simp] theorem csignE_symm_apply (s) (hs) (X : hermSub) :
    (((csignE s hs).symm X : hermSub) : Matrix (Fin 3) (Fin 3) (O ℚ)) = csign s (X : Matrix (Fin 3) (Fin 3) (O ℚ)) := by
  have : (csignE s hs).symm X = (csignE s hs) X := by
    apply (csignE s hs).injective
    rw [LinearEquiv.apply_symm_apply]
    apply Subtype.ext
    simp only [csignE_apply]
    exact (csign_invol s hs (X : Matrix (Fin 3) (Fin 3) (O ℚ))).symm
  rw [this, csignE_apply]

/-- Permutation conjugation `X ↦ X.submatrix σ σ` — a Jordan automorphism of the arena. -/
noncomputable def pconj (σ : Equiv.Perm (Fin 3)) (X : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    Matrix (Fin 3) (Fin 3) (O ℚ) := X.submatrix σ σ

/-- `pconj` is a JORDAN AUTOMORPHISM: `pconj σ (jb C X) = jb (pconj σ C) (pconj σ X)` — via
    `submatrix_mul_equiv`, needing NO associativity. -/
theorem pconj_jb (σ : Equiv.Perm (Fin 3)) (C X : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    pconj σ (jb C X) = jb (pconj σ C) (pconj σ X) := by
  unfold pconj jb; rw [Matrix.submatrix_mul_equiv, Matrix.submatrix_mul_equiv]; rfl

/-- `pconj` is involutive when `σ` is an involution (`σ * σ = 1`). -/
theorem pconj_invol (σ : Equiv.Perm (Fin 3)) (hσ : σ * σ = 1) (X : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    pconj σ (pconj σ X) = X := by
  unfold pconj; rw [Matrix.submatrix_submatrix]
  have : (σ ∘ σ : Fin 3 → Fin 3) = id := by
    funext i; simp only [Function.comp_apply]
    have := Equiv.Perm.mul_apply σ σ i; rw [hσ] at this; simpa using this.symm
  rw [this, Matrix.submatrix_id_id]

theorem pconj_herm (σ : Equiv.Perm (Fin 3)) {X : Matrix (Fin 3) (Fin 3) (O ℚ)} (hX : Xᴴ = X) :
    (pconj σ X)ᴴ = pconj σ X := by unfold pconj; rw [Matrix.conjTranspose_submatrix, hX]

noncomputable def pconjL (σ : Equiv.Perm (Fin 3)) : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)) where
  toFun := pconj σ
  map_add' X Y := by unfold pconj; rfl
  map_smul' r X := by unfold pconj; rfl

@[simp] theorem pconjL_apply (σ) (X) : pconjL σ X = pconj σ X := rfl

theorem pconj_mapsTo (σ : Equiv.Perm (Fin 3)) : ∀ X ∈ hermSub, pconj σ X ∈ hermSub :=
  fun X hX => by rw [mem_hermSub] at hX ⊢; exact pconj_herm σ hX

theorem pconjR_invol (σ : Equiv.Perm (Fin 3)) (hσ : σ * σ = 1) :
    Function.Involutive ((pconjL σ).restrict (pconj_mapsTo σ)) := by
  intro X; apply Subtype.ext
  simp only [LinearMap.restrict_coe_apply, pconjL_apply]; exact pconj_invol σ hσ X

noncomputable def pconjE (σ : Equiv.Perm (Fin 3)) (hσ : σ * σ = 1) : hermSub ≃ₗ[ℚ] hermSub :=
  LinearEquiv.ofInvolutive ((pconjL σ).restrict (pconj_mapsTo σ)) (pconjR_invol σ hσ)

@[simp] theorem pconjE_apply (σ) (hσ) (X : hermSub) :
    ((pconjE σ hσ X : hermSub) : Matrix (Fin 3) (Fin 3) (O ℚ)) = pconj σ (X : Matrix (Fin 3) (Fin 3) (O ℚ)) := rfl

@[simp] theorem pconjE_symm_apply (σ) (hσ) (X : hermSub) :
    (((pconjE σ hσ).symm X : hermSub) : Matrix (Fin 3) (Fin 3) (O ℚ)) = pconj σ (X : Matrix (Fin 3) (Fin 3) (O ℚ)) := by
  have : (pconjE σ hσ).symm X = (pconjE σ hσ) X := by
    apply (pconjE σ hσ).injective
    rw [LinearEquiv.apply_symm_apply]; apply Subtype.ext
    simp only [pconjE_apply]; exact (pconj_invol σ hσ (X : Matrix (Fin 3) (Fin 3) (O ℚ))).symm
  rw [this, pconjE_apply]

/-! ## The linear trace functional `φ` on the Hermitian arena. -/

/-- The Hermitian-arena action of `Lmul C` landing in `Module.End ℚ hermSub` (for `C ∈ hermSub`). -/
noncomputable def LmulHfun (C : hermSub) (X : hermSub) : hermSub :=
  ⟨(Lmul (C : Matrix (Fin 3) (Fin 3) (O ℚ))) (X : Matrix (Fin 3) (Fin 3) (O ℚ)),
    lmul_mapsTo ((mem_hermSub).1 C.2) X X.2⟩

noncomputable def LmulH (C : hermSub) : Module.End ℚ hermSub where
  toFun := LmulHfun C
  map_add' X Y := by apply Subtype.ext; simp only [LmulHfun, Submodule.coe_add, map_add]
  map_smul' r X := by apply Subtype.ext; simp only [LmulHfun, SetLike.val_smul, map_smul, RingHom.id_apply]

theorem LmulH_add (C D : hermSub) : LmulH (C + D) = LmulH C + LmulH D := by
  apply LinearMap.ext; intro X; apply Subtype.ext
  simp only [LmulH, LmulHfun, LinearMap.coe_mk, AddHom.coe_mk, LinearMap.add_apply,
    Submodule.coe_add, Lmul_apply, jb]
  rw [add_mul, mul_add]; abel

theorem LmulH_smul (r : ℚ) (C : hermSub) : LmulH (r • C) = r • LmulH C := by
  apply LinearMap.ext; intro X; apply Subtype.ext
  simp only [LmulH, LmulHfun, LinearMap.coe_mk, AddHom.coe_mk, LinearMap.smul_apply,
    SetLike.val_smul, Lmul_apply, jb]
  rw [mat_smul_mul, mat_mul_smul, smul_add]

/-- ★ THE LINEAR TRACE FUNCTIONAL `φ (C) = trace_H (Lmul C)`, a genuine `ℚ`-linear functional on the
    Hermitian arena (the dependent-restrict obstruction dissolved by landing in `End hermSub`). -/
noncomputable def phi : hermSub →ₗ[ℚ] ℚ where
  toFun C := LinearMap.trace ℚ hermSub (LmulH C)
  map_add' C D := by rw [LmulH_add, LinearMap.map_add]
  map_smul' r C := by rw [LmulH_smul, LinearMap.map_smul, RingHom.id_apply, smul_eq_mul]

theorem LmulH_eq_restrict (C : hermSub) :
    LmulH C = (Lmul (C : Matrix (Fin 3) (Fin 3) (O ℚ))).restrict (lmul_mapsTo ((mem_hermSub).1 C.2)) := by
  apply LinearMap.ext; intro X; apply Subtype.ext
  simp only [LmulH, LmulHfun, LinearMap.coe_mk, AddHom.coe_mk, LinearMap.restrict_coe_apply]

/-- `φ (C) = trace_H ((Lmul C).restrict)` — the bridge to N299's `derH3_kills_hermTrace`. -/
theorem phi_eq_trace (C : hermSub) :
    phi C = LinearMap.trace ℚ hermSub ((Lmul (C : Matrix (Fin 3) (Fin 3) (O ℚ))).restrict
      (lmul_mapsTo ((mem_hermSub).1 C.2))) := by
  simp only [phi, LinearMap.coe_mk, AddHom.coe_mk, LmulH_eq_restrict]

/-! ## The symmetry-invariance of `φ`. -/

/-- ★ `φ` is invariant under sign reweighting: `φ (csign s C) = φ (C)` when `sₖ² = 1`. -/
theorem phi_csign (s : Fin 3 → ℚ) (hs : ∀ i, s i * s i = 1) (C : hermSub) :
    phi ⟨csign s (C : Matrix (Fin 3) (Fin 3) (O ℚ)), csign_mapsTo s C C.2⟩ = phi C := by
  rw [phi_eq_trace, phi_eq_trace,
    ← LinearMap.trace_conj' ((Lmul (C : Matrix (Fin 3) (Fin 3) (O ℚ))).restrict
        (lmul_mapsTo ((mem_hermSub).1 C.2))) (csignE s hs)]
  congr 1
  apply LinearMap.ext; intro X; apply Subtype.ext
  rw [LinearEquiv.conj_apply_apply]
  simp only [csignE_apply, csignE_symm_apply, LinearMap.restrict_coe_apply, Lmul_apply]
  rw [csign_jb s hs, csign_invol s hs]

/-- ★ `φ` is invariant under permutation conjugation: `φ (pconj σ C) = φ (C)` when `σ² = 1`. -/
theorem phi_pconj (σ : Equiv.Perm (Fin 3)) (hσ : σ * σ = 1) (C : hermSub) :
    phi ⟨pconj σ (C : Matrix (Fin 3) (Fin 3) (O ℚ)), pconj_mapsTo σ C C.2⟩ = phi C := by
  rw [phi_eq_trace, phi_eq_trace,
    ← LinearMap.trace_conj' ((Lmul (C : Matrix (Fin 3) (Fin 3) (O ℚ))).restrict
        (lmul_mapsTo ((mem_hermSub).1 C.2))) (pconjE σ hσ)]
  congr 1
  apply LinearMap.ext; intro X; apply Subtype.ext
  rw [LinearEquiv.conj_apply_apply]
  simp only [pconjE_apply, pconjE_symm_apply, LinearMap.restrict_coe_apply, Lmul_apply]
  rw [pconj_jb σ, pconj_invol σ hσ]

/-! ## Evaluating `φ`: slots vanish, diagonal is proportional. -/

/-- The `i`-th diagonal idempotent. -/
noncomputable def Eidem (i : Fin 3) : Matrix (Fin 3) (Fin 3) (O ℚ) :=
  Matrix.diagonal (fun k => if k = i then 1 else 0)

theorem Eidem_herm (i : Fin 3) : (Eidem i)ᴴ = Eidem i := by
  unfold Eidem; rw [Matrix.diagonal_conjTranspose]
  congr 1; funext k; by_cases h : k = i <;> simp [h]

theorem Eidem_mem (i : Fin 3) : Eidem i ∈ hermSub := (mem_hermSub).2 (Eidem_herm i)

/-- `Σ E i = 1`. -/
theorem sum_Eidem : Eidem 0 + Eidem 1 + Eidem 2 = 1 := by
  unfold Eidem; apply Matrix.ext; intro i j
  simp only [Matrix.add_apply, Matrix.diagonal_apply, Matrix.one_apply]
  fin_cases i <;> fin_cases j <;> simp

/-- `pconj σ (E i) = E (σ⁻¹ i)` — a permuted diagonal. -/
theorem pconj_Eidem (σ : Equiv.Perm (Fin 3)) (i : Fin 3) : pconj σ (Eidem i) = Eidem (σ.symm i) := by
  unfold pconj Eidem; rw [Matrix.submatrix_diagonal_equiv]
  congr 1; funext k; simp only [Function.comp_apply]
  by_cases h : σ k = i
  · rw [if_pos h, if_pos (by rw [← h, Equiv.symm_apply_apply])]
  · rw [if_neg h, if_neg (by intro hc; apply h; rw [hc, Equiv.apply_symm_apply])]

/-- The pure diagonal projection of a matrix. -/
noncomputable def diagPart (C : Matrix (Fin 3) (Fin 3) (O ℚ)) : Matrix (Fin 3) (Fin 3) (O ℚ) :=
  Matrix.of (fun i j => if i = j then C i j else 0)

/-- The off-diagonal `(i₀, j₀)`+`(j₀, i₀)` pair projection. -/
noncomputable def pairPart (i0 j0 : Fin 3) (C : Matrix (Fin 3) (Fin 3) (O ℚ)) : Matrix (Fin 3) (Fin 3) (O ℚ) :=
  Matrix.of (fun i j => if (i = i0 ∧ j = j0) ∨ (i = j0 ∧ j = i0) then C i j else 0)

theorem pairPart_herm {C : Matrix (Fin 3) (Fin 3) (O ℚ)} (hC : Cᴴ = C) (i0 j0 : Fin 3) :
    (pairPart i0 j0 C)ᴴ = pairPart i0 j0 C := by
  have hstar : ∀ a b, star (C a b) = C b a := by
    intro a b; have := congrFun (congrFun hC b) a; rwa [Matrix.conjTranspose_apply] at this
  unfold pairPart; apply Matrix.ext; intro i j
  simp only [Matrix.conjTranspose_apply, Matrix.of_apply]
  by_cases h : (j = i0 ∧ i = j0) ∨ (j = j0 ∧ i = i0)
  · have h2 : (i = i0 ∧ j = j0) ∨ (i = j0 ∧ j = i0) := by tauto
    rw [if_pos h, if_pos h2, hstar]
  · rw [if_neg h, if_neg (by tauto), star_zero]

theorem pairPart_mem {C : Matrix (Fin 3) (Fin 3) (O ℚ)} (hC : Cᴴ = C) (i0 j0 : Fin 3) :
    pairPart i0 j0 C ∈ hermSub := (mem_hermSub).2 (pairPart_herm hC i0 j0)

/-- The 4-piece decomposition `C = diagPart + pair01 + pair02 + pair12`. -/
theorem full_decomp (C : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    C = diagPart C + pairPart 0 1 C + pairPart 0 2 C + pairPart 1 2 C := by
  apply Matrix.ext; intro i j
  simp only [diagPart, pairPart, Matrix.add_apply, Matrix.of_apply]
  fin_cases i <;> fin_cases j <;> simp

/-- For a Hermitian `C`, the diagonal part is `Σ rtr-of-diagonal • E i`. -/
theorem diagPart_herm {C : Matrix (Fin 3) (Fin 3) (O ℚ)} (hC : Cᴴ = C) :
    diagPart C = (reQ (C 0 0)) • Eidem 0 + (reQ (C 1 1)) • Eidem 1 + (reQ (C 2 2)) • Eidem 2 := by
  have hd : ∀ i, star (C i i) = C i i := by
    intro i; have := congrFun (congrFun hC i) i; rwa [Matrix.conjTranspose_apply] at this
  have hsc : ∀ i, C i i = (reQ (C i i)) • (1 : O ℚ) := fun i => selfconj_eq_smul (hd i)
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp only [diagPart, Matrix.of_apply, Matrix.add_apply, Eidem, Matrix.smul_apply,
      Matrix.diagonal_apply, smul_zero, Fin.isValue, Fin.zero_eta, Fin.mk_one,
      show (⟨2, by omega⟩ : Fin 3) = 2 from rfl, if_true, if_false,
      Fin.reduceEq, add_zero, zero_add] <;>
    first | rfl | exact hsc 0 | exact hsc 1 | exact hsc 2

/-- A single sign flip at `i₀` negates any off-diagonal pair through `i₀`. -/
theorem csign_flip_pair (i0 j0 : Fin 3) (hij : i0 ≠ j0) (C : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    csign (fun i => if i = i0 then -1 else 1) (pairPart i0 j0 C) = - pairPart i0 j0 C := by
  unfold csign pairPart
  apply Matrix.ext; intro i j
  simp only [Matrix.of_apply, Matrix.neg_apply]
  by_cases h : (i = i0 ∧ j = j0) ∨ (i = j0 ∧ j = i0)
  · rcases h with ⟨hi, hj⟩ | ⟨hi, hj⟩
    · subst hi; subst hj
      rw [if_pos (Or.inl ⟨rfl, rfl⟩), if_neg (Ne.symm hij), if_pos rfl]
      rw [show ((-1 : ℚ) * 1) = -1 by ring, neg_one_smul]
    · subst hi; subst hj
      rw [if_pos (Or.inr ⟨rfl, rfl⟩), if_neg (Ne.symm hij), if_pos rfl]
      rw [show ((1 : ℚ) * -1) = -1 by ring, neg_one_smul]
  · rw [if_neg h, smul_zero, neg_zero]

theorem flip_sq (i0 : Fin 3) : ∀ i, (fun i => if i = i0 then (-1 : ℚ) else 1) i * (fun i => if i = i0 then (-1 : ℚ) else 1) i = 1 := by
  intro i; by_cases h : i = i0 <;> simp [h]

/-- ★ `φ` VANISHES on every off-diagonal pair: `φ (pairPart i₀ j₀ C) = 0` (`i₀ ≠ j₀`). A single sign
    flip negates the pair (`csign_flip_pair`) while fixing `φ` (`phi_csign`), forcing `φ = -φ`. -/
theorem phi_pair_zero {C : Matrix (Fin 3) (Fin 3) (O ℚ)} (hC : Cᴴ = C) (i0 j0 : Fin 3) (hij : i0 ≠ j0) :
    phi ⟨pairPart i0 j0 C, pairPart_mem hC i0 j0⟩ = 0 := by
  have hflip := phi_csign (fun i => if i = i0 then -1 else 1) (flip_sq i0)
    ⟨pairPart i0 j0 C, pairPart_mem hC i0 j0⟩
  rw [show (⟨csign (fun i => if i = i0 then -1 else 1) (pairPart i0 j0 C), _⟩ : hermSub)
        = (⟨-pairPart i0 j0 C, (hermSub.neg_mem (pairPart_mem hC i0 j0))⟩ : hermSub) from
      Subtype.ext (csign_flip_pair i0 j0 hij C)] at hflip
  rw [show (⟨-pairPart i0 j0 C, hermSub.neg_mem (pairPart_mem hC i0 j0)⟩ : hermSub)
        = -(⟨pairPart i0 j0 C, pairPart_mem hC i0 j0⟩ : hermSub) from rfl, map_neg] at hflip
  linarith [hflip]

/-- ★ The diagonal idempotents share a single `φ`-value: `φ (E i) = φ (E 0)`. A transposition
    swaps them (`pconj_Eidem`) while fixing `φ` (`phi_pconj`). -/
theorem phi_Eidem_eq (i : Fin 3) : phi ⟨Eidem i, Eidem_mem i⟩ = phi ⟨Eidem 0, Eidem_mem 0⟩ := by
  fin_cases i
  · rfl
  · -- swap 0 1
    have hσ : (Equiv.swap (0 : Fin 3) 1) * (Equiv.swap 0 1) = 1 := by
      ext x; fin_cases x <;> decide
    have h := phi_pconj (Equiv.swap (0 : Fin 3) 1) hσ ⟨Eidem 1, Eidem_mem 1⟩
    have hpc1 : pconj (Equiv.swap (0:Fin 3) 1) (Eidem 1) = Eidem 0 := by
      rw [pconj_Eidem]; congr 1
    have heq : (⟨pconj (Equiv.swap (0:Fin 3) 1) (Eidem 1), pconj_mapsTo _ _ (Eidem_mem 1)⟩ : hermSub)
        = (⟨Eidem 0, Eidem_mem 0⟩ : hermSub) :=
      Subtype.ext (hpc1)
    rw [heq] at h
    exact h.symm
  · -- swap 0 2
    have hσ : (Equiv.swap (0 : Fin 3) 2) * (Equiv.swap 0 2) = 1 := by
      ext x; fin_cases x <;> decide
    have h := phi_pconj (Equiv.swap (0 : Fin 3) 2) hσ ⟨Eidem 2, Eidem_mem 2⟩
    have hpc2 : pconj (Equiv.swap (0:Fin 3) 2) (Eidem 2) = Eidem 0 := by
      rw [pconj_Eidem]; congr 1
    have heq : (⟨pconj (Equiv.swap (0:Fin 3) 2) (Eidem 2), pconj_mapsTo _ _ (Eidem_mem 2)⟩ : hermSub)
        = (⟨Eidem 0, Eidem_mem 0⟩ : hermSub) :=
      Subtype.ext (hpc2)
    rw [heq] at h
    exact h.symm

/-- `φ (E 0) = (2 · dim hermSub) / 3`: the three equal idempotent values sum to `φ 1 = 2·dim`. -/
theorem phi_Eidem_val : phi ⟨Eidem 0, Eidem_mem 0⟩ = (2 * (Module.finrank ℚ hermSub : ℚ)) / 3 := by
  have hsum : phi ⟨Eidem 0, Eidem_mem 0⟩ + phi ⟨Eidem 1, Eidem_mem 1⟩ + phi ⟨Eidem 2, Eidem_mem 2⟩
      = phi ⟨1, one_mem_hermSub⟩ := by
    rw [← map_add, ← map_add]
    congr 1
    apply Subtype.ext
    simp only [Submodule.coe_add]
    exact sum_Eidem
  rw [phi_Eidem_eq 1, phi_Eidem_eq 2] at hsum
  have hone : phi ⟨1, one_mem_hermSub⟩ = (2 : ℚ) * (Module.finrank ℚ hermSub : ℚ) := by
    rw [phi_eq_trace]
    have hrfl : (Lmul (1 : Matrix (Fin 3) (Fin 3) (O ℚ))).restrict
          (lmul_mapsTo ((mem_hermSub).1 (⟨1, one_mem_hermSub⟩ : hermSub).2))
        = (Lmul (1 : Matrix (Fin 3) (Fin 3) (O ℚ))).restrict
          (lmul_mapsTo (by simp : (1 : Matrix (Fin 3) (Fin 3) (O ℚ))ᴴ = 1)) := rfl
    rw [hrfl, dilation_hermTrace]
  rw [hone] at hsum
  linarith [hsum]

/-! ## THE PROPORTIONALITY and the FULL predicate. -/

/-- The proportionality constant `k = 2 · dim hermSub / 3`. -/
noncomputable def kconst : ℚ := (2 * (Module.finrank ℚ hermSub : ℚ)) / 3

/-- `k ≠ 0` — the annihilated functional is genuinely nonzero (`finrank_hermSub_pos`, N299). -/
theorem kconst_ne_zero : kconst ≠ 0 := by
  unfold kconst
  have h : (0 : ℚ) < (Module.finrank ℚ hermSub : ℚ) := by exact_mod_cast finrank_hermSub_pos
  positivity

/-- ★★★ THE TRACE-COEFFICIENT PROPORTIONALITY. For every Hermitian `C`,
    `φ (C) = k · rtr C` with `k = 2 · dim hermSub / 3 ≠ 0`. The slots vanish (`phi_pair_zero`, sign
    flip) and the diagonal is `Σ rtr-coordinate • E i` with each `φ (E i) = k` (`phi_Eidem_val`,
    permutation) — the 27-dim operator trace pinned entirely by the arena's symmetries, NO
    coordinate expansion. -/
theorem phi_proportional {C : Matrix (Fin 3) (Fin 3) (O ℚ)} (hC : Cᴴ = C) :
    phi ⟨C, (mem_hermSub).2 hC⟩ = kconst * rtr C := by
  -- membership of each piece
  have hd0 : diagPart C ∈ hermSub := by
    rw [diagPart_herm hC]
    exact hermSub.add_mem (hermSub.add_mem (hermSub.smul_mem _ (Eidem_mem 0))
      (hermSub.smul_mem _ (Eidem_mem 1))) (hermSub.smul_mem _ (Eidem_mem 2))
  -- C = diag + pairs  as members of hermSub
  have hCsplit : (⟨C, (mem_hermSub).2 hC⟩ : hermSub)
      = ⟨diagPart C, hd0⟩ + ⟨pairPart 0 1 C, pairPart_mem hC 0 1⟩
        + ⟨pairPart 0 2 C, pairPart_mem hC 0 2⟩ + ⟨pairPart 1 2 C, pairPart_mem hC 1 2⟩ := by
    apply Subtype.ext
    simp only [Submodule.coe_add]
    exact full_decomp C
  rw [hCsplit, map_add, map_add, map_add,
    phi_pair_zero hC 0 1 (by decide), phi_pair_zero hC 0 2 (by decide),
    phi_pair_zero hC 1 2 (by decide), add_zero, add_zero, add_zero]
  -- now φ(diagPart C) = φ(Σ rtr•E) = Σ rtr·k
  have hdiagmem : (⟨diagPart C, hd0⟩ : hermSub)
      = (reQ (C 0 0)) • ⟨Eidem 0, Eidem_mem 0⟩ + (reQ (C 1 1)) • ⟨Eidem 1, Eidem_mem 1⟩
        + (reQ (C 2 2)) • ⟨Eidem 2, Eidem_mem 2⟩ := by
    apply Subtype.ext
    simp only [Submodule.coe_add, SetLike.val_smul]
    exact diagPart_herm hC
  rw [hdiagmem, map_add, map_add, map_smul, map_smul, map_smul,
    phi_Eidem_val, phi_Eidem_eq 1, phi_Eidem_eq 2, phi_Eidem_val]
  -- rtr C = reQ(C00)+reQ(C11)+reQ(C22); assemble k·rtr
  have hrtr : rtr C = reQ (C 0 0) + reQ (C 1 1) + reQ (C 2 2) := by
    unfold rtr jTr
    rw [Matrix.trace]
    simp only [Matrix.diag_apply, Fin.sum_univ_three, reQ_add]
  rw [hrtr, kconst]
  simp only [smul_eq_mul]
  ring


/-! ## THE FULL PREDICATE — `derH3` kills the octonion-valued linear trace `jTr`. -/

/-- ★★★ THE FULL `f₄`-ANNIHILATION OF THE LINEAR TRACE (innerness-free). For EVERY `T ∈ derH3`
    (every Hermitian Jordan derivation of the derived `H₃(O)`) and Hermitian `A`, the octonion-valued
    linear trace of `T A` VANISHES: `jTr (T A) = 0`. N299's `derH3_kills_hermTrace` gives the operator
    trace `φ (T A) = 0`; the proportionality `φ (T A) = k · rtr (T A)` with `k ≠ 0` forces
    `rtr (T A) = 0`; the reality bridge lifts it to the full octonion-valued `jTr (T A) = 0`. -/
theorem derH3_kills_jTr {T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))} (hT : T ∈ derH3)
    {A : Matrix (Fin 3) (Fin 3) (O ℚ)} (hA : Aᴴ = A) : jTr (T A) = 0 := by
  have hTA : (T A)ᴴ = T A := TA_herm hT hA
  -- operator trace vanishes (N299)
  have hop : phi ⟨T A, (mem_hermSub).2 hTA⟩ = 0 := by
    rw [phi_eq_trace]
    have hrfl : (Lmul ((⟨T A, (mem_hermSub).2 hTA⟩ : hermSub) : Matrix (Fin 3) (Fin 3) (O ℚ))).restrict
          (lmul_mapsTo ((mem_hermSub).1 (⟨T A, (mem_hermSub).2 hTA⟩ : hermSub).2))
        = (Lmul (T A)).restrict (lmul_mapsTo (TA_herm hT hA)) := rfl
    rw [hrfl, derH3_kills_hermTrace hT hA]
  -- proportional ⟹ rtr (T A) = 0
  have hprop : phi ⟨T A, (mem_hermSub).2 hTA⟩ = kconst * rtr (T A) := phi_proportional hTA
  have hrtr0 : rtr (T A) = 0 := by
    have : kconst * rtr (T A) = 0 := by rw [← hprop]; exact hop
    rcases mul_eq_zero.1 this with h | h
    · exact absurd h kconst_ne_zero
    · exact h
  -- reality bridge lifts to jTr
  rw [herm_jTr_eq_ocR_rtr hTA, hrtr0, ocR_zero]

/-! ## The `f₄`-module split `L = ℚ·1 ⊕ L₀`. -/

/-- The traceless mover-carrier `L₀ = ker (jTr) ∩ hermSub` — the submodule where the
    spectrum-splitting lives (N297). -/
noncomputable def L0 : Submodule ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)) :=
  hermSub ⊓ (LinearMap.ker (Matrix.traceLinearMap (Fin 3) ℚ (O ℚ)))

/-- ★★★ CAPSTONE. The innerness-free full-trace structure:
    (1) EVERY `T ∈ derH3` kills the octonion-valued linear trace (`derH3_kills_jTr`),
    (2) the trace functional is genuinely NONZERO (proportional to `rtr` with `k ≠ 0`), and
    (3) the dilation line carries a nonzero trace (`dilation_hermTrace_ne`, N299) — the `ℚ·1`
    summand of the `f₄`-module split — carrying `jordan_fails_H4` (N5) in the TYPE to keep the
    derived arena (the order-3 cap) explicit. NO Chevalley–Schafer innerness is used. -/
theorem full_trace_annihilation_structure :
    (∀ (T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))), T ∈ derH3 →
        ∀ {A : Matrix (Fin 3) (Fin 3) (O ℚ)}, Aᴴ = A → jTr (T A) = 0)
    ∧ (kconst ≠ 0)
    ∧ (∀ {C : Matrix (Fin 3) (Fin 3) (O ℚ)} (hC : Cᴴ = C),
        phi ⟨C, (mem_hermSub).2 hC⟩ = kconst * rtr C)
    ∧ jdef Xwit Ywit ≠ 0 :=
  ⟨fun _T hT _A hA => derH3_kills_jTr hT hA, kconst_ne_zero,
    fun hC => phi_proportional hC, jordan_fails_H4⟩


end Phys.Algebra.HJ
