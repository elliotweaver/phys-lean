/-
  Phys.Algebra.LorentzContinuumEvenSeed — N78: THE EVEN-RUNG OBSTRUCTION REMOVER — a
  negative-discriminant quadratic in an EvC-self-adjoint operator over the positive-definite
  reference form `EvC` is INJECTIVE hence INVERTIBLE; and a self-adjoint operator's characteristic
  polynomial CANNOT be a pure product of negative-discriminant quadratics. Over the DERIVED ℝ `Cut`
  and the terminal algebra `O Cut := CD (H Cut)`.
  ===========================================================================
  THE NEXT FORCED NODE after the REAL-CLOSED-FIELD / GENERAL-ODD-DEGREE-ROOT / GENERAL-ODD-
  DIMENSIONAL-EIGEN-SEED node (N77). N49–N77 banked, over the derived ℝ `Cut`:
    • the continuum Born form `QvC`, the isometry monoid `qvIsomMonoidC` (N49), `gFormC_comp` (N50);
    • the tangent Lie algebra `infIsomLieAlg` + `BvC` + `boostGenC`/`rotGenC a` (N51);
    • the FORWARD soundness `genIsomMonoidC2 ≤ qvIsomMonoidC` with `biMulFun u u'` (N52–N55);
    • the BORN POSITIVITY `gFormC_nonneg` + the (1,9) signature split (N56);
    • the POSITIVE-DEFINITE SCALAR square root `cutSqrt` (N57);
    • ★ the INFINITESIMAL CARTAN reference form `EvC` — POSITIVE-DEFINITE (`EvC_nonneg`,
      `EvC_eq_zero_iff`) over the order structure of the derived ℝ `Cut` (N58);
    • the OPERATOR FORM-ADJOINT `IsEvCAdjoint`/`IsEvCSymm` + the operator square roots (N59–N65);
    • the rank-`n` spectral operator `specOpN`, the witness `txMix`, the DEFLATION engine `deflateC`
      (N67–N70), the seed eigenpair extraction `specOpN_eigen` (N71), the iterated descent
      `deflateList`/`specOpN_full_descent` (N74);
    • the ODD-DEGREE ROOT ENGINE `cutCbrt`/`cut_cubic_has_root` (N75), the EIGENVECTOR half
      `dim3_has_eigenvector`/`stvc_eigenvector_of_charpoly_root` + `Module.Finite Cut STVC` (N76);
    • ★ THE DERIVED ℝ `Cut` IS A REAL CLOSED FIELD — `cut_odd_degree_has_root`, `cut_isRealClosed`,
      and the re-seeding lever `dim_odd_has_eigenvector` (every endomorphism of an ODD-`finrank`
      `Cut`-space has a nonzero eigenvector) (N77).

  ── THE GAP THIS NODE CLOSES ──
  The FULL n-dim spectral existence `∀ g, ∃ c u, g = specOpN c u` needs a guaranteed real eigenvalue
  to SEED the N70 `deflateC` / N74 `deflateList` iterated descent. N77 banked `dim_odd_has_eigenvector`
  — a real eigenvalue at every ODD dimension (an odd-degree characteristic polynomial has a root over
  the real-closed `Cut`). But the deflation cascade descends `10 → 9 → 8 → …`, so the EVEN rungs
  (10, 8, 6, …) STILL need a guaranteed eigenpair — and an EVEN-degree polynomial need NOT have a root
  over a real-closed (non-algebraically-closed) field. That is the genuine even-rung obstruction. The
  classical resolution (the real spectral theorem) is unavailable: Mathlib has NO real-closed→
  algebraically-closed (Artin–Schreier), NO real-closed polynomial factorization, NO self-adjoint
  spectral theorem over a general field. The even-rung obstruction is removed instead by the trunk's
  own POSITIVE-DEFINITENESS.

  ── THE TRUNK REFRAME (THE ONE LAW): the even-rung obstruction DISSOLVES through positive-definiteness ──
  Over the real-closed `Cut`, a monic characteristic polynomial is a product of LINEAR factors
  `(X − λ)` and IRREDUCIBLE QUADRATIC factors `X² + b·X + c` with NEGATIVE discriminant `b² − 4c < 0`.
  For a SELF-ADJOINT `g` w.r.t. the POSITIVE-DEFINITE reference form `EvC` (N58), EVERY negative-
  discriminant quadratic factor `g·g + b•g + c•1` is INJECTIVE: for `v ≠ 0`, with
  `α := EvC (g v) (g v) ≥ 0`, `β := EvC (g v) v`, `γ := EvC v v > 0` (positive-definiteness),
      `EvC ((g·g + b•g + c•1) v) v = α + b·β + c·γ`
  (bilinearity + self-adjointness: `EvC (g (g v)) v = EvC (g v) (g v) = α`), and the Cauchy–Schwarz
  bound `β² ≤ α·γ` from `0 ≤ EvC (γ•(g v) − β•v) (γ•(g v) − β•v)` give
      `α + b·β + c·γ ≥ ((4c − b²)/4)·γ > 0 ≠ 0`,
  so `(g·g + b•g + c•1) v ≠ 0`. Injective on the FINITE-dim `STVC` (N76 `Module.Finite Cut STVC`)
  ⟹ BIJECTIVE (`injective_iff_surjective`) ⟹ a unit of the `Module.End` ring. THIS is the even-rung
  obstruction remover — the companion to N77 `dim_odd_has_eigenvector`: the odd rungs are re-seeded by
  the odd-degree root, the EVEN rungs cleared by the positive-definite invertibility of every
  irreducible quadratic factor.

  Then with Cayley–Hamilton (`aeval_self_charpoly`, banked Mathlib machinery), the characteristic
  polynomial of a self-adjoint `g` CANNOT be a PURE product of negative-discriminant quadratics: each
  factor `aeval g` is a UNIT, a product of units is a unit, but `aeval g charpoly = 0` is NOT a unit on
  the nonzero `STVC`. So the factorization MUST contain a linear factor `(X − λ)` = a real eigenvalue.
  The ONLY remaining gap to the full real-eigenvalue seed is the real-closed FACTORIZATION itself
  (the Artin–Schreier content Mathlib lacks), childed N79.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    selfadj_negDisc_quad_apply_form — the EvC quadratic-form identity
                          `EvC ((g·g + b•g + c•1) v) v = EvC (g v) (g v) + b·EvC (g v) v + c·EvC v v`
                          for an EvC-self-adjoint `g` (bilinearity + self-adjointness).
    selfadj_negDisc_quad_pos — ★★ THE DISCRIMINANT KEY: for `b² < 4c`, EvC-self-adjoint `g`, `v ≠ 0`,
                          `0 < EvC ((g·g + b•g + c•1) v) v` (Cauchy–Schwarz `β² ≤ α·γ` + positive-
                          definiteness `γ > 0`). The heart of the even-rung obstruction remover.
    selfadj_negDisc_quad_injective — ★★ THE EVEN-RUNG OBSTRUCTION REMOVER: `g·g + b•g + c•1` is
                          INJECTIVE for `b² < 4c` and EvC-self-adjoint `g`.
    selfadj_negDisc_quad_bijective — the same map is BIJECTIVE on the finite-dim `STVC`.
    selfadj_negDisc_quad_isUnit — the same map is a UNIT of the `Module.End Cut STVC` ring.
    selfadj_negDisc_quad_ne_zero — ★ NON-VACUITY (W8): the same map is NOT the zero endomorphism (it
                          is strictly positive on a concrete nonzero vector of the nontrivial `STVC`).
    aeval_quad_eq — the single-factor bridge `aeval g (X² + C b·X + C c) = g·g + b•g + c•1`.
    aeval_quad_isUnit — every negative-discriminant quadratic factor `aeval g` is a UNIT.
    isUnitListProd — a product of units in a monoid is a unit (list form, for the non-commutative
                          `Module.End` ring).
    selfadj_no_pure_quad_charpoly — ★ THE CONDITIONAL EXISTENCE: a self-adjoint `g`'s characteristic
                          polynomial CANNOT be a pure product of negative-discriminant monic
                          quadratics (Cayley–Hamilton + product-of-units + `0` is not a unit) — so a
                          real eigenvalue exists GIVEN the real-closed factorization. The remaining gap
                          is isolated to exactly that factorization (childed N79).

  ── THE W1 HEAVY REMAINDER (childed N79, an honest dissolution ticket, NOT closed here) ──
  The real-closed FACTORIZATION of the characteristic polynomial (the Artin–Schreier content Mathlib
  lacks) → the full real-eigenvalue seed at EVEN dimension → the deflation re-seeding INDUCTION
  threading the EvC-orthogonal-complement finrank bookkeeping → the full existence
  `∀ g, ∃ c u, g = specOpN c u` → the GLOBAL polar/KAK assembly for an arbitrary `g` → connectedness
  → the GLOBAL reverse KAK surjectivity → the full `Spin(9)→SO(9)` exhaustion are the genuine HEAVY
  group-manifold core, childed onto the chain tail. THIS node banks the EVEN-RUNG OBSTRUCTION REMOVER
  (the positive-definite invertibility of every irreducible quadratic factor of a self-adjoint
  operator) and the conditional existence — the trunk-native companion to N77's odd-rung re-seeder.

  THE MOAT — posit-vs-derive (docs/STANDARD.md §0). That a symmetric operator over a real inner-product
  space has a real eigenvalue is standard linear algebra (via the spectral theorem / Rayleigh quotient
  / complex eigenvalue + self-adjointness). Here the even-rung obstruction is removed WITHOUT analysis
  and WITHOUT the algebraic closure: it DESCENDS from the POSITIVE-DEFINITENESS of the reference form
  `EvC` (N58, itself the Born self-overlap positivity N56) over the ORDER structure of the derived ℝ
  `Cut`, via the Cauchy–Schwarz inequality the order supplies, plus the finite-dimensionality
  `Module.Finite Cut STVC` (N76, descending from the cascade rungs `2 → 4 → 8`). `injective_iff_surjective`,
  `Module.End.isUnit_iff`, `aeval_self_charpoly`, `map_list_prod` are standard MACHINERY operating on
  the DERIVED objects. NO posited ℝ/ℂ as content, NO Mathlib `Real`, NO posited inner product, NO
  posited Lorentz group.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / spectral /
  eigenvalue / eigenvector / self-adjoint / positive-definite / discriminant / quadratic / seed /
  re-seed / even / odd / dimension / rank / Spin / SO(9) / isometry / obstruction / characteristic":
  what remains is the theorem that, over the derived complete ordered field `Cut` and the symmetric
  positive-definite bilinear form `EvC`, for an `EvC`-symmetric `Cut`-linear `g` and `b, c` with
  `b² < 4c`, the map `g·g + b•g + c•1` is injective (hence bijective, hence a unit) on the
  finite-dimensional `STVC`, and `g`'s characteristic polynomial is not a pure product of such
  quadratics. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, a fully proved derivation,
  NO Mathlib number-system content import (the field is the DERIVED `Cut`), NO posited Lorentz group,
  NO posited inner product / spectral theorem, NO Mathlib ℝ/ℂ as content.
-/
import Phys.Algebra.LorentzContinuumRealClosed

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators
open Polynomial

/-! ## The EvC quadratic-form identity for an EvC-self-adjoint operator. -/

/-- The reference-form value of the operator-quadratic `g·g + b•g + c•1` on the diagonal:
    `EvC ((g·g + b•g + c•1) v) v = EvC (g v) (g v) + b·EvC (g v) v + c·EvC v v`. By bilinearity of
    `EvC` (N58/N63) and the self-adjointness `EvC (g (g v)) v = EvC (g v) (g v)`. -/
theorem selfadj_negDisc_quad_apply_form {g : Module.End Cut STVC} (hg : IsEvCSymm g)
    (b c : Cut) (v : STVC) :
    EvC ((g*g + b•g + c•(1:Module.End Cut STVC)) v) v
      = EvC (g v) (g v) + b * EvC (g v) v + c * EvC v v := by
  have happ : (g*g + b•g + c•(1:Module.End Cut STVC)) v = g (g v) + b • (g v) + c • v := by
    simp [LinearMap.add_apply, Module.End.mul_apply, LinearMap.smul_apply, Module.End.one_apply]
  rw [happ, EvC_add_left, EvC_add_left, EvC_smul_left, EvC_smul_left, hg (g v) v]

/-! ## The discriminant key — strict positivity of a negative-discriminant quadratic. -/

/-- ★★ THE DISCRIMINANT KEY: for `b² < 4c`, an EvC-self-adjoint `g`, and `v ≠ 0`, the operator-quadratic
    `g·g + b•g + c•1` is STRICTLY POSITIVE in the reference form: `0 < EvC ((g·g + b•g + c•1) v) v`.

    With `α := EvC (g v) (g v) ≥ 0`, `β := EvC (g v) v`, `γ := EvC v v > 0` (positive-definiteness
    `EvC_eq_zero_iff`, N58), the form value is `α + b·β + c·γ` (`selfadj_negDisc_quad_apply_form`). The
    Cauchy–Schwarz bound `β² ≤ α·γ` comes from `0 ≤ EvC (γ•(g v) − β•v) (γ•(g v) − β•v)` (the reference
    form is positive-semidefinite, N58 `EvC_nonneg`); completing the square with `4c − b² > 0` gives
    `α + b·β + c·γ ≥ ((4c − b²)/4)·γ > 0`. NO analysis — the order structure of the derived ℝ `Cut`. -/
theorem selfadj_negDisc_quad_pos {g : Module.End Cut STVC} (hg : IsEvCSymm g)
    {b c : Cut} (hdisc : b^2 < 4*c) {v : STVC} (hv : v ≠ 0) :
    0 < EvC ((g*g + b•g + c•(1:Module.End Cut STVC)) v) v := by
  rw [selfadj_negDisc_quad_apply_form hg b c v]
  have hγpos : 0 < EvC v v :=
    lt_of_le_of_ne (EvC_nonneg v) (fun h => hv ((EvC_eq_zero_iff v).mp h.symm))
  have hsymm : EvC v (g v) = EvC (g v) v := EvC_symm v (g v)
  have hnn : 0 ≤ EvC ((EvC v v) • (g v) - (EvC (g v) v) • v)
                    ((EvC v v) • (g v) - (EvC (g v) v) • v) := EvC_nonneg _
  simp only [EvC_sub_left, EvC_sub_right, EvC_smul_left, EvC_smul_right, hsymm] at hnn
  have hcs : (EvC (g v) v)^2 ≤ EvC (g v) (g v) * EvC v v := by nlinarith [hnn, hγpos]
  nlinarith [hcs, hγpos, hdisc, sq_nonneg (2 * EvC (g v) v + b * EvC v v),
    mul_pos (show (0:Cut) < 4*c - b^2 by linarith) (mul_pos hγpos hγpos)]

/-! ## The even-rung obstruction remover — injective, bijective, unit. -/

/-- ★★ THE EVEN-RUNG OBSTRUCTION REMOVER: for `b² < 4c` and an EvC-self-adjoint `g`, the
    operator-quadratic `g·g + b•g + c•1` is INJECTIVE. A vector in the kernel would make the strictly
    positive form value `0` — impossible. The positive-definite resolution of the even-rung obstruction
    in the deflation cascade `10 → 8 → 6 → …`. -/
theorem selfadj_negDisc_quad_injective {g : Module.End Cut STVC} (hg : IsEvCSymm g)
    {b c : Cut} (hdisc : b^2 < 4*c) :
    Function.Injective (g*g + b•g + c•(1:Module.End Cut STVC)) := by
  rw [← LinearMap.ker_eq_bot, LinearMap.ker_eq_bot']
  intro v hv0
  by_contra hvne
  have hpos := selfadj_negDisc_quad_pos hg hdisc hvne
  rw [hv0, EvC_zero_left] at hpos
  exact lt_irrefl 0 hpos

/-- The even-rung obstruction remover is BIJECTIVE on the finite-dimensional `STVC` (N76
    `Module.Finite Cut STVC`): injective ⟹ surjective in finite dimension. -/
theorem selfadj_negDisc_quad_bijective {g : Module.End Cut STVC} (hg : IsEvCSymm g)
    {b c : Cut} (hdisc : b^2 < 4*c) :
    Function.Bijective (g*g + b•g + c•(1:Module.End Cut STVC)) :=
  ⟨selfadj_negDisc_quad_injective hg hdisc,
   LinearMap.injective_iff_surjective.mp (selfadj_negDisc_quad_injective hg hdisc)⟩

/-- The even-rung obstruction remover is a UNIT of the `Module.End Cut STVC` ring (bijective linear
    endomorphism of a module is a unit). The form the Cayley–Hamilton product argument consumes. -/
theorem selfadj_negDisc_quad_isUnit {g : Module.End Cut STVC} (hg : IsEvCSymm g)
    {b c : Cut} (hdisc : b^2 < 4*c) :
    IsUnit (g*g + b•g + c•(1:Module.End Cut STVC)) :=
  (Module.End.isUnit_iff _).mpr (selfadj_negDisc_quad_bijective hg hdisc)

/-- ★ NON-VACUITY (W8): the even-rung obstruction remover is NOT the zero endomorphism. `STVC` is
    nontrivial, and the map is strictly positive in the reference form on a concrete nonzero vector
    (`selfadj_negDisc_quad_pos`), so it cannot send everything to `0`. The statement is non-vacuous —
    the invertibility bites a genuine nonzero operator. -/
theorem selfadj_negDisc_quad_ne_zero {g : Module.End Cut STVC} (hg : IsEvCSymm g)
    {b c : Cut} (hdisc : b^2 < 4*c) :
    (g*g + b•g + c•(1:Module.End Cut STVC)) ≠ 0 := by
  obtain ⟨v, hv⟩ := exists_ne (0 : STVC)
  intro hzero
  have hpos := selfadj_negDisc_quad_pos hg hdisc hv
  rw [hzero] at hpos
  simp only [LinearMap.zero_apply, EvC_zero_left] at hpos
  exact lt_irrefl 0 hpos

/-! ## The Cayley–Hamilton consequence — no pure-quadratic characteristic polynomial. -/

/-- The single-factor bridge: `aeval g` of a monic quadratic `X² + C b·X + C c` IS the operator-quadratic
    `g·g + b•g + c•1` in the `Module.End Cut STVC` ring. -/
theorem aeval_quad_eq {g : Module.End Cut STVC} (b c : Cut) :
    (aeval g) (X^2 + C b * X + C c) = g*g + b•g + c•(1:Module.End Cut STVC) := by
  rw [map_add, map_add, map_mul, map_pow, aeval_X, aeval_C, aeval_C,
      Module.algebraMap_end_eq_smul_id, Module.algebraMap_end_eq_smul_id]
  simp only [sq, smul_mul_assoc, LinearMap.id_comp, Module.End.mul_eq_comp, Module.End.one_eq_id]

/-- Every negative-discriminant quadratic factor `aeval g (X² + C b·X + C c)` of a self-adjoint `g` is
    a UNIT of the `Module.End` ring (`aeval_quad_eq` + `selfadj_negDisc_quad_isUnit`). -/
theorem aeval_quad_isUnit {g : Module.End Cut STVC} (hg : IsEvCSymm g)
    {b c : Cut} (hdisc : b^2 < 4*c) :
    IsUnit ((aeval g) (X^2 + C b * X + C c)) := by
  rw [aeval_quad_eq]; exact selfadj_negDisc_quad_isUnit hg hdisc

/-- A product of units in a monoid is a unit (list form — for the NON-commutative `Module.End` ring
    where `Multiset.prod` is unavailable). Closed under `*` from `isUnit_one` by `List` induction. -/
theorem isUnitListProd {M : Type*} [Monoid M] (l : List M) (h : ∀ x ∈ l, IsUnit x) :
    IsUnit l.prod := by
  induction l with
  | nil => simp
  | cons a t ih =>
    rw [List.prod_cons]
    exact (h a List.mem_cons_self).mul (ih (fun x hx => h x (List.mem_cons_of_mem a hx)))

/-- ★ THE CONDITIONAL EXISTENCE: a self-adjoint `g`'s characteristic polynomial CANNOT be a PURE
    product of negative-discriminant monic quadratics. Cayley–Hamilton (`aeval_self_charpoly`) forces
    `aeval g charpoly = 0`; but if the charpoly were such a product, `aeval g charpoly` would be a
    product of UNIT factors (`aeval_quad_isUnit` + `isUnitListProd`), hence a unit — and `0` is not a
    unit on the nonzero `STVC`. Contradiction. So the real-closed factorization of `g`'s characteristic
    polynomial MUST contain a linear factor `(X − λ)` = a REAL eigenvalue. The remaining gap to the
    even-dimensional real-eigenvalue seed is isolated to exactly the real-closed FACTORIZATION (the
    Artin–Schreier content Mathlib lacks), childed N79. -/
theorem selfadj_no_pure_quad_charpoly {g : Module.End Cut STVC} (hg : IsEvCSymm g)
    (qs : List (Cut × Cut)) (hdisc : ∀ p ∈ qs, p.1^2 < 4*p.2)
    (hfact : g.charpoly = (qs.map (fun p => X^2 + C p.1 * X + C p.2)).prod) :
    False := by
  have hCH : (aeval g) g.charpoly = 0 := g.aeval_self_charpoly
  have hUnit : IsUnit ((aeval g) g.charpoly) := by
    rw [hfact, map_list_prod, List.map_map]
    apply isUnitListProd
    intro x hx
    rw [List.mem_map] at hx
    obtain ⟨pp, hpp, rfl⟩ := hx
    exact aeval_quad_isUnit hg (hdisc pp hpp)
  rw [hCH] at hUnit
  exact not_isUnit_zero hUnit

end

end Phys.Algebra
