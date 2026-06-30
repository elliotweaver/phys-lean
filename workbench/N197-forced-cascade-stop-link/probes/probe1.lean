import Phys.Algebra.DerivationStabilizerSplit
import Phys.Algebra.DerivationRep7SU2TBranching
import Phys.Algebra.DerivationRep7FullBranching
import Mathlib.Tactic

open Phys.Cascade
namespace Phys.Algebra

-- u1 = iotaO hI  (the colour complex unit IS the embedded isospin Cartan generator).
theorem u1_eq_iotaO_hI : u1 = iotaO hI := by
  show (u1 : O ℚ) = ⟨hI, 0⟩; ext <;> simp [u1, hI, CD.iota, Dbl.J]

-- STEP 1 (additive commutator — O ℚ has no Sub): for imaginary q,
--   innerDeriv q (JO z) = (innerDeriv q u1) * z + JO (innerDeriv q z).
theorem commutator_innerDeriv_JO (q : H ℚ) (hq : star q = -q) (z : O ℚ) :
    (innerDeriv q) (JO z) = (innerDeriv q) u1 * z + JO ((innerDeriv q) z) := by
  have hd : (innerDeriv q) (u1 * z) = (innerDeriv q) u1 * z + u1 * (innerDeriv q) z :=
    innerDeriv_isDeriv q hq u1 z
  simpa only [JO_apply] using hd

-- STEP 2: innerDeriv q u1 = iotaO (adHom q hI).
theorem innerDeriv_u1 (q : H ℚ) : (innerDeriv q) u1 = iotaO (adHom q hI) := by
  rw [u1_eq_iotaO_hI, innerDeriv_iotaO]

-- STEP 3a: hI commutes — innerDeriv hI u1 = 0 (colour structure preserved by the Cartan).
theorem innerDeriv_hI_u1 : (innerDeriv hI) u1 = 0 := by
  rw [innerDeriv_u1, adHom_apply, sub_self]
  ext <;> simp [iotaO]

-- STEP 3b: hJ does NOT commute — innerDeriv hJ u1 = iotaO(-2•hK) (colour⊗isospin entangled).
theorem innerDeriv_hJ_u1 : (innerDeriv hJ) u1 = iotaO (-(2:ℚ) • hK) := by
  rw [innerDeriv_u1, adHom_apply, hJ_hI]
  congr 1
  show -hK - hI * hJ = -(2:ℚ) • hK
  rw [show hI * hJ = hK from rfl]; module

-- STEP 3c: the entanglement witness is genuinely nonzero (W8).
theorem hK_ne_zero : hK ≠ (0 : H ℚ) := by
  intro h; have : (1:ℚ) = 0 := by
    have := congrArg (fun w : H ℚ => w.im.im) h
    simpa [hK, hI, hJ, CD.iota, CD.e2, Dbl.J, CD.mul_im] using this
  exact one_ne_zero this

end Phys.Algebra
