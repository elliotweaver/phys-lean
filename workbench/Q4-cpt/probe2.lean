import Mathlib.Tactic
import Phys.Quantum.BornRule
import Phys.Algebra.ChiralGenerationAnomalyCancellation

namespace Phys.Quantum.CPTProbe2
open Phys.Foundation Phys.Cascade Phys.Quantum
open Phys.Foundation.ContinuumQ

noncomputable def cP (p : StateFibre) : StateFibre := (-p.1, p.2)
noncomputable def cT (p : StateFibre) : StateFibre := (p.1, -p.2)
noncomputable def cC (p : StateFibre) : StateFibre := (-p.1, -p.2)

-- foldComplex anti/commutation (fixed: no trailing ring)
example (p : StateFibre) : cP (foldComplex p) = - foldComplex (cP p) := by
  rw [foldComplex_apply]; unfold cP; rw [foldComplex_apply]; simp
example (p : StateFibre) : cT (foldComplex p) = - foldComplex (cT p) := by
  rw [foldComplex_apply]; unfold cT; rw [foldComplex_apply]; simp
example (p : StateFibre) : cC (foldComplex p) = foldComplex (cC p) := by
  rw [foldComplex_apply]; unfold cC; rw [foldComplex_apply]

-- nontriviality over Cut
example : cP eInward ≠ eInward := by
  unfold cP eInward; intro h
  have : (-1 : Cut) = 1 := congrArg Prod.fst h
  norm_num at this
example : cT eOutward ≠ eOutward := by
  unfold cT eOutward; intro h
  have : (-1 : Cut) = 1 := congrArg Prod.snd h
  norm_num at this
example : cC eInward ≠ eInward := by
  unfold cC eInward; intro h
  have : (-1 : Cut) = 1 := congrArg Prod.fst h
  norm_num at this

-- W8 teeth: parity genuinely reverses ω somewhere
example : kahlerForm (cP eInward) (cP eOutward) ≠ kahlerForm eInward eOutward := by
  rw [kahlerForm_apply, kahlerForm_apply]; unfold cP eInward eOutward
  simp; intro h; norm_num at h

end Phys.Quantum.CPTProbe2
