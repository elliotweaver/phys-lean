import Phys.Algebra.LorentzContinuumOctBlockSO8Exhaustion

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- PROBE 1: scale-invariance of houseHolder.
theorem houseHolder_smul_probe (a : O Cut) (t : Cut) (ht : t ≠ 0) :
    houseHolder (t • a) = houseHolder a := by
  apply LinearMap.ext; intro v
  rw [houseHolder_apply, houseHolder_apply, gFormC_smul_left, gFormC_smul_right,
      gFormC_smul_left]
  rw [mul_inv, smul_smul]
  congr 1
  field_simp
  ring

-- PROBE 2: the PARAMETRIZED general bireflection = octPlaneRot identity.
theorem bireflection_eq_octPlaneRot_gen_probe (e f : O Cut) (k μ : Cut)
    (hee : gFormC e e = 1) (hff : gFormC f f = 1) (hef : gFormC e f = 0)
    (hkm : k ^ 2 + μ ^ 2 = 1) :
    houseHolder e * houseHolder (k • e + μ • f)
      = octPlaneRot e f (2 * k ^ 2 - 1) (-(2 * k * μ)) := by
  have hfe : gFormC f e = 0 := by rw [gFormC_symm]; exact hef
  have hbb : gFormC (k • e + μ • f) (k • e + μ • f) = 1 := by
    simp only [gFormC_add_left, gFormC_add_right, gFormC_smul_left, gFormC_smul_right,
      hee, hff, hef, hfe]
    nlinarith [hkm]
  apply LinearMap.ext; intro v
  rw [Module.End.mul_apply, houseHolder_apply e (houseHolder (k • e + μ • f) v),
      houseHolder_apply (k • e + μ • f) v, octPlaneRot_apply, hee, hbb]
  simp only [inv_one, mul_one]
  have hbv : gFormC (k • e + μ • f) v = k * gFormC e v + μ * gFormC f v := by
    rw [gFormC_add_left, gFormC_smul_left, gFormC_smul_left]
  have heb : gFormC e (k • e + μ • f) = k := by
    rw [gFormC_add_right, gFormC_smul_right, gFormC_smul_right, hee, hef]; ring
  have hinner : gFormC e (v - (2 * gFormC (k • e + μ • f) v) • (k • e + μ • f))
      = gFormC e v - 2 * gFormC (k • e + μ • f) v * k := by
    rw [gFormC_symm e, gFormC_sub_left, gFormC_smul_left, gFormC_symm (k • e + μ • f) e, heb,
        gFormC_symm v e]
  rw [hinner, hbv, gFormC_symm v e, gFormC_symm v f]
  match_scalars <;> nlinarith [hkm]

end
end Phys.Algebra
