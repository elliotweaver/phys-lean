import Phys.Algebra.TowerWorldMapWeakDoubletLeftRegular
import Phys.Algebra.TowerWorldMapChirality

open scoped Classical BigOperators
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
set_option synthInstance.maxHeartbeats 400000
noncomputable section

-- The RIGHT-regular operators of the three H-imaginary units (mirror of N279's lregI/J/K).
noncomputable def rregI : Module.End ℚ (O ℚ) := rightReg u1M
noncomputable def rregJ : Module.End ℚ (O ℚ) := rightReg e2I
noncomputable def rregK : Module.End ℚ (O ℚ) := rightReg e3I

@[simp] theorem rregI_apply (y : O ℚ) : rregI y = y * u1 := rfl
@[simp] theorem rregJ_apply (y : O ℚ) : rregJ y = y * e2O := rfl
@[simp] theorem rregK_apply (y : O ℚ) : rregK y = y * e3O := rfl

/-- PROBE 1: the RIGHT-regular commutator obstruction (mirror of `leftmul_comm_obstruction`,
    using `assoc_swap23` instead of `assoc_swap12`):
      (y*b)*a - (y*a)*b - y*(b*a - a*b) = -2 • assoc y a b.
    NOTE the argument order in the associator: (y,a,b), and the algebra-commutator is (b*a - a*b). -/
theorem rightmul_comm_obstruction (a b y : O ℚ) :
    (y * b) * a - (y * a) * b - y * (b * a - a * b) = (-2 : ℚ) • assoc y a b := by
  have h : assoc y b a = - assoc y a b := eq_neg_of_add_eq_zero_right (assoc_swap23 y a b)
  have key : (y * b) * a - (y * a) * b - y * (b * a - a * b)
      = assoc y b a - assoc y a b := by
    simp only [assoc, mul_sub]; abel
  rw [key, h]; module

/-- PROBE 2: the RIGHT su(2) closure on the associative rung H — with the OPPOSITE structure
    constant sign (-2 vs the LEFT's +2). For y in the H-image, [R_hI,R_hJ] y = -2 • R_hK y. -/
theorem rightReg_closure_on_H_IJ (w : H ℚ) :
    rregI (rregJ (iotaO w)) - rregJ (rregI (iotaO w)) = (-2 : ℚ) • rregK (iotaO w) := by
  simp only [rregI_apply, rregJ_apply, rregK_apply]
  rw [u1_iotaO, e2O_iotaO, e3O_iotaO]
  have hob := rightmul_comm_obstruction (iotaO hI) (iotaO hJ) (iotaO w)
  have hz : assoc (iotaO w) (iotaO hI) (iotaO hJ) = 0 := assoc_iotaO w hI hJ
  rw [hz, smul_zero] at hob
  -- hJ*hI - hI*hJ = -2 hK
  have hcomm : iotaO hJ * iotaO hI - iotaO hI * iotaO hJ = iotaO ((-2 : ℚ) • hK) := by
    rw [show (iotaO hJ * iotaO hI) = iotaO (hJ * hI) from (CD.iota_mul hJ hI).symm,
        show (iotaO hI * iotaO hJ) = iotaO (hI * hJ) from (CD.iota_mul hI hJ).symm,
        ← map_sub]
    congr 1
    rw [hJ_hI, hI_hJ]; module
  have := sub_eq_zero.mp hob
  rw [this, hcomm]
  rw [show iotaO ((-2:ℚ) • hK) = (-2:ℚ) • iotaO hK from map_smul iotaO (-2) hK]
  rw [← e3O_iotaO]
  exact qsmul_mul_right (-2) (iotaO w) e3O

/-- PROBE 3: the LEFT and RIGHT su(2)'s COMMUTE on the associative rung H (the so(4) structure):
    [L_hI, R_hJ] y = 0 for y in the H-image, because the associator (u1, y, e2O) vanishes on H. -/
theorem leftRight_commute_on_H (w : H ℚ) :
    lregI (rregJ (iotaO w)) - rregJ (lregI (iotaO w)) = 0 := by
  simp only [lregI_apply, rregJ_apply]
  -- goal: u1 * (iotaO w * e2O) - (u1 * iotaO w) * e2O = 0
  rw [u1_iotaO, e2O_iotaO]
  have hz : assoc (iotaO hI) (iotaO w) (iotaO hJ) = 0 := assoc_iotaO hI w hJ
  -- assoc a x b = (a*x)*b - a*(x*b); so a*(x*b) - (a*x)*b = -assoc = 0
  have hthis : (iotaO hI * iotaO w) * iotaO hJ - iotaO hI * (iotaO w * iotaO hJ) = 0 := hz
  rw [sub_eq_zero] at hthis ⊢
  exact hthis.symm

end
end Phys.Algebra
