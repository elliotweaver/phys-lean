/-
# N371 — arc-F F5: THE PMNS NEUTRINO MIXING COMPLETION — the TRIMAXIMAL COLUMN from the
#        SELF-BLIND MASSLESS NEUTRINO, the LARGE-vs-SMALL dichotomy vs the banked CKM, and the
#        tri-bimaximal (TBM) leading-order structure from magic + μτ symmetry. Over the DERIVED
#        ℝ `ContinuumQ.Cut`.
  =============================================================================================

  ⭐ FIFTH OWNER-AUTHORIZED SEED — STANDARD-MODEL COMPLETION, TARGET F5
  (`docs/SEED_SM_COMPLETION.md`, §F5). The directed single successor of N370 (F4 proper). §F5:
  "the neutrino mixing completion (PMNS/TBM, leading order, m₁=0, normal ordering) from the same
  frame-overlap machinery as the CKM (T8), with the fold phase."

  ## THE THEORY-NATIVE KEY — WHY LEPTON MIXING IS LARGE WHERE QUARK MIXING IS SMALL.

  The mixing matrix is the OVERLAP of two diagonalized generation frames (T8, N312 `mixV`). For the
  QUARKS both frames are HIERARCHICAL Born frames (the cascade amplitudes), so the overlap is nearly
  aligned and the CKM angles are SMALL — banked N343 `sin²θᵢⱼ = m_light/(m_light+m_heavy)`, the
  Born-weight of the lighter generation, ~{0.005, 0.056, 0.0003}.

  For the LEPTONS one frame is DIFFERENT. N336 (arc-C C2) proved the light-neutrino mass operator's
  ZERO-eigenvector (the massless `m₁ = 0` state) is the fold's self-blind DEMOCRATIC direction
  `selfDir = (1,1,1)` — because the fold cannot see itself (`othersProj · selfDir = 0`,
  `selfDir_zero_mode`). A zero-mode IS a mass eigenvector, so `selfDir` is a genuine PMNS COLUMN, and
  its normalized Born component-weight is EQUIPARTITIONED: `1/3` on every flavor — the TRIMAXIMAL
  column. Overlapping a HIERARCHICAL charged-lepton frame with a DEMOCRATIC (self-blind) neutrino
  frame gives LARGE angles. **ONE CAUSE, TWO TERMINATIONS: the SAME self-blindness (`Poth·selfDir=0`,
  N336) that makes the lightest neutrino massless makes leptonic mixing large.**

  ## WHAT THIS NODE BANKS (over the derived ℝ `Cut`)

  §1 — THE TRIMAXIMAL COLUMN (theorem-grade, grounded on N336 `selfDir`).
    * `demColumnWeight α := (selfDir α)² / Σⱼ (selfDir j)²` — the normalized Born component-weight of
      the self-blind massless-ν direction in flavor `α`.
    * `selfDir_normSq : Σⱼ (selfDir j)² = 3`; `selfDir_comp_sq : (selfDir α)² = 1`.
    * ★★ `demColumnWeight_eq : demColumnWeight α = 1/3` — EQUIPARTITION, the trimaximal column.
    * ★ `demColumn_equipartition`; `demColumn_sum_one : Σ_α demColumnWeight α = 1` (unitarity).
    * `demColumn_is_massless_dir : massOfDir (othersProj·D₀) M selfDir = 0` (re-export N336: the
      trimaximal column IS the massless m₁=0 state).

  §2 — THE LARGE-vs-SMALL DICHOTOMY (theorem-grade, vs the banked CKM N343).
    * ★★ `demColumn_gt_ckm_12/23/13 : sinSqMix mass_i mass_j < demColumnWeight 0` — the trimaximal
      weight `1/3` is strictly LARGER than each banked hierarchical CKM Born-weight angle. The
      theory-native reason lepton mixing is large where quark mixing is small.

  §3 — THE TRI-BIMAXIMAL STRUCTURE (LEADING-ORDER, from magic + μτ symmetry).
    * `muTauMagic a b c d := !![a,b,b; b,c,d; b,d,c]` — the μτ (2↔3)-symmetric magic operator.
    * The three TBM Fourier eigenvectors: `tbmV1=(2,−1,−1)` (solar), `tbmV2=(1,1,1)` (trimaximal, =
      `selfDir`, `tbmV2_eq_selfDir`), `tbmV3=(0,1,−1)` (atmospheric).
    * ★★ `muTauMagic_eigvec_trimaximal` (`M·selfDir = (a+2b)•selfDir` when magic `a+b=c+d`),
      `muTauMagic_eigvec_solar` (`(a−b)•`), `muTauMagic_eigvec_atm` (`(c−d)•`, from μτ alone).
    * orthonormal modes; the exact rational PMNS weights → ★★ `sinSq13_pmns = 0` (reactor),
      `sinSq23_pmns = 1/2` (atmospheric maximal), `sinSq12_pmns = 1/3` (solar) — the tri-bimaximal
      angles, √ dissolving through the Born-square (as N343).

  ## HONEST GRADE (mandatory flags, seed §F5 HONEST GRADE MIX)
    • THEOREM-GRADE (foundations-only over Cut): §1 the trimaximal column = the self-blind massless
      direction (weight 1/3, equipartition, unitarity) and §2 the large-vs-small dichotomy vs the
      banked CKM. Pure Cut-matrix arithmetic on the banked N336 `selfDir` and N343 CKM angles.
    • LEADING-ORDER (§3, flagged, seed §F5 "~few %"): the full TBM completion. `magic` is DERIVED
      (the trimaximal eigenvector IS the N336 massless self-direction). `μτ (2↔3) exchange symmetry`
      is the leading-order structural input — the three generations are the HIERARCHICAL cascade
      rungs ℂ→ℍ→𝕆 (N2), not literally 2↔3-symmetric, so `muTauMagic` is a leading-order model whose
      eigenvectors are the TBM Fourier modes. §3 is a CONDITIONAL theorem: GIVEN the μτ-magic
      structure, the eigenvectors and the tri-bimaximal angles follow exactly.
    • m₁=0 / normal ordering: re-exported from N336 (`self_generation_massless`, `massless_is_floor`).
      ⚠️ STANDING DESI Σm_ν fight + the joint kill-line (any m₁>0 kills the ν-spectrum law AND the
      sterile-ν_R dark-matter story together): REMOVABLE PROSE ONLY, NEVER fit; JUNO/DUNE ordering is
      the adjudicator. No empirical PMNS angle / Σm_ν / decimal in any statement or proof.

  ## PHYSICS-WORDS-REMOVABLE (STANDARD §2, seed G5)
  Delete "neutrino / PMNS / mixing / tri-bimaximal / trimaximal / solar / atmospheric / reactor /
  lepton / CKM / flavor": what survives — for `selfDir = (1,1,1)` over `Cut`, its normalized
  component-weight `(selfDir α)²/Σⱼ(selfDir j)²` is `1/3` for each `α`, strictly larger than each
  banked `sinSqMix mass_i mass_j`; and the general symmetric `!![a,b,b; b,c,d; b,d,c]` over `Cut` has
  `(1,1,1)`, `(2,−1,−1)`, `(0,1,−1)` as eigenvectors (with the stated eigenvalues under `a+b=c+d`),
  with normalized component-weights `0`, `1/2`, `1/3`. Pure real-matrix (Cut) analysis. No physics
  name does any logical work.

  ## THE ONE CAUSE (THE ONE LAW)
  The SAME octonion self-blindness that caps the tower at three (N5), furnishes exactly three matter
  slots (N267), makes the family so(3) blind to all generation content (N290), and makes the lightest
  neutrino massless (N336 `selfDir_zero_mode`) is what makes the neutrino PMNS column TRIMAXIMAL — the
  fold's blindness to itself pins the massless eigenvector to the democratic direction `(1,1,1)`, and
  the democratic-vs-hierarchical frame contrast IS the large-vs-small mixing dichotomy. One blindness,
  one column.

  ## THE DISSOLUTION / MOAT (STANDARD §0)
  The Standard Model POSITS a discrete flavor symmetry (A₄/S₄) by hand to obtain tri-bimaximal mixing,
  and treats "why is leptonic mixing large" as an unsolved puzzle separate from the quark hierarchy.
  The theory DERIVES the trimaximal column from the fold's self-blind massless direction (N336) and
  DERIVES the large-vs-small dichotomy from democratic-vs-hierarchical frames (vs the banked CKM,
  N343) — zero free continuous parameters, no posited flavor group. No measured PMNS angle, no
  Jarlskog, no PDG number enters any proof; comparison to data is removable prose (leading-order).

  ## NOT FREE-FLOATING (SOUL rail)
  The §1 types cite the banked `selfDir` (N336, the massless zero-mode) and `massOfDir`/`othersProj`;
  the §2 types cite the banked `sinSqMix mass1/mass2/mass0` (N343, the CKM Born-weights); the §3
  trimaximal eigenvector `tbmV2` IS `selfDir` (`tbmV2_eq_selfDir`). Not generic over an arbitrary
  field — grounded on the banked C2 self-blind neutrino direction and the D5 CKM angles over `Cut`.

  Foundations-only (seed G6): no posited axiom, no sorry, no kernel-trust bypass, NO Mathlib
  number-system content import, NO `Real.exp`/`Real.pi`. No empirical ν mixing number appears anywhere.
-/
import Phys.Algebra.NeutrinoMasslessGeneration
import Phys.Algebra.GenerationMixingAnglesNumeric
import Mathlib.Tactic

namespace Phys.Algebra
namespace NeutrinoTrimaximal

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra.GenerationMixingAngles
open Phys.Algebra.GenerationMassRatios
open Matrix

noncomputable section

/-! ## §1 — THE TRIMAXIMAL COLUMN (the self-blind massless-ν direction, N336). -/

/-- THE TRIMAXIMAL COLUMN WEIGHT: the normalized Born component-weight of the self-blind massless-ν
    direction `selfDir = (1,1,1)` (N336, the m₁=0 zero-mode) in flavor `α`. The analog of N343's
    `sinSqMix_born` (the component weight of the Born eigenvector), but for the DEMOCRATIC (self-blind)
    direction rather than a hierarchical amplitude direction. -/
def demColumnWeight (α : Fin 3) : Cut := (selfDir α) ^ 2 / (∑ j, (selfDir j) ^ 2)

/-- The Born normalization of the democratic direction: `‖selfDir‖² = 3`. -/
theorem selfDir_normSq : (∑ j, (selfDir j) ^ 2) = (3 : Cut) := by
  simp only [selfDir, Fin.sum_univ_three, Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_two, Matrix.tail_cons]
  norm_num

/-- Each squared component of `selfDir` is `1`. -/
theorem selfDir_comp_sq (α : Fin 3) : (selfDir α) ^ 2 = (1 : Cut) := by
  fin_cases α <;>
    simp only [selfDir, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.cons_val_two, Matrix.tail_cons] <;> norm_num

/-- ★★ THE TRIMAXIMAL COLUMN: each flavor's democratic weight is EXACTLY `1/3` — equipartition, the
    trimaximal column. Because the massless-ν eigenvector is the fold's self-blind democratic
    direction (N336), its PMNS column is maximally NON-hierarchical: equal Born weight on every
    flavor. -/
theorem demColumnWeight_eq (α : Fin 3) : demColumnWeight α = (1 : Cut) / 3 := by
  unfold demColumnWeight
  rw [selfDir_normSq, selfDir_comp_sq]

/-- ★ EQUIPARTITION: all three flavor weights are EQUAL — the maximal non-hierarchy of the trimaximal
    column, in contrast to the hierarchical CKM Born-weights. -/
theorem demColumn_equipartition (α β : Fin 3) : demColumnWeight α = demColumnWeight β := by
  rw [demColumnWeight_eq, demColumnWeight_eq]

/-- ★ THE COLUMN IS NORMALIZED (unitarity): the three trimaximal weights sum to `1`. -/
theorem demColumn_sum_one : (∑ α, demColumnWeight α) = (1 : Cut) := by
  simp only [Fin.sum_univ_three, demColumnWeight_eq]
  norm_num

/-- THE TRIMAXIMAL COLUMN IS THE MASSLESS m₁=0 STATE (re-export N336): for the others-coupling
    `D = othersProj · D₀` the self-blind democratic direction has zero mass. The column whose weights
    are `1/3` IS the lightest (massless) neutrino's eigenvector — self-blindness ⟹ trimaximal. -/
theorem demColumn_is_massless_dir (D0 : Matrix (Fin 3) (Fin 3) Cut) (M : Cut) :
    massOfDir (othersProj * D0) M selfDir = 0 :=
  self_generation_massless D0 M

/-! ## §2 — THE LARGE-vs-SMALL DICHOTOMY (vs the banked CKM Born-weights, N343). -/

/-- ★★ THE TRIMAXIMAL WEIGHT IS LARGE vs the CKM 1↔2 (Cabibbo-genre) angle: `sinSqMix m₁ m₂ <
    demColumnWeight 0`. The banked N343 hierarchical CKM Born-weight `sin²θ₁₂ ≈ 0.0048` is strictly
    less than the trimaximal `1/3`. -/
theorem demColumn_gt_ckm_12 : sinSqMix mass1 mass2 < demColumnWeight 0 := by
  rw [demColumnWeight_eq]
  have h := sinSq12_hi
  have hb : (482 : Cut) / 100000 < 1 / 3 := by norm_num
  linarith

/-- ★★ THE TRIMAXIMAL WEIGHT IS LARGE vs the CKM 2↔3 angle: `sinSqMix m₂ m₀ < demColumnWeight 0`. -/
theorem demColumn_gt_ckm_23 : sinSqMix mass2 mass0 < demColumnWeight 0 := by
  rw [demColumnWeight_eq]
  have h := sinSq23_hi
  have hb : (562 : Cut) / 10000 < 1 / 3 := by norm_num
  linarith

/-- ★★ THE TRIMAXIMAL WEIGHT IS LARGE vs the CKM 1↔3 (far-corner) angle: `sinSqMix m₁ m₀ <
    demColumnWeight 0`. -/
theorem demColumn_gt_ckm_13 : sinSqMix mass1 mass0 < demColumnWeight 0 := by
  rw [demColumnWeight_eq]
  have h := sinSq13_hi
  have hb : (288 : Cut) / 1000000 < 1 / 3 := by norm_num
  linarith

/-! ## §3 — THE TRI-BIMAXIMAL STRUCTURE (LEADING-ORDER, from magic + μτ symmetry). -/

/-- THE μτ (2↔3)-SYMMETRIC MAGIC OPERATOR `!![a,b,b; b,c,d; b,d,c]` over the derived ℝ. `magic`
    (row-sums equal, `a+b=c+d`) is DERIVED — its trimaximal eigenvector IS the N336 massless
    self-direction; `μτ` (the 2↔3 exchange invariance) is the leading-order structural input. -/
def muTauMagic (a b c d : Cut) : Matrix (Fin 3) (Fin 3) Cut :=
  !![a, b, b; b, c, d; b, d, c]

/-- The SOLAR tri-bimaximal Fourier mode `(2,−1,−1)` (electron-rich). -/
def tbmV1 : Fin 3 → Cut := ![2, -1, -1]
/-- The TRIMAXIMAL / democratic Fourier mode `(1,1,1)` — the DC mode of the ℤ₃ cycle. -/
def tbmV2 : Fin 3 → Cut := ![1, 1, 1]
/-- The ATMOSPHERIC (bimaximal) Fourier mode `(0,1,−1)`. -/
def tbmV3 : Fin 3 → Cut := ![0, 1, -1]

/-- ★ THE TRIMAXIMAL MODE IS THE FOLD'S SELF-BLIND DEMOCRATIC DIRECTION (N336 `selfDir`). The middle
    TBM column is not chosen — it is the banked massless-ν eigenvector. -/
theorem tbmV2_eq_selfDir : tbmV2 = selfDir := rfl

/-- ★★ MAGIC ⟹ the trimaximal mode is an eigenvector: `M·(1,1,1) = (a+2b)•(1,1,1)` when the row-sums
    are equal (`a+b = c+d`, magic). This is the DERIVED half — the trimaximal eigenvector is forced by
    the magic (equal-row-sum) structure, which the self-blind democratic direction realizes. -/
theorem muTauMagic_eigvec_trimaximal (a b c d : Cut) (hmagic : a + b = c + d) :
    (muTauMagic a b c d).mulVec tbmV2 = (a + 2 * b) • tbmV2 := by
  funext i
  fin_cases i <;>
    simp [muTauMagic, tbmV2, Matrix.mulVec, dotProduct, Fin.sum_univ_three] <;> linarith [hmagic]

/-- ★★ MAGIC ⟹ the solar mode is an eigenvector: `M·(2,−1,−1) = (a−b)•(2,−1,−1)` when magic. -/
theorem muTauMagic_eigvec_solar (a b c d : Cut) (hmagic : a + b = c + d) :
    (muTauMagic a b c d).mulVec tbmV1 = (a - b) • tbmV1 := by
  funext i
  fin_cases i <;>
    simp [muTauMagic, tbmV1, Matrix.mulVec, dotProduct, Fin.sum_univ_three] <;> linarith [hmagic]

/-- ★★ μτ ⟹ the atmospheric mode is an eigenvector: `M·(0,1,−1) = (c−d)•(0,1,−1)` — from the 2↔3
    exchange symmetry ALONE (no magic needed). -/
theorem muTauMagic_eigvec_atm (a b c d : Cut) :
    (muTauMagic a b c d).mulVec tbmV3 = (c - d) • tbmV3 := by
  funext i
  fin_cases i <;>
    simp [muTauMagic, tbmV3, Matrix.mulVec, dotProduct, Fin.sum_univ_three] <;> ring

/-- The solar and trimaximal modes are Born-orthogonal. -/
theorem tbm_orth_12 : (∑ i, tbmV1 i * tbmV2 i) = (0 : Cut) := by
  simp [tbmV1, tbmV2, Fin.sum_univ_three]; norm_num
/-- The solar and atmospheric modes are Born-orthogonal. -/
theorem tbm_orth_13 : (∑ i, tbmV1 i * tbmV3 i) = (0 : Cut) := by
  simp [tbmV1, tbmV3, Fin.sum_univ_three]
/-- The trimaximal and atmospheric modes are Born-orthogonal. -/
theorem tbm_orth_23 : (∑ i, tbmV2 i * tbmV3 i) = (0 : Cut) := by
  simp [tbmV2, tbmV3, Fin.sum_univ_three]

/-- The Born norm of the solar mode: `‖(2,−1,−1)‖² = 6`. -/
theorem tbmV1_normSq : (∑ i, tbmV1 i ^ 2) = (6 : Cut) := by
  simp [tbmV1, Fin.sum_univ_three]; norm_num
/-- The Born norm of the atmospheric mode: `‖(0,1,−1)‖² = 2`. -/
theorem tbmV3_normSq : (∑ i, tbmV3 i ^ 2) = (2 : Cut) := by
  simp [tbmV3, Fin.sum_univ_three]; norm_num

/-- The normalized Born component-weight `|U_αk|² = (v α)²/‖v‖²` of a mixing column `v`. -/
def wgt (v : Fin 3 → Cut) (α : Fin 3) : Cut := (v α) ^ 2 / (∑ j, v j ^ 2)

/-- ★ THE REACTOR ANGLE VANISHES (`|U_e3|² = 0`): the electron has NO weight in the atmospheric
    column — `sin²θ₁₃ = 0` at leading order (the tri-bimaximal reactor prediction). -/
theorem reactor_zero : wgt tbmV3 0 = 0 := by
  unfold wgt; rw [tbmV3_normSq]; simp [tbmV3]

/-- The μ weight in the atmospheric column is `1/2`. -/
theorem atm_maximal_mu : wgt tbmV3 1 = 1 / 2 := by
  unfold wgt; rw [tbmV3_normSq]; simp [tbmV3]

/-- The e weight in the trimaximal (solar) column is `1/3` — `= demColumnWeight 0` (the self-blind
    democratic weight, `wgt tbmV2 = demColumnWeight` since `tbmV2 = selfDir`). -/
theorem solar_third_e : wgt tbmV2 0 = 1 / 3 := by
  have hbridge : wgt tbmV2 0 = demColumnWeight 0 := rfl
  rw [hbridge, demColumnWeight_eq]

/-- ★★ THE ATMOSPHERIC MIXING IS MAXIMAL: `sin²θ₂₃ = |U_μ3|²/(1−|U_e3|²) = 1/2` (45°) at leading
    order — the tri-bimaximal atmospheric prediction. -/
theorem sinSq23_pmns : wgt tbmV3 1 / (1 - wgt tbmV3 0) = 1 / 2 := by
  rw [reactor_zero, atm_maximal_mu]; norm_num

/-- ★★ THE SOLAR MIXING IS TRIMAXIMAL: `sin²θ₁₂ = |U_e2|²/(1−|U_e3|²) = 1/3` at leading order — the
    tri-bimaximal solar prediction, `= demColumnWeight` (the self-blind democratic weight). -/
theorem sinSq12_pmns : wgt tbmV2 0 / (1 - wgt tbmV3 0) = 1 / 3 := by
  rw [reactor_zero, solar_third_e]; norm_num

/-! ## §4 — NON-VACUITY (W8). -/

/-- NON-VACUITY: the trimaximal weight is a genuine number strictly in `(0,1)` — a real mixing, not
    `0` (no mixing) nor `1` (aligned). -/
theorem demColumn_mem : (0 : Cut) < demColumnWeight 0 ∧ demColumnWeight 0 < 1 := by
  rw [demColumnWeight_eq]; constructor <;> norm_num

/-- ★ NON-VACUITY: the three magic+μτ eigenvalues are GENERICALLY DISTINCT (a genuine non-degenerate
    spectrum, so the three TBM eigenvectors are the real mixing columns). Witness `a=4,b=1,c=3,d=2`
    (magic `5=5`): eigenvalues `a+2b=6`, `a−b=3`, `c−d=1` are all distinct. -/
theorem eigenvalues_distinct :
    (4 + 2 * 1 : Cut) ≠ (4 - 1) ∧ (4 - 1 : Cut) ≠ (3 - 2) ∧ (4 + 2 * 1 : Cut) ≠ (3 - 2) := by
  refine ⟨?_, ?_, ?_⟩ <;> norm_num

/-- ★ NON-VACUITY: the trimaximal mode can be MASSLESS — the eigenvalue `a+2b` vanishes at the witness
    `a=0,b=0,c=1,d=−1` (magic `0=0`), tying the trimaximal column to the N336 massless m₁=0 state. -/
theorem trimaximal_massless_witness :
    (muTauMagic 0 0 1 (-1)).mulVec tbmV2 = (0 : Cut) • tbmV2 := by
  have h := muTauMagic_eigvec_trimaximal 0 0 1 (-1) (by norm_num)
  simpa using h

/-- ★ NON-VACUITY: the atmospheric column is genuinely bimaximal — the μ and τ weights are EQUAL
    (`|U_μ3|² = |U_τ3|²`), the maximal 2↔3 mixing, distinct from any hierarchical collapse. -/
theorem atm_mu_tau_equal : wgt tbmV3 1 = wgt tbmV3 2 := by
  unfold wgt; rw [tbmV3_normSq]
  simp only [tbmV3, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two, Matrix.tail_cons]
  norm_num

/-! ## §5 — THE CAPSTONE. -/

/-- ★★★ THE CAPSTONE — arc-F F5, the PMNS neutrino mixing completion, all cores at once, over the
    derived ℝ `Cut` and the banked C2 self-blind neutrino direction (N336) + the D5 CKM Born-weights
    (N343).

    §1 THE TRIMAXIMAL COLUMN (theorem-grade): the massless-ν eigenvector is the fold's self-blind
    democratic direction `selfDir = (1,1,1)` (N336), whose normalized Born component-weight is
    EQUIPARTITIONED `demColumnWeight α = 1/3` (`demColumnWeight_eq`), equal across flavors
    (`demColumn_equipartition`), summing to `1` (`demColumn_sum_one`, unitarity), and IS the massless
    m₁=0 state (`demColumn_is_massless_dir`).

    §2 THE LARGE-vs-SMALL DICHOTOMY (theorem-grade): the trimaximal `1/3` is strictly LARGER than each
    banked hierarchical CKM Born-weight (`demColumn_gt_ckm_12/23/13`, vs N343) — the theory-native
    reason leptonic mixing is large where quark mixing is small (democratic vs hierarchical frames).

    §3 THE TRI-BIMAXIMAL STRUCTURE (leading-order): the μτ-symmetric magic operator `muTauMagic` has
    the TBM Fourier eigenvectors — trimaximal `(1,1,1) = selfDir` (`muTauMagic_eigvec_trimaximal`,
    magic-forced), solar `(2,−1,−1)` (`muTauMagic_eigvec_solar`), atmospheric `(0,1,−1)`
    (`muTauMagic_eigvec_atm`, μτ-forced) — giving the exact rational PMNS angles `sin²θ₁₃ = 0`
    (`reactor_zero`), `sin²θ₂₃ = 1/2` (`sinSq23_pmns`, maximal), `sin²θ₁₂ = 1/3` (`sinSq12_pmns`).

    LEADING-ORDER (seed §F5): `magic` DERIVED (the trimaximal eigenvector IS the N336 massless
    self-direction); `μτ` the leading-order structural input (the 3 generations are the hierarchical
    cascade rungs ℂ→ℍ→𝕆, not literally 2↔3-symmetric). The standing DESI Σm_ν fight + joint
    kill-line are REMOVABLE PROSE only, NEVER fit; no empirical PMNS angle in any proof. -/
theorem pmns_neutrino_mixing_completion :
    -- §1: the trimaximal column = the self-blind massless-ν direction
    (∀ α : Fin 3, demColumnWeight α = (1 : Cut) / 3)
    ∧ (∀ α β : Fin 3, demColumnWeight α = demColumnWeight β)
    ∧ ((∑ α, demColumnWeight α) = (1 : Cut))
    ∧ (∀ (D0 : Matrix (Fin 3) (Fin 3) Cut) (M : Cut), massOfDir (othersProj * D0) M selfDir = 0)
    -- §2: the large-vs-small dichotomy vs the banked CKM
    ∧ (sinSqMix mass1 mass2 < demColumnWeight 0)
    ∧ (sinSqMix mass2 mass0 < demColumnWeight 0)
    ∧ (sinSqMix mass1 mass0 < demColumnWeight 0)
    -- §3: the tri-bimaximal structure (leading-order, magic + μτ)
    ∧ (tbmV2 = selfDir)
    ∧ (∀ a b c d : Cut, a + b = c + d →
        (muTauMagic a b c d).mulVec tbmV2 = (a + 2 * b) • tbmV2)
    ∧ (∀ a b c d : Cut, a + b = c + d →
        (muTauMagic a b c d).mulVec tbmV1 = (a - b) • tbmV1)
    ∧ (∀ a b c d : Cut, (muTauMagic a b c d).mulVec tbmV3 = (c - d) • tbmV3)
    ∧ (wgt tbmV3 0 = 0)
    ∧ (wgt tbmV3 1 / (1 - wgt tbmV3 0) = 1 / 2)
    ∧ (wgt tbmV2 0 / (1 - wgt tbmV3 0) = 1 / 3) :=
  ⟨demColumnWeight_eq, demColumn_equipartition, demColumn_sum_one, demColumn_is_massless_dir,
   demColumn_gt_ckm_12, demColumn_gt_ckm_23, demColumn_gt_ckm_13,
   tbmV2_eq_selfDir, muTauMagic_eigvec_trimaximal, muTauMagic_eigvec_solar, muTauMagic_eigvec_atm,
   reactor_zero, sinSq23_pmns, sinSq12_pmns⟩

end

end NeutrinoTrimaximal
end Phys.Algebra
