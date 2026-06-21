/-
  Audits.AxiomAudit — foundations-only trust-base audit (docs/STANDARD.md §1.2).
  ===========================================================================
  `#print axioms` over EVERY banked production theorem. The gate (D6) parses this
  output and FAILS if any line shows an axiom outside the foundational trio
  {propext, Classical.choice, Quot.sound}. No theorem may rest on a posited
  assumption — the project's only posit is the fold, and it is a DEFINITION.
-/
import Phys.Foundation.Fold
import Phys.Cascade.ComplexUnit
import Phys.Cascade.Double
import Phys.Cascade.Quaternion
import Phys.Cascade.Octonion
import Phys.Cascade.Sedenion
import Phys.Cascade.ForcedStop

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

-- N2 rung 1 — THE FORCED COMPLEX UNIT (first rung of the cascade).
-- Notion + obstruction (scalar / ordered line).
#print axioms Phys.Cascade.IsFoldRoot
#print axioms Phys.Cascade.isFoldRoot_iff
#print axioms Phys.Cascade.scalar_isFoldRoot_iff
#print axioms Phys.Cascade.sqrt_fold_not_on_line
#print axioms Phys.Cascade.no_scalar_foldRoot_on_line
#print axioms Phys.Cascade.sqrt_fold_on_unordered_line
#print axioms Phys.Cascade.obstruction_nonvacuous
-- Obstruction (the why-double law: even dimension forced).
#print axioms Phys.Cascade.isFoldRoot_linearMap_iff
#print axioms Phys.Cascade.foldRoot_forces_even_dim
#print axioms Phys.Cascade.no_foldRoot_dim1
#print axioms Phys.Cascade.no_foldRoot_dim1_of_evenLaw
-- Resolution (operator witness at dim 2).
#print axioms Phys.Cascade.J₂
#print axioms Phys.Cascade.J₂_isFoldRoot
#print axioms Phys.Cascade.J₂_self_blind
-- Resolution (the forced complex algebra + derived unit).
#print axioms Phys.Cascade.Dbl.J_mul_J
#print axioms Phys.Cascade.Dbl.mulJ_isFoldRoot
#print axioms Phys.Cascade.Dbl.J_self_blind
#print axioms Phys.Cascade.Dbl.decomp
#print axioms Phys.Cascade.Dbl.ι_injective
#print axioms Phys.Cascade.Dbl.J_not_scalar
#print axioms Phys.Cascade.Dbl.mul_forced
#print axioms Phys.Cascade.Dbl.J_nonvacuous

-- N2 doubling operation — THE CAYLEY–DICKSON DOUBLE (the cascade's one operation).
#print axioms Phys.Cascade.CD.iota_injective
#print axioms Phys.Cascade.CD.iota_e2_comm_iff

-- N2 rung 2 — DOUBLING THE COMPLEX ALGEBRA LOSES COMMUTATIVITY (ℍ).
#print axioms Phys.Cascade.Dbl.star_J
#print axioms Phys.Cascade.Dbl.J_ne_star_J
#print axioms Phys.Cascade.H_associative
#print axioms Phys.Cascade.commutativity_cause
#print axioms Phys.Cascade.not_commutative_witness
#print axioms Phys.Cascade.not_commutative
#print axioms Phys.Cascade.comm_products

-- N2 doubling operation — THE ONE CAUSE of the stop of associativity.
#print axioms Phys.Cascade.CD.iota_iota_e2_assoc_iff

-- N2c rung 3 — DOUBLING THE NON-COMMUTATIVE ALGEBRA LOSES ASSOCIATIVITY (𝕆).
#print axioms Phys.Cascade.assoc_triple_iff
#print axioms Phys.Cascade.not_associative_witness
#print axioms Phys.Cascade.not_associative
#print axioms Phys.Cascade.associativity_cause

-- N2c THE PROVED STOP — doubling past 𝕆 loses composition/Born + division (S).
#print axioms Phys.Cascade.zero_divisor_prod
#print axioms Phys.Cascade.zdX_ne_zero
#print axioms Phys.Cascade.zdY_ne_zero
#print axioms Phys.Cascade.has_zero_divisor
#print axioms Phys.Cascade.N_zero
#print axioms Phys.Cascade.N_zdX
#print axioms Phys.Cascade.N_zdY
#print axioms Phys.Cascade.born_law_fails
#print axioms Phys.Cascade.zero_divisor_breaks_composition

-- N2d THE FORCED STOP (generic) — the generic self-overlap norm, the easy direction,
-- and the generic norm's loss at the stop.
#print axioms Phys.Cascade.CD.Nrm
#print axioms Phys.Cascade.CD.Nrm_def
#print axioms Phys.Cascade.CD.selfMul
#print axioms Phys.Cascade.CD.Nrm_one
#print axioms Phys.Cascade.CD.Nrm_iota
#print axioms Phys.Cascade.CD.Nrm_mul_of_comm
#print axioms Phys.Cascade.N_eq_proj
#print axioms Phys.Cascade.Nrm_zd_prod
#print axioms Phys.Cascade.Nrm_prod_proj
#print axioms Phys.Cascade.genNrm_not_mul_at_S

-- N2d-hard THE FORCED LINK (forward half) — the composition law survives the last
-- associative rung (ℍ→𝕆) and the forced-stop boundary (holds at 𝕆, dies at S).
#print axioms Phys.Cascade.CD.Nrm_mul_of_doubled_base
#print axioms Phys.Cascade.Nrm_mul_on_O
#print axioms Phys.Cascade.forced_stop_boundary

-- N2d-hard-backward (PART A) — the polarized self-overlap (Born) bilinear form and
-- the composition identities P1/P2 forced by multiplicativity (general associative base).
#print axioms Phys.Cascade.CD.add_mul'
#print axioms Phys.Cascade.CD.mul_add'
#print axioms Phys.Cascade.CD.bilin
#print axioms Phys.Cascade.CD.bilin_diag
#print axioms Phys.Cascade.CD.bilin_symm
#print axioms Phys.Cascade.CD.bilin_add_left
#print axioms Phys.Cascade.CD.bilin_add_right
#print axioms Phys.Cascade.CD.Nrm_add
#print axioms Phys.Cascade.CD.P1
#print axioms Phys.Cascade.CD.P2

-- N2d-hard-backward (PART B) — associativity of the double reflects to base
-- associativity (iota is a ring hom; the double associates on a base-image triple iff
-- the base associates).
#print axioms Phys.Cascade.CD.iota_mul
#print axioms Phys.Cascade.CD.iota_assoc_iff
#print axioms Phys.Cascade.CD.base_assoc_of_image_assoc

-- N2d-hard-backward-MIDDLE (PART C) — the scaling-law reflection: the LEFT SCALING LAW
-- (alternative/composition law in scaling form) forces base associativity, over a
-- genuinely NON-associative base (non-vacuous). Reaches the e₂-mixing content Part B
-- could not.
#print axioms Phys.Cascade.CD.scal_im_assoc
#print axioms Phys.Cascade.CD.assoc_of_scaling
