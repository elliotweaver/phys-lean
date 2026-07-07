-- PROBE 2: the entanglement teeth — coefficient functionals via TensorProduct.lift,
-- the correlation determinant, product ⇒ det 0, Bell ⇒ det = 1 ≠ 0 (non-factorizable).
import Mathlib.Tactic
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Phys.Foundation.Fold
import Phys.Cascade.ComplexUnit
import Phys.Quantum.PrimitiveFibre
import Phys.Quantum.ComplexStructure
import Phys.Quantum.BornRule

namespace Phys.Quantum.Probe2

open Phys.Foundation Phys.Cascade Module
open Phys.Foundation.ContinuumQ
open scoped TensorProduct

abbrev TwoFibre := StateFibre ⊗[ContinuumQ.Cut] StateFibre

-- bilinear coefficient forms b_ij (p q) = p.i * q.j via mk₂, then lift to TwoFibre →ₗ Cut.
noncomputable def bil (i j : Bool) : StateFibre →ₗ[ContinuumQ.Cut] StateFibre →ₗ[ContinuumQ.Cut] ContinuumQ.Cut :=
  LinearMap.mk₂ ContinuumQ.Cut
    (fun p q => (if i then p.2 else p.1) * (if j then q.2 else q.1))
    (by intro p1 p2 q; cases i <;> cases j <;> simp <;> ring)
    (by intro c p q; cases i <;> cases j <;> simp <;> ring)
    (by intro p q1 q2; cases i <;> cases j <;> simp <;> ring)
    (by intro c p q; cases i <;> cases j <;> simp <;> ring)

noncomputable def coeff (i j : Bool) : TwoFibre →ₗ[ContinuumQ.Cut] ContinuumQ.Cut :=
  TensorProduct.lift (bil i j)

@[simp] theorem coeff_tmul (i j : Bool) (a b : StateFibre) :
    coeff i j (a ⊗ₜ b) = (if i then a.2 else a.1) * (if j then b.2 else b.1) := by
  simp [coeff, bil]

-- the correlation determinant (concurrence) — a NON-linear (quadratic) functional.
noncomputable def corrDet (Ψ : TwoFibre) : ContinuumQ.Cut :=
  coeff false false Ψ * coeff true true Ψ - coeff false true Ψ * coeff true false Ψ

-- PRODUCT ⇒ det 0.
theorem corrDet_prod (a b : StateFibre) : corrDet (a ⊗ₜ b) = 0 := by
  unfold corrDet; simp only [coeff_tmul]; ring

-- BELL / diagonal state ⇒ det = 1 ≠ 0 (genuine entanglement).
noncomputable def bell : TwoFibre := eInward ⊗ₜ eInward + eOutward ⊗ₜ eOutward

theorem corrDet_bell : corrDet bell = 1 := by
  unfold corrDet bell
  simp only [map_add, coeff_tmul, eInward, eOutward]
  norm_num

-- so the Bell state is NOT a product state.
theorem bell_not_product : ¬ ∃ a b : StateFibre, bell = a ⊗ₜ b := by
  rintro ⟨a, b, hab⟩
  have h1 : corrDet bell = 1 := corrDet_bell
  have h2 : corrDet bell = 0 := by rw [hab]; exact corrDet_prod a b
  rw [h1] at h2; exact one_ne_zero h2

end Phys.Quantum.Probe2
