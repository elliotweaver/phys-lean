import Phys.Algebra.LorentzContinuumCliffordPinNondegenerate

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- PIECE 1a: the polar bilinear map STVC →ₗ Dual is INJECTIVE.
example : Function.Injective (QuadraticMap.polarBilin QvCQuad) := by
  rw [← LinearMap.ker_eq_bot]
  rw [LinearMap.ker_eq_bot']
  intro v hv
  -- hv : polarBilin QvCQuad v = 0  (as a Dual functional)
  apply polarBilin_separating v
  intro u
  -- want polarBilin QvCQuad u v = 0; use symmetry polarBilin v u = polarBilin u v
  have : QuadraticMap.polarBilin QvCQuad v u = 0 := by rw [hv]; rfl
  rw [QuadraticMap.polarBilin_apply_apply, QuadraticMap.polar_comm,
      ← QuadraticMap.polarBilin_apply_apply] at this
  exact this

-- check FiniteDimensional STVC resolves
example : FiniteDimensional Cut STVC := by infer_instance

-- PIECE 1b: finrank facts
example : Module.finrank Cut (Module.Dual Cut STVC) = Module.finrank Cut STVC :=
  Subspace.dual_finrank_eq

end

end Phys.Algebra
