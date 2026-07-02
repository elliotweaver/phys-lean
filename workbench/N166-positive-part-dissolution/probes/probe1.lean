import Phys.Algebra.LorentzContinuumSO9FullAssembly

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-- LEVER 1 (general cancellation): if `k` and `S` are QvC-isometries and `k * p = S`,
    then `p` is a QvC-isometry. (`p = k⁻¹S`, proved directly without an inverse.) -/
theorem isQvIsomC_of_mul_eq {k p S : Module.End Cut STVC}
    (hk : IsQvIsomC (k : STVC → STVC)) (hSisom : IsQvIsomC (S : STVC → STVC))
    (hkp : k * p = S) : IsQvIsomC (p : STVC → STVC) := by
  intro q
  show QvC (p q) = QvC q
  have h2 : S q = k (p q) := by rw [← hkp, Module.End.mul_apply]
  calc QvC (p q) = QvC (k (p q)) := (hk (p q)).symm
    _ = QvC (S q) := by rw [h2]
    _ = QvC q := hSisom q

/-- LEVER 1b: the positive-part factor `p = γ(1)` of the converse polar decomposition of a
    BvC-isometry is itself a QvC-isometry — a positive self-adjoint ISOMETRY (a pure boost),
    NOT a generic positive operator. -/
theorem bvIsomLin_polar_part_isQvIsomC {S : Module.End Cut STVC} (hS : IsBvIsomLin S) :
    ∃ (k p : Module.End Cut STVC),
      IsQvIsomC (k : STVC → STVC) ∧ IsEvCSymm p ∧ (∀ q, 0 ≤ EvC (p q) q) ∧
      IsQvIsomC (p : STVC → STVC) ∧
      k * p = S := by
  obtain ⟨k, p, hk, hsymm, hpos, hkp, _⟩ := bvIsomLin_polar_reduction hS
  have hSisom : IsQvIsomC (S : STVC → STVC) := bvIsomLin_isQvIsomC hS
  exact ⟨k, p, hk, hsymm, hpos, isQvIsomC_of_mul_eq hk hSisom hkp, hkp⟩

/-- LEVER 1c (strengthened polar reduction): records `IsQvIsomC p` alongside the N165 facts. -/
theorem bvIsomLin_polar_reduction_isom {S : Module.End Cut STVC} (hS : IsBvIsomLin S) :
    ∃ (k p : Module.End Cut STVC),
      IsQvIsomC (k : STVC → STVC) ∧ IsEvCSymm p ∧ (∀ q, 0 ≤ EvC (p q) q) ∧
      IsQvIsomC (p : STVC → STVC) ∧
      k * p = S ∧
      (JoinedIdQvC k → JoinedIdQvC p → JoinedIdQvC S) := by
  obtain ⟨k, p, hk, hsymm, hpos, hkp, hcond⟩ := bvIsomLin_polar_reduction hS
  have hSisom : IsQvIsomC (S : STVC → STVC) := bvIsomLin_isQvIsomC hS
  exact ⟨k, p, hk, hsymm, hpos, isQvIsomC_of_mul_eq hk hSisom hkp, hkp, hcond⟩

#print axioms isQvIsomC_of_mul_eq
#print axioms bvIsomLin_polar_part_isQvIsomC
#print axioms bvIsomLin_polar_reduction_isom

end

end Phys.Algebra
