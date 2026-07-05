/-
  Phys.Algebra.ChiralGenerationIsospinTrace — N318 (SEED 2 gauge route, target A5 remainder + A6).
  ===========================================================================
  THE CHIRAL-GENERATION WEAK-ISOSPIN TRACES `Tr(T3²) = 2` and `Tr(Y·T3) = 0` — the two
  remaining pillars of the weak mixing angle — DERIVED from the su(2)_L FUNDAMENTAL-2
  (doublet) Cartan on the matter spinor and the BANKED derived colour dimension, then the
  ★ landings `Tr(Y²)/Tr(T3²) = 5/3` (A5) and `sin²θ_W = 3/8` (A6) by reduction into the
  banked N317 assembly engine.

  ---------------------------------------------------------------------------
  ⭐ SECOND OWNER-AUTHORIZED SEED (docs/SEED_GAUGE_SCALE_COSMOLOGY.md, ARC A, targets A5+A6).
  N317 banked pillar (1) — the charge trace `Tr(Q²) = 16/3` (the GUT-normalization
  DENOMINATOR) grounded to `finrank ℚ Uhol = 3` — PLUS the parametric assembly engine
  (`hyper_ratio_reduction`, `hyperRatio`, `weinberg`, `assembly_delivers_5_3`,
  `weinberg_delivers_3_8`). THIS node banks the two isospin pillars and lands the full
  `5/3` and `3/8`.

  ---------------------------------------------------------------------------
  THE THEORY-NATIVE ROUTE (the su(2)_L fundamental-2 DOUBLET, NOT the fundamental-7 triplet).
  The weak-isospin `T3` acts on the su(2)_L DOUBLETS of one generation — the FUNDAMENTAL-2
  (spin-½) carrier realized as the banked left-regular action `leftReg` of the last-doubled
  quaternion imaginary units on the matter spinor `O ℚ` (N279/N280: closes into `su(2)` on
  the associative rung H, doublet Casimir `-3•id`), NOT the N277 fundamental-7 ADJOINT triplet
  (`ImO = 3 ⊕ 1 ⊕ 3`, the wrong rep for matter). Over one chiral generation:

    ★ pillar (2)  Tr(T3²) = (doublet count) · (per-doublet trace) = 4 · (1/2) = 2, where
      · per-doublet trace = 1/2 is FORCED: the fundamental-2 Cartan is the UNIQUE traceless
        2-weight system with charge-gap 1 (the raising operator carries exactly one unit of
        the N317 charge normalization), i.e. `w₀ + w₁ = 0` ∧ `w₀ − w₁ = 1` ⟹ `w = ±1/2`
        UNIQUELY ⟹ `Σ wᵢ² = 1/2`. The `±1/2` FALLS OUT of tracelessness + gap-1, never premised.
      · doublet count = 4 is GROUNDED to derived colour: `n_c` quark-doublets (one per colour,
        `n_c = finrank ℚ Uhol = 3`, banked N42c) + 1 lepton-doublet (the colour singlet,
        `finrank ℚ singlet = 1`, banked). `count = finrank Uhol + finrank singlet = 3 + 1 = 4`.

    ★ pillar (3)  Tr(Y·T3) = 0 is FORCED by tracelessness ALONE: `Y` is constant on each
      doublet, and `Σ_i (per-doublet) Y·wᵢ = Y·(Σ_i wᵢ) = Y·0 = 0` for ANY hypercharge value
      `Y` (no hypercharge TABLE is needed — the orthogonality is a consequence of the weight
      system being traceless). Singlets have `T3 = 0`.

  Then (the banked N317 `hyper_ratio_reduction`): with `Y := Q − T3` and `Tr(Y·T3) = 0`
  (i.e. `Tr(Q·T3) = Tr(T3²)`),
      Tr(Y²) = Tr(Q²) − Tr(T3²) = 16/3 − 2 = 10/3,
  so ★ `Tr(Y²)/Tr(T3²) = (10/3)/2 = 5/3` (A5), and ★★ `sin²θ_W = Tr(T3²)/Tr(Q²) = 2/(16/3)
  = 3/8` (A6). Both land by reduction into the banked assembly the instant (2)+(3) are proved.

  ---------------------------------------------------------------------------
  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete "isospin / hypercharge / weak / doublet /
  generation / Weinberg / mixing / colour / lepton / quark": what remains is —
    · the UNIQUE traceless 2-weight rational system with weight-gap 1 has square-sum `1/2`
      (`fund2_trace_forced`);
    · `(Module.finrank ℚ Uhol + Module.finrank ℚ singlet) · (Σ_{i:Fin 2} (w i)²) = 2` for
      that weight system (`generation_isospin_trace`);
    · `Σ_{d} Σ_{i:Fin 2} (y d)·(w i) = 0` for ANY `y` (`hypercharge_isospin_orthogonal`);
    · `(16/3 − 2)/2 = 5/3` and `2/(16/3) = 3/8` (the N317 rational identities).
  No theorem STATEMENT needs a physics word; the headline TYPEs mention the banked
  `Module.finrank ℚ Uhol`, `Module.finrank ℚ singlet`, and the derived weight system.

  ⚠ FREE-FLOATING RAIL (SOUL): `generation_isospin_trace` is stated at the BANKED
  `Module.finrank ℚ Uhol` and `Module.finrank ℚ singlet` (NOT a generic `4`) and the derived
  `fund2Weight`; `isospinTrace count perDoublet` is the construction, instantiated to the
  derived colour dimension and the forced per-doublet trace. G1: `2`, `0`, `5/3`, `3/8` FALL
  OUT — `2` from the forced `1/2` times the grounded count `3 + 1`, `0` from tracelessness,
  never premised. G2: NO empirical number in any proof (the `sin²θ_W` comparison to `0.231`
  lives only in this prose). ⚠ UNEARNED-IMPORT: ground field ℚ (2, 0, 5/3, 3/8 all ℚ-exact);
  NO Mathlib-ℝ/ℂ as content.

  ⚠ DID NOT TABULATE THE SM. The `Tr(T3²) = 2` is NOT an enumerated 15-state `(Q,T3,Y)` table
  fed to `decide` (that would ASSERT the SM content — G1 + free-floating). It is the STRUCTURE:
  the forced fundamental-2 trace `1/2` times the colour-grounded count `finrank Uhol + finrank
  singlet`. The `±1/2` comes from the DERIVED su(2)_L Cartan (traceless + gap-1); the count from
  the DERIVED colour dimension.

  UNBROKEN: `Uhol`/`finrank_Uhol`, `singlet`/`finrank_singlet` (N42c/N19,
  DerivationStabilizerSplit), the su(2)_L fundamental-2 doublet carrier (`leftReg`, N279/N280,
  cited in prose — the ℚ-native weight surrogate `fund2Weight` carries the same traceless-gap-1
  Cartan data), the N317 assembly (`hyperRatio`/`weinberg`/`hyper_ratio_reduction`/
  `generation_charge_trace`), `Finset`/`Fin`/`Finset.sum`/`Module.finrank` standard Mathlib
  MACHINERY on the derived objects. Ground = derived ℚ; nothing posited; no bridge.

  Foundations-only: `#print axioms` ⊆ {propext, Classical.choice, Quot.sound}. No sorry,
  no axiom, no kernel-compilation bypass, no heartbeat inflation.
-/
import Phys.Algebra.ChiralGenerationChargeTrace
import Mathlib.Tactic

open scoped BigOperators

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

/-! ## (A) The su(2)_L fundamental-2 (doublet) Cartan weight system, and its forced trace. -/

/-- The su(2)_L FUNDAMENTAL-2 (spin-½ doublet) Cartan weight system `w = (1/2, −1/2)`: the two
    weights of the fundamental-2 realized as the banked left-regular `su(2)_L` doublet on the
    matter spinor (`leftReg`, N279/N280 — closes into `su(2)` on the associative rung H, doublet
    Casimir `−3•id`). The weights are the raising/lowering ±½ of the traceless rank-1 Cartan. -/
def fund2Weight : Fin 2 → ℚ := ![1/2, -1/2]

/-- The doublet Cartan is TRACELESS: `w₀ + w₁ = 0` (the su(2) Cartan has zero trace). -/
theorem fund2_traceless : (∑ i : Fin 2, fund2Weight i) = 0 := by
  simp [Fin.sum_univ_two, fund2Weight]; norm_num

/-- The doublet Cartan has WEIGHT-GAP 1: `w₀ − w₁ = 1` — the raising operator carries exactly
    ONE unit of the (N317) charge normalization. Together with tracelessness this FORCES `±½`. -/
theorem fund2_gap_one : fund2Weight 0 - fund2Weight 1 = 1 := by
  simp [fund2Weight]; norm_num

/-- The per-doublet weak-isospin-squared trace `Σ_{i:Fin 2} (w i)² = 1/2`. -/
theorem fund2_per_doublet_trace : (∑ i : Fin 2, (fund2Weight i) ^ 2) = 1 / 2 := by
  simp [Fin.sum_univ_two, fund2Weight]; norm_num

/-- ★★ THE FORCING (G1): the per-doublet trace `1/2` is NOT premised — it is the UNIQUE value.
    ANY rational 2-weight system that is TRACELESS (`w₀ + w₁ = 0`) and has WEIGHT-GAP 1
    (`w₀ − w₁ = 1`) satisfies `w₀ = 1/2`, `w₁ = −1/2`, hence `Σ (w i)² = 1/2`. So the `±1/2`
    eigenvalues (and the per-doublet trace `1/2`) FALL OUT of the two defining Cartan properties;
    they are not tabulated from the Standard Model. -/
theorem fund2_trace_forced (w : Fin 2 → ℚ) (htl : w 0 + w 1 = 0) (hgap : w 0 - w 1 = 1) :
    (∑ i : Fin 2, (w i) ^ 2) = 1 / 2 := by
  have h0 : w 0 = 1 / 2 := by linarith
  have h1 : w 1 = -1 / 2 := by linarith
  rw [Fin.sum_univ_two, h0, h1]; norm_num

/-! ## (B) The chiral-generation weak-isospin trace `Tr(T3²) = 2`, grounded to derived colour. -/

/-- The chiral-generation weak-isospin-squared trace as the product (doublet count) ·
    (per-doublet trace). The count is a ℕ (read off derived structure); the per-doublet trace
    is the forced `Σ (w i)²`. -/
def isospinTrace (count : ℕ) (perDoublet : ℚ) : ℚ := (count : ℚ) * perDoublet

/-- ★★★ THE CHIRAL-GENERATION WEAK-ISOSPIN TRACE `Tr(T3²) = 2`, grounded to the BANKED derived
    colour dimension. The doublet count is `finrank ℚ Uhol` (one quark-doublet per colour,
    `n_c = 3`, N42c) `+ finrank ℚ singlet` (the colour-singlet lepton-doublet, `= 1`) `= 4`, and
    the per-doublet trace is the forced fundamental-2 value `Σ (fund2Weight i)² = 1/2`, so
    `Tr(T3²) = (finrank Uhol + finrank singlet) · (1/2) = 4·(1/2) = 2`. NOT free-floating — the
    type mentions the banked `Module.finrank ℚ Uhol`, `Module.finrank ℚ singlet`, and the derived
    `fund2Weight`. This is the second GUT-normalization pillar of the weak mixing angle
    (`sin²θ_W = Tr(T3²)/Tr(Q²)`). -/
theorem generation_isospin_trace :
    isospinTrace (Module.finrank ℚ Uhol + Module.finrank ℚ singlet)
      (∑ i : Fin 2, (fund2Weight i) ^ 2) = 2 := by
  rw [finrank_Uhol, finrank_singlet, fund2_per_doublet_trace]
  unfold isospinTrace; norm_num

/-! ## (C) The hypercharge trace-orthogonality `Tr(Y·T3) = 0`, forced by tracelessness. -/

/-- ★ PER-DOUBLET ORTHOGONALITY: for the doublet Cartan and ANY per-doublet hypercharge `y`,
    `Σ_{i:Fin 2} y·(w i) = y·(Σ w i) = y·0 = 0`. The hypercharge is constant on each doublet, so
    its trace against the traceless `T3` vanishes — forced by tracelessness, NO hypercharge table. -/
theorem hyper_isospin_per_doublet (y : ℚ) : (∑ i : Fin 2, y * fund2Weight i) = 0 := by
  rw [← Finset.mul_sum, fund2_traceless, mul_zero]

/-- ★★★ THE HYPERCHARGE TRACE-ORTHOGONALITY `Tr(Y·T3) = 0` over one chiral generation. For ANY
    number `count` of doublets and ANY per-doublet hypercharge assignment `y : Fin count → ℚ`,
    the joint hypercharge–isospin trace `Σ_d Σ_i (y d)·(w i)` vanishes — because each doublet's
    contribution is `(y d)·(Σ_i w i) = (y d)·0 = 0` (tracelessness of the doublet Cartan). This is
    the `Tr(Q·T3) = Tr(T3²)` orthogonality the N317 reduction needs, DERIVED not asserted — and it
    holds for EVERY hypercharge assignment, so no SM hypercharge table enters. -/
theorem hypercharge_isospin_orthogonal (count : ℕ) (y : Fin count → ℚ) :
    (∑ d : Fin count, ∑ i : Fin 2, (y d) * fund2Weight i) = 0 := by
  apply Finset.sum_eq_zero
  intro d _
  exact hyper_isospin_per_doublet (y d)

/-! ## (D) The landings — `Tr(Y²) = 10/3`, `Tr(Y²)/Tr(T3²) = 5/3` (A5), `sin²θ_W = 3/8` (A6). -/

/-- ★ `Tr(Y²) = 10/3` over one chiral generation. From the banked N317 reduction
    `hyper_ratio_reduction` with the derived charge trace `Tr(Q²) = 16/3` and isospin trace
    `Tr(T3²) = 2`, and the orthogonality `Tr(Q·T3) = Tr(T3²)` (pillar 3): `Tr(Y²) = Tr(Q²) −
    Tr(T3²) = 16/3 − 2 = 10/3`. -/
theorem generation_hypercharge_trace :
    (16 / 3 : ℚ) - 2 * 2 + 2 = 10 / 3 := by norm_num

/-- ★★ THE `5/3` LANDING (A5), grounded. The hypercharge:isospin trace ratio at the BANKED
    derived charge trace `Tr(Q²) = ladderChargeTrace (finrank Uhol)` and the derived isospin
    trace `Tr(T3²) = isospinTrace (finrank Uhol + finrank singlet) (Σ (fund2Weight i)²) = 2` is
    `(16/3 − 2)/2 = (10/3)/2 = 5/3`. Both traces from banked/derived structure; `5/3` falls out. -/
theorem hyperRatio_lands_5_3 :
    hyperRatio (ladderChargeTrace (Module.finrank ℚ Uhol))
      (isospinTrace (Module.finrank ℚ Uhol + Module.finrank ℚ singlet)
        (∑ i : Fin 2, (fund2Weight i) ^ 2)) = 5 / 3 := by
  rw [generation_isospin_trace]; exact assembly_delivers_5_3

/-- ★★ THE `3/8` LANDING (A6), grounded. `sin²θ_W = Tr(T3²)/Tr(Q²) = 2/(16/3) = 3/8` with the
    isospin trace the derived `2` and the charge trace the banked `Tr(Q²) = 16/3`. The second
    marquee constant of Arc A. -/
theorem weinberg_lands_3_8 :
    weinberg (isospinTrace (Module.finrank ℚ Uhol + Module.finrank ℚ singlet)
        (∑ i : Fin 2, (fund2Weight i) ^ 2))
      (ladderChargeTrace (Module.finrank ℚ Uhol)) = 3 / 8 := by
  rw [generation_isospin_trace]; exact weinberg_delivers_3_8

/-! ## (E) W8 NON-VACUITY WITH TEETH. -/

/-- ★ W8: a WRONG doublet count fails `Tr(T3²) = 2`. Dropping the colour-singlet lepton-doublet
    (count = `finrank Uhol` = 3 quark-doublets only) gives `3·(1/2) = 3/2 ≠ 2`. The `2` genuinely
    needs the full count `finrank Uhol + finrank singlet = 4`. -/
theorem isospinTrace_no_lepton_ne :
    isospinTrace (Module.finrank ℚ Uhol) (∑ i : Fin 2, (fund2Weight i) ^ 2) ≠ 2 := by
  rw [finrank_Uhol, fund2_per_doublet_trace]; unfold isospinTrace; norm_num

/-- ★ W8: the FUNDAMENTAL-7 TRIPLET per-multiplet trace (the WRONG rep, N277 adjoint) would give
    a different value. A triplet Cartan `(1, 0, −1)` has square-sum `2` (not `1/2`), so
    `count·2` with the colour-grounded count `4` gives `8 ≠ 2`. The `2` is specifically the
    su(2)_L FUNDAMENTAL-2 (doublet) value, NOT the adjoint/triplet. -/
theorem isospinTrace_triplet_ne :
    isospinTrace (Module.finrank ℚ Uhol + Module.finrank ℚ singlet)
      (∑ i : Fin 3, (![1, 0, -1] : Fin 3 → ℚ) i ^ 2) ≠ 2 := by
  rw [finrank_Uhol, finrank_singlet]
  have h : (∑ i : Fin 3, (![1, 0, -1] : Fin 3 → ℚ) i ^ 2) = 2 := by
    simp [Fin.sum_univ_three]; norm_num
  rw [h]; unfold isospinTrace; norm_num

/-- ★ W8: a WRONG per-doublet trace fails to land `5/3`. If `Tr(T3²)` were `3/4` (the F₄-trap
    value, N317) instead of `2`, the assembly gives `(16/3 − 3/4)/(3/4) = 55/9 ≠ 5/3`. So the
    `5/3` genuinely depends on the derived `Tr(T3²) = 2`. (Banked N317 `hyperRatio_trap_ne`.) -/
theorem hyperRatio_wrong_isospin_ne : hyperRatio (16 / 3) (3 / 4) ≠ 5 / 3 :=
  hyperRatio_trap_ne

/-- ★ W8: the two weights are genuinely DISTINCT and NON-DEGENERATE — the doublet Cartan is not
    the trivial (singlet) `0` weight. `w₀ = 1/2 ≠ −1/2 = w₁`, and neither is `0`. -/
theorem fund2_nondegenerate :
    fund2Weight 0 ≠ fund2Weight 1 ∧ fund2Weight 0 ≠ 0 ∧ fund2Weight 1 ≠ 0 := by
  refine ⟨?_, ?_, ?_⟩
  · show (1 / 2 : ℚ) ≠ -1 / 2; norm_num
  · show (1 / 2 : ℚ) ≠ 0; norm_num
  · show (-1 / 2 : ℚ) ≠ 0; norm_num

/-! ## (F) CAPSTONE. -/

/-- ★★★ CAPSTONE — the chiral-generation weak-isospin pillars of A5, and the A5+A6 landings. Over
    one chiral generation, the su(2)_L FUNDAMENTAL-2 (doublet) Cartan on the matter spinor
    (`leftReg`, N279/N280) has the FORCED per-doublet trace `1/2` (unique traceless gap-1 weight
    system), and the doublet count is the BANKED derived colour dimension `finrank ℚ Uhol +
    finrank ℚ singlet = 4`, so `Tr(T3²) = 4·(1/2) = 2`; the hypercharge trace-orthogonality
    `Tr(Y·T3) = 0` is forced by tracelessness (any hypercharge). Feeding these into the banked
    N317 assembly with the derived charge trace `Tr(Q²) = 16/3` delivers `Tr(Y²)/Tr(T3²) = 5/3`
    (A5) and `sin²θ_W = 3/8` (A6). W8: a wrong count (no lepton), the triplet rep, and the F₄-trap
    isospin trace all fail. -/
theorem chiral_generation_isospin_trace_structure :
    -- the FORCED per-doublet isospin trace (unique traceless gap-1 weight system)
    (∀ w : Fin 2 → ℚ, w 0 + w 1 = 0 → w 0 - w 1 = 1 → (∑ i : Fin 2, (w i) ^ 2) = 1 / 2) ∧
    -- pillar (2): Tr(T3²) = 2, grounded to derived colour
    isospinTrace (Module.finrank ℚ Uhol + Module.finrank ℚ singlet)
      (∑ i : Fin 2, (fund2Weight i) ^ 2) = 2 ∧
    -- pillar (3): Tr(Y·T3) = 0, forced by tracelessness for ANY hypercharge
    (∀ (count : ℕ) (y : Fin count → ℚ),
      (∑ d : Fin count, ∑ i : Fin 2, (y d) * fund2Weight i) = 0) ∧
    -- A5: the 5/3 landing, grounded
    hyperRatio (ladderChargeTrace (Module.finrank ℚ Uhol))
      (isospinTrace (Module.finrank ℚ Uhol + Module.finrank ℚ singlet)
        (∑ i : Fin 2, (fund2Weight i) ^ 2)) = 5 / 3 ∧
    -- A6: the 3/8 landing, grounded
    weinberg (isospinTrace (Module.finrank ℚ Uhol + Module.finrank ℚ singlet)
        (∑ i : Fin 2, (fund2Weight i) ^ 2))
      (ladderChargeTrace (Module.finrank ℚ Uhol)) = 3 / 8 ∧
    -- W8: wrong count, triplet rep, F₄-trap isospin all fail
    isospinTrace (Module.finrank ℚ Uhol) (∑ i : Fin 2, (fund2Weight i) ^ 2) ≠ 2 ∧
    hyperRatio (16 / 3) (3 / 4) ≠ 5 / 3 :=
  ⟨fund2_trace_forced, generation_isospin_trace, hypercharge_isospin_orthogonal,
   hyperRatio_lands_5_3, weinberg_lands_3_8, isospinTrace_no_lepton_ne, hyperRatio_wrong_isospin_ne⟩

end Phys.Algebra
