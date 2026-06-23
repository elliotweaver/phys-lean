-- SCRATCH: CompletionContinuum re-grounded onto derived Q. Continuation of continuumQ.lean.
-- Combined into one namespace so Cut sees the ground IsGather over Q.
import Phys.Foundation.DerivedSqrtTwo
import Mathlib.Tactic

namespace Phys.Foundation
namespace ContinuumQ
open Phys.Foundation.Q

structure IsGather (S : Q → Prop) : Prop where
  ne     : ∃ q, S q
  proper : ∃ q, ¬ S q
  down   : ∀ {p q}, S q → p ≤ q → S p
  nomax  : ∀ q, S q → ∃ r, S r ∧ q < r

def IsCoherent (S : Q → Prop) : Prop := ∃ c : Q, ∀ q, S q ↔ q < c

def sqrtTwoGather (q : Q) : Prop := q ≤ 0 ∨ q ^ 2 < 2

theorem sqrtTwoGather_isGather : IsGather sqrtTwoGather := by
  refine ⟨⟨0, Or.inl le_rfl⟩, ⟨2, ?_⟩, ?_, ?_⟩
  · simp only [sqrtTwoGather, not_or]; exact ⟨by norm_num, by norm_num⟩
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
      have hdc : d < c := by rw [hd, div_lt_iff₀ (by positivity)]; nlinarith
      have hdS : sqrtTwoGather d := (hc d).mpr hdc
      have hd2 : 2 < d ^ 2 := by
        rw [hd, div_pow, lt_div_iff₀ (by positivity)]
        nlinarith [sq_nonneg (c ^ 2 - 2), hgt]
      have hdpos : 0 < d := by rw [hd]; positivity
      rcases hdS with h | h
      · linarith
      · linarith
  exact Q.no_q_sq_two ⟨c, by rw [← pow_two]; exact hc2⟩

theorem ground_not_coherence_closed :
    ∃ S : Q → Prop, IsGather S ∧ ¬ IsCoherent S :=
  ⟨sqrtTwoGather, sqrtTwoGather_isGather, sqrtTwoGather_not_coherent⟩

/-! ## The completion. -/

structure Cut where
  S : Q → Prop
  isG : IsGather S

namespace Cut

theorem ext' {x y : Cut} (h : ∀ q, x.S q ↔ y.S q) : x = y := by
  obtain ⟨xS, xG⟩ := x
  obtain ⟨yS, yG⟩ := y
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
    push_neg at h
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

def supCutS (T : Cut → Prop) (q : Q) : Prop := ∃ x : Cut, T x ∧ x.S q

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
    push_neg at hncx
    obtain ⟨q, ⟨y, hy, hyq⟩, hxq⟩ := hncx
    have hxy : x ≤ y := by
      rcases Cut.le_total x y with h | h
      · exact h
      · exact absurd (h q hyq) hxq
    exact hT.down hy hxy

def Qcut (a : Q) : Cut :=
  ⟨fun q => q < a,
    { ne := ⟨a - 1, by linarith⟩
      proper := ⟨a, lt_irrefl a⟩
      down := fun hq hpq => lt_of_le_of_lt hpq hq
      nomax := fun q hq => ⟨(q + a) / 2, by linarith, by linarith⟩ }⟩

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
    push_neg at hncx
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

def sqrt2 : Cut := ⟨sqrtTwoGather, sqrtTwoGather_isGather⟩

theorem sqrt2_not_rational : ¬ ∃ a : Q, sqrt2 = Qcut a := by
  rintro ⟨a, ha⟩
  refine sqrtTwoGather_not_coherent ⟨a, fun q => ?_⟩
  have : sqrt2.S q ↔ (Qcut a).S q := by rw [ha]
  exact this

theorem sqrt2_fills_gap : IsCoherentC (fun x => x < sqrt2) :=
  ⟨sqrt2, fun _ => Iff.rfl⟩

end ContinuumQ
end Phys.Foundation
