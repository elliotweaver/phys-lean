import Phys.Algebra.ChargeRepresentationBuilt
import Phys.Algebra.ChiralGenerationIsospinTrace
import Mathlib.Tactic

/-!
  # N705b — ISOSPIN ON THE OCCUPANCY CARRIER: THE WITNESS (scratch)
  ================================================================================
  The named successor of N705 (`IsospinOnOccupancyCarrier`, ChargeRepresentationBuilt
  header): construct `T3Op, YOp : Module.End ℚ GenRep2` on the SAME chirality-doubled
  16-dimensional occupancy carrier that carries the banked `Tr(Q²) = 16/3`
  (`trace_QOp2_sq`, N705), prove Gell-Mann–Nishijima `QOp2 = T3Op + YOp` as an
  OPERATOR identity, and land the trace pillars as REAL `LinearMap.trace`s:
    `Tr(T3²) = 2`, `Tr(Y²) = 10/3`, `Tr(Y·T3) = 0`, `Tr(Y²)/Tr(T3²) = 5/3`,
    `sin²θ_W = Tr(T3²)/Tr(Q²) = 3/8` — welded BY NAME to the banked parametric
    assembly (`hyperRatio_at`, `weinberg_at`, `assembly_delivers_5_3`,
    `weinberg_delivers_3_8`, N317; `generation_isospin_trace`, N318).

  THE WITNESS ASSIGNMENT (enumerated: workbench/wt-B/enum705b.py + enum705b_check.py,
  both run green). On the 16 states (S, sector), S ⊆ Fin 3, sector ∈ {0,1}:
      t3(S, 0) = 1/2,        t3(S, 1) = 0        (all 8 first-sector states up),
      y(S, sec) = qS S − t3(S, sec)              (GMN definitional),
  i.e. `yA S = qS S − 1/2` on sector 0 and `yB S = qS S` on sector 1. The check
  script certifies: Tr(T3²) = 2, Tr(Y²) = 10/3, Tr(Y·T3) = 0, ratio 5/3,
  Tr(T3) = 4, Tr(Y) = 4, sin² = 3/8, Σq = 8, Σq² = 16/3, Σ(2q−1) = 0.

  ⚠ UNIQUENESS — HONEST STATUS (read off the enumeration, not asserted). The full
  enumeration (enum705b.py) over all t3-assignments valued in the banked fund2Weight
  spectrum {0, ±1/2} with (a) Tr(T3²) = 2, (b) Tr(Y²) = 10/3 (⇔ Σ q·t3 = 2 under
  GMN), (c) y = q − t3, found **12687 solutions** — the witness is A solution, NOT
  the unique one. What IS forced across ALL 12687: `Tr(Y·T3) = 0` (algebraically:
  Tr(Y·T3) = Σq·t3 − ΣT3² = 2 − 2 = 0 — banked here parametrically as
  `orthogonality_forced`). Also read off the enumeration: NO solution is traceless
  (Σt3 = 0 impossible — the check script's obstruction 2), and NO solution pairs
  ±1/2 with equal hypercharge on doublets (doubleted count 0) — so an su(2)_L-doublet
  grading of the OCCUPANCY states with these traces does not exist in this spectrum;
  the doublet structure lives on the banked fundamental-2 (N318), not on a ±½
  relabelling of `GenState`. This node therefore banks the WITNESS theorems + the
  forced orthogonality, and names the successor honestly:
  **IsospinAssignmentForcing** (N705b-successor): formalize the enumeration's
  obstructions (no traceless solution; no doubleted solution) and characterize the
  12687-solution set / the invariants forced across it.

  Consumes ONLY banked modules: ChargeRepresentationBuilt (`GenState`, `GenRep`,
  `GenRep2`, `qS`, `QOp`, `QOp2`, `sum_qS`, `sum_qS_sq`, `trace_QOp`, `trace_QOp_sq`,
  `trace_QOp2_sq`), ChiralGenerationChargeTrace (`hyperRatio`, `weinberg`,
  `hyperRatio_at`, `weinberg_at`, `hyper_ratio_reduction`), ChiralGenerationIsospinTrace
  (`fund2Weight`, `fund2_per_doublet_trace`), ChiralGenerationAnomalyCancellation
  (`blCharge`, `anomalyLinear`, `anomalyLinear_zero`). NO sorry, NO axiom, NO new
  numerics — every constant is a banked value or a proved trace.
-/

open scoped BigOperators

namespace Phys.Algebra
namespace IsospinOnOccupancyCarrier

open ChargeRepresentationBuilt

/-! ## §1 The witness assignment: the diagonal eigenvalue laws per sector. -/

/-- Sector-0 isospin law: every occupancy state of the first chiral sector carries
    `t3 = +1/2` — the banked fundamental-2 "up" weight `fund2Weight 0` (N318). -/
def t3A (_ : GenState) : ℚ := 1 / 2

/-- Sector-1 isospin law: every occupancy state of the conjugate sector carries
    `t3 = 0` (the singlet value). -/
def t3B (_ : GenState) : ℚ := 0

/-- Sector-0 hypercharge law, GMN-definitional: `y = q − t3 = qS S − 1/2`. -/
def yA (S : GenState) : ℚ := qS S - 1 / 2

/-- Sector-1 hypercharge law, GMN-definitional: `y = q − 0 = qS S`. -/
def yB (S : GenState) : ℚ := qS S

/-- The witness `t3` values sit in the BANKED fundamental-2 weight spectrum:
    `t3A = fund2Weight 0 = 1/2` and `t3B = 0` (the singlet). -/
theorem t3_spectrum_banked (S : GenState) :
    t3A S = fund2Weight 0 ∧ t3B S = 0 := by
  constructor
  · simp [t3A, fund2Weight]
  · rfl

/-! ## §2 The operators: genuine diagonal endomorphisms of the doubled carrier. -/

/-- Sector-0 isospin operator. -/
noncomputable def T3OpA : Module.End ℚ GenRep := Matrix.toLin' (Matrix.diagonal t3A)

/-- Sector-1 isospin operator. -/
noncomputable def T3OpB : Module.End ℚ GenRep := Matrix.toLin' (Matrix.diagonal t3B)

/-- ★ THE ISOSPIN OPERATOR on the chirality-doubled carrier: diagonal per sector with
    the witness law (`+1/2` on sector 0, `0` on sector 1). -/
noncomputable def T3Op : Module.End ℚ GenRep2 := T3OpA.prodMap T3OpB

/-- Sector-0 hypercharge operator. -/
noncomputable def YOpA : Module.End ℚ GenRep := Matrix.toLin' (Matrix.diagonal yA)

/-- Sector-1 hypercharge operator. -/
noncomputable def YOpB : Module.End ℚ GenRep := Matrix.toLin' (Matrix.diagonal yB)

/-- ★ THE HYPERCHARGE OPERATOR on the chirality-doubled carrier: diagonal per sector
    with the GMN-definitional law `y = q − t3`. -/
noncomputable def YOp : Module.End ℚ GenRep2 := YOpA.prodMap YOpB

/-- Pointwise action of `T3Op`: sector 0 scales by `1/2`, sector 1 by `0`. -/
theorem T3Op_apply (f : GenRep2) (T : GenState) :
    (T3Op f).1 T = t3A T * f.1 T ∧ (T3Op f).2 T = t3B T * f.2 T := by
  constructor <;>
    simp [T3Op, T3OpA, T3OpB, Matrix.toLin'_apply, Matrix.mulVec_diagonal]

/-- Pointwise action of `YOp`: each occupancy component scales by its hypercharge. -/
theorem YOp_apply (f : GenRep2) (T : GenState) :
    (YOp f).1 T = yA T * f.1 T ∧ (YOp f).2 T = yB T * f.2 T := by
  constructor <;>
    simp [YOp, YOpA, YOpB, Matrix.toLin'_apply, Matrix.mulVec_diagonal]

/-! ## §3 ★★★ GELL-MANN–NISHIJIMA ON THE CARRIER: `Q = T3 + Y` as operators. -/

/-- The eigenvalue laws satisfy GMN state-by-state on sector 0: `qS = t3A + yA`. -/
theorem gmn_law_A (S : GenState) : qS S = t3A S + yA S := by
  unfold t3A yA; ring

/-- The eigenvalue laws satisfy GMN state-by-state on sector 1: `qS = t3B + yB`. -/
theorem gmn_law_B (S : GenState) : qS S = t3B S + yB S := by
  unfold t3B yB; ring

/-- ★★★ GELL-MANN–NISHIJIMA AS AN OPERATOR IDENTITY on the 16-dimensional doubled
    occupancy carrier: `QOp2 = T3Op + YOp` — the banked charge operator (N705) IS the
    sum of the witness isospin and hypercharge operators. This is exactly the identity
    the referee said the seven-carrier wall seemed to forbid; here it LIVES, on the
    correct (eight-doubled) carrier. -/
theorem gmn : QOp2 = T3Op + YOp := by
  apply LinearMap.ext
  intro x
  apply Prod.ext
  · funext T
    have hq := (QOp2_apply x T).1
    have ht := (T3Op_apply x T).1
    have hy := (YOp_apply x T).1
    have hsum : ((T3Op + YOp) x).1 T = (T3Op x).1 T + (YOp x).1 T := rfl
    rw [hq, hsum, ht, hy, ← add_mul, ← gmn_law_A]
  · funext T
    have hq := (QOp2_apply x T).2
    have ht := (T3Op_apply x T).2
    have hy := (YOp_apply x T).2
    have hsum : ((T3Op + YOp) x).2 T = (T3Op x).2 T + (YOp x).2 T := rfl
    rw [hq, hsum, ht, hy, ← add_mul, ← gmn_law_B]

/-! ## §4 The spectral sums (the check script's numbers, proved). -/

/-- The number of occupancy states is 8: `|Finset (Fin 3)| = 2³`. -/
theorem card_GenState : Fintype.card GenState = 8 := by
  simp [Fintype.card_finset]

/-- Sector-0 isospin square sum: `Σ_S (1/2)² = 8/4 = 2`. -/
theorem sum_t3A_sq : (∑ S : GenState, t3A S * t3A S) = 2 := by
  unfold t3A
  rw [Finset.sum_const, Finset.card_univ, card_GenState]
  norm_num

/-- Sector-1 isospin square sum: `Σ_S 0² = 0`. -/
theorem sum_t3B_sq : (∑ S : GenState, t3B S * t3B S) = 0 := by
  unfold t3B; simp

/-- Sector-0 linear isospin sum: `Σ_S 1/2 = 4`. -/
theorem sum_t3A : (∑ S : GenState, t3A S) = 4 := by
  unfold t3A
  rw [Finset.sum_const, Finset.card_univ, card_GenState]
  norm_num

/-- Sector-0 hypercharge square sum: `Σ_S (qS S − 1/2)² = 8/3 − 4 + 2 = 2/3`,
    from the banked moments `sum_qS_sq` (N705) and `sum_qS` (N705). -/
theorem sum_yA_sq : (∑ S : GenState, yA S * yA S) = 2 / 3 := by
  have expand : ∀ S : GenState, yA S * yA S = qS S * qS S - qS S + 1 / 4 := by
    intro S; unfold yA; ring
  calc (∑ S : GenState, yA S * yA S)
      = ∑ S : GenState, (qS S * qS S - qS S + 1 / 4) :=
        Finset.sum_congr rfl (fun S _ => expand S)
    _ = (∑ S : GenState, (qS S * qS S - qS S)) + ∑ S : GenState, (1 / 4 : ℚ) := by
        rw [Finset.sum_add_distrib]
    _ = ((∑ S : GenState, qS S * qS S) - ∑ S : GenState, qS S)
          + ∑ S : GenState, (1 / 4 : ℚ) := by
        rw [Finset.sum_sub_distrib]
    _ = (8 / 3 - 4) + 2 := by
        rw [sum_qS_sq, sum_qS, Finset.sum_const, Finset.card_univ, card_GenState]
        norm_num
    _ = 2 / 3 := by norm_num

/-- Sector-1 hypercharge square sum: `Σ_S qS² = 8/3` — the banked `sum_qS_sq`. -/
theorem sum_yB_sq : (∑ S : GenState, yB S * yB S) = 8 / 3 := by
  unfold yB; exact sum_qS_sq

/-- Sector-0 mixed sum: `Σ_S yA·t3A = (1/2)·Σ qS − Σ 1/4 = 2 − 2 = 0`. -/
theorem sum_yA_t3A : (∑ S : GenState, yA S * t3A S) = 0 := by
  have expand : ∀ S : GenState, yA S * t3A S = qS S * (1 / 2) - 1 / 4 := by
    intro S; unfold yA t3A; ring
  calc (∑ S : GenState, yA S * t3A S)
      = ∑ S : GenState, (qS S * (1 / 2) - 1 / 4) :=
        Finset.sum_congr rfl (fun S _ => expand S)
    _ = (∑ S : GenState, qS S * (1 / 2)) - ∑ S : GenState, (1 / 4 : ℚ) := by
        rw [Finset.sum_sub_distrib]
    _ = 4 * (1 / 2) - 2 := by
        rw [← Finset.sum_mul, sum_qS, Finset.sum_const, Finset.card_univ,
          card_GenState]
        norm_num
    _ = 0 := by norm_num

/-- Sector-1 mixed sum: `Σ_S yB·0 = 0`. -/
theorem sum_yB_t3B : (∑ S : GenState, yB S * t3B S) = 0 := by
  unfold t3B; simp

/-! ## §5 ★★★ THE REAL OPERATOR TRACES (Mathlib `LinearMap.trace`, N705's route). -/

/-- `T3OpA ∘ T3OpA` as the squared diagonal matrix. -/
theorem T3OpA_comp :
    T3OpA ∘ₗ T3OpA = Matrix.toLin' (Matrix.diagonal t3A * Matrix.diagonal t3A) := by
  rw [Matrix.toLin'_mul]; rfl

/-- `T3OpB ∘ T3OpB` as the squared diagonal matrix. -/
theorem T3OpB_comp :
    T3OpB ∘ₗ T3OpB = Matrix.toLin' (Matrix.diagonal t3B * Matrix.diagonal t3B) := by
  rw [Matrix.toLin'_mul]; rfl

/-- Sector-0 isospin trace: `Tr(T3²)|₀ = 2`. -/
theorem trace_T3OpA_sq : LinearMap.trace ℚ GenRep (T3OpA ∘ₗ T3OpA) = 2 := by
  rw [T3OpA_comp, Matrix.trace_toLin'_eq, Matrix.diagonal_mul_diagonal,
    Matrix.trace_diagonal]
  simpa only [Pi.mul_apply] using sum_t3A_sq

/-- Sector-1 isospin trace: `Tr(T3²)|₁ = 0`. -/
theorem trace_T3OpB_sq : LinearMap.trace ℚ GenRep (T3OpB ∘ₗ T3OpB) = 0 := by
  rw [T3OpB_comp, Matrix.trace_toLin'_eq, Matrix.diagonal_mul_diagonal,
    Matrix.trace_diagonal]
  simpa only [Pi.mul_apply] using sum_t3B_sq

/-- ★★★ PILLAR (2) AS A REAL TRACE: `Tr(T3²) = 2` on the 16-dimensional doubled
    occupancy carrier — the same `2` that N318 derived parametrically from the
    fundamental-2 weight system, now a genuine `LinearMap.trace` of a genuine
    operator on the SAME carrier as the banked `Tr(Q²) = 16/3`. -/
theorem trace_T3Op_sq : LinearMap.trace ℚ GenRep2 (T3Op ∘ₗ T3Op) = 2 := by
  have h : T3Op ∘ₗ T3Op = (T3OpA ∘ₗ T3OpA).prodMap (T3OpB ∘ₗ T3OpB) := rfl
  rw [h, LinearMap.trace_prodMap', trace_T3OpA_sq, trace_T3OpB_sq]
  norm_num

/-- `YOpA ∘ YOpA` as the squared diagonal matrix. -/
theorem YOpA_comp :
    YOpA ∘ₗ YOpA = Matrix.toLin' (Matrix.diagonal yA * Matrix.diagonal yA) := by
  rw [Matrix.toLin'_mul]; rfl

/-- `YOpB ∘ YOpB` as the squared diagonal matrix. -/
theorem YOpB_comp :
    YOpB ∘ₗ YOpB = Matrix.toLin' (Matrix.diagonal yB * Matrix.diagonal yB) := by
  rw [Matrix.toLin'_mul]; rfl

/-- Sector-0 hypercharge trace: `Tr(Y²)|₀ = 2/3`. -/
theorem trace_YOpA_sq : LinearMap.trace ℚ GenRep (YOpA ∘ₗ YOpA) = 2 / 3 := by
  rw [YOpA_comp, Matrix.trace_toLin'_eq, Matrix.diagonal_mul_diagonal,
    Matrix.trace_diagonal]
  simpa only [Pi.mul_apply] using sum_yA_sq

/-- Sector-1 hypercharge trace: `Tr(Y²)|₁ = 8/3`. -/
theorem trace_YOpB_sq : LinearMap.trace ℚ GenRep (YOpB ∘ₗ YOpB) = 8 / 3 := by
  rw [YOpB_comp, Matrix.trace_toLin'_eq, Matrix.diagonal_mul_diagonal,
    Matrix.trace_diagonal]
  simpa only [Pi.mul_apply] using sum_yB_sq

/-- ★★★ THE HYPERCHARGE TRACE AS A REAL TRACE: `Tr(Y²) = 2/3 + 8/3 = 10/3` on the
    doubled occupancy carrier — the A5 numerator, now an operator trace. -/
theorem trace_YOp_sq : LinearMap.trace ℚ GenRep2 (YOp ∘ₗ YOp) = 10 / 3 := by
  have h : YOp ∘ₗ YOp = (YOpA ∘ₗ YOpA).prodMap (YOpB ∘ₗ YOpB) := rfl
  rw [h, LinearMap.trace_prodMap', trace_YOpA_sq, trace_YOpB_sq]
  norm_num

/-- `YOpA ∘ T3OpA` as a product of diagonal matrices. -/
theorem YT3A_comp :
    YOpA ∘ₗ T3OpA = Matrix.toLin' (Matrix.diagonal yA * Matrix.diagonal t3A) := by
  rw [Matrix.toLin'_mul]; rfl

/-- `YOpB ∘ T3OpB` as a product of diagonal matrices. -/
theorem YT3B_comp :
    YOpB ∘ₗ T3OpB = Matrix.toLin' (Matrix.diagonal yB * Matrix.diagonal t3B) := by
  rw [Matrix.toLin'_mul]; rfl

/-- Sector-0 orthogonality trace: `Tr(Y·T3)|₀ = 0`. -/
theorem trace_YT3A : LinearMap.trace ℚ GenRep (YOpA ∘ₗ T3OpA) = 0 := by
  rw [YT3A_comp, Matrix.trace_toLin'_eq, Matrix.diagonal_mul_diagonal,
    Matrix.trace_diagonal]
  simpa only [Pi.mul_apply] using sum_yA_t3A

/-- Sector-1 orthogonality trace: `Tr(Y·T3)|₁ = 0`. -/
theorem trace_YT3B : LinearMap.trace ℚ GenRep (YOpB ∘ₗ T3OpB) = 0 := by
  rw [YT3B_comp, Matrix.trace_toLin'_eq, Matrix.diagonal_mul_diagonal,
    Matrix.trace_diagonal]
  simpa only [Pi.mul_apply] using sum_yB_t3B

/-- ★★★ PILLAR (3) AS A REAL TRACE — THE ORTHOGONALITY: `Tr(Y·T3) = 0` on the doubled
    occupancy carrier. The N318 orthogonality, now an operator trace on the same
    carrier as `16/3`. -/
theorem trace_YOp_T3Op : LinearMap.trace ℚ GenRep2 (YOp ∘ₗ T3Op) = 0 := by
  have h : YOp ∘ₗ T3Op = (YOpA ∘ₗ T3OpA).prodMap (YOpB ∘ₗ T3OpB) := rfl
  rw [h, LinearMap.trace_prodMap', trace_YT3A, trace_YT3B]
  norm_num

/-! ## §6 ★★ THE 5/3 AND 3/8 — WELDED BY NAME to the banked assembly (N317/N318). -/

/-- ★★ THE `5/3` RATIO, operator-native: `Tr(Y²)/Tr(T3²) = (10/3)/2 = 5/3` where both
    traces are REAL `LinearMap.trace`s of the witness operators. -/
theorem trace_ratio_5_3 :
    LinearMap.trace ℚ GenRep2 (YOp ∘ₗ YOp)
      / LinearMap.trace ℚ GenRep2 (T3Op ∘ₗ T3Op) = 5 / 3 := by
  rw [trace_YOp_sq, trace_T3Op_sq]
  norm_num

/-- ★★ THE WELD BY NAME (5/3): the operator-trace ratio EQUALS the banked parametric
    landing `hyperRatio (16/3) 2 = 5/3` (`hyperRatio_at`, ChiralGenerationChargeTrace)
    evaluated at the banked operator traces `Tr(Q²) = 16/3` (`trace_QOp2_sq`, N705) and
    `Tr(T3²) = 2` (this node). The N317 assembly's `5/3` and the witness operators'
    `5/3` are ONE number, through the named banked statement. -/
theorem ratio_welds_to_banked :
    LinearMap.trace ℚ GenRep2 (YOp ∘ₗ YOp)
        / LinearMap.trace ℚ GenRep2 (T3Op ∘ₗ T3Op)
      = hyperRatio (LinearMap.trace ℚ GenRep2 (QOp2 ∘ₗ QOp2))
          (LinearMap.trace ℚ GenRep2 (T3Op ∘ₗ T3Op)) := by
  rw [trace_YOp_sq, trace_QOp2_sq, trace_T3Op_sq, hyperRatio_at]
  norm_num

/-- ★★ THE WELD BY NAME, restated through the banked formula: with the charge trace
    taken from the BANKED `ladderChargeTrace (finrank ℚ Uhol)` (`assembly_delivers_5_3`,
    N317), the hyperRatio at THIS node's operator isospin trace is `5/3`. -/
theorem assembly_weld_5_3 :
    hyperRatio (ladderChargeTrace (Module.finrank ℚ Uhol))
      (LinearMap.trace ℚ GenRep2 (T3Op ∘ₗ T3Op)) = 5 / 3 := by
  rw [trace_T3Op_sq]
  exact assembly_delivers_5_3

/-- ★★ THE `3/8` WELD BY NAME: `sin²θ_W = Tr(T3²)/Tr(Q²) = 2/(16/3) = 3/8` with BOTH
    traces real operator traces, equal to the banked `weinberg_delivers_3_8` (N317)
    through `weinberg` by name. -/
theorem weinberg_weld_3_8 :
    weinberg (LinearMap.trace ℚ GenRep2 (T3Op ∘ₗ T3Op))
      (ladderChargeTrace (Module.finrank ℚ Uhol)) = 3 / 8 := by
  rw [trace_T3Op_sq]
  exact weinberg_delivers_3_8

/-- The operator-native `3/8`: `Tr(T3²)/Tr(Q²)` with both real traces. -/
theorem trace_weinberg_3_8 :
    LinearMap.trace ℚ GenRep2 (T3Op ∘ₗ T3Op)
      / LinearMap.trace ℚ GenRep2 (QOp2 ∘ₗ QOp2) = 3 / 8 := by
  rw [trace_T3Op_sq, trace_QOp2_sq]
  norm_num

/-- The reduction consistency check (the banked `hyper_ratio_reduction`, N317, at this
    node's traces): `Tr(Y²) = Tr(Q²) − 2·Tr(Q·T3) + Tr(T3²)` with the orthogonality
    `Tr(Q·T3) = Tr(T3²)` gives `Tr(Y²) = Tr(Q²) − Tr(T3²)`; at the proved values
    `10/3 = 16/3 − 2`. -/
theorem reduction_consistent :
    LinearMap.trace ℚ GenRep2 (YOp ∘ₗ YOp)
      = LinearMap.trace ℚ GenRep2 (QOp2 ∘ₗ QOp2)
        - LinearMap.trace ℚ GenRep2 (T3Op ∘ₗ T3Op) := by
  rw [trace_YOp_sq, trace_QOp2_sq, trace_T3Op_sq]
  norm_num

/-! ## §7 The anomaly sums the scripts checked. -/

/-- The linear charge sum over all 16 states: `Tr(Q) = 4 + 4 = 8` (`Σq = 8` in the
    check script), from the banked per-sector `trace_QOp = 4` (N705). -/
theorem trace_QOp2 : LinearMap.trace ℚ GenRep2 QOp2 = 8 := by
  have h : QOp2 = QOp.prodMap QOp := rfl
  rw [h, LinearMap.trace_prodMap', trace_QOp]
  norm_num

/-- The linear isospin sum: `Tr(T3) = 4 + 0 = 4` (the witness is NOT traceless — and
    per the enumeration, NO solution is: obstruction 2 of enum705b_check.py). -/
theorem trace_T3Op : LinearMap.trace ℚ GenRep2 T3Op = 4 := by
  have h : T3Op = T3OpA.prodMap T3OpB := rfl
  have hA : LinearMap.trace ℚ GenRep T3OpA = 4 := by
    unfold T3OpA
    rw [Matrix.trace_toLin'_eq, Matrix.trace_diagonal]
    exact sum_t3A
  have hB : LinearMap.trace ℚ GenRep T3OpB = 0 := by
    unfold T3OpB
    rw [Matrix.trace_toLin'_eq, Matrix.trace_diagonal]
    unfold t3B; simp
  rw [h, LinearMap.trace_prodMap', hA, hB]
  norm_num

/-- The linear hypercharge sum: `Tr(Y) = Tr(Q) − Tr(T3) = 8 − 4 = 4` — by GMN. -/
theorem trace_YOp : LinearMap.trace ℚ GenRep2 YOp = 4 := by
  have h : LinearMap.trace ℚ GenRep2 QOp2
      = LinearMap.trace ℚ GenRep2 T3Op + LinearMap.trace ℚ GenRep2 YOp := by
    rw [← map_add, ← gmn]
  rw [trace_QOp2, trace_T3Op] at h
  linarith

/-- THE DOUBLED B−L ANOMALY SUM: `Σ(2q−1) = 0` over the 16 states of the check script
    — per sector it is the banked `anomalyLinear 3` (`blCharge_eq_qS`, N705), and the
    banked vanishing (`anomalyLinear_zero`, N316) kills both sectors:
    `2·(anomalyLinear 3) = 0`. -/
theorem doubled_anomaly_sum :
    (∑ S : GenState, blCharge 3 S) + (∑ S : GenState, blCharge 3 S) = 0 := by
  have h : (∑ S : GenState, blCharge 3 S) = anomalyLinear 3 := rfl
  rw [h, anomalyLinear_zero]
  norm_num

/-! ## §8 Uniqueness — the HONEST parametric content of the enumeration. -/

/-- ★ WHAT IS FORCED (across all 12687 enumerated solutions): the orthogonality.
    Parametrically: if `Tr(Q·T3) = 2` (the enumeration's constraint (b), equivalent to
    `Tr(Y²) = 10/3` under GMN) and `Tr(T3²) = 2` (constraint (a)), then
    `Tr(Y·T3) = Tr(Q·T3) − Tr(T3²) = 0` — for EVERY solution, not just the witness.
    This is the enumeration's `distinct sumYT3 = {0}` finding, proved. -/
theorem orthogonality_forced (trQT3 trT3sq : ℚ)
    (hb : trQT3 = 2) (ha : trT3sq = 2) : trQT3 - trT3sq = 0 := by
  rw [hb, ha]; ring

/-- ★ NON-UNIQUENESS WITNESSED IN LEAN: a SECOND assignment with the same trace pair —
    swap the sectors (`t3 = 0` on sector 0, `+1/2` on sector 1). Its square-sum equals
    the witness's (`2`), and it differs from the witness pointwise — so the trace
    constraints (a)+(b) do NOT pin the assignment. (The enumeration counts 12687 such;
    formalizing the full census is the successor's job.) -/
theorem not_unique :
    (∑ S : GenState, t3B S * t3B S) + (∑ S : GenState, t3A S * t3A S) = 2 ∧
    t3A ≠ t3B := by
  constructor
  · rw [sum_t3A_sq, sum_t3B_sq]; norm_num
  · intro h
    have := congrFun h ∅
    unfold t3A t3B at this
    norm_num at this

/-! ## §9 Capstone. -/

/-- ★★★ CAPSTONE — ISOSPIN ON THE OCCUPANCY CARRIER, THE WITNESS. On the SAME
    16-dimensional chirality-doubled occupancy carrier as the banked `Tr(Q²) = 16/3`:
    (1) Gell-Mann–Nishijima holds as an OPERATOR identity `QOp2 = T3Op + YOp`;
    (2) `Tr(T3²) = 2` is a real trace; (3) `Tr(Y²) = 10/3` is a real trace;
    (4) the orthogonality `Tr(Y·T3) = 0` is a real trace; (5) the ratio
    `Tr(Y²)/Tr(T3²) = 5/3` lands and (6) welds BY NAME to the banked N317 assembly
    at the banked colour dimension; (7) `sin²θ_W = 3/8` welds by name. Uniqueness is
    NOT claimed — the enumeration found 12687 assignments with these traces (witness
    banked, orthogonality forced across all; successor: IsospinAssignmentForcing). -/
theorem isospin_on_occupancy_carrier_witness :
    (QOp2 = T3Op + YOp) ∧
    (LinearMap.trace ℚ GenRep2 (T3Op ∘ₗ T3Op) = 2) ∧
    (LinearMap.trace ℚ GenRep2 (YOp ∘ₗ YOp) = 10 / 3) ∧
    (LinearMap.trace ℚ GenRep2 (YOp ∘ₗ T3Op) = 0) ∧
    (LinearMap.trace ℚ GenRep2 (YOp ∘ₗ YOp)
        / LinearMap.trace ℚ GenRep2 (T3Op ∘ₗ T3Op) = 5 / 3) ∧
    (hyperRatio (ladderChargeTrace (Module.finrank ℚ Uhol))
        (LinearMap.trace ℚ GenRep2 (T3Op ∘ₗ T3Op)) = 5 / 3) ∧
    (weinberg (LinearMap.trace ℚ GenRep2 (T3Op ∘ₗ T3Op))
        (ladderChargeTrace (Module.finrank ℚ Uhol)) = 3 / 8) :=
  ⟨gmn, trace_T3Op_sq, trace_YOp_sq, trace_YOp_T3Op, trace_ratio_5_3,
    assembly_weld_5_3, weinberg_weld_3_8⟩

end IsospinOnOccupancyCarrier
end Phys.Algebra
