import Phys.Algebra.LorentzContinuumCliffordPinExactKernel

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-- THE MASTER IDENTITY (banked in probe1). -/
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

/-- THE COVERING-ID IDENTITY: if a unit `u` covers the identity operator, then
    `involute(↑u) · ι v = ι v · ↑u` for every `v`. -/
theorem covers_id_comm {u : CliffCˣ} (h : CliffCovers u (1 : Module.End Cut STVC)) (v : STVC) :
    CliffordAlgebra.involute (u : CliffC) * CliffordAlgebra.ι QvCQuad v
      = CliffordAlgebra.ι QvCQuad v * (u : CliffC) := by
  have hv := h v
  rw [Module.End.one_apply] at hv
  -- hv : involute(↑u) * ι v * ↑u⁻¹ = ι v
  -- multiply both sides on the right by ↑u
  have := congrArg (fun z => z * (u : CliffC)) hv
  simp only at this
  rw [mul_assoc, ← Units.val_mul, inv_mul_cancel, Units.val_one, mul_one] at this
  exact this

/-- THE CONTRACTION-KERNEL REDUCTION: if `u` covers the identity, then every interior
    product of `↑u` by a polar dual vanishes: `contractLeft (polarBilin v) ↑u = 0`. -/
theorem covers_id_contract_zero {u : CliffCˣ} (h : CliffCovers u (1 : Module.End Cut STVC))
    (v : STVC) :
    CliffordAlgebra.contractLeft (QuadraticMap.polarBilin QvCQuad v) (u : CliffC) = 0 := by
  rw [← master_contract v (u : CliffC), covers_id_comm h v, sub_self]

end

end Phys.Algebra
