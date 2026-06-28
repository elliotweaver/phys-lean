import Phys.Algebra.LorentzContinuumCliffordPinNondegenerate
import Mathlib.LinearAlgebra.CliffordAlgebra.Contraction
import Mathlib.LinearAlgebra.Dual.Basis

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

abbrev EXT := ExteriorAlgebra Cut STVC
abbrev IdxN := Module.Free.ChooseBasisIndex Cut STVC
noncomputable abbrev bST : Module.Basis IdxN Cut STVC := Module.Free.chooseBasis Cut STVC

local notation "ιe" => ExteriorAlgebra.ι (R := Cut)
local notation "ctr" => CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm Cut STVC))

theorem ext_anticomm (a c : STVC) :
    ιe a * ιe c = - (ιe c * ιe a) := by
  have h := CliffordAlgebra.ι_mul_ι_add_swap (Q := (0 : QuadraticForm Cut STVC)) a c
  rw [QuadraticMap.polar] at h
  simp only [map_sub] at h
  have h0 : ExteriorAlgebra.ι (R := Cut) (M := STVC) a * ExteriorAlgebra.ι (R := Cut) (M := STVC) c
      + ExteriorAlgebra.ι (R := Cut) (M := STVC) c * ExteriorAlgebra.ι (R := Cut) (M := STVC) a = 0 := by
    rw [h]; simp
  exact eq_neg_of_add_eq_zero_left h0

theorem per_i_comm (i : IdxN) (w : STVC) (x : EXT) :
    ιe (bST i) * (ctr (bST.dualBasis i) (ιe w * x))
      - ιe w * (ιe (bST i) * (ctr (bST.dualBasis i) x))
      = (bST.dualBasis i w) • (ιe (bST i) * x) := by
  rw [CliffordAlgebra.contractLeft_ι_mul]
  rw [mul_sub, mul_smul_comm]
  have hswap : ιe (bST i) * (ιe w * (ctr (bST.dualBasis i) x))
        = - (ιe w * (ιe (bST i) * (ctr (bST.dualBasis i) x))) := by
    apply eq_neg_of_add_eq_zero_left
    rw [← mul_assoc, ← mul_assoc, ← add_mul]
    have hsum : ιe (bST i) * ιe w + ιe w * ιe (bST i) = 0 := by
      have h := ext_anticomm (bST i) w
      rw [h]; abel
    rw [hsum, zero_mul]
  rw [hswap, sub_neg_eq_add]
  abel

-- the number operator
noncomputable def numOp : EXT →ₗ[Cut] EXT :=
  ∑ i : IdxN, (LinearMap.mulLeft Cut (ιe (bST i))).comp (ctr (bST.dualBasis i))

theorem numOp_apply (x : EXT) :
    numOp x = ∑ i : IdxN, ιe (bST i) * (ctr (bST.dualBasis i) x) := by
  simp only [numOp, LinearMap.coeFn_sum, Finset.sum_apply, LinearMap.comp_apply,
    LinearMap.mulLeft_apply]

theorem basis_complete (w : STVC) : (∑ i : IdxN, (bST.dualBasis i w) • bST i) = w := by
  conv_rhs => rw [← bST.sum_repr w]
  apply Finset.sum_congr rfl
  intro i _
  rw [bST.dualBasis_apply]

-- THE SUMMED COMMUTATOR: numOp (ιe w * x) - ιe w * numOp x = ιe w * x
theorem numOp_comm_iota (w : STVC) (x : EXT) :
    numOp (ιe w * x) - ιe w * numOp x = ιe w * x := by
  rw [numOp_apply, numOp_apply, Finset.mul_sum, ← Finset.sum_sub_distrib]
  -- Σ_i (ιe(bi)*ctr_i(ιe w * x) - ιe w * (ιe(bi)*ctr_i x)) = Σ_i dbi(w)•(ιe(bi)*x)
  rw [Finset.sum_congr rfl (fun i _ => per_i_comm i w x)]
  -- Σ_i dbi(w)•(ιe(bi)*x) = ιe (Σ_i dbi(w)•bi) * x = ιe w * x
  rw [show (∑ i : IdxN, (bST.dualBasis i w) • (ιe (bST i) * x))
        = ιe (∑ i : IdxN, (bST.dualBasis i w) • bST i) * x from by
        rw [map_sum, Finset.sum_mul]
        apply Finset.sum_congr rfl
        intro i _
        rw [map_smul, smul_mul_assoc]]
  rw [basis_complete]

end

end Phys.Algebra
