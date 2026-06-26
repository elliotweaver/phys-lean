import Phys.Algebra.LorentzContinuumEigenBasisGen

namespace Phys.Algebra.ProbeN66cost

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD

noncomputable section

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

theorem boostC_sq (a b : Cut) :
    (boostC a b).comp (boostC a b) = boostC (a^2 + b^2) (2*a*b) := by
  rw [boostC_comp]; congr 1 <;> ring

theorem boostC_uP (a b : Cut) : boostC a b uP = (a + b) • uP := by
  rw [boostC_apply]
  show (a * s2 + b * s2, b * s2 + a * s2, (0:O Cut)) = (a + b) • uP
  simp only [uP, Prod.smul_mk, smul_eq_mul, smul_zero]
  refine Prod.ext ?_ (Prod.ext ?_ ?_)
  · show a * s2 + b * s2 = (a + b) * s2; ring
  · show b * s2 + a * s2 = (a + b) * s2; ring
  · rfl

theorem boostC_uP_read (a b : Cut) : EvC (boostC a b uP) uP = a + b := by
  rw [boostC_uP, EvC_smul_left, uP_norm, mul_one]

-- COSTUME C97: the WRONG positive operator square root of the concrete positive operator
-- g*g = boostC 5 4. The TRUE positive part is boostC 2 1 (since (boostC 2 1)² = boostC (4+1)(4)
-- = boostC 5 4, uP-eigenvalue 2+1=3, 3²=9 = the uP reading of boostC 5 4). The BOGUS claim that
-- boostC 4 1 is the positive square root would require (boostC 4 1)² = boostC 5 4 as operators,
-- so reading the uP eigenblock of both sides: (4+1)² = 25 must equal the true reading 9. The
-- wrong polar-factor claim reduces to the false numeric 25 = 9.
theorem boostC_wrong_root_BOGUS :
    EvC (((boostC (4:Cut) 1).comp (boostC (4:Cut) 1)) uP) uP
      = EvC ((boostC (5:Cut) 4) uP) uP := by
  rw [show EvC (((boostC (4:Cut) 1).comp (boostC (4:Cut) 1)) uP) uP = 25 from by
        rw [boostC_sq, boostC_uP_read]; norm_num,
      show EvC ((boostC (5:Cut) 4) uP) uP = 9 from by rw [boostC_uP_read]; norm_num]

end

end Phys.Algebra.ProbeN66cost
