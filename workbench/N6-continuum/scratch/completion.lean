import Phys.Foundation.Continuum
import Mathlib.Tactic

namespace Phys.Foundation

/-- THE COMPLETION carrier: the type whose ELEMENTS ARE the gathers (Dedekind lower
    cuts) over the ground. Built ONLY from the banked `IsGather` + ℚ. NO `Real`. -/
structure Cut where
  S : ℚ → Prop
  isG : IsGather S

namespace Cut

/-- Cut extensionality: two cuts are equal iff they have the same lower set
    (`isG` is a `Prop`, proof-irrelevant). -/
theorem ext' {x y : Cut} (h : ∀ q, x.S q ↔ y.S q) : x = y := by
  obtain ⟨xS, xG⟩ := x
  obtain ⟨yS, yG⟩ := y
  have hS : xS = yS := funext fun q => propext (h q)
  subst hS
  rfl

/-- Order on the completion = inclusion of lower sets. -/
def le (x y : Cut) : Prop := ∀ q, x.S q → y.S q

instance : LE Cut := ⟨le⟩
instance : LT Cut := ⟨fun x y => x ≤ y ∧ ¬ y ≤ x⟩

theorem le_def {x y : Cut} : x ≤ y ↔ ∀ q, x.S q → y.S q := Iff.rfl
theorem lt_def {x y : Cut} : x < y ↔ x ≤ y ∧ ¬ y ≤ x := Iff.rfl

theorem le_refl (x : Cut) : x ≤ x := fun _ h => h
theorem le_trans {x y z : Cut} (hxy : x ≤ y) (hyz : y ≤ z) : x ≤ z :=
  fun q h => hyz q (hxy q h)
theorem le_antisymm {x y : Cut} (hxy : x ≤ y) (hyx : y ≤ x) : x = y :=
  ext' fun q => ⟨fun h => hxy q h, fun h => hyx q h⟩

/-- ★ TOTALITY OF CUTS (linearity): any two cuts are comparable. THE structural
    fact that makes the union/sup construction produce a genuine cut. -/
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

end Cut

/-! ## The lifted gate (exactly mirroring the ground gate, ℚ ↦ Cut). -/

/-- A GATHER of completion-elements: inhabited, proper, downward-closed, no greatest
    element — the SAME four clauses as the ground `IsGather`, lifted to the Cut order. -/
structure IsGatherC (T : Cut → Prop) : Prop where
  ne     : ∃ x, T x
  proper : ∃ x, ¬ T x
  down   : ∀ {x y}, T y → x ≤ y → T x
  nomax  : ∀ x, T x → ∃ z, T z ∧ x < z

/-- COHERENT in the completion: realized by a completion coherence point `c`. -/
def IsCoherentC (T : Cut → Prop) : Prop := ∃ c : Cut, ∀ x, T x ↔ x < c

/-- The union/sup lower set of a gather of cuts: a rational is in it iff SOME cut of
    the gather contains it. -/
def supCutS (T : Cut → Prop) (q : ℚ) : Prop := ∃ x : Cut, T x ∧ x.S q

/-- ★★ THE COMPLETENESS THEOREM — the completion IS coherence-closed. Every gather of
    completion-elements has a coherence point IN the completion (the least-upper-bound /
    Dedekind-completeness property). THIS is the continuum derived: the gap that the
    ground ℚ could not close (`ground_not_coherence_closed`), the completion does. -/
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
  -- the sup lower set is a genuine cut
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
  · -- T x → x < c
    intro hx
    refine ⟨fun q hq => ⟨x, hx, hq⟩, ?_⟩
    intro hcx
    obtain ⟨z, hz, hxz⟩ := hT.nomax x hx
    have hzc : z ≤ (⟨supCutS T, hgather⟩ : Cut) := fun q hq => ⟨z, hz, hq⟩
    exact hxz.2 (Cut.le_trans hzc hcx)
  · -- x < c → T x
    rintro ⟨hxc, hncx⟩
    rw [Cut.le_def] at hncx
    push Not at hncx
    obtain ⟨q, ⟨y, hy, hyq⟩, hxq⟩ := hncx
    have hxy : x ≤ y := by
      rcases Cut.le_total x y with h | h
      · exact h
      · exact absurd (h q hyq) hxq
    exact hT.down hy hxy

/-! ## Non-vacuity: the rational embedding and the derived √2 — the completion
    strictly extends the ground (so coherence-closedness is non-trivial). -/

/-- The principal (rational) cut of `a`. -/
def Qcut (a : ℚ) : Cut :=
  ⟨fun q => q < a,
    { ne := ⟨a - 1, by linarith⟩
      proper := ⟨a, lt_irrefl a⟩
      down := fun hq hpq => lt_of_le_of_lt hpq hq
      nomax := fun q hq => ⟨(q + a) / 2, by linarith, by linarith⟩ }⟩

/-- ★ THE DERIVED √2 — a genuine element of the completion (the banked canonical gather
    `sqrtTwoGather`, now a coherence point that lives IN the completion). -/
def sqrt2 : Cut := ⟨sqrtTwoGather, sqrtTwoGather_isGather⟩

/-- ★ THE COMPLETION STRICTLY EXTENDS THE GROUND (non-vacuity / anti-W8): the derived
    √2 is NOT a rational cut — if it were, the banked forced miss
    (`sqrtTwoGather_not_coherent`) would be contradicted. So the completion genuinely
    contains points the ground does not, and "coherence-closed" is not vacuous. -/
theorem sqrt2_not_rational : ¬ ∃ a : ℚ, sqrt2 = Qcut a := by
  rintro ⟨a, ha⟩
  refine sqrtTwoGather_not_coherent ⟨a, fun q => ?_⟩
  have : sqrt2.S q ↔ (Qcut a).S q := by rw [ha]
  exact this

/-- ★ THE BANKED MISS IS FILLED IN THE COMPLETION: the canonical gather, which had NO
    GROUND coherence point (`sqrtTwoGather_not_coherent`), DOES have a coherence point
    here — namely the derived √2. The gather of completion-elements strictly below √2
    is realized by √2 ∈ the completion. -/
theorem sqrt2_fills_gap : IsCoherentC (fun x => x < sqrt2) :=
  ⟨sqrt2, fun _ => Iff.rfl⟩

end Phys.Foundation

#print axioms Phys.Foundation.completion_coherence_closed
#print axioms Phys.Foundation.sqrt2_not_rational
#print axioms Phys.Foundation.sqrt2_fills_gap
