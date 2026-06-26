import Phys.Algebra.SpinorRotation

namespace N48Probe

open Phys.Cascade Phys.Cascade.CD Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-- The coordinatization (t,x,v) ↦ herm2 t x v. -/
def Hmap (q : STV) : Matrix (Fin 2) (Fin 2) (O ℚ) := herm2 q.1 q.2.1 q.2.2

/-- The boost parameters realized by the matrix boost generator `boostMat p`. -/
def boostParam (p : ℚ) : ℚ × ℚ := ((p^2 + p⁻¹^2)/2, (p^2 - p⁻¹^2)/2)

theorem boostParam_hyperbola (p : ℚ) (hp : p ≠ 0) :
    (boostParam p).1 ^ 2 - (boostParam p).2 ^ 2 = 1 := by
  simp only [boostParam]
  have hpp : p^2 * p⁻¹^2 = 1 := by rw [← mul_pow, mul_inv_cancel₀ hp, one_pow]
  nlinarith [hpp]

-- EQUIVARIANCE for rotation: actBy (rotMat u) ∘ Hmap = Hmap ∘ (rot u)
theorem actBy_rotMat_Hmap (u : O ℚ) (hu : gForm u u = 1) (q : STV) :
    actBy (rotMat u) (Hmap q) = Hmap (rot u q) := by
  obtain ⟨t, x, v⟩ := q
  show actBy (rotMat u) (herm2 t x v) = herm2 _ _ _
  rw [act_herm2_rot u hu t x v]
  rfl

-- EQUIVARIANCE for boost
theorem actBy_boostMat_Hmap (p : ℚ) (hp : p ≠ 0) (q : STV) :
    actBy (boostMat p) (Hmap q) = Hmap (boost (boostParam p).1 (boostParam p).2 q) := by
  obtain ⟨t, x, v⟩ := q
  show actBy (boostMat p) (herm2 t x v) = herm2 _ _ _
  rw [act_herm2 p t x hp v]
  have e1 : (boostParam p).1 * t + (boostParam p).2 * x
      = (p^2*(t+x) + p⁻¹^2*(t-x))/2 := by simp only [boostParam]; ring
  have e2 : (boostParam p).2 * t + (boostParam p).1 * x
      = (p^2*(t+x) - p⁻¹^2*(t-x))/2 := by simp only [boostParam]; ring
  show herm2 _ _ v = herm2 _ _ v
  rw [e1, e2]

-- THE COVER GROUP (lives on the associative abstract side)
def coverGens : Set (Module.End ℚ STV) :=
  {T | ∃ a b : ℚ, a^2 - b^2 = 1 ∧ T = boost a b} ∪ {T | ∃ u : O ℚ, gForm u u = 1 ∧ T = rot u}

def spinorCoverMonoid : Submonoid (Module.End ℚ STV) := Submonoid.closure coverGens

theorem coverGens_subset_isom : coverGens ⊆ qvIsomMonoid := by
  rintro T (⟨a, b, h, rfl⟩ | ⟨u, hu, rfl⟩)
  · exact boost_mem h
  · exact rot_mem hu

theorem spinorCoverMonoid_le_qvIsom : spinorCoverMonoid ≤ qvIsomMonoid :=
  Submonoid.closure_le.mpr coverGens_subset_isom

theorem boost_mem_cover {a b : ℚ} (h : a^2 - b^2 = 1) : boost a b ∈ spinorCoverMonoid :=
  Submonoid.subset_closure (Or.inl ⟨a, b, h, rfl⟩)

theorem rot_mem_cover {u : O ℚ} (hu : gForm u u = 1) : rot u ∈ spinorCoverMonoid :=
  Submonoid.subset_closure (Or.inr ⟨u, hu, rfl⟩)

theorem spinorCoverMonoid_ne_bot : spinorCoverMonoid ≠ ⊥ := by
  intro hc
  have hmem : boost (5/4) (3/4) ∈ spinorCoverMonoid := boost_mem_cover (by norm_num)
  rw [hc, Submonoid.mem_bot] at hmem
  have : boost (5/4 : ℚ) (3/4) ≠ LinearMap.id := boost_ne_id (by norm_num)
  rw [LinearMap.one_eq_id] at hmem
  exact this hmem

#print axioms boostParam_hyperbola
#print axioms actBy_rotMat_Hmap
#print axioms actBy_boostMat_Hmap
#print axioms spinorCoverMonoid_le_qvIsom
#print axioms spinorCoverMonoid_ne_bot

end

end N48Probe
