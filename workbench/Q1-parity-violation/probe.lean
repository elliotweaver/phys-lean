import Phys.Algebra.ChiralityBlock
import Phys.Algebra.TowerGatherObstructionUnification
import Phys.Algebra.DerivationHIntoO
import Phys.Quantum.ComplexStructure
import Mathlib.Tactic

namespace Phys.Algebra.Q1Probe

open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## PROBE 1 — THE FIFTH FACE: chirality-block index ⟺ AssocLocusNonempty. -/

theorem chirality_block_index_probe :
    (¬ ∀ a b : O ℚ, (LeftMul a).comp (RightMul b) = (RightMul b).comp (LeftMul a))
      ↔ AssocLocusNonempty := by
  rw [chirality_commute_iff_assoc]
  -- goal: ¬(∀ x y z, (xy)z = x(yz)) ↔ AssocLocusNonempty
  -- and cascade_stop_is_obstruction : (¬ SectorAssoc (O ℚ)) ↔ AssocLocusNonempty
  -- SectorAssoc (O ℚ) is defeq to ∀ a b c, (a*b)*c = a*(b*c)
  exact cascade_stop_is_obstruction

/-! ## PROBE 2 — THE ASSOCIATIVE RUNG ℍ: chiralities COMMUTE (parity-symmetric). -/

-- On the associative quaternion rung, a·(x·b) = (a·x)·b for all a,x,b — the L/R actions commute.
theorem H_parity_symmetric_probe : ∀ a x b : H ℚ, a * (x * b) = (a * x) * b := by
  intro a x b; rw [mul_assoc]

/-! ## PROBE 3 — THE OCTONION RUNG 𝕆: chiralities do NOT commute (parity broken). -/

theorem O_parity_broken_probe : ¬ ∀ a x b : O ℚ, a * (x * b) = (a * x) * b := by
  intro h
  exact not_associative (fun x y z => (h x y z).symm)

/-! ## PROBE 4 — the L/R-commutation form matches a·(x·b)=(a·x)·b (bridging N44 form). -/

theorem LR_comm_is_assoc_probe (a b : O ℚ) :
    ((LeftMul a).comp (RightMul b) = (RightMul b).comp (LeftMul a))
      ↔ (∀ x : O ℚ, a * (x * b) = (a * x) * b) := by
  constructor
  · intro h x
    have := congrArg (fun f => f x) h
    simpa [LinearMap.comp_apply, LeftMul_apply, RightMul_apply] using this
  · intro h
    refine LinearMap.ext (fun x => ?_)
    simp only [LinearMap.comp_apply, LeftMul_apply, RightMul_apply]
    exact h x

/-! ## PROBE 5 — SU(2)_L extends cleanly: the isospin su(2) = Der(H) ARE derivations of O. -/

theorem su2L_extends_probe :
    IsDeriv (innerDeriv (hI : H ℚ)) ∧ IsDeriv (innerDeriv (hJ : H ℚ))
      ∧ IsDeriv (innerDeriv (hK : H ℚ)) :=
  ⟨innerDeriv_hI_isDerivO, innerDeriv_hJ_isDerivO, innerDeriv_hK_isDerivO⟩

/-! ## PROBE 6 — chirality operator = fold: foldComplex is the self-blind fold-root (iγ⁵). -/

theorem chirality_is_fold_probe :
    (∀ p, Phys.Quantum.foldComplex (Phys.Quantum.foldComplex p) = -p)
      ∧ (∀ p, Phys.Quantum.foldComplex p = p → p = 0) :=
  ⟨Phys.Quantum.foldComplex_sq, Phys.Quantum.foldComplex_self_blind⟩

/-! ## PROBE 7 — the concrete witness (N44) realizes the block. -/

theorem block_witness_probe :
    (LeftMul (CD.iota (ιJ ℚ))).comp (RightMul (CD.e2 : O ℚ))
      ≠ (RightMul (CD.e2 : O ℚ)).comp (LeftMul (CD.iota (ιJ ℚ))) :=
  chirality_block_witness

end

end Phys.Algebra.Q1Probe
