import Phys.Algebra.LorentzContinuumOctBlockSO8Exhaustion

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- copy probe1's two lemmas (assumed banked)
theorem houseHolder_smul_probe (a : O Cut) (t : Cut) (ht : t ≠ 0) :
    houseHolder (t • a) = houseHolder a := by
  apply LinearMap.ext; intro v
  rw [houseHolder_apply, houseHolder_apply, gFormC_smul_left, gFormC_smul_right,
      gFormC_smul_left, mul_inv, smul_smul]
  congr 1
  field_simp

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
  match_scalars
  all_goals (try ring)
  all_goals linear_combination (-2 * gFormC f v) * hkm

-- PROBE 3: the general-circle-point JoinedIdQvC (handles the antipode/half-turn uniformly).
theorem joinedIdQvC_octBlockEndC_octPlaneRot_circle_probe (e f : O Cut) (c s : Cut)
    (hee : gFormC e e = 1) (hff : gFormC f f = 1) (hef : gFormC e f = 0)
    (hcs : c ^ 2 + s ^ 2 = 1) :
    JoinedIdQvC (octBlockEndC (octPlaneRot e f c s)) := by
  by_cases hc : 1 + c = 0
  · have hc' : c = -1 := by linarith
    have hs0 : s ^ 2 = 0 := by nlinarith [hcs]
    have hs : s = 0 := by
      have := pow_eq_zero_iff (n := 2) (by norm_num) |>.mp hs0
      exact this
    rw [hc', hs, ← octPlaneRot_quarter_sq e f hee hff hef, octBlockEndC_mul]
    have hq : JoinedIdQvC (octBlockEndC (octPlaneRot e f 0 1)) :=
      joinedIdQvC_octBlockEndC_octPlaneRot e f 0 1 hee hff hef (by ring) (by norm_num)
    exact joinedIdQvC_mul hq hq
  · exact joinedIdQvC_octBlockEndC_octPlaneRot e f c s hee hff hef hcs hc

end
end Phys.Algebra
