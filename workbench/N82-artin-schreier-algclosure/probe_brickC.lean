import Phys.Algebra.LorentzContinuumAlgClosure
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.FieldTheory.Normal.Closure
import Mathlib.GroupTheory.Sylow

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Polynomial

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- MEASURE: Brick C — Cut[i] has NO degree-2 field extension.
-- A degree-2 extension L/Cut[i] has a primitive element α with minpoly of degree 2, monic and
-- irreducible. But every monic quadratic over Cut[i] has a root (N81 cuti_quadratic_has_root),
-- so it is reducible — contradiction.
theorem cuti_no_deg_two_ext (L : Type) [Field L] [Algebra Cuti L] [FiniteDimensional Cuti L] :
    Module.finrank Cuti L ≠ 2 := by
  intro h2
  obtain ⟨α, hα⟩ := Field.exists_primitive_element Cuti L
  have hint : IsIntegral Cuti α := IsIntegral.of_finite Cuti α
  have hfr : (minpoly Cuti α).natDegree = 2 := by
    have e : Module.finrank Cuti L = (minpoly Cuti α).natDegree := by
      rw [← IntermediateField.adjoin.finrank hint, hα]
      exact (IntermediateField.finrank_top').symm
    rw [e] at h2; exact h2
  have hmon : (minpoly Cuti α).Monic := minpoly.monic hint
  have hirr : Irreducible (minpoly Cuti α) := minpoly.irreducible hint
  -- the minpoly is a monic quadratic a·x²+b·x+c with a=1; it has a root by cuti_quadratic_has_root
  -- write the quadratic root existence
  have hroot : ∃ x : Cuti, (minpoly Cuti α).IsRoot x := by
    -- coefficients
    set p := minpoly Cuti α with hp
    have hcoeff2 : p.coeff 2 = 1 := by
      have := hmon
      rw [Polynomial.Monic, Polynomial.leadingCoeff, hfr] at this
      exact this
    -- p = C (p.coeff 2) * X^2 + C (p.coeff 1) * X + C (p.coeff 0)  (degree 2)
    obtain ⟨x, hx⟩ := cuti_quadratic_has_root (p.coeff 2) (p.coeff 1) (p.coeff 0)
      (by rw [hcoeff2]; exact one_ne_zero)
    refine ⟨x, ?_⟩
    -- eval x p = coeff 2 * x^2 + coeff 1 * x + coeff 0
    have heval : p.eval x = p.coeff 2 * x ^ 2 + p.coeff 1 * x + p.coeff 0 := by
      have hpdeg : p.natDegree = 2 := hfr
      rw [Polynomial.eval_eq_sum_range, hpdeg]
      simp [Finset.sum_range_succ]
      ring
    rw [Polynomial.IsRoot, heval]
    linear_combination hx
  obtain ⟨x, hx⟩ := hroot
  have hdeg1 : (minpoly Cuti α).degree = 1 := degree_eq_one_of_irreducible_of_root hirr hx
  have : (minpoly Cuti α).natDegree = 1 := natDegree_eq_of_degree_eq_some hdeg1
  omega

end
end Phys.Algebra
