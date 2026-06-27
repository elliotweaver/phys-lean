import Phys.Algebra.LorentzContinuumAlgClosure
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.GroupTheory.Sylow
import Mathlib.FieldTheory.Normal.Closure

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Polynomial

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- MEASURE: the 2-power-degree step. Every finite GALOIS extension of Cut has 2-power degree.
-- Galois group G; a 2-Sylow P has odd index [G:P]; fixed field of P has degree [G:P] over Cut,
-- so by cut_no_odd_ext it is degree 1, forcing fixedField P = ⊥... wait, fixedField over Cut.
-- finrank Cut (fixedField P) = card (G ⧸ ...) hmm. Let me check the API shape.

-- Step 1: what is finrank Cut (fixedField H) for H ≤ Gal(M/Cut)?
example (M : Type) [Field M] [Algebra Cut M] [FiniteDimensional Cut M] [IsGalois Cut M]
    (H : Subgroup (M ≃ₐ[Cut] M)) :
    Module.finrank (IntermediateField.fixedField H) M = Nat.card H :=
  IntermediateField.finrank_fixedField_eq_card H

-- Step 2: finrank Cut M = card G  (Galois)
example (M : Type) [Field M] [Algebra Cut M] [FiniteDimensional Cut M] [IsGalois Cut M] :
    Nat.card (M ≃ₐ[Cut] M) = Module.finrank Cut M :=
  IsGalois.card_aut_eq_finrank Cut M

-- Step 3: finrank Cut (fixedField H) * finrank (fixedField H) M = finrank Cut M
example (M : Type) [Field M] [Algebra Cut M] [FiniteDimensional Cut M]
    (H : Subgroup (M ≃ₐ[Cut] M)) :
    Module.finrank Cut (IntermediateField.fixedField H) *
      Module.finrank (IntermediateField.fixedField H) M = Module.finrank Cut M :=
  Module.finrank_mul_finrank Cut (IntermediateField.fixedField H) M

end
end Phys.Algebra
