import Phys.Algebra.SpacetimeReduction
import Mathlib.Tactic

namespace Phys.Algebra.ProbeO5c

open Phys.Cascade Phys.Cascade.CD Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

def boost4 (a b : ℚ) : STV4 →ₗ[ℚ] STV4 where
  toFun p := (a * p.1 + b * p.2.1, b * p.1 + a * p.2.1, p.2.2)
  map_add' p q := by simp only [Prod.fst_add, Prod.snd_add]; ext <;> simp <;> ring
  map_smul' c p := by
    simp only [Prod.smul_fst, Prod.smul_snd, smul_eq_mul, RingHom.id_apply]; ext <;> simp <;> ring

/-- THE POLARIZATION / bilinear form of the (1,3) arena: `B4 P R = P.t·R.t − x-x − Born-overlap`.
    The symmetric bilinear form whose diagonal is the reduced form Q4v. This is the pairing that
    makes energy-momentum the charge conjugate to translations. -/
def B4 (P R : STV4) : ℚ :=
  P.1 * R.1 - P.2.1 * R.2.1 - (P.2.2.re * R.2.2.re + P.2.2.im * R.2.2.im)

def bornMomentum (P : STV4) : ℚ := gForm (cToO P.2.2) (cToO P.2.2) + P.2.1 ^ 2
def massSq (P : STV4) : ℚ := P.1 ^ 2 - bornMomentum P

/-- The bilinear form is symmetric. -/
theorem B4_symm (P R : STV4) : B4 P R = B4 R P := by unfold B4; ring

/-- The diagonal of the bilinear form IS the reduced (1,3) form. -/
theorem B4_diag (P : STV4) : B4 P P = Q4v P := by
  unfold B4 Q4v Q4; ring

/-- The diagonal of the bilinear form IS the invariant mass-square. -/
theorem B4_diag_massSq (P : STV4) : B4 P P = massSq P := by
  unfold B4 massSq bornMomentum
  rw [gForm_cToO]; ring

/-- ★ THE PAIRING IS BOOST-INVARIANT IN BOTH SLOTS (the invariant Casimir structure): the
    Lorentz-invariant contraction of energy-momentum with any four-vector. -/
theorem B4_boost_invariant {a b : ℚ} (h : a^2 - b^2 = 1) (P R : STV4) :
    B4 (boost4 a b P) (boost4 a b R) = B4 P R := by
  obtain ⟨pt, px, pd⟩ := P
  obtain ⟨rt, rx, rd⟩ := R
  simp only [B4, boost4, LinearMap.coe_mk, AddHom.coe_mk]
  linear_combination (pt * rt - px * rx) * h

/-- The energy is the charge conjugate to time-translation: `B4 P (1,0,0) = E`. -/
theorem B4_energy (P : STV4) : B4 P ((1 : ℚ), (0 : ℚ), (0 : Dbl ℚ)) = P.1 := by
  unfold B4; simp [Dbl.zero_re, Dbl.zero_im]

/-- The x-momentum is the charge conjugate to x-translation: `B4 P (0,1,0) = −pₓ`. -/
theorem B4_momentum_x (P : STV4) : B4 P ((0 : ℚ), (1 : ℚ), (0 : Dbl ℚ)) = -P.2.1 := by
  unfold B4; simp [Dbl.zero_re, Dbl.zero_im]

end
end Phys.Algebra.ProbeO5c
