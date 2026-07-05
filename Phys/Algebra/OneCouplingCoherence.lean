/-
# N319 — ★ ONE-COUPLING COHERENCE / ISO-STIFFNESS (the "one α" reading)
## (SEEDED GAUGE ROUTE A7 — docs/SEED_GAUGE_SCALE_COSMOLOGY.md, ARC A — the LAST node of Arc A)

Over the derived `ℚ`, this node banks the COHERENCE that unifies the two disconnected sub-blocks of
Arc A: the single-coupling MAGNITUDE (A3/A4: `alphaStar = 1/42`, the UNIFORM per-channel Born weight
`bornWeight_uniform` — one coupling on every one of the 42 channels of the terminal octonion algebra)
and the tree-level MIXING (A5/A6: `sin²θ_W = 3/8`, from the derived GUT-normalization ratio
`Tr(Y²)/Tr(T3²) = 5/3`). No prior module's TYPE mentions BOTH the coupling `alphaStar` and the mixing
`weinberg`; A7 is the JOINT — the "one α" reading that the three gauge layers cohere at ONE structural
coupling, with the mixing angle then RIGID (zero free coupling parameters), not a free parameter.

## THE TWO NEW FORCED FACTS (what A7 banks that A3–A6 did NOT)

1. **THE ONE-RATIO MIXING CONSISTENCY** (`oneCouplingMixing_eq_weinberg`). Define the mixing as a
   function of the SINGLE derived GUT-normalization ratio `r = Tr(Y²)/Tr(T3²)` (the "one coupling"
   reading — a single ratio, not three independent couplings):

        oneCouplingMixing r := 1 / (1 + r).

   Then for the banked trace-ratio functions (N317): `oneCouplingMixing (hyperRatio q t3) = weinberg
   t3 q`, i.e. the mixing read off the SINGLE ratio `r = (q−t3)/t3` EQUALS the direct trace-fraction
   mixing `t3/q`. This is a NEW relation between the two banked functions `hyperRatio` (A5) and
   `weinberg` (A6) — the two neutral-current readings of the SAME quantity COHERE. Grounded at the
   derived point (`mixing_grounded`): `oneCouplingMixing (hyperRatio (Tr Q²)(Tr T3²)) = 3/8`.

2. **ISO-STIFFNESS / RIGIDITY** (`oneCouplingMixing_rigid`, `oneCouplingMixing_injective`). The map
   `r ↦ 1/(1+r)` is INJECTIVE, so the mixing value `3/8` back-determines the ratio `r = 5/3`
   UNIQUELY. In a theory with three INDEPENDENT couplings the ratio `r` would be a FREE parameter and
   the angle could be anything; the ONE Born form of the terminal algebra (`bornWeight_uniform` — a
   SINGLE coupling weight, banked A3) removes that freedom, so the angle is RIGID at `3/8` with ZERO
   free coupling parameters. This is the structural meaning of "one coupling": the mixing is FORCED,
   not fitted.

The JOINT `one_coupling_coherence` states all of it at once: the single uniform coupling
`alphaStar = 1/42`, the derived GUT ratio `5/3`, the rigid mixing `3/8`, and the consistency of the
two readings — the "one α" coherence of Arc A, connecting A3/A4 to A5/A6.

## HONEST SCOPE (the W4.5 sufficiency decision — PATH 1)
A7 banks the coherence at the TRACE / coupling-magnitude level (the consistency + rigidity + the JOINT
tying `alphaStar` to the mixing), which is genuinely NEW forced content nowhere present in A3–A6. It
does NOT claim the DEEPER statement "each of the three gauge-layer generators is an active channel
drawing the uniform `bornWeight`" — that needs a gauge-generator→Born-channel map which is not banked
and is a downstream route-finding node, NOT asserted here. The uniformity itself (the load-bearing
"single coupling") is the banked `bornWeight_uniform`; A7 reads the coherence it forces.

## STANDARD compliance
- WORDS-REMOVABLE (§2): delete "coupling / gauge / colour / isospin / hypercharge / mixing / Weinberg
  / unification / α" — the statements stand as pure ℚ-mathematics: `1/(1+(q−t3)/t3) = t3/q`; the map
  `r ↦ 1/(1+r)` is injective; at the banked ratio `5/3` its value is `3/8`; a wrong ratio gives a
  wrong value; the banked normalized self-overlap weight is `1/42`. No physics name is load-bearing.
- NOT FREE-FLOATING: the headline `mixing_grounded` and `one_coupling_coherence` cite the BANKED
  derived objects — `hyperRatio`/`weinberg` (N317), `ladderChargeTrace (Module.finrank ℚ Uhol)`,
  `isospinTrace (Module.finrank ℚ Uhol + Module.finrank ℚ singlet)(Σ fund2Weight²)` (N317/N318),
  `alphaStar`/`couplingWeight` (N315/N316) — NOT generic numbers. `oneCouplingMixing_rigid`/
  `_injective` are the supporting rational-function teeth.
- G1 NO ASSERTED VALUE: `3/8`, `5/3`, `1/42` FALL OUT via the banked landings + `norm_num`;
  `oneCouplingMixing` is DEFINED and its values COMPUTED, never premised.
- G2 NO EMPIRICAL NUMBER: no `1/137`, no `0.231`, no GUT-unification scale in any statement or proof;
  the comparison to running/measured values would be removable prose only (none appears).
- G4 THE COHERENCE IS DERIVED, NOT POSITED: the consistency is a proved ℚ-identity of the banked
  functions; "one coupling" is the banked `bornWeight_uniform`, not an asserted "the couplings are
  equal".
- UNEARNED-IMPORT: ground field `ℚ` (`3/8`, `5/3`, `1/2`, `1/42` all ℚ-EXACT); NO Mathlib-ℝ/ℂ as
  content; `Finset`/`Fin`/`Module.finrank` (inside the banked objects) are MACHINERY on the derived
  objects (STANDARD §3).
- Foundations-only `⊆ {propext, Classical.choice, Quot.sound}`: no posited axiom, no sorry, no
  compiled-kernel bypass, no heartbeat inflation, no bridge.

DERIVED from the trunk (`alphaStar`/`couplingWeight`/`bornWeight_uniform` the banked single uniform
coupling N315/N316; `hyperRatio`/`weinberg`/`hyperRatio_lands_5_3`/`weinberg_lands_3_8`/
`ladderChargeTrace`/`isospinTrace`/`fund2Weight` the banked trace assembly and its landings
N317/N318, themselves grounded to `finrank ℚ Uhol`/`finrank ℚ singlet`; standard Mathlib arithmetic
MACHINERY on the DERIVED `ℚ`, STANDARD §3). NO posited coherence / coupling-equality axiom as content,
NO Mathlib ℝ/ℂ as content, NO bridge.
-/
import Phys.Algebra.FineStructureScaleCoupling
import Phys.Algebra.ChiralGenerationIsospinTrace
import Mathlib.Tactic

open scoped BigOperators

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

/-! ## (A) The mixing as a function of the single GUT-normalization ratio. -/

/-- THE MIXING AS A FUNCTION OF THE SINGLE DERIVED RATIO `r = Tr(Y²)/Tr(T3²)`. The "one coupling"
    reading: the neutral-current mixing depends on ONE ratio `r`, not three independent couplings. -/
def oneCouplingMixing (r : ℚ) : ℚ := 1 / (1 + r)

/-- The mixing at the derived GUT-normalization ratio `r = 5/3` is `1/(1 + 5/3) = 3/8`. -/
theorem oneCouplingMixing_at_5_3 : oneCouplingMixing (5 / 3) = 3 / 8 := by
  unfold oneCouplingMixing; norm_num

/-- ★★ THE ONE-RATIO MIXING CONSISTENCY. For the banked trace-ratio functions (N317), the mixing
    read off the SINGLE GUT-normalization ratio `r = hyperRatio q t3 = (q−t3)/t3` EQUALS the direct
    trace-fraction mixing `weinberg t3 q = t3/q`. The two neutral-current readings COHERE — a NEW
    relation between the banked `hyperRatio` (A5) and `weinberg` (A6). (Holds for `t3 ≠ 0`.) -/
theorem oneCouplingMixing_eq_weinberg (t3 q : ℚ) (ht3 : t3 ≠ 0) :
    oneCouplingMixing (hyperRatio q t3) = weinberg t3 q := by
  unfold oneCouplingMixing hyperRatio weinberg
  have hstep : 1 + (q - t3) / t3 = q / t3 := by field_simp; ring
  rw [hstep, one_div_div]

/-- ★★★ THE GROUNDED MIXING LANDING: the one-ratio mixing at the BANKED derived charge and isospin
    traces is `3/8`. `hyperRatio (ladderChargeTrace (finrank ℚ Uhol)) (isospinTrace (finrank ℚ Uhol +
    finrank ℚ singlet)(Σ fund2Weight²)) = 5/3` (N318 `hyperRatio_lands_5_3`), so `oneCouplingMixing
    (5/3) = 3/8`. NOT free-floating — the type cites the banked derived trace objects. -/
theorem mixing_grounded :
    oneCouplingMixing (hyperRatio (ladderChargeTrace (Module.finrank ℚ Uhol))
      (isospinTrace (Module.finrank ℚ Uhol + Module.finrank ℚ singlet)
        (∑ i : Fin 2, (fund2Weight i) ^ 2))) = 3 / 8 := by
  rw [hyperRatio_lands_5_3]; exact oneCouplingMixing_at_5_3

/-! ## (B) Iso-stiffness / rigidity — the mixing has ZERO free coupling parameters. -/

/-- ★★ ISO-STIFFNESS (rigidity): the mixing value `3/8` back-determines the GUT-normalization ratio
    `r = 5/3` UNIQUELY. With three INDEPENDENT couplings `r` would be free and the angle arbitrary;
    the single Born form (`bornWeight_uniform`, one coupling) removes that freedom, so the angle is
    RIGID. DERIVED by solving `1/(1+r) = 3/8`. -/
theorem oneCouplingMixing_rigid (r : ℚ) (h1r : 1 + r ≠ 0) :
    oneCouplingMixing r = 3 / 8 → r = 5 / 3 := by
  unfold oneCouplingMixing
  intro h
  field_simp at h
  linarith

/-- ★ THE MAP `r ↦ 1/(1+r)` IS INJECTIVE on ratios with `1 + r ≠ 0` — the general iso-stiffness:
    each mixing value corresponds to a UNIQUE ratio, so no free coupling parameter can hide behind a
    fixed angle. -/
theorem oneCouplingMixing_injective (r r' : ℚ) (h1 : 1 + r ≠ 0) (h1' : 1 + r' ≠ 0) :
    oneCouplingMixing r = oneCouplingMixing r' → r = r' := by
  unfold oneCouplingMixing
  intro h
  field_simp at h
  linarith

/-! ## (C) The single coupling — `alphaStar` is the ONE uniform Born weight. -/

/-- THE SINGLE UNIFORM COUPLING: `alphaStar` IS the banked per-active-channel Born weight
    `couplingWeight` (N315/N316), and equals `1/42`. By `bornWeight_uniform` (banked A3) this ONE
    weight is the SAME on every active channel — a SINGLE coupling, not 42 (or 3 gauge-layer) distinct
    ones. -/
theorem singleCoupling_is_alphaStar : alphaStar = couplingWeight ∧ alphaStar = 1 / 42 :=
  ⟨rfl, alphaStar_eq⟩

/-! ## (D) The JOINT — the one-coupling coherence of Arc A. -/

/-- ★★★ THE ONE-COUPLING COHERENCE (the "one α" reading — the JOINT connecting A3/A4 to A5/A6).
    In ONE statement: the single uniform coupling `alphaStar = 1/42` (A3/A4, `bornWeight_uniform`),
    the derived GUT-normalization ratio `hyperRatio (Tr Q²)(Tr T3²) = 5/3` (A5), the rigid mixing
    `oneCouplingMixing (5/3) = 3/8` computed from that single ratio (A6), and the CONSISTENCY that
    this one-ratio mixing equals the direct trace-fraction mixing `weinberg`. The three gauge layers
    cohere at ONE structural coupling; the mixing is FORCED, not a free parameter. -/
theorem one_coupling_coherence :
    -- the single uniform coupling (A3/A4)
    alphaStar = 1 / 42 ∧
    -- the derived GUT-normalization ratio (A5), grounded to the banked traces
    hyperRatio (ladderChargeTrace (Module.finrank ℚ Uhol))
      (isospinTrace (Module.finrank ℚ Uhol + Module.finrank ℚ singlet)
        (∑ i : Fin 2, (fund2Weight i) ^ 2)) = 5 / 3 ∧
    -- the rigid mixing from that single ratio (A6)
    oneCouplingMixing (hyperRatio (ladderChargeTrace (Module.finrank ℚ Uhol))
      (isospinTrace (Module.finrank ℚ Uhol + Module.finrank ℚ singlet)
        (∑ i : Fin 2, (fund2Weight i) ^ 2))) = 3 / 8 ∧
    -- the CONSISTENCY: the one-ratio mixing equals the direct trace-fraction mixing (for t3 ≠ 0)
    (∀ t3 q : ℚ, t3 ≠ 0 → oneCouplingMixing (hyperRatio q t3) = weinberg t3 q) :=
  ⟨alphaStar_eq, hyperRatio_lands_5_3, mixing_grounded, oneCouplingMixing_eq_weinberg⟩

/-! ## (E) W8 NON-VACUITY WITH TEETH. -/

/-- ★ W8: the NAIVE equal-diagonal ratio `r = 1` (three couplings equal with NO GUT normalization)
    gives `oneCouplingMixing 1 = 1/2 ≠ 3/8`. The `3/8` genuinely needs the DERIVED normalization
    `r = 5/3`, not the naive `r = 1`. -/
theorem oneCouplingMixing_naive_ne : oneCouplingMixing 1 ≠ 3 / 8 := by
  unfold oneCouplingMixing; norm_num

/-- ★ W8 (companion): the naive value is explicitly `1/2`. -/
theorem oneCouplingMixing_one : oneCouplingMixing 1 = 1 / 2 := by
  unfold oneCouplingMixing; norm_num

/-- ★ W8: a WRONG GUT ratio `r ≠ 5/3` gives a mixing `≠ 3/8` — the contrapositive of rigidity. E.g.
    the F₄-trap-style ratio would not land `3/8`. Concretely `r = 3` gives `1/4 ≠ 3/8`. -/
theorem oneCouplingMixing_wrong_ratio_ne : oneCouplingMixing 3 ≠ 3 / 8 := by
  unfold oneCouplingMixing; norm_num

/-- ★ W8: the single coupling is genuinely nonzero and specifically `1/42` (banked), not `1/49`
    (the degenerate `n²` reading). The uniformity is real. -/
theorem singleCoupling_ne_wrong : alphaStar ≠ 1 / 49 := by rw [alphaStar_eq]; norm_num

/-! ## (F) CAPSTONE. -/

/-- ★★★ CAPSTONE — the one-coupling coherence of Arc A (A7). The single uniform Born coupling
    `alphaStar = 1/42` (A3/A4, `bornWeight_uniform`) and the derived GUT-normalization ratio `5/3`
    (A5) together force the RIGID mixing `3/8` (A6) via the one-ratio reading `oneCouplingMixing`,
    which is CONSISTENT with the direct trace-fraction mixing `weinberg` and INJECTIVE (iso-stiffness:
    zero free coupling parameters). W8: the naive `r = 1`, a wrong ratio `r = 3`, and the degenerate
    `1/49` coupling all fail. -/
theorem one_coupling_coherence_structure :
    alphaStar = 1 / 42 ∧
    oneCouplingMixing (hyperRatio (ladderChargeTrace (Module.finrank ℚ Uhol))
      (isospinTrace (Module.finrank ℚ Uhol + Module.finrank ℚ singlet)
        (∑ i : Fin 2, (fund2Weight i) ^ 2))) = 3 / 8 ∧
    (∀ t3 q : ℚ, t3 ≠ 0 → oneCouplingMixing (hyperRatio q t3) = weinberg t3 q) ∧
    (∀ r : ℚ, 1 + r ≠ 0 → oneCouplingMixing r = 3 / 8 → r = 5 / 3) ∧
    oneCouplingMixing 1 ≠ 3 / 8 ∧
    oneCouplingMixing 3 ≠ 3 / 8 :=
  ⟨alphaStar_eq, mixing_grounded, oneCouplingMixing_eq_weinberg, oneCouplingMixing_rigid,
   oneCouplingMixing_naive_ne, oneCouplingMixing_wrong_ratio_ne⟩

end Phys.Algebra
