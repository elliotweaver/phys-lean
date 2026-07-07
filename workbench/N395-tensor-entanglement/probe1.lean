-- PROBE 1: does the genuine Mathlib TensorProduct over the derived Cut compile,
-- and can we build the comm/exchange map + a separability (rank/factorization) witness?
import Mathlib.Tactic
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.LinearAlgebra.TensorProduct.Basis
import Phys.Foundation.Fold
import Phys.Cascade.ComplexUnit
import Phys.Quantum.PrimitiveFibre
import Phys.Quantum.ComplexStructure
import Phys.Quantum.BornRule

namespace Phys.Quantum.Probe1

open Phys.Foundation Phys.Cascade Module
open Phys.Foundation.ContinuumQ
open scoped TensorProduct

-- The 2-fibre composite carrier as a genuine tensor over the derived Cut.
abbrev TwoFibre := StateFibre ⊗[ContinuumQ.Cut] StateFibre

-- Does it have finrank 4?
example : Module.finrank ContinuumQ.Cut TwoFibre = 4 := by
  rw [Module.finrank_tensorProduct, fibre_finrank]

-- The exchange (swap the two probes), like G1's exchange on ImO ⊗ ImO.
noncomputable def swap : Module.End ContinuumQ.Cut TwoFibre :=
  (TensorProduct.comm ContinuumQ.Cut StateFibre StateFibre).toLinearMap

example (a b : StateFibre) : swap (a ⊗ₜ b) = b ⊗ₜ a := by
  simp [swap]

-- A product (separable) state embedding.
noncomputable def prod2 (a b : StateFibre) : TwoFibre := a ⊗ₜ b

-- Nonzero tensor: eInward ⊗ eInward ≠ 0 (needs the two factors nonzero).
example : (eInward ⊗ₜ[ContinuumQ.Cut] eInward : TwoFibre) ≠ 0 := by
  intro h
  -- use that eInward ≠ 0
  sorry

end Phys.Quantum.Probe1
