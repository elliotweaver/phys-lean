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
import Phys.Algebra.DerivationIrreducible
import Phys.Algebra.DerivationIrreducibleFull
import Phys.Algebra.DerivationSimple
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
import Phys.Foundation.ContinuumCCLO
import Phys.Algebra.DerivationSimpleStructure
import Phys.Algebra.DerivationSemisimpleModule
import Phys.Algebra.DerivationSimpleCollapse
import Phys.Algebra.DerivationAutGroup
import Phys.Algebra.DerivationAutCompact
import Phys.Foundation.ContinuumTopology
import Phys.Algebra.DerivationAutCompactTopo
import Phys.Foundation.ContinuumArchimedean
import Phys.Foundation.ContinuumUniform
import Phys.Foundation.ContinuumComplete
import Phys.Algebra.DerivationAutOpNorm
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

-- N25 — SEMISIMPLICITY (the no-abelian-atoms clause + the trivial centre + the assembly),
-- forward from the banked NEGATIVE-DEFINITE nondegenerate trace form (N24) + PERFECTNESS (N23).
-- The Mathlib entry `LieAlgebra.InvariantForm.isSemisimple_of_nondegenerate` needs, beyond the
-- nondegenerate/reflexive/lie-invariant inputs (all banked/free), the clause `∀ I, IsAtom I →
-- ¬IsLieAbelian I`. For the negative-DEFINITE module trace form the false "abelian ideal ⊆
-- radical" Killing argument does NOT apply; the clean theory-native route uses trace-form
-- INVARIANCE + negative-DEFINITENESS + N23 PERFECTNESS through the centre. `derivationLieQ_center_eq_bot`:
-- the centre is trivial (perfect ⟹ every element ∈ lcs 1, orthogonal to the centre ⟹ 0).
-- `derivationLieQ_no_abelian_atom`: the atom dichotomy `⁅⊤,I⁆ ∈ {⊥, I}` both lead to `I = ⊥`.
-- `derivationLieQ_semisimple`: the assembly. NO posited `G₂`; `LieModule.traceForm`/`LieIdeal`/
-- `IsAtom`/`IsLieAbelian`/`InvariantForm` are MACHINERY on the derived object (STANDARD §3).
-- (Irreducibility of the faithful 7-rep, simplicity, and the automorphism Lie GROUP are childed N26.)
#print axioms Phys.Algebra.traceForm_self_eq_zero'
#print axioms Phys.Algebra.derivationLieQ_center_eq_bot
#print axioms Phys.Algebra.derivationLieQ_no_abelian_atom
#print axioms Phys.Algebra.derivationLieQ_semisimple

-- N26 — THE INVARIANT 7-DIM Lie SUBMODULE + the ORTHOGONAL (COMPACT) EMBEDDING + the
-- SIMPLICITY SKELETON, forward from the banked faithful 7-rep (N22) + skew-adjointness for
-- the Born self-overlap form (N24) + non-abelianness (N23). `ImLie`: the banked imaginary
-- subspace `ImO` promoted to a `LieSubmodule ℚ derivationLieQ (O ℚ)` (invariant via
-- `derivLieQ_mapsTo`), nontrivial (the banked nonzero generator `u1`), `finrank_ImLie = 7`.
-- `gBil`: the Born self-overlap form as a `BilinForm`; `deriv_isSkewAdjoint_gBil`: every
-- derivation is skew-adjoint for it (banked `gFormQ_skew`). `derivationLieQ_le_skewAdjoint`:
-- THE COMPACT EMBEDDING — the whole 14-dim algebra lands in the skew-adjoint operators of the
-- POSITIVE-DEFINITE Born form (`g₂ ↪ so(7)` compact, NOT split). `gBil_separatingLeft`: the
-- form is anisotropic/nondegenerate. `isSimple_of_isSimpleOrder`: the simplicity skeleton —
-- simple iff the ideal lattice is a simple order (via banked non-abelianness). NO posited `G₂`;
-- `LieSubmodule`/`BilinForm`/`skewAdjointLieSubalgebra`/`IsSimpleOrder`/`LieIdeal` are MACHINERY
-- on the derived object (STANDARD §3). (The full irreducibility of the 7-rep + the
-- `IsSimpleOrder (LieIdeal)` core + the automorphism Lie GROUP are childed N27.)
#print axioms Phys.Algebra.ImLie
#print axioms Phys.Algebra.finrank_ImLie
#print axioms Phys.Algebra.gBil
#print axioms Phys.Algebra.deriv_isSkewAdjoint_gBil
#print axioms Phys.Algebra.derivationLieQ_le_skewAdjoint
#print axioms Phys.Algebra.gBil_separatingLeft
#print axioms Phys.Algebra.isSimple_of_isSimpleOrder

-- N27 — COMPLETE REDUCIBILITY of the faithful 7-rep + the d=1 EXCLUSION, forward from the
-- banked `ImLie`/`gBil`/skew-adjointness (N26) + perfectness/faithfulness (N22/N23). The
-- trunk's Born positivity (the self-overlap form `gBil` is DEFINITE) makes the Weyl unitary
-- trick free: `gBil_restrict_nondegenerate` (the definite form restricts nondegenerately to
-- EVERY subspace), `isCompl_gBil_orthogonal` (so the Born-orthogonal complement is a genuine
-- linear complement), `deriv_mapsTo_orthogonal` (skew-adjointness ⟹ the complement of a
-- D-invariant subspace is D-invariant), `gPerp`/`isCompl_gPerp` (every Lie submodule has an
-- INVARIANT complement — COMPLETE REDUCIBILITY, no averaging, no posited compact group).
-- The d=1 exclusion ("one cause many terminations" at the rep level): `deriv_eigenvalue_zero`
-- (a derivation, skew-adjoint for a DEFINITE form, has no nonzero real eigenvalue),
-- `no_common_eigenvector_ImO` (a nonzero common eigenvector in `ImO` would lie in the joint
-- kernel `{D0E,D3E,D8E}` = 0), `no_one_dim_invariant_ImO` (hence no 1-dim invariant subspace).
-- NO posited `G₂`; `BilinForm.orthogonal`/`IsCompl`/`finrank` are MACHINERY on the derived
-- object (STANDARD §3). (The d∈{2,3,4,5} so(n) dimension-count → full irreducibility, and the
-- `IsSimpleOrder (LieIdeal)` core → `IsSimple`, and the automorphism Lie GROUP are childed N28.)
#print axioms Phys.Algebra.gBil_isSymm
#print axioms Phys.Algebra.gBil_restrict_nondegenerate
#print axioms Phys.Algebra.isCompl_gBil_orthogonal
#print axioms Phys.Algebra.deriv_mapsTo_orthogonal
#print axioms Phys.Algebra.gPerp
#print axioms Phys.Algebra.isCompl_gPerp
#print axioms Phys.Algebra.deriv_eigenvalue_zero
#print axioms Phys.Algebra.no_common_eigenvector_ImO
#print axioms Phys.Algebra.no_one_dim_invariant_ImO

-- N28 — FULL IRREDUCIBILITY of the faithful 7-rep, forward from the banked COMPLETE
-- REDUCIBILITY + d=1 exclusion (N27) + ImLie/gBil/compact embedding (N26) + faithfulness
-- (N22). THE W1 BUILD (Mathlib lacks `dim so(n) = C(n,2)`): the so(n)-type dimension bound
-- `finrank_skewAdjoint_le_choose` (a skew-adjoint operator of a symmetric nondegenerate form
-- on a d-space lies in a space of dim ≤ C(d,2)) is DERIVED FORWARD via the alternating-Fin-2 /
-- exterior-power injection `skewToDual` (NOT a posited so(n), NO coordinate matrix). The
-- assembly: `restrictOp_skew` (a derivation restricted to an invariant subspace is skew-adjoint
-- for the restricted Born form), `finrank_restrictSkew_le` (the bound applied to the restricted
-- form), `no_proper_invariant_ImO` (the Born-orthogonal split + faithfulness force
-- `14 ≤ C(d,2)+C(7−d,2)`, false for every proper d∈{1..6}), `ImLie_isIrreducible`
-- (`LieModule.IsIrreducible ℚ derivationLieQ ↥ImLie` — the only Lie submodules are ⊥/⊤). NO
-- posited `G₂`; `AlternatingMap`/`⋀²`/`BilinForm`/`finrank`/`IsSimpleOrder` are MACHINERY on the
-- derived object (STANDARD §3). (The `IsSimpleOrder (LieIdeal)` core → `IsSimple` and the
-- automorphism Lie GROUP are childed N29.)
#print axioms Phys.Algebra.bml_zero_diag
#print axioms Phys.Algebra.skewToDual_injective
#print axioms Phys.Algebra.finrank_skewAdjoint_le_choose
#print axioms Phys.Algebra.restrictOp_skew
#print axioms Phys.Algebra.restrictToSkew
#print axioms Phys.Algebra.finrank_restrictSkew_le
#print axioms Phys.Algebra.no_proper_invariant_ImO
#print axioms Phys.Algebra.map_incl_le_ImO
#print axioms Phys.Algebra.finrank_map_incl
#print axioms Phys.Algebra.ImLie_isIrreducible

-- N29 — the SIMPLICITY-REDUCTION levers toward `LieAlgebra.IsSimple ℚ derivationLieQ`.
-- N26 banked the simplicity skeleton `isSimple_of_isSimpleOrder`; N28 banked FULL
-- IRREDUCIBILITY of the faithful 7-rep; N25 banked SEMISIMPLICITY (so the ideal lattice is a
-- Boolean algebra, atomistic). The remaining gap — `IsSimpleOrder (LieIdeal ℚ derivationLieQ)`,
-- "exactly one atom" — is NOT near-free (faithful+irreducible⟹simple is FALSE in general,
-- `so(4)`/ℝ⁴), and needs the irreducible-faithful-module⟹simple structure theorem
-- (isotypic decomposition + Schur over ℚ + the prime-dimension-7 count), a substantial W1
-- BUILD Mathlib lacks for Lie modules — childed N30. This file banks the route-independent
-- FORWARD levers: `lieIdeal_nontrivial` (⊥≠⊤, the Nontrivial half of IsSimpleOrder, from the
-- banked non-abelianness), `eq_bot_of_lie_ImLie_bot` (a Lie ideal bracketing to ⊥ against the
-- faithful 7-rep is ⊥ — the faithfulness lever the structure theorem turns on), and
-- `lie_ImLie_ne_bot_of_ne_bot` (every nonzero ideal acts nontrivially on the irreducible
-- 7-rep). NO posited `G₂`; `LieIdeal`/`LieSubmodule`/`Nontrivial` are MACHINERY on the derived
-- object (STANDARD §3).
#print axioms Phys.Algebra.lieIdeal_nontrivial
#print axioms Phys.Algebra.eq_bot_of_lie_ImLie_bot
#print axioms Phys.Algebra.lie_ImLie_ne_bot_of_ne_bot

-- N30 — the irreducible-faithful-module⟹simple STRUCTURE THEOREM levers (the atom →
-- two-commuting-ideals reduction toward `IsSimpleOrder (LieIdeal ℚ derivationLieQ)`).
-- Semisimplicity (N25) makes the ideal lattice a Boolean algebra, atomistic; so if it is
-- NOT a simple order there is an atom `I ≠ ⊤` (`exists_atom_ne_top`), and its Boolean
-- complement `J = Iᶜ` gives two nonzero COMMUTING ideals (`⁅I,J⁆ = ⊥`) splitting `⊤ = I ⊕ J`
-- (`atom_compl_decomp`) — the direct-sum-of-commuting-ideals hypothesis the prime-dimension-7 /
-- isotypic-Schur structure theorem refutes. NO posited `G₂`; `IsAtom`/`IsSimpleOrder`/`Booleanᶜ`
-- are MACHINERY on the derived object (STANDARD §3). The collapse-consumed levers:
-- `imRep_commute_of_lie_zero` (commuting ideals act by commuting operators on the 7-rep —
-- `imRep` a Lie hom), `atom_isPerfect` (an atom is simple hence perfect — kills the 1-dim
-- character branch), `atom_center_eq_bot` (an atom has trivial centre — kills the dim Δ=7 branch).
#print axioms Phys.Algebra.exists_atom_ne_top
#print axioms Phys.Algebra.atom_compl_decomp
#print axioms Phys.Algebra.imRep_commute_of_lie_zero
#print axioms Phys.Algebra.atom_isPerfect
#print axioms Phys.Algebra.atom_center_eq_bot

-- N30a — the Lie→associative SEMISIMPLE-MODULE BRIDGE `IsSemisimpleModule A_I ↥ImO`.
-- The prime-7 / isotypic-Schur structure theorem (N30b) runs on an ASSOCIATIVE module fact:
-- `↥ImO` must be SEMISIMPLE over the associative subalgebra `A_I := Algebra.adjoin ℚ (imRep '' I)`
-- generated by the action of a Lie ideal `I`. Mathlib has the isotypic/Schur machinery for
-- semisimple ASSOCIATIVE modules but NO Lie-module → associative-module semisimplicity bridge
-- (W1 BUILD). This file builds it FORWARD as N27's Born-orthogonal complete reducibility
-- transported from the whole derivation algebra to the SUBalgebra `A_I`, proved GENERICALLY:
-- for any symmetric reflexive form `B` whose restriction to every subspace is nondegenerate
-- (the DEFINITE / Born-positivity hypothesis) and any set `S` of `B`-skew-adjoint operators,
-- `V` over `Algebra.adjoin K S` is SEMISIMPLE — every `A`-submodule has the `B`-orthogonal
-- complement as an `A`-submodule complement (`isSemisimpleModule_adjoin`; the orthogonal is
-- `A`-stable by `Algebra.adjoin_induction` since `A` is generated by skew-adjoint operators,
-- `adjoin_stable_orthogonal`/`skewAdjoint_mapsTo_orthogonal`, and a genuine complement because
-- `B` is definite, `isCompl_of_restrictScalars`). The bridge `semisimpleModule_imRep_adjoin` is
-- the instantiation at `V = ↥ImO`, `B = gBil.restrict ImO` (definite by the banked Born
-- anisotropy `gForm_self_eq_zero`, `gImO_restrict_nondegenerate`), `S = imRep '' I` (skew-adjoint
-- by the banked N28 `restrictOp_skew`, `imRep_isSkewAdjoint_gImO`). NO posited `G₂`;
-- `IsSemisimpleModule`/`ComplementedLattice`/`Submodule A`/`Algebra.adjoin`/`Module.End`/
-- `BilinForm.orthogonal` are MACHINERY on the derived object (STANDARD §3).
#print axioms Phys.Algebra.skewAdjoint_mapsTo_orthogonal
#print axioms Phys.Algebra.adjoin_stable_orthogonal
#print axioms Phys.Algebra.isCompl_of_restrictScalars
#print axioms Phys.Algebra.orthogonalASubmodule
#print axioms Phys.Algebra.isSemisimpleModule_adjoin
#print axioms Phys.Algebra.imRep_isSkewAdjoint_gImO
#print axioms Phys.Algebra.gImO_restrict_nondegenerate
#print axioms Phys.Algebra.semisimpleModule_imRep_adjoin

-- N30b — THE PRIME-7 / ISOTYPIC-SCHUR COLLAPSE ⟹ `IsSimpleOrder (LieIdeal ℚ derivationLieQ)`
-- ⟹ `LieAlgebra.IsSimple ℚ derivationLieQ`. The capstone of the type-G₂/compact-form
-- identification (NO posited G₂). The GENERIC prime-dimension structure-theorem layer is proved
-- over an ABSTRACT subalgebra `A : Subalgebra ℚ (End ℚ V)` (the concrete `A_I` blows up `SMul A_I`
-- typeclass synthesis, so the structure content is abstract; instantiation at `A_I` is cheap):
-- `commutantHom` (an operator commuting with the adjoin generators is `A`-linear — the commutant
-- lever for a commuting ideal), `isotypic_prime_split` (V semisimple over A + every fully-invariant
-- A-submodule ⊥/⊤ + dim_ℚ V PRIME ⟹ V ≃ₗ[A] Fin n → S with (n,dim S) ∈ {(p,1),(1,p)}), and the
-- ↥S-free `prime_split_dichotomy` (EITHER every a∈A is a ℚ-scalar OR V is A-SIMPLE). The W1
-- DISSOLUTION of the heavy Schur branch is `skew_odd_det_zero`: a B-skew-adjoint operator on an
-- ODD-dim nondegenerate space is SINGULAR (det = 0) — so a commuting-ideal generator that lands in
-- the Schur division ring of the simple module yet is skew-adjoint on the odd (7) definite Born
-- space must be 0. The CONCRETE layer: `collapse_Winv`/`collapse_dich` (a fully-invariant A_I-
-- submodule of ↥ImO is ⊥/⊤, via `no_proper_invariant_ImO`), `collapse_scalar_branch` (character
-- branch ⟹ I=⊥ by atom perfectness + faithfulness), `collapse_schur_branch` (Schur branch ⟹ Iᶜ=⊥
-- by skew_odd_det_zero + Schur injectivity + faithfulness). `derivationLieQ_isSimpleOrder` assembles
-- the dichotomy at A_I; `derivationLieQ_isSimple` wires the banked `isSimple_of_isSimpleOrder` (N26).
-- `IsSemisimpleModule`/`IsIsotypic`/`IsSimpleModule`/`Submodule A`/`Algebra.adjoin`/`Module.End`/
-- `BilinForm`/`LinearMap.det` are MACHINERY on the derived object (STANDARD §3); NO posited G₂.
#print axioms Phys.Algebra.Collapse.commutantHom
#print axioms Phys.Algebra.Collapse.skew_odd_det_zero
#print axioms Phys.Algebra.Collapse.finrank_of_linearEquiv_fun
#print axioms Phys.Algebra.Collapse.isotypic_prime_split
#print axioms Phys.Algebra.Collapse.prime_split_dichotomy
#print axioms Phys.Algebra.collapse_Winv
#print axioms Phys.Algebra.collapse_dich
#print axioms Phys.Algebra.collapse_scalar_branch
#print axioms Phys.Algebra.gBil_ImO_nondegenerate
#print axioms Phys.Algebra.collapse_schur_branch
#print axioms Phys.Algebra.derivationLieQ_isSimpleOrder
#print axioms Phys.Algebra.derivationLieQ_isSimple

-- N31 — THE AUTOMORPHISM GROUP of the terminal algebra, increment 1 (DEFINE + SEED). The Lie
-- GROUP whose Lie algebra is the banked simple type-G₂ `derivationLieQ` (N30b): the algebra-
-- automorphism group `AutO` of `O ℚ`, realized as a `Subgroup` of the ℚ-linear automorphism
-- group `(O ℚ ≃ₗ[ℚ] O ℚ)` carved by the multiplicative-and-unital predicate `IsAlgAut` (NO
-- posited G₂/Aut — `O ℚ` is non-associative, so there is no `Algebra ℚ (O ℚ)`/Mathlib `AlgEquiv`
-- to import and assert against; the structure is built FORWARD, `Subgroup`/`LinearEquiv` are
-- MACHINERY on the derived object, STANDARD §3). The forward SEED facts derived from the banked
-- algebra-level results: `octo_quadratic` (every element satisfies a monic quadratic over ℚ·1,
-- coefficients the banked trace + Born self-overlap), `aut_reQ` (an automorphism PRESERVES the
-- real part — the nontrivial step, via the quadratic), `aut_star` (commutes with conjugation),
-- `aut_gForm` (★★ PRESERVES the Born self-overlap form — the group analogue of the infinitesimal
-- skew-adjointness `derivationLieQ_le_skewAdjoint`, the SAME Born positivity integrated; ONE
-- cause), `aut_mapsTo_ImO` (preserves the trace-zero subspace `ImO`), `aut_map_one` (fixes the
-- unit). Group closure `isAlgAut_one`/`isAlgAut_mul`/`isAlgAut_inv` ⟹ `AutO`, non-vacuous
-- (`one_mem_AutO`). The analytic exp-over-`ContinuumQ.Cut` + compactness are childed. NO posited
-- G₂, NO bridge.
#print axioms Phys.Algebra.octo_quadratic
#print axioms Phys.Algebra.selfMul_eq_smul
#print axioms Phys.Algebra.aut_quad_diff
#print axioms Phys.Algebra.aut_reQ
#print axioms Phys.Algebra.aut_star
#print axioms Phys.Algebra.aut_gForm
#print axioms Phys.Algebra.aut_mapsTo_ImO
#print axioms Phys.Algebra.aut_map_one
#print axioms Phys.Algebra.isAlgAut_one
#print axioms Phys.Algebra.isAlgAut_mul
#print axioms Phys.Algebra.isAlgAut_inv
#print axioms Phys.Algebra.AutO
#print axioms Phys.Algebra.one_mem_AutO
#print axioms Phys.Algebra.AutO_reQ
#print axioms Phys.Algebra.AutO_star
#print axioms Phys.Algebra.AutO_gForm
#print axioms Phys.Algebra.AutO_mapsTo_ImO

-- N32 — THE AUTOMORPHISM GROUP, increment 2: the continuum-free COMPACTNESS SKELETON (the
-- orthogonal-group / boundedness core). W9 MEASURE-FIRST (workbench/N32-aut-exp/PREREG.md):
-- the derived ℝ `ContinuumQ.Cut` carries Field+LinearOrder+IsStrictOrderedRing but NO
-- TopologicalSpace/NormedField/Archimedean, and Mathlib's `exp` wants a topological/normed
-- field — so the analytic exp `Der(𝕆) → Aut(𝕆)` is a genuine W1 BUILD of an analytic sub-tower
-- over the derived ℝ, childed (N33). But the COMPACTNESS has a continuum-free algebraic heart,
-- banked here: in the `gForm`-orthonormal coordinate frame `bO` (N24), the banked
-- form-preservation `aut_gForm` (N31) makes every automorphism an ISOMETRY. `gForm_polar` (★ the
-- Born self-overlap form IS the inner product in the frame: `gForm v w = ∑ coordO v i · coordO w i`,
-- polarizing N24's `gForm_self_sum_sq`), `gForm_orthonormal` (the frame is orthonormal),
-- `coordO_bO`; `aut_col_unit` (★ each coordinate column of an automorphism is a unit vector),
-- `aut_col_orthogonal` (★ the columns are mutually orthonormal — the algebraic `MᵀM = I`),
-- `aut_entry_sq_le_one`/`aut_entry_abs_le_one` (★★ THE BOUNDEDNESS: every coordinate entry has
-- `|entry| ≤ 1` — the algebraic skeleton of COMPACTNESS, from the definite Born form, ONE cause
-- with the skew-adjointness). Member-level corollaries on `AutO` + non-vacuity (the identity
-- saturates the bound, `one_entry_diag = 1`). NO posited exp/G₂/Aut/orthogonal-group, NO Mathlib
-- ℝ as content, NO bridge.
#print axioms Phys.Algebra.gForm_add_right
#print axioms Phys.Algebra.gForm_smul_right
#print axioms Phys.Algebra.gForm_add_left
#print axioms Phys.Algebra.gForm_smul_left
#print axioms Phys.Algebra.gForm_polar
#print axioms Phys.Algebra.coordO_bO
#print axioms Phys.Algebra.gForm_orthonormal
#print axioms Phys.Algebra.aut_col_unit
#print axioms Phys.Algebra.aut_col_orthogonal
#print axioms Phys.Algebra.aut_entry_sq_le_one
#print axioms Phys.Algebra.aut_entry_abs_le_one
#print axioms Phys.Algebra.AutO_col_unit
#print axioms Phys.Algebra.AutO_col_orthogonal
#print axioms Phys.Algebra.AutO_entry_abs_le_one
#print axioms Phys.Algebra.one_col_unit

-- N33 — THE ANALYTIC SUB-TOWER, increment 3 (3a): the ORDER-COMPLETENESS of the DERIVED ℝ in
-- Mathlib's STANDARD idiom. The genuine W1 BUILD the N32 compactness measurement forced (the derived
-- ℝ `ContinuumQ.Cut` carried no topology). N6/N10–N14 banked the bespoke Dedekind completeness
-- (`completion_coherence_closed`: every gather has a coherence point = the union cut); this re-expresses
-- it as the standard least-upper-bound property and assembles `ConditionallyCompleteLinearOrder Cut`.
-- `sSupCutS` (the union of lower sets of a `Set Cut`), `sSupCutGather` (★ the union of a nonempty
-- bounded family of cuts is a cut — a verbatim port of the `hgather` block of
-- `completion_coherence_closed`; the `nomax` up-step IS C6 eternal approach), the `SupSet` instance,
-- `isLUB_csSupCut` (★★ union cut = LEAST UPPER BOUND, the completeness in standard form),
-- `not_bddAbove_univ` (the derived ℝ has no greatest element), and `condCompleteLinearOrder`
-- (★★ the derived ℝ is a `ConditionallyCompleteLinearOrder`). This unlocks the standard ORDER TOPOLOGY
-- and Heine–Borel (`isCompact_Icc`) on the DERIVED ℝ as MACHINERY (STANDARD §3 — a property OF the
-- derived ℝ, not a posited number system / topology / exp). NO posited ℝ/topology/exp/G₂, NO Mathlib ℝ
-- as content, NO bridge. The analytic exp `Der(𝕆) → Aut(𝕆)` + topological compactness via Heine–Borel
-- childed (N34) onto the chain tail.
#print axioms Phys.Foundation.ContinuumQ.sSupCutS
#print axioms Phys.Foundation.ContinuumQ.sSupCutGather
#print axioms Phys.Foundation.ContinuumQ.csSupCut
#print axioms Phys.Foundation.ContinuumQ.csSupCut_eq
#print axioms Phys.Foundation.ContinuumQ.csSupCut_eq_zero
#print axioms Phys.Foundation.ContinuumQ.isLUB_csSupCut
#print axioms Phys.Foundation.ContinuumQ.not_bddAbove_univ
#print axioms Phys.Foundation.ContinuumQ.condCompleteLinearOrder
#print axioms Phys.Algebra.one_entry_diag

-- N34 — THE AUTOMORPHISM GROUP, increment 4: the TOPOLOGY RUNG on the DERIVED ℝ + the Heine–Borel
-- TOPOLOGICAL COMPACTNESS of the automorphism group over the DERIVED continuum `ContinuumQ.Cut`.
-- W9 MEASURE-FIRST (workbench/N34-operator-exp/PREREG.md): with N33's `ConditionallyCompleteLinearOrder
-- Cut`, the standard ORDER TOPOLOGY (`Preorder.topology`, `OrderTopology` by rfl) is reachable cheaply
-- as MACHINERY, giving `T2Space`, `IsTopologicalRing` (continuous field ops), `CompactIccSpace` ⟹
-- ★★ Heine–Borel `isCompact_Icc_cut`, and finite-product box compactness `isCompact_box` — all on the
-- DERIVED ℝ (STANDARD §3: a property OF the derived ℝ, not a posited topology/number system). The
-- ANALYTIC operator-exp `Der(𝕆) → Aut(𝕆)` (Cauchy-completeness/tsum/exp∈Aut/d-dt) is the genuine
-- multi-file W1 analytic BUILD, childed (N35). The COMPACTNESS, banked here over the derived ℝ:
-- `bornIsometrySet` (the `MᵀM = I` matrices over `Cut` = Born-form preservation in the bO frame),
-- `bornIsometry_isClosed` (intersection of continuous-bilinear level sets, Hausdorff),
-- `matBox_isCompact` (Heine–Borel per factor + finite Tychonoff), `bornIsometry_subset_box` (the
-- diagonal condition bounds each entry — N32 boundedness over Cut), ★★ `bornIsometry_isCompact`
-- (closed ⊆ compact box ⟹ COMPACT), ★ `autMatrix_mem_bornIsometry` (the banked AutO coordinate image,
-- cast ℚ→Cut, lands in the compact set — transporting `AutO_col_orthogonal` N32) + identity
-- non-vacuity. ONE cause: the SAME definite Born positivity (self-overlap) that gave skew-adjointness
-- (N26), simplicity (N30b) and entry-boundedness (N32) now gives topological COMPACTNESS once the
-- derived ℝ is order-complete (N33) + carries the order topology (N34). NO posited exp/G₂/Aut/
-- orthogonal-group, NO Mathlib ℝ as content, NO bridge.
#print axioms Phys.Foundation.ContinuumQ.isCompact_Icc_cut
#print axioms Phys.Foundation.ContinuumQ.isCompact_box
#print axioms Phys.Foundation.ContinuumQ.t2Space_cut
#print axioms Phys.Foundation.ContinuumQ.isTopologicalRing_cut
#print axioms Phys.Foundation.ContinuumQ.compactIccSpace_cut
#print axioms Phys.Algebra.entry_continuous
#print axioms Phys.Algebra.colBilin_continuous
#print axioms Phys.Algebra.bornIsometry_isClosed
#print axioms Phys.Algebra.matBox_isCompact
#print axioms Phys.Algebra.bornIsometry_subset_box
#print axioms Phys.Algebra.bornIsometry_isCompact
#print axioms Phys.Algebra.autMatrix_mem_bornIsometry
#print axioms Phys.Algebra.one_autMatrix_mem_bornIsometry
-- N35 — THE AUTOMORPHISM GROUP, increment 5: the ARCHIMEDEAN / C6-eternal-approach analytic
-- FOUNDATION RUNG of the DERIVED ℝ `ContinuumQ.Cut` — the first analytic rung the operator-exp
-- tower rests on, BELOW the metric/uniform structure. W9 MEASURE-FIRST (workbench/N35-operator-exp/
-- PREREG.md + probes, all exit 0 ~8s) established the scope: UniformSpace/MetricSpace/CompleteSpace
-- Cut do NOT synthesize and there is no generic metric-from-order-topology — the metric/uniform/
-- Cauchy-complete + operator-norm + tsum-exp + exp∈AutO + d/dt core is the genuine multi-file W1
-- analytic BUILD, childed (N36). Banked here, the cheaply-reachable analytic foundation:
-- `instArchimedeanCut` (the derived ℝ is ARCHIMEDEAN — the C6 eternal-approach / no-infinite-element
-- fact, as MACHINERY via `ConditionallyCompleteLinearOrderedField.to_archimedean` on the banked
-- Field + ConditionallyCompleteLinearOrder (N33) + IsStrictOrderedRing, a property OF the derived ℝ,
-- STANDARD §3), `cut_exists_nat_gt` (the explicit no-infinite-element form), and the C6 eternal-
-- approach read as analytic CONVERGENCE with NO metric — `cut_tendsto_atTop_ciSup`/`ciInf`/`isLUB`
-- (bounded monotone sequences converge to their sup/inf in the banked order topology N34; the
-- bounded approach eternally tends to its LUB coherence point, banked N33 `isLUB_csSupCut`) +
-- non-vacuity witnesses. ONE cause: the SAME C6 eternal-approach that built the cut and gave order-
-- completeness (N33) and the order topology (N34) now gives the Archimedean property + the analytic
-- limit. NO posited exp/G₂/Aut/metric/number-system, NO Mathlib ℝ as content, NO bridge.
#print axioms Phys.Foundation.ContinuumQ.instArchimedeanCut
#print axioms Phys.Foundation.ContinuumQ.cut_exists_nat_gt
#print axioms Phys.Foundation.ContinuumQ.cut_tendsto_atTop_ciSup
#print axioms Phys.Foundation.ContinuumQ.cut_tendsto_atTop_ciInf
#print axioms Phys.Foundation.ContinuumQ.cut_tendsto_atTop_isLUB
#print axioms Phys.Foundation.ContinuumQ.cut_one_lt_two_nat
#print axioms Phys.Foundation.ContinuumQ.cut_const_tendsto
-- N36 — THE AUTOMORPHISM GROUP, increment 6: the UNIFORM STRUCTURE on the DERIVED ℝ
-- `ContinuumQ.Cut` (the trunk-native group uniformity), with TOPOLOGY AGREEMENT to the banked
-- order topology. W9 MEASURE-FIRST (workbench/N36-operator-exp/PREREG.md + probes, all exit 0 ~7s)
-- + W1 REFRAME-THROUGH-THE-TRUNK DISSOLVED the feared hard part: the N35 measurement isolated "a
-- PseudoMetricSpace Cut with dist=|x-y| whose induced topology = Preorder.topology Cut" — but that
-- route is also a CONTENT trap (Mathlib's dist is ℝ-valued, casting |x-y|:Cut into ℝ = importing ℝ).
-- The trunk dodges BOTH: Cut is a banked TOPOLOGICAL RING (N34) ⟹ IsTopologicalAddGroup ⟹ the
-- CANONICAL GROUP UNIFORMITY `IsTopologicalAddGroup.rightUniformSpace` whose toTopologicalSpace
-- equals the banked instTopologicalSpaceCut BY rfl — NO ℝ-valued metric, NO replaceTopology, NO
-- content import. Banked: `instUniformSpaceCut` (the group uniformity), ★ `cut_uniformSpace_
-- toTopologicalSpace_eq` (the topology AGREEMENT, by construction), `instIsUniformAddGroupCut`
-- (left=right uniformity coincide, the comm case), `cut_uniformity_eq` (the order-native explicit
-- uniformity — entourages = "difference near 0"), + non-vacuity `cut_tsum_statable` (tsum
-- expressible) / `cut_const_cauchySeq` (constant seq Cauchy — the uniform structure non-degenerate).
-- ONE cause: the SAME C6 eternal-approach that built the cut + order-completeness (N33) + the order
-- topology + topological-ring continuity (N34) + Archimedean/convergence (N35) now gives the uniform
-- refinement. CompleteSpace + operator-norm + tsum-exp + exp∈AutO + d/dt childed (N37). NO posited
-- exp/G₂/Aut/metric/number-system, NO Mathlib ℝ as content, NO bridge.
#print axioms Phys.Foundation.ContinuumQ.instUniformSpaceCut
#print axioms Phys.Foundation.ContinuumQ.cut_uniformSpace_toTopologicalSpace_eq
#print axioms Phys.Foundation.ContinuumQ.instIsUniformAddGroupCut
#print axioms Phys.Foundation.ContinuumQ.cut_uniformity_eq
#print axioms Phys.Foundation.ContinuumQ.cut_tsum_statable
#print axioms Phys.Foundation.ContinuumQ.cut_const_cauchySeq
-- N37 — THE AUTOMORPHISM GROUP, increment 7: `CompleteSpace Cut` — the CAUCHY-COMPLETENESS of the
-- DERIVED ℝ `ContinuumQ.Cut`, the analytic completeness rung the operator-exp power series rests on.
-- W9 MEASURE-FIRST (workbench/N37-operator-exp/PREREG.md + probe1..6, all exit 0 ~7-9s — the full
-- CompleteSpace proof measured clean at 7.4s before production). W1 REFRAME-THROUGH-THE-TRUNK:
-- Mathlib's `CompleteSpace ℝ` goes through `CauSeq` + an ℝ-VALUED metric — a CONTENT trap here
-- (casting |x-y|:Cut into ℝ = importing ℝ). The trunk dodges it: completeness IS the banked C6
-- eternal-approach one level up, closing from TWO banked trunk facts with NO metric: (i) the nhds
-- filter at 0 has the countable basis {|x| < 1/(n+1)} — the eternal approach by reciprocals of the
-- Archimedean naturals (N35) — so `𝓝 0` and hence `𝓤 Cut` (N36) is IsCountablyGenerated
-- (FirstCountableTopology Cut does NOT synth; this BUILD supplies it); (ii) a Cauchy seq is BOUNDED,
-- so it lives in a banked-COMPACT closed Icc (N34 Heine–Borel), has a convergent subsequence, and —
-- being Cauchy — converges. `UniformSpace.complete_of_cauchySeq_tendsto` assembles them. Banked:
-- `cut_nhds_zero_countablyGenerated` (the C6 eternal-approach as countable nearness),
-- `cut_uniformity_countablyGenerated` (via comap), `cut_uniformity_hasBasis_abs` (the order-native
-- abs entourage basis), `cauchySeq_bddAbove_range`/`cauchySeq_bddBelow_range` (Cauchy ⟹ bounded),
-- ★★ `instCompleteSpaceCut` (THE TARGET — CompleteSpace Cut), + non-vacuity `cut_const_tendsto_complete`/
-- `cut_cauchySeq_const_converges`. ONE cause: the SAME C6 eternal-approach that built the cut (N6),
-- order-completeness (N33), the order topology + Heine–Borel (N34), the Archimedean/convergence rung
-- (N35), and the uniform structure (N36) now closes Cauchy completeness. operator-norm + tsum-exp +
-- exp∈AutO + d/dt childed (N38). NO posited exp/G₂/Aut/metric/CauSeq/number-system, NO Mathlib ℝ as
-- content, NO bridge.
#print axioms Phys.Foundation.ContinuumQ.cut_nhds_zero_countablyGenerated
#print axioms Phys.Foundation.ContinuumQ.cut_uniformity_countablyGenerated
#print axioms Phys.Foundation.ContinuumQ.cut_uniformity_hasBasis_abs
#print axioms Phys.Foundation.ContinuumQ.cauchySeq_bddAbove_range
#print axioms Phys.Foundation.ContinuumQ.cauchySeq_bddBelow_range
#print axioms Phys.Foundation.ContinuumQ.instCompleteSpaceCut
#print axioms Phys.Foundation.ContinuumQ.cut_const_tendsto_complete
#print axioms Phys.Foundation.ContinuumQ.cut_cauchySeq_const_converges

-- N38 — THE AUTOMORPHISM GROUP, increment 8 (part b): the Cut-VALUED OPERATOR NORM on the 8×8
-- coordinate matrices over the DERIVED ℝ `ContinuumQ.Cut`, the magnitude against which the
-- exponential series `∑ Dⁿ/n!` will converge (the first rung of the operator-exp core). W9
-- MEASURE-FIRST (workbench/N38-operator-exp/PREREG.md + probe1..3, each `lake env lean` ~2s user
-- CPU — submultiplicativity closes with ABSTRACT Finset lemmas, never Fin 8 expansion / decide /
-- ring). W1 / THE-ONE-LAW REFRAME-THROUGH-THE-TRUNK (the content-trap dodge): Mathlib's
-- `Norm`/`NormedRing`/`NormedSpace` typeclass is ℝ-VALUED (`norm : α → ℝ`) — instantiating it would
-- cast a Cut-valued magnitude into Mathlib's ℝ = importing ℝ as CONTENT (the SAME trap the metric
-- N35→N36 and Cauchy-completeness N37 dodged). The trunk dodges it again: `opNorm : Matrix … Cut →
-- Cut` is a Cut-VALUED function built from the order-native `abs` on the derived ℝ + finite
-- `Finset.sum` — pure MACHINERY on the DERIVED Cut, NO `Norm` typeclass, NO ℝ. THE NORM:
-- `opNorm M = ∑ᵢⱼ |Mᵢⱼ|` (entrywise ℓ¹), submultiplicative with NO dimension factor — so
-- `opNorm (Dⁿ) ≤ (opNorm D)ⁿ`, the convergence-controlling property for the next increment. Banked:
-- `opNorm_nonneg`, `opNorm_zero`, `opNorm_eq_zero` (definiteness — a genuine norm), `entry_abs_le_opNorm`
-- (dominates each entry), `opNorm_add_le` (triangle), `opNorm_smul` (absolute homogeneity),
-- ★★ `opNorm_mul_le` (SUBMULTIPLICATIVITY — the load-bearing convergence seed), `opNorm_pow_le`
-- (series-term bound, n≥1), `opNorm_autMatrix_le` (≤ 64, the N32 unit-box: 64 entries each |·| ≤ 1),
-- `opNorm_one` (= 8, non-vacuity — the norm is not the zero map, and 8 ≰ 1 is why the power bound
-- needs n ≥ 1). ONE cause: the SAME Born positivity that made every derivation skew-adjoint (N26),
-- forced the simple type-G₂ Lie algebra (N24/N30b), bounded every automorphism entry (N32), and made
-- the automorphism group topologically compact (N34), read through the `abs` of the derived ℝ now
-- gives the Cut-valued submultiplicative norm. tsum-exp + exp∈AutO + d/dt childed (N39). NO posited
-- exp/G₂/Aut/metric/norm-system, NO Mathlib ℝ as content, NO ℝ-valued Norm typeclass, NO bridge.
#print axioms Phys.Algebra.opNorm_nonneg
#print axioms Phys.Algebra.opNorm_zero
#print axioms Phys.Algebra.opNorm_eq_zero
#print axioms Phys.Algebra.entry_abs_le_opNorm
#print axioms Phys.Algebra.opNorm_add_le
#print axioms Phys.Algebra.opNorm_smul
#print axioms Phys.Algebra.opNorm_mul_le
#print axioms Phys.Algebra.opNorm_pow_le
#print axioms Phys.Algebra.opNorm_autMatrix_le
#print axioms Phys.Algebra.opNorm_one
