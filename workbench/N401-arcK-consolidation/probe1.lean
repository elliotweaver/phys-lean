import Mathlib.Tactic
import Phys.Quantum.SMatrix
import Phys.Quantum.ComplexStructure

namespace Phys.Quantum.ArcKProbe

open Phys.Foundation Phys.Cascade Module
open Phys.Foundation.ContinuumQ
open Phys.Algebra Phys.Cascade.CD
open Phys.Quantum

attribute [local instance] CD.narCD CD.srCD

/-! WELD 1 — THE ONE COMPLETENESS. The S-matrix conserves the OCTONION NORM of a dressed
    asymptotic singlet: for a unit phase U, `g(S(dress a b), S(dress a b)) = ratCast(gForm(singlet))`.
    (K1 conservation ⊗ K2 isometry ⊗ K4 scatteringOp ⊗ arc-I gForm.) -/
theorem weld1_one_completeness (U : Dbl ContinuumQ.Cut) (hU : dblNormSq U = 1) (a b : ℚ) :
    bornForm (scatteringOp U (dress a b)) (scatteringOp U (dress a b))
      = ((gForm (singletElt a b) (singletElt a b) : ℚ) : ContinuumQ.Cut) := by
  rw [scatteringOp_eq_evolve, unitary_conserves_born U hU, bornForm_dress]

/-! WELD 2 — THE ONE ROOT. The S-matrix generator (fold phase Dbl.J, arc K) IS the Born
    complex structure foldComplex (arc J) on asymptotic states, and both are octonion
    u1-multiplication on the singlet line (arc I): one √-1 read three ways. -/
theorem weld2_one_root (a b : ℚ) :
    scatteringOp Dbl.J (dress a b) = foldComplex (dress a b)
      ∧ u1 * singletElt a b = singletElt (-b) a
      ∧ foldComplex (dress a b) = dress (-b) a := by
  refine ⟨?_, u1_mul_singletElt a b, dress_intertwines_J a b⟩
  rw [scatteringOp_eq_evolve, evolve_J_dress, dress_intertwines_J]

/-! WELD 3 — THE ONE IDEMPOTENT/OPTICAL TOTAL. The optical-theorem total `2·Im T` (K3) is
    itself a Born self-overlap CONSERVED by the S-matrix (K1 ⊗ K4). -/
theorem weld3_one_optical_total (V U : Dbl ContinuumQ.Cut)
    (hV : dblNormSq V = 1) (hU : dblNormSq U = 1) :
    bornForm (scatteringOp V (fromDbl (intOp U))) (scatteringOp V (fromDbl (intOp U)))
      = 2 * (intOp U).im := by
  rw [scatteringOp_eq_evolve, unitary_conserves_born V hV, bornForm_fromDbl, ← optical_theorem U hU]

/-! W8 non-vacuity: the fold phase Dbl.J makes all three welds bite. -/

-- weld1 at (1,0) conserves norm to 1 ≠ 0
theorem nv1 :
    bornForm (scatteringOp Dbl.J (dress 1 0)) (scatteringOp Dbl.J (dress 1 0)) = 1 := by
  rw [weld1_one_completeness Dbl.J J_is_unit_phase 1 0, gForm_singletElt]
  push_cast; ring

-- weld2 at (1,0) genuinely rotates: S(dress 1 0) = eOutward ≠ eInward = dress 1 0
theorem nv2 : scatteringOp Dbl.J (dress 1 0) ≠ dress 1 0 := by
  rw [scatteringOp_eq_evolve, evolve_J_dress, neg_zero, dress_eOutward, dress_eInward]
  exact fun h => eInward_ne_eOutward h.symm

-- weld3 with V=U=Dbl.J conserves the optical total to 2 ≠ 0
theorem nv3 :
    bornForm (scatteringOp Dbl.J (fromDbl (intOp Dbl.J))) (scatteringOp Dbl.J (fromDbl (intOp Dbl.J)))
      = 2 := by
  rw [weld3_one_optical_total Dbl.J Dbl.J J_is_unit_phase J_is_unit_phase, intOp_J_nontrivial.1]
  norm_num

end Phys.Quantum.ArcKProbe
