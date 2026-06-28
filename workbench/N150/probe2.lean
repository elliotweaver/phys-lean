import Phys.Algebra.LorentzContinuumCliffordPinNondegenerate
import Mathlib.LinearAlgebra.CliffordAlgebra.Contraction

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- the injective polarBilin (from probe1)
theorem polarBilin_injective : Function.Injective (QuadraticMap.polarBilin QvCQuad) := by
  rw [← LinearMap.ker_eq_bot, LinearMap.ker_eq_bot']
  intro v hv
  apply polarBilin_separating v
  intro u
  have : QuadraticMap.polarBilin QvCQuad v u = 0 := by rw [hv]; rfl
  rw [QuadraticMap.polarBilin_apply_apply, QuadraticMap.polar_comm,
      ← QuadraticMap.polarBilin_apply_apply] at this
  exact this

-- PIECE 1c: injective ⟹ surjective on STVC →ₗ Dual (equal finrank)
theorem polarBilin_surjective : Function.Surjective (QuadraticMap.polarBilin QvCQuad) := by
  have hdim : Module.finrank Cut STVC = Module.finrank Cut (Module.Dual Cut STVC) :=
    (Subspace.dual_finrank_eq).symm
  exact (LinearMap.injective_iff_surjective_of_finrank_eq_finrank hdim).mp polarBilin_injective

-- PIECE 2: x killed by all contractLeft(polarBilin v) ⟹ x killed by all contractLeft d
theorem contract_all_of_polar {x : CliffC}
    (h : ∀ v : STVC, CliffordAlgebra.contractLeft (QuadraticMap.polarBilin QvCQuad v) x = 0) :
    ∀ d : Module.Dual Cut STVC, CliffordAlgebra.contractLeft d x = 0 := by
  intro d
  obtain ⟨v, hv⟩ := polarBilin_surjective d
  rw [← hv]; exact h v

-- check Invertible 2 over Cut (needed for equivExterior)
example : Invertible (2 : Cut) := by infer_instance

end

end Phys.Algebra
