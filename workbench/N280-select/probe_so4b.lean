import Phys.Algebra.TowerWorldMapWeakDoubletLeftRegular
import Phys.Algebra.TowerWorldMapChirality

open scoped Classical BigOperators
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
set_option synthInstance.maxHeartbeats 400000
noncomputable section

noncomputable def rregI : Module.End ℚ (O ℚ) := rightReg u1M
noncomputable def rregJ : Module.End ℚ (O ℚ) := rightReg e2I
noncomputable def rregK : Module.End ℚ (O ℚ) := rightReg e3I
@[simp] theorem rregI_apply (y : O ℚ) : rregI y = y * u1 := rfl
@[simp] theorem rregJ_apply (y : O ℚ) : rregJ y = y * e2O := rfl
@[simp] theorem rregK_apply (y : O ℚ) : rregK y = y * e3O := rfl

theorem gForm_u1M' : gForm (u1M : O ℚ) (u1M : O ℚ) = 1 := gForm_u1
theorem gForm_e2I' : gForm (e2I : O ℚ) (e2I : O ℚ) = 1 := gForm_u2_u2
theorem gForm_e3I' : gForm (e3I : O ℚ) (e3I : O ℚ) = 1 := by
  show gForm e3O e3O = 1; simp only [gForm, e3O, reQ]; norm_num

/-- PROBE 4: the RIGHT doublet Casimir = -3•id (mirror of N279's left, via banked N264 rightReg_sq). -/
theorem rightReg_casimir_eq_neg_three :
    rregI.comp rregI + rregJ.comp rregJ + rregK.comp rregK = (-3 : ℚ) • LinearMap.id := by
  show (rightReg u1M).comp (rightReg u1M) + (rightReg e2I).comp (rightReg e2I)
      + (rightReg e3I).comp (rightReg e3I) = (-3 : ℚ) • LinearMap.id
  rw [rightReg_sq u1M, rightReg_sq e2I, rightReg_sq e3I, gForm_u1M', gForm_e2I', gForm_e3I']
  module

/-- PROBE 5: the mixed commutator on the full spinor O ℚ IS the associator (banked N264). -/
theorem leftRight_mixed_eq_assoc (y : O ℚ) :
    leftReg u1M ((rightReg e2I) y) - (rightReg e2I) (leftReg u1M y)
      = (u1M : O ℚ) * (y * e2I) - ((u1M : O ℚ) * y) * e2I := by
  simp only [leftReg_apply, rightReg_apply]

/-- PROBE 6: the so(4) does NOT extend to the full non-associative O ℚ (N264 chir_spinor_block). -/
theorem so4_breaks_on_O :
    ¬ ∀ a b : ImO, (leftReg a).comp (rightReg b) = (rightReg b).comp (leftReg a) :=
  chir_spinor_block

theorem rightmul_comm_obstruction (a b y : O ℚ) :
    (y * b) * a - (y * a) * b - y * (b * a - a * b) = (-2 : ℚ) • assoc y a b := by
  have h : assoc y b a = - assoc y a b := eq_neg_of_add_eq_zero_right (assoc_swap23 y a b)
  have key : (y * b) * a - (y * a) * b - y * (b * a - a * b) = assoc y b a - assoc y a b := by
    simp only [assoc, mul_sub]; abel
  rw [key, h]; module

/-- PROBE 7: the RIGHT su(2) also FAILS to close on O by -2•associator — BOTH hands confine to H. -/
theorem rightReg_defect_eq_associator (y : O ℚ) :
    rregI (rregJ y) - rregJ (rregI y) - (-2 : ℚ) • rregK y = (-2 : ℚ) • assoc y u1 e2O := by
  simp only [rregI_apply, rregJ_apply, rregK_apply]
  have hcomm : e2O * u1 - u1 * e2O = (-2 : ℚ) • e3O := by
    have h1 : u1 * e2O = e3O := by rw [← JO_apply]; exact JO_e2
    have h2 : e2O * u1 = -e3O := by
      rw [u1_iotaO, e2O_iotaO,
          show (iotaO hJ * iotaO hI) = iotaO (hJ * hI) from (CD.iota_mul hJ hI).symm, hJ_hI,
          map_neg, ← e3O_iotaO]
    rw [h1, h2]; module
  have hob := rightmul_comm_obstruction u1 e2O y
  rw [hcomm, qsmul_mul_right] at hob
  exact hob

end
end Phys.Algebra
