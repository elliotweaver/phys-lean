import Phys.Foundation.Continuum
import Mathlib.Tactic

namespace Phys.Foundation

structure Cut where
  S : ℚ → Prop
  isG : IsGather S

namespace Cut

theorem ext' {x y : Cut} (h : ∀ q, x.S q ↔ y.S q) : x = y := by
  obtain ⟨xS, xG⟩ := x; obtain ⟨yS, yG⟩ := y
  have hS : xS = yS := funext fun q => propext (h q)
  subst hS; rfl

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

instance : PartialOrder Cut where
  le_antisymm := fun _ _ => le_antisymm'

end Cut

structure IsGatherC (T : Cut → Prop) : Prop where
  ne     : ∃ x, T x
  proper : ∃ x, ¬ T x
  down   : ∀ {x y}, T y → x ≤ y → T x
  nomax  : ∀ x, T x → ∃ z, T z ∧ x < z

def IsCoherentC (T : Cut → Prop) : Prop := ∃ c : Cut, ∀ x, T x ↔ x < c

def supCutS (T : Cut → Prop) (q : ℚ) : Prop := ∃ x : Cut, T x ∧ x.S q

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

def Qcut (a : ℚ) : Cut :=
  ⟨fun q => q < a,
    { ne := ⟨a - 1, by linarith⟩
      proper := ⟨a, lt_irrefl a⟩
      down := fun hq hpq => lt_of_le_of_lt hpq hq
      nomax := fun q hq => ⟨(q + a) / 2, by linarith, by linarith⟩ }⟩

/-- ★ ANTI-VACUITY (W8): every principal down-set of cuts `{x | x < c}` is a GENUINE
    gather of completion-elements. So the hypothesis of the completeness theorem is
    richly satisfiable — `completion_coherence_closed` is NOT vacuous. The `nomax`
    up-step inserts the rational cut `Qcut b` strictly between `x` and `c`. -/
theorem coherent_gather (c : Cut) : IsGatherC (fun x => x < c) := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · -- ne: some cut is strictly below c (the principal cut of an element of c)
    obtain ⟨q, hq⟩ := c.isG.ne
    refine ⟨Qcut q, fun r hr => c.isG.down hq (le_of_lt hr), ?_⟩
    obtain ⟨r, hr, hqr⟩ := c.isG.nomax q hq
    exact fun hle => absurd (hle r hr) (by show ¬ r < q; linarith)
  · -- proper: c itself is not strictly below c
    exact ⟨c, fun h => (lt_irrefl c) h⟩
  · -- down
    rintro x y hy hxy
    exact ⟨Cut.le_trans' hxy hy.1, fun h => hy.2 (Cut.le_trans' h hxy)⟩
  · -- nomax: insert Qcut b with a < b, both in c
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
    · -- ¬ Qcut b ≤ x  (a < b so a ∈ Qcut b, a ∉ x)
      exact fun hle => haX (hle a (by show a < b; linarith))

def sqrt2 : Cut := ⟨sqrtTwoGather, sqrtTwoGather_isGather⟩

theorem sqrt2_not_rational : ¬ ∃ a : ℚ, sqrt2 = Qcut a := by
  rintro ⟨a, ha⟩
  refine sqrtTwoGather_not_coherent ⟨a, fun q => ?_⟩
  have : sqrt2.S q ↔ (Qcut a).S q := by rw [ha]
  exact this

theorem sqrt2_fills_gap : IsCoherentC (fun x => x < sqrt2) :=
  ⟨sqrt2, fun _ => Iff.rfl⟩

end Phys.Foundation

#print axioms Phys.Foundation.completion_coherence_closed
#print axioms Phys.Foundation.coherent_gather
#print axioms Phys.Foundation.sqrt2_not_rational
#print axioms Phys.Foundation.sqrt2_fills_gap
