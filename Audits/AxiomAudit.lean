/-
  Audits.AxiomAudit — foundations-only trust-base audit (docs/STANDARD.md §1.2).
  ===========================================================================
  `#print axioms` over EVERY banked production theorem. The gate (D6) parses this
  output and FAILS if any line shows an axiom outside the foundational trio
  {propext, Classical.choice, Quot.sound}. No theorem may rest on a posited
  assumption — the project's only posit is the fold, and it is a DEFINITION.
-/
import Phys.Foundation.Fold
import Phys.Foundation.Counting
import Phys.Foundation.CountingArith
import Phys.Foundation.IntegerTower
import Phys.Foundation.RationalTower
import Phys.Cascade.ComplexUnit
import Phys.Cascade.Double
import Phys.Cascade.Quaternion
import Phys.Cascade.Octonion
import Phys.Cascade.Sedenion
import Phys.Cascade.ForcedStop
import Phys.Algebra.Operator
import Phys.Algebra.GeneratedModule
import Phys.Algebra.JordanTower
import Phys.Algebra.Alternative
import Phys.Algebra.Derivation
import Phys.Algebra.DerivationDim
import Phys.Algebra.DerivationSkew
import Phys.Algebra.DerivationTraceFree
import Phys.Algebra.DerivationFinrank
import Phys.Algebra.DerivationLowerBound
import Phys.Algebra.DerivationUpperBound
import Phys.Algebra.DerivationBracket
import Phys.Algebra.DerivationStructureConstants
import Phys.Algebra.DerivationRep7
import Phys.Algebra.DerivationPerfect
import Phys.Algebra.DerivationCompact
import Phys.Algebra.HermitianJordan.Setup
import Phys.Algebra.HermitianJordan.Helpers
import Phys.Algebra.HermitianJordan.CompCentral
import Phys.Algebra.HermitianJordan.Linear
import Phys.Algebra.HermitianJordan.SinglePair
import Phys.Algebra.HermitianJordan.Building
import Phys.Algebra.HermitianJordan.Building2
import Phys.Algebra.HermitianJordan.Building3
import Phys.Algebra.HermitianJordan.Core
import Phys.Algebra.HermitianJordan.Reduction
import Phys.Algebra.HermitianJordan.PieceA
import Phys.Algebra.HermitianJordan.PieceB
import Phys.Algebra.HermitianJordan.PolarFirst
import Phys.Algebra.HermitianJordan.PieceBscale
import Phys.Algebra.HermitianJordan.PieceBdeg2
import Phys.Algebra.HermitianJordan.PieceBdeg1
import Phys.Algebra.HermitianJordan.PieceBfinal
import Phys.Foundation.DerivedSqrtTwo
import Phys.Foundation.ContinuumDerived
import Phys.Foundation.ContinuumField
import Phys.Foundation.ContinuumFieldMul
import Phys.Foundation.ContinuumFieldRing
import Phys.Foundation.ContinuumFieldInverse
-- N1 — THE FOLD (self-look-back) and its first forced property.
#print axioms Phys.Foundation.IsFold
#print axioms Phys.Foundation.fold_eq_neg
#print axioms Phys.Foundation.fold_unique
#print axioms Phys.Foundation.fold_void
#print axioms Phys.Foundation.fold_involutive
#print axioms Phys.Foundation.fold_self_blind
#print axioms Phys.Foundation.neg_isFold
#print axioms fold_char2_has_nonzero_fixed
#print axioms fold_nonzero_not_fixed

-- N7 — ℕ FROM THE FOLD (the bottom of the number tower): counting/arity as the
-- fold's own re-entry. The CONTENT ℕ derived, NO Mathlib number-system import.
-- `Re` the re-entry tower (carrier); Peano: `step_inj` (injective successor),
-- `step_ne_void` (0 not a successor), `step_ne_self` (no fixed point). The
-- universal property `iterate_unique` (Re IS the natural number object —
-- import-free certificate). `step_not_surjective` (Dedekind-infinite). The fold
-- binding: `foldOrbit_period_two` (the fold CLOSES the orbit, banked
-- fold_involutive) vs `count_transcends_fold_closure` (the count does NOT close).
#print axioms Phys.Foundation.Re
#print axioms Phys.Foundation.Re.step_inj
#print axioms Phys.Foundation.Re.step_ne_void
#print axioms Phys.Foundation.Re.step_ne_self
#print axioms Phys.Foundation.Re.iterate
#print axioms Phys.Foundation.Re.iterate_void
#print axioms Phys.Foundation.Re.iterate_step
#print axioms Phys.Foundation.Re.iterate_unique
#print axioms Phys.Foundation.Re.step_not_surjective
#print axioms Phys.Foundation.Re.foldOrbit
#print axioms Phys.Foundation.Re.foldOrbit_period_two
#print axioms Phys.Foundation.Re.count_transcends_fold_closure

-- N8 — ℤ FROM THE DERIVED ℕ (the number tower, rung 1): the additive (group) closure
-- of the derived counting `Re`. CountingArith equips the derived ℕ (`Re`) with its
-- commutative-semiring arithmetic (`Re.add`/`Re.mul` + laws + `commSemiring` +
-- `add_right_cancel` = cancellation, the property the group completion needs).
-- IntegerTower builds the CONTENT ℤ as the Grothendieck group completion `Z =
-- (Re×Re)/~`, negation = the SWAP = the fold's reflection (N1 `look x = -x`), carrying
-- a PROVED `CommRing`; the embedding `ofRe : Re ↪ Z` is an injective semiring hom, and
-- `Z` strictly extends `Re` with additive inverses (`-1` has no count preimage). NO
-- Mathlib number-system content import; the carrier is CONSTRUCTED from the derived `Re`.
-- The arithmetic of the derived ℕ (CountingArith):
#print axioms Phys.Foundation.Re.add
#print axioms Phys.Foundation.Re.mul
#print axioms Phys.Foundation.Re.add_comm
#print axioms Phys.Foundation.Re.add_assoc
#print axioms Phys.Foundation.Re.add_right_cancel
#print axioms Phys.Foundation.Re.add_left_cancel
#print axioms Phys.Foundation.Re.mul_comm
#print axioms Phys.Foundation.Re.mul_assoc
#print axioms Phys.Foundation.Re.left_distrib
#print axioms Phys.Foundation.Re.right_distrib
#print axioms Phys.Foundation.Re.commSemiring
-- The derived ℤ (IntegerTower):
#print axioms Phys.Foundation.intRel
#print axioms Phys.Foundation.intRel_trans
#print axioms Phys.Foundation.intSetoid
#print axioms Phys.Foundation.Z
#print axioms Phys.Foundation.Z.mk
#print axioms Phys.Foundation.Z.sound
#print axioms Phys.Foundation.Z.exact'
#print axioms Phys.Foundation.Z.add
#print axioms Phys.Foundation.Z.neg
#print axioms Phys.Foundation.Z.mul
#print axioms Phys.Foundation.Z.commRing
#print axioms Phys.Foundation.Z.ofRe
#print axioms Phys.Foundation.Z.ofRe_add
#print axioms Phys.Foundation.Z.ofRe_mul
#print axioms Phys.Foundation.Z.ofRe_injective
#print axioms Phys.Foundation.Z.exists_neg
#print axioms Phys.Foundation.Z.neg_one_not_ofRe
#print axioms Phys.Foundation.Z.neg_one_eq

-- N9 — ℚ FROM THE DERIVED ℤ (the number tower, rung 2): the multiplicative
-- (field-of-fractions) closure of the derived integers `Z`. RationalTower derives the
-- CONTENT ℚ as `Q = (Z × {nonzero Z})/~` (cross-multiplication), carrying a PROVED
-- `Field` whose ★ MULTIPLICATIVE INVERSE = THE SWAP (numerator ↔ denominator) = the
-- fold's reflection on the multiplicative pairs (the mirror of N8's additive swap). The
-- gating content — `Z` is an INTEGRAL DOMAIN — is DERIVED from counting's cancellation +
-- comparability (`Re.mul_cross_ne`, traced to `Re.add_right_cancel`/`step_inj`). The
-- embedding `ofZ : Z ↪ Q` is an injective ring hom, and ℚ STRICTLY extends `Z` with a
-- multiplicative inverse of 2 (`1/2` has NO count/integer preimage, by `Re` parity). NO
-- Mathlib number-system content import; the carrier is CONSTRUCTED from the derived `Z`.
-- The integral-domain content of counting (RationalTower, namespace Re):
#print axioms Phys.Foundation.Re.mul_ne_zero'
#print axioms Phys.Foundation.Re.add_comparable
#print axioms Phys.Foundation.Re.sub_exists_of_ne
#print axioms Phys.Foundation.Re.mul_cross_ne
#print axioms Phys.Foundation.Re.add_self_ne_step_add_self
-- The derived ℤ is an integral domain:
#print axioms Phys.Foundation.Z.one_ne_zero'
-- The derived ℚ (RationalTower):
#print axioms Phys.Foundation.NZ
#print axioms Phys.Foundation.ratRel
#print axioms Phys.Foundation.ratRel_trans
#print axioms Phys.Foundation.ratSetoid
#print axioms Phys.Foundation.Q
#print axioms Phys.Foundation.Q.mk
#print axioms Phys.Foundation.Q.sound
#print axioms Phys.Foundation.Q.exact'
#print axioms Phys.Foundation.Q.add
#print axioms Phys.Foundation.Q.neg
#print axioms Phys.Foundation.Q.mul
#print axioms Phys.Foundation.Q.commRing
#print axioms Phys.Foundation.Q.isField
#print axioms Phys.Foundation.Q.field
#print axioms Phys.Foundation.Q.ofZ
#print axioms Phys.Foundation.Q.ofZ_add
#print axioms Phys.Foundation.Q.ofZ_mul
#print axioms Phys.Foundation.Q.ofZ_injective
#print axioms Phys.Foundation.Q.half
#print axioms Phys.Foundation.Q.half_ne_zero
#print axioms Phys.Foundation.Q.half_mul_two
#print axioms Phys.Foundation.Q.half_not_ofZ

-- N10 — THE NUMBER TOWER'S ORDER (the ℝ rung's foundation): ≤ on the derived
-- ℕ→ℤ→ℚ, DERIVED from counting's comparability (`Re.add_comparable`), with NO
-- Mathlib Rat/Int/Nat ORDER as content. `Re.le`/`Re.linearOrder` — the order on
-- counting (the direction of re-entry; totality = banked comparability).
-- `Z.le`/`Z.linearOrder`/`Z.isStrictOrderedRing` — the derived ℤ as a strict
-- ordered ring (mul_pos from counting's no-zero-divisors). `Q.Nonneg` — the sign
-- predicate (num·den ≥ 0, well-defined because Z is an ordered domain).
-- `Q.le`/`Q.linearOrder`/`Q.isStrictOrderedRing` — ★★ the derived ℚ as a LINEARLY
-- ORDERED FIELD (with N9's Q.field), the ground the continuum is cut from.
#print axioms Phys.Foundation.Re.add_eq_zero
#print axioms Phys.Foundation.Re.linearOrder
#print axioms Phys.Foundation.Re.zero_le
#print axioms Phys.Foundation.Re.le_add_right
#print axioms Phys.Foundation.Z.linearOrder
#print axioms Phys.Foundation.Z.mul_pos
#print axioms Phys.Foundation.Z.isStrictOrderedRing
#print axioms Phys.Foundation.Q.Nonneg
#print axioms Phys.Foundation.Q.nonneg_total
#print axioms Phys.Foundation.Q.nonneg_add
#print axioms Phys.Foundation.Q.nonneg_mul
#print axioms Phys.Foundation.Q.eq_zero_of_nonneg_neg
#print axioms Phys.Foundation.Q.linearOrder
#print axioms Phys.Foundation.Q.mul_pos
#print axioms Phys.Foundation.Q.isStrictOrderedRing
#print axioms Phys.Foundation.Q.zero_lt_one'

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

-- N2d-MIDDLE-core THE POLARIZATION CORE — the FORWARD Hurwitz implication, closing the
-- forced iff. Multiplicativity of the self-overlap norm forces the LEFT SCALING LAW
-- (the clean Hurwitz chain: adjoint = centrality, P2 = multiplicativity, anisotropy =
-- Born positivity), whose reflection (Part C) forces base associativity. Assembled with
-- the banked forward half into the full forced equivalence; genNrm_not_mul_at_S recovered
-- as a corollary of the general law. The adjoint and anisotropy are DERIVED over the
-- doubled-base structure / discharged as a sum of squares — neither posited.
#print axioms Phys.Cascade.CD.mul_add_na
#print axioms Phys.Cascade.CD.Nrm_add_na
#print axioms Phys.Cascade.CD.bilin_add_left_na
#print axioms Phys.Cascade.CD.bilin_neg_left_na
#print axioms Phys.Cascade.CD.P2_na
#print axioms Phys.Cascade.CD.bilin_diag_na
#print axioms Phys.Cascade.CDcore.adjoint3
#print axioms Phys.Cascade.CDcore.Nrm_star3
#print axioms Phys.Cascade.CDcore.bilin_iotaNrm3
#print axioms Phys.Cascade.CDcore.bilin_L_zero
#print axioms Phys.Cascade.CDcore.scaling_of_H
#print axioms Phys.Cascade.CDcore.base_assoc_of_H
#print axioms Phys.Cascade.CDcore.comm_of_base_assoc
#print axioms Phys.Cascade.CDcore.Nrm_mul_iff_base_assoc
#print axioms Phys.Cascade.aniso_S2
#print axioms Phys.Cascade.Nrm_mul_iff_O_assoc
#print axioms Phys.Cascade.Nrm_not_mul_on_S

-- N3 — THE OPERATOR (CLIFFORD) STRUCTURE the terminal algebra forces (Algebra layer).
-- The terminal algebra's NON-associative product reorganizes into an ASSOCIATIVE operator
-- algebra (AddMonoid.End); the imaginary left-multiplication endomorphisms satisfy the
-- quadratic (Clifford) relation governed by the banked Born self-overlap form Nrm/bilin.
-- Derived FORWARD from the banked CD product + star (the LEFT SCALING LAW, hypothesis-free
-- on the octonion shape), never an imported Mathlib CliffordAlgebra/QuadraticForm. The form
-- is the banked bilin/Nrm, not a posited inner product.
#print axioms Phys.Algebra.scaling_law
#print axioms Phys.Algebra.iota_add
#print axioms Phys.Algebra.add_mul_na
#print axioms Phys.Algebra.L_sq_imag
#print axioms Phys.Algebra.clifford_imag
#print axioms Phys.Algebra.Lop
#print axioms Phys.Algebra.L_sq_op
#print axioms Phys.Algebra.clifford_op
#print axioms Phys.Algebra.unit_imag
#print axioms Phys.Algebra.Nrm_unit
#print axioms Phys.Algebra.iota_Nrm_unit
#print axioms Phys.Algebra.Lop_one
#print axioms Phys.Algebra.L_unit_sq
#print axioms Phys.Algebra.unit_imag'
#print axioms Phys.Algebra.bilin_units
#print axioms Phys.Algebra.units_anticommute
#print axioms Phys.Algebra.op_nonassoc

-- N4 — THE GENERATED OPERATOR ALGEBRA + the MODULE (SPINOR) structure (Algebra layer).
-- The imaginary left-multiplications generate a unital associative subring of End (the
-- operator/Clifford algebra) inside which they square to −1 and pairwise anticommute when
-- orthonormal under the banked Born self-overlap; the terminal algebra is a MODULE over it,
-- a generator acting as octonion left-multiplication. DERIVED forward from N3's Lop/clifford_op
-- + banked CD/star/bilin/Nrm, never an imported CliffordAlgebra/QuadraticForm. Concrete on the
-- terminal O ℚ at a full 7-element orthonormal imaginary basis (whole-basis square +
-- anticommutation relations) with gen genuinely non-commutative (anti-vacuity).
#print axioms Phys.Algebra.Lop_one'
#print axioms Phys.Algebra.Lop_zero
#print axioms Phys.Algebra.iota_one
#print axioms Phys.Algebra.iota_zero
#print axioms Phys.Algebra.unit_sq_op
#print axioms Phys.Algebra.ortho_anticomm_op
#print axioms Phys.Algebra.genSet
#print axioms Phys.Algebra.gen
#print axioms Phys.Algebra.Lop_mem_gen
#print axioms Phys.Algebra.genModule
#print axioms Phys.Algebra.gen_smul
#print axioms Phys.Algebra.gen_smul_Lop
#print axioms Phys.Algebra.anticomm_val_mem
#print axioms Phys.Algebra.clifford_in_gen
#print axioms Phys.Algebra.ebasis
#print axioms Phys.Algebra.ebasis_imag
#print axioms Phys.Algebra.ebasis_nrm
#print axioms Phys.Algebra.bilin_re_re
#print axioms Phys.Algebra.bilin_re_im
#print axioms Phys.Algebra.bilin_im_re
#print axioms Phys.Algebra.bilin_im_im
#print axioms Phys.Algebra.ortho_of_dot
#print axioms Phys.Algebra.ebasis_ortho
#print axioms Phys.Algebra.Lbasis_sq
#print axioms Phys.Algebra.Lbasis_anticomm
#print axioms Phys.Algebra.ebasis_mem_gen
#print axioms Phys.Algebra.gen_noncomm

-- N5 — THE HERMITIAN JORDAN TOWER AND ITS FORCED CAP (Algebra layer).
-- The self-adjoint matrices over the terminal algebra carry the symmetrized (Jordan)
-- product; the tower is CAPPED. The associative side has NO cap (special Jordan, any
-- order); the octonionic side FAILS at order 4 — and that order-4 failure is logically
-- EQUIVALENT to the non-associativity of 𝕆 (the SAME octonionic fact that stopped the
-- cascade, surfacing as a second termination — ONE CAUSE, MANY TERMINATIONS). Derived
-- FORWARD from the banked CD product + star; the witness defect is a single octonion-
-- product computation tracing to the cascade's own non-associating triple. NO Mathlib
-- JordanAlgebra/exceptional-algebra import asserting H₃(𝕆) IS the Albert algebra.
#print axioms Phys.Algebra.jordan_of_ring
#print axioms Phys.Algebra.jordan_of_assoc
#print axioms Phys.Algebra.jdef_witness
#print axioms Phys.Algebra.jordan_fails_H4
#print axioms Phys.Algebra.cap_forces_nonassoc
#print axioms Phys.Algebra.jordan_cap_iff_nonassoc
#print axioms Phys.Algebra.cap_from_cascade_stop

-- N5b — THE TERMINAL ALGEBRA'S ALTERNATIVITY (the cap's positive lever, Algebra layer).
-- The octonion shape 𝕆 = CD (CD B), though NON-associative, stays ALTERNATIVE: its
-- associator [x,y,z]=(x·y)·z−x·(y·z) is an ALTERNATING trilinear form (left/right-alt,
-- flexible, antisymmetric in each adjacent pair), and it satisfies the three Moufang
-- identities. DERIVED FORWARD from the banked CD product, never an imported Mathlib
-- alternative-/composition-algebra structure (the POSIT-vs-DERIVE moat). This is the
-- exact property the H₃ Jordan cap's positive edge (n ≤ 3) needs — the gap between
-- "alternative" (which 𝕆 keeps) and "associative" (which 𝕆 lost at the cascade stop).
-- Non-vacuous: the laws FAIL on the sedenion shape, and the associator is genuinely
-- nonzero on O ℚ (witness coordinate = 2).
#print axioms Phys.Algebra.mul_mul_left
#print axioms Phys.Algebra.mul_mul_right
#print axioms Phys.Algebra.mul_flex
#print axioms Phys.Algebra.mul_swap12
#print axioms Phys.Algebra.mul_swap23
#print axioms Phys.Algebra.moufang_left
#print axioms Phys.Algebra.moufang_right
#print axioms Phys.Algebra.moufang_mid
#print axioms Phys.Algebra.assoc
#print axioms Phys.Algebra.alt_left
#print axioms Phys.Algebra.alt_right
#print axioms Phys.Algebra.alt_flex
#print axioms Phys.Algebra.assoc_swap12
#print axioms Phys.Algebra.assoc_swap23
#print axioms Phys.Algebra.assoc_witness_coord
#print axioms Phys.Algebra.assoc_nonvanishing

-- N5b — THE HERMITIAN CARRIER (Setup): the general Hermitian 3×3 over the terminal
-- algebra O ℚ (real central diagonal `ocR`, conjugate-transpose octonion off-diagonals
-- `Hm`) on which the positive edge of the Jordan cap (n = 3) is to be assembled. The
-- carrier is the cascade's own octonion shape — no new posited algebra, no Mathlib
-- exceptional-/Jordan-algebra import (the POSIT-vs-DERIVE moat). The order-3 Jordan
-- identity itself (jdef_H3 = 0) is the heavy structural assembly childed onto the
-- chain tail; this banks the lever (Alternative) + carrier (Setup).
#print axioms Phys.Algebra.HJ.ocR
#print axioms Phys.Algebra.HJ.Hm

-- N5c — CENTRALITY OF THE REAL DIAGONAL (Helpers): the ground-ring embedding `ocR r`
-- COMMUTES and ASSOCIATES with all of O ℚ (and is self-adjoint), derived forward from the
-- banked CD product. One half of the exact relation set the entrywise Jordan-identity
-- assembly consumes — the other half being Alternative.lean's alternating-form laws. (The
-- structural numerics, workbench/N5-jordan-cap, establish that alternativity ALONE is NOT
-- sufficient; composition-centrality of the involution is also required — the classical
-- Jacobson statement. The full jdef_H3 = 0 assembly stays childed on the chain tail.)
#print axioms Phys.Algebra.HJ.ocR_comm
#print axioms Phys.Algebra.HJ.ocR_assocL
#print axioms Phys.Algebra.HJ.ocR_assocM
#print axioms Phys.Algebra.HJ.ocR_assocR
#print axioms Phys.Algebra.HJ.ocR_star

-- N5d — COMPOSITION-CENTRALITY OF THE INVOLUTION (CompCentral): the symmetric TRACE
-- `a + star a` and the NORM `a * star a` of the Cayley–Dickson involution are CENTRAL
-- (commute & associate in every position) in the octonion shape CD (CD B), the NORM
-- additionally being symmetric (`a * star a = star a * a`); plus the rank-2 Cayley–Hamilton
-- reduction `a*a + a*star a = (a + star a)*a` (degree-LOWERING). Derived forward from the
-- banked CD product, NO Mathlib composition-algebra import (the POSIT-vs-DERIVE moat). This
-- is the classical Jacobson/Schafer nuclear-involution ingredient (2) of the H₃ Jordan cap,
-- traced in-chain to N2's self-overlap norm / scaling law. (The structural numerics,
-- workbench/N5-jordan-cap, establish that the entry blocks do NOT vanish individually and
-- bridge across atom-multisets via the star→trace substitution + this CH degree-lowering,
-- so the closing route is a sequenced rewrite, NOT a flat alternating-law span. The full
-- jdef_H3 = 0 assembly stays childed on the chain tail.)
#print axioms Phys.Algebra.HJ.tr_comm
#print axioms Phys.Algebra.HJ.tr_assocL
#print axioms Phys.Algebra.HJ.tr_assocM
#print axioms Phys.Algebra.HJ.tr_assocR
#print axioms Phys.Algebra.HJ.nrm_comm
#print axioms Phys.Algebra.HJ.nrm_assocL
#print axioms Phys.Algebra.HJ.nrm_assocM
#print axioms Phys.Algebra.HJ.nrm_assocR
#print axioms Phys.Algebra.HJ.nrm_symm
#print axioms Phys.Algebra.HJ.sq_ch

-- N5e — LINEARITY OF THE JORDAN DEFECT (Linear): the symmetric Jordan bracket `jb` is
-- BIADDITIVE and the order-3 Jordan-identity defect `jdef` is ADDITIVE in its second
-- argument — pure structural matrix identities over a NonAssocRing coordinate algebra
-- (matrix distributivity + abel), no octonion-coordinate expansion. The reduction lever
-- (docs/RUNBOOK.md W1/W9): the real central diagonal of a Hermitian matrix peels off as a
-- separate centrally-vanishing summand, collapsing the cap to its zero-diagonal core.
#print axioms Phys.Algebra.HJ.jb_add_left
#print axioms Phys.Algebra.HJ.jb_add_right
#print axioms Phys.Algebra.HJ.jdef_add_right

-- N5e — THE POSITIVE-EDGE SINGLE-GENERATOR CASE (SinglePair): the FIRST proved instance
-- of the order-3 Jordan identity `jdef_H3 = 0`. The generic diagonal-entry workhorse
-- `central_diag` (over any NonAssocRing: a central `n` kills the single-generator Jordan
-- defect diagonal combination), and `jdef_single_pair` — for the zero-diagonal Hermitian
-- core carrying a SINGLE off-diagonal octonion generator, the order-3 Jordan identity
-- holds, closed by the involution's composition-centrality (banked `nrm_comm`/`nrm_assocM`/
-- `nrm_assocR`/`nrm_symm`) ALONE, NO alternativity, NO coordinate `ring`. The diagonal
-- half of the Jacobson nuclearity condition. The multi-generator entries (whose cross
-- terms require the alternating-form laws) are the heavy remainder, childed on the chain
-- tail.
#print axioms Phys.Algebra.HJ.central_diag
#print axioms Phys.Algebra.HJ.jdef_single_pair

-- N5f — THE MULTI-GENERATOR BUILDING BLOCK (Building): the heavy remainder of the order-3
-- Jordan identity. `ka` — the associator-transport lever valid over the alternative algebra
-- `CD (CD B)`: `[star x, star w, y·x] = [star x·star y, w, x]`, a small degree-3 identity
-- (NOT a brute coordinate `ring` on the full defect). `e22` — the (2,2) entry of the
-- building block `jdef (Xz a b c) (Xz p 0 0)` vanishes, closed as `2·ka(c,a,p) +
-- 2·ka(b, star a, star p)`. The building block is the single-second-generator summand of
-- the `jdef_add_right` split that reduces the general zero-diagonal core to single-generator
-- pieces (≤20 monomials/entry).
#print axioms Phys.Algebra.HJ.ka
#print axioms Phys.Algebra.HJ.e22

-- N5f — THE THREE MULTI-GENERATOR BUILDING BLOCKS (Building/Building2/Building3): the full
-- single-second-generator summands of the `jdef_add_right` split, each closed by the bounded
-- Cayley–Dickson coordinate route (≤20 octonion monomials/entry, NOT the dead brute route on
-- the full six-generator core). `bb1`/`bb2`/`bb3` — `jdef (Xz a b c) (Xz p 0 0) = 0`,
-- `jdef (Xz a b c) (Xz 0 q 0) = 0`, `jdef (Xz a b c) (Xz 0 0 r) = 0`.
#print axioms Phys.Algebra.HJ.bb1
#print axioms Phys.Algebra.HJ.bb2
#print axioms Phys.Algebra.HJ.bb3

-- N5f — THE ZERO-DIAGONAL CORE ASSEMBLY (Core): the cap's positive edge for the zero-diagonal
-- Hermitian core, ALL six off-diagonal generators present. `Xz_split` decomposes
-- `Xz p q r = Xz p 0 0 + Xz 0 q 0 + Xz 0 0 r` entrywise; `jdef_Xz_core` —
-- `jdef (Xz a b c) (Xz p q r) = 0` — assembles the three building blocks via the additive
-- split of the defect in its second argument (`jdef_add_right`). Structural reassembly only;
-- the heavy cross-terms are discharged inside the building blocks.
#print axioms Phys.Algebra.HJ.Xz_split
#print axioms Phys.Algebra.HJ.jdef_Xz_core

-- N5g — THE CENTRAL-DIAGONAL REDUCTION SPINE (Reduction): the structural levers that reduce
-- the GENERAL Hermitian pair to its zero-diagonal core. `jdef_master` — over ANY NonAssocRing,
-- the order-3 Jordan defect of `A` against a NUCLEAR matrix `E` is the COMMUTATOR `E·G − G·E`
-- with `G = A·{A,A} − {A,A}·A` (no alternativity, no coordinate expansion — the degree-3 defect
-- collapses against a nuclear argument to a single commutator). `Dg` — the real central diagonal
-- `diag(ocR eᵢ)`; `Dg_assocL/M/R` — it is NUCLEAR (associates in all three matrix positions),
-- derived entrywise from the banked `ocR_assocL/M/R` with `ocR` kept opaque (NOT the dead
-- coordinate expansion). Together: `jdef A (Dg …) = Dg·G_A − G_A·Dg`.
#print axioms Phys.Algebra.HJ.jdef_master
#print axioms Phys.Algebra.HJ.Dg
#print axioms Phys.Algebra.HJ.Dg_assocL
#print axioms Phys.Algebra.HJ.Dg_assocM
#print axioms Phys.Algebra.HJ.Dg_assocR

-- N5g — pieceA (PieceA): the CENTRAL-DIAGONAL DROP in the SECOND slot. `Gmat`/`assoc` — the
-- un-normalised cube-associator and the matrix associator; `gmat_drop_abstract` — the nuclear
-- part of a matrix drops out of its cube-associator (`Gmat (E+X) = Gmat X` for nuclear `E`,
-- because the matrix associator vanishes on any nuclear slot). `Hm_split` — `Hm = Dg + Xz`;
-- `gmat_Hm` — `Gmat (Hm) = Gmat (Xz)` (the real diagonal drops, `Dg` nuclear). `gxz_offdiag` —
-- the zero-diagonal cube-associator `Gmat (Xz)` is OFF-DIAGONAL-FREE (the single octonion
-- alternativity burden of pieceA, bounded per-entry octonion route, NOT the dead full-Hm route).
-- `diag_comm_offzero` — a central diagonal commutes with an off-diagonal-free matrix. Together:
-- `jdef_Hm_Dg` — `jdef (Hm …) (Dg …) = 0`, the order-3 Jordan defect of any general Hermitian
-- matrix against a real-diagonal Hermitian matrix vanishes, structurally (`ocR` opaque).
#print axioms Phys.Algebra.HJ.gmat_drop_abstract
#print axioms Phys.Algebra.HJ.Hm_split
#print axioms Phys.Algebra.HJ.gmat_Hm
#print axioms Phys.Algebra.HJ.gxz_offdiag
#print axioms Phys.Algebra.HJ.diag_comm_offzero
#print axioms Phys.Algebra.HJ.jdef_Hm_Dg

-- N5h — pieceB SPINE (PieceB): the FIRST-slot central-diagonal drop. `jdef_nuc_first` — over
-- ANY NonAssocRing, a NUCLEAR FIRST argument kills the entire order-3 Jordan defect
-- (`jdef E B = 0`); where a nuclear SECOND argument collapsed the defect to a commutator
-- (`jdef_master`), a nuclear FIRST argument collapses the whole cubic defect to zero. The
-- proof keeps the square `E·E` opaque (`generalize`) so the nuclearity rewrites cannot loop on
-- `E·E·E`. `jdef_Dg_Xz` — `jdef (Dg …) (Xz …) = 0`, the degree-3 (pure-diagonal) summand of
-- the first-slot drop, instantiating `jdef_nuc_first` at the nuclear real diagonal (`ocR`
-- opaque). The reusable degree-3 killer beneath the degree-1 polarization kernel.
#print axioms Phys.Algebra.HJ.jdef_nuc_first
#print axioms Phys.Algebra.HJ.jdef_Dg_Xz

-- `asw_star` — the octonion associator is PURE-IMAGINARY (star-skew): over `CD (CD B)`,
-- `assoc x y z + star (assoc x y z) = 0`. The structural lever for the `Dg`-degree-1
-- polarization kernel of the first-slot central-diagonal drop: its diagonal entries are
-- `2·([u,v,w] + star [u,v,w])` for octonion associators, hence zero. Bounded Cayley–Dickson
-- coordinate route (the `Alternative.lean` route), not a brute defect `ring`.
#print axioms Phys.Algebra.HJ.asw_star

-- N5i — pieceB POLARIZATION REDUCTION (PolarFirst): the FIRST-ARGUMENT polarization of the
-- order-3 defect. `jdef_polar_first` — over ANY NonAssocRing, the cubic-in-first-argument defect
-- of a sum splits as `jdef (D+X) Y = jdef X Y + jdef D Y + polarCross D X Y`, a pure biadditive
-- identity (`jb_add_left`/`jb_add_right` + `abel`; squares stay implicit, no coordinate/nuclearity).
-- `jdef_Hm_Xz_polar` — pieceB collapses to the polarization cross: against a zero-diagonal
-- Hermitian second argument, `jdef (Hm …) (Xz …) = polarCross (Dg …) (Xz …) (Xz …)`, because both
-- pure-cube pieces are banked zero (`jdef_Xz_core`, `jdef_Dg_Xz`). The genuine remaining octonionic
-- content of the first-slot drop, sharply isolated; `ocR` never enters coordinates.
#print axioms Phys.Algebra.HJ.jdef_polar_first
#print axioms Phys.Algebra.HJ.jdef_Hm_Xz_polar

-- N5j — pieceB SCALAR BUILDING BLOCKS (PieceBscale): the trunk-native frame the eight prior
-- coordinate runs missed. `ocR` is the SCALAR ring ℚ embedded onto the center of O ℚ: it is
-- MULTIPLICATIVE (`ocR_mul`) and ADDITIVE (`ocR_add`), preserves zero/one (`ocR_zero`,
-- `ocR_one_mul`). The real diagonal matrix `Dg`'s entries are exactly these central scalars
-- (`Dg00..Dg22 = ocR d_i`, off-diagonals zero). And the Jordan bracket against `Dg` is a
-- central-scalar HADAMARD SCALING of each entry (`jbDg_scale`): `(jb Dg M) i j = ocR(d_i+d_j)·M_ij`.
-- Pure bounded ground-ring identities, `ocR` transparent (numeric constant in the deepest slot).
#print axioms Phys.Algebra.HJ.ocR_mul
#print axioms Phys.Algebra.HJ.ocR_add
#print axioms Phys.Algebra.HJ.ocR_zero
#print axioms Phys.Algebra.HJ.ocR_one_mul
#print axioms Phys.Algebra.HJ.Dg00
#print axioms Phys.Algebra.HJ.Dg11
#print axioms Phys.Algebra.HJ.Dg22
#print axioms Phys.Algebra.HJ.Dg01
#print axioms Phys.Algebra.HJ.Dg02
#print axioms Phys.Algebra.HJ.Dg10
#print axioms Phys.Algebra.HJ.Dg12
#print axioms Phys.Algebra.HJ.Dg20
#print axioms Phys.Algebra.HJ.Dg21
#print axioms Phys.Algebra.HJ.jbDg_scale

-- N5j — pieceB DEGREE-2 HALF (PieceBdeg2): the SCALAR-MODULE DISSOLUTION (docs/STANDARD.md THE
-- ONE LAW; docs/RUNBOOK.md W1 "Mathlib lacks it → BUILD it"). The eight prior runs (64–78) died
-- grinding a looping `ocR`-canonicalizer; the fix is to recognize `ocR d_k` as SCALARS. `qMod` —
-- the ℚ-module action `r • x := ocR r * x` on O ℚ (built; no such instance existed), its axioms
-- the banked centrality/nuclearity of `ocR`. `tr_l`/`tr_r`/`tr_sl`/`tr_sr` — transport every
-- `ocR`-factor out to a ℚ-scalar action. `polarCross2_Dg_Xz` — ★★ the degree-2 part of the pieceB
-- polarization cross vanishes (`polarCross2 (Dg) (Xz) (Xz) = 0`), closed entrywise: distribute,
-- transport scalars, and `module` discharges the ℚ-linear octonion-monomial identity — the
-- scalars canonicalize themselves by the module axioms. Closes by CENTRALITY alone, no
-- alternativity (the "cheap structural half"; verified 40/40 in the faithful octonion model).
#print axioms Phys.Algebra.HJ.qMod
#print axioms Phys.Algebra.HJ.tr_l
#print axioms Phys.Algebra.HJ.tr_r
#print axioms Phys.Algebra.HJ.tr_sl
#print axioms Phys.Algebra.HJ.tr_sr
#print axioms Phys.Algebra.HJ.polarCross2_Dg_Xz

-- N5j — pieceB DEGREE-1 HALF, STRUCTURAL CORE (PieceBdeg1): the UNIT-DIAGONAL DISSOLUTION
-- (docs/STANDARD.md THE ONE LAW; docs/RUNBOOK.md W1 "BUILD it", W9). The degree-1 part of the
-- pieceB polarization cross is the genuine octonionic ALTERNATIVITY kernel; eight prior runs
-- (64–78) died grinding a looping `ocR`-canonicalizer on the OPAQUE real diagonal `Dg d0 d1 d2`.
-- The fix: `polarCross1` is ℚ-LINEAR in its diagonal argument, so the opaque-`ocR` content reduces
-- to the diagonal's value at the three UNIT positions `Du0/Du1/Du2 = diagonal eᵢ` — where the
-- coordinate is a literal `1`, no `ocR` appears, and the alternativity kernel becomes a concrete
-- Cayley–Dickson coordinate identity `ring` discharges over the commutative ground. `polarCross1_Du0`
-- /`_Du1`/`_Du2` — ★ the polarization cross's degree-1 part vanishes at each unit diagonal.
#print axioms Phys.Algebra.HJ.polarCross1_Du0
#print axioms Phys.Algebra.HJ.polarCross1_Du1
#print axioms Phys.Algebra.HJ.polarCross1_Du2

-- N5j — pieceB CLOSED + THE FULL CAP ASSEMBLED (PieceBfinal): the CAP'S POSITIVE EDGE. The real
-- diagonal decomposes as a ℚ-linear combination of the three UNIT diagonals (`Dg_eq_smul`), so by
-- the ℚ-linearity of `polarCross1` in its diagonal argument (`pc1_add_left`, `pc1_smul_left`, on
-- the banked `qMod` scalar tower `jb_smul_left`/`jb_smul_right`) the degree-1 cross at the OPAQUE
-- real diagonal reduces to the three banked unit-diagonal vanishings: ★★ `polarCross1_Dg_Xz`
-- (`polarCross1 (Dg) (Xz) (Xz) = 0`, the alternativity kernel closed; the eight-run instrument wall
-- dissolved by linearity). ★★ `jdef_Hm_Xz` (`jdef (Hm) (Xz p q r) = 0`, pieceB: the order-3 Jordan
-- defect of a general Hermitian against a zero-diagonal off-part, via `jdef_Hm_Xz_polar` +
-- `polarCross_split` + pc1=0 + pc2=0). ★★ `jdef_H3` (`jdef (Hm…) (Hm…) = 0`, THE CAP'S POSITIVE
-- EDGE for the GENERAL Hermitian pair over O ℚ, via `jdef_add_right` along `Hm_split` + pieceA
-- `jdef_Hm_Dg` + pieceB `jdef_Hm_Xz` — structural matrix arithmetic, no octonion-coordinate `ring`
-- on the full defect). ★★★ `jordan_cap_pinned_at_three` (the n=3 success `jdef_H3` ∧ the banked n=4
-- failure `jordan_fails_H4` — the Jordan cap value 3 is FORCED, the exact gap between alternativity
-- and associativity, the SAME octonionic non-associativity driving both: ONE CAUSE, the cap).
#print axioms Phys.Algebra.HJ.jb_smul_left
#print axioms Phys.Algebra.HJ.jb_smul_right
#print axioms Phys.Algebra.HJ.pc1_smul_left
#print axioms Phys.Algebra.HJ.pc1_add_left
#print axioms Phys.Algebra.HJ.Dg_eq_smul
#print axioms Phys.Algebra.HJ.polarCross1_Dg_Xz
#print axioms Phys.Algebra.HJ.jdef_Hm_Xz
#print axioms Phys.Algebra.HJ.jdef_H3
#print axioms Phys.Algebra.HJ.jordan_cap_pinned_at_three


-- N10 — THE √2 OBSTRUCTION RE-GROUNDED ONTO THE DERIVED ℚ (`Phys.Foundation.Q`, N9).
-- The analytic obstruction `no_rat_sq_two` (above, over imported ℚ) re-derived over the DERIVED
-- ℚ, with NO `import Mathlib.Data.{Nat,Int,Rat,Real}` as content. By infinite descent on counting
-- (`Re`): `Re.even_or_odd` (counting's parity), `Re.no_sq_two_bounded`/`Re.no_sq_two` (★ THE
-- DESCENT — no count solves `a²=2b²` nontrivially, bounded induction + parity, no well-founded
-- recursion, no Mathlib `Rat.den`), lifted to the derived ℤ (`Z.no_sq_two_Z` — squaring kills the
-- sign) and the derived ℚ (★★ `Q.no_q_sq_two` — no derived rational squares to 2). The exact
-- analytic gap N6's continuum is built to fill, now over the derived ground.
#print axioms Phys.Foundation.Re.even_or_odd
#print axioms Phys.Foundation.Re.no_sq_two_bounded
#print axioms Phys.Foundation.Re.no_sq_two
#print axioms Phys.Foundation.Z.no_sq_two_Z
#print axioms Phys.Foundation.Q.no_q_sq_two

-- N10 — THE CONTINUUM RE-GROUNDED ONTO THE DERIVED ℚ (`Phys.Foundation.ContinuumDerived`).
-- The entire N6-pre continuum construction (obstruction half `Continuum.lean` + resolution
-- half `CompletionContinuum.lean`, both over IMPORTED ℚ) re-stated with the ground type = the
-- DERIVED ℚ (`Phys.Foundation.Q`, a LINEARLY ORDERED FIELD via OrderedTower + N9 Q.field), with
-- NO Mathlib number-system content import, NO posited ℝ. EXACTLY ONE step is not verbatim: the
-- analytic obstruction `no_rat_sq_two` (Mathlib `Rat.den_pow`) is replaced by the banked
-- `Q.no_q_sq_two`. Everything else ports verbatim. The ℝ rung's order-completeness now rests on
-- the FOLD, not on imported `Rat`. ★★ `completion_coherence_closed` (Dedekind completeness over
-- the derived ground); ★ `sqrt2`/`sqrt2_not_rational`/`sqrt2_fills_gap` (the derived √2 as a new
-- completion element, not rational over the DERIVED ℚ).
#print axioms Phys.Foundation.ContinuumQ.sqrtTwoGather_isGather
#print axioms Phys.Foundation.ContinuumQ.sqrtTwoGather_not_coherent
#print axioms Phys.Foundation.ContinuumQ.ground_not_coherence_closed
#print axioms Phys.Foundation.ContinuumQ.Cut.le_total
#print axioms Phys.Foundation.ContinuumQ.completion_coherence_closed
#print axioms Phys.Foundation.ContinuumQ.coherent_gather
#print axioms Phys.Foundation.ContinuumQ.sqrt2
#print axioms Phys.Foundation.ContinuumQ.sqrt2_not_rational
#print axioms Phys.Foundation.ContinuumQ.sqrt2_fills_gap

-- N11 — THE ℝ RUNG'S FIELD OPERATIONS, INCREMENT 1: THE ADDITIVE ORDERED GROUP on the
-- DERIVED-ℚ completion `ContinuumQ.Cut` (`Phys.Foundation.ContinuumField`). NO posited ℝ,
-- NO Mathlib number-system content import. INC-0: the derived ℤ/ℚ are ARCHIMEDEAN, derived
-- from counting (`Re.toNat`), NOT imported — the prerequisite for the cut additive inverse.
-- INC-1: cut addition = the gather of pairwise sums; negation = the fold's reflection (reflect
-- the upper complement); ★★ `add_neg_self` (`x+(-x)=0`, the eternal approach / Archimedean made
-- load-bearing via `approx`); `AddCommGroup Cut`; `LinearOrder Cut` (upgrading the banked
-- PartialOrder via `Cut.le_total`); `IsOrderedAddMonoid Cut` (order-compatible +). NON-VACUITY:
-- the embedding `Qcut` is an additive strictly-monotone hom, and the derived √2 is a strictly
-- positive new element (`zero_lt_sqrt2`).
#print axioms Phys.Foundation.Z.ofRe_eq_natCast
#print axioms Phys.Foundation.Z.instArchimedean
#print axioms Phys.Foundation.Q.instArchimedean
#print axioms Phys.Foundation.ContinuumQ.addGather
#print axioms Phys.Foundation.ContinuumQ.negGather
#print axioms Phys.Foundation.ContinuumQ.approx
#print axioms Phys.Foundation.ContinuumQ.add_neg_self
#print axioms Phys.Foundation.ContinuumQ.add_comm'
#print axioms Phys.Foundation.ContinuumQ.add_assoc'
#print axioms Phys.Foundation.ContinuumQ.zero_add'
#print axioms Phys.Foundation.ContinuumQ.addCommGroup
#print axioms Phys.Foundation.ContinuumQ.linearOrder
#print axioms Phys.Foundation.ContinuumQ.add_le_add_right'
#print axioms Phys.Foundation.ContinuumQ.Qcut_add
#print axioms Phys.Foundation.ContinuumQ.Qcut_strictMono
#print axioms Phys.Foundation.ContinuumQ.zero_lt_sqrt2

-- N12 — THE ℝ RUNG'S FIELD OPERATIONS, INCREMENT 2: THE POSITIVE-CONE MULTIPLICATION
-- on the DERIVED-ℚ completion `ContinuumQ.Cut` + THE CAPSTONE `√2·√2 = 2`
-- (`Phys.Foundation.ContinuumFieldMul`). NO posited ℝ, NO Mathlib number-system content
-- import. THE POSITIVE CONE is the trunk's Born = self-overlap = POSITIVITY one level up:
-- `pmul` = the gather of pairwise products of NONNEGATIVE approximants (a genuine cut for
-- all x,y); sign-extended to `Mul Cut` via the banked negation + `LinearOrder Cut`; `One`
-- = `Qcut 1`. ★★ THE CAPSTONE `pmul_sqrt2_sqrt2`/`sqrt2_mul_sqrt2` (`√2·√2 = Qcut 2`):
-- the analytic gap N6 forced (`x²=2` has NO solution in the derived ℚ — banked
-- `Q.no_q_sq_two`) is SOLVED in the completion. The C6 eternal approach is load-bearing
-- a second time — `sq_dense` (density of rational squares below 2) iterates the HERON
-- mediant step whose gap CONTRACTS geometrically (`heron_gap`, `(2/9)ⁿ`), closed by the
-- banked `Q.instArchimedean`. The completion strictly extends the derived ℚ AND closes
-- the square the ground could not.
#print axioms Phys.Foundation.ContinuumQ.mulNonnegGather
#print axioms Phys.Foundation.ContinuumQ.pmul
#print axioms Phys.Foundation.ContinuumQ.pmul_comm
#print axioms Phys.Foundation.ContinuumQ.instMul
#print axioms Phys.Foundation.ContinuumQ.instOne
#print axioms Phys.Foundation.ContinuumQ.mul_of_nonneg
#print axioms Phys.Foundation.ContinuumQ.sqrt2_S_nonneg
#print axioms Phys.Foundation.ContinuumQ.heron_inv
#print axioms Phys.Foundation.ContinuumQ.heron_gap
#print axioms Phys.Foundation.ContinuumQ.sq_dense
#print axioms Phys.Foundation.ContinuumQ.pmul_sqrt2_sqrt2
#print axioms Phys.Foundation.ContinuumQ.sqrt2_mul_sqrt2

-- N13 — THE ℝ RUNG'S FIELD OPERATIONS, INCREMENT 3: THE COMMUTATIVE RING `CommRing Cut`
-- on the DERIVED-ℚ completion `ContinuumQ.Cut` (`Phys.Foundation.ContinuumFieldRing`). NO
-- posited ℝ, NO Mathlib number-system content import. The ring laws are GENUINE content
-- proved ON THE POSITIVE CONE (Born = self-overlap = positivity): `pmul_assoc_cone`,
-- ★ `pmul_distrib_cone` (the fiddliest Dedekind-reals law, kept tractable by the cone),
-- `pmul_one_cone`. The SIGN EXTENSION (banked `instMul`) reduces every product to the cone
-- via the banked NEGATION (the fold's reflection) + `LinearOrder Cut`; the sign-homomorphism
-- laws `neg_mul`/`mul_neg` collapse the sign explosion, lifting each cone law to all of `Cut`.
-- ★ `commRing` (CommRing Cut). `zero_ne_one'` (the ring is non-trivial). Built on the banked
-- `addCommGroup` (the additive half) + the cone ring laws lifted through the sign homomorphism.
#print axioms Phys.Foundation.ContinuumQ.zero_le_pmul
#print axioms Phys.Foundation.ContinuumQ.pmul_zero
#print axioms Phys.Foundation.ContinuumQ.pmul_one_cone
#print axioms Phys.Foundation.ContinuumQ.pmul_assoc_cone
#print axioms Phys.Foundation.ContinuumQ.pmul_distrib_cone
#print axioms Phys.Foundation.ContinuumQ.neg_mul
#print axioms Phys.Foundation.ContinuumQ.mul_neg
#print axioms Phys.Foundation.ContinuumQ.mul_comm'
#print axioms Phys.Foundation.ContinuumQ.mul_assoc'
#print axioms Phys.Foundation.ContinuumQ.left_distrib'
#print axioms Phys.Foundation.ContinuumQ.right_distrib'
#print axioms Phys.Foundation.ContinuumQ.commRing
#print axioms Phys.Foundation.ContinuumQ.zero_ne_one'

-- N13 — THE ℝ RUNG'S FIELD OPERATIONS, INCREMENT 4: THE MULTIPLICATIVE INVERSE →
-- `Field Cut` + `IsStrictOrderedRing Cut` on the DERIVED-ℚ completion `ContinuumQ.Cut`
-- (`Phys.Foundation.ContinuumFieldInverse`). NO posited ℝ, NO Mathlib number-system
-- content import. The INVERSE of a positive cut is the REFLECT-AND-RECIPROCATE set
-- `pinvS` (the multiplicative SWAP one level up, mirroring N9's q/p swap = the fold's
-- reflection on the multiplicative pairs). The cancellation `pmul x (pinv x) = 1` is
-- where the C6 ETERNAL APPROACH becomes load-bearing a THIRD time — the multiplicative
-- approximation `mul_approx` (the ratio a/r of an interior point to an exterior bound
-- approaches 1, forced past any t<1 by the banked Archimedean `approx` lever). The sign
-- extension (banked negation = the fold's reflection) carries the inverse to all nonzero
-- cuts ⟹ ★★ `isField`/`field` (Field Cut). `mul_pos` (the positive cone is closed under
-- the product — Born = self-overlap = positivity as an ORDER fact) ⟹ ★★ `isStrictOrderedRing`
-- (IsStrictOrderedRing Cut). With the banked Dedekind completeness, the completion is a
-- LINEARLY ORDERED FIELD WITH THE LUB PROPERTY — the ℝ rung, over the derived ℚ.
-- `sqrt2_inv_mul_sqrt2` (the field inverts the very irrational the ground was forced to miss).
#print axioms Phys.Foundation.ContinuumQ.pinv
#print axioms Phys.Foundation.ContinuumQ.pinvGather
#print axioms Phys.Foundation.ContinuumQ.zero_le_pinv
#print axioms Phys.Foundation.ContinuumQ.mul_approx
#print axioms Phys.Foundation.ContinuumQ.pmul_pinv_cancel
#print axioms Phys.Foundation.ContinuumQ.mul_pinv_cancel
#print axioms Phys.Foundation.ContinuumQ.isField
#print axioms Phys.Foundation.ContinuumQ.field
#print axioms Phys.Foundation.ContinuumQ.mul_pos
#print axioms Phys.Foundation.ContinuumQ.isStrictOrderedRing
#print axioms Phys.Foundation.ContinuumQ.sqrt2_inv_mul_sqrt2

-- N6 — THE DERIVATION (infinitesimal automorphism) LIE ALGEBRA of the terminal algebra
-- `𝕆 = CD (CD B)` (`Phys.Algebra.Derivation`). The FIRST physics-recognized (Emergent-layer)
-- structure: the Leibniz-derivations of the terminal algebra form a LIE ALGEBRA under the
-- commutator bracket, non-trivially. DERIVED FORWARD from the banked `CD` product + the
-- Leibniz law (NO Mathlib `Derivation`/`LieAlgebra`-on-𝕆/`G₂` import that would ASSERT 𝕆's
-- derivations ARE a Lie algebra / are g₂ — the posit-vs-derive moat). ★★ `isDeriv_bracket`
-- (the commutator of two derivations is again a derivation) uses ONLY Leibniz + biadditivity
-- + distributivity — NOT associativity of 𝕆, which is exactly why the structure survives on
-- the non-associative terminal algebra. `derivation` (Der(𝕆) as a LieSubalgebra of the
-- machinery Lie algebra Module.End ℤ 𝕆) inherits LieRing + LieAlgebra ℤ; the three defining
-- laws are exposed as `deriv_lie_add_left`/`deriv_lie_add_right` (BILINEAR), `deriv_lie_self`
-- (ALTERNATING), `deriv_lie_jacobi` (JACOBI). NON-VACUITY (W8): `witnessDeriv` = the lift of
-- the inner derivation `ad_{e₂}` (imaginary generator of the associative base H ℚ) is a
-- concrete NONZERO derivation on O ℚ — nonzero THEORY-NATIVELY (e₂ and ιJ do not commute,
-- banked iota_e2_comm_iff + J_ne_star_J), so `derivation_nontrivial`/`derivation_ne_bot`.
#print axioms Phys.Algebra.IsDeriv
#print axioms Phys.Algebra.isDeriv_zero
#print axioms Phys.Algebra.isDeriv_add
#print axioms Phys.Algebra.isDeriv_neg
#print axioms Phys.Algebra.isDeriv_smul
#print axioms Phys.Algebra.isDeriv_bracket
#print axioms Phys.Algebra.derivation
#print axioms Phys.Algebra.mem_derivation
#print axioms Phys.Algebra.deriv_lie_add_left
#print axioms Phys.Algebra.deriv_lie_add_right
#print axioms Phys.Algebra.deriv_lie_self
#print axioms Phys.Algebra.deriv_lie_jacobi
#print axioms Phys.Algebra.liftEnd
#print axioms Phys.Algebra.liftEnd_apply
#print axioms Phys.Algebra.liftEnd_isDeriv
#print axioms Phys.Algebra.adHom
#print axioms Phys.Algebra.adHom_apply
#print axioms Phys.Algebra.adHom_isDeriv
#print axioms Phys.Algebra.adHom_star_comm
#print axioms Phys.Algebra.innerDeriv
#print axioms Phys.Algebra.innerDeriv_isDeriv
#print axioms Phys.Algebra.innerDeriv_apply
#print axioms Phys.Algebra.e2_imag_H
#print axioms Phys.Algebra.witnessDeriv
#print axioms Phys.Algebra.witnessDeriv_isDeriv
#print axioms Phys.Algebra.adHom_e2_iotaJ_ne_zero
#print axioms Phys.Algebra.witnessDeriv_iotaiotaJ_ne_zero
#print axioms Phys.Algebra.witnessDeriv_ne_zero
#print axioms Phys.Algebra.derivation_nontrivial
#print axioms Phys.Algebra.derivation_ne_bot

-- N16 — TOWARD THE DIMENSION / g₂ CHARACTERIZATION of Der(O ℚ) (`Phys.Algebra.DerivationDim`).
-- The structural CORE of the deeper claim N6 deferred: the constraints EVERY Leibniz-derivation
-- of the terminal algebra satisfies, derived FORWARD from the banked `IsDeriv` predicate, NO
-- posited `G₂` import (the posit-vs-derive moat). `deriv_one`: every derivation kills the unit
-- (`D 1 = 0`, pure Leibniz + the unit law, no associativity, no coordinates) — the first
-- structural reduction cutting Der(𝕆) toward g₂ (a derivation is determined by its action on
-- the imaginary subspace). `witnessDeriv_one`: the banked NONZERO witness (N6) kills the unit.
-- Confirmed by faithful exact-rational numerics: dim_ℚ Der(O ℚ) = 14 (the exact 512×64 ℚ-rank
-- count + the explicit g₂ basis/bracket + the ≅ g₂ Lie isomorphism are the W9-prime dissolution
-- child, NOT this node).
#print axioms Phys.Algebra.deriv_one
#print axioms Phys.Algebra.witnessDeriv_one

-- N17 — THE ℚ-MODULE STRUCTURE + the structural reduction `Der(O ℚ) ⊆ so(Born)` (`Phys.Algebra.DerivationSkew`).
-- N16 W3-scoped these to the dissolution child. The ℚ-MODULE structure on the terminal algebra
-- (`instModuleQO` — machinery on the DERIVED object, NOT a posited number system, STANDARD §3),
-- every ℤ-derivation is ℚ-linear (`deriv_qsmul`), `D (star x) = −D x` (`deriv_star`), a derivation
-- kills every self-conjugate/real element (`deriv_real_zero`), and ★★ the SKEW-ADJOINTNESS
-- `D x · star x = x · D x` (`deriv_norm_preserve`) = the containment `Der ⊆ so(Born) = so(7)`,
-- derived COORDINATE-FREE via the trunk (the Born self-overlap `x · star x` is self-conjugate, so a
-- derivation kills it) — the W9 monolithic 8-coordinate rank entirely AVOIDED. Polarized
-- (`deriv_skew_polar`) and non-vacuous on the banked nonzero witness (`witnessDeriv_skew`). NO
-- posited `G₂`/`LieAlgebra.g2` import. The exact `dim = 14` (so(7)→g₂ cut) + the ≅ g₂ Lie
-- isomorphism are the W9-prime dissolution child, NOT this node.
#print axioms Phys.Algebra.instModuleQO
#print axioms Phys.Algebra.deriv_qsmul
#print axioms Phys.Algebra.trace_id
#print axioms Phys.Algebra.deriv_star
#print axioms Phys.Algebra.deriv_real_zero
#print axioms Phys.Algebra.selfMul_selfconj
#print axioms Phys.Algebra.deriv_norm_preserve
#print axioms Phys.Algebra.deriv_skew_polar
#print axioms Phys.Algebra.witnessDeriv_skew

-- N18 — THE TRACE-FREE / Im-PRESERVING REFINEMENT of `Der(O ℚ) ⊆ so(Born)` (`Phys.Algebra.DerivationTraceFree`).
-- Completes the QUALITATIVE so(7) characterization: N16 banked `D 1 = 0`, N17 banked the
-- skew-adjointness (`Der ⊆ so(7)`); N18 banks the two remaining structural constraints the
-- exact-rational numerics record for every derivation — (3) TRACE-FREE (`reQ (D x) = 0`,
-- `deriv_reQ_zero` / `deriv_maps_im`: every derivation maps `O` into the 7-dim imaginary
-- subspace) and (4) COMMUTES WITH CONJUGATION (`deriv_comm_star`) — derived COORDINATE-FREE
-- from the banked skew reduction via the Jordan/Born anticommutation `deriv_jordan_anticomm`
-- + the trace identity, NO fully-expanded-octonion-coordinate rank (the W9 monolith AVOIDED),
-- NO posited `G₂`/`LieAlgebra.g2` import. Non-vacuous on the banked nonzero witness
-- (`witnessDeriv_reQ_zero`/`witnessDeriv_maps_im`/`witnessDeriv_comm_star`). The exact
-- `dim = 14` (so(7)→g₂ cut 21→14, needing finrank infra) + the ≅ g₂ Lie isomorphism are the
-- W9-prime dissolution child N19, NOT this node.
#print axioms Phys.Algebra.deriv_jordan_anticomm
#print axioms Phys.Algebra.deriv_reflect
#print axioms Phys.Algebra.deriv_re_smul_zero
#print axioms Phys.Algebra.deriv_reQ_zero_imag
#print axioms Phys.Algebra.deriv_reQ_zero
#print axioms Phys.Algebra.deriv_maps_im
#print axioms Phys.Algebra.deriv_comm_star
#print axioms Phys.Algebra.witnessDeriv_reQ_zero
#print axioms Phys.Algebra.witnessDeriv_maps_im
#print axioms Phys.Algebra.witnessDeriv_comm_star

-- N19 — THE FINITE-DIMENSIONALITY SCAFFOLD on `O ℚ` + `Der(O ℚ)` as a ℚ-submodule
-- (`Phys.Algebra.DerivationFinrank`). The PREREQUISITE INFRA the exact dim count needs
-- (N18 FINDINGS flagged it as "the real first blocker"): the terminal algebra is an
-- 8-dimensional ℚ-vector space (`finrank_O_eq_eight`, derived STRUCTURALLY through the
-- product equivalences `cdProdEquiv`/`dblProdEquiv` 2→4→8, NO coordinate basis matrix —
-- the W9 expansion avoided), its endomorphism ring is 64-dimensional, and `Der(O ℚ)` is
-- realized as a finite-dimensional ℚ-submodule `derivationQ` of `Module.End ℚ (O ℚ)` —
-- making `Module.finrank ℚ derivationQ` a well-typed natural number with proved bounds
-- `1 ≤ dim_ℚ Der(O ℚ) ≤ 64` (`finrank_derivationQ_pos` nonzero via the banked nonzero
-- witness, `finrank_derivationQ_le`). NO posited `G₂`/`LieAlgebra.g2` import. The exact
-- `dim = 14` (lower bound: 14 explicit derivations; upper bound: the so(7)→g₂ cut 21→14,
-- the rep-theoretic W9-prime half) + the ≅ g₂ structure are the dissolution child N20.
#print axioms Phys.Algebra.dblProdEquiv
#print axioms Phys.Algebra.cdProdEquiv
#print axioms Phys.Algebra.instFiniteO
#print axioms Phys.Algebra.finrank_dbl_eq_two
#print axioms Phys.Algebra.finrank_H_eq_four
#print axioms Phys.Algebra.finrank_O_eq_eight
#print axioms Phys.Algebra.finrank_End_eq_64
#print axioms Phys.Algebra.qsmul_mul_left
#print axioms Phys.Algebra.qsmul_mul_right
#print axioms Phys.Algebra.derivationQ
#print axioms Phys.Algebra.finrank_derivationQ_le
#print axioms Phys.Algebra.toEndQ
#print axioms Phys.Algebra.toEndQ_isDerivQ
#print axioms Phys.Algebra.toEndQ_mem
#print axioms Phys.Algebra.witnessDerivQ_isDerivQ
#print axioms Phys.Algebra.witnessDerivQ_mem
#print axioms Phys.Algebra.witnessDerivQ_ne_zero
#print axioms Phys.Algebra.derivationQ_ne_bot
#print axioms Phys.Algebra.finrank_derivationQ_pos

-- N19 (L) — THE LOWER BOUND `14 ≤ dim_ℚ Der(O ℚ)` (`Phys.Algebra.DerivationLowerBound`).
-- The well-typed scaffold bound `1 ≤ dim` is sharpened to the EXACT `≥ 14` by EXHIBITING
-- 14 explicit linearly-independent derivations of the terminal algebra — the explicit
-- integer-sparse nullbasis of the Leibniz ℚ-system (workbench/N16-g2-dimension, re-verified
-- exact-rational every node N16–N19). Each `DkE` is a `Module.End ℚ (O ℚ)` proved to satisfy
-- the Leibniz law (`DkE_isDerivQ`); the 14 are linearly independent via the DIAGONAL-FUNCTIONAL
-- route (each has a coordinate where it is the unique nonzero, so the read-off functionals form
-- a negated identity — NO 14×14 determinant, the W9.4 structure-over-expansion reframe); their
-- span sits in `derivationQ`, so `Submodule.finrank_mono` gives `14 ≤ finrank ℚ derivationQ`.
-- Forward, NO posited `G₂`/`LieAlgebra.g2`. The matching upper bound `≤ 14` (the so(7)→g₂ cut
-- 21→14) + the ≅ g₂ structure are the dissolution child N20.
#print axioms Phys.Algebra.D0E_isDerivQ
#print axioms Phys.Algebra.D7E_isDerivQ
#print axioms Phys.Algebra.D13E_isDerivQ
#print axioms Phys.Algebra.Dvec_linearIndependent
#print axioms Phys.Algebra.Dvec_mem
#print axioms Phys.Algebra.finrank_derivationQ_ge_14

-- N20 (U) — THE UPPER BOUND `dim_ℚ Der(O ℚ) ≤ 14` ⟹ THE EXACT `= 14`
-- (`Phys.Algebra.DerivationUpperBound`). The so(7)→g₂ cut 21→14, derived FORWARD.
-- A derivation is DETERMINED by its three generator values `D e1, D e2, D e4`
-- (`determined`: the octonion shape is multiplicatively generated by e1,e2,e4 with
-- e3=e1·e2, e5=e1·e4, e6=e2·e4, e7=e3·e4). Each `D ei` is trace-free (banked N18
-- `deriv_reQ_zero`, here `derivQ_reQ_zero`), so the naive count is 3×7=21; the
-- Leibniz law on the generator products imposes EXACTLY the 7 structural cut
-- constraints (`cut_e1_c1`/`cut_e2_c2`/`cut_e4_c4` the diagonal skew, `cut_e12_c0`/
-- `cut_e14_c0`/`cut_e24_c0` the off-diagonal skew, `cut_e34_c0` the octonionic step
-- e3·e4=e7) that cut 21→14. The 14 pivot coordinates assemble into the injective
-- `coordMap`/`coordMapR` (`coordMapR_injective` via the cascade `gens_zero` +
-- `determined`), so `LinearMap.finrank_le_finrank_of_injective` with
-- `finrank ℚ (Fin 14 → ℚ) = 14` gives `finrank_derivationQ_le_14`; `le_antisymm`
-- against the banked lower bound closes `finrank_derivationQ_eq_14`. Forward,
-- NO posited `G₂`/`LieAlgebra.g2` — the SAME posit-vs-derive moat N3..N6/N16..N19 held.
#print axioms Phys.Algebra.determined
#print axioms Phys.Algebra.cut_e1_c1
#print axioms Phys.Algebra.cut_e34_c0
#print axioms Phys.Algebra.coordMapR_injective
#print axioms Phys.Algebra.finrank_derivationQ_le_14
#print axioms Phys.Algebra.finrank_derivationQ_eq_14

-- N21 (i) — THE g₂ LIE STRUCTURE of Der(O ℚ), PART 1 (`Phys.Algebra.DerivationBracket`).
-- On the banked exact dimension `finrank_derivationQ_eq_14` (N20) + the 14 explicit
-- derivations `D0E..D13E` (N19) + the bracket source `isDeriv_bracket` (N6), the g₂
-- Lie structure is derived FORWARD. `isDerivQ_bracket`: the commutator of two ℚ-linear
-- derivations is a derivation (the ℚ-analog of N6 — Leibniz + distributivity ALONE, no
-- associativity). `derivationLieQ`: Der(O ℚ) as a `LieSubalgebra ℚ (Module.End ℚ (O ℚ))`,
-- inheriting LieRing+LieAlgebra (bilinear/alternating/Jacobi exposed). `derivBasis`: the
-- 14 `D0E..D13E` form a `Module.Basis (Fin 14) ℚ derivationQ` — independence lifted from
-- the banked `Dvec_linearIndependent` into the submodule, spanning via the banked
-- `finrank=14`. NO posited `G₂`/`LieAlgebra.g2`.
#print axioms Phys.Algebra.isDerivQ_bracket
#print axioms Phys.Algebra.derivationLieQ
#print axioms Phys.Algebra.derivLieQ_jacobi
#print axioms Phys.Algebra.Dsub_indep
#print axioms Phys.Algebra.derivBasis

-- N21 (ii) — THE g₂ STRUCTURE-CONSTANT TABLE (`Phys.Algebra.DerivationStructureConstants`).
-- For every pair i<j of the 14 basis derivations, the commutator `⁅DiE,DjE⁆ = Σ cᵏᵢⱼ DkE`
-- is computed explicitly and PROVED forward (each bracket a derivation by `isDerivQ_bracket`
-- ⟹ in the 14-dim span; structure constants read off + proved by ext+simp+ring on the
-- derived CD product). All 91 pairs banked; integer constants in {-2,-1,1,2}, 84/91 nonzero.
-- The single-term skew brackets + the two-term octonionic brackets (e.g. `br_4_7 = 2 D0E +
-- 2 D3E`, the associator contribution of the non-associativity that stopped the cascade).
-- NO posited `g₂` bracket table.
#print axioms Phys.Algebra.br_0_1
#print axioms Phys.Algebra.br_0_4
#print axioms Phys.Algebra.br_4_7
#print axioms Phys.Algebra.br_12_13

-- N22 — THE FAITHFUL 7-DIM REPRESENTATION (the g₂ FUNDAMENTAL rep) (`Phys.Algebra.DerivationRep7`).
-- On the banked `derivationLieQ` (N21) + `deriv_maps_im` (N18) + `determined` + `finrank_O_eq_eight`
-- (N19/N20), the action of the derivation Lie algebra on the imaginary subspace is derived FORWARD.
-- `ImO`: the imaginary subspace `ker(star+1)`. `finrank_ImO`: `finrank ℚ ImO = 7` via rank–nullity
-- (range(star+1)=ℚ·1 from the trace identity; finrank O=8 banked). `imRep`: the restriction-to-Im
-- Lie homomorphism `derivationLieQ →ₗ⁅ℚ⁆ Module.End ℚ ImO` (ImO an invariant subspace by
-- `deriv_maps_im`). `imRep_injective`: ★★ FAITHFUL — `imRep D = 0 ⟹ D u1=D u2=D u4=0 ⟹ D=0` by
-- `determined`. `imRep_witness_ne_zero`: anti-vacuity (the nonzero witness has nonzero image). A
-- 14-dim Lie algebra acting faithfully on a 7-dim space = the g₂ fundamental representation. NO
-- posited `G₂`/`LieAlgebra.g2`. (The compact-form Killing-definiteness + simplicity that complete
-- the type-G₂ pinning are childed N23 — Der(O ℚ) is the COMPACT form, ≇ the split Serre g₂ ℚ.)
#print axioms Phys.Algebra.finrank_ImO
#print axioms Phys.Algebra.imRep
#print axioms Phys.Algebra.imRep_injective
#print axioms Phys.Algebra.imRep_witness_ne_zero
#print axioms Phys.Algebra.derivLieQ_mapsTo

-- N23 — THE PERFECTNESS / NON-SOLVABILITY (the cleanly-tractable compact-form / type-G₂ invariant)
-- (`Phys.Algebra.DerivationPerfect`). Derived FORWARD from the banked 91-pair bracket table (N21):
-- every basis derivation is a SINGLE banked bracket `⁅bL i, bL j⁆ = c • bL k` (the `cert_k`), so the
-- whole 14-dim algebra lies in its own derived ideal. `bL_span_top`: the 14 generators span ⊤
-- (transported from `derivBasis`). `bL_mem_derived`: each `bL k ∈ ⁅⊤,⊤⁆`. `derivationLieQ_perfect`:
-- ★★ `⁅⊤,⊤⁆ = ⊤` (PERFECT). `derivationLieQ_not_solvable`: ★★ ¬ IsSolvable (the derived series is
-- constant ⊤, never ⊥, since ⊤ ≠ ⊥). `derivationLieQ_not_lieAbelian`: anti-vacuity (a nonzero
-- generator bracket exists). NO posited `G₂`/`LieAlgebra.g2`. (Irreducibility of the faithful 7-rep,
-- Killing nondegeneracy/definiteness, and simplicity that complete the compact-form pinning are
-- childed N24.)
#print axioms Phys.Algebra.bL_span_top
#print axioms Phys.Algebra.bL_mem_derived
#print axioms Phys.Algebra.derivationLieQ_perfect
#print axioms Phys.Algebra.derivationLieQ_top_ne_bot
#print axioms Phys.Algebra.derivationLieQ_not_solvable
#print axioms Phys.Algebra.derivationLieQ_not_lieAbelian

-- N24 — THE COMPACT-SIGNATURE PIN: NEGATIVE-DEFINITENESS + NONDEGENERACY of the defining
-- trace form (`Phys.Algebra.DerivationCompact`). The compact real form is the DEFINITE one;
-- the ticket feared this as a 14×14 nested-rational-determinant W9 beast. It DISSOLVES through
-- the trunk (THE ONE LAW): every derivation is SKEW-ADJOINT for the positive-definite Born
-- self-overlap form `g v w = reQ (v · star w)` (banked N17/N18, lifted to ℚ in `gFormQ_skew`),
-- so the CHEAP 8-dim defining trace form `B(D,E) = tr_{O ℚ}(D∘E)` satisfies
-- `B(D,D) = − Σ_j g(D bO_j, D bO_j) ≤ 0` (`traceForm_self_nonpos`), `= 0 → D = 0`
-- (`traceForm_self_eq_zero`, anisotropy of the 8-square Born form) — NEGATIVE-DEFINITE, NO
-- determinant. Hence `traceForm_nondegenerate` (the Cartan-criterion input). `traceForm_witness_neg`:
-- anti-vacuity (the banked nonzero witness has `B(w,w) < 0` — NOT in the radical). NO posited
-- `G₂`/`LieAlgebra.g2`; `LieModule.traceForm` is MACHINERY on the derived object. (SEMISIMPLICITY
-- — the no-abelian-atoms clause, which is NOT free from this DEFINITE module trace form — plus
-- irreducibility of the faithful 7-rep, simplicity, and the automorphism Lie GROUP are childed N25.)
#print axioms Phys.Algebra.gFormQ_skew
#print axioms Phys.Algebra.traceForm_apply_neg
#print axioms Phys.Algebra.traceForm_self_nonpos
#print axioms Phys.Algebra.traceForm_self_eq_zero
#print axioms Phys.Algebra.traceForm_nondegenerate
#print axioms Phys.Algebra.traceForm_witness_neg
