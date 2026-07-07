import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.LinearAlgebra.FiniteDimensional.Defs
import Mathlib.Tactic
import Phys.Foundation.Fold
import Phys.Cascade.ComplexUnit

open Phys.Foundation Phys.Cascade Module
open Phys.Foundation.ContinuumQ

namespace Phys.Quantum.Probe

/-- The primitive 2D real fibre: the doubled derived-ℝ line. -/
abbrev StateFibre := ContinuumQ.Cut × ContinuumQ.Cut

/-- Look-back "toward" direction. -/
noncomputable def eInward : StateFibre := (1, 0)
/-- Look-back "away" direction. -/
noncomputable def eOutward : StateFibre := (0, 1)

/-- raw self-overlap / Euclidean form. -/
noncomputable def bornForm (p q : StateFibre) : ContinuumQ.Cut := p.1 * q.1 + p.2 * q.2

-- 1. distinct directions
theorem eInward_ne_eOutward : eInward ≠ eOutward := by
  intro h
  have : (1 : ContinuumQ.Cut) = 0 := congrArg Prod.fst h
  exact one_ne_zero this

-- 2. finrank = 2
theorem fibre_finrank : finrank ContinuumQ.Cut StateFibre = 2 := by
  rw [Module.finrank_prod, finrank_self]

-- 3. decomp
theorem fibre_decomp (p : StateFibre) : p = p.1 • eInward + p.2 • eOutward := by
  apply Prod.ext
  · simp [eInward, eOutward, smul_eq_mul]
  · simp [eInward, eOutward, smul_eq_mul]

-- 4. even dim via foldRoot_forces_even_dim on J₂
theorem fibre_even_dim : Even (finrank ContinuumQ.Cut StateFibre) :=
  foldRoot_forces_even_dim J₂ J₂_isFoldRoot

-- 5. line blocked
theorem line_blocked :
    ¬ ∃ J : ContinuumQ.Cut →ₗ[ContinuumQ.Cut] ContinuumQ.Cut, IsFoldRoot (fun x => J x) :=
  no_foldRoot_dim1

-- 6. fibre carries fold-root
theorem fibre_carries_foldRoot : IsFoldRoot (fun p => J₂ p) := J₂_isFoldRoot

-- 8. born positivity
theorem bornForm_self_nonneg (p : StateFibre) : 0 ≤ bornForm p p := by
  unfold bornForm
  have h1 : 0 ≤ p.1 * p.1 := mul_self_nonneg _
  have h2 : 0 ≤ p.2 * p.2 := mul_self_nonneg _
  linarith

-- 9. positive-definite
theorem bornForm_self_eq_zero (p : StateFibre) : bornForm p p = 0 ↔ p = 0 := by
  unfold bornForm
  constructor
  · intro h
    have h1 : 0 ≤ p.1 * p.1 := mul_self_nonneg _
    have h2 : 0 ≤ p.2 * p.2 := mul_self_nonneg _
    have e1 : p.1 * p.1 = 0 := by linarith
    have e2 : p.2 * p.2 = 0 := by linarith
    apply Prod.ext
    · simpa using (mul_self_eq_zero.mp e1)
    · simpa using (mul_self_eq_zero.mp e2)
  · intro h; rw [h]; simp

-- 10. orthonormal frame
theorem bornForm_symm (p q : StateFibre) : bornForm p q = bornForm q p := by
  unfold bornForm; ring
theorem bornForm_eInward_self : bornForm eInward eInward = 1 := by
  unfold bornForm eInward; simp
theorem bornForm_eOutward_self : bornForm eOutward eOutward = 1 := by
  unfold bornForm eOutward; simp
theorem bornForm_eInward_eOutward : bornForm eInward eOutward = 0 := by
  unfold bornForm eInward eOutward; simp

-- 7. crux: forced carrier
theorem fibre_forced :
    finrank ContinuumQ.Cut StateFibre = 2 ∧
    Even (finrank ContinuumQ.Cut StateFibre) ∧
    ¬ Even (finrank ContinuumQ.Cut ContinuumQ.Cut) ∧
    (¬ ∃ J : ContinuumQ.Cut →ₗ[ContinuumQ.Cut] ContinuumQ.Cut, IsFoldRoot (fun x => J x)) ∧
    IsFoldRoot (fun p => J₂ p) := by
  refine ⟨fibre_finrank, fibre_even_dim, ?_, no_foldRoot_dim1, J₂_isFoldRoot⟩
  rw [finrank_self]
  exact Nat.not_even_iff_odd.mpr odd_one

end Phys.Quantum.Probe
