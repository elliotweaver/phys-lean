/-
  Phys.Algebra.ChiralGenerationChargeTrace — N317 (SEED 2 gauge route, target A5, pillar 1).
  ===========================================================================
  THE CHIRAL-GENERATION CHARGE-SQUARED TRACE Tr(Q²) = 16/3 — the GUT-normalization
  DENOMINATOR of the weak mixing angle — DERIVED from the colour exterior ladder,
  grounded to the BANKED derived colour-triplet dimension `finrank ℚ Uhol = 3`.

  ---------------------------------------------------------------------------
  ⭐ SECOND OWNER-AUTHORIZED SEED (docs/SEED_GAUGE_SCALE_COSMOLOGY.md, ARC A, target A5).
  A5 asks for the chiral hypercharge trace `Tr(Y²)/Tr(T3²) = 5/3` over ONE chiral
  generation (feeding A6 `sin²θ_W = 3/(3+5) = 3/8`). ⚠ THE TRAP (per the seed): the
  naive gauged-F₄ normalization gives the WRONG `3/4`; the correct route is the
  chiral-generation TRACE. This node banks the load-bearing pillar of that route.

  ---------------------------------------------------------------------------
  THE THEORY-NATIVE ROUTE (the colour exterior ladder, NOT F₄). One chiral generation
  of matter is the colour EXTERIOR LADDER `Λ*(colour-3)` (the minimal-left-ideal /
  Cl(6) picture): the `2^{n_c}` states of one chirality are the subsets `S ⊆ Fin n_c`
  of the colour index set, doubled by the conjugate chirality. The electric charge is
  the ladder OCCUPATION NUMBER normalized by the colour count,

      Q(S) = |S| / n_c,      n_c = `finrank ℚ Uhol` = 3  (the BANKED colour triplet dim),

  which is WHY quarks carry charge `1/n_c` — because there are `n_c` colours. So the
  charge-squared trace over the full generation (both chiralities) is FORCED:

      ★ Tr(Q²) = 2 · Σ_{S ⊆ Fin n_c} (|S| / n_c)²  =  2·(24/9) = 16/3   at n_c = 3.

  This `16/3` is the GUT-normalization denominator of the weak mixing angle:
      sin²θ_W = Tr(T3²) / Tr(Q²) = 2 / (16/3) = 3/8,
  and, with `Y := Q − T3` and the doublet orthogonality `Tr(Y·T3) = 0`,
      Tr(Y²) = Tr(Q²) − Tr(T3²) = 16/3 − 2 = 10/3,   Tr(Y²)/Tr(T3²) = (10/3)/2 = 5/3.

  ---------------------------------------------------------------------------
  W3 DECOMPOSITION (ticket-authorized; A5 is a real multi-pillar computation). The full
  `5/3` needs THREE pillars: (1) `Tr(Q²) = 16/3` — the colour ladder, grounded here;
  (2) `Tr(T3²) = 2` — the su(2)_L DOUBLET action on the generation carrier (the
  fundamental-2, NOT the banked fundamental-7 triplet N277; the 11×-deferred N201–N211
  hypercharge-normalization half); (3) `Tr(Y·T3) = 0` — hypercharge trace-orthogonality.
  THIS node banks pillar (1) — the forced GUT-normalization denominator — PLUS the
  parametric ASSEMBLY engine (`hyper_ratio_reduction`, `hyperRatio_at`, `weinberg_at`)
  that DELIVERS `5/3` and `3/8` the instant pillars (2)+(3) land. The single successor
  child banks (2)+(3) and the `5/3` landing, then A6.

  ---------------------------------------------------------------------------
  PHYSICS-WORDS-REMOVABLE (docs/STANDARD §2). Delete "charge / generation / colour /
  hypercharge / isospin / weak-mixing / GUT / Weinberg": what remains is — for the
  banked derived subspace `Uhol` of `O ℚ = CD (H ℚ)` with `finrank ℚ Uhol = 3`, TWICE
  the second moment of the normalized subset-cardinality functional `|S| / (finrank ℚ
  Uhol)` over the exterior algebra (the power set `Finset (Fin (finrank ℚ Uhol))`)
  equals `16/3`; and the rational identities `(16/3 − 2)/2 = 5/3`, `2/(16/3) = 3/8`.
  No theorem STATEMENT needs a physics word; the headline TYPE mentions the banked
  `Module.finrank ℚ Uhol` (NOT a free-floating `3`).

  ⚠ FREE-FLOATING RAIL (SOUL): `generation_charge_trace` is stated at the BANKED
  `Module.finrank ℚ Uhol`, not a generic `n` — the generic `ladderChargeTrace n` is the
  construction, instantiated to the derived colour dimension. G1: `16/3` FALLS OUT of the
  ℕ second moment `Σ S.card² = 24` (a `decide`) divided by `n_c²`, never premised. G2: NO
  empirical number in any proof (the `sin²θ_W` comparison to `0.231` and `Tr(Q²)` to any
  measured value live only in this prose). ⚠ UNEARNED-IMPORT: ground field ℚ (16/3, 5/3,
  3/8 all ℚ-exact); NO Mathlib-ℝ/ℂ as content.

  UNBROKEN: `Uhol` / `finrank_Uhol` (N42c, DerivationStabilizerSplit), `Finset`/`Fin`/
  `Finset.sum`/`Module.finrank` standard Mathlib MACHINERY on the derived object. Ground
  = derived ℚ; nothing posited; no bridge.

  Foundations-only: `#print axioms` ⊆ {propext, Classical.choice, Quot.sound}. No sorry,
  no axiom, no kernel-compilation bypass, no heartbeat inflation.
-/
import Phys.Algebra.DerivationStabilizerSplit
import Mathlib.Tactic

open scoped BigOperators

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

/-! ## (A) The colour exterior-ladder charge-squared trace. -/

/-- The charge-squared trace of one chiral generation modelled as the colour exterior
    ladder `Λ*(colour-n)`: TWICE (both chiralities) the sum over subsets `S ⊆ Fin n`
    (the exterior-algebra basis) of the squared occupation-normalized charge `(|S|/n)²`.
    The charge of a state is its colour OCCUPATION NUMBER `|S|` divided by the colour
    count `n` (why quarks carry charge `1/n` — there are `n` colours). -/
noncomputable def ladderChargeTrace (n : ℕ) : ℚ :=
  2 * ∑ S : Finset (Fin n), ((S.card : ℚ) / (n : ℚ)) ^ 2

/-- The ℕ second moment of subset cardinality over `Fin 3`: `Σ_{S⊆Fin 3} |S|² = 24`.
    (`C(3,0)·0 + C(3,1)·1 + C(3,2)·4 + C(3,3)·9 = 0+3+12+9 = 24`.) A finite `decide`. -/
theorem sum_card_sq_three : (∑ S : Finset (Fin 3), (S.card) ^ 2) = 24 := by decide

/-- The colour-ladder charge-squared trace at colour count `3` is `16/3`. `16/3` FALLS
    OUT of the ℕ second moment `24` divided by `n² = 9`, doubled — never premised. -/
theorem ladderChargeTrace_three : ladderChargeTrace 3 = 16 / 3 := by
  unfold ladderChargeTrace
  have hcast : (∑ S : Finset (Fin 3), ((S.card : ℚ)) ^ 2) = 24 := by
    have h : (∑ S : Finset (Fin 3), (S.card) ^ 2) = 24 := sum_card_sq_three
    calc (∑ S : Finset (Fin 3), ((S.card : ℚ)) ^ 2)
        = ((∑ S : Finset (Fin 3), (S.card) ^ 2 : ℕ) : ℚ) := by push_cast; rfl
      _ = ((24 : ℕ) : ℚ) := by rw [h]
      _ = 24 := by norm_num
  have hstep : (∑ S : Finset (Fin 3), ((S.card : ℚ) / (3 : ℚ)) ^ 2)
      = (∑ S : Finset (Fin 3), ((S.card : ℚ)) ^ 2) / 9 := by
    rw [Finset.sum_div]; apply Finset.sum_congr rfl; intro S _; ring
  rw [show ((3 : ℕ) : ℚ) = (3 : ℚ) from by norm_num, hstep, hcast]; norm_num

/-- ★★★ THE CHIRAL-GENERATION CHARGE-SQUARED TRACE `Tr(Q²) = 16/3`, grounded to the
    BANKED derived colour-triplet dimension `finrank ℚ Uhol = 3` (N42c). This is the
    GUT-normalization DENOMINATOR of the weak mixing angle: `sin²θ_W = Tr(T3²)/Tr(Q²)`.
    NOT free-floating — the type mentions the banked `Module.finrank ℚ Uhol`. -/
theorem generation_charge_trace : ladderChargeTrace (Module.finrank ℚ Uhol) = 16 / 3 := by
  rw [finrank_Uhol]; exact ladderChargeTrace_three

/-! ## (B) The parametric assembly engine — how `Tr(T3²)=2` delivers `5/3` and `3/8`. -/

/-- THE HYPERCHARGE-TRACE REDUCTION. With `Y := Q − T3`, the expansion
    `Tr(Y²) = Tr(Q²) − 2·Tr(Q·T3) + Tr(T3²)` COLLAPSES to `Tr(Y²) = Tr(Q²) − Tr(T3²)`
    exactly when the doublet orthogonality `Tr(Y·T3) = 0`, i.e. `Tr(Q·T3) = Tr(T3²)`,
    holds. Pure ℚ-arithmetic; the two hypotheses are the child's pillars (2)+(3). -/
theorem hyper_ratio_reduction (trQsq trT3sq trQT3 trYsq : ℚ)
    (hY : trYsq = trQsq - 2 * trQT3 + trT3sq) (hOrtho : trQT3 = trT3sq) :
    trYsq = trQsq - trT3sq := by rw [hY, hOrtho]; ring

/-- The hypercharge:isospin trace ratio as a function of the (charge, isospin) traces,
    under the orthogonality-reduced hypercharge trace `Tr(Y²) = trQsq − trT3sq`. -/
def hyperRatio (trQsq trT3sq : ℚ) : ℚ := (trQsq - trT3sq) / trT3sq

/-- The weak mixing angle as a function of the (isospin, charge) traces:
    `sin²θ_W = Tr(T3²) / Tr(Q²)`. -/
def weinberg (trT3sq trQsq : ℚ) : ℚ := trT3sq / trQsq

/-- ★★ THE `5/3` LANDING (parametric). At the derived charge trace `Tr(Q²) = 16/3` and
    the isospin trace `Tr(T3²) = 2` (the child's pillar), the hypercharge:isospin ratio
    is `(16/3 − 2)/2 = (10/3)/2 = 5/3`. -/
theorem hyperRatio_at : hyperRatio (16 / 3) 2 = 5 / 3 := by
  unfold hyperRatio; norm_num

/-- ★★ THE `3/8` LANDING (parametric, A6 preview). At `Tr(T3²) = 2`, `Tr(Q²) = 16/3`,
    `sin²θ_W = 2/(16/3) = 3/8`. -/
theorem weinberg_at : weinberg 2 (16 / 3) = 3 / 8 := by
  unfold weinberg; norm_num

/-- ★★ THE LOCALIZER — the `5/3` ratio with the CHARGE trace taken from the BANKED
    derived colour dimension (`generation_charge_trace`) and the isospin trace `2` the
    single remaining input the successor supplies. Makes the one missing pillar explicit. -/
theorem assembly_delivers_5_3 :
    hyperRatio (ladderChargeTrace (Module.finrank ℚ Uhol)) 2 = 5 / 3 := by
  rw [generation_charge_trace]; exact hyperRatio_at

/-- ★★ THE A6 PREVIEW LOCALIZER — `sin²θ_W = 3/8` with the CHARGE trace from the banked
    colour dimension and the isospin trace `2` the successor supplies. -/
theorem weinberg_delivers_3_8 :
    weinberg 2 (ladderChargeTrace (Module.finrank ℚ Uhol)) = 3 / 8 := by
  rw [generation_charge_trace]; exact weinberg_at

/-! ## (C) W8 NON-VACUITY WITH TEETH. -/

/-- ★ W8: a WRONG colour count `n_c = 2` gives `ladderChargeTrace 2 = 2·(0+2·(1/2)²+1)
    = 2·(3/2) = 3 ≠ 16/3`. The `16/3` is specifically the `n_c = 3` value. -/
theorem ladderChargeTrace_two_ne : ladderChargeTrace 2 ≠ 16 / 3 := by
  have h : ladderChargeTrace 2 = 3 := by
    unfold ladderChargeTrace
    have hcast : (∑ S : Finset (Fin 2), ((S.card : ℚ)) ^ 2) = 6 := by
      have h2 : (∑ S : Finset (Fin 2), (S.card) ^ 2) = 6 := by decide
      calc (∑ S : Finset (Fin 2), ((S.card : ℚ)) ^ 2)
          = ((∑ S : Finset (Fin 2), (S.card) ^ 2 : ℕ) : ℚ) := by push_cast; rfl
        _ = ((6 : ℕ) : ℚ) := by rw [h2]
        _ = 6 := by norm_num
    have hstep : (∑ S : Finset (Fin 2), ((S.card : ℚ) / (2 : ℚ)) ^ 2)
        = (∑ S : Finset (Fin 2), ((S.card : ℚ)) ^ 2) / 4 := by
      rw [Finset.sum_div]; apply Finset.sum_congr rfl; intro S _; ring
    rw [show ((2 : ℕ) : ℚ) = (2 : ℚ) from by norm_num, hstep, hcast]; norm_num
  rw [h]; norm_num

/-- ★ W8: the naive `3/4` (the seed's F₄-normalization TRAP) is NOT the derived charge
    trace — `Tr(Q²) = 16/3 ≠ 3/4`. The colour-ladder route genuinely departs from the
    trap. -/
theorem charge_trace_ne_trap : ladderChargeTrace (Module.finrank ℚ Uhol) ≠ 3 / 4 := by
  rw [generation_charge_trace]; norm_num

/-- ★ W8: a WRONG isospin trace `Tr(T3²) = 3/4` (the F₄-trap value) FAILS to give `5/3`
    through the assembly: `(16/3 − 3/4)/(3/4) = (55/12)/(3/4) = 55/9 ≠ 5/3`. So the
    `5/3` genuinely depends on the correct `Tr(T3²) = 2`, not the trap. -/
theorem hyperRatio_trap_ne : hyperRatio (16 / 3) (3 / 4) ≠ 5 / 3 := by
  unfold hyperRatio; norm_num

/-! ## (D) CAPSTONE. -/

/-- ★★★ CAPSTONE — the chiral-generation charge-trace pillar of A5. The colour exterior
    ladder over the BANKED derived colour dimension `finrank ℚ Uhol = 3` forces the
    charge-squared trace `Tr(Q²) = 16/3` (the GUT-normalization denominator); the
    parametric assembly then delivers the hypercharge:isospin ratio `5/3` and the weak
    mixing angle `3/8` from the single isospin-trace input `Tr(T3²) = 2` (the successor's
    pillar). W8: a wrong colour count (`n_c=2`), the F₄ trap value (`3/4`), and a wrong
    isospin trace all fail. -/
theorem chiral_generation_charge_trace_structure :
    ladderChargeTrace (Module.finrank ℚ Uhol) = 16 / 3 ∧
    hyperRatio (ladderChargeTrace (Module.finrank ℚ Uhol)) 2 = 5 / 3 ∧
    weinberg 2 (ladderChargeTrace (Module.finrank ℚ Uhol)) = 3 / 8 ∧
    ladderChargeTrace 2 ≠ 16 / 3 ∧
    ladderChargeTrace (Module.finrank ℚ Uhol) ≠ 3 / 4 ∧
    hyperRatio (16 / 3) (3 / 4) ≠ 5 / 3 :=
  ⟨generation_charge_trace, assembly_delivers_5_3, weinberg_delivers_3_8,
   ladderChargeTrace_two_ne, charge_trace_ne_trap, hyperRatio_trap_ne⟩

end Phys.Algebra
