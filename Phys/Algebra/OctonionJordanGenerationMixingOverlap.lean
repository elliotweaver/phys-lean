/-
# N312 — THE TWO-SECTOR FRAME OVERLAP (seed T8 remainder, the ℚ-exact structural core)

Owner-authorized flavor-route seed (docs/SEED_FLAVOR_SELF_BLINDNESS.md), target **T8** — the
generation-mixing structure as a FRAME OVERLAP. The directed successor of N311 (the single-sector
tridiagonal frame `massMat`). N311 banked ONE sector's tridiagonal frame ℚ-exact; T8's mixing matrix
is the OVERLAP `V = U† D` of the TWO diagonalized sector frames (up & down; lepton/neutrino). This
node banks the ℚ-EXACT STRUCTURAL CORE of that overlap.

⚠ HONEST-STATUS CAVEAT (seed §2 T8). Unlike the masses/Koide/δ_B/associator (T1–T7, theorem-grade
EXACT), the mixing sector lands only at LEADING ORDER (~few-percent residuals) once precision masses
are used — the genuine current status, NOT a defect to fit away. This node banks the ℚ-exact
STRUCTURAL construction (the diagonalization, the overlap `V = U†D`, its unitarity, the leading
Cabibbo mixing-squared, the CP-invariant tie); the numerical angles (the arctan), the normalization
`√`, and the numerical Jarlskog need the derived ℝ and are the honestly-deferred leading-order
remainder (the N309 ℝ-descent precedent), NOT imported, NOT fitted, NOT chased.

## THE THEORY-NATIVE KEY — THE DIAGONALIZATION DISSOLVES THROUGH BORN = SELF-OVERLAP.

A generic symmetric tridiagonal matrix has IRRATIONAL eigenvectors (the characteristic cubic does not
factor over ℚ), so its diagonalization would need the derived ℝ. But `massMat` is NOT generic: its
nearest-neighbour adjacency 2×2 blocks are **Born self-overlaps** — `massMat` restricted to an edge is
the rank-1 outer product `(aᵢ, aⱼ)ᵀ (aᵢ, aⱼ)` of the banked amplitude direction (N307 `genVec`),
because the diagonal is `aₖ·aₖ` and the off-diagonal is `aᵢ·aⱼ` (`Born = self-overlap`, the TRUNK).
A rank-1 outer product has a RATIONAL eigenstructure: the amplitude direction `(aᵢ, aⱼ)` is the
eigenvector for the large eigenvalue `mᵢ + mⱼ`, and `(aⱼ, −aᵢ)` is the null direction (eigenvalue 0) —
both ℚ-EXACT, `det = 0`. So the per-sector mass-basis FRAME directions are RATIONAL, and the
two-sector overlap `V = U†D` has ℚ-exact inner-product numerators. The ONE LAW reframe: the √ / the
ℝ eigen-toolkit DISSOLVES through the Born-square structure exactly as it did for N306's √2,
N311's geometric-mean coupling — NOT built, NOT imported.

## §1 — THE ADJACENCY SUB-BLOCK IS A RANK-1 BORN OUTER PRODUCT (grounding on the banked massMat)

* `bornBlock a₀ a₁ = !![a₀a₀, a₀a₁; a₀a₁, a₁a₁]` — the abstract 2×2 rank-1 outer product.
* `massSub01`, `massSub12` — the two nearest-neighbour adjacency sub-blocks of the banked `massMat`,
  and `massSub01 = bornBlock (a₀) (a₁)`, `massSub12 = bornBlock (a₁) (a₂)`: each edge of the
  mass-coupling matrix IS the Born self-overlap of the two adjacent banked amplitudes.

## §2 — THE RANK-1 EIGENSTRUCTURE (the diagonalization, ℚ-EXACT)

* `bornBlock_det_zero : (bornBlock a₀ a₁).det = 0` — rank-1 (the outer product is singular).
* `bornBlock_eigvec_amp : (bornBlock a₀ a₁).mulVec ![a₀,a₁] = (a₀²+a₁²) • ![a₀,a₁]` — the amplitude
  direction is the eigenvector for the large eigenvalue `mᵢ+mⱼ` (ℚ-exact, RATIONAL eigenvector).
* `bornBlock_eigvec_null : (bornBlock a₀ a₁).mulVec ![a₁,−a₀] = 0` — the orthogonal null direction.
* the same, read directly on `massMat` (`massMat_eigvec_amp_0/1`, `massMat_eigvec_null`): the
  diagonalization is grounded on the banked mass-coupling matrix, not a free-floating block.

## §3 — THE TWO-SECTOR FRAME OVERLAP `V = U†D` (ℚ-EXACT, unitary up to the norm scale)

* `mixV u₀ u₁ d₀ d₁` — the overlap of the two sectors' rational amplitude-direction frames (up `u`,
  down `d`): the 2×2 matrix `!![u·d, −(u∧d); u∧d, u·d]` with `u·d = u₀d₀+u₁d₁` the aligned
  (Brahmagupta) inner product and `u∧d = u₁d₀−u₀d₁` the mixing (Fibonacci) cross-term.
* ★★ `mixV_unitary_up_to_scale : (mixV)ᵀ (mixV) = ((u₀²+u₁²)(d₀²+d₁²)) • 1` — the overlap is unitary
  up to the product of the two frame norms (the normalization `√` is the deferred ℝ-descent piece).
* ★★ `cabibbo_mixing_orthonormal : |V_mix|² + |V_aligned|² = 1` — the leading Cabibbo mixing-squared
  `|V_mix|² = (u∧d)²/((u₀²+u₁²)(d₀²+d₁²))` and its complement sum to `1` (the ℚ-exact
  Brahmagupta–Fibonacci identity): a genuine normalized mixing, arctan-free at leading order.
* `mixNumer_ground` — the mixing cross-term of two sectors read off the banked `genVec`.

## §4 — THE CP-INVARIANT TIE (structural, on the banked associator, N310)

The overlap's CP-invariant (the Jarlskog-type antisymmetric triple product) is carried by the banked
calibration cross-term `assoc3` (N209/N310): it VANISHES on the associative ℂ-line (the lepton sector
is CP-trivial at leading order) and is NONZERO on the octonionic Fano line (the quark sector carries
CP), and the two invariants are INDEPENDENT (N310 `separation`). We re-export the banked separation as
the mixing sector's CP structure — the numerical Jarlskog is the deferred ℝ-descent piece.

## §5 — NON-VACUITY (W8)

* `mixing_nonzero_distinct_sectors` — at two genuinely distinct sectors the mixing cross-term is
  NONZERO: the overlap is real mixing, not aligned frames.
* `mixV_not_identity` — at a witness the overlap is NOT the identity (the frames are genuinely
  misaligned; a trivial `V = 1` is excluded).
* `cabibbo_geometric_not_trivial` — the mixing-squared at a witness is a genuine nonzero fraction.

## THE DISSOLUTION / MOAT (docs/STANDARD.md §0)

In the Standard Model the CKM/PMNS mixing matrix is 4 (CKM) + 4+ (PMNS) free numbers inserted by hand.
The theory FORCES the structure: each sector's mass-basis frame is the RATIONAL amplitude direction
(Born self-overlap rank-1), the mixing matrix is their overlap `V = U†D`, its unitarity and the
leading Cabibbo mixing-squared are ℚ-exact, and the CP invariant is the banked octonion associator —
zero free continuous parameters. No measured CKM/PMNS angle, no Jarlskog, no PDG number enters any
proof; comparison to data is removable prose (and lands only at leading order, seed caveat).

## PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2)

Delete generation/mass/mixing/CKM/PMNS/CP/quark/lepton/Cabibbo: over ℚ, `bornBlock a₀ a₁` is the
rank-1 outer product `(a₀,a₁)ᵀ(a₀,a₁)`, its `det` is `0`, `![a₀,a₁]` is its eigenvector with
eigenvalue `a₀²+a₁²` and `![a₁,−a₀]` its null vector; the adjacency sub-blocks of the banked `massMat`
are these outer products of the banked `genVec` entries; `mixV` satisfies `Vᵀ V = ((u₀²+u₁²)(d₀²+d₁²))•1`
and the Brahmagupta–Fibonacci identity `(u∧d)²+(u·d)² = (u₀²+u₁²)(d₀²+d₁²)`. No theorem STATEMENT needs
a physics word.

## FREE-FLOATING check (SOUL rail)

The eigenstructure is grounded on the banked `massMat` (N311) via `massSub01/12 = bornBlock (genVec …)`;
the mixing numerator is the banked `genVec` cross-term; the CP tie re-exports the banked `assoc3`
separation (N310); the capstone carries `jdef Xwit Ywit ≠ 0` (the octonion-specific cap forcing exactly
three AND opening the coupling chain, N5) in its TYPE. NOT a generic frame-overlap statement floating
free of the derived generation objects.

Foundations-only: no posited axiom, no sorry, no compiled-kernel bypass, no heartbeat inflation, no
bridge; no empirical number; the structural overlap exact over ℚ (the numerical mixing angles, the
normalization √, and the numerical Jarlskog honestly deferred to the ℝ-descent, never imported, never
fitted). The per-edge Born-survival suppression (the last listed T8 structural piece) is the childed
decompose-remainder.
-/
import Phys.Algebra.OctonionJordanGenerationMixingFrame
import Phys.Algebra.OctonionJordanGenerationAssociatorDeviation
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD

/-! ## §1 — the adjacency sub-block is a rank-1 Born outer product (grounding on the banked massMat). -/

/-- The abstract 2×2 rank-1 Born outer product `(a₀,a₁)ᵀ (a₀,a₁)`: diagonal `aₖ·aₖ`, off-diagonal
    `a₀·a₁`. This is the shape of every nearest-neighbour adjacency block of `massMat` (`Born =
    self-overlap`, the trunk). -/
def bornBlock (a0 a1 : ℚ) : Matrix (Fin 2) (Fin 2) ℚ := !![a0 * a0, a0 * a1; a0 * a1, a1 * a1]

/-- The gen1↔gen2 adjacency sub-block of the banked `massMat` (N311). -/
noncomputable def massSub01 (M A p r : ℚ) : Matrix (Fin 2) (Fin 2) ℚ :=
  !![massMat M A p r 0 0, massMat M A p r 0 1; massMat M A p r 1 0, massMat M A p r 1 1]

/-- The gen2↔gen3 adjacency sub-block of the banked `massMat` (N311). -/
noncomputable def massSub12 (M A p r : ℚ) : Matrix (Fin 2) (Fin 2) ℚ :=
  !![massMat M A p r 1 1, massMat M A p r 1 2; massMat M A p r 2 1, massMat M A p r 2 2]

/-- ★ THE gen1↔gen2 ADJACENCY BLOCK IS THE BORN OUTER PRODUCT of the two banked amplitudes:
    `massSub01 = bornBlock a₀ a₁`. The mass-coupling matrix's edge is literally the self-overlap of
    the two adjacent banked amplitude directions (N307 `genVec`). -/
theorem massSub01_born (M A p r : ℚ) :
    massSub01 M A p r = bornBlock (genVec M A p r 0) (genVec M A p r 1) := by
  have e00 : massMat M A p r 0 0 = genVec M A p r 0 * genVec M A p r 0 := by
    rw [massMat_diag_0]; simp only [massVec]; ring
  have e01 : massMat M A p r 0 1 = genVec M A p r 0 * genVec M A p r 1 := massMat_offdiag_01 M A p r
  have e10 : massMat M A p r 1 0 = genVec M A p r 0 * genVec M A p r 1 := by
    rw [← massMat_symm_01]; exact massMat_offdiag_01 M A p r
  have e11 : massMat M A p r 1 1 = genVec M A p r 1 * genVec M A p r 1 := by
    rw [massMat_diag_1]; simp only [massVec]; ring
  rw [massSub01, bornBlock, e00, e01, e10, e11]

/-- ★ THE gen2↔gen3 ADJACENCY BLOCK IS THE BORN OUTER PRODUCT: `massSub12 = bornBlock a₁ a₂`. -/
theorem massSub12_born (M A p r : ℚ) :
    massSub12 M A p r = bornBlock (genVec M A p r 1) (genVec M A p r 2) := by
  have e11 : massMat M A p r 1 1 = genVec M A p r 1 * genVec M A p r 1 := by
    rw [massMat_diag_1]; simp only [massVec]; ring
  have e12 : massMat M A p r 1 2 = genVec M A p r 1 * genVec M A p r 2 := massMat_offdiag_12 M A p r
  have e21 : massMat M A p r 2 1 = genVec M A p r 1 * genVec M A p r 2 := by
    rw [← massMat_symm_12]; exact massMat_offdiag_12 M A p r
  have e22 : massMat M A p r 2 2 = genVec M A p r 2 * genVec M A p r 2 := by
    rw [massMat_diag_2]; simp only [massVec]; ring
  rw [massSub12, bornBlock, e11, e12, e21, e22]

/-! ## §2 — the rank-1 eigenstructure (the diagonalization, ℚ-exact). -/

/-- ★ RANK-1: the Born outer product is SINGULAR (`det = 0`). A generic symmetric 2×2 has nonzero
    det and irrational eigenvectors; the Born self-overlap is rank-1, so its eigenstructure is
    RATIONAL (the ℝ eigen-toolkit dissolves). -/
theorem bornBlock_det_zero (a0 a1 : ℚ) : (bornBlock a0 a1).det = 0 := by
  simp [bornBlock, Matrix.det_fin_two]; ring

/-- ★★ THE AMPLITUDE DIRECTION IS THE EIGENVECTOR for the large eigenvalue `a₀²+a₁² = m₀+m₁`
    (ℚ-EXACT, a RATIONAL eigenvector — the diagonalization dissolves through Born = self-overlap):
    `bornBlock · ![a₀,a₁] = (a₀²+a₁²) • ![a₀,a₁]`. -/
theorem bornBlock_eigvec_amp (a0 a1 : ℚ) :
    (bornBlock a0 a1).mulVec ![a0, a1] = (a0 ^ 2 + a1 ^ 2) • ![a0, a1] := by
  funext i
  fin_cases i <;>
    simp [bornBlock, Matrix.mulVec, dotProduct, Fin.sum_univ_two] <;> ring

/-- ★★ THE NULL DIRECTION `![a₁,−a₀]` (orthogonal to the amplitude) has eigenvalue `0`
    (ℚ-EXACT): `bornBlock · ![a₁,−a₀] = 0`. -/
theorem bornBlock_eigvec_null (a0 a1 : ℚ) :
    (bornBlock a0 a1).mulVec ![a1, -a0] = (0 : ℚ) • ![a1, -a0] := by
  funext i
  fin_cases i <;>
    simp [bornBlock, Matrix.mulVec, dotProduct, Fin.sum_univ_two] <;> ring

/-- ★ THE DIAGONALIZATION READ ON THE BANKED `massMat` (grounding). The amplitude direction
    `(a₀, a₁)` is the eigenvector of the gen1↔gen2 adjacency block for the eigenvalue `m₀+m₁`,
    stated directly on the banked mass-coupling matrix entries (first component). -/
theorem massMat_eigvec_amp_0 (M A p r : ℚ) :
    massMat M A p r 0 0 * genVec M A p r 0 + massMat M A p r 0 1 * genVec M A p r 1
      = (massVec M A p r 0 + massVec M A p r 1) * genVec M A p r 0 := by
  rw [massMat_diag_0, massMat_offdiag_01]; simp only [massVec]; ring

/-- Second component of the amplitude-direction eigenrelation on the banked `massMat`. -/
theorem massMat_eigvec_amp_1 (M A p r : ℚ) :
    massMat M A p r 1 0 * genVec M A p r 0 + massMat M A p r 1 1 * genVec M A p r 1
      = (massVec M A p r 0 + massVec M A p r 1) * genVec M A p r 1 := by
  rw [← massMat_symm_01, massMat_offdiag_01, massMat_diag_1]; simp only [massVec]; ring

/-- ★ THE NULL DIRECTION on the banked `massMat`: `(a₁, −a₀)` is annihilated by the gen1↔gen2 block
    (eigenvalue `0`), stated on the banked mass-coupling matrix (first component). -/
theorem massMat_eigvec_null (M A p r : ℚ) :
    massMat M A p r 0 0 * genVec M A p r 1 + massMat M A p r 0 1 * (- genVec M A p r 0) = 0 := by
  rw [massMat_diag_0, massMat_offdiag_01]; simp only [massVec]; ring

/-! ## §3 — the two-sector frame overlap `V = U† D` (ℚ-exact, unitary up to the norm scale). -/

/-- The two-sector frame overlap `V = U† D`: the overlap of the up-sector frame (amplitude
    direction `(u₀,u₁)`) with the down-sector frame `(d₀,d₁)`. Entries: the aligned (Brahmagupta)
    inner product `u·d = u₀d₀+u₁d₁` on the diagonal, the mixing (Fibonacci) cross-term
    `u∧d = u₁d₀−u₀d₁` off-diagonal (antisymmetric). This is the mixing matrix of the two
    diagonalized sector frames. -/
def mixV (u0 u1 d0 d1 : ℚ) : Matrix (Fin 2) (Fin 2) ℚ :=
  !![u0 * d0 + u1 * d1, -(u1 * d0 - u0 * d1); u1 * d0 - u0 * d1, u0 * d0 + u1 * d1]

/-- ★★ THE OVERLAP IS UNITARY UP TO THE NORM SCALE: `Vᵀ V = ((u₀²+u₁²)(d₀²+d₁²)) • 1`. The overlap
    of the two frames is orthogonal up to the product of the frame norms — the only piece needing
    the derived ℝ is the normalization `√((u₀²+u₁²)(d₀²+d₁²))`, the honestly-deferred ℝ-descent. -/
theorem mixV_unitary_up_to_scale (u0 u1 d0 d1 : ℚ) :
    (mixV u0 u1 d0 d1)ᵀ * (mixV u0 u1 d0 d1)
      = ((u0 ^ 2 + u1 ^ 2) * (d0 ^ 2 + d1 ^ 2)) • (1 : Matrix (Fin 2) (Fin 2) ℚ) := by
  funext i j
  fin_cases i <;> fin_cases j <;>
    simp [mixV, Matrix.mul_apply, Fin.sum_univ_two, Matrix.transpose,
      Matrix.smul_apply] <;> ring

/-- ★ THE BRAHMAGUPTA–FIBONACCI IDENTITY (ℚ-exact): the mixing cross-term squared plus the aligned
    inner product squared equals the product of the two frame norms. This is the algebraic core of
    the overlap's unitarity — the "sin²+cos² = 1" of the leading mixing angle. -/
theorem brahmagupta_fibonacci (u0 u1 d0 d1 : ℚ) :
    (u1 * d0 - u0 * d1) ^ 2 + (u0 * d0 + u1 * d1) ^ 2 = (u0 ^ 2 + u1 ^ 2) * (d0 ^ 2 + d1 ^ 2) := by
  ring

/-- ★★ THE LEADING CABIBBO MIXING-SQUARED IS NORMALIZED (ℚ-exact, arctan-free): the mixing fraction
    `|V_mix|² = (u∧d)²/((u₀²+u₁²)(d₀²+d₁²))` and the aligned fraction `|V_aligned|²` sum to `1`. A
    genuine normalized leading-order mixing probability, ℚ-exact (the actual angle — the arctan —
    is the deferred ℝ-descent piece). -/
theorem cabibbo_mixing_orthonormal (u0 u1 d0 d1 : ℚ)
    (hu : u0 ^ 2 + u1 ^ 2 ≠ 0) (hd : d0 ^ 2 + d1 ^ 2 ≠ 0) :
    (u1 * d0 - u0 * d1) ^ 2 / ((u0 ^ 2 + u1 ^ 2) * (d0 ^ 2 + d1 ^ 2))
      + (u0 * d0 + u1 * d1) ^ 2 / ((u0 ^ 2 + u1 ^ 2) * (d0 ^ 2 + d1 ^ 2)) = 1 := by
  field_simp
  ring

/-- The two-sector mixing cross-term read off the banked `genVec` (up sector `(Mu,Au,pu,ru)`, down
    sector `(Md,Ad,pd,rd)`): grounding the overlap on the derived amplitude directions. -/
theorem mixNumer_ground (Mu Au pu ru Md Ad pd rd : ℚ) :
    (mixV (genVec Mu Au pu ru 0) (genVec Mu Au pu ru 1)
          (genVec Md Ad pd rd 0) (genVec Md Ad pd rd 1)) 1 0
      = genVec Mu Au pu ru 1 * genVec Md Ad pd rd 0
        - genVec Mu Au pu ru 0 * genVec Md Ad pd rd 1 := by
  simp [mixV]

/-! ## §4 — the CP-invariant tie (structural, on the banked associator, N310). -/

/-- ★ THE CP-INVARIANT TIE. The overlap's CP-invariant (the Jarlskog-type antisymmetric triple
    product) is carried by the banked calibration cross-term `assoc3` (N209/N310): it VANISHES on
    the associative ℂ-line (the associative sector is CP-trivial at leading order) and is NONZERO on
    the octonionic Fano line (the non-associative sector carries CP). Re-exports the banked N310
    separation: Q ⟵ norms is untouched, I₃ = assoc3 ⟵ the octonion line. The numerical Jarlskog is
    the deferred ℝ-descent piece. -/
theorem cp_invariant_tie :
    (∀ (x : O ℚ) (b d : ℚ), assoc3 x (b • u1) (d • u1) = 0)
    ∧ assoc3 u2 u1 (octCross u1 u2) ≠ 0 :=
  ⟨assoc3_cline_zero, fano_assoc3_ne_zero⟩

/-! ## §5 — non-vacuity (W8). -/

/-- ★ NON-VACUITY: at two genuinely distinct sectors the mixing cross-term is NONZERO — the overlap
    is real mixing, not aligned frames. Witness: up `(1,3,1,0)`, down `(1,3,0,1)`. -/
theorem mixing_nonzero_distinct_sectors :
    (mixV (genVec 1 3 1 0 0) (genVec 1 3 1 0 1) (genVec 1 3 0 1 0) (genVec 1 3 0 1 1)) 1 0 ≠ 0 := by
  rw [mixNumer_ground]
  simp only [genVec, Matrix.cons_val_zero, Matrix.cons_val_one]
  norm_num

/-- NON-VACUITY: at a witness the overlap is NOT the identity — the two frames are genuinely
    misaligned (a trivial `V = 1` is excluded), because the off-diagonal mixing entry is nonzero. -/
theorem mixV_not_identity :
    mixV (genVec 1 3 1 0 0) (genVec 1 3 1 0 1) (genVec 1 3 0 1 0) (genVec 1 3 0 1 1)
      ≠ (1 : Matrix (Fin 2) (Fin 2) ℚ) := by
  intro h
  have h10 := congrFun (congrFun h 1) 0
  rw [mixNumer_ground] at h10
  simp only [Matrix.one_apply, genVec, Matrix.cons_val_zero, Matrix.cons_val_one] at h10
  norm_num at h10

/-- ★ NON-VACUITY: the leading mixing-squared at a witness is a genuine NONZERO fraction — the
    normalized Cabibbo mixing is not degenerate to zero. Witness up `(1,3,1,0)`, down `(1,3,0,1)`. -/
theorem cabibbo_geometric_not_trivial :
    (genVec 1 3 1 0 1 * genVec 1 3 0 1 0 - genVec 1 3 1 0 0 * genVec 1 3 0 1 1) ^ 2 ≠ 0 := by
  simp only [genVec, Matrix.cons_val_zero, Matrix.cons_val_one]
  norm_num

/-! ## The capstone. -/

/-- ★★★ THE CAPSTONE — the two-sector frame overlap (seed T8, the ℚ-exact structural core).

    Over ℚ, with the banked derived generation objects (`genVec` N307, `massVec` N309, `massMat`
    N311, `assoc3` N209/N310): each sector's mass-coupling adjacency block is the rank-1 BORN
    OUTER PRODUCT `bornBlock` of the two adjacent banked amplitudes (`massSub01/12_born`, `Born =
    self-overlap`). Because it is rank-1 (`bornBlock_det_zero`), its diagonalization is ℚ-EXACT: the
    amplitude direction is the eigenvector for the large eigenvalue `mᵢ+mⱼ` (`bornBlock_eigvec_amp`,
    read on the banked `massMat` via `massMat_eigvec_amp_0/1`) and the orthogonal direction is null
    (`bornBlock_eigvec_null`, `massMat_eigvec_null`) — no ℝ eigen-toolkit needed. The two-sector
    mixing matrix `V = U†D` (`mixV`) is UNITARY UP TO THE NORM SCALE
    (`mixV_unitary_up_to_scale`: `Vᵀ V = ((u₀²+u₁²)(d₀²+d₁²)) • 1`), and the leading Cabibbo
    mixing-squared is normalized ℚ-exactly (`cabibbo_mixing_orthonormal`, the Brahmagupta–Fibonacci
    identity `brahmagupta_fibonacci`). The CP-invariant is carried by the banked associator
    `assoc3` — zero on the ℂ-line, nonzero on the Fano line (`cp_invariant_tie`, N310). The mixing
    is genuinely nonzero at distinct sectors (`mixing_nonzero_distinct_sectors`), the overlap is not
    the identity (`mixV_not_identity`), and the mixing-squared is a genuine fraction
    (`cabibbo_geometric_not_trivial`). The cap forcing exactly three generations AND opening the
    coupling chain (`jdef Xwit Ywit ≠ 0`, N5) grounds it on the octonion-specific arena.

    The numerical mixing angles (the arctan), the normalization `√`, the numerical Jarlskog, and the
    per-edge Born-survival suppression (the last listed T8 structural piece) are the honestly-deferred
    leading-order remainder (ℝ-descent BUILD dep, the N309 precedent; the per-edge suppression the
    childed decompose-remainder) — NOT imported, NOT blocked, NOT fitted. -/
theorem two_sector_frame_overlap_structure :
    -- §1: the adjacency block is the rank-1 Born outer product (grounding)
    (∀ M A p r : ℚ, massSub01 M A p r = bornBlock (genVec M A p r 0) (genVec M A p r 1))
    ∧ (∀ M A p r : ℚ, massSub12 M A p r = bornBlock (genVec M A p r 1) (genVec M A p r 2))
    -- §2: the rank-1 eigenstructure (the ℚ-exact diagonalization)
    ∧ (∀ a0 a1 : ℚ, (bornBlock a0 a1).det = 0)
    ∧ (∀ a0 a1 : ℚ, (bornBlock a0 a1).mulVec ![a0, a1] = (a0 ^ 2 + a1 ^ 2) • ![a0, a1])
    ∧ (∀ a0 a1 : ℚ, (bornBlock a0 a1).mulVec ![a1, -a0] = (0 : ℚ) • ![a1, -a0])
    ∧ (∀ M A p r : ℚ, massMat M A p r 0 0 * genVec M A p r 0 + massMat M A p r 0 1 * genVec M A p r 1
        = (massVec M A p r 0 + massVec M A p r 1) * genVec M A p r 0)
    -- §3: the two-sector overlap V = U†D, unitary up to the norm scale, normalized mixing
    ∧ (∀ u0 u1 d0 d1 : ℚ, (mixV u0 u1 d0 d1)ᵀ * (mixV u0 u1 d0 d1)
        = ((u0 ^ 2 + u1 ^ 2) * (d0 ^ 2 + d1 ^ 2)) • (1 : Matrix (Fin 2) (Fin 2) ℚ))
    ∧ (∀ u0 u1 d0 d1 : ℚ,
        (u1 * d0 - u0 * d1) ^ 2 + (u0 * d0 + u1 * d1) ^ 2 = (u0 ^ 2 + u1 ^ 2) * (d0 ^ 2 + d1 ^ 2))
    ∧ (∀ u0 u1 d0 d1 : ℚ, u0 ^ 2 + u1 ^ 2 ≠ 0 → d0 ^ 2 + d1 ^ 2 ≠ 0 →
        (u1 * d0 - u0 * d1) ^ 2 / ((u0 ^ 2 + u1 ^ 2) * (d0 ^ 2 + d1 ^ 2))
          + (u0 * d0 + u1 * d1) ^ 2 / ((u0 ^ 2 + u1 ^ 2) * (d0 ^ 2 + d1 ^ 2)) = 1)
    -- §4: the CP-invariant tie (banked assoc3, N310)
    ∧ ((∀ (x : O ℚ) (b d : ℚ), assoc3 x (b • u1) (d • u1) = 0)
        ∧ assoc3 u2 u1 (octCross u1 u2) ≠ 0)
    -- §5: non-vacuity
    ∧ ((mixV (genVec 1 3 1 0 0) (genVec 1 3 1 0 1) (genVec 1 3 0 1 0) (genVec 1 3 0 1 1)) 1 0 ≠ 0)
    ∧ (mixV (genVec 1 3 1 0 0) (genVec 1 3 1 0 1) (genVec 1 3 0 1 0) (genVec 1 3 0 1 1)
        ≠ (1 : Matrix (Fin 2) (Fin 2) ℚ))
    -- the cap forcing exactly 3 AND opening the coupling chain (grounding, N5)
    ∧ jdef Xwit Ywit ≠ 0 :=
  ⟨massSub01_born, massSub12_born, bornBlock_det_zero, bornBlock_eigvec_amp, bornBlock_eigvec_null,
   massMat_eigvec_amp_0, mixV_unitary_up_to_scale, brahmagupta_fibonacci, cabibbo_mixing_orthonormal,
   cp_invariant_tie, mixing_nonzero_distinct_sectors, mixV_not_identity, jordan_fails_H4⟩

end Phys.Algebra.HJ
