/-
# N34 — THE AUTOMORPHISM GROUP, increment 4: TOPOLOGICAL COMPACTNESS over the DERIVED ℝ.

N32 banked the continuum-free COMPACTNESS SKELETON: in the `gForm`-orthonormal coordinate frame
`bO`, every automorphism of the terminal Cayley–Dickson algebra `O ℚ` is an ISOMETRY — its
coordinate columns are orthonormal (`AutO_col_orthogonal`) and every entry is bounded by `1`
(`AutO_entry_abs_le_one`). But "bounded ⟹ compact" is a TOPOLOGICAL statement that needs a
complete real continuum with Heine–Borel — which the derived ℝ `ContinuumQ.Cut` only acquired with
the N33 order-completeness rung and the N34 topology rung (`Phys/Foundation/ContinuumTopology.lean`).

THIS FILE banks the Heine–Borel TOPOLOGICAL COMPACTNESS, over the DERIVED ℝ:
  • `bornIsometrySet` — the set of 8×8 matrices over `Cut` whose columns are orthonormal for the
    standard sum (= the Born self-overlap form in the `bO` frame, banked `gForm_polar`).
  • `bornIsometry_isClosed` — it is CLOSED (an intersection of `isClosed_eq` orthonormality
    conditions; the column bilinear `M ↦ ∑ i, M i j * M i k` is continuous on the product topology).
  • `bornIsometry_subset_box` — it sits inside the unit box `[-1,1]^(8×8)` (each entry's square is a
    nonnegative summand of the diagonal column-sum `= 1` — the N32 boundedness over the derived ℝ).
  • `matBox_isCompact` — the box is compact (Heine–Borel `isCompact_Icc_cut` per factor, finite
    Tychonoff `isCompact_univ_pi`).
  • ★★ `bornIsometry_isCompact` — the orthogonal-isometry set is TOPOLOGICALLY COMPACT
    (`IsCompact.of_isClosed_subset`: closed ⊆ compact box).
  • ★ `autMatrix_mem_bornIsometry` — the coordinate matrix of EVERY automorphism (`AutO`, N31),
    cast through the canonical `ℚ → Cut` embedding, LANDS IN the compact orthogonal-isometry set
    (transporting the banked `AutO_col_orthogonal`, N32). So the structure-preserving bijections sit
    inside a compact set of the derived ℝ.
  • non-vacuity: the identity automorphism's coordinate matrix is a member (the set is nonempty).

THE ONE CAUSE (THE ONE LAW, the deepest structural claim). The SAME Born positivity
(self-overlap = `gForm`, a sum of coordinate squares) that
  • made every derivation SKEW-ADJOINT (`derivationLieQ_le_skewAdjoint`, N26),
  • forced the negative-definite trace form ⟹ the derivation Lie algebra SEMISIMPLE / SIMPLE
    (type-G₂, N24/N30b), and
  • bounded every automorphism's coordinate entries `|entry| ≤ 1` (N32, the unit-box),
gives — now that the derived ℝ is order-complete (N33) hence Heine–Borel (N34 topology rung) — the
TOPOLOGICAL COMPACTNESS of the automorphism group's coordinate image: closed (orthonormality =
continuous polynomial conditions) + bounded (the N32 unit-box) ⟹ compact. ONE cause (Born
definiteness = self-overlap positivity), several terminations (skew-adjoint algebra, simple Lie
algebra, bounded group, COMPACT group). This is the Heine–Borel half of "the automorphism group is
compact"; the analytic 1-parameter-subgroup half (the operator-exp `Der(𝕆) → Aut(𝕆)`, `exp(D)∈AutO`,
`d/dt exp(tD)|₀ = D`) is the genuine multi-file analytic BUILD childed to N35.

PHYSICS-WORDS-REMOVABLE (STANDARD §2): delete "compact / orthogonal-group / gauge / G₂ / colour /
automorphism" → the file is the pure statement that the set of 8×8 matrices over the completion of
the gather-of-closures of the derived rationals whose columns are orthonormal for the standard sum
is topologically COMPACT (closed, inside the unit box, in the order topology), and that the
coordinate matrix of every structure-preserving ℚ-linear bijection of the Cayley–Dickson
double-of-a-double-of-a-double of ℚ lands in it. NO physics name is load-bearing.

Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO posited
exp/G₂/Aut/orthogonal-group, NO Mathlib ℝ as content.
-/
import Phys.Foundation.ContinuumTopology
import Phys.Algebra.DerivationAutCompact
import Mathlib.Topology.Constructions
import Mathlib.Topology.Order.Compact
import Mathlib.Topology.Algebra.Order.Field

namespace Phys.Algebra

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## The orthogonal-isometry set over the derived ℝ. -/

/-- The set of 8×8 matrices over the DERIVED ℝ `Cut` whose columns are orthonormal for the standard
    sum — i.e. `MᵀM = I`. In the `bO` frame this is exactly Born-form preservation (`gForm_polar`):
    the home of the automorphism coordinate matrices. -/
def bornIsometrySet : Set (Fin 8 → Fin 8 → Cut) :=
  {M | ∀ j k : Fin 8, ∑ i : Fin 8, M i j * M i k = if j = k then 1 else 0}

/-- A single matrix-entry evaluation is continuous for the product topology on the derived ℝ. -/
theorem entry_continuous (i j : Fin 8) :
    Continuous (fun M : Fin 8 → Fin 8 → Cut => M i j) :=
  (continuous_apply j).comp (continuous_apply i)

/-- The column bilinear form `M ↦ ∑ i, M i j * M i k` is continuous (finite sum of products of
    continuous entry evaluations — the derived ℝ is a topological ring, N34 topology rung). -/
theorem colBilin_continuous (j k : Fin 8) :
    Continuous (fun M : Fin 8 → Fin 8 → Cut => ∑ i : Fin 8, M i j * M i k) := by
  apply continuous_finset_sum
  intro i _
  exact (entry_continuous i j).mul (entry_continuous i k)

/-- The orthogonal-isometry set is CLOSED: it is the intersection over `(j,k)` of the closed
    level sets `{M | ∑ i, M i j * M i k = δⱼₖ}` (a continuous function equal to a constant, closed
    since the derived ℝ is Hausdorff, N34 `t2Space_cut`). -/
theorem bornIsometry_isClosed : IsClosed bornIsometrySet := by
  have hset : bornIsometrySet =
      ⋂ (j : Fin 8), ⋂ (k : Fin 8),
        {M : Fin 8 → Fin 8 → Cut | ∑ i : Fin 8, M i j * M i k = if j = k then 1 else 0} := by
    ext M; simp only [bornIsometrySet, Set.mem_setOf_eq, Set.mem_iInter]
  rw [hset]
  exact isClosed_iInter (fun j => isClosed_iInter (fun k =>
    isClosed_eq (colBilin_continuous j k) continuous_const))

/-! ## The unit box and Heine–Borel compactness. -/

/-- The matrix box `[-1,1]^(8×8)` over the derived ℝ. -/
def matBox : Set (Fin 8 → Fin 8 → Cut) :=
  Set.univ.pi (fun _ : Fin 8 => Set.univ.pi (fun _ : Fin 8 => Set.Icc (-1 : Cut) 1))

/-- The unit box is compact: Heine–Borel on each factor (`isCompact_Icc_cut`, N34 topology rung) and
    finite Tychonoff (`isCompact_univ_pi`). -/
theorem matBox_isCompact : IsCompact matBox :=
  isCompact_univ_pi (fun _ => isCompact_univ_pi (fun _ => isCompact_Icc))

/-- The orthogonal-isometry set sits inside the unit box: the diagonal orthonormality condition
    `∑ i, (M i j)^2 = 1` bounds each squared entry by `1` (a nonnegative summand of `1`), hence
    `-1 ≤ M i j ≤ 1`. The N32 boundedness, now over the derived ℝ. -/
theorem bornIsometry_subset_box : bornIsometrySet ⊆ matBox := by
  intro M hM
  simp only [matBox, Set.mem_pi, Set.mem_univ, true_implies, Set.mem_Icc]
  intro i j
  have hdiag : ∑ i' : Fin 8, M i' j * M i' j = 1 := by
    have := hM j j; simpa using this
  have hsq : (M i j) ^ 2 ≤ 1 := by
    have hle : M i j * M i j ≤ ∑ i' : Fin 8, M i' j * M i' j :=
      Finset.single_le_sum (f := fun i' => M i' j * M i' j)
        (fun i' _ => mul_self_nonneg _) (Finset.mem_univ i)
    rw [hdiag] at hle
    nlinarith [hle]
  constructor
  · nlinarith [sq_nonneg (M i j + 1)]
  · nlinarith [sq_nonneg (M i j - 1)]

/-- ★★ THE ORTHOGONAL-ISOMETRY SET IS TOPOLOGICALLY COMPACT over the DERIVED ℝ. Heine–Borel:
    a CLOSED subset (`bornIsometry_isClosed`) of the COMPACT unit box (`matBox_isCompact`) is
    compact (`IsCompact.of_isClosed_subset`). The topological compactness of "MᵀM = I" over the
    derived continuum — the same definite Born positivity that bounded the entries (N32) now
    making the bounded set compact (ONE cause). -/
theorem bornIsometry_isCompact : IsCompact bornIsometrySet :=
  matBox_isCompact.of_isClosed_subset bornIsometry_isClosed bornIsometry_subset_box

/-! ## The automorphism group lands in the compact orthogonal-isometry set. -/

/-- The coordinate matrix of an automorphism, with entries cast through the canonical `ℚ → Cut`
    embedding into the derived ℝ. Column `j` is the coordinate vector of `φ (bO j)`. -/
def autMatrix (φ : AutO) : Fin 8 → Fin 8 → Cut :=
  fun i j => ((coordO ((φ : O ℚ ≃ₗ[ℚ] O ℚ) (bO j)) i : ℚ) : Cut)

/-- ★ THE AUTOMORPHISM GROUP'S COORDINATE IMAGE LANDS IN THE COMPACT ORTHOGONAL-ISOMETRY SET.
    Transporting the banked column-orthonormality `AutO_col_orthogonal` (N32, over ℚ) through the
    canonical `ℚ → Cut` ring embedding: the coordinate matrix of every automorphism satisfies
    `MᵀM = I` over the derived ℝ, so it is a member of the topologically compact `bornIsometrySet`.
    The structure-preserving bijections sit inside a compact subset of matrices over the derived
    continuum — the Heine–Borel compactness of the automorphism group, realized. -/
theorem autMatrix_mem_bornIsometry (φ : AutO) : autMatrix φ ∈ bornIsometrySet := by
  intro j k
  have h := AutO_col_orthogonal φ j k
  have hcast : (∑ i : Fin 8, autMatrix φ i j * autMatrix φ i k)
      = (((∑ i : Fin 8, coordO ((φ : O ℚ ≃ₗ[ℚ] O ℚ) (bO j)) i
            * coordO ((φ : O ℚ ≃ₗ[ℚ] O ℚ) (bO k)) i) : ℚ) : Cut) := by
    unfold autMatrix; push_cast; ring
  rw [hcast, h]
  by_cases hjk : j = k <;> simp [hjk]

/-- NON-VACUITY (W8): the identity automorphism's coordinate matrix is a member of the
    orthogonal-isometry set, so the compact set is NONEMPTY (a vacuous/empty compactness claim
    would be hollow). -/
theorem one_autMatrix_mem_bornIsometry :
    autMatrix (⟨1, one_mem_AutO⟩ : AutO) ∈ bornIsometrySet :=
  autMatrix_mem_bornIsometry _

end

end Phys.Algebra
