import Phys.Algebra.DerivationRep7SU2TBranching
import Phys.Algebra.DerivationRep7IrreducibleBimodule
import Phys.Algebra.DerivationRep7IrreducibleAdjoint
import Mathlib.Tactic

namespace Phys.Algebra.N196Probe

open Phys.Cascade Phys.Cascade.CD Module
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD

/-- hI squares to -1 (coordinate). -/
theorem hI_mul_hI : (hI : H ℚ) * hI = -1 := by
  ext <;> simp [hI, CD.iota, Dbl.J]

/-- Left multiplication by hI is injective: hI*b = 0 → b = 0 (H is associative + hI²=-1). -/
theorem left_mul_hI_eq_zero {b : H ℚ} (h : (hI : H ℚ) * b = 0) : b = 0 := by
  have : (-hI : H ℚ) * (hI * b) = b := by
    rw [← mul_assoc]
    have : (-hI : H ℚ) * hI = 1 := by rw [neg_mul, hI_mul_hI, neg_neg]
    rw [this, one_mul]
  rw [h, mul_zero] at this
  exact this.symm

/-- Left multiplication by hI is surjective: every c = hI*b for b = -hI*c. -/
theorem left_mul_hI_surjective (c : H ℚ) : (hI : H ℚ) * ((-hI) * c) = c := by
  rw [← mul_assoc]
  have : (hI : H ℚ) * (-hI) = 1 := by rw [mul_neg, hI_mul_hI, neg_neg]
  rw [this, one_mul]

/-- ★★ THE (2,2) HAS NO NONZERO su(2)_T-FIXED VECTOR: a kappaO b annihilated by every imaginary
    leftImDeriv is zero (left-regular H-module is fixed-point-free under imaginary left-mult,
    BECAUSE H is a division algebra — L_hI injective). -/
theorem kappaTop_no_su2T_fixed (b : H ℚ)
    (hfix : ∀ (Q : H ℚ), star Q = -Q → leftImDeriv Q (kappaO b) = 0) :
    kappaO b = 0 := by
  have hImem : star (hI : H ℚ) = -hI := by rw [hI]; ext <;> simp [CD.iota, Dbl.J]
  have := hfix hI hImem
  rw [leftImDeriv_kappaO] at this
  have hb : (hI : H ℚ) * b = 0 := kappaO_injective (by rw [this, map_zero])
  rw [left_mul_hI_eq_zero hb, map_zero]

/-- ★★ DIRECTION A: any su(2)_T-equivariant f mapping the (3,1)=iotaO image into the (2,2)=kappaO
    image vanishes on the (3,1). f(iotaO a) is su(2)_T-fixed (source trivial) and lands in (2,2),
    which has no nonzero fixed vector. -/
theorem hom_iotaImH_to_kappaTop_eq_zero (f : O ℚ →ₗ[ℚ] O ℚ)
    (hf : ∀ (Q : H ℚ), star Q = -Q → ∀ x, f (leftImDeriv Q x) = leftImDeriv Q (f x))
    (hmaps : ∀ a : H ℚ, ∃ b : H ℚ, f (iotaO a) = kappaO b) (a : H ℚ) :
    f (iotaO a) = 0 := by
  obtain ⟨b, hb⟩ := hmaps a
  rw [hb]
  apply kappaTop_no_su2T_fixed
  intro Q hQ
  rw [← hb, ← hf Q hQ, leftImDeriv_iotaO, map_zero]

/-- ★★ DIRECTION B: any su(2)_T-equivariant f mapping the (2,2)=kappaO image into the (3,1)=iotaO
    image vanishes on the (2,2). leftImDeriv annihilates the (3,1), so f(kappaO(Q·b))=0; with
    Q=hI and L_hI surjective, f(kappaO c)=0 for all c. -/
theorem hom_kappaTop_to_iotaImH_eq_zero (f : O ℚ →ₗ[ℚ] O ℚ)
    (hf : ∀ (Q : H ℚ), star Q = -Q → ∀ x, f (leftImDeriv Q x) = leftImDeriv Q (f x))
    (hmaps : ∀ b : H ℚ, ∃ a : H ℚ, f (kappaO b) = iotaO a) (c : H ℚ) :
    f (kappaO c) = 0 := by
  have hImem : star (hI : H ℚ) = -hI := by rw [hI]; ext <;> simp [CD.iota, Dbl.J]
  -- f(kappaO(hI·b)) = 0 for all b
  have key : ∀ b : H ℚ, f (kappaO ((hI : H ℚ) * b)) = 0 := by
    intro b
    have h1 : f (leftImDeriv hI (kappaO b)) = leftImDeriv hI (f (kappaO b)) := hf hI hImem _
    rw [leftImDeriv_kappaO] at h1
    -- f(kappaO b) = iotaO a, leftImDeriv hI annihilates it
    obtain ⟨a, ha⟩ := hmaps b
    rw [ha, leftImDeriv_iotaO] at h1
    exact h1
  -- c = hI * (-hI * c)
  have := key ((-hI) * c)
  rwa [left_mul_hI_surjective] at this

/-- W8 non-vacuity: the (2,2) singlet line element kappaO 1 is NOT su(2)_T-fixed
    (leftImDeriv hI (kappaO 1) = kappaO hI ≠ 0) — the fixed-point-free dichotomy has teeth. -/
theorem kappaO_one_not_su2T_fixed :
    ¬ (∀ (Q : H ℚ), star Q = -Q → leftImDeriv Q (kappaO (1 : H ℚ)) = 0) := by
  intro h
  have hImem : star (hI : H ℚ) = -hI := by rw [hI]; ext <;> simp [CD.iota, Dbl.J]
  have := h hI hImem
  rw [leftImDeriv_kappaO, mul_one] at this
  have hI0 : (hI : H ℚ) = 0 := kappaO_injective (by rw [this, map_zero])
  have h := congrArg (fun z : H ℚ => z.re.im) hI0
  simp [hI, CD.iota, Dbl.J] at h

/-- W8 witness coordinate: leftImDeriv hI (kappaO 1) = kappaO hI has nonzero deep coord = 1. -/
theorem w8_coord : (leftImDeriv (hI : H ℚ) (kappaO 1)).im.re.im = 1 := by
  rw [leftImDeriv_kappaO, mul_one]
  simp [kappaO, hI, CD.iota, Dbl.J]

#print axioms hI_mul_hI
#print axioms left_mul_hI_eq_zero
#print axioms left_mul_hI_surjective
#print axioms kappaTop_no_su2T_fixed
#print axioms hom_iotaImH_to_kappaTop_eq_zero
#print axioms hom_kappaTop_to_iotaImH_eq_zero
#print axioms kappaO_one_not_su2T_fixed
#print axioms w8_coord

end Phys.Algebra.N196Probe
