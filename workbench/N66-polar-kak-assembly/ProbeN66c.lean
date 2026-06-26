import Phys.Algebra.LorentzContinuumEigenBasisGen

namespace Phys.Algebra.ProbeN66c

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- copy boostC + uP eigenread for the witness/costume probe
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

/-- `uP` is an eigenvector of `boostC a b` with eigenvalue `a+b`: `boostC a b uP = (a+b)·uP`. -/
theorem boostC_uP (a b : Cut) : boostC a b uP = (a + b) • uP := by
  rw [boostC_apply]
  show (a * s2 + b * s2, b * s2 + a * s2, (0:O Cut)) = (a + b) • uP
  simp only [uP, Prod.smul_mk, smul_eq_mul, smul_zero]
  refine Prod.ext ?_ (Prod.ext ?_ ?_)
  · show a * s2 + b * s2 = (a + b) * s2; ring
  · show b * s2 + a * s2 = (a + b) * s2; ring
  · rfl

/-- The uP-eigenblock reading of `boostC a b`: `EvC (boostC a b uP) uP = a+b`. -/
theorem boostC_uP_read (a b : Cut) : EvC (boostC a b uP) uP = a + b := by
  rw [boostC_uP, EvC_smul_left, uP_norm, mul_one]

/-- The concrete boost `boostC (5/3)(4/3)` squares to `boostC (41/9)(40/9)` — its uP eigenblock
    reading is `(5/3)+(4/3) = 3`, so the eigenvalue squared is `9`. -/
theorem boostC_sq_5343 :
    EvC ((boostC ((41:Cut)/9) (40/9)) uP) uP = 9 := by
  rw [boostC_uP_read]; norm_num

end

end Phys.Algebra.ProbeN66c
