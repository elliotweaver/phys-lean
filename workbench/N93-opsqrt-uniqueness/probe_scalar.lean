import Phys.Algebra.LorentzContinuumOpSqrtJConj

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- MEASURE PROBE: THE SCALAR-TARGET POSITIVE-OPERATOR-SQUARE-ROOT UNIQUENESS.
-- R EvC-self-adjoint, EvC-nonneg, R∘R = λ•id, 0 ≤ λ  ⟹  R = cutSqrt λ • id.

-- KEY IDENTITY: EvC (R v) (R v) = λ · EvC v v  (R self-adjoint + R²=λid).
theorem probe_key {R : Module.End Cut STVC} {l : Cut}
    (hsymm : IsEvCSymm R)
    (hsq : R.comp R = l • (LinearMap.id : Module.End Cut STVC)) (v : STVC) :
    EvC (R v) (R v) = l * EvC v v := by
  rw [hsymm v (R v)]
  have : R (R v) = l • v := by
    have := congrArg (fun (f : Module.End Cut STVC) => f v) hsq
    simpa [LinearMap.comp_apply] using this
  rw [this, EvC_smul_right]

-- THE FULL SCALAR-TARGET UNIQUENESS.
theorem probe_op_sqrt_scalar_unique {R : Module.End Cut STVC} {l : Cut}
    (hsymm : IsEvCSymm R) (hpos : ∀ p, 0 ≤ EvC (R p) p)
    (hl : 0 ≤ l) (hsq : R.comp R = l • (LinearMap.id : Module.End Cut STVC)) :
    R = cutSqrt l • (LinearMap.id : Module.End Cut STVC) := by
  set μ : Cut := cutSqrt l with hμ
  have hμnn : 0 ≤ μ := cutSqrt_nonneg l
  have hμsq : μ * μ = l := cutSqrt_sq hl
  rcases eq_or_lt_of_le hl with hl0 | hlpos
  · -- λ = 0: EvC (Rv)(Rv) = 0 ⟹ Rv = 0 ⟹ R = 0 = cutSqrt 0 • id
    have hμ0 : μ = 0 := by rw [hμ, ← hl0, cutSqrt_zero]
    apply LinearMap.ext; intro v
    have hk : EvC (R v) (R v) = 0 := by rw [probe_key hsymm hsq v, ← hl0, zero_mul]
    have hRv0 : R v = 0 := (EvC_eq_zero_iff (R v)).mp hk
    rw [hRv0, cutSmul_id_apply, hμ0, zero_smul]
  · -- λ > 0 (μ > 0): (R + μ•id) injective ⟹ surjective; (R − μ•id)∘(R + μ•id) = 0 ⟹ R = μ•id
    have hμpos : 0 < μ := by rw [hμ]; exact cutSqrt_pos hlpos
    set Rp : Module.End Cut STVC := R + μ • (LinearMap.id : Module.End Cut STVC) with hRp
    -- (R + μ•id) injective
    have hinj : Function.Injective Rp := by
      intro x y hxy
      -- reduce to kernel: Rp (x - y) = 0
      have hd : Rp (x - y) = 0 := by
        rw [map_sub, hxy, sub_self]
      -- EvC (Rp d) (Rp d) = 2λ EvC d d + 2μ EvC (R d) d ≥ 0, and = 0
      set d : STVC := x - y with hdd
      have hexp : EvC (Rp d) (Rp d) =
          EvC (R d) (R d) + μ * EvC (R d) d + μ * EvC d (R d) + (μ * μ) * EvC d d := by
        simp only [hRp, LinearMap.add_apply, LinearMap.smul_apply, LinearMap.id_apply]
        rw [EvC_add_left, EvC_add_right, EvC_add_right,
          EvC_smul_left, EvC_smul_right, EvC_smul_left, EvC_smul_right]
        ring
      have hRdd : EvC (R d) (R d) = l * EvC d d := probe_key hsymm hsq d
      have hsa : EvC d (R d) = EvC (R d) d := by rw [EvC_symm]
      have hzero : EvC (Rp d) (Rp d) = 0 := by rw [hd]; exact (EvC_eq_zero_iff 0).mpr rfl
      rw [hexp, hRdd, hsa, hμsq] at hzero
      -- hzero : l*EvC d d + μ*EvC(Rd)d + μ*EvC(Rd)d + l*EvC d d = 0
      -- = 2l*EvC d d + 2μ*EvC(Rd)d = 0; both terms ≥ 0
      have ht1 : 0 ≤ l * EvC d d := mul_nonneg hl (EvC_nonneg d)
      have ht2 : 0 ≤ μ * EvC (R d) d := mul_nonneg hμnn (hpos d)
      have hdd0 : l * EvC d d = 0 := by linarith
      -- if l > 0, EvC d d = 0 ⟹ d = 0
      have hEdd : EvC d d = 0 := by
        rcases mul_eq_zero.mp hdd0 with h | h
        · exact absurd h (ne_of_gt hlpos)
        · exact h
      have : d = 0 := (EvC_eq_zero_iff d).mp hEdd
      rw [hdd, sub_eq_zero] at this
      exact this
    have hsurj : Function.Surjective Rp := LinearMap.injective_iff_surjective.mp hinj
    -- (R − μ•id) ∘ (R + μ•id) = R∘R − μ²•id = 0
    set Rm : Module.End Cut STVC := R - μ • (LinearMap.id : Module.End Cut STVC) with hRm
    have hprod : Rm.comp Rp = 0 := by
      apply LinearMap.ext; intro v
      simp only [hRm, hRp, LinearMap.comp_apply, LinearMap.sub_apply, LinearMap.add_apply,
        LinearMap.smul_apply, LinearMap.id_apply, map_add, map_smul]
      have hRR : R (R v) = l • v := by
        have := congrArg (fun (f : Module.End Cut STVC) => f v) hsq
        simpa [LinearMap.comp_apply] using this
      rw [hRR, LinearMap.zero_apply]
      -- l•v + μ•(R v) - μ•(R v) - μ•(μ•v) = l•v - (μ*μ)•v = 0
      rw [smul_sub, smul_smul, hμsq]
      abel
    -- Rm = 0 by surjectivity of Rp
    have hRm0 : Rm = 0 := by
      apply LinearMap.ext; intro y
      obtain ⟨x, hx⟩ := hsurj y
      have := congrArg (fun (f : Module.End Cut STVC) => f x) hprod
      simp only [LinearMap.comp_apply, LinearMap.zero_apply] at this
      rw [hx] at this
      rw [this, LinearMap.zero_apply]
    -- R = μ•id
    have : R = μ • (LinearMap.id : Module.End Cut STVC) := by
      have := sub_eq_zero.mp (by rw [← hRm]; exact hRm0)
      exact this
    rw [this]

end

end Phys.Algebra
