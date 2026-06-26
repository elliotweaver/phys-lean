/-
  Phys.Algebra.LorentzContinuumReseed — N79: THE DEFLATION RE-SEEDING INDUCTION LEVER — the
  deflated operator RESTRICTS to the EvC-orthogonal complement of the peeled eigenvector as an
  EvC-self-adjoint endomorphism on a space whose `finrank` DROPS BY EXACTLY ONE, and (at any ODD
  rung) re-seeds via N77 `dim_odd_has_eigenvector` an eigenvector lying INSIDE that complement.
  Over the DERIVED ℝ `Cut` and the terminal algebra `O Cut := CD (H Cut)`.
  ===========================================================================
  THE NEXT FORCED NODE after the EVEN-RUNG OBSTRUCTION REMOVER node (N78). N49–N78 banked, over
  the derived ℝ `Cut`:
    • the continuum Born form `QvC`, the isometry monoid `qvIsomMonoidC` (N49), `gFormC_comp` (N50);
    • the tangent Lie algebra `infIsomLieAlg` + `BvC` + `boostGenC`/`rotGenC a` (N51);
    • the FORWARD soundness `genIsomMonoidC2 ≤ qvIsomMonoidC` with `biMulFun u u'` (N52–N55);
    • the BORN POSITIVITY `gFormC_nonneg` + the (1,9) signature split (N56);
    • the POSITIVE-DEFINITE SCALAR square root `cutSqrt` (N57);
    • ★ the INFINITESIMAL CARTAN reference form `EvC` — POSITIVE-DEFINITE (`EvC_nonneg`,
      `EvC_eq_zero_iff`) over the order structure of the derived ℝ `Cut` (N58);
    • the OPERATOR FORM-ADJOINT `IsEvCAdjoint`/`IsEvCSymm` + the operator square roots (N59–N65);
    • the rank-`n` spectral operator `specOpN`, the witness `txMix`, the DEFLATION engine `deflateC`
      with `deflateC_image_orth`/`deflateC_isEvCSymm`/`deflateC_eigen_kills` (N67–N70), the seed
      eigenpair extraction `specOpN_eigen` (N71), the iterated descent `deflateList`/
      `specOpN_full_descent` (N74);
    • the ODD-DEGREE ROOT ENGINE `cutCbrt`/`cut_cubic_has_root` (N75), the EIGENVECTOR half
      `dim3_has_eigenvector`/`stvc_eigenvector_of_charpoly_root` + `Module.Finite Cut STVC` (N76);
    • ★ THE DERIVED ℝ `Cut` IS A REAL CLOSED FIELD — `cut_odd_degree_has_root`, `cut_isRealClosed`,
      and the re-seeding lever `dim_odd_has_eigenvector` (every endomorphism of an ODD-`finrank`
      `Cut`-space has a nonzero eigenvector) (N77);
    • ★ THE EVEN-RUNG OBSTRUCTION REMOVER `selfadj_negDisc_quad_injective`/`_isUnit` + the
      conditional existence `selfadj_no_pure_quad_charpoly` (N78).

  ── THE GAP THIS NODE CLOSES ──
  The full n-dim spectral existence `∀ g, ∃ c u, g = specOpN c u` runs as an INDUCTION on dimension:
  extract one eigenpair `(l, u)`, deflate via N70 `deflateC g l u`, recurse on the strictly-smaller
  EvC-orthogonal complement of `u`. N70 banked the deflation STEP and proved `deflateC_image_orth`
  (the deflated operator's WHOLE image is EvC-orthogonal to `u`, so its EvC-orthogonal complement is
  an INVARIANT subspace). But the recursion needs the operator to actually RESTRICT to that
  complement as an endomorphism of a STRICTLY SMALLER space — the ROADMAP's named deep remaining
  joint, "threading the EvC-orthogonal-complement finrank bookkeeping." THIS node banks exactly that:
  the complement `uPerp u`, its CODIMENSION ONE (`finrank` drops by exactly one), the restriction of
  the deflated operator to it, the PRESERVED EvC-self-adjointness of the restriction, the
  finite-dimensionality of the complement, and the RE-SEEDING corollary — at any ODD rung the
  restricted operator has a nonzero eigenvector lying INSIDE `uPerp u` (N77 `dim_odd_has_eigenvector`
  applied to the restriction). The induction stays inside a strictly-smaller invariant subspace, the
  finrank decreases by one at each peel, and the re-seed is available whenever the complement's
  finrank is odd.

  ── THE TRUNK REFRAME (THE ONE LAW): the complement IS the kernel of the bundled trunk functional ──
  The EvC-orthogonal complement of `u` is `uPerp u := LinearMap.ker (EvCRight u)`, the kernel of the
  banked reference-form functional `EvCRight u := p ↦ EvC u p` (N68). For a UNIT `u` (`EvC u u = 1`)
  the functional is SURJECTIVE onto `Cut` (the witness `c ↦ c • u`), so by rank–nullity its kernel
  has `finrank = finrank STVC − 1` — codimension exactly one. The deflated operator `deflateC g l u`
  (N70) maps `uPerp u` into itself (its whole image is in `uPerp u`, by `deflateC_image_orth`), so it
  restricts to an endomorphism `deflateRestrict` of `uPerp u`; the restriction is EvC-self-adjoint
  because the ambient `deflateC g l u` is (`deflateC_isEvCSymm`, N70) and the reference form on the
  complement is the ambient one on the coercions. Nothing posited: each fact is forced linear algebra
  over the trunk reference form `EvC` (N58, the Born self-overlap positivity N56) and the banked
  deflation engine (N70), over the DERIVED ℝ `Cut`.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    uPerp u               — ★ THE EvC-ORTHOGONAL COMPLEMENT `LinearMap.ker (EvCRight u)`.
    mem_uPerp             — membership: `p ∈ uPerp u ↔ EvC u p = 0`.
    evCRight_surjective   — for a unit `u`, `EvCRight u` is surjective onto `Cut` (witness `c ↦ c•u`).
    uPerp_finrank         — ★★ THE CODIM-ONE DROP: `finrank Cut (uPerp u) = finrank Cut STVC − 1`
                            for a unit `u` (rank–nullity on the surjective functional `EvCRight u`).
    deflateC_mapsTo_uPerp — the deflated operator maps `uPerp u` into `uPerp u` (image orthogonal).
    deflateRestrict       — ★ THE RESTRICTED OPERATOR on the codim-1 invariant subspace `uPerp u`.
    deflateRestrict_coe   — the restriction coercion `↑(deflateRestrict … p) = deflateC g l u ↑p`.
    deflateRestrict_isEvCSymm — ★ the restricted operator is EvC-self-adjoint on `uPerp u`.
    uPerp_finite          — `Module.Finite Cut (uPerp u)` (submodule of the finite `STVC`, N76).
    self_not_mem_uPerp    — ★ NON-VACUITY (W8): `u ∉ uPerp u` for a unit `u` (`EvC u u = 1 ≠ 0`).
    uPerp_ne_top          — ★ NON-VACUITY (W8): `uPerp u ≠ ⊤` — a PROPER subspace, finrank genuinely
                            drops.
    deflateRestrict_odd_reseed — ★★ THE RE-SEEDING COROLLARY: if `finrank Cut (uPerp u)` is ODD, the
                            deflated operator has a nonzero eigenvector lying INSIDE `uPerp u`
                            (N77 `dim_odd_has_eigenvector` on the restriction) — the descent stays
                            inside the strictly-smaller complement.

  ── THE W1 HEAVY REMAINDER (childed N80, an honest dissolution ticket, NOT closed here) ──
  The real-closed Artin–Schreier FACTORIZATION of the characteristic polynomial — `R` real closed
  ⟹ `R[i]` algebraically closed ⟹ every monic poly factors into linear × irreducible-quadratic — is
  the content Mathlib LACKS (`Mathlib/FieldTheory/IsRealClosed/Basic.lean` is a 127-line stub: the
  class + `of_linearOrderedField` + square helpers ONLY, no algebraic closure, no factorization).
  That factorization feeds N78 `selfadj_no_pure_quad_charpoly` to FORCE the real-eigenvalue seed at
  EVEN dimension; with the even-dim seed in hand and THIS node's re-seeding induction lever, the full
  existence `∀ g, ∃ c u, g = specOpN c u` assembles (extract seed → deflate → restrict to `uPerp` →
  re-seed at the dropped dimension → the N74 iterated descent) → the GLOBAL polar/KAK assembly →
  connectedness → the GLOBAL reverse KAK surjectivity → the full `Spin(9)→SO(9)` exhaustion. These
  are the genuine HEAVY group-manifold core, childed onto the chain tail. THIS node banks the
  RE-SEEDING INDUCTION LEVER — the deflated operator restricts to a strictly-smaller EvC-self-adjoint
  sub-problem with the finrank dropping by exactly one, and re-seeds at any odd rung.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That a self-adjoint operator restricts to the
  orthogonal complement of an eigenvector, with dimension dropping by one, is standard linear algebra
  (the inductive step of the spectral theorem). Here the complement is the KERNEL of the trunk's own
  reference-form functional `EvCRight u` (N68, the Born self-overlap positivity N56), its codimension
  is rank–nullity on that functional, the restriction's self-adjointness DESCENDS from the banked
  `deflateC_isEvCSymm` (N70), the finite-dimensionality from `Module.Finite Cut STVC` (N76), and the
  re-seed from `dim_odd_has_eigenvector` (N77, riding the real-closed `Cut`) — all over the DERIVED ℝ
  `Cut`. `LinearMap.ker`, `LinearMap.restrict`, `finrank_range_add_finrank_ker`,
  `Module.Finite.of_injective` are standard Mathlib MACHINERY on the DERIVED objects. NO posited
  spectral theorem, NO Mathlib ℝ/ℂ as content, NO posited inner product, NO posited Lorentz group.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / spectral /
  eigenvalue / eigenvector / eigenprojection / self-adjoint / positive-definite / deflation /
  re-seed / orthogonal / complement / invariant / induction / descent / dimension / rank / Spin /
  SO(9) / isometry / KAK / polar / Cartan": what remains is the theorem that, over the derived
  complete ordered field `Cut` and the symmetric positive-definite bilinear form `EvC`, the kernel
  `uPerp u := ker (EvCRight u)` of the bundled functional `p ↦ EvC u p` is, for `EvC u u = 1`, a
  proper subspace of `finrank = finrank STVC − 1`; the `Cut`-linear `deflateC g l u` maps it into
  itself and its restriction is `EvC`-symmetric; and when that finrank is odd the map has a nonzero
  `v ∈ uPerp u` with `deflateC g l u v = lam • v`. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, a fully proved derivation,
  NO Mathlib number-system content import (the field is the DERIVED `Cut`), NO posited Lorentz group,
  NO posited spectral theorem, NO Mathlib ℝ/ℂ as content.
-/
import Phys.Algebra.LorentzContinuumEvenSeed

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The EvC-orthogonal complement of `u` — the kernel of the bundled trunk functional. -/

/-- ★ THE EvC-ORTHOGONAL COMPLEMENT of `u`: the kernel of the banked reference-form functional
    `EvCRight u := p ↦ EvC u p` (N68). The invariant subspace the deflation recursion descends into. -/
def uPerp (u : STVC) : Submodule Cut STVC := LinearMap.ker (EvCRight u)

/-- Membership in the EvC-orthogonal complement: `p ∈ uPerp u ↔ EvC u p = 0`. -/
theorem mem_uPerp (u p : STVC) : p ∈ uPerp u ↔ EvC u p = 0 := by
  unfold uPerp
  rw [LinearMap.mem_ker]
  rfl

/-- For a UNIT `u` (`EvC u u = 1`) the bundled functional `EvCRight u` is SURJECTIVE onto `Cut`:
    every `c : Cut` is hit by `c • u` (`EvC u (c • u) = c · EvC u u = c`). -/
theorem evCRight_surjective {u : STVC} (hu : EvC u u = 1) :
    Function.Surjective (EvCRight u) := by
  intro c
  refine ⟨c • u, ?_⟩
  show EvC u (c • u) = c
  rw [EvC_smul_right, hu, mul_one]

/-- ★★ THE CODIM-ONE DROP: for a UNIT `u`, the EvC-orthogonal complement has
    `finrank Cut (uPerp u) = finrank Cut STVC − 1`. Rank–nullity on the surjective functional
    `EvCRight u` (range `= ⊤`, `finrank = 1`): `finrank range + finrank ker = finrank STVC`, so the
    kernel `uPerp u` has codimension exactly one. The `finrank` bookkeeping the deflation re-seeding
    induction runs on — each peel drops the dimension by exactly one. -/
theorem uPerp_finrank {u : STVC} (hu : EvC u u = 1) :
    Module.finrank Cut (uPerp u) = Module.finrank Cut STVC - 1 := by
  have hrn := (EvCRight u).finrank_range_add_finrank_ker
  have hr : Module.finrank Cut (LinearMap.range (EvCRight u)) = 1 := by
    have h : LinearMap.range (EvCRight u) = ⊤ :=
      LinearMap.range_eq_top.mpr (evCRight_surjective hu)
    rw [h, finrank_top]; simp
  unfold uPerp
  omega

/-! ## The deflated operator restricts to the EvC-orthogonal complement. -/

/-- The deflated operator maps the EvC-orthogonal complement `uPerp u` INTO itself: its entire image
    is EvC-orthogonal to `u` (N70 `deflateC_image_orth`), so in particular the image of any element
    of `uPerp u` lies in `uPerp u`. The complement is an INVARIANT subspace. -/
theorem deflateC_mapsTo_uPerp {g : Module.End Cut STVC} {l : Cut} {u : STVC}
    (hg : IsEvCSymm g) (hu : EvC u u = 1) (heig : g u = l • u) :
    ∀ p ∈ uPerp u, deflateC g l u p ∈ uPerp u := by
  intro p _
  rw [mem_uPerp]
  exact deflateC_image_orth hg hu heig p

/-- ★ THE RESTRICTED OPERATOR on the codim-1 invariant subspace `uPerp u`: `deflateC g l u`
    restricted to `uPerp u`, the strictly-smaller sub-problem the spectral existence induction
    recurses on. -/
def deflateRestrict {g : Module.End Cut STVC} {l : Cut} {u : STVC}
    (hg : IsEvCSymm g) (hu : EvC u u = 1) (heig : g u = l • u) :
    Module.End Cut (uPerp u) :=
  (deflateC g l u).restrict (deflateC_mapsTo_uPerp hg hu heig)

/-- The restriction coercion: `↑(deflateRestrict … p) = deflateC g l u ↑p`. -/
theorem deflateRestrict_coe {g : Module.End Cut STVC} {l : Cut} {u : STVC}
    (hg : IsEvCSymm g) (hu : EvC u u = 1) (heig : g u = l • u) (p : uPerp u) :
    ((deflateRestrict hg hu heig) p : STVC) = deflateC g l u (p : STVC) := rfl

/-- ★ THE RESTRICTED OPERATOR IS EvC-SELF-ADJOINT on `uPerp u`: the ambient deflated operator is
    EvC-self-adjoint (N70 `deflateC_isEvCSymm`) and the reference form on the complement is the
    ambient one on the coercions. The inductive step stays inside the self-adjoint class on a strictly
    smaller space. -/
theorem deflateRestrict_isEvCSymm {g : Module.End Cut STVC} {l : Cut} {u : STVC}
    (hg : IsEvCSymm g) (hu : EvC u u = 1) (heig : g u = l • u) (p q : uPerp u) :
    EvC ((deflateRestrict hg hu heig p : STVC)) (q : STVC)
      = EvC ((p : STVC)) ((deflateRestrict hg hu heig q : STVC)) := by
  rw [deflateRestrict_coe, deflateRestrict_coe]
  exact deflateC_isEvCSymm hg l u (p : STVC) (q : STVC)

/-- `Module.Finite Cut (uPerp u)` — the EvC-orthogonal complement is finite-dimensional, as a
    submodule of the finite-dimensional `STVC` (N76 `Module.Finite Cut STVC`). The finiteness the
    re-seeding (via `dim_odd_has_eigenvector`) requires. -/
instance uPerp_finite (u : STVC) : Module.Finite Cut (uPerp u) :=
  Module.Finite.of_injective (uPerp u).subtype Subtype.coe_injective

/-! ## Non-vacuity — the complement is a proper subspace. -/

/-- ★ NON-VACUITY (W8): `u ∉ uPerp u` for a UNIT `u`, since `EvC u u = 1 ≠ 0`. The peeled direction
    is genuinely OUTSIDE its own complement. -/
theorem self_not_mem_uPerp {u : STVC} (hu : EvC u u = 1) : u ∉ uPerp u := by
  rw [mem_uPerp, hu]
  exact one_ne_zero

/-- ★ NON-VACUITY (W8): the EvC-orthogonal complement `uPerp u` is a PROPER subspace (`≠ ⊤`) for a
    UNIT `u` — the peeled direction is missing — so the codimension-one `finrank` drop is genuine and
    the descent reaches a strictly smaller space. -/
theorem uPerp_ne_top {u : STVC} (hu : EvC u u = 1) : uPerp u ≠ ⊤ := by
  intro htop
  exact self_not_mem_uPerp hu (htop ▸ Submodule.mem_top)

/-! ## The re-seeding corollary — re-seed inside the complement at any odd rung. -/

/-- ★★ THE RE-SEEDING COROLLARY: if `finrank Cut (uPerp u)` is ODD, the deflated operator
    `deflateC g l u` has a NONZERO eigenvector lying INSIDE the EvC-orthogonal complement `uPerp u` —
    a `lam` and a `v ∈ uPerp u`, `v ≠ 0`, with `deflateC g l u v = lam • v`. The restricted operator
    `deflateRestrict` is an endomorphism of the odd-`finrank` complement, so N77
    `dim_odd_has_eigenvector` (every endomorphism of an odd-`finrank` `Cut`-space has a nonzero
    eigenvector) supplies one; its coercion is the ambient eigenvector, living inside `uPerp u`. The
    deflation re-seeding induction's odd-rung step: the descent stays inside the strictly-smaller
    complement, re-seeded by the odd-degree root engine. -/
theorem deflateRestrict_odd_reseed {g : Module.End Cut STVC} {l : Cut} {u : STVC}
    (hg : IsEvCSymm g) (hu : EvC u u = 1) (heig : g u = l • u)
    (hodd : Odd (Module.finrank Cut (uPerp u))) :
    ∃ (lam : Cut) (v : STVC), v ∈ uPerp u ∧ v ≠ 0 ∧ deflateC g l u v = lam • v := by
  obtain ⟨lam, w, hw0, hwev⟩ := dim_odd_has_eigenvector hodd (deflateRestrict hg hu heig)
  refine ⟨lam, (w : STVC), w.2, ?_, ?_⟩
  · intro h
    exact hw0 (Subtype.ext (by rw [h]; rfl))
  · have hc := congrArg (Subtype.val) hwev
    rw [deflateRestrict_coe] at hc
    rw [hc]
    rfl

end

end Phys.Algebra
