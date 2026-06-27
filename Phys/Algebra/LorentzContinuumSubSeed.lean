/-
  Phys/Algebra/LorentzContinuumSubSeed.lean — N84

  THE SUBMODULE REAL-EIGENVALUE SEED → THE PARITY-FREE DEFLATION RE-SEED.

  Over the derived ℝ `Cut` (the order-complete `ContinuumQ.Cut`) and the terminal algebra
  `O Cut := CD (H Cut)`, this lifts the N83 real-eigenvalue seed (`cut_selfadj_has_eigenvalue`,
  banked only on the whole `STVC`) to an ARBITRARY finite-dimensional submodule `W ≤ STVC`: every
  `Cut`-endomorphism `T` of `W` that is symmetric w.r.t. the AMBIENT positive-definite reference
  form `EvC` on coercions has a REAL eigenvalue `∃ μ : Cut, T.HasEigenvalue μ`.

  This removes the LAST parity gate in the full spectral-existence deflation induction. N79 banked
  the deflation re-seed (`deflateRestrict_odd_reseed`) only at ODD `finrank (uPerp u)`, via N77
  `dim_odd_has_eigenvector`; N78–N83 spent the whole Artin–Schreier arc lifting the seed to EVEN
  dimension on `STVC`. Here the seed is lifted to every submodule rung, so the re-seed becomes
  UNCONDITIONAL (any parity) — `deflateRestrict_reseed` / `deflateRestrict_reseed_unit` drop the
  `Odd` hypothesis entirely. The finrank-decreasing existence induction (childed N85) now closes
  without any parity case-split.

  HOW (W1 reframe — the N83 seed argument lifted to `W`, the N78 complete-the-square injectivity
  ported to the ambient form on coercions): if `T` had no real eigenvalue, its characteristic
  polynomial (over `W`) would have no root in `Cut`, so by the banked real-closed factorization
  `cut_no_root_factors_negDisc` (N83) it is a pure product of negative-discriminant monic
  quadratics. But each such factor `T·T + b•T + c•1` is INJECTIVE on `W`: a kernel vector `v ≠ 0`
  would make `EvC ((T·T + b•T + c•1) v) v` simultaneously `0` and strictly positive, since with
  `α := EvC (Tv) (Tv) ≥ 0`, `β := EvC (Tv) v`, `γ := EvC v v > 0` (positive-definiteness on the
  coercion, N58 `EvC_eq_zero_iff`), the diagonal form value is `α + b·β + c·γ`, and Cauchy–Schwarz
  `β² ≤ α·γ` (from `0 ≤ EvC (γ•Tv − β•v) (γ•Tv − β•v)`, N58 `EvC_nonneg`) with `4c − b² > 0`
  completes the square to `≥ ((4c − b²)/4)·γ > 0`. Hence each factor is a UNIT of `Module.End Cut W`
  (finite-dim ⟹ injective ⟹ bijective ⟹ unit), so the whole product `aeval T T.charpoly` is a
  unit; but Cayley–Hamilton (`aeval_self_charpoly`) makes it `0`, and `0` is not a unit on the
  nontrivial `W`. Contradiction — the factorization must contain a linear factor, a real eigenvalue.

  DERIVED from the trunk: the factorization DESCENDS from `cut_no_root_factors_negDisc` N83 →
  `cuti_isAlgClosed` N82 → `cut_isRealClosed` N77 → the order-completeness of the derived ℝ `Cut`;
  the eigenvalue obstruction is the positive-definite Born form `EvC` (N58); the unit eigenvector is
  normalized by `cutSqrt` (N57, the order-complete square root); the re-seed restricts the deflated
  operator to the EvC-orthogonal complement `uPerp u` (N79). `injective_iff_surjective`,
  `Module.End.isUnit_iff`, `aeval_self_charpoly`, `map_list_prod`, `Module.nontrivial_of_finrank_pos`,
  `hasEigenvalue_iff_isRoot_charpoly`, `exists_hasEigenvector` are standard MACHINERY operating on
  the DERIVED objects. NO posited ℝ/ℂ as content, NO Mathlib `Real`/`Complex`, NO posited inner
  product / spectral theorem, NO posited Lorentz group, NO bridge.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete "Lorentz / boost / rotation / spectral /
  eigenvalue / eigenvector / self-adjoint / positive-definite / discriminant / quadratic / seed /
  re-seed / parity / even / odd / dimension / rank / deflation / Spin / SO(9) / isometry /
  obstruction / characteristic / complement": what remains is — over the derived complete ordered
  field `Cut` and the symmetric positive-definite bilinear form `EvC`, for a finite-dimensional
  `Cut`-submodule `W ≤ STVC` and a `Cut`-endomorphism `T` of `W` symmetric w.r.t. the ambient `EvC`
  on coercions, the characteristic polynomial of `T` has a root in `Cut`; and consequently the
  restricted difference operator `deflateC g l u` on the codim-one kernel `uPerp u` has a nonzero
  (and a unit-normalized) eigenvector inside `uPerp u`. No theorem STATEMENT needs a physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, a fully proved derivation,
  NO Mathlib number-system content import (the field is the DERIVED `Cut`).
-/
import Phys.Algebra.LorentzContinuumRealFactor
import Phys.Algebra.LorentzContinuumReseed

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators
open Polynomial

variable {W : Submodule Cut STVC}

/-! ## EvC-symmetry of an operator on a submodule, w.r.t. the ambient form on coercions. -/

/-- The EvC-symmetry predicate for an operator `T` on a submodule `W ≤ STVC`, taken w.r.t. the
    AMBIENT reference form `EvC` on coercions: `EvC (↑(T p)) (↑q) = EvC (↑p) (↑(T q))`. The shape
    `deflateRestrict_isEvCSymm` (N79) already produces for the restricted deflated operator. -/
def IsEvCSymmSub (T : Module.End Cut W) : Prop :=
  ∀ p q : W, EvC ((T p : STVC)) ((q : STVC)) = EvC ((p : STVC)) ((T q : STVC))

/-! ## The operator-quadratic on `W` — coercion, reference-form value, strict positivity. -/

/-- The coercion of the operator-quadratic `(T·T + b•T + c•1) v` to `STVC`. -/
theorem subQuad_apply_coe (T : Module.End Cut W) (b c : Cut) (v : W) :
    (((T*T + b•T + c•(1:Module.End Cut W)) v : W) : STVC)
      = (T (T v) : STVC) + b • ((T v : STVC)) + c • ((v : STVC)) := by
  have happ : (T*T + b•T + c•(1:Module.End Cut W)) v = T (T v) + b • T v + c • v := by
    simp [LinearMap.add_apply, Module.End.mul_apply, LinearMap.smul_apply, Module.End.one_apply]
  rw [happ]
  simp only [Submodule.coe_add, SetLike.val_smul]

/-- The reference-form value of the operator-quadratic on the diagonal:
    `EvC (↑((T·T + b•T + c•1) v)) (↑v) = EvC (↑(Tv)) (↑(Tv)) + b·EvC (↑(Tv)) (↑v) + c·EvC (↑v) (↑v)`. -/
theorem subQuad_form {T : Module.End Cut W} (hT : IsEvCSymmSub T) (b c : Cut) (v : W) :
    EvC (((T*T + b•T + c•(1:Module.End Cut W)) v : W) : STVC) ((v : STVC))
      = EvC ((T v : STVC)) ((T v : STVC)) + b * EvC ((T v : STVC)) ((v : STVC))
        + c * EvC ((v : STVC)) ((v : STVC)) := by
  rw [subQuad_apply_coe, EvC_add_left, EvC_add_left, EvC_smul_left, EvC_smul_left, hT (T v) v]

/-- ★★ STRICT POSITIVITY: for `b² < 4c`, an EvC-symmetric `T` on `W`, and `v ≠ 0`, the
    operator-quadratic `T·T + b•T + c•1` is STRICTLY POSITIVE in the ambient reference form.
    Cauchy–Schwarz `β² ≤ α·γ` (from `EvC_nonneg` of `γ•Tv − β•v`) + completing the square with
    `4c − b² > 0`, on the positive-definite `EvC` (N58). NO analysis — the order structure of the
    derived ℝ `Cut`. -/
theorem subQuad_pos {T : Module.End Cut W} (hT : IsEvCSymmSub T)
    {b c : Cut} (hdisc : b^2 < 4*c) {v : W} (hv : v ≠ 0) :
    0 < EvC (((T*T + b•T + c•(1:Module.End Cut W)) v : W) : STVC) ((v : STVC)) := by
  rw [subQuad_form hT b c v]
  have hvne : ((v : STVC)) ≠ 0 := by
    intro h; exact hv (Subtype.ext (by rw [h]; rfl))
  have hγpos : 0 < EvC ((v : STVC)) ((v : STVC)) :=
    lt_of_le_of_ne (EvC_nonneg _) (fun h => hvne ((EvC_eq_zero_iff _).mp h.symm))
  have hsymm : EvC ((v : STVC)) ((T v : STVC)) = EvC ((T v : STVC)) ((v : STVC)) :=
    EvC_symm _ _
  have hnn : 0 ≤ EvC ((EvC ((v:STVC)) ((v:STVC))) • ((T v : STVC)) - (EvC ((T v:STVC)) ((v:STVC))) • ((v:STVC)))
                    ((EvC ((v:STVC)) ((v:STVC))) • ((T v : STVC)) - (EvC ((T v:STVC)) ((v:STVC))) • ((v:STVC))) :=
    EvC_nonneg _
  simp only [EvC_sub_left, EvC_sub_right, EvC_smul_left, EvC_smul_right, hsymm] at hnn
  have hcs : (EvC ((T v:STVC)) ((v:STVC)))^2 ≤ EvC ((T v:STVC)) ((T v:STVC)) * EvC ((v:STVC)) ((v:STVC)) := by
    nlinarith [hnn, hγpos]
  nlinarith [hcs, hγpos, hdisc, sq_nonneg (2 * EvC ((T v:STVC)) ((v:STVC)) + b * EvC ((v:STVC)) ((v:STVC))),
    mul_pos (show (0:Cut) < 4*c - b^2 by linarith) (mul_pos hγpos hγpos)]

/-! ## The even-rung obstruction remover on `W` — injective, unit, no pure-quadratic charpoly. -/

/-- ★★ INJECTIVE: for `b² < 4c` and an EvC-symmetric `T` on `W`, `T·T + b•T + c•1` is injective —
    a kernel vector would make the strictly positive form value `0`. -/
theorem subQuad_injective {T : Module.End Cut W} (hT : IsEvCSymmSub T)
    {b c : Cut} (hdisc : b^2 < 4*c) :
    Function.Injective (T*T + b•T + c•(1:Module.End Cut W)) := by
  rw [← LinearMap.ker_eq_bot, LinearMap.ker_eq_bot']
  intro v hv0
  by_contra hvne
  have hpos := subQuad_pos hT hdisc hvne
  rw [hv0] at hpos
  simp only [ZeroMemClass.coe_zero, EvC_zero_left] at hpos
  exact lt_irrefl 0 hpos

/-- A UNIT of `Module.End Cut W` (finite-dim ⟹ injective ⟹ bijective ⟹ unit). -/
theorem subQuad_isUnit [Module.Finite Cut W] {T : Module.End Cut W} (hT : IsEvCSymmSub T)
    {b c : Cut} (hdisc : b^2 < 4*c) :
    IsUnit (T*T + b•T + c•(1:Module.End Cut W)) :=
  (Module.End.isUnit_iff _).mpr
    ⟨subQuad_injective hT hdisc,
     LinearMap.injective_iff_surjective.mp (subQuad_injective hT hdisc)⟩

/-- `aeval T (X² + C b·X + C c) = T·T + b•T + c•1` in `Module.End Cut W`. -/
theorem subAeval_quad_eq (T : Module.End Cut W) (b c : Cut) :
    (aeval T) (X^2 + C b * X + C c) = T*T + b•T + c•(1:Module.End Cut W) := by
  rw [map_add, map_add, map_mul, map_pow, aeval_X, aeval_C, aeval_C,
      Module.algebraMap_end_eq_smul_id, Module.algebraMap_end_eq_smul_id]
  simp only [sq, smul_mul_assoc, LinearMap.id_comp, Module.End.mul_eq_comp, Module.End.one_eq_id]

/-- Every neg-disc quadratic factor `aeval T (X² + C b·X + C c)` is a UNIT. -/
theorem subAeval_quad_isUnit [Module.Finite Cut W] {T : Module.End Cut W} (hT : IsEvCSymmSub T)
    {b c : Cut} (hdisc : b^2 < 4*c) :
    IsUnit ((aeval T) (X^2 + C b * X + C c)) := by
  rw [subAeval_quad_eq]; exact subQuad_isUnit hT hdisc

/-- The conditional existence on `W`: an EvC-symmetric `T`'s characteristic polynomial CANNOT be a
    PURE product of neg-disc monic quadratics. Cayley–Hamilton forces `aeval T charpoly = 0`; a pure
    neg-disc product would make it a product of unit factors, hence a unit — but `0` is not a unit on
    the nontrivial `W`. -/
theorem subSelfadj_no_pure_quad_charpoly [Module.Finite Cut W] [Nontrivial W]
    {T : Module.End Cut W}
    (hT : IsEvCSymmSub T)
    (qs : List (Cut × Cut)) (hdisc : ∀ p ∈ qs, p.1^2 < 4*p.2)
    (hfact : T.charpoly = (qs.map (fun p => X^2 + C p.1 * X + C p.2)).prod) :
    False := by
  have hCH : (aeval T) T.charpoly = 0 := T.aeval_self_charpoly
  have hUnit : IsUnit ((aeval T) T.charpoly) := by
    rw [hfact, map_list_prod, List.map_map]
    apply isUnitListProd
    intro x hx
    rw [List.mem_map] at hx
    obtain ⟨p, hp, rfl⟩ := hx
    exact subAeval_quad_isUnit hT (hdisc p hp)
  rw [hCH] at hUnit
  exact not_isUnit_zero hUnit

/-! ## The submodule real-eigenvalue seed — the parity-free input. -/

/-- ★★★ THE SUBMODULE REAL-EIGENVALUE SEED: every EvC-symmetric `Cut`-endomorphism `T` of a
    finite-dimensional, nontrivial submodule `W ≤ STVC` has a REAL eigenvalue `∃ μ : Cut,
    T.HasEigenvalue μ`. The N83 seed lifted from the whole `STVC` to every submodule rung — the
    parity-free input the full spectral-existence deflation induction needs. -/
theorem submodule_selfadj_has_eigenvalue [Module.Finite Cut W] [Nontrivial W]
    {T : Module.End Cut W}
    (hT : IsEvCSymmSub T) :
    ∃ μ : Cut, T.HasEigenvalue μ := by
  by_contra hno
  rw [not_exists] at hno
  have hnoroot : ∀ μ : Cut, ¬ T.charpoly.IsRoot μ := by
    intro μ hμ
    exact hno μ ((Module.End.hasEigenvalue_iff_isRoot_charpoly T μ).mpr hμ)
  obtain ⟨qs, hqsdisc, hqsprod⟩ := cut_no_root_factors_negDisc T.charpoly_monic hnoroot
  exact subSelfadj_no_pure_quad_charpoly hT qs hqsdisc hqsprod

/-! ## The parity-free deflation re-seed — drops N79's `Odd` hypothesis. -/

/-- ★★ THE UNCONDITIONAL (any-parity) RE-SEED: drops the `Odd` hypothesis of N79
    `deflateRestrict_odd_reseed`. For a UNIT eigenpair `(l,u)` of an `EvC`-self-adjoint `g`, if the
    EvC-orthogonal complement `uPerp u` is nontrivial (`0 < finrank`), the deflated operator
    `deflateC g l u` has a NONZERO eigenvector lying INSIDE `uPerp u`. Instantiates the submodule
    seed at the restricted self-adjoint operator `deflateRestrict` on `uPerp u` (N79
    `deflateRestrict_isEvCSymm`). The parity-free inductive step the full spectral existence runs on
    at EVERY rung. -/
theorem deflateRestrict_reseed {g : Module.End Cut STVC} {l : Cut} {u : STVC}
    (hg : IsEvCSymm g) (hu : EvC u u = 1) (heig : g u = l • u)
    (hpos : 0 < Module.finrank Cut (uPerp u)) :
    ∃ (lam : Cut) (v : STVC), v ∈ uPerp u ∧ v ≠ 0 ∧ deflateC g l u v = lam • v := by
  haveI : Nontrivial (uPerp u) := Module.nontrivial_of_finrank_pos hpos
  have hT : IsEvCSymmSub (deflateRestrict hg hu heig) :=
    fun p q => deflateRestrict_isEvCSymm hg hu heig p q
  obtain ⟨μ, hev⟩ := submodule_selfadj_has_eigenvalue hT
  obtain ⟨w, hw⟩ := hev.exists_hasEigenvector
  refine ⟨μ, (w : STVC), w.2, ?_, ?_⟩
  · intro h
    exact hw.2 (Subtype.ext (by rw [h]; rfl))
  · have hc := congrArg (Subtype.val) hw.apply_eq_smul
    rw [deflateRestrict_coe] at hc
    rw [hc]
    rfl

/-- ★★★ THE UNIT-NORMALIZED PARITY-FREE RE-SEED: for a UNIT eigenpair `(l,u)` of an
    `EvC`-self-adjoint `g`, if `uPerp u` is nontrivial, the deflated operator has a UNIT eigenvector
    (`EvC v v = 1`) lying INSIDE `uPerp u` — the seed in exactly the `EvC u u = 1` normalized form the
    N70 `deflateC` engine consumes, at EVERY rung with NO parity case-split. Normalizes the
    `deflateRestrict_reseed` eigenvector `v₀` by `(cutSqrt (EvC v₀ v₀))⁻¹` (the ambient form is
    positive-definite so `EvC v₀ v₀ > 0`, `cutSqrt` from N57 gives the unit). -/
theorem deflateRestrict_reseed_unit {g : Module.End Cut STVC} {l : Cut} {u : STVC}
    (hg : IsEvCSymm g) (hu : EvC u u = 1) (heig : g u = l • u)
    (hpos : 0 < Module.finrank Cut (uPerp u)) :
    ∃ (lam : Cut) (v : STVC), v ∈ uPerp u ∧ EvC v v = 1 ∧ deflateC g l u v = lam • v := by
  obtain ⟨lam, v₀, hmem, hv0, hev⟩ := deflateRestrict_reseed hg hu heig hpos
  have hnpos : 0 < EvC v₀ v₀ :=
    lt_of_le_of_ne (EvC_nonneg v₀) (fun h => hv0 ((EvC_eq_zero_iff v₀).mp h.symm))
  set s : Cut := (cutSqrt (EvC v₀ v₀))⁻¹ with hs
  have hsqpos : 0 < cutSqrt (EvC v₀ v₀) := cutSqrt_pos hnpos
  refine ⟨lam, s • v₀, ?_, ?_, ?_⟩
  · exact (uPerp u).smul_mem s hmem
  · rw [EvC_smul_left, EvC_smul_right]
    rw [hs, ← mul_assoc]
    rw [show (cutSqrt (EvC v₀ v₀))⁻¹ * (cutSqrt (EvC v₀ v₀))⁻¹ * EvC v₀ v₀
          = (cutSqrt (EvC v₀ v₀) * cutSqrt (EvC v₀ v₀))⁻¹ * EvC v₀ v₀ by rw [mul_inv]]
    rw [cutSqrt_sq (le_of_lt hnpos), inv_mul_cancel₀ (ne_of_gt hnpos)]
  · rw [map_smul, hev, smul_comm]

end

end Phys.Algebra
