import Phys.Algebra.DerivationUpperBound
import Mathlib.LinearAlgebra.Dimension.StrongRankCondition
import Mathlib.Tactic

namespace Phys.Algebra.ScratchN20fin
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

theorem oct_ext_zero (x : O ℚ)
    (h0 : x.re.re.re = 0) (h1 : x.re.re.im = 0)
    (h2 : x.re.im.re = 0) (h3 : x.re.im.im = 0)
    (h4 : x.im.re.re = 0) (h5 : x.im.re.im = 0)
    (h6 : x.im.im.re = 0) (h7 : x.im.im.im = 0) : x = 0 := by
  ext
  · exact h0
  · exact h1
  · exact h2
  · exact h3
  · exact h4
  · exact h5
  · exact h6
  · exact h7

private lemma mul_u12 : u1 * u2 = u3 := by
  ext <;> simp [u1, u2, u3, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,
    Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im]

def coordMap : Module.End ℚ (O ℚ) →ₗ[ℚ] (Fin 14 → ℚ) where
  toFun D := ![
    (D u1).re.im.re, (D u1).re.im.im, (D u1).im.re.re, (D u1).im.re.im, (D u1).im.im.re, (D u1).im.im.im,
    (D u2).re.im.im, (D u2).im.re.re, (D u2).im.re.im, (D u2).im.im.re, (D u2).im.im.im,
    (D u4).im.re.im, (D u4).im.im.re, (D u4).im.im.im ]
  map_add' D D' := by
    funext i
    fin_cases i <;>
      simp [LinearMap.add_apply, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im]
  map_smul' q D := by
    funext i
    fin_cases i <;>
      simp [LinearMap.smul_apply, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im]

theorem gens_zero (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D)
    (p1 : (D u1).re.im.re = 0) (p2 : (D u1).re.im.im = 0) (p3 : (D u1).im.re.re = 0)
    (p4 : (D u1).im.re.im = 0) (p5 : (D u1).im.im.re = 0) (p6 : (D u1).im.im.im = 0)
    (q3 : (D u2).re.im.im = 0) (q4 : (D u2).im.re.re = 0) (q5 : (D u2).im.re.im = 0)
    (q6 : (D u2).im.im.re = 0) (q7 : (D u2).im.im.im = 0)
    (r5 : (D u4).im.re.im = 0) (r6 : (D u4).im.im.re = 0) (r7 : (D u4).im.im.im = 0) :
    D u1 = 0 ∧ D u2 = 0 ∧ D u4 = 0 := by
  have d1c0 := derivQ_reQ_zero D hD u1
  have d1c1 := cut_e1_c1 D hD
  have hDe1 : D u1 = 0 := oct_ext_zero _ d1c0 d1c1 p1 p2 p3 p4 p5 p6
  have d2c0 := derivQ_reQ_zero D hD u2
  have hc12 := cut_e12_c0 D hD
  have d2c1 : (D u2).re.re.im = 0 := by rw [p1] at hc12; linarith [hc12]
  have d2c2 := cut_e2_c2 D hD
  have hDe2 : D u2 = 0 := oct_ext_zero _ d2c0 d2c1 d2c2 q3 q4 q5 q6 q7
  have hDe3 : D u3 = 0 := by rw [← mul_u12, hD u1 u2, hDe1, hDe2]; simp
  have d4c0 := derivQ_reQ_zero D hD u4
  have hc14 := cut_e14_c0 D hD
  have d4c1 : (D u4).re.re.im = 0 := by rw [p3] at hc14; linarith [hc14]
  have hc24 := cut_e24_c0 D hD
  have d4c2 : (D u4).re.im.re = 0 := by rw [q4] at hc24; linarith [hc24]
  have hc34 := cut_e34_c0 D hD
  have d3im : (D u3).im.re.re = 0 := by rw [hDe3]; rfl
  have d4c3 : (D u4).re.im.im = 0 := by rw [d3im] at hc34; linarith [hc34]
  have d4c4 := cut_e4_c4 D hD
  have hDe4 : D u4 = 0 := oct_ext_zero _ d4c0 d4c1 d4c2 d4c3 d4c4 r5 r6 r7
  exact ⟨hDe1, hDe2, hDe4⟩

/-- The restriction of `coordMap` to `derivationQ`. -/
noncomputable def coordMapR : derivationQ →ₗ[ℚ] (Fin 14 → ℚ) :=
  coordMap.comp (Submodule.subtype derivationQ)

/-- ★ INJECTIVITY of the pivot-coordinate map on `derivationQ`. -/
theorem coordMapR_injective : Function.Injective coordMapR := by
  rw [← LinearMap.ker_eq_bot]
  rw [Submodule.eq_bot_iff]
  intro D hD
  rw [LinearMap.mem_ker] at hD
  -- D : derivationQ, coordMapR D = 0
  have hDeriv : IsDerivQ D.val := D.property
  -- extract the 14 pivots from coordMapR D = 0
  have hcm : coordMap D.val = 0 := hD
  have h := fun i => congrFun hcm i
  have p1 : (D.val u1).re.im.re = 0 := by simpa using h 0
  have p2 : (D.val u1).re.im.im = 0 := by simpa using h 1
  have p3 : (D.val u1).im.re.re = 0 := by simpa using h 2
  have p4 : (D.val u1).im.re.im = 0 := by simpa using h 3
  have p5 : (D.val u1).im.im.re = 0 := by simpa using h 4
  have p6 : (D.val u1).im.im.im = 0 := by simpa using h 5
  have q3 : (D.val u2).re.im.im = 0 := by simpa using h 6
  have q4 : (D.val u2).im.re.re = 0 := by simpa using h 7
  have q5 : (D.val u2).im.re.im = 0 := by simpa using h 8
  have q6 : (D.val u2).im.im.re = 0 := by simpa using h 9
  have q7 : (D.val u2).im.im.im = 0 := by simpa using h 10
  have r5 : (D.val u4).im.re.im = 0 := by simpa using h 11
  have r6 : (D.val u4).im.im.re = 0 := by simpa using h 12
  have r7 : (D.val u4).im.im.im = 0 := by simpa using h 13
  obtain ⟨g1, g2, g4⟩ := gens_zero D.val hDeriv p1 p2 p3 p4 p5 p6 q3 q4 q5 q6 q7 r5 r6 r7
  have : D.val = 0 := determined D.val hDeriv g1 g2 g4
  exact Submodule.coe_eq_zero.mp this

/-- ★★ THE UPPER BOUND `finrank ℚ derivationQ ≤ 14`. -/
theorem finrank_derivationQ_le_14 : Module.finrank ℚ derivationQ ≤ 14 := by
  have h := LinearMap.finrank_le_finrank_of_injective (f := coordMapR) coordMapR_injective
  rwa [Module.finrank_fin_fun ℚ] at h

/-- ★★★ THE EXACT DIMENSION `finrank ℚ derivationQ = 14`. -/
theorem finrank_derivationQ_eq_14 : Module.finrank ℚ derivationQ = 14 :=
  le_antisymm finrank_derivationQ_le_14 finrank_derivationQ_ge_14

end Phys.Algebra.ScratchN20fin
