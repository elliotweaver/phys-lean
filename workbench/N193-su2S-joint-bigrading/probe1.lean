import Phys.Algebra.DerivationRep7SU2TBranching
import Phys.Algebra.DerivationRep7FullBranching
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD Module

attribute [local instance] CD.narCD CD.srCD

noncomputable section

section General
variable {B : Type*} [CommRing B] [StarRing B]

-- A. su(2)_S acts on the OLD line by the ADJOINT
theorem secondSU2_iotaO (P a : H ℚ) :
    secondSU2 P (iotaO a) = iotaO (adHom P a) := by
  show (innerDeriv P - leftImDeriv P) (iotaO a) = iotaO (adHom P a)
  rw [LinearMap.sub_apply, innerDeriv_iotaO, leftImDeriv_iotaO, sub_zero]

-- B. su(2)_S acts on the NEW plane by RIGHT-mult
theorem secondSU2_kappaO (P b : H ℚ) :
    secondSU2 P (kappaO b) = kappaO (-(b * P)) := by
  show (innerDeriv P - leftImDeriv P) (kappaO b) = kappaO (-(b * P))
  rw [LinearMap.sub_apply, innerDeriv_kappaO_full, leftImDeriv_kappaO, ← map_sub]
  congr 1
  rw [adHom_apply]; ring

end General

-- C. su(2)_S preserves ιO(ImH)
theorem secondSU2_invariant_iotaImH {P : H ℚ} (hP : star P = -P) :
    ∀ x ∈ Submodule.map iotaO ImH, secondSU2 P x ∈ Submodule.map iotaO ImH := by
  rintro _ ⟨a, ha, rfl⟩
  rw [SetLike.mem_coe] at ha
  rw [secondSU2_iotaO]
  exact Submodule.mem_map_of_mem (adHom_mem_ImH hP ha)

-- D. su(2)_S preserves κO(⊤)
theorem secondSU2_invariant_kappaTop (P : H ℚ) :
    ∀ x ∈ Submodule.map kappaO (⊤ : Submodule ℚ (H ℚ)),
      secondSU2 P x ∈ Submodule.map kappaO (⊤ : Submodule ℚ (H ℚ)) := by
  rintro _ ⟨b, _, rfl⟩
  rw [secondSU2_kappaO]
  exact Submodule.mem_map_of_mem trivial

-- F. THE PUNCHLINE: the two so(4) factors act as exact negatives on the diagonal singlet
theorem secondSU2_singlet_eq_neg_leftImDeriv :
    secondSU2 (hI : H ℚ) (kappaO 1) = - leftImDeriv (hI : H ℚ) (kappaO 1) := by
  rw [secondSU2_kappaO, leftImDeriv_kappaO, ← map_neg]
  congr 1
  rw [one_mul, mul_one]

-- G2. COSTUME witness coordinate = -1
theorem secondSU2_singlet_coord :
    (secondSU2 (hI : H ℚ) (kappaO 1)).im.re.im = -1 := by
  rw [secondSU2_kappaO]
  simp [kappaO, hI, CD.iota, Dbl.J]

-- G1. W8: su(2)_S moves the singlet
theorem secondSU2_moves_singlet : secondSU2 (hI : H ℚ) (kappaO 1) ≠ 0 := by
  intro h
  have hc : (secondSU2 (hI : H ℚ) (kappaO 1)).im.re.im = (-1 : ℚ) := secondSU2_singlet_coord
  rw [h] at hc; simp at hc

-- G3. W8: (3,1) nontrivial under su(2)_S
theorem secondSU2_acts_on_iotaImH_ne_zero : secondSU2 (hI : H ℚ) (iotaO hJ) ≠ 0 := by
  rw [secondSU2_iotaO]
  intro h
  have hadj : adHom (hI : H ℚ) hJ = 0 := by
    have := congrArg CD.re h; simpa [iotaO] using this
  rw [adHom_apply, hI_hJ, hJ_hI, sub_neg_eq_add, hK_def] at hadj
  have hc := congrArg (fun z : H ℚ => z.im.im) hadj
  simp [Dbl.J, CD.add_im, Dbl.add_im] at hc

#print axioms secondSU2_iotaO
#print axioms secondSU2_kappaO
#print axioms secondSU2_invariant_iotaImH
#print axioms secondSU2_invariant_kappaTop
#print axioms secondSU2_singlet_eq_neg_leftImDeriv
#print axioms secondSU2_singlet_coord
#print axioms secondSU2_moves_singlet
#print axioms secondSU2_acts_on_iotaImH_ne_zero

end

end Phys.Algebra
