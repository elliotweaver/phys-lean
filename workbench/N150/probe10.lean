import Phys.Algebra.LorentzContinuumCliffordPinNondegenerate
import Mathlib.LinearAlgebra.CliffordAlgebra.Contraction
import Mathlib.LinearAlgebra.Dual.Basis
import Mathlib.LinearAlgebra.ExteriorAlgebra.Grading

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

noncomputable def numOp : EXT →ₗ[Cut] EXT :=
  ∑ i : IdxN, (LinearMap.mulLeft Cut (ιe (bST i))).comp (ctr (bST.dualBasis i))

-- assume the commutator (already proven in probe6): numOp (ιe w * x) = ιe w * x + ιe w * numOp x
axiom numOp_comm_iota (w : STVC) (x : EXT) :
    numOp (ιe w * x) - ιe w * numOp x = ιe w * x
axiom numOp_algebraMap (r : Cut) : numOp (algebraMap Cut EXT r) = 0

-- THE EIGENVALUE on grade-n: for x ∈ ⋀^n, numOp x = n • x.
-- Use the submodule-power characterization: ⋀^n = range(ι)^n, and induct on n via Submodule.pow.
-- Measure: does the homogeneous eigenvalue go through by Submodule.pow_induction_on_left?
theorem numOp_eigen (n : ℕ) (x : EXT) (hx : x ∈ (ExteriorAlgebra.ι (R := Cut) (M := STVC)).range ^ n) :
    numOp x = (n : Cut) • x := by
  induction hx using Submodule.pow_induction_on_left' with
  | algebraMap r =>
      simp only [Nat.cast_zero, zero_smul]
      exact numOp_algebraMap r
  | add i x y _ _ hx hy =>
      rw [map_add, hx, hy, smul_add]
  | mem_mul m hm i x hx ih =>
      obtain ⟨w, rfl⟩ := hm
      have hc := numOp_comm_iota w x
      rw [sub_eq_iff_eq_add] at hc
      rw [hc, ih, Nat.cast_succ, add_smul, one_smul]
      rw [mul_smul_comm]
      abel

end

end Phys.Algebra
