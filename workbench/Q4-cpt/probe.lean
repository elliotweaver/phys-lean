import Mathlib.Tactic
import Phys.Quantum.BornRule
import Phys.Algebra.ChiralGenerationAnomalyCancellation

namespace Phys.Quantum.CPTProbe

open Phys.Foundation Phys.Cascade Phys.Quantum
open Phys.Foundation.ContinuumQ

-- the three fibre reversals
noncomputable def cC (p : StateFibre) : StateFibre := (-p.1, -p.2)
noncomputable def cP (p : StateFibre) : StateFibre := (-p.1, p.2)
noncomputable def cT (p : StateFibre) : StateFibre := (p.1, -p.2)

-- involutions
example (p : StateFibre) : cC (cC p) = p := by unfold cC; simp
example (p : StateFibre) : cP (cP p) = p := by unfold cP; simp
example (p : StateFibre) : cT (cT p) = p := by unfold cT; simp

-- THE HEART: CPT returns
example (p : StateFibre) : cC (cP (cT p)) = p := by unfold cC cP cT; simp

-- C = P ∘ T ; CP = T
example (p : StateFibre) : cC p = cP (cT p) := by unfold cC cP cT; simp
example (p : StateFibre) : cC (cP p) = cT p := by unfold cC cP cT; simp

-- bornForm preserved by all three
example (x y : StateFibre) : bornForm (cC x) (cC y) = bornForm x y := by unfold cC bornForm; ring
example (x y : StateFibre) : bornForm (cP x) (cP y) = bornForm x y := by unfold cP bornForm; ring
example (x y : StateFibre) : bornForm (cT x) (cT y) = bornForm x y := by unfold cT bornForm; ring

-- kahlerForm: cP reverses, cT reverses, cC preserves
example (x y : StateFibre) : kahlerForm (cP x) (cP y) = - kahlerForm x y := by
  rw [kahlerForm_apply, kahlerForm_apply]; unfold cP; ring
example (x y : StateFibre) : kahlerForm (cT x) (cT y) = - kahlerForm x y := by
  rw [kahlerForm_apply, kahlerForm_apply]; unfold cT; ring
example (x y : StateFibre) : kahlerForm (cC x) (cC y) = kahlerForm x y := by
  rw [kahlerForm_apply, kahlerForm_apply]; unfold cC; ring

-- foldComplex: cP anti-commutes, cT anti-commutes, cC commutes
example (p : StateFibre) : cP (foldComplex p) = - foldComplex (cP p) := by
  rw [foldComplex_apply]; unfold cP; rw [foldComplex_apply]; simp; ring
example (p : StateFibre) : cT (foldComplex p) = - foldComplex (cT p) := by
  rw [foldComplex_apply]; unfold cT; rw [foldComplex_apply]; simp; ring
example (p : StateFibre) : cC (foldComplex p) = foldComplex (cC p) := by
  rw [foldComplex_apply]; unfold cC; rw [foldComplex_apply]; simp

-- T anchor: cT = dblConj on Dbl
example (p : StateFibre) : toDbl (cT p) = dblConj (toDbl p) := by
  apply Dbl.ext <;> unfold cT <;> simp [toDbl, dblConj]

-- nontriviality
example : cP eInward ≠ eInward := by unfold cP eInward; simp
example : cT eOutward ≠ eOutward := by unfold cT eOutward; simp

-- C anchor from F1
example (n : ℕ) (S : Finset (Fin n)) :
    Phys.Algebra.blCharge n Sᶜ = - Phys.Algebra.blCharge n S :=
  Phys.Algebra.blCharge_compl_odd n S

end Phys.Quantum.CPTProbe
