import Phys.Algebra.LorentzContinuumCliffordPinExactKernel

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-- THE MASTER IDENTITY: `ι a · x - involute(x) · ι a = contractLeft (polarBilin a) x`. -/
theorem master_contract (a : STVC) (x : CliffC) :
    CliffordAlgebra.ι QvCQuad a * x
        - CliffordAlgebra.involute x * CliffordAlgebra.ι QvCQuad a
      = CliffordAlgebra.contractLeft (QuadraticMap.polarBilin QvCQuad a) x := by
  induction x using CliffordAlgebra.left_induction with
  | algebraMap r =>
      rw [CliffordAlgebra.contractLeft_algebraMap, AlgHom.commutes,
        Algebra.commutes r (CliffordAlgebra.ι QvCQuad a), sub_self]
  | add x y hx hy =>
      rw [map_add, map_add, mul_add, add_mul, ← hx, ← hy]; abel
  | ι_mul x m hx =>
      have key : CliffordAlgebra.ι QvCQuad a * CliffordAlgebra.ι QvCQuad m
          + CliffordAlgebra.ι QvCQuad m * CliffordAlgebra.ι QvCQuad a
          = algebraMap Cut CliffC (QuadraticMap.polar QvCQuad a m) :=
        CliffordAlgebra.ι_mul_ι_add_swap a m
      rw [map_mul, CliffordAlgebra.involute_ι, CliffordAlgebra.contractLeft_ι_mul, ← hx,
          QuadraticMap.polarBilin_apply_apply, Algebra.smul_def, ← key]
      noncomm_ring

end

end Phys.Algebra
