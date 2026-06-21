/-
  Audits.AxiomAudit — foundations-only trust-base audit (docs/STANDARD.md §1.2).
  ===========================================================================
  `#print axioms` over EVERY banked production theorem. The gate (D6) parses this
  output and FAILS if any line shows an axiom outside the foundational trio
  {propext, Classical.choice, Quot.sound}. No theorem may rest on a posited
  assumption — the project's only posit is the fold, and it is a DEFINITION.
-/
import Phys.Foundation.Fold

-- N1 — THE FOLD (self-look-back) and its first forced property.
#print axioms Phys.Foundation.IsFold
#print axioms Phys.Foundation.fold_eq_neg
#print axioms Phys.Foundation.fold_unique
#print axioms Phys.Foundation.fold_void
#print axioms Phys.Foundation.fold_involutive
#print axioms Phys.Foundation.fold_self_blind
#print axioms Phys.Foundation.neg_isFold
#print axioms fold_char2_has_nonzero_fixed
#print axioms fold_int_nonzero_not_fixed
