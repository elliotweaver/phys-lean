import Phys.Algebra.LorentzContinuumEigenBasisGen

namespace Phys.Algebra.ProbeN66

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-- The boost operator as a `Module.End`: `(t,x,v) ↦ (a·t+b·x, b·t+a·x, v)`, octonion block fixed. -/
def boostC (a b : Cut) : Module.End Cut STVC where
  toFun p := (a * p.1 + b * p.2.1, b * p.1 + a * p.2.1, p.2.2)
  map_add' p q := by
    obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', v'⟩ := q
    refine Prod.ext ?_ (Prod.ext ?_ ?_)
    · show a * (t + t') + b * (x + x') = (a * t + b * x) + (a * t' + b * x'); ring
    · show b * (t + t') + a * (x + x') = (b * t + a * x) + (b * t' + a * x'); ring
    · show v + v' = v + v'; rfl
  map_smul' c p := by
    obtain ⟨t, x, v⟩ := p
    refine Prod.ext ?_ (Prod.ext ?_ ?_)
    · show a * (c • t) + b * (c • x) = c • (a * t + b * x); simp only [smul_eq_mul]; ring
    · show b * (c • t) + a * (c • x) = c • (b * t + a * x); simp only [smul_eq_mul]; ring
    · show c • v = c • v; rfl

theorem boostC_apply (a b : Cut) (p : STVC) :
    boostC a b p = (a * p.1 + b * p.2.1, b * p.1 + a * p.2.1, p.2.2) := rfl

/-- The boost is its own EvC-adjoint (EvC-self-adjoint). -/
theorem boostC_isEvCSymm (a b : Cut) : IsEvCSymm (boostC a b) := by
  intro p q
  obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', v'⟩ := q
  show (a * t + b * x) * t' + (b * t + a * x) * x' + gFormC v v'
     = t * (a * t' + b * x') + x * (b * t' + a * x') + gFormC v v'
  ring

/-- Boosts compose: `boostC a b ∘ boostC a' b' = boostC (a·a'+b·b') (a·b'+a'·b)`. -/
theorem boostC_comp (a b a' b' : Cut) :
    (boostC a b).comp (boostC a' b') = boostC (a*a' + b*b') (a*b' + a'*b) := by
  apply LinearMap.ext
  intro p
  obtain ⟨t, x, v⟩ := p
  rw [LinearMap.comp_apply, boostC_apply, boostC_apply, boostC_apply]
  refine Prod.ext ?_ (Prod.ext ?_ ?_)
  · show a * (a' * t + b' * x) + b * (b' * t + a' * x) = (a*a' + b*b') * t + (a*b' + a'*b) * x; ring
  · show b * (a' * t + b' * x) + a * (b' * t + a' * x) = (a*b' + a'*b) * t + (a*a' + b*b') * x; ring
  · rfl

/-- The square of a boost: `boostC a b ∘ boostC a b = boostC (a²+b²) (2ab)`. -/
theorem boostC_sq (a b : Cut) :
    (boostC a b).comp (boostC a b) = boostC (a^2 + b^2) (2*a*b) := by
  rw [boostC_comp]
  congr 1 <;> ring

/-- The boost is EvC-positive-semidefinite for `a+b ≥ 0 ∧ a−b ≥ 0` (i.e. `a ≥ |b|`). -/
theorem boostC_nonneg {a b : Cut} (hab : 0 ≤ a + b) (hab' : 0 ≤ a - b) (p : STVC) :
    0 ≤ EvC (boostC a b p) p := by
  obtain ⟨t, x, v⟩ := p
  show 0 ≤ (a * t + b * x) * t + (b * t + a * x) * x + gFormC v v
  have hg := gFormC_nonneg v
  nlinarith [mul_nonneg hab (sq_nonneg (t + x)), mul_nonneg hab' (sq_nonneg (t - x)), hg]

/-- ★ The boost `boostC a b` is THE positive operator square root of `boostC (a²+b²)(2ab)`,
    for `a+b ≥ 0 ∧ a−b ≥ 0`. -/
theorem boostC_op_sqrt {a b : Cut} (hab : 0 ≤ a + b) (hab' : 0 ≤ a - b) :
    IsEvCOpSqrt (boostC a b) (boostC (a^2 + b^2) (2*a*b)) :=
  ⟨boostC_isEvCSymm a b, boostC_nonneg hab hab', boostC_sq a b⟩

/-! ## The compact factor: the octonion-block reflection `R = blockDiag 1 (−1)`. -/

/-- The compact factor is an EvC-orthogonal INVOLUTION: `R∘R = id`. -/
theorem R_orthogonal : (blockDiag (1:Cut) (-1)).comp (blockDiag (1:Cut) (-1))
    = (LinearMap.id : Module.End Cut STVC) := by
  rw [blockDiag_comp]
  rw [show (1:Cut)*1 = 1 from by norm_num, show (-1:Cut)*(-1) = 1 from by norm_num]
  rw [blockDiag_scalar, one_smul]

/-! ## THE POLAR / KAK ASSEMBLY g = k·exp(p) of a concrete isometry. -/

/-- The EvC-adjoint of the polar composite `R∘B` is `B∘R` (both factors EvC-self-adjoint). -/
theorem polG_adjoint (a b : Cut) :
    IsEvCAdjoint ((blockDiag (1:Cut) (-1)).comp (boostC a b))
      ((boostC a b).comp (blockDiag (1:Cut) (-1))) := by
  intro p q
  rw [LinearMap.comp_apply, LinearMap.comp_apply]
  rw [(blockDiag_isEvCSymm 1 (-1)) (boostC a b p) q]
  rw [(boostC_isEvCSymm a b) p (blockDiag (1:Cut) (-1) q)]

/-- ★ `g*∘g = B∘B = boostC (a²+b²)(2ab)` — the polar positive operator. -/
theorem polG_starComp (a b : Cut) :
    ((boostC a b).comp (blockDiag (1:Cut) (-1))).comp
      ((blockDiag (1:Cut) (-1)).comp (boostC a b))
    = boostC (a^2 + b^2) (2*a*b) := by
  have hR : (blockDiag (1:Cut) (-1)).comp (blockDiag (1:Cut) (-1))
      = (LinearMap.id : Module.End Cut STVC) := R_orthogonal
  apply LinearMap.ext
  intro p
  rw [LinearMap.comp_apply, LinearMap.comp_apply, LinearMap.comp_apply,
      ← LinearMap.comp_apply (blockDiag (1:Cut) (-1)), hR, LinearMap.id_apply,
      ← LinearMap.comp_apply, boostC_sq]

/-- ★★ THE POLAR POSITIVE PART: `exp(p) = √(g*g) = boostC a b` is the banked positive operator
    square root of `g*∘g`. -/
theorem polG_pos_part {a b : Cut} (hab : 0 ≤ a + b) (hab' : 0 ≤ a - b) :
    IsEvCOpSqrt (boostC a b)
      (((boostC a b).comp (blockDiag (1:Cut) (-1))).comp
        ((blockDiag (1:Cut) (-1)).comp (boostC a b))) := by
  rw [polG_starComp]
  exact boostC_op_sqrt hab hab'

end

end Phys.Algebra.ProbeN66
