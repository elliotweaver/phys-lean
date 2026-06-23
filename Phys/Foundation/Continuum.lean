/-
  Phys.Foundation.Continuum — THE STANDING CONTINUUM GATE, increment 1:
  THE FORCED GAP (the ground is not coherence-closed).
  ===========================================================================
  THE BINDING PRECONDITION before any analytic / physics-recognized node
  (docs/STANDARD.md §3, docs/ROADMAP.md STANDING DEPENDENCY GATE). The algebra
  cascade (N2…N5) takes a base RING as input; everything analytic that physics
  needs — real probabilities (Born), Lie GROUPS, Hilbert space, a spacetime
  continuum, real constants — needs the CONTINUUM, ℝ with completeness. Up to
  now ℝ has been a computational STAND-IN (ℚ witnesses + some real-linear
  scaffolding in N2's why-double law). The gate's iron rule:

    ℝ IS NOT AN AXIOM AND MAY NOT BE POSITED. The continuum is an OUTPUT to be
    DERIVED from the fold, never an INPUT to be assumed. NO `import …Real` used
    to GET a result (that would make the result descend from a Mathlib-given
    object, not the fold — a broken chain).

  This file imports NO `Real`. It derives, over the cascade's own ground ring
  `ℚ`, the FORCED GAP that makes the continuum necessary — the obstruction half,
  exactly mirroring how N2 rung-1 first proved the OBSTRUCTION
  (`sqrt_fold_not_on_line`, `no_foldRoot_dim1`) before the RESOLUTION (doubling).

  ── THE THEORY-NATIVE PICTURE (the trunk, read OUT of the math; see §2 below) ──
  • The fold MISSES itself (N1 `fold_self_blind`: the look-back has no nonzero
    fixed point — unity cannot contain itself).
  • Covering the miss = a CLOSURE: bracket where the missed point "should be" by
    ground approximants from below — a downward-closed lower set.
  • The GATHER OF CLOSURES = that lower set. It coheres LOCALLY: downward-closed
    (`down`), proper (`proper`), and with NO GREATEST element (`nomax`). The
    `nomax` clause IS the trunk's C6 — *eternal approach*: one can always get
    strictly closer; there is no best/attained element.
  • The LOCAL→GLOBAL (sheaf-like) FAILURE: the gather coheres locally yet has NO
    COHERENCE POINT in the ground. The eternal approach attains NOTHING in `ℚ`.
    The continuum is precisely what supplies the missing coherence point.

  ── WHAT THIS INCREMENT BANKS ──
    IsGather               — the gather of lower closures: downward-closed,
                             proper, no greatest element (locally coherent).
    IsCoherent             — the gather is REALIZED by a ground coherence point
                             `c` (its least strict upper bound): `S q ↔ q < c`.
    no_int_sq_two          — no integer squares to 2 (ℝ-free, bounded `omega`).
    no_rat_sq_two          — ★ THE GROUND CANNOT SOLVE THE SQUARE: no rational
                             squares to 2 (ℝ-free; reduces a reduced `q` to an
                             integer and uses `no_int_sq_two`). The engine of the
                             miss — the SAME flavour as N2's `sqrt_fold_not_on_line`
                             (the ordered ground cannot solve a square equation
                             the structure demands; there `j²=−1`, here `q²=2`).
    sqrtTwoGather          — the canonical analytic gap as a gather of closures.
    sqrtTwoGather_isGather — ★ it is a GENUINE gather (all four clauses proved —
                             non-vacuous; the up-step witness is the Heron/mediant
                             `(2q+2)/(q+2)`, the eternal-approach step C6 names).
    sqrtTwoGather_not_coherent — ★★ THE FORCED MISS: the gather has NO ground
                             coherence point. Hence `ℚ` is NOT coherence-closed —
                             a locally-coherent gather of closures with no global
                             coherence point. This is the obstruction that FORCES
                             the continuum, derived with NO posited ℝ.

  ── WHAT IS OWED (childed onto the chain tail — the RESOLUTION half) ──
    The completion: build the type of gathers/cuts itself, give it the ordered-
    field structure, and prove IT is coherence-closed (every gather of ITS
    elements has a coherence point) = COMPLETENESS. That is increment 2; until it
    lands the gate stays UNRESOLVED. This file claims ONLY the forced gap, never
    that the continuum is already derived.

  §2. PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete every occurrence of
  "fold / closure / gather / miss / continuum / eternal approach": what remains
  is a complete, true theorem of pure order theory — a downward-closed, proper,
  no-maximum predicate on `ℚ` (a Dedekind LOWER CUT) realized by no rational, so
  `ℚ` has a cut with no rational supremum. No theorem STATEMENT needs a trunk or
  physics word to be true. The names are read OUT of the math, never INTO it.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no
  bridge, and — the gate's whole point — NO `Real`.
-/
import Mathlib.Data.Rat.Defs
import Mathlib.Data.Rat.Lemmas
import Mathlib.Tactic

namespace Phys.Foundation

/-! ## The ground cannot solve the square (the engine of the miss; ℝ-free). -/

/-- No integer squares to `2`. Bounded between `-2` and `2` by positivity of
    squares, then finite case analysis. (The integer core of the miss.) -/
theorem no_int_sq_two (n : ℤ) (h : n ^ 2 = 2) : False := by
  have hlo : -2 ≤ n := by nlinarith [sq_nonneg (n + 2)]
  have hhi : n ≤ 2 := by nlinarith [sq_nonneg (n - 2)]
  interval_cases n <;> omega

/-- ★ THE GROUND CANNOT SOLVE THE SQUARE: no rational squares to `2`, proved
    WITHOUT `Real` (no `irrational_sqrt_two`, which is stated over ℝ). A reduced
    `q` with `q² = 2` has denominator `1` (`den (q²) = den 2 = 1` and
    `den (q²) = (den q)²`), hence is an integer, contradicting `no_int_sq_two`.
    This is the analytic-order analogue of N2's `sqrt_fold_not_on_line`: the
    ordered ground cannot solve a square equation the structure demands. -/
theorem no_rat_sq_two : ¬ ∃ q : ℚ, q ^ 2 = 2 := by
  rintro ⟨q, h⟩
  have hd : (q ^ 2).den = 1 := by rw [h]; rfl
  rw [Rat.den_pow] at hd
  have hden1 : q.den = 1 := by
    nlinarith [Nat.one_le_iff_ne_zero.mpr q.den_nz, hd]
  have hnum : (q.num) ^ 2 = 2 := by
    have hp := Rat.num_pow q 2
    rw [h] at hp
    simpa [hden1] using hp.symm
  exact no_int_sq_two q.num hnum

/-! ## The gather of closures, and coherence by a ground point. -/

/-- A GATHER (of lower closures) on the ordered ground `ℚ`: a predicate `S` that
    is inhabited (`ne`), proper (`proper` — does not swallow the whole line),
    DOWNWARD-CLOSED (`down` — a closure of everything below an approximant), and
    has NO GREATEST element (`nomax` — the trunk's C6 *eternal approach*: always
    a strictly larger approximant). These four clauses are exactly "coheres
    locally": `S` behaves like the lower set of a single point. -/
structure IsGather (S : ℚ → Prop) : Prop where
  ne     : ∃ q, S q
  proper : ∃ q, ¬ S q
  down   : ∀ {p q}, S q → p ≤ q → S p
  nomax  : ∀ q, S q → ∃ r, S r ∧ q < r

/-- The gather is COHERENT when it is REALIZED by a ground coherence point `c`:
    `S` is exactly the lower set `{q | q < c}`. (`c` is the gather's least strict
    upper bound — its limit, attained in the ground.) -/
def IsCoherent (S : ℚ → Prop) : Prop := ∃ c : ℚ, ∀ q, S q ↔ q < c

/-! ## The canonical analytic gap — a genuine gather with NO ground coherence
    point. The forced miss that makes the continuum necessary. -/

/-- THE CANONICAL GAP as a gather of closures: the approximants from below to the
    point whose square is `2` (the nonnegative part `q² < 2`, together with the
    whole nonpositive ray so the set is downward-closed and inhabited). -/
def sqrtTwoGather (q : ℚ) : Prop := q ≤ 0 ∨ q ^ 2 < 2

/-- ★ IT IS A GENUINE GATHER (non-vacuity / anti-W8): all four clauses hold. The
    `nomax` up-step is the Heron/mediant approximant `(2q+2)/(q+2)` — the
    eternal-approach step C6 names: from any `q` with `q² < 2` it produces a
    strictly larger `r` still with `r² < 2`. The miss below is therefore NOT an
    artifact of a degenerate predicate. -/
theorem sqrtTwoGather_isGather : IsGather sqrtTwoGather := by
  refine ⟨⟨0, Or.inl le_rfl⟩, ⟨2, ?_⟩, ?_, ?_⟩
  · -- proper: 2 ∉ S  (2 > 0 and 2² = 4 ≥ 2)
    simp only [sqrtTwoGather, not_or]
    constructor
    · norm_num
    · norm_num
  · -- downward-closed
    rintro p q (hq | hq) hpq
    · exact Or.inl (le_trans hpq hq)
    · rcases le_or_gt p 0 with hp | hp
      · exact Or.inl hp
      · exact Or.inr (by nlinarith)
  · -- no greatest element (eternal approach, C6)
    rintro q (hq | hq)
    · exact ⟨1, Or.inr (by norm_num), by linarith⟩
    · rcases le_or_gt q 0 with hq0 | hq0
      · exact ⟨1, Or.inr (by norm_num), by linarith⟩
      · refine ⟨(2 * q + 2) / (q + 2), Or.inr ?_, ?_⟩
        · have hpos : 0 < q + 2 := by linarith
          rw [div_pow, div_lt_iff₀ (by positivity)]
          nlinarith [hq, sq_nonneg (q - 2), sq_nonneg q]
        · have hpos : 0 < q + 2 := by linarith
          rw [lt_div_iff₀ hpos]; nlinarith [hq]

/-- ★★ THE FORCED MISS. The canonical gather has NO ground coherence point: the
    ground `ℚ` is NOT coherence-closed. If a coherence point `c` existed it would
    satisfy `c² = 2` (ruling out `c² < 2` by `c ∈ S → c < c`, and `c² > 2` by the
    Heron DOWN-step `(c²+2)/(2c) < c` still over the bound) — impossible by
    `no_rat_sq_two`. This is the local→global / sheaf-like failure: a
    locally-coherent gather of closures (proved `IsGather`) whose eternal approach
    attains nothing in the ground. The obstruction that FORCES the continuum —
    derived with NO posited ℝ. -/
theorem sqrtTwoGather_not_coherent : ¬ IsCoherent sqrtTwoGather := by
  rintro ⟨c, hc⟩
  have h1 : sqrtTwoGather 1 := Or.inr (by norm_num)
  have hc1 : (1 : ℚ) < c := (hc 1).mp h1
  have hcpos : 0 < c := by linarith
  have hc2 : c ^ 2 = 2 := by
    rcases lt_trichotomy (c ^ 2) 2 with hlt | heq | hgt
    · -- c² < 2 ⟹ c ∈ S ⟹ c < c, absurd
      have hcS : sqrtTwoGather c := Or.inr hlt
      have := (hc c).mp hcS; linarith
    · exact heq
    · -- c² > 2 ⟹ the Heron down-step d = (c²+2)/(2c) is < c with d² > 2,
      -- yet d < c forces d ∈ S forces d² < 2 — absurd.
      exfalso
      set d : ℚ := (c ^ 2 + 2) / (2 * c) with hd
      have hdc : d < c := by
        rw [hd, div_lt_iff₀ (by positivity)]; nlinarith
      have hdS : sqrtTwoGather d := (hc d).mpr hdc
      have hd2 : 2 < d ^ 2 := by
        rw [hd, div_pow, lt_div_iff₀ (by positivity)]
        nlinarith [sq_nonneg (c ^ 2 - 2), hgt]
      have hdpos : 0 < d := by rw [hd]; positivity
      rcases hdS with h | h
      · linarith
      · linarith
  exact no_rat_sq_two ⟨c, hc2⟩

/-- THE GATE, STATED AS A THEOREM (the deliverable of increment 1): the cascade's
    ground ring `ℚ` is NOT coherence-closed — there EXISTS a genuine gather of
    closures (locally coherent) with no ground coherence point. The continuum is
    what such gaps force; constructing it (and proving the construction
    coherence-closed = complete) is the owed RESOLUTION, childed onto the tail.
    Until then this is the obstruction only — never a claim that ℝ is derived. -/
theorem ground_not_coherence_closed :
    ∃ S : ℚ → Prop, IsGather S ∧ ¬ IsCoherent S :=
  ⟨sqrtTwoGather, sqrtTwoGather_isGather, sqrtTwoGather_not_coherent⟩

end Phys.Foundation
