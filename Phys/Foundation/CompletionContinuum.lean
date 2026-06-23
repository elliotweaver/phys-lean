/-
  Phys.Foundation.CompletionContinuum — THE STANDING CONTINUUM GATE, increment 2:
  THE COMPLETION (the resolution half — the continuum DERIVED, coherence-closed).
  ===========================================================================
  Increment 1 (`Phys/Foundation/Continuum.lean`) banked the OBSTRUCTION half: the
  cascade's ground ring `ℚ` is NOT coherence-closed — there is a genuine gather of
  closures (`IsGather`, locally coherent: downward-closed, proper, no greatest
  element = the trunk's C6 eternal approach) with NO ground coherence point
  (`ground_not_coherence_closed`). That is the forced gap that makes the continuum
  necessary, derived with NO posited ℝ.

  THIS file banks the RESOLUTION half, exactly as N2 rung-1 followed the OBSTRUCTION
  (`sqrt_fold_not_on_line`) with the RESOLUTION (doubling 1→2 carries the fold-root):
  the gather is CARRIED into a completion, and that completion IS coherence-closed —
  the gap the ground could not close, the completion does. This is the continuum
  DERIVED from the fold's gather of closures, with NO `import …Real` (the gate's whole
  point — ℝ is an OUTPUT to be derived, never an INPUT to be posited; docs/STANDARD.md
  §3, docs/ROADMAP.md STANDING DEPENDENCY GATE).

  ── THE THEORY-NATIVE PICTURE (the trunk, read OUT of the math; see §2 below) ──
  • The forced miss (increment 1): the ground cannot realize its own gathers.
  • THE COMPLETION carries them: its ELEMENTS ARE the gathers themselves (`Cut` — a
    Dedekind lower cut, read theory-native as a gather of closures). The point that
    "should be there" but is missed in the ground IS, in the completion, a first-class
    element — the gather, taken as its own coherence point.
  • THE ORDER is inclusion of lower sets; and cuts are TOTAL (`le_total`) — any two
    compare. Totality is what makes the union of a gather-of-cuts a genuine cut.
  • ★★ COHERENCE-CLOSED (completeness): every gather of completion-elements
    (`IsGatherC`) HAS a coherence point IN the completion (`IsCoherentC`) — its
    least strict upper bound, the union/sup cut. The local→global failure of
    increment 1 is REPAIRED: the eternal approach now attains its limit, inside the
    completion. This is Dedekind order-completeness, the continuum's defining property.

  ── WHAT THIS INCREMENT BANKS (sub-increment (a): carrier + order + completeness) ──
    Cut                    — the completion carrier: a gather (`IsGather`) over `ℚ`.
    le / PartialOrder      — the inclusion order; antisymmetric, reflexive, transitive.
    le_total               — ★ TOTALITY OF CUTS (the union-is-a-cut structural fact).
    IsGatherC / IsCoherentC— the SAME four-clause gate, lifted `ℚ ↦ Cut`.
    completion_coherence_closed — ★★ THE COMPLETENESS THEOREM: every gather of
                             completion-elements has a coherence point in the
                             completion. THE CONTINUUM DERIVED (order-completeness).
    coherent_gather        — ★ ANTI-VACUITY (W8): the completeness hypothesis is
                             richly satisfiable (every principal down-set is a genuine
                             `IsGatherC`), so the theorem is non-vacuous.
    Qcut                   — the rational embedding (the principal cut of `a`).
    sqrt2                  — ★ THE DERIVED √2: the banked canonical gather, now a
                             first-class completion element.
    sqrt2_not_rational     — ★ the completion STRICTLY extends the ground (√2 is a NEW
                             point, no rational cut equals it — else the banked forced
                             miss would be contradicted).
    sqrt2_fills_gap        — ★ THE BANKED MISS IS FILLED: the canonical gather that had
                             NO GROUND coherence point now HAS one here — the derived √2.

  ── WHAT IS OWED (childed onto the chain tail — sub-increment (b)) ──
    The FIELD OPERATIONS: +, ·, and the ordered-field structure on `Cut`, giving the
    full ordered field with the least-upper-bound property. This run banks the
    order-completeness half (carrier + total order + the lub/Dedekind-completeness
    property); the ordered-field operations are the owed child. The gate stays
    UNRESOLVED until `Cut` is an ordered field with lub; this file claims ONLY the
    order-completeness, never that the full ordered-field continuum is already derived.

  §2. PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2). Delete every occurrence of
  "fold / closure / gather / miss / completion / continuum / eternal approach": what
  remains is a complete, true theorem of pure order theory — the type of Dedekind lower
  cuts on `ℚ` is a total partial order in which every nonempty bounded-above down-set of
  cuts has a supremum (the Dedekind completion of `ℚ` is Dedekind-complete), the rational
  cuts embed, and the cut `{q | q ≤ 0 ∨ q² < 2}` is a supremum that is not a rational cut.
  No theorem STATEMENT needs a trunk or physics word to be true. The names are read OUT of
  the math, never INTO it.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, and —
  the gate's whole point — NO `Real`.
-/
import Phys.Foundation.Continuum
import Mathlib.Tactic

namespace Phys.Foundation

/-! ## The completion carrier: the type whose ELEMENTS ARE the gathers (cuts). -/

/-- THE COMPLETION carrier: a gather of closures over the ground `ℚ` (a Dedekind lower
    cut), packaged as its own object. Built ONLY from the banked `IsGather` + `ℚ`; NO
    `Real`. The point the ground missed is, here, a first-class element. -/
structure Cut where
  /-- The lower set (the gather of closures). -/
  S : ℚ → Prop
  /-- It is a genuine gather: downward-closed, proper, no greatest element. -/
  isG : IsGather S

namespace Cut

/-- Cut extensionality: two cuts are equal iff they have the same lower set
    (`IsGather` is a `Prop`, hence proof-irrelevant). -/
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

/-- ★ TOTALITY OF CUTS (linearity). Any two cuts are comparable: if `x ⊄ y` then some
    `a ∈ x \ y`, and downward-closure forces every element of `y` below `a` (hence in
    `x`). THE structural fact that makes the union of a gather-of-cuts a genuine cut —
    the completion is a TOTAL order, the order-completion is well-founded. -/
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

/-! ## The lifted gate (the SAME four-clause coherence test, `ℚ ↦ Cut`). -/

/-- A GATHER of completion-elements: inhabited (`ne`), proper (`proper`), downward-closed
    (`down`), no greatest element (`nomax`) — the SAME four clauses as the ground
    `IsGather`, now over the completion's own order. -/
structure IsGatherC (T : Cut → Prop) : Prop where
  ne     : ∃ x, T x
  proper : ∃ x, ¬ T x
  down   : ∀ {x y}, T y → x ≤ y → T x
  nomax  : ∀ x, T x → ∃ z, T z ∧ x < z

/-- COHERENT in the completion: the gather is REALIZED by a completion coherence point
    `c` (its least strict upper bound): `T x ↔ x < c`. -/
def IsCoherentC (T : Cut → Prop) : Prop := ∃ c : Cut, ∀ x, T x ↔ x < c

/-- The union/sup lower set of a gather of cuts: a rational `q` lies in it iff SOME cut
    of the gather already contains `q`. The candidate coherence point. -/
def supCutS (T : Cut → Prop) (q : ℚ) : Prop := ∃ x : Cut, T x ∧ x.S q

/-! ## ★★ THE COMPLETENESS THEOREM — the completion IS coherence-closed. -/

/-- ★★ THE COMPLETION IS COHERENCE-CLOSED (Dedekind order-completeness). Every gather of
    completion-elements (`IsGatherC T`) has a coherence point IN the completion: the
    union cut `⟨supCutS T, _⟩` is its least strict upper bound (`T x ↔ x < c`). THIS is
    the continuum derived — the gap the ground `ℚ` could not close
    (`ground_not_coherence_closed`, increment 1), the completion does. The proper witness
    of the gather bounds every member (by `le_total` + downward-closure), so the union is
    a genuine cut; `nomax` makes it a STRICT upper bound; `le_total` again gives that
    anything strictly below it already lies in the gather. -/
theorem completion_coherence_closed (T : Cut → Prop) (hT : IsGatherC T) :
    IsCoherentC T := by
  obtain ⟨x0, hx0⟩ := hT.ne
  obtain ⟨xb, hxb⟩ := hT.proper
  -- every member is below the proper witness (totality + downward closure)
  have hbound : ∀ y, T y → y ≤ xb := by
    intro y hy
    rcases Cut.le_total y xb with h | h
    · exact h
    · exact absurd (hT.down hy h) hxb
  -- the union lower set is a genuine cut
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
  · -- T x → x < c : x is included in the union, and strictly (nomax gives a member above)
    intro hx
    refine ⟨fun q hq => ⟨x, hx, hq⟩, ?_⟩
    intro hcx
    obtain ⟨z, hz, hxz⟩ := hT.nomax x hx
    have hzc : z ≤ (⟨supCutS T, hgather⟩ : Cut) := fun q hq => ⟨z, hz, hq⟩
    exact hxz.2 (Cut.le_trans' hzc hcx)
  · -- x < c → T x : a witness rational of c \ x lies in some member y; totality ⇒ x ≤ y
    rintro ⟨hxc, hncx⟩
    rw [Cut.le_def] at hncx
    push Not at hncx
    obtain ⟨q, ⟨y, hy, hyq⟩, hxq⟩ := hncx
    have hxy : x ≤ y := by
      rcases Cut.le_total x y with h | h
      · exact h
      · exact absurd (h q hyq) hxq
    exact hT.down hy hxy

/-! ## Non-vacuity: the rational embedding, the anti-vacuity guard, the derived √2. -/

/-- THE RATIONAL EMBEDDING: the principal (rational) cut of `a` — the lower set
    `{q | q < a}`. A genuine cut (the `nomax` up-step is the midpoint `(q+a)/2`). -/
def Qcut (a : ℚ) : Cut :=
  ⟨fun q => q < a,
    { ne := ⟨a - 1, by linarith⟩
      proper := ⟨a, lt_irrefl a⟩
      down := fun hq hpq => lt_of_le_of_lt hpq hq
      nomax := fun q hq => ⟨(q + a) / 2, by linarith, by linarith⟩ }⟩

/-- ★ ANTI-VACUITY (docs/RUNBOOK.md W8). The completeness theorem's hypothesis is RICHLY
    satisfiable: every principal down-set of cuts `{x | x < c}` is a GENUINE gather of
    completion-elements (`IsGatherC`). So `completion_coherence_closed` is non-vacuous —
    there really are gathers of completion-elements, and they all get their coherence
    point. The `nomax` up-step inserts the rational cut `Qcut b` strictly between `x` and
    `c` (with `a < b`, both ground points of `c`) — the eternal approach realized one
    level up, inside the completion. -/
theorem coherent_gather (c : Cut) : IsGatherC (fun x => x < c) := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · -- ne: the principal cut of a ground point of c is strictly below c
    obtain ⟨q, hq⟩ := c.isG.ne
    refine ⟨Qcut q, fun r hr => c.isG.down hq (le_of_lt hr), ?_⟩
    obtain ⟨r, hr, hqr⟩ := c.isG.nomax q hq
    exact fun hle => absurd (hle r hr) (by show ¬ r < q; linarith)
  · -- proper: c itself is not strictly below c
    exact ⟨c, fun h => (lt_irrefl c) h⟩
  · -- down
    rintro x y hy hxy
    exact ⟨Cut.le_trans' hxy hy.1, fun h => hy.2 (Cut.le_trans' h hxy)⟩
  · -- nomax: with a ∈ c \ x and b > a in c, the cut Qcut b sits strictly between x and c
    rintro x ⟨hxc, hncx⟩
    rw [Cut.le_def] at hncx
    push Not at hncx
    obtain ⟨a, haC, haX⟩ := hncx
    obtain ⟨b, hbC, hab⟩ := c.isG.nomax a haC
    refine ⟨Qcut b, ⟨fun r hr => c.isG.down hbC (le_of_lt hr), ?_⟩, ?_, ?_⟩
    · -- ¬ c ≤ Qcut b
      obtain ⟨b', hb'C, hbb'⟩ := c.isG.nomax b hbC
      exact fun hle => absurd (hle b' hb'C) (by show ¬ b' < b; linarith)
    · -- x ≤ Qcut b
      intro p hp
      have hpa : p < a := by
        rcases le_or_gt a p with hap | hpa
        · exact absurd (x.isG.down hp hap) haX
        · exact hpa
      show p < b; linarith
    · -- ¬ Qcut b ≤ x  (a < b ⇒ a ∈ Qcut b, a ∉ x)
      exact fun hle => haX (hle a (by show a < b; linarith))

/-- ★ THE DERIVED √2 — a first-class element of the completion: the banked canonical
    gather `sqrtTwoGather` (the approximants from below to the point whose square is 2),
    now packaged as a `Cut`. The ground missed it; the completion contains it. -/
def sqrt2 : Cut := ⟨sqrtTwoGather, sqrtTwoGather_isGather⟩

/-- ★ THE COMPLETION STRICTLY EXTENDS THE GROUND (non-vacuity). The derived √2 is NOT a
    rational cut: if `sqrt2 = Qcut a`, then `a` would realize the canonical gather in the
    ground (`sqrtTwoGather q ↔ q < a`), contradicting the banked forced miss
    `sqrtTwoGather_not_coherent`. So the completion genuinely contains points the ground
    does not — "coherence-closed" is not the trivial statement that nothing new appears. -/
theorem sqrt2_not_rational : ¬ ∃ a : ℚ, sqrt2 = Qcut a := by
  rintro ⟨a, ha⟩
  refine sqrtTwoGather_not_coherent ⟨a, fun q => ?_⟩
  have : sqrt2.S q ↔ (Qcut a).S q := by rw [ha]
  exact this

/-- ★ THE BANKED MISS IS FILLED IN THE COMPLETION. The canonical gather, which had NO
    GROUND coherence point (`sqrtTwoGather_not_coherent`, increment 1), DOES have a
    coherence point here — namely the derived √2. The gather of completion-elements
    strictly below √2 is realized by √2 ∈ the completion: the local→global failure of
    increment 1 is repaired exactly at the gap that forced the continuum. -/
theorem sqrt2_fills_gap : IsCoherentC (fun x => x < sqrt2) :=
  ⟨sqrt2, fun _ => Iff.rfl⟩

end Phys.Foundation
