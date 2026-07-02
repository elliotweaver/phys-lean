import Phys.Algebra.TowerGatherForcedChargeDirection

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- the 6 coordinate orthogonalities packaged
theorem gForm_u1_e3O : gForm u1 e3O = 0 := by
  show reQ (u1 * star e3O) = 0
  simp only [reQ, u1, e3O, CD.mul_re, CD.star_re, CD.star_im, CD.add_re,
    CD.neg_re, CD.neg_im, Dbl.mul_re, Dbl.add_re, Dbl.star_re', Dbl.star_im',
    Dbl.neg_re, Dbl.neg_im]; norm_num
theorem gForm_u1_e4O : gForm u1 e4O = 0 := by
  show reQ (u1 * star e4O) = 0
  simp only [reQ, u1, e4O, CD.mul_re, CD.star_re, CD.star_im, CD.add_re,
    CD.neg_re, CD.neg_im, Dbl.mul_re, Dbl.add_re, Dbl.star_re', Dbl.star_im',
    Dbl.neg_re, Dbl.neg_im]; norm_num
theorem gForm_u1_e5O : gForm u1 e5O = 0 := by
  show reQ (u1 * star e5O) = 0
  simp only [reQ, u1, e5O, CD.mul_re, CD.star_re, CD.star_im, CD.add_re,
    CD.neg_re, CD.neg_im, Dbl.mul_re, Dbl.add_re, Dbl.star_re', Dbl.star_im',
    Dbl.neg_re, Dbl.neg_im]; norm_num
theorem gForm_u1_e6O : gForm u1 e6O = 0 := by
  show reQ (u1 * star e6O) = 0
  simp only [reQ, u1, e6O, CD.mul_re, CD.star_re, CD.star_im, CD.add_re,
    CD.neg_re, CD.neg_im, Dbl.mul_re, Dbl.add_re, Dbl.star_re', Dbl.star_im',
    Dbl.neg_re, Dbl.neg_im]; norm_num
theorem gForm_u1_e7O : gForm u1 e7O = 0 := by
  show reQ (u1 * star e7O) = 0
  simp only [reQ, u1, e7O, CD.mul_re, CD.star_re, CD.star_im, CD.add_re,
    CD.neg_re, CD.neg_im, Dbl.mul_re, Dbl.add_re, Dbl.star_re', Dbl.star_im',
    Dbl.neg_re, Dbl.neg_im]; norm_num

-- (2) u1 ⟂ V via span_induction over imgUnit generators + bilinearity
theorem gForm_u1_vanish_Vsub : ∀ v ∈ Vsub, gForm u1 v = 0 := by
  intro v hv
  rw [Vsub] at hv
  refine Submodule.span_induction (p := fun y _ => gForm u1 y = 0) ?_ ?_ ?_ ?_ hv
  · rintro _ ⟨i, rfl⟩
    fin_cases i
    · exact gForm_u1_u2
    · exact gForm_u1_e3O
    · exact gForm_u1_e4O
    · exact gForm_u1_e5O
    · exact gForm_u1_e6O
    · exact gForm_u1_e7O
  · show gForm u1 (0 : O ℚ) = 0
    simp only [gForm, star_zero, mul_zero, reQ, CD.zero_re, Dbl.zero_re]
  · intro a b _ _ ha hb; rw [gForm_add_right, ha, hb, add_zero]
  · intro r a _ ha; rw [gForm_smul_right, ha, mul_zero]

-- (3) ★ THE CRUX: crossOpO u1 = JO on Vsub
theorem crossOpO_u1_eq_JO_on_Vsub : ∀ v ∈ Vsub, crossOpO u1 v = JO v := by
  intro v hv
  show octCross u1 v = u1 * v
  unfold octCross
  rw [gForm_u1_vanish_Vsub v hv, zero_smul, add_zero]

-- (5) ★★ the map equalities. First Uhol.
theorem Uhol_map_crossOpO_eq_Uah : Uhol.map (crossOpO u1) = Uah := by
  apply le_antisymm
  · -- v ∈ Uhol → crossOpO u1 v = JO v ∈ Uah
    rintro _ ⟨v, hv, rfl⟩
    rw [crossOpO_u1_eq_JO_on_Vsub v (Uhol_le_Vsub hv)]
    exact Uhol_map_JO_le_Uah ⟨v, hv, rfl⟩
  · -- w ∈ Uah → v := -(JO w) ∈ Uhol, crossOpO u1 v = w
    intro w hw
    have hJw : JO w ∈ Uhol := Uah_map_JO_le_Uhol ⟨w, hw, rfl⟩
    have hv : -(JO w) ∈ Uhol := Submodule.neg_mem _ hJw
    refine ⟨-(JO w), hv, ?_⟩
    rw [crossOpO_u1_eq_JO_on_Vsub _ (Uhol_le_Vsub hv)]
    show JO (-(JO w)) = w
    rw [map_neg]
    have : JO (JO w) = -w := by
      have := JO_sq
      have h2 : (JO.comp JO) w = (-LinearMap.id : O ℚ →ₗ[ℚ] O ℚ) w := by rw [this]
      simpa using h2
    rw [this, neg_neg]

theorem Uah_map_crossOpO_eq_Uhol : Uah.map (crossOpO u1) = Uhol := by
  apply le_antisymm
  · rintro _ ⟨v, hv, rfl⟩
    rw [crossOpO_u1_eq_JO_on_Vsub v (Uah_le_Vsub hv)]
    exact Uah_map_JO_le_Uhol ⟨v, hv, rfl⟩
  · intro w hw
    have hJw : JO w ∈ Uah := Uhol_map_JO_le_Uah ⟨w, hw, rfl⟩
    have hv : -(JO w) ∈ Uah := Submodule.neg_mem _ hJw
    refine ⟨-(JO w), hv, ?_⟩
    rw [crossOpO_u1_eq_JO_on_Vsub _ (Uah_le_Vsub hv)]
    show JO (-(JO w)) = w
    rw [map_neg]
    have : JO (JO w) = -w := by
      have h2 : (JO.comp JO) w = (-LinearMap.id : O ℚ →ₗ[ℚ] O ℚ) w := by rw [JO_sq]
      simpa using h2
    rw [this, neg_neg]

end

end Phys.Algebra
