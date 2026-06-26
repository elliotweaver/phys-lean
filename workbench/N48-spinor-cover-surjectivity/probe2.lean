import Phys.Algebra.SpinorRotation

namespace N48Probe

open Phys.Cascade Phys.Cascade.CD Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

def Hmap (q : STV) : Matrix (Fin 2) (Fin 2) (O ℚ) := herm2 q.1 q.2.1 q.2.2

def boostParam (p : ℚ) : ℚ × ℚ := ((p^2 + p⁻¹^2)/2, (p^2 - p⁻¹^2)/2)

theorem boostParam_hyperbola (p : ℚ) (hp : p ≠ 0) :
    (boostParam p).1 ^ 2 - (boostParam p).2 ^ 2 = 1 := by
  simp only [boostParam]
  have hpp : p^2 * p⁻¹^2 = 1 := by rw [← mul_pow, mul_inv_cancel₀ hp, one_pow]
  nlinarith [hpp]

theorem actBy_rotMat_Hmap (u : O ℚ) (hu : gForm u u = 1) (q : STV) :
    actBy (rotMat u) (Hmap q) = Hmap (rot u q) := by
  obtain ⟨t, x, v⟩ := q
  show actBy (rotMat u) (herm2 t x v) = herm2 _ _ _
  rw [act_herm2_rot u hu t x v]
  rfl

theorem actBy_boostMat_Hmap (p : ℚ) (hp : p ≠ 0) (q : STV) :
    actBy (boostMat p) (Hmap q) = Hmap (boost (boostParam p).1 (boostParam p).2 q) := by
  obtain ⟨t, x, v⟩ := q
  show actBy (boostMat p) (herm2 t x v)
      = herm2 ((boostParam p).1 * t + (boostParam p).2 * x)
              ((boostParam p).2 * t + (boostParam p).1 * x) v
  rw [act_herm2 p t x hp v]
  have e1 : (boostParam p).1 * t + (boostParam p).2 * x
      = (p^2*(t+x) + p⁻¹^2*(t-x))/2 := by simp only [boostParam]; ring
  have e2 : (boostParam p).2 * t + (boostParam p).1 * x
      = (p^2*(t+x) - p⁻¹^2*(t-x))/2 := by simp only [boostParam]; ring
  rw [e1, e2]

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
  rw [hc, Submonoid.mem_bot, Module.End.one_eq_id] at hmem
  exact boost_ne_id (b := 3/4) (by norm_num) hmem

-- A composite is in the cover (boost ∘ rotation), and preserves Qv (via le_qvIsom)
theorem comp_mem_cover {a b : ℚ} (h : a^2 - b^2 = 1) {u : O ℚ} (hu : gForm u u = 1) :
    (boost a b) * (rot u) ∈ spinorCoverMonoid :=
  mul_mem (boost_mem_cover h) (rot_mem_cover hu)

theorem cover_isom {T : Module.End ℚ STV} (hT : T ∈ spinorCoverMonoid) : IsQvIsom T :=
  spinorCoverMonoid_le_qvIsom hT

#print axioms boostParam_hyperbola
#print axioms actBy_rotMat_Hmap
#print axioms actBy_boostMat_Hmap
#print axioms spinorCoverMonoid_le_qvIsom
#print axioms spinorCoverMonoid_ne_bot
#print axioms comp_mem_cover
#print axioms cover_isom

end

end N48Probe
