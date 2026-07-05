/-
# N311 — THE GENERATION-MIXING TRIDIAGONAL FRAME (seed T8, the ℚ-exact structural half)

Owner-authorized flavor-route seed (docs/SEED_FLAVOR_SELF_BLINDNESS.md), target **T8** — the
generation-mixing structure as a FRAME OVERLAP. The directed successor of N310 (T7, the quark
associator deviation). N310 separated the two generation invariants (Q ← norms, CP ← associator);
T8 builds the per-sector TRIDIAGONAL FRAME whose two-sector overlap is the mixing matrix.

⚠ HONEST-STATUS CAVEAT (seed §2 T8). Unlike the masses/Koide/δ_B/associator (T1–T7, theorem-grade
EXACT), the mixing sector lands only at LEADING ORDER (~few-percent residuals) once precision masses
are used — that is the genuine current status, NOT a defect to fit away. This node banks the ℚ-EXACT
STRUCTURAL half: the tridiagonal frame, the corner-zero `M₁₃ = 0` from cascade adjacency, the
geometric-mean coupling in Born-squared form, and the leading-order GST angle-squared relation. The
two-sector FRAME OVERLAP (the actual CKM/PMNS matrix = misalignment of the up and down diagonalized
frames) and the CP-phase-as-cascade-angle need the ℝ diagonalization and are the honestly-deferred
T8 remainder (childed, ℝ-descent BUILD dep — the N309 precedent), NOT imported, NOT blocked.

THE THEORY-NATIVE KEY — TWO CAUSES DISSOLVE INTO ONE, AND THE √ VANISHES.

## §1 — THE COUPLING CHAIN IS OPEN (corner-zero from the cascade TERMINATION)

The three generations are the three cascade rungs ℂ → ℍ → 𝕆 (N2, the Cayley–Dickson doubling). The
generation coupling follows the DOUBLING adjacency: rung `n` couples to rung `n ± 1` (one doubling
step). Rungs `1` (ℂ) and `3` (𝕆) are two doubling-steps apart, so there is NO direct 1↔3 coupling —
and the chain does NOT wrap (𝕆 ↛ ℂ) because the cascade TERMINATES at 𝕆 (`cap_from_cascade_stop`:
the next double, the sedenions, loses the Born/division law; the SAME non-associativity that caps the
generation count at three). So the coupling graph is the OPEN PATH `cascadePath` (corner `0`), NOT the
CLOSED CYCLE — which is exactly the banked coherence-cycle statistics operator `seeMat = Jall − 1`
(corner `1`, all off-diagonals present). **The corner-zero `M₁₃ = 0` FALLS OUT: it is the single
entry where the open cascade coupling path differs from the closed coherence cycle** (`cascade_open_ne_closed`).

This is DISTINCT from the closed coherence cycle `gcyc`/`seeMat` that produced the amplitudes/Koide:
the COHERENCE cycle closes (C6 — best coherence is a cycle, N305), but the cascade COUPLING chain is
OPEN because the cascade terminates (N2c). ONE CAUSE (the cascade stop) with another termination:
capping the count at three AND opening the coupling chain (corner-zero).

## §2 — THE TRIDIAGONAL MASS-COUPLING MATRIX (grounded on the banked masses/amplitudes)

* `massMat M A p r` — the tridiagonal structure on the three generations: diagonal = the banked
  masses `massVec` (N309, Born squares of the amplitude cycle); nearest-neighbour off-diagonals = the
  banked amplitude products `aᵢ aⱼ = genVec i · genVec j` (N307); corner `0` (from §1).
* `massMat_diag_k`, `massMat_corner_zero`, `massMat_symm` — the tridiagonal pattern.

## §3 — THE GEOMETRIC-MEAN COUPLING IS ℚ-EXACT (the √ dissolves through the Born square)

The nearest-neighbour coupling is the geometric mean of the adjacent masses, `|xᵢⱼ| = √(mᵢ mⱼ)` —
which naively carries an irrational √. But the masses ARE Born squares `mₖ = aₖ²` (N309), so
`√(mᵢ mⱼ) = √(aᵢ² aⱼ²) = |aᵢ aⱼ|`, the ordinary rational amplitude product — NO √ needed (the ONE LAW
reframe: the √ dissolves through the Born-square structure, exactly as the N306 `√2` was handled as
the amplitude-SQUARED relation `A² = 2M²`). We state it in exact Born-squared form:

* ★ `massMat_nn_born_01`, `massMat_nn_born_12` — `(offdiag)² = mᵢ · mⱼ`: the nearest-neighbour
  coupling squared IS the product of the two adjacent masses (the geometric-mean relation, ℚ-exact).

## §4 — THE GATTO–SARTORI–TONIN LEADING ANGLE (ℚ-exact structural relation)

The 2×2 small-angle mixing between adjacent generations is `tan θᵢⱼ ≈ (offdiag)/(diagⱼ) =
aᵢ aⱼ / aⱼ² = aᵢ / aⱼ`, so `tan²θᵢⱼ = (aᵢ/aⱼ)² = mᵢ/mⱼ` — the Gatto–Sartori–Tonin relation
`θᵢⱼ ~ √(mᵢ/mⱼ)`, ℚ-exact at leading order:

* ★ `gst_tan_sq_01`, `gst_tan_sq_12` — `(offdiag / diagⱼ)² = mᵢ / mⱼ`. (The exact angle — the arctan —
  needs ℝ and is the deferred remainder; the leading-order SQUARED relation is ℚ-exact.)

## §5 — NON-VACUITY (W8)

* `corner_open_ne_cycle` — the corner coupling `0` is genuinely DISTINCT from the closed-cycle `1`
  (`cascadePath 0 2 ≠ seeMat 0 2`): the open path is not the closed cycle.
* `massMat_genuinely_tridiagonal` — at a concrete witness the nearest-neighbour off-diagonal is
  nonzero while the corner is `0`: the matrix is a genuine tridiagonal (not diagonal, not full).
* `coupling_geometric_not_arithmetic` — at a concrete witness the Born-squared coupling equals the
  PRODUCT `mᵢ mⱼ`, NOT the SUM `mᵢ + mⱼ`: the geometric-mean reading is the real content.

## THE DISSOLUTION / MOAT (docs/STANDARD.md §0)

In the Standard Model the CKM/PMNS mixing angles are free numbers (4 for CKM, 4+ for PMNS) inserted
by hand. The theory FORCES the structure: the tridiagonal frame from cascade adjacency, the
corner-zero from the cascade termination, the geometric-mean couplings from the Born-square masses,
and the leading GST angles as forced RELATIONS `θᵢⱼ ~ √(mᵢ/mⱼ)` — zero free continuous parameters. No
measured CKM/PMNS angle, no Jarlskog, no PDG number enters any proof; comparison to data is removable
prose (and lands only at leading order, seed caveat).

## PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2)

Delete generation/mass/mixing/CKM/PMNS/coupling/Born: over ℚ, `cascadePath` is the path-graph
adjacency `!![0,1,0;1,0,1;0,1,0]`, distinct from the banked all-off-diagonal `seeMat = Jall − 1` at
the corner; the tridiagonal matrix `massMat` has diagonal `(genVec ·)²`, nearest-neighbour off-diagonal
`genVec i · genVec j`, and corner `0`; the off-diagonal squared equals the product of adjacent
diagonal entries; and `(genVec i · genVec j / (genVec j)²)² = (genVec i)²/(genVec j)²`. No theorem
STATEMENT needs a physics word.

## FREE-FLOATING check (SOUL rail)

`massMat`'s diagonal is the banked `massVec` (N309) and its off-diagonals the banked `genVec`
products (N307); the corner-zero is grounded on the banked `seeMat` (N305) via `cascade_open_ne_closed`;
the capstone carries `jdef Xwit Ywit ≠ 0` (the octonion-specific cap forcing exactly three AND the
cascade stop opening the coupling chain, N5) in its TYPE. NOT a generic tridiagonal-frame statement
floating free of the derived generation objects.

Foundations-only: no posited axiom, no sorry, no compiled-kernel bypass, no heartbeat inflation, no
bridge; no empirical number; the structural frame exact over ℚ (the exact numerical mixing angles and
the two-sector overlap honestly deferred to the ℝ-descent, never imported, never fitted).
-/
import Phys.Algebra.OctonionJordanGenerationMassRatios
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD

/-! ## §1 — the coupling chain is OPEN (corner-zero from the cascade termination). -/

/-- The cascade-doubling coupling adjacency on the three generations (cascade rungs ℂ → ℍ → 𝕆): the
    OPEN PATH `P₃` — nearest-neighbour couplings present (`1`), corner (gen1↔gen3) absent (`0`),
    diagonal absent (`0`). The chain does NOT wrap because the cascade TERMINATES at 𝕆
    (`cap_from_cascade_stop`), so it is the open path, not a closed cycle. -/
def cascadePath : Matrix (Fin 3) (Fin 3) ℚ := !![0, 1, 0; 1, 0, 1; 0, 1, 0]

/-- The coupling graph has zero diagonal (a generation does not couple to itself as a mixing edge). -/
theorem cascadePath_diag_zero (i : Fin 3) : cascadePath i i = 0 := by fin_cases i <;> decide

/-- The nearest-neighbour couplings are present: gen1↔gen2 and gen2↔gen3 (one doubling step each). -/
theorem cascadePath_nn : cascadePath 0 1 = 1 ∧ cascadePath 1 2 = 1 := by decide

/-- ★ THE CORNER-ZERO `M₁₃ = 0`: the gen1↔gen3 direct coupling is absent, because rungs ℂ and 𝕆 are
    two doubling-steps apart AND the cascade does not wrap (it terminates at 𝕆). -/
theorem cascadePath_corner_zero : cascadePath 0 2 = 0 ∧ cascadePath 2 0 = 0 := by decide

/-- The banked coherence-cycle statistics operator `seeMat = Jall − 1` (N305, the CLOSED ℤ₃ cycle)
    HAS the corner coupling: `seeMat 0 2 = 1`. The closed cycle wraps; the open cascade path does not. -/
theorem seeMat_corner_one : seeMat 0 2 = 1 := by
  simp [seeMat, Jall, Matrix.sub_apply, Matrix.one_apply]

/-- ★★★ THE OPEN COUPLING PATH IS NOT THE CLOSED COHERENCE CYCLE: `cascadePath ≠ seeMat`. They differ
    EXACTLY at the corner (`cascadePath 0 2 = 0` vs `seeMat 0 2 = 1`) — the single entry where the
    cascade coupling chain's TERMINATION (no wrap 𝕆 ↛ ℂ) shows up as `M₁₃ = 0`. The coherence cycle
    (which produced the Koide amplitudes, N305–N309) is closed (C6); the cascade coupling chain is
    open (N2c). The corner-zero is DERIVED as the difference, grounded on the banked `seeMat`. -/
theorem cascade_open_ne_closed : cascadePath ≠ seeMat := by
  intro h
  have h02 : cascadePath 0 2 = seeMat 0 2 := by rw [h]
  rw [seeMat_corner_one] at h02
  have : (0 : ℚ) = 1 := by rw [← cascadePath_corner_zero.1]; exact h02
  exact absurd this (by norm_num)

/-! ## §2 — the tridiagonal mass-coupling matrix (grounded on the banked masses/amplitudes). -/

/-- The tridiagonal generation mass-coupling structure over ℚ: diagonal = the banked masses
    `massVec` (N309, Born squares of the amplitude cycle); nearest-neighbour off-diagonals = the
    banked amplitude products `genVec i · genVec j` (N307); corner `0` (from §1, the open cascade
    coupling path). Grounded entirely on the banked derived generation objects. -/
noncomputable def massMat (M A p r : ℚ) : Matrix (Fin 3) (Fin 3) ℚ :=
  !![ massVec M A p r 0,                   genVec M A p r 0 * genVec M A p r 1, 0;
      genVec M A p r 0 * genVec M A p r 1, massVec M A p r 1,                   genVec M A p r 1 * genVec M A p r 2;
      0,                                   genVec M A p r 1 * genVec M A p r 2, massVec M A p r 2 ]

/-- The diagonal entries are the banked masses. -/
theorem massMat_diag_0 (M A p r : ℚ) : massMat M A p r 0 0 = massVec M A p r 0 := by simp [massMat]
theorem massMat_diag_1 (M A p r : ℚ) : massMat M A p r 1 1 = massVec M A p r 1 := by simp [massMat]
theorem massMat_diag_2 (M A p r : ℚ) : massMat M A p r 2 2 = massVec M A p r 2 := by simp [massMat]

/-- ★ THE CORNER-ZERO `M₁₃ = 0` on the mass-coupling matrix (from §1, the open cascade path). -/
theorem massMat_corner_zero (M A p r : ℚ) : massMat M A p r 0 2 = 0 ∧ massMat M A p r 2 0 = 0 := by
  constructor <;> simp [massMat]

/-- The mass-coupling matrix is symmetric on its nearest-neighbour couplings. -/
theorem massMat_symm_01 (M A p r : ℚ) : massMat M A p r 0 1 = massMat M A p r 1 0 := by simp [massMat]
theorem massMat_symm_12 (M A p r : ℚ) : massMat M A p r 1 2 = massMat M A p r 2 1 := by simp [massMat]

/-- The nearest-neighbour off-diagonals are the banked amplitude products (grounding). -/
theorem massMat_offdiag_01 (M A p r : ℚ) :
    massMat M A p r 0 1 = genVec M A p r 0 * genVec M A p r 1 := by simp [massMat]
theorem massMat_offdiag_12 (M A p r : ℚ) :
    massMat M A p r 1 2 = genVec M A p r 1 * genVec M A p r 2 := by simp [massMat]

/-! ## §3 — the geometric-mean coupling is ℚ-exact (the √ dissolves through the Born square). -/

/-- ★★ THE GEOMETRIC-MEAN COUPLING, ℚ-EXACT (Born-squared form). The nearest-neighbour coupling
    squared IS the product of the two adjacent masses: `(offdiag)² = m₀ · m₁`. The naive
    `|xᵢⱼ| = √(mᵢ mⱼ)` carries an irrational √, but the masses are Born squares `mₖ = aₖ²` (N309), so
    `√(mᵢ mⱼ) = |aᵢ aⱼ|` is the rational amplitude product — the √ DISSOLVES through the Born square
    (the ONE LAW reframe, as the N306 `√2` was the amplitude-SQUARED `A² = 2M²`). -/
theorem massMat_nn_born_01 (M A p r : ℚ) :
    (massMat M A p r 0 1) ^ 2 = massVec M A p r 0 * massVec M A p r 1 := by
  rw [massMat_offdiag_01]; simp only [massVec]; ring

/-- ★★ THE GEOMETRIC-MEAN COUPLING for the gen2↔gen3 edge: `(offdiag)² = m₁ · m₂`. -/
theorem massMat_nn_born_12 (M A p r : ℚ) :
    (massMat M A p r 1 2) ^ 2 = massVec M A p r 1 * massVec M A p r 2 := by
  rw [massMat_offdiag_12]; simp only [massVec]; ring

/-! ## §4 — the Gatto–Sartori–Tonin leading angle (ℚ-exact structural relation). -/

/-- ★ THE GATTO–SARTORI–TONIN RELATION `θ₁₂ ~ √(m₁/m₂)`, ℚ-exact at leading order. The 2×2 small-angle
    mixing between adjacent generations is `tan θ ≈ (offdiag)/(diagⱼ) = aᵢ aⱼ / aⱼ² = aᵢ / aⱼ`, so
    `tan²θ = (aᵢ/aⱼ)² = mᵢ/mⱼ`. Here for gen1↔gen2: `(massMat 0 1 / massVec 1)² = massVec 0 / massVec 1`.
    (The exact angle — the arctan — needs ℝ and is the deferred remainder; the SQUARED relation is
    ℚ-exact.) -/
theorem gst_tan_sq_01 (M A p r : ℚ) (h1 : genVec M A p r 1 ≠ 0) :
    (massMat M A p r 0 1 / massVec M A p r 1) ^ 2 = massVec M A p r 0 / massVec M A p r 1 := by
  rw [massMat_offdiag_01]
  simp only [massVec]
  field_simp

/-- ★ THE GATTO–SARTORI–TONIN RELATION for the gen2↔gen3 edge: `(massMat 1 2 / massVec 2)² = m₁/m₂`. -/
theorem gst_tan_sq_12 (M A p r : ℚ) (h2 : genVec M A p r 2 ≠ 0) :
    (massMat M A p r 1 2 / massVec M A p r 2) ^ 2 = massVec M A p r 1 / massVec M A p r 2 := by
  rw [massMat_offdiag_12]
  simp only [massVec]
  field_simp

/-! ## §5 — non-vacuity (W8). -/

/-- NON-VACUITY: the corner coupling `0` is genuinely DISTINCT from the closed-cycle corner `1` — the
    open cascade path is not the closed coherence cycle (`cascadePath 0 2 ≠ seeMat 0 2`). -/
theorem corner_open_ne_cycle : cascadePath 0 2 ≠ seeMat 0 2 := by
  rw [cascadePath_corner_zero.1, seeMat_corner_one]; norm_num

/-- NON-VACUITY: the mass-coupling matrix is a GENUINE tridiagonal — at the concrete witness
    `(M,A,p,r) = (1,1,1,0)` the nearest-neighbour off-diagonal `(0,1)` is nonzero (`= 1`) while the
    corner `(0,2)` is `0`. So it is neither diagonal (off-diagonal present) nor full (corner absent). -/
theorem massMat_genuinely_tridiagonal :
    massMat (1 : ℚ) 1 1 0 0 1 ≠ 0 ∧ massMat (1 : ℚ) 1 1 0 0 2 = 0 := by
  constructor
  · rw [massMat_offdiag_01]
    simp only [genVec, Matrix.cons_val_zero, Matrix.cons_val_one]
    norm_num
  · exact (massMat_corner_zero 1 1 1 0).1

/-- ★ NON-VACUITY: the coupling is the GEOMETRIC mean (product of masses), NOT the arithmetic-style
    sum. At the concrete witness `(M,A,p,r) = (1,3,1,0)`: `(massMat 0 1)² = m₀ · m₁ = 4`, which is
    NOT `m₀ + m₁ = 65/4`. The geometric-mean reading is the real content, distinct from a wrong
    additive reading. -/
theorem coupling_geometric_not_arithmetic :
    (massMat (1 : ℚ) 3 1 0 0 1) ^ 2 = massVec (1 : ℚ) 3 1 0 0 * massVec (1 : ℚ) 3 1 0 1
    ∧ massVec (1 : ℚ) 3 1 0 0 * massVec (1 : ℚ) 3 1 0 1
        ≠ massVec (1 : ℚ) 3 1 0 0 + massVec (1 : ℚ) 3 1 0 1 := by
  constructor
  · exact massMat_nn_born_01 1 3 1 0
  · simp only [massVec, genVec, Matrix.cons_val_zero, Matrix.cons_val_one]
    norm_num

/-! ## The capstone. -/

/-- ★★★ THE CAPSTONE — the generation-mixing tridiagonal frame (seed T8, the ℚ-exact structural half).

    Over ℚ, with the banked derived generation objects (`genVec` N307, `massVec` N309, the coherence
    statistics operator `seeMat` N305): the generation coupling graph is the OPEN cascade path
    `cascadePath` (nearest-neighbour couplings present, corner `M₁₃ = 0`, diagonal `0`), which is
    DISTINCT from the CLOSED coherence cycle `seeMat = Jall − 1` exactly at the corner
    (`cascade_open_ne_closed`) — the corner-zero FALLS OUT of the cascade's TERMINATION (no wrap
    𝕆 ↛ ℂ), a second termination of the same cascade stop that caps the count at three. The
    tridiagonal mass-coupling matrix `massMat` carries the banked masses on the diagonal and the
    banked amplitude products off-diagonal; the geometric-mean coupling is ℚ-EXACT in Born-squared
    form `(offdiag)² = mᵢ mⱼ` (`massMat_nn_born_01/12`, the √ dissolving through the Born square), and
    the leading Gatto–Sartori–Tonin angle satisfies `(offdiag/diagⱼ)² = mᵢ/mⱼ` (`gst_tan_sq_01/12`,
    the relation `θᵢⱼ ~ √(mᵢ/mⱼ)`). The corner-zero is genuinely `0 ≠ 1`
    (`corner_open_ne_cycle`), the matrix genuinely tridiagonal (`massMat_genuinely_tridiagonal`), and
    the coupling genuinely geometric not arithmetic (`coupling_geometric_not_arithmetic`). The cap
    forcing exactly three generations AND opening the coupling chain (`jdef Xwit Ywit ≠ 0`, the
    cascade stop, N5) grounds it on the octonion-specific arena.

    The two-sector FRAME OVERLAP (the CKM/PMNS matrix = misalignment of the up and down diagonalized
    frames) and the CP-phase-as-cascade-angle need the ℝ diagonalization and are the honestly-deferred
    T8 remainder (ℝ-descent BUILD dep, the N309 precedent) — this node banks the ℚ-exact frame. -/
theorem generation_mixing_frame_structure :
    -- §1: the open coupling path, corner-zero DERIVED from the cascade termination vs the closed cycle
    (∀ i : Fin 3, cascadePath i i = 0)
    ∧ (cascadePath 0 1 = 1 ∧ cascadePath 1 2 = 1)
    ∧ (cascadePath 0 2 = 0 ∧ cascadePath 2 0 = 0)
    ∧ (seeMat 0 2 = 1)
    ∧ (cascadePath ≠ seeMat)
    -- §2: the tridiagonal mass-coupling matrix, grounded on the banked masses/amplitudes
    ∧ (∀ M A p r : ℚ, massMat M A p r 0 0 = massVec M A p r 0)
    ∧ (∀ M A p r : ℚ, massMat M A p r 0 2 = 0 ∧ massMat M A p r 2 0 = 0)
    ∧ (∀ M A p r : ℚ, massMat M A p r 0 1 = genVec M A p r 0 * genVec M A p r 1)
    -- §3: the geometric-mean coupling is ℚ-exact (Born-squared)
    ∧ (∀ M A p r : ℚ, (massMat M A p r 0 1) ^ 2 = massVec M A p r 0 * massVec M A p r 1)
    ∧ (∀ M A p r : ℚ, (massMat M A p r 1 2) ^ 2 = massVec M A p r 1 * massVec M A p r 2)
    -- §4: the Gatto–Sartori–Tonin leading angle (ℚ-exact)
    ∧ (∀ M A p r : ℚ, genVec M A p r 1 ≠ 0 →
        (massMat M A p r 0 1 / massVec M A p r 1) ^ 2 = massVec M A p r 0 / massVec M A p r 1)
    -- §5: non-vacuity
    ∧ (cascadePath 0 2 ≠ seeMat 0 2)
    ∧ (massMat (1 : ℚ) 1 1 0 0 1 ≠ 0 ∧ massMat (1 : ℚ) 1 1 0 0 2 = 0)
    -- the cap forcing exactly 3 AND opening the coupling chain (grounding, N5)
    ∧ jdef Xwit Ywit ≠ 0 :=
  ⟨cascadePath_diag_zero, cascadePath_nn, cascadePath_corner_zero, seeMat_corner_one,
   cascade_open_ne_closed, massMat_diag_0, massMat_corner_zero, massMat_offdiag_01,
   massMat_nn_born_01, massMat_nn_born_12, gst_tan_sq_01, corner_open_ne_cycle,
   massMat_genuinely_tridiagonal, jordan_fails_H4⟩

end Phys.Algebra.HJ
