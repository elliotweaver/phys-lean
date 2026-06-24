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
