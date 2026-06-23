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
import Phys.Algebra.Operator
import Phys.Algebra.GeneratedModule
import Phys.Algebra.JordanTower
import Phys.Algebra.Alternative
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

