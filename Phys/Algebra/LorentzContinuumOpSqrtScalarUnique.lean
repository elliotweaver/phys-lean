/-
  Phys.Algebra.LorentzContinuumOpSqrtScalarUnique — N93 (part 1): THE SCALAR-TARGET
  POSITIVE-OPERATOR-SQUARE-ROOT UNIQUENESS — over the DERIVED ℝ `Cut` and the terminal algebra
  `O Cut := CD (H Cut)`.
  ===========================================================================
  THE NEXT FORCED NODE after THE TWO POSITIVE OPERATOR SQUARE ROOTS OF `p⁻¹` (N92). N92 banked the
  SETUP `linIsom_two_opSqrts_of_posInv`: BOTH `J p^{1/2} J` and `(p^{1/2})⁻¹` are positive operator
  square roots of the SAME `p⁻¹ = specOpN c⁻¹ u`. The lift `J p^{1/2} J = (p^{1/2})⁻¹` they feed needs
  the positive-operator-square-root UNIQUENESS `IsEvCOpSqrt s₁ q → IsEvCOpSqrt s₂ q → s₁ = s₂`.

  ── THE W3 DECOMPOSITION (this node banks the eigenspace KERNEL) ──
  The FULLY GENERAL uniqueness over the 10-dim `STVC` (the two roots live over DIFFERENT eigen-families
  and `q` may have DEGENERATE eigenvalues) is the genuine W1 spectral remainder — the EvC-inner-product
  route `EvC ((s₁−s₂)v)((s₁−s₂)v) → 0` is genuinely CIRCULAR without commuting (it reduces to a
  tautology `S = S`), and the Halmos anticommutation identity `{s₁+s₂, s₁−s₂} = 0` collapses to a
  tautology too over a general real-closed field with no analysis. The honest finite-dimensional route
  is eigenspace localization: on each `q`-eigenspace `q` acts as a SCALAR `λ·id`, and the root restricts
  to a positive operator squaring to `λ·id` — so the KERNEL that localization consumes per eigenspace is
  THE SCALAR-TARGET UNIQUENESS this node banks. The general uniqueness, the lift `J p^{1/2} J =
  (p^{1/2})⁻¹`, and the full isometry-compact-part lemma are childed onto the chain tail (N94).

  ── WHAT THIS NODE DERIVES (FORCED — pure pointwise linear algebra + the trunk positivity, NO
     analysis, NO functional calculus, NO spectral theorem) ──
    • `evC_radical_of_nonneg` — THE POSITIVE-SEMIDEFINITE-FORM RADICAL LEMMA (elementary
      Cauchy–Schwarz, discriminant form): if `M` is `EvC`-self-adjoint and `EvC`-positive-semidefinite
      and `EvC (M y) y = 0`, then `M y = 0`. The reusable lever for the eventual general uniqueness.
    • `op_sqrt_scalar_unique` — ★ THE DELIVERABLE: a positive operator square root `R` of a SCALAR
      operator `λ·id` (`0 ≤ λ`) is the homothety `cutSqrt λ · id`. The genuine generalization of the
      banked `scalar_op_sqrt_unique` (which ASSUMED the root is itself a homothety `b·id`) to an
      ARBITRARY positive root. Dissolved from the trunk:
        — `μ := cutSqrt λ`, `μ·μ = λ` (`cutSqrt_sq`), `μ ≥ 0` (`cutSqrt_nonneg`);
        — `λ = 0`: `EvC (R v)(R v) = λ·EvC v v = 0 ⟹ R v = 0` (`EvC` positive-definite), so `R = 0 =
          cutSqrt 0 · id` (`cutSqrt_zero`);
        — `λ > 0` (`μ > 0`): `R + μ·id` is INJECTIVE — `EvC ((R+μ)v)((R+μ)v) = 2λ·EvC v v + 2μ·EvC(R v)v`
          is a sum of TWO non-negatives (the Born self-overlap positivity), `= 0 ⟹ EvC v v = 0 ⟹ v = 0`.
          Injective ⟹ SURJECTIVE over the finite `Cut`-module `STVC`
          (`LinearMap.injective_iff_surjective`, `Module.Finite Cut STVC` N76); and
          `(R − μ·id)∘(R + μ·id) = R∘R − μ²·id = λ·id − λ·id = 0` (`μ` a scalar commutes), so surjectivity
          of `R + μ·id` forces `R − μ·id = 0`, i.e. `R = μ·id = cutSqrt λ · id`.
    • `op_sqrt_scalar_unique_eq` — the two-roots corollary: two positive operator square roots of the
      same scalar `λ·id` are EQUAL.
    • non-vacuity (W8): `op_sqrt_scalar_unique_witness` (`R = 3·id` is the only positive root of `9·id`)
      and `not_op_sqrt_scalar_4_9` (the WRONG homothety `4·id` is NOT a root of `9·id`: `16 ≠ 9`).

  ── THE STANDARD (the only bar) ──
  Unbroken: every object derives from the banked N49–N92 ← the order-completeness of the derived ℝ
  `Cut` ← the fold. `LinearMap.injective_iff_surjective`, `Module.Finite Cut STVC`, `map_smul`,
  `LinearMap.comp_apply`, `smul_smul`, `abel`/`ring`/`linarith` are standard MACHINERY on the DERIVED
  objects (STANDARD §3). Complete: `#print axioms ⊆ {propext, Classical.choice, Quot.sound}` for every
  declaration (Audits/AxiomAudit.lean). Words-removable: delete "square-root/uniqueness/positive-
  definite/positive-semidefinite/self-adjoint/scalar/homothety/spectral/isometry/compact/radical" → over
  the derived complete ordered field `Cut`, with the positive-definite symmetric form `EvC`: if `M` is
  `EvC`-symmetric with `∀z, 0 ≤ EvC (M z) z` and `EvC (M y) y = 0` then `M y = 0`; and if `R` is
  `EvC`-symmetric with `∀p, 0 ≤ EvC (R p) p` and `R∘R = l·id` with `0 ≤ l`, then `R = cutSqrt l · id`;
  pure linear-algebra math. NO theorem STATEMENT needs a physics word.

  NO Mathlib number-system content import (the field is the DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumOpSqrtJConj

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## THE POSITIVE-SEMIDEFINITE-FORM RADICAL LEMMA (elementary Cauchy–Schwarz). -/

/-- THE RADICAL OF A POSITIVE-SEMIDEFINITE FORM: if `M` is `EvC`-self-adjoint and
    `EvC`-positive-semidefinite (`∀z, 0 ≤ EvC (M z) z`) and `EvC (M y) y = 0`, then `M y = 0`.
    The elementary Cauchy–Schwarz / discriminant argument over the derived complete ordered field
    `Cut`: for the positive-semidefinite symmetric form `⟨a,b⟩ := EvC (M a) b` (symmetric since `M` is
    `EvC`-self-adjoint), `0 ≤ ⟨y + t z, y + t z⟩ = t²·⟨z,z⟩ + 2t·⟨y,z⟩` (constant term `⟨y,y⟩ = 0`) for
    EVERY `t`; a quadratic in `t` with vanishing constant term that stays `≥ 0` forces the linear
    coefficient `⟨y,z⟩ = 0` for all `z` (else a small `t` of the opposite sign makes it negative), and
    `EvC` non-degeneracy then gives `M y = 0`. NO square root, NO analysis. The reusable lever the
    eventual general positive-operator-square-root uniqueness consumes. -/
theorem evC_radical_of_nonneg {M : Module.End Cut STVC} (hsymm : IsEvCSymm M)
    (hpos : ∀ z, 0 ≤ EvC (M z) z) {y : STVC} (hy : EvC (M y) y = 0) : M y = 0 := by
  -- First: EvC (M y) z = 0 for all z.
  have hcross : ∀ z, EvC (M y) z = 0 := by
    intro z
    -- the quadratic Q t := EvC (M (y + t•z)) (y + t•z) = t²·EvC(Mz)z + 2t·EvC(My)z ≥ 0 ∀ t.
    have hQ : ∀ t : Cut, 0 ≤ t * t * EvC (M z) z + 2 * t * EvC (M y) z := by
      intro t
      have hexp : EvC (M (y + t • z)) (y + t • z)
          = EvC (M y) y + t * EvC (M y) z + t * EvC (M y) z + t * t * EvC (M z) z := by
        rw [map_add, map_smul, EvC_add_left, EvC_add_right, EvC_add_right,
          EvC_smul_left, EvC_smul_right, EvC_smul_left, EvC_smul_right]
        -- cross terms EvC (M z) y and EvC (M y) z coincide by self-adjointness + symmetry
        rw [hsymm z y, EvC_symm z (M y)]
        ring
      have := hpos (y + t • z)
      rw [hexp, hy] at this
      -- this : 0 ≤ 0 + t*EvC(My)z + t*EvC(My)z + t*t*EvC(Mz)z
      linarith
    -- A quadratic a·t² + b·t ≥ 0 ∀ t with no constant term forces b = 0 (a = EvC(Mz)z ≥ 0).
    set a : Cut := EvC (M z) z with ha
    set b : Cut := EvC (M y) z with hb
    have hane : 0 ≤ a := hpos z
    by_contra hbne
    -- WLOG choose t to violate. If b ≠ 0, pick t = -b / (a+1): then a t² + 2 b t < 0.
    -- Cleaner: evaluate at a tiny t of sign opposite to b.
    rcases lt_or_gt_of_ne hbne with hblt | hbgt
    · -- b < 0: pick small t > 0 so that a t² + 2 b t < 0
      have hsel := hQ (-b / (a + 1))
      have hapos : 0 < a + 1 := by linarith
      have hne : a + 1 ≠ 0 := ne_of_gt hapos
      -- a t² + 2 b t = (-b/(a+1))·[a·(-b/(a+1)) + 2b] = (-b/(a+1))·[(-ab + 2b(a+1))/(a+1)]
      -- = (-b/(a+1))·[(ab + 2b)/(a+1)] = -b(ab+2b)/(a+1)² = -b²(a+2)/(a+1)² < 0 since b<0, a+2>0
      have hb2 : 0 < b * b := mul_pos_of_neg_of_neg hblt hblt
      have hkey : (-b / (a + 1)) * (-b / (a + 1)) * a + 2 * (-b / (a + 1)) * b
          = (- (b * b) * (a + 2)) / ((a + 1) * (a + 1)) := by
        field_simp
        ring
      rw [hkey] at hsel
      have hden : 0 < (a + 1) * (a + 1) := mul_pos hapos hapos
      have hnum : - (b * b) * (a + 2) < 0 := by
        apply mul_neg_of_neg_of_pos
        · linarith
        · linarith
      have : (- (b * b) * (a + 2)) / ((a + 1) * (a + 1)) < 0 := div_neg_of_neg_of_pos hnum hden
      linarith
    · -- b > 0: symmetric, pick t = -b/(a+1) < 0
      have hsel := hQ (-b / (a + 1))
      have hapos : 0 < a + 1 := by linarith
      have hb2 : 0 < b * b := mul_pos hbgt hbgt
      have hkey : (-b / (a + 1)) * (-b / (a + 1)) * a + 2 * (-b / (a + 1)) * b
          = (- (b * b) * (a + 2)) / ((a + 1) * (a + 1)) := by
        field_simp
        ring
      rw [hkey] at hsel
      have hden : 0 < (a + 1) * (a + 1) := mul_pos hapos hapos
      have hnum : - (b * b) * (a + 2) < 0 := by
        apply mul_neg_of_neg_of_pos
        · linarith
        · linarith
      have : (- (b * b) * (a + 2)) / ((a + 1) * (a + 1)) < 0 := div_neg_of_neg_of_pos hnum hden
      linarith
  -- EvC (M y) z = 0 ∀ z  ⟹  M y = 0 by EvC non-degeneracy (EvC (My)(My) = 0).
  have : EvC (M y) (M y) = 0 := hcross (M y)
  exact (EvC_eq_zero_iff (M y)).mp this

/-! ## THE SCALAR-TARGET POSITIVE-OPERATOR-SQUARE-ROOT UNIQUENESS. -/

/-- THE KEY IDENTITY: for an `EvC`-self-adjoint `R` with `R∘R = l·id`, `EvC (R v)(R v) = l·EvC v v`.
    `EvC (R v)(R v) = EvC v (R (R v)) = EvC v (l•v) = l·EvC v v` (`R` self-adjoint + `R² = l·id`). -/
theorem evC_RR_eq_scalar {R : Module.End Cut STVC} {l : Cut} (hsymm : IsEvCSymm R)
    (hsq : R.comp R = l • (LinearMap.id : Module.End Cut STVC)) (v : STVC) :
    EvC (R v) (R v) = l * EvC v v := by
  rw [hsymm v (R v)]
  have hRR : R (R v) = l • v := by
    have := congrArg (fun (f : Module.End Cut STVC) => f v) hsq
    simpa [LinearMap.comp_apply] using this
  rw [hRR, EvC_smul_right]

/-- ★ THE DELIVERABLE — THE SCALAR-TARGET POSITIVE-OPERATOR-SQUARE-ROOT UNIQUENESS: a positive
    operator square root `R` of a SCALAR operator `l·id` (`0 ≤ l`) is the homothety `cutSqrt l · id`.
    The genuine generalization of the banked `scalar_op_sqrt_unique` (which ASSUMED the root is itself a
    homothety) to an ARBITRARY positive root, dissolved from the trunk via the `(R + μ·id)`-injective
    argument (`μ := cutSqrt l`): NO analysis, NO functional calculus, NO spectral theorem.
    On each `q`-eigenspace of a general `q`, `q` acts as `λ·id`, so this is the KERNEL the eigenspace
    localization of the FULL general uniqueness consumes. -/
theorem op_sqrt_scalar_unique {R : Module.End Cut STVC} {l : Cut} (hl : 0 ≤ l)
    (hsymm : IsEvCSymm R) (hpos : ∀ p, 0 ≤ EvC (R p) p)
    (hsq : R.comp R = l • (LinearMap.id : Module.End Cut STVC)) :
    R = cutSqrt l • (LinearMap.id : Module.End Cut STVC) := by
  set μ : Cut := cutSqrt l with hμ
  have hμnn : 0 ≤ μ := cutSqrt_nonneg l
  have hμsq : μ * μ = l := cutSqrt_sq hl
  rcases eq_or_lt_of_le hl with hl0 | hlpos
  · -- l = 0: EvC (R v)(R v) = 0 ⟹ R v = 0 ⟹ R = 0 = cutSqrt 0 • id
    have hμ0 : μ = 0 := by rw [hμ, ← hl0, cutSqrt_zero]
    apply LinearMap.ext; intro v
    have hk : EvC (R v) (R v) = 0 := by rw [evC_RR_eq_scalar hsymm hsq v, ← hl0, zero_mul]
    have hRv0 : R v = 0 := (EvC_eq_zero_iff (R v)).mp hk
    rw [hRv0, cutSmul_id_apply, hμ0, zero_smul]
  · -- l > 0 (μ > 0): (R + μ•id) injective ⟹ surjective; (R − μ•id)∘(R + μ•id) = 0 ⟹ R = μ•id
    set Rp : Module.End Cut STVC := R + μ • (LinearMap.id : Module.End Cut STVC) with hRp
    have hinj : Function.Injective Rp := by
      intro x y hxy
      have hd : Rp (x - y) = 0 := by rw [map_sub, hxy, sub_self]
      set d : STVC := x - y with hdd
      have hexp : EvC (Rp d) (Rp d) =
          EvC (R d) (R d) + μ * EvC (R d) d + μ * EvC d (R d) + (μ * μ) * EvC d d := by
        simp only [hRp, LinearMap.add_apply, LinearMap.smul_apply, LinearMap.id_apply]
        rw [EvC_add_left, EvC_add_right, EvC_add_right,
          EvC_smul_left, EvC_smul_right, EvC_smul_left, EvC_smul_right]
        ring
      have hRdd : EvC (R d) (R d) = l * EvC d d := evC_RR_eq_scalar hsymm hsq d
      have hsa : EvC d (R d) = EvC (R d) d := by rw [EvC_symm]
      have hzero : EvC (Rp d) (Rp d) = 0 := by rw [hd]; exact (EvC_eq_zero_iff 0).mpr rfl
      rw [hexp, hRdd, hsa, hμsq] at hzero
      have ht1 : 0 ≤ l * EvC d d := mul_nonneg hl (EvC_nonneg d)
      have ht2 : 0 ≤ μ * EvC (R d) d := mul_nonneg hμnn (hpos d)
      have hdd0 : l * EvC d d = 0 := by linarith
      have hEdd : EvC d d = 0 := by
        rcases mul_eq_zero.mp hdd0 with h | h
        · exact absurd h (ne_of_gt hlpos)
        · exact h
      have : d = 0 := (EvC_eq_zero_iff d).mp hEdd
      rw [hdd, sub_eq_zero] at this
      exact this
    have hsurj : Function.Surjective Rp := LinearMap.injective_iff_surjective.mp hinj
    set Rm : Module.End Cut STVC := R - μ • (LinearMap.id : Module.End Cut STVC) with hRm
    have hprod : Rm.comp Rp = 0 := by
      apply LinearMap.ext; intro v
      simp only [hRm, hRp, LinearMap.comp_apply, LinearMap.sub_apply, LinearMap.add_apply,
        LinearMap.smul_apply, LinearMap.id_apply, map_add, map_smul]
      have hRR : R (R v) = l • v := by
        have := congrArg (fun (f : Module.End Cut STVC) => f v) hsq
        simpa [LinearMap.comp_apply] using this
      rw [hRR, LinearMap.zero_apply, smul_sub, smul_smul, hμsq]
      abel
    have hRm0 : Rm = 0 := by
      apply LinearMap.ext; intro z
      obtain ⟨x, hx⟩ := hsurj z
      have := congrArg (fun (f : Module.End Cut STVC) => f x) hprod
      simp only [LinearMap.comp_apply, LinearMap.zero_apply] at this
      rw [hx] at this
      rw [this, LinearMap.zero_apply]
    have hReq : R = μ • (LinearMap.id : Module.End Cut STVC) :=
      sub_eq_zero.mp (by rw [← hRm]; exact hRm0)
    rw [hReq]

/-- The two-roots corollary: two positive operator square roots of the SAME scalar `l·id` are EQUAL.
    Both equal `cutSqrt l · id` by `op_sqrt_scalar_unique`. The scalar-target instance of the general
    positive-operator-square-root uniqueness `IsEvCOpSqrt s₁ q → IsEvCOpSqrt s₂ q → s₁ = s₂`. -/
theorem op_sqrt_scalar_unique_eq {R₁ R₂ : Module.End Cut STVC} {l : Cut} (hl : 0 ≤ l)
    (h₁ : IsEvCOpSqrt R₁ (l • (LinearMap.id : Module.End Cut STVC)))
    (h₂ : IsEvCOpSqrt R₂ (l • (LinearMap.id : Module.End Cut STVC))) : R₁ = R₂ := by
  obtain ⟨hs₁, hp₁, hc₁⟩ := h₁
  obtain ⟨hs₂, hp₂, hc₂⟩ := h₂
  rw [op_sqrt_scalar_unique hl hs₁ hp₁ hc₁, op_sqrt_scalar_unique hl hs₂ hp₂ hc₂]

/-! ## Non-vacuity (W8). -/

/-- ★ NON-VACUITY (W8): the positive operator square root of `9·id` is exactly `3·id`. A genuine
    homothety, not a vacuous statement: any positive root of `9·id` equals `cutSqrt 9 · id = 3·id`. -/
theorem op_sqrt_scalar_unique_witness {R : Module.End Cut STVC}
    (hsymm : IsEvCSymm R) (hpos : ∀ p, 0 ≤ EvC (R p) p)
    (hsq : R.comp R = (9 : Cut) • (LinearMap.id : Module.End Cut STVC)) :
    R = (3 : Cut) • (LinearMap.id : Module.End Cut STVC) := by
  have h := op_sqrt_scalar_unique (by norm_num : (0:Cut) ≤ 9) hsymm hpos hsq
  have h9 : cutSqrt (9 : Cut) = 3 := (cutSqrt_unique (by norm_num) (by norm_num)).symm
  rwa [h9] at h

/-- ★ NON-VACUITY (W8 teeth): the WRONG homothety `4·id` is NOT a positive operator square root of
    `9·id` — it would force `4·4 = 16 = 9`. The scalar-target uniqueness has genuine content: a wrong
    root fails, reducing to the false numeric `16 = 9`. -/
theorem not_op_sqrt_scalar_4_9 :
    ¬ IsEvCOpSqrt ((4 : Cut) • (LinearMap.id : Module.End Cut STVC))
      ((9 : Cut) • (LinearMap.id : Module.End Cut STVC)) := by
  intro hsqrt
  obtain ⟨_, _, hcomp⟩ := hsqrt
  rw [cutSmul_comp] at hcomp
  have : (4 : Cut) * 4 = 9 := cutSmul_id_inj hcomp
  norm_num at this

end

end Phys.Algebra
