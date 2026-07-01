import Phys.Algebra.OctonionCoassociative4Form
import Phys.Algebra.OctonionCrossProductContraction
import Phys.Algebra.TowerGatherObstruction
import Phys.Algebra.TowerGatherObstructionInvariant
import Phys.Algebra.DerivationRep7

namespace Phys.Algebra.ProbeN222b

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD

theorem reQ_assoc_zero (x y z : O ℚ) : reQ (assoc x y z) = 0 := by
  unfold assoc
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

theorem mem_ImO_of_reQ_zero {x : O ℚ} (hx : reQ x = 0) : x ∈ ImO := by
  rw [mem_ImO]
  have ht := trace_id x
  rw [hx] at ht
  simp only [mul_zero, zero_smul] at ht
  exact eq_neg_of_add_eq_zero_right ht

theorem assoc_mem_ImO (x y z : O ℚ) : assoc x y z ∈ ImO :=
  mem_ImO_of_reQ_zero (reQ_assoc_zero x y z)

-- MEASURE 5: THE INTERTWINER — the associator, as an element of the fundamental 7 (ImO),
-- transforms under imRep exactly by the Leibniz sum. Connects to N221 equivariance.
theorem assoc_imRep_equivariant (D : derivationLieQ) (x y z : O ℚ) :
    ((imRep D ⟨assoc x y z, assoc_mem_ImO x y z⟩ : ImO) : O ℚ)
      = assoc ((D : Module.End ℚ (O ℚ)) x) y z + assoc x ((D : Module.End ℚ (O ℚ)) y) z
        + assoc x y ((D : Module.End ℚ (O ℚ)) z) := by
  rw [imRep_coe]
  exact assoc_derivQ_equivariant_O (D : Module.End ℚ (O ℚ)) D.2 x y z

-- MEASURE 6: witness inputs imaginary (so it is genuinely a nonzero element on 7⊗7⊗7).
theorem wa_mem_ImO : (CD.iota (ιJ ℚ) : O ℚ) ∈ ImO := by
  rw [mem_ImO]; ext <;>
  simp [CD.iota, ιJ, Dbl.J, CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im']
theorem wb_mem_ImO : (CD.iota (CD.e2 : H ℚ) : O ℚ) ∈ ImO := by
  rw [mem_ImO]; ext <;>
  simp [CD.iota, CD.e2, CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im']
theorem wc_mem_ImO : (CD.e2 : O ℚ) ∈ ImO := by
  rw [mem_ImO]; ext <;>
  simp [CD.e2, CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im']

-- MEASURE 7: the obstruction is a NONZERO element of the fundamental 7 (ImO), at an
-- imaginary witness triple.
theorem obstruction_nonzero_in_seven :
    (⟨assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ),
        assoc_mem_ImO _ _ _⟩ : ImO) ≠ 0 := by
  intro h
  have h0 : assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ) = 0 := by
    have := congrArg (Subtype.val) h
    simpa using this
  exact assoc_nonvanishing h0

end Phys.Algebra.ProbeN222b
