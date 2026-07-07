import Phys.Algebra.ConfinementAreaLaw
import Mathlib.Tactic

namespace Phys.Algebra.NuclearResidualProbe

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra

noncomputable section

attribute [local instance] CD.narCD CD.srCD

/-- 1. singlet pair: no obstruction, no action. -/
theorem singlet_pair_no_obstruction {a b : O ℚ}
    (ha : a ∈ Submodule.span ℚ {(1 : O ℚ), u1})
    (hb : b ∈ Submodule.span ℚ {(1 : O ℚ), u1}) (x : O ℚ) :
    assoc a b x = 0 ∧ bornAction a b x = 0 :=
  ⟨singlet_assoc_vanishes ha hb x, bornAction_singlet_zero ha hb x⟩

/-- 2. residual decomposition: singlet cores, coloured complements. -/
theorem residual_obstruction_decomp {aS bS : O ℚ}
    (haS : aS ∈ Submodule.span ℚ {(1 : O ℚ), u1})
    (hbS : bS ∈ Submodule.span ℚ {(1 : O ℚ), u1})
    (aC bC x : O ℚ) :
    assoc (aS + aC) (bS + bC) x
      = assoc aS bC x + assoc aC bS x + assoc aC bC x := by
  rw [assoc_add_left, assoc_add_mid, assoc_add_mid,
    singlet_assoc_vanishes haS hbS x, zero_add]
  ring

/-- 3. THE WELD: identity cores ⟹ obstruction is exactly the coloured residual. -/
theorem composite_obstruction_is_residual (aC bC x : O ℚ) :
    assoc (1 + aC) (1 + bC) x = assoc aC bC x := by
  rw [assoc_add_left, assoc_add_mid, assoc_add_mid,
    assoc_one_left, assoc_one_mid, assoc_one_mid]
  ring

/-- born action of the composite pair equals the residual. -/
theorem composite_bornAction_is_residual (aC bC x : O ℚ) :
    bornAction (1 + aC) (1 + bC) x = bornAction aC bC x := by
  unfold bornAction
  rw [composite_obstruction_is_residual]

/-- 4. TEETH: the residual between two colour-neutral-cored composites is nonzero. -/
theorem composite_residual_nonvanishing :
    assoc (1 + (CD.iota (ιJ ℚ) : O ℚ)) (1 + (CD.iota (CD.e2 : H ℚ) : O ℚ))
      (CD.e2 : O ℚ) ≠ 0 := by
  rw [composite_obstruction_is_residual]
  exact assoc_nonvanishing

/-- 5. the residual leakage energy is real and positive. -/
theorem residual_bornAction_pos :
    0 < bornAction (1 + (CD.iota (ιJ ℚ) : O ℚ)) (1 + (CD.iota (CD.e2 : H ℚ) : O ℚ))
      (CD.e2 : O ℚ) := by
  rw [composite_bornAction_is_residual]
  exact bornAction_coloured_pos

/-- 6. short-ranged: the residual channel is area-suppressed. -/
theorem residual_short_ranged (m n : ℕ) (hA : 0 < m * n) :
    wilsonArea (bornAction (1 + (CD.iota (ιJ ℚ) : O ℚ))
      (1 + (CD.iota (CD.e2 : H ℚ) : O ℚ)) (CD.e2 : O ℚ)) m n < 1 :=
  wilsonArea_lt_one _ m n residual_bornAction_pos hA

/-- 7. decays with separation. -/
theorem residual_decays_with_separation {A1 A2 : ℕ} (h : A1 < A2) :
    plaqFactor (bornAction (1 + (CD.iota (ιJ ℚ) : O ℚ))
      (1 + (CD.iota (CD.e2 : H ℚ) : O ℚ)) (CD.e2 : O ℚ)) ^ A2
    < plaqFactor (bornAction (1 + (CD.iota (ιJ ℚ) : O ℚ))
      (1 + (CD.iota (CD.e2 : H ℚ) : O ℚ)) (CD.e2 : O ℚ)) ^ A1 :=
  wilsonArea_strictAnti _ residual_bornAction_pos h

/-- 8. the DIRECT singlet channel carries unit weight (no obstruction, not the source). -/
theorem direct_singlet_channel_unit_weight {a b : O ℚ}
    (ha : a ∈ Submodule.span ℚ {(1 : O ℚ), u1})
    (hb : b ∈ Submodule.span ℚ {(1 : O ℚ), u1}) (x : O ℚ) (m n : ℕ) :
    wilsonArea (bornAction a b x) m n = 1 := by
  rw [bornAction_singlet_zero ha hb x]
  unfold wilsonArea plaqFactor
  rw [neg_zero, cutExp_zero, one_pow]

/-- capstone. -/
theorem residual_colour_mechanism :
    (∀ {a b : O ℚ}, a ∈ Submodule.span ℚ {(1 : O ℚ), u1} →
      b ∈ Submodule.span ℚ {(1 : O ℚ), u1} → ∀ x, bornAction a b x = 0) ∧
    (∀ aC bC x : O ℚ, assoc (1 + aC) (1 + bC) x = assoc aC bC x) ∧
    (assoc (1 + (CD.iota (ιJ ℚ) : O ℚ)) (1 + (CD.iota (CD.e2 : H ℚ) : O ℚ))
      (CD.e2 : O ℚ) ≠ 0) ∧
    (0 < bornAction (1 + (CD.iota (ιJ ℚ) : O ℚ)) (1 + (CD.iota (CD.e2 : H ℚ) : O ℚ))
      (CD.e2 : O ℚ)) ∧
    (∀ m n : ℕ, 0 < m * n →
      wilsonArea (bornAction (1 + (CD.iota (ιJ ℚ) : O ℚ))
        (1 + (CD.iota (CD.e2 : H ℚ) : O ℚ)) (CD.e2 : O ℚ)) m n < 1) :=
  ⟨fun ha hb x => bornAction_singlet_zero ha hb x,
   composite_obstruction_is_residual,
   composite_residual_nonvanishing,
   residual_bornAction_pos,
   fun m n hA => residual_short_ranged m n hA⟩

end

end Phys.Algebra.NuclearResidualProbe
