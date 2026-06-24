/-
  Phys.Algebra.DerivationIrreducible — N26: THE COMPACT-FORM / TYPE-G₂ PINNING of the
  derivation Lie algebra `derivationLieQ`, increment 4 — the INVARIANT 7-DIMENSIONAL
  Lie submodule, the ORTHOGONAL (COMPACT) EMBEDDING of the faithful 7-rep, and the
  SIMPLICITY SKELETON.
  ===========================================================================
  N20 closed `finrank_derivationQ_eq_14`; N21 the 91-pair bracket table; N22 the FAITHFUL
  7-rep `imRep`; N23 PERFECTNESS; N24 the NEGATIVE-DEFINITE nondegenerate trace form
  (the compact signature); N25 SEMISIMPLICITY (`derivationLieQ_semisimple`). The remaining
  compact-form / type-G₂ pinning is the IRREDUCIBILITY of the faithful 7-rep and the
  SIMPLICITY (no nonzero proper ideal).

  ★ WHAT THIS NODE BANKS (forward, foundations-only — the cleanly-tractable increment,
  measured cheap, NO posited G₂):

    ImLie                       — ★ the imaginary subspace `ImO` (banked N22) promoted to a
                                  genuine `LieSubmodule ℚ derivationLieQ (O ℚ)`: the invariant
                                  7-dimensional Lie submodule the faithful 7-rep acts on. Built
                                  from the banked `derivLieQ_mapsTo` (every derivation maps
                                  `ImO → ImO`). `Nontrivial ImLie` (the banked nonzero generator
                                  `u1 ∈ ImO`), `finrank_ImLie = 7` (transports banked
                                  `finrank_ImO`). The `LieRingModule`/`LieModule`/`IsIrreducible`
                                  instances on `↥ImLie` all synthesize free.

    gBil                        — ★ the Born self-overlap form `g v w := reQ (v · star w)`
                                  (banked N24 `gForm`, the trunk's self-overlap = positivity)
                                  packaged as a `BilinForm ℚ (O ℚ)`.
    deriv_isSkewAdjoint_gBil    — ★ every `IsDerivQ` derivation is SKEW-ADJOINT for `gBil`
                                  (directly from banked N24 `gFormQ_skew`).
    derivationLieQ_le_skewAdjoint — ★★ THE COMPACT EMBEDDING: the whole 14-dim derivation Lie
                                  algebra lands in the skew-adjoint operators of the
                                  POSITIVE-DEFINITE Born form. This is the compact real form's
                                  defining feature at the REPRESENTATION level — `g₂ ↪ so(7)`
                                  with `so(7)` the COMPACT (definite) orthogonal algebra, NOT
                                  the split one. Derived FORWARD from the banked skew-adjointness
                                  + the anisotropy of the self-overlap form, NO posited G₂.
    gBil_separatingLeft         — ★ `gBil` is nondegenerate (anisotropic: `g x x = 0 ↔ x = 0`,
                                  the banked `gForm_self_eq_zero`).

    isSimple_of_isSimpleOrder   — ★ THE SIMPLICITY SKELETON: with the banked non-abelianness
                                  (`derivationLieQ_not_lieAbelian`, N23), `derivationLieQ` is
                                  SIMPLE iff its Lie-ideal lattice is a simple order. Reduces the
                                  remaining simplicity claim to `IsSimpleOrder (LieIdeal …)`.

  ★ WHAT IS CHILDED (N27, never asserted here, never a bridge): the genuinely-hard W1 cores —
  (A) the full `LieModule.IsIrreducible ℚ derivationLieQ ↥ImLie` (needs: the joint kernel of
  the 7-rep is `0`, plus a dimension-count excluding invariant subspaces of dim `2..5` via
  `dim so(d) + so(7−d) ≤ 11 < 14` — an `so(n)` finrank fact Mathlib may lack, BUILD it per W1;
  the d=1/d=6 cases dissolve through the banked perfectness, the "one cause many terminations"
  flagship), and (D) `IsSimpleOrder (LieIdeal ℚ derivationLieQ)` ⟹ `IsSimple`. Then the
  automorphism Lie GROUP. Both correctly scoped to a dedicated child, NOT bypassed.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0; N3–N6/N16–N25 held it). NO `LieAlgebra.g₂`
  / `G₂` imported to assert anything. `ImLie`, `gBil`, the skew-adjoint embedding, and the
  simplicity skeleton are STRUCTURAL FACTS about the banked `derivationLieQ`, proved from its
  own banked structure; `LieSubmodule` / `BilinForm` / `skewAdjointLieSubalgebra` /
  `IsSimpleOrder` / `LieIdeal` are MACHINERY on the DERIVED object (docs/STANDARD.md §3).

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "g₂ / gauge / compact / exceptional /
  fundamental representation": what remains is the pure statement that the 14-dim Lie algebra
  of Leibniz-derivations of the Cayley–Dickson double of a double of a double of ℚ acts on its
  invariant 7-dim subspace `ker(star + id)` by operators skew-adjoint for the anisotropic
  self-overlap form, and is simple iff its ideal lattice is a simple order. No theorem
  STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge.
-/
import Phys.Algebra.DerivationCompact
import Phys.Algebra.DerivationRep7
import Mathlib.LinearAlgebra.BilinearForm.Basic
import Mathlib.LinearAlgebra.SesquilinearForm.Basic
import Mathlib.LinearAlgebra.BilinearForm.Orthogonal
import Mathlib.LinearAlgebra.Dimension.FreeAndStrongRankCondition
import Mathlib.Algebra.Lie.SkewAdjoint
import Mathlib.Algebra.Lie.Semisimple.Basic
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## The invariant 7-dimensional Lie submodule `ImLie`. -/

/-- ★ THE INVARIANT 7-DIMENSIONAL Lie submodule: the banked imaginary subspace `ImO`
    (N22) promoted to a `LieSubmodule ℚ derivationLieQ (O ℚ)`. It is invariant because
    every derivation maps `ImO → ImO` (banked `derivLieQ_mapsTo`, N22). This is the
    representation space of the faithful 7-rep, as a genuine Lie submodule. -/
def ImLie : LieSubmodule ℚ derivationLieQ (O ℚ) where
  toSubmodule := ImO
  lie_mem := by
    intro D x hx
    exact derivLieQ_mapsTo D x hx

@[simp] theorem ImLie_toSubmodule : ImLie.toSubmodule = ImO := rfl

theorem mem_ImLie {x : O ℚ} : x ∈ ImLie ↔ x ∈ ImO := Iff.rfl

/-- The banked generator `u1` is nonzero (its 2nd coordinate is `1 ≠ 0`). -/
theorem u1_ne_zero : (u1 : O ℚ) ≠ 0 := by
  intro h
  have : c1 (u1) = c1 (0 : O ℚ) := by rw [h]
  simp [c1, u1] at this

/-- ★ `ImLie` is NONTRIVIAL: the banked nonzero generator `u1` lies in it (anti-vacuity —
    the invariant subspace is not `⊥`). -/
instance : Nontrivial ImLie := by
  rw [nontrivial_iff]
  refine ⟨⟨u1, u1_mem_ImO⟩, 0, ?_⟩
  intro h
  exact u1_ne_zero (congrArg Subtype.val h)

/-- ★ `finrank ℚ ImLie = 7` (transports the banked `finrank_ImO`, N22). The 7 of the
    G₂ fundamental representation, as the dimension of the invariant Lie submodule. -/
theorem finrank_ImLie : Module.finrank ℚ ImLie = 7 := finrank_ImO

/-! ## The Born self-overlap form as a bilinear form, and the orthogonal (compact)
    embedding of the derivation algebra. -/

/-- `reQ` is ℚ-linear (the real-part read-off). -/
theorem reQ_smul (c : ℚ) (x : O ℚ) : reQ (c • x) = c * reQ x := by
  simp [reQ, cd_qsmul_re, Dbl.smul_re]

/-- ★ THE BORN SELF-OVERLAP FORM as a `BilinForm ℚ (O ℚ)`: `gBil v w = reQ (v · star w)`
    (the banked `gForm`, N24 — the trunk's self-overlap = positivity, one level up). -/
def gBil : BilinForm ℚ (O ℚ) where
  toFun v := {
    toFun := fun w => gForm v w
    map_add' := by intro w1 w2; simp only [gForm, star_add, mul_add]; rw [reQ_add]
    map_smul' := by
      intro c w
      simp only [gForm, RingHom.id_apply, smul_eq_mul]
      rw [show star (c • w) = c • star w from map_smul starL c w |>.symm ▸ rfl,
          qsmul_mul_right, reQ_smul] }
  map_add' := by
    intro v1 v2; ext w
    simp only [gForm, add_mul, LinearMap.add_apply, LinearMap.coe_mk, AddHom.coe_mk]; rw [reQ_add]
  map_smul' := by
    intro c v; ext w
    simp only [gForm, RingHom.id_apply, qsmul_mul_left, reQ_smul,
      LinearMap.smul_apply, LinearMap.coe_mk, AddHom.coe_mk, smul_eq_mul]

@[simp] theorem gBil_apply (v w : O ℚ) : gBil v w = gForm v w := rfl

/-- ★ Every `IsDerivQ` derivation is SKEW-ADJOINT for `gBil` — directly from the banked
    `gFormQ_skew` (N24): `g (D x) y + g x (D y) = 0`. -/
theorem deriv_isSkewAdjoint_gBil (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) :
    gBil.IsSkewAdjoint D := by
  intro x y
  show gForm (D x) y = gForm x ((-D) y)
  rw [LinearMap.neg_apply]
  have hsk := gFormQ_skew D hD x y
  have hneg : gForm x (-(D y)) = - gForm x (D y) := by
    simp only [gForm, star_neg, mul_neg, reQ_neg]
  rw [hneg]; linarith

/-- ★★ THE COMPACT EMBEDDING `g₂ ↪ so(7)` (COMPACT form). The whole 14-dimensional
    derivation Lie algebra lands inside the SKEW-ADJOINT operators of the POSITIVE-DEFINITE
    Born self-overlap form. Together with the banked faithful 7-rep (N22), this exhibits
    `derivationLieQ` as a 14-dim algebra of skew-adjoint operators of a DEFINITE form on a
    7-dim space — the defining property of the COMPACT real form of type G₂ (the definite
    `so(7)`, NOT the split one). Derived FORWARD from the banked skew-adjointness, NO posited
    G₂. -/
theorem derivationLieQ_le_skewAdjoint :
    derivationLieQ ≤ skewAdjointLieSubalgebra gBil := by
  intro D hD
  show D ∈ gBil.skewAdjointSubmodule
  rw [LinearMap.mem_skewAdjointSubmodule]
  exact deriv_isSkewAdjoint_gBil D hD

/-- ★ `gBil` is NONDEGENERATE (separating-left): anisotropic, `g x x = 0 ↔ x = 0`
    (the banked `gForm_self_eq_zero`, the Born positivity). The form the derivations are
    skew for is definite — the compact signature. -/
theorem gBil_separatingLeft : gBil.SeparatingLeft := by
  intro x hx
  have hxx : gForm x x = 0 := by have := hx x; rwa [gBil_apply] at this
  exact gForm_self_eq_zero.mp hxx

/-! ## Complete reducibility via the Born self-overlap (the Weyl unitary trick,
    reframed through the trunk's positivity). -/

/-- `gBil` is symmetric (the self-overlap form is symmetric, banked `gForm_symm`). -/
theorem gBil_isSymm : (gBil).IsSymm :=
  ⟨fun x y => by simp only [gBil_apply]; exact gForm_symm x y⟩

/-- `gBil` is reflexive (it is symmetric). -/
theorem gBil_isRefl : (gBil).IsRefl := gBil_isSymm.isRefl

/-- ★ THE RESTRICTION of `gBil` to ANY submodule `W` is NONDEGENERATE. This is the
    trunk's Born positivity (anisotropy `gForm_self_eq_zero`): a definite form stays
    definite — hence nondegenerate — on every subspace. The hypothesis the Weyl /
    orthogonal-complement lever needs. -/
theorem gBil_restrict_nondegenerate (W : Submodule ℚ (O ℚ)) :
    (gBil.restrict W).Nondegenerate := by
  refine ⟨?_, ?_⟩
  · intro x hx
    have h0 : gForm (x : O ℚ) (x : O ℚ) = 0 := by
      simpa [BilinForm.restrict, gBil_apply] using hx x
    exact Subtype.ext (gForm_self_eq_zero.mp h0)
  · intro y hy
    have h0 : gForm (y : O ℚ) (y : O ℚ) = 0 := by
      simpa [BilinForm.restrict, gBil_apply] using hy y
    exact Subtype.ext (gForm_self_eq_zero.mp h0)

/-- ★★ THE BORN-ORTHOGONAL COMPLEMENT IS A GENUINE LINEAR COMPLEMENT, for EVERY
    submodule `W`: `IsCompl W (gBil.orthogonal W)`. This is the Weyl unitary trick
    reframed through the trunk — the Born self-overlap is definite (positivity), so its
    restriction to `W` is nondegenerate, so `W` and its orthogonal sum to `⊤` and meet in
    `⊥`. No averaging over a compact group: the definite form is given directly by the
    cascade's self-overlap. -/
theorem isCompl_gBil_orthogonal (W : Submodule ℚ (O ℚ)) :
    IsCompl W (gBil.orthogonal W) :=
  gBil.isCompl_orthogonal_of_restrict_nondegenerate gBil_isRefl
    (gBil_restrict_nondegenerate W)

/-- ★ INVARIANCE OF THE ORTHOGONAL COMPLEMENT. If `D` is a Leibniz-derivation (hence
    SKEW-ADJOINT for `gBil`, banked `gFormQ_skew`) and a submodule `N` is `D`-invariant,
    then the `gBil`-orthogonal complement of `N` is `D`-invariant too. The skew-adjointness
    moves `D` across the form onto `N`, where invariance closes it. -/
theorem deriv_mapsTo_orthogonal {N : Submodule ℚ (O ℚ)} (D : Module.End ℚ (O ℚ))
    (hD : IsDerivQ D) (hN : ∀ n ∈ N, D n ∈ N) {x : O ℚ}
    (hx : x ∈ gBil.orthogonal N) : D x ∈ gBil.orthogonal N := by
  rw [BilinForm.mem_orthogonal_iff]
  intro n hn
  show gBil n (D x) = 0
  rw [gBil_apply, gForm_symm n (D x)]
  have hsk := gFormQ_skew D hD x n
  have hxorth : gBil (D n) x = 0 := (BilinForm.mem_orthogonal_iff.mp hx) (D n) (hN n hn)
  rw [gBil_apply, gForm_symm] at hxorth
  linarith [hsk, hxorth]

/-- ★★ THE INVARIANT (Lie-submodule) ORTHOGONAL COMPLEMENT of a Lie submodule `N`:
    the `gBil`-orthogonal complement, packaged as a `LieSubmodule` (invariant via
    `deriv_mapsTo_orthogonal`). The complement the complete-reducibility statement needs. -/
def gPerp (N : LieSubmodule ℚ derivationLieQ (O ℚ)) :
    LieSubmodule ℚ derivationLieQ (O ℚ) where
  toSubmodule := gBil.orthogonal N.toSubmodule
  lie_mem := by
    intro D x hx
    show (D : Module.End ℚ (O ℚ)) x ∈ gBil.orthogonal N.toSubmodule
    refine deriv_mapsTo_orthogonal (D : Module.End ℚ (O ℚ)) D.property ?_ hx
    intro n hn
    exact N.lie_mem hn

@[simp] theorem gPerp_toSubmodule (N : LieSubmodule ℚ derivationLieQ (O ℚ)) :
    (gPerp N).toSubmodule = gBil.orthogonal N.toSubmodule := rfl

/-- ★★★ COMPLETE REDUCIBILITY OF THE TERMINAL ALGEBRA'S DERIVATION ACTION. Every
    Lie submodule `N` of `O ℚ` (invariant subspace under all Leibniz-derivations) has an
    INVARIANT (Lie-submodule) COMPLEMENT — its `gBil`-orthogonal complement `gPerp N`.
    The module is semisimple. This is the Weyl complete-reducibility theorem DERIVED from
    the trunk's Born positivity (the self-overlap is definite, so the orthogonal complement
    is a genuine complement and is invariant because derivations are skew-adjoint), NO
    averaging, NO posited compact group, NO posited G₂. -/
theorem isCompl_gPerp (N : LieSubmodule ℚ derivationLieQ (O ℚ)) :
    IsCompl N.toSubmodule (gPerp N).toSubmodule := by
  rw [gPerp_toSubmodule]
  exact isCompl_gBil_orthogonal N.toSubmodule

/-! ## No 1-dimensional invariant subspace (the d=1 exclusion — "one cause many
    terminations": the joint kernel of the action is `0`, so no trivial 1-dim
    subrepresentation can hide). -/

/-- ★ THE EIGENVALUE-ZERO LEMMA. If `D` is a Leibniz-derivation and `v ≠ 0` is an
    eigenvector `D v = λ • v`, then `λ = 0`. The trunk's Born positivity forces it: by
    skew-adjointness `gForm (D v) v + gForm v (D v) = 0`, i.e. `2 λ · gForm v v = 0`, and
    `gForm v v ≠ 0` (anisotropy, `v ≠ 0`) ⟹ `λ = 0`. A skew-adjoint operator on a
    definite-form space has no nonzero real eigenvalue. -/
theorem deriv_eigenvalue_zero (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) {v : O ℚ}
    (hv : v ≠ 0) {lam : ℚ} (heig : D v = lam • v) : lam = 0 := by
  have hsk := gFormQ_skew D hD v v
  rw [heig] at hsk
  have hl : gForm (lam • v) v = lam * gForm v v := by
    simp only [gForm, qsmul_mul_left, reQ_smul]
  have hr : gForm v (lam • v) = lam * gForm v v := by
    rw [gForm_symm]; simp only [gForm, qsmul_mul_left, reQ_smul]
  rw [hl, hr] at hsk
  have hpos : gForm v v ≠ 0 := fun h => hv (gForm_self_eq_zero.mp h)
  have hz : (lam + lam) * gForm v v = 0 := by ring_nf; ring_nf at hsk; linarith
  rcases mul_eq_zero.mp hz with h | h
  · linarith
  · exact absurd h hpos

/-- ★★ NO NONZERO COMMON EIGENVECTOR IN `ImO`. If a nonzero imaginary `v` is a common
    eigenvector of EVERY Leibniz-derivation (`∀ D, D v = λ_D • v`), then `v = 0` — a
    contradiction. By `deriv_eigenvalue_zero` every eigenvalue is `0`, so `D v = 0` for all
    `D`; in particular the three banked derivations `D0E, D3E, D8E` kill `v`; their joint
    kernel on `ImO` is `0` (a probe-verified rank-7 fact: those three alone determine the
    full 7-action), so `v = 0`. This is the "one cause many terminations" flagship at the
    representation level: the SAME perfectness/faithfulness that makes the joint kernel
    vanish forbids any trivial 1-dimensional subrepresentation. -/
theorem no_common_eigenvector_ImO {v : O ℚ} (hv : v ∈ ImO) (hvne : v ≠ 0)
    (hspan : ∀ D : Module.End ℚ (O ℚ), IsDerivQ D → ∃ lam : ℚ, D v = lam • v) :
    False := by
  have eig0 : ∀ D : Module.End ℚ (O ℚ), IsDerivQ D → D v = 0 := by
    intro D hD
    obtain ⟨lam, heig⟩ := hspan D hD
    rw [heig, deriv_eigenvalue_zero D hD hvne heig, zero_smul]
  have h0 : D0E v = 0 := eig0 D0E D0E_isDerivQ
  have h3 : D3E v = 0 := eig0 D3E D3E_isDerivQ
  have h8 : D8E v = 0 := eig0 D8E D8E_isDerivQ
  have hstar : star v = -v := mem_ImO.mp hv
  have q0 : c0 v = 0 := by
    have h := congrArg c0 hstar
    simp only [c0, CD.star_re, Dbl.star_re', CD.neg_re, Dbl.neg_re] at h
    simp only [c0]; linarith
  have q5 : c5 v = 0 := by have := congrArg c2 h0; simpa [D0E, c2, c5] using this
  have q4 : c4 v = 0 := by have := congrArg c3 h0; simpa [D0E, c3, c4] using this
  have q3 : c3 v = 0 := by have := congrArg c4 h0; simpa [D0E, c4, c3] using this
  have q2 : c2 v = 0 := by have := congrArg c5 h0; simpa [D0E, c5, c2] using this
  have q6 : c6 v = 0 := by have := congrArg c1 h3; simpa [D3E, c1, c6] using this
  have q1 : c1 v = 0 := by have := congrArg c6 h3; simpa [D3E, c6, c1] using this
  have q7 : c7 v = 0 := by have := congrArg c1 h8; simpa [D8E, c1, c7] using this
  apply hvne
  apply CD.ext <;> apply CD.ext <;> apply Dbl.ext <;>
    first
    | (show v.re.re.re = _; simpa [c0] using q0)
    | (show v.re.re.im = _; simpa [c1] using q1)
    | (show v.re.im.re = _; simpa [c2] using q2)
    | (show v.re.im.im = _; simpa [c3] using q3)
    | (show v.im.re.re = _; simpa [c4] using q4)
    | (show v.im.re.im = _; simpa [c5] using q5)
    | (show v.im.im.re = _; simpa [c6] using q6)
    | (show v.im.im.im = _; simpa [c7] using q7)

/-- ★★ NO 1-DIMENSIONAL INVARIANT SUBSPACE inside `ImO`. A derivation-invariant subspace
    `W ⊆ ImO` of dimension `1` cannot exist. Its generator `v` would be a common eigenvector
    of every derivation (invariance ⟹ `D v ∈ W = ℚ·v`), contradicting
    `no_common_eigenvector_ImO`. This excludes the `d = 1` (and, by complete reducibility,
    the `d = 6`) invariant-subspace case of irreducibility — derived FORWARD from the trunk,
    NO posited G₂. -/
theorem no_one_dim_invariant_ImO (W : Submodule ℚ (O ℚ)) (hWle : W ≤ ImO)
    (hW1 : Module.finrank ℚ W = 1)
    (hinv : ∀ D : Module.End ℚ (O ℚ), IsDerivQ D → ∀ x ∈ W, D x ∈ W) : False := by
  rw [finrank_eq_one_iff'] at hW1
  obtain ⟨⟨v, hvW⟩, hvne0, hgen⟩ := hW1
  have hvne : v ≠ 0 := fun h => hvne0 (Subtype.ext h)
  apply no_common_eigenvector_ImO (hWle hvW) hvne
  intro D hD
  obtain ⟨c, hc⟩ := hgen ⟨D v, hinv D hD v hvW⟩
  exact ⟨c, by have := congrArg Subtype.val hc; simpa using this.symm⟩

/-! ## The simplicity skeleton. -/

/-- ★ THE SIMPLICITY SKELETON. With the banked non-abelianness
    (`derivationLieQ_not_lieAbelian`, N23), `derivationLieQ` is SIMPLE iff its lattice of
    Lie ideals is a simple order. This reduces the remaining simplicity claim to
    `IsSimpleOrder (LieIdeal ℚ derivationLieQ)` (childed N27). -/
theorem isSimple_of_isSimpleOrder (h : IsSimpleOrder (LieIdeal ℚ derivationLieQ)) :
    LieAlgebra.IsSimple ℚ derivationLieQ :=
  (isSimple_iff_of_not_isLieAbelian ℚ derivationLieQ derivationLieQ_not_lieAbelian).mp h

end

end Phys.Algebra
