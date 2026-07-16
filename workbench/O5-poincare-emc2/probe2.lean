import Phys.Algebra.SpacetimeReduction
import Mathlib.Tactic

namespace Phys.Algebra.ProbeO5b

open Phys.Cascade Phys.Cascade.CD Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- redo minimal boost/isom locally
def IsQ4Isom (T : STV4 →ₗ[ℚ] STV4) : Prop := ∀ p : STV4, Q4v (T p) = Q4v p

def boost4 (a b : ℚ) : STV4 →ₗ[ℚ] STV4 where
  toFun p := (a * p.1 + b * p.2.1, b * p.1 + a * p.2.1, p.2.2)
  map_add' p q := by simp only [Prod.fst_add, Prod.snd_add]; ext <;> simp <;> ring
  map_smul' c p := by
    simp only [Prod.smul_fst, Prod.smul_snd, smul_eq_mul, RingHom.id_apply]; ext <;> simp <;> ring

theorem boost4_isom {a b : ℚ} (h : a^2 - b^2 = 1) : IsQ4Isom (boost4 a b) := by
  intro p; obtain ⟨t, x, d⟩ := p
  show Q4 _ _ _ = Q4 _ _ _
  unfold boost4 Q4; simp only [LinearMap.coe_mk, AddHom.coe_mk]
  linear_combination (t^2 - x^2) * h

/-! ## Poincaré = Lorentz ⋉ translations (the affine transformation + semidirect law). -/

def poincare4 (T : STV4 →ₗ[ℚ] STV4) (a : STV4) : STV4 → STV4 := fun p => T p + a

def interval4 (p q : STV4) : ℚ := Q4v (p - q)

/-- THE SEMIDIRECT PRODUCT LAW: composition of two Poincaré transformations is a Poincaré
    transformation with the Lorentz parts composed and the translation twisted by the outer
    Lorentz map — `(T₁,a₁)(T₂,a₂) = (T₁T₂, a₁ + T₁ a₂)`. This IS Lorentz ⋉ translations. -/
theorem poincare4_comp (T₁ T₂ : STV4 →ₗ[ℚ] STV4) (a₁ a₂ : STV4) :
    poincare4 T₁ a₁ ∘ poincare4 T₂ a₂ = poincare4 (T₁.comp T₂) (a₁ + T₁ a₂) := by
  funext p
  simp only [poincare4, Function.comp_apply, LinearMap.comp_apply, map_add]
  abel

/-- The Lorentz–translation covariance: `T ∘ transl(a) = transl(T a) ∘ T`. -/
theorem poincare4_covariance (T : STV4 →ₗ[ℚ] STV4) (a : STV4) :
    (fun p => T (p + a)) = (fun p => T p + T a) := by
  funext p; rw [map_add]

/-- POINCARÉ PRESERVES THE INTERVAL when the Lorentz part is an isometry. -/
theorem poincare4_preserves_interval {T : STV4 →ₗ[ℚ] STV4} (hT : IsQ4Isom T) (a p q : STV4) :
    interval4 (poincare4 T a p) (poincare4 T a q) = interval4 p q := by
  unfold interval4 poincare4
  have : T p + a - (T q + a) = T (p - q) := by rw [map_sub]; abel
  rw [this, hT (p - q)]

/-! ## Energy-momentum four-vector + the Born self-overlap of the spatial momentum. -/

/-- THE BORN SELF-OVERLAP OF THE SPATIAL MOMENTUM: `gForm(cToO d) + x²`, using the banked Born
    self-overlap `gForm` on the ℂ rung. -/
def bornMomentum (P : STV4) : ℚ := gForm (cToO P.2.2) (cToO P.2.2) + P.2.1 ^ 2

/-- THE INVARIANT MASS-SQUARE = the Minkowski norm of the energy-momentum four-vector
    = TIME-square minus the Born self-overlap of the spatial momentum. -/
def massSq (P : STV4) : ℚ := P.1 ^ 2 - bornMomentum P

/-- massSq IS the banked (1,3) form of the energy-momentum vector. -/
theorem massSq_eq_Q4v (P : STV4) : massSq P = Q4v P := by
  unfold massSq bornMomentum Q4v Q4
  rw [gForm_cToO]; ring

/-- ★ THE MASS IS BOOST-INVARIANT (the conserved invariant): the Minkowski norm of the
    energy-momentum four-vector is unchanged by a boost — mass is a Lorentz invariant. -/
theorem massSq_boost_invariant {a b : ℚ} (h : a^2 - b^2 = 1) (P : STV4) :
    massSq (boost4 a b P) = massSq P := by
  rw [massSq_eq_Q4v, massSq_eq_Q4v, boost4_isom h P]

/-- ★ THE MASS-SHELL SPLIT: `E² = m² + |p|²` — energy-square = invariant mass-square PLUS the
    Born self-overlap of the spatial momentum. -/
theorem energy_sq_split (P : STV4) : P.1 ^ 2 = massSq P + bornMomentum P := by
  unfold massSq; ring

/-- ★★★ E = mc² (the invariant-norm identity, at rest). In the rest frame (zero spatial
    momentum) the invariant mass-square EQUALS the energy-square: `m² = E²`. The rest energy IS
    the rest mass (c² = 1, the derived unit slope). -/
theorem emc2_rest {P : STV4} (hx : P.2.1 = 0) (hd : P.2.2 = 0) : massSq P = P.1 ^ 2 := by
  unfold massSq bornMomentum
  rw [hx, hd, gForm_cToO]
  simp

/-- ★ c² = 1, THE DERIVED UNIT SLOPE. The null cone of the reduced form in the time–space plane
    is `t = ±x` — the two null rays of unit slope. The invariant speed (light-cone slope) is 1,
    forced by the EQUAL unit coefficients of the banked Born-determinant form (time² and space²
    both carry coefficient 1). -/
theorem null_cone_unit_slope (t x : ℚ) : Q4 t x 0 = 0 ↔ (t - x) * (t + x) = 0 := by
  unfold Q4
  constructor
  · intro h; simp only [Dbl.zero_re, Dbl.zero_im] at h; ring_nf; ring_nf at h; linarith
  · intro h; simp only [Dbl.zero_re, Dbl.zero_im]; ring_nf; ring_nf at h; linarith

end
end Phys.Algebra.ProbeO5b
