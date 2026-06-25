import Phys.Algebra.DerivationOExp
import Phys.Algebra.DerivationCompact
import Phys.Algebra.DerivationAutExp
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.Topology.Algebra.InfiniteSum.Module

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD

noncomputable section

def d0 (z : O Cut) : Cut := z.re.re.re
def d1 (z : O Cut) : Cut := z.re.re.im
def d2 (z : O Cut) : Cut := z.re.im.re
def d3 (z : O Cut) : Cut := z.re.im.im
def d4 (z : O Cut) : Cut := z.im.re.re
def d5 (z : O Cut) : Cut := z.im.re.im
def d6 (z : O Cut) : Cut := z.im.im.re
def d7 (z : O Cut) : Cut := z.im.im.im

def coordOCut : O Cut ≃ₗ[Cut] (Fin 8 → Cut) where
  toFun z := ![d0 z, d1 z, d2 z, d3 z, d4 z, d5 z, d6 z, d7 z]
  invFun v := ⟨⟨⟨v 0, v 1⟩, ⟨v 2, v 3⟩⟩, ⟨⟨v 4, v 5⟩, ⟨v 6, v 7⟩⟩⟩
  map_add' a b := by
    funext i; fin_cases i <;>
      simp [d0, d1, d2, d3, d4, d5, d6, d7, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im]
  map_smul' q z := by
    funext i; fin_cases i <;>
      simp [d0, d1, d2, d3, d4, d5, d6, d7, CD.genSmul_re, CD.genSmul_im, Dbl.smul_re, Dbl.smul_im]
  left_inv z := by
    obtain ⟨⟨⟨a, b⟩, ⟨c, d⟩⟩, ⟨⟨e, f⟩, ⟨g, h⟩⟩⟩ := z; rfl
  right_inv v := by funext i; fin_cases i <;> simp [d0, d1, d2, d3, d4, d5, d6, d7]

-- PROBE A: continuity of coordOCut (forward). Each component is a composition of re/im
-- projections, all continuous by N41b.
example : Continuous (coordOCut : O Cut → (Fin 8 → Cut)) := by
  apply continuous_pi
  intro i
  fin_cases i <;>
    simp only [coordOCut, LinearEquiv.coe_mk, LinearMap.coe_mk, AddHom.coe_mk,
      Matrix.cons_val] <;>
    · unfold_let d0 d1 d2 d3 d4 d5 d6 d7 <;>
      first
      | exact (CD.continuous_re.comp CD.continuous_re).comp CD.continuous_re
      | sorry

end
