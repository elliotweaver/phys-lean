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

-- ιe v abbreviation
local notation "ιe" => ExteriorAlgebra.ι (R := Cut)
local notation "ctr" => CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm Cut STVC))

-- LOCAL super-Leibniz: ctr d (ιe a * x) = d a • x - ιe a * ctr d x  (this is contractLeft_ι_mul)
example (d : Module.Dual Cut STVC) (a : STVC) (x : EXT) :
    ctr d (ιe a * x) = d a • x - ιe a * ctr d x :=
  CliffordAlgebra.contractLeft_ι_mul d a x

-- anticommute: ιe a * ιe c = - (ιe c * ιe a)
theorem ext_anticomm (a c : STVC) :
    ιe a * ιe c = - (ιe c * ιe a) := by
  have h := CliffordAlgebra.ι_mul_ι_add_swap (Q := (0 : QuadraticForm Cut STVC)) a c
  rw [QuadraticMap.polar] at h
  simp only [map_sub] at h
  have h0 : ExteriorAlgebra.ι (R := Cut) (M := STVC) a * ExteriorAlgebra.ι (R := Cut) (M := STVC) c
      + ExteriorAlgebra.ι (R := Cut) (M := STVC) c * ExteriorAlgebra.ι (R := Cut) (M := STVC) a = 0 := by
    rw [h]; simp
  exact eq_neg_of_add_eq_zero_left h0

-- THE CRUX: the per-i pointwise COMMUTATOR identity on a single x.
-- (Lᵢ Cᵢ)(Lmul(w) x) - Lmul(w)((Lᵢ Cᵢ) x) = dbi(w) • (ιe(bST i) * x)
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

end

end Phys.Algebra
