import Phys.Algebra.SpacetimeReduction
import Phys.Algebra.DerivationFinrank

namespace Phys.Algebra.Probe
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- The perfect-fluid mixed stress T^μ_ν = diag(ρ, −P, −P, −P) on STV4 = ℚ×ℚ×Dbl ℚ.
def pfStress (ρ P : ℚ) : STV4 →ₗ[ℚ] STV4 where
  toFun p := (ρ * p.1, -P * p.2.1, (-P) • p.2.2)
  map_add' p q := by
    simp only [Prod.fst_add, Prod.snd_add, smul_add]
    ext <;> simp <;> ring
  map_smul' c p := by
    simp only [Prod.smul_fst, Prod.smul_snd, smul_eq_mul, RingHom.id_apply, smul_smul]
    ext <;> simp <;> ring

-- readings
noncomputable def density (S : STV4 →ₗ[ℚ] STV4) : ℚ := (S (1,0,0)).1
noncomputable def pressure (S : STV4 →ₗ[ℚ] STV4) : ℚ := -(S (0,1,0)).2.1

example (ρ P : ℚ) : density (pfStress ρ P) = ρ := by
  simp [density, pfStress]
example (ρ P : ℚ) : pressure (pfStress ρ P) = P := by
  simp [pressure, pfStress]

-- The trace: try LinearMap.trace directly.
example (ρ P : ℚ) : LinearMap.trace ℚ STV4 (pfStress ρ P) = ρ - 3 * P := by
  sorry

end Phys.Algebra.Probe
