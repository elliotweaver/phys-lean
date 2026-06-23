/-
  Phys.Foundation.ContinuumDerived — THE CONTINUUM RE-GROUNDED ONTO THE DERIVED ℚ.
  ===========================================================================
  N6-pre banked the ℝ rung's TWO HALVES — the FORCED GAP (`Continuum.lean`,
  `ground_not_coherence_closed`) and the COMPLETION / order-completeness
  (`CompletionContinuum.lean`, `completion_coherence_closed` + the derived √2) —
  but over Mathlib's IMPORTED `ℚ` (`Rat`), with the agent's own recorded caveat:
  "over the cascade's ground ring ℚ (imported ℚ until the owed ℕ→ℤ→ℚ backfill
  lands — the construction PORTS VERBATIM onto the derived ℚ)". That backfill is
  now DONE (N7 ℕ, N8 ℤ, N9 ℚ, N10 the order on the derived ℕ→ℤ→ℚ). THIS file
  DISCHARGES that caveat: it re-states the entire continuum construction with the
  ground type = the DERIVED ℚ (`Phys.Foundation.Q`, a LINEARLY ORDERED FIELD via
  `OrderedTower`'s `Q.linearOrder` + `Q.isStrictOrderedRing` + N9's `Q.field`),
  with NO `import Mathlib.Data.{Nat,Int,Rat,Real,Complex}` used to GET it, NO
  posited ℝ. So the ℝ rung now rests on the FOLD, not on imported `Rat`.

  ── WHAT CHANGES vs. the imported-ℚ files (W6 — verified, not assumed) ──
  EXACTLY ONE step is not verbatim: the analytic obstruction. The imported-ℚ
  `no_rat_sq_two` used Mathlib `Rat` internals (`Rat.den_pow`/`Rat.num_pow`),
  which the derived `Q` does not carry. It is replaced by the BANKED
  `Q.no_q_sq_two` (`DerivedSqrtTwo.lean`, N10 — no derived rational squares to 2,
  by infinite descent on counting `Re`, the analytic analogue of N2's
  `sqrt_fold_not_on_line`). EVERYTHING ELSE ports verbatim: the four-clause gather
  gate, the Heron/mediant `nomax` up-step (eternal approach, C6), the totality of
  cuts, the union-sup completeness theorem, the rational embedding, the derived √2
  as a new completion element. All order/field tactics (`norm_num`, `nlinarith`,
  `positivity`, `div_pow`/`div_lt_iff₀`/`lt_div_iff₀`) fire on the derived `Q`
  because it is a genuine linearly ordered field — verified, not trusted.

  ── THE THEORY-NATIVE PICTURE (the trunk, read OUT of the math; §2 below) ──
  Identical to N6-pre, now over the derived ground:
  • The fold MISSES itself (N1 `fold_self_blind`) → covering the miss = a CLOSURE
    (downward-closed lower set) → the GATHER OF CLOSURES `IsGather` (downward-closed
    + proper + NO-MAX = locally coherent; the no-max clause IS C6 *eternal approach*)
    → the LOCAL→GLOBAL / sheaf-like FAILURE: the gather coheres locally yet has no
    coherence point in the derived ground.
  • THE COMPLETION carries the gathers: its ELEMENTS ARE the cuts (`Cut`), into
    which every gather DOES have a coherence point = Dedekind order-completeness.
    The continuum derived from the fold's gather of closures, ℝ-free.

  ── WHAT THIS BANKS (all over the DERIVED ℚ) ──
    IsGather / IsCoherent       — the gather gate + ground coherence, over derived Q.
    sqrtTwoGather               — the canonical analytic gap as a gather of closures.
    sqrtTwoGather_isGather      — ★ it is a GENUINE gather (Heron up-step = C6).
    sqrtTwoGather_not_coherent  — ★★ THE FORCED MISS over the derived ground (uses
                                  the banked `Q.no_q_sq_two`, not Mathlib `Rat`).
    ground_not_coherence_closed — the gate as a theorem over the DERIVED ℚ.
    Cut / le / le_total / PartialOrder — the completion carrier + its TOTAL order.
    IsGatherC / IsCoherentC     — the SAME four-clause gate lifted (derived Q-)Cut.
    completion_coherence_closed — ★★ THE COMPLETENESS THEOREM over the derived ground.
    coherent_gather             — anti-vacuity (W8): the hypothesis is richly satisfiable.
    Qcut                        — the (derived) rational embedding.
    sqrt2 / sqrt2_not_rational / sqrt2_fills_gap — ★ THE DERIVED √2 as a first-class
                                  completion element, NOT rational over the DERIVED ℚ
                                  (the completion strictly extends the derived ground),
                                  filling the banked forced miss.

  §2. PHYSICS-WORDS-REMOVABLE (STANDARD §2). Delete "fold / closure / gather / miss
  / completion / continuum / eternal approach / counting / re-entry": what remains
  is that the field of fractions of the Grothendieck completion of the free
  commutative monoid on one generator is a linearly ordered field that is NOT
  Dedekind-complete (it has a lower cut — `{q | q ≤ 0 ∨ q²<2}` — with no supremum),
  while its Dedekind completion (the type of lower cuts) IS Dedekind-complete and
  strictly larger (the cut for √2 is a new point). Pure order theory over a derived
  ordered field; no theorem STATEMENT needs a trunk or physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge,
  NO Mathlib number-system content import, NO posited ℝ.
-/
import Phys.Foundation.DerivedSqrtTwo
import Mathlib.Tactic

namespace Phys.Foundation
namespace ContinuumQ
open Phys.Foundation.Q

/-! ## The gather of closures over the DERIVED ordered field `Q`. -/

/-- A GATHER (of lower closures) on the DERIVED ordered ground `Q`: inhabited (`ne`),
    proper (`proper`), DOWNWARD-CLOSED (`down`), no greatest element (`nomax` — C6
    eternal approach). The four clauses say `S` coheres locally (behaves like the
    lower set of a single point). -/
structure IsGather (S : Q → Prop) : Prop where
  ne     : ∃ q, S q
  proper : ∃ q, ¬ S q
  down   : ∀ {p q}, S q → p ≤ q → S p
  nomax  : ∀ q, S q → ∃ r, S r ∧ q < r

/-- The gather is COHERENT when REALIZED by a ground coherence point `c` (its least
    strict upper bound): `S q ↔ q < c`. -/
def IsCoherent (S : Q → Prop) : Prop := ∃ c : Q, ∀ q, S q ↔ q < c

/-! ## The canonical analytic gap over the DERIVED ℚ. -/

/-- THE CANONICAL GAP as a gather of closures over the derived `Q`: approximants from
    below to the point whose square is `2` (the nonnegative `q² < 2` together with the
    whole nonpositive ray, for downward-closure and inhabitedness). -/
def sqrtTwoGather (q : Q) : Prop := q ≤ 0 ∨ q ^ 2 < 2

/-- ★ IT IS A GENUINE GATHER (non-vacuity / anti-W8) over the derived `Q`: all four
    clauses hold. The `nomax` up-step is the Heron/mediant `(2q+2)/(q+2)` — the
    eternal-approach step C6 names — and it fires over the derived ordered field
    exactly as over imported ℚ (the derived order/field tactics close it). -/
theorem sqrtTwoGather_isGather : IsGather sqrtTwoGather := by
  refine ⟨⟨0, Or.inl le_rfl⟩, ⟨2, ?_⟩, ?_, ?_⟩
  · simp only [sqrtTwoGather, not_or]
    exact ⟨by norm_num, by norm_num⟩
  · rintro p q (hq | hq) hpq
    · exact Or.inl (le_trans hpq hq)
    · rcases le_or_gt p 0 with hp | hp
      · exact Or.inl hp
      · exact Or.inr (by nlinarith)
  · rintro q (hq | hq)
    · exact ⟨1, Or.inr (by norm_num), by linarith⟩
    · rcases le_or_gt q 0 with hq0 | hq0
      · exact ⟨1, Or.inr (by norm_num), by linarith⟩
      · refine ⟨(2 * q + 2) / (q + 2), Or.inr ?_, ?_⟩
        · have hpos : 0 < q + 2 := by linarith
          rw [div_pow, div_lt_iff₀ (by positivity)]
          nlinarith [hq, sq_nonneg (q - 2), sq_nonneg q]
        · have hpos : 0 < q + 2 := by linarith
          rw [lt_div_iff₀ hpos]; nlinarith [hq]

/-- ★★ THE FORCED MISS over the DERIVED ground. The canonical gather has NO coherence
    point in the derived `Q`: a coherence point `c` would force `c² = 2` (ruling out
    `c²<2` by `c ∈ S → c < c`, and `c²>2` by the Heron DOWN-step `(c²+2)/(2c) < c`),
    impossible by the BANKED `Q.no_q_sq_two` (the derived ground has no element
    squaring to 2 — derived by infinite descent on counting, NOT via Mathlib `Rat`).
    The local→global / sheaf-like failure, derived with NO posited ℝ. -/
theorem sqrtTwoGather_not_coherent : ¬ IsCoherent sqrtTwoGather := by
  rintro ⟨c, hc⟩
  have h1 : sqrtTwoGather 1 := Or.inr (by norm_num)
  have hc1 : (1 : Q) < c := (hc 1).mp h1
  have hcpos : 0 < c := by linarith
  have hc2 : c ^ 2 = 2 := by
    rcases lt_trichotomy (c ^ 2) 2 with hlt | heq | hgt
    · have hcS : sqrtTwoGather c := Or.inr hlt
      have := (hc c).mp hcS; linarith
    · exact heq
    · exfalso
      set d : Q := (c ^ 2 + 2) / (2 * c) with hd
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
  exact Q.no_q_sq_two ⟨c, by rw [← pow_two]; exact hc2⟩

/-- THE GATE, STATED AS A THEOREM over the DERIVED ℚ: the derived ground is NOT
    coherence-closed — there EXISTS a genuine gather of closures (locally coherent)
    with no coherence point in the derived `Q`. The obstruction half, re-grounded. -/
theorem ground_not_coherence_closed :
    ∃ S : Q → Prop, IsGather S ∧ ¬ IsCoherent S :=
  ⟨sqrtTwoGather, sqrtTwoGather_isGather, sqrtTwoGather_not_coherent⟩

/-! ## The completion carrier over the DERIVED ℚ: the type whose ELEMENTS ARE the
    gathers (cuts). -/

/-- THE COMPLETION carrier over the derived ground: a gather of closures over the
    derived `Q` (a Dedekind lower cut), packaged as its own object. Built ONLY from
    the (derived-`Q`) `IsGather`; NO `Real`. -/
structure Cut where
  /-- The lower set (the gather of closures) over the derived `Q`. -/
  S : Q → Prop
  /-- It is a genuine gather: downward-closed, proper, no greatest element. -/
  isG : IsGather S

namespace Cut

/-- Cut extensionality (`IsGather` is a `Prop`, hence proof-irrelevant). -/
theorem ext' {x y : Cut} (h : ∀ q, x.S q ↔ y.S q) : x = y := by
  obtain ⟨xS, xG⟩ := x
  obtain ⟨yS, yG⟩ := y
  have hS : xS = yS := funext fun q => propext (h q)
  subst hS
  rfl

/-- THE ORDER on the completion = inclusion of lower sets. -/
def le (x y : Cut) : Prop := ∀ q, x.S q → y.S q

instance : LE Cut := ⟨le⟩
instance : LT Cut := ⟨fun x y => x ≤ y ∧ ¬ y ≤ x⟩

theorem le_def {x y : Cut} : x ≤ y ↔ ∀ q, x.S q → y.S q := Iff.rfl
theorem lt_def {x y : Cut} : x < y ↔ x ≤ y ∧ ¬ y ≤ x := Iff.rfl

theorem le_refl (x : Cut) : x ≤ x := fun _ h => h

theorem le_trans' {x y z : Cut} (hxy : x ≤ y) (hyz : y ≤ z) : x ≤ z :=
  fun q h => hyz q (hxy q h)

theorem le_antisymm' {x y : Cut} (hxy : x ≤ y) (hyx : y ≤ x) : x = y :=
  ext' fun q => ⟨fun h => hxy q h, fun h => hyx q h⟩

/-- ★ TOTALITY OF CUTS (linearity). If `x ⊄ y` then some `a ∈ x \ y`, and
    downward-closure forces every element of `y` below `a` (hence in `x`). The
    structural fact that makes the union of a gather-of-cuts a genuine cut. -/
theorem le_total (x y : Cut) : x ≤ y ∨ y ≤ x := by
  by_cases h : x ≤ y
  · exact Or.inl h
  · right
    rw [le_def] at h
    push Not at h
    obtain ⟨a, haX, haY⟩ := h
    intro p hpY
    rcases le_or_gt p a with hpa | hap
    · exact x.isG.down haX hpa
    · exact absurd (y.isG.down hpY (le_of_lt hap)) haY

instance : Preorder Cut where
  le := le
  lt := fun x y => x ≤ y ∧ ¬ y ≤ x
  le_refl := le_refl
  le_trans := fun _ _ _ => le_trans'
  lt_iff_le_not_ge := fun _ _ => Iff.rfl

/-- The completion is a PARTIAL ORDER (and, by `le_total`, a total one). -/
instance : PartialOrder Cut where
  le_antisymm := fun _ _ => le_antisymm'

end Cut

/-! ## The lifted gate (the SAME four-clause coherence test, derived-`Q` ↦ Cut). -/

/-- A GATHER of completion-elements: the SAME four clauses as the ground `IsGather`,
    now over the completion's own order. -/
structure IsGatherC (T : Cut → Prop) : Prop where
  ne     : ∃ x, T x
  proper : ∃ x, ¬ T x
  down   : ∀ {x y}, T y → x ≤ y → T x
  nomax  : ∀ x, T x → ∃ z, T z ∧ x < z

/-- COHERENT in the completion: realized by a completion coherence point `c`
    (its least strict upper bound): `T x ↔ x < c`. -/
def IsCoherentC (T : Cut → Prop) : Prop := ∃ c : Cut, ∀ x, T x ↔ x < c

/-- The union/sup lower set of a gather of cuts: a (derived) rational `q` lies in it
    iff SOME cut of the gather already contains `q`. The candidate coherence point. -/
def supCutS (T : Cut → Prop) (q : Q) : Prop := ∃ x : Cut, T x ∧ x.S q

/-! ## ★★ THE COMPLETENESS THEOREM — the completion over the DERIVED ℚ is
    coherence-closed. -/

/-- ★★ THE COMPLETION IS COHERENCE-CLOSED (Dedekind order-completeness) over the
    DERIVED ground. Every gather of completion-elements (`IsGatherC T`) has a
    coherence point IN the completion: the union cut `⟨supCutS T, _⟩` is its least
    strict upper bound (`T x ↔ x < c`). THIS is the continuum derived over the
    derived ℚ — the gap the derived ground could not close
    (`ground_not_coherence_closed`), the completion does. -/
theorem completion_coherence_closed (T : Cut → Prop) (hT : IsGatherC T) :
    IsCoherentC T := by
  obtain ⟨x0, hx0⟩ := hT.ne
  obtain ⟨xb, hxb⟩ := hT.proper
  have hbound : ∀ y, T y → y ≤ xb := by
    intro y hy
    rcases Cut.le_total y xb with h | h
    · exact h
    · exact absurd (hT.down hy h) hxb
  have hgather : IsGather (supCutS T) := by
    refine ⟨?_, ?_, ?_, ?_⟩
    · obtain ⟨q, hq⟩ := x0.isG.ne
      exact ⟨q, x0, hx0, hq⟩
    · obtain ⟨b, hb⟩ := xb.isG.proper
      exact ⟨b, fun ⟨y, hy, hyb⟩ => hb (hbound y hy b hyb)⟩
    · rintro p q ⟨y, hy, hyq⟩ hpq
      exact ⟨y, hy, y.isG.down hyq hpq⟩
    · rintro q ⟨y, hy, hyq⟩
      obtain ⟨r, hyr, hqr⟩ := y.isG.nomax q hyq
      exact ⟨r, ⟨y, hy, hyr⟩, hqr⟩
  refine ⟨⟨supCutS T, hgather⟩, fun x => ⟨?_, ?_⟩⟩
  · intro hx
    refine ⟨fun q hq => ⟨x, hx, hq⟩, ?_⟩
    intro hcx
    obtain ⟨z, hz, hxz⟩ := hT.nomax x hx
    have hzc : z ≤ (⟨supCutS T, hgather⟩ : Cut) := fun q hq => ⟨z, hz, hq⟩
    exact hxz.2 (Cut.le_trans' hzc hcx)
  · rintro ⟨hxc, hncx⟩
    rw [Cut.le_def] at hncx
    push Not at hncx
    obtain ⟨q, ⟨y, hy, hyq⟩, hxq⟩ := hncx
    have hxy : x ≤ y := by
      rcases Cut.le_total x y with h | h
      · exact h
      · exact absurd (h q hyq) hxq
    exact hT.down hy hxy

/-! ## Non-vacuity: the (derived) rational embedding, the anti-vacuity guard, the
    derived √2. -/

/-- THE RATIONAL EMBEDDING over the derived ground: the principal cut of `a`, the
    lower set `{q | q < a}`. A genuine cut (the `nomax` up-step is the midpoint
    `(q+a)/2`). -/
def Qcut (a : Q) : Cut :=
  ⟨fun q => q < a,
    { ne := ⟨a - 1, by linarith⟩
      proper := ⟨a, lt_irrefl a⟩
      down := fun hq hpq => lt_of_le_of_lt hpq hq
      nomax := fun q hq => ⟨(q + a) / 2, by linarith, by linarith⟩ }⟩

/-- ★ ANTI-VACUITY (W8) over the derived ground. The completeness hypothesis is RICHLY
    satisfiable: every principal down-set of cuts `{x | x < c}` is a GENUINE
    `IsGatherC`. The `nomax` up-step inserts the rational cut `Qcut b` strictly
    between `x` and `c` — the eternal approach realized one level up. -/
theorem coherent_gather (c : Cut) : IsGatherC (fun x => x < c) := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · obtain ⟨q, hq⟩ := c.isG.ne
    refine ⟨Qcut q, fun r hr => c.isG.down hq (le_of_lt hr), ?_⟩
    obtain ⟨r, hr, hqr⟩ := c.isG.nomax q hq
    exact fun hle => absurd (hle r hr) (by show ¬ r < q; linarith)
  · exact ⟨c, fun h => (lt_irrefl c) h⟩
  · rintro x y hy hxy
    exact ⟨Cut.le_trans' hxy hy.1, fun h => hy.2 (Cut.le_trans' h hxy)⟩
  · rintro x ⟨hxc, hncx⟩
    rw [Cut.le_def] at hncx
    push Not at hncx
    obtain ⟨a, haC, haX⟩ := hncx
    obtain ⟨b, hbC, hab⟩ := c.isG.nomax a haC
    refine ⟨Qcut b, ⟨fun r hr => c.isG.down hbC (le_of_lt hr), ?_⟩, ?_, ?_⟩
    · obtain ⟨b', hb'C, hbb'⟩ := c.isG.nomax b hbC
      exact fun hle => absurd (hle b' hb'C) (by show ¬ b' < b; linarith)
    · intro p hp
      have hpa : p < a := by
        rcases le_or_gt a p with hap | hpa
        · exact absurd (x.isG.down hp hap) haX
        · exact hpa
      show p < b; linarith
    · exact fun hle => haX (hle a (by show a < b; linarith))

/-- ★ THE DERIVED √2 — a first-class element of the completion over the derived ℚ:
    the canonical gather `sqrtTwoGather`, packaged as a `Cut`. The derived ground
    missed it; the completion contains it. -/
def sqrt2 : Cut := ⟨sqrtTwoGather, sqrtTwoGather_isGather⟩

/-- ★ THE COMPLETION STRICTLY EXTENDS THE DERIVED GROUND (non-vacuity). The derived √2
    is NOT a rational cut: if `sqrt2 = Qcut a`, then `a` would realize the canonical
    gather in the derived ground, contradicting `sqrtTwoGather_not_coherent`. So the
    completion genuinely contains points the derived ℚ does not. -/
theorem sqrt2_not_rational : ¬ ∃ a : Q, sqrt2 = Qcut a := by
  rintro ⟨a, ha⟩
  refine sqrtTwoGather_not_coherent ⟨a, fun q => ?_⟩
  have : sqrt2.S q ↔ (Qcut a).S q := by rw [ha]
  exact this

/-- ★ THE BANKED MISS IS FILLED IN THE COMPLETION over the derived ℚ. The canonical
    gather, which had NO coherence point in the derived ground, DOES have one here —
    the derived √2. The local→global failure is repaired exactly at the gap that
    forced the continuum. -/
theorem sqrt2_fills_gap : IsCoherentC (fun x => x < sqrt2) :=
  ⟨sqrt2, fun _ => Iff.rfl⟩

end ContinuumQ
end Phys.Foundation
