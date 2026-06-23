import Phys.Foundation.ContinuumFieldMul
import Mathlib.Tactic

namespace Phys.Foundation
namespace ContinuumQ
open Phys.Foundation ContinuumQ

/-! ## RECOVERED LEVERS (from workbench/N12-real-mult/scratch/a3_conelaws.lean). -/

theorem nonneg_iff {x : Cut} : (0:Cut) ≤ x ↔ ∀ q, q < 0 → x.S q := by
  rw [show (0:Cut) = Qcut 0 from rfl, Cut.le_def]; rfl

theorem exists_pos_mem {x : Cut} (hx : 0 ≤ x) (hne : x ≠ 0) : ∃ a, 0 < a ∧ x.S a := by
  by_contra h
  push_neg at h
  apply hne
  apply Cut.ext'; intro q
  rw [show (0:Cut) = Qcut 0 from rfl]
  show x.S q ↔ q < 0
  constructor
  · intro hq
    rcases le_or_gt q 0 with hq0 | hq0
    · rcases eq_or_lt_of_le hq0 with hq00 | h0
      · obtain ⟨r, hr, h0r⟩ := x.isG.nomax q hq
        exact absurd hr (h r (by rw [hq00] at h0r; linarith))
      · exact h0
    · exact absurd hq (h q hq0)
  · intro hq; exact (nonneg_iff.mp hx) q hq

/-! ## PHASE 1 — cheap cone algebra. -/

/-- `(1:Cut).S q ↔ q < 1` (One = Qcut 1). -/
theorem one_S (q : Q) : (1:Cut).S q ↔ q < 1 := Iff.rfl

/-- The positive-cone product ALWAYS contains the negative ray, so `0 ≤ pmul x y`
    unconditionally. -/
theorem zero_le_pmul (x y : Cut) : 0 ≤ pmul x y := by
  rw [nonneg_iff]; intro q hq; rw [pmul_S]; exact Or.inl hq

/-- `pmul x 0 = 0`: the existential branch needs `0 ≤ b ∧ b < 0` (impossible). -/
theorem pmul_zero (x : Cut) : pmul x 0 = 0 := by
  apply Cut.ext'; intro q
  rw [pmul_S, zero_S]
  constructor
  · rintro (h | ⟨a, b, ha, hb, hxa, hyb, hq⟩)
    · exact h
    · rw [zero_S] at hyb; linarith
  · intro h; exact Or.inl h

/-- `pmul 0 x = 0` (by commutativity). -/
theorem zero_pmul (x : Cut) : pmul 0 x = 0 := by rw [pmul_comm]; exact pmul_zero x

/-- `pmul x 1 = x` for `x ≥ 0` (the unit cut, mirror of N11 `zero_add'`). -/
theorem pmul_one_cone {x : Cut} (hx : 0 ≤ x) : pmul x 1 = x := by
  apply Cut.ext'; intro q
  rw [pmul_S]
  constructor
  · rintro (hneg | ⟨a, b, ha, hb, hxa, hb1, hq⟩)
    · exact (nonneg_iff.mp hx) q hneg
    · have hb1' : b < 1 := hb1
      have hqa : q < a := by
        have : a * b ≤ a := mul_le_of_le_one_right ha (le_of_lt hb1')
        linarith
      exact x.isG.down hxa (le_of_lt hqa)
  · intro hq
    rcases lt_or_ge q 0 with hq0 | hq0
    · exact Or.inl hq0
    · obtain ⟨a, hxa, hqa⟩ := x.isG.nomax q hq
      have ha0 : 0 < a := lt_of_le_of_lt hq0 hqa
      have h2a : 0 < 2 * a := by linarith
      refine Or.inr ⟨a, (q + a) / (2 * a), le_of_lt ha0, ?_, hxa, ?_, ?_⟩
      · exact div_nonneg (by linarith) (le_of_lt h2a)
      · show (q + a) / (2 * a) < 1
        rw [div_lt_one h2a]; linarith
      · have hrw : a * ((q + a) / (2 * a)) = (q + a) / 2 := by field_simp
        rw [hrw]; linarith

/-! ## PHASE 2 — cone associativity + cone distributivity. -/

/-- CONE ASSOCIATIVITY: `pmul (pmul x y) z = pmul x (pmul y z)` for `x,y,z ≥ 0`. The
    nomax up-step shows the intermediate product is a genuine member. -/
theorem pmul_assoc_cone {x y z : Cut} (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
    pmul (pmul x y) z = pmul x (pmul y z) := by
  apply Cut.ext'; intro q
  rw [pmul_S, pmul_S]
  constructor
  · rintro (hneg | ⟨ab, c, hab0, hc0, habmem, hzc, hq⟩)
    · exact Or.inl hneg
    · rw [pmul_S] at habmem
      rcases habmem with hn | ⟨a, b, ha0, hb0, hxa, hyb, hablt⟩
      · linarith
      · right
        have hbc_mem : (pmul y z).S (b * c) := by
          rw [pmul_S]; right
          obtain ⟨b', hb', hbb'⟩ := y.isG.nomax b hyb
          obtain ⟨c', hc', hcc'⟩ := z.isG.nomax c hzc
          exact ⟨b', c', le_of_lt (lt_of_le_of_lt hb0 hbb'),
            le_of_lt (lt_of_le_of_lt hc0 hcc'), hb', hc',
            by nlinarith [hb0, hc0, hbb', hcc']⟩
        refine ⟨a, b * c, ha0, mul_nonneg hb0 hc0, hxa, hbc_mem, ?_⟩
        nlinarith [hq, hablt, hc0, mul_le_mul_of_nonneg_right (le_of_lt hablt) hc0]
  · rintro (hneg | ⟨a, bc, ha0, hbc0, hxa, hbcmem, hq⟩)
    · exact Or.inl hneg
    · rw [pmul_S] at hbcmem
      rcases hbcmem with hn | ⟨b, c, hb0, hc0, hyb, hzc, hbclt⟩
      · linarith
      · right
        have hab_mem : (pmul x y).S (a * b) := by
          rw [pmul_S]; right
          obtain ⟨a', ha', haa'⟩ := x.isG.nomax a hxa
          obtain ⟨b', hb', hbb'⟩ := y.isG.nomax b hyb
          exact ⟨a', b', le_of_lt (lt_of_le_of_lt ha0 haa'),
            le_of_lt (lt_of_le_of_lt hb0 hbb'), ha', hb',
            by nlinarith [ha0, hb0, haa', hbb']⟩
        refine ⟨a * b, c, mul_nonneg ha0 hb0, hc0, hab_mem, hzc, ?_⟩
        nlinarith [hq, hbclt, ha0, mul_le_mul_of_nonneg_left (le_of_lt hbclt) ha0]

/-- CONE DISTRIBUTIVITY: `pmul x (y + z) = pmul x y + pmul x z` for `x,y,z ≥ 0`.
    Attacked THROUGH the positive cone + the banked `add_S` (Born positivity makes the
    negative ray harmless: nonneg×nonneg ≥ 0, so a negative summand never needs a matching
    negative product). FORWARD uses `max`-with-the-positive-witness so each factor is a
    genuine NONNEG member (no sign sub-cases); REVERSE combines the two x-approximants via
    `max`. Degenerate cuts handled by the banked `pmul_zero`/`zero_pmul`. -/
theorem pmul_distrib_cone {x y z : Cut} (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
    pmul x (y + z) = pmul x y + pmul x z := by
  by_cases hx0 : x = 0
  · rw [hx0, zero_pmul, zero_pmul, zero_pmul, add_zero']
  by_cases hy0 : y = 0
  · rw [hy0, zero_add', pmul_zero, zero_add']
  by_cases hz0 : z = 0
  · rw [hz0, add_zero', pmul_zero, add_zero']
  -- MAIN: x ≠ 0, y ≠ 0, z ≠ 0
  obtain ⟨yp, hyp0, hyp⟩ := exists_pos_mem hy hy0
  obtain ⟨zp, hzp0, hzp⟩ := exists_pos_mem hz hz0
  apply Cut.ext'; intro q
  rw [pmul_S, add_S]
  constructor
  · -- FORWARD: pmul x (y+z) ⊆ pmul x y + pmul x z
    rintro (hneg | ⟨a, s, ha, hs, hxa, hsmem, hq⟩)
    · exact ⟨q / 2, q / 2, Or.inl (by linarith), Or.inl (by linarith), by ring⟩
    rcases lt_or_ge q 0 with hqneg | hqpos
    · exact ⟨q / 2, q / 2, Or.inl (by linarith), Or.inl (by linarith), by ring⟩
    · -- q ≥ 0, hence a > 0 (else a*s = 0, contradicting q < a*s and q ≥ 0)
      have ha0 : 0 < a := by
        rcases eq_or_lt_of_le ha with h | h
        · exfalso; rw [← h, zero_mul] at hq; linarith
        · exact h
      rw [add_S] at hsmem
      obtain ⟨b, c, hyb, hzc, hsbc⟩ := hsmem
      rw [hsbc] at hq
      -- replace b, c by NONNEG members B = max b yp, C = max c zp
      set B : Q := max b yp with hB
      set C : Q := max c zp with hC
      have hBmem : y.S B := by
        rcases le_total b yp with h | h
        · rw [hB, max_eq_right h]; exact hyp
        · rw [hB, max_eq_left h]; exact hyb
      have hCmem : z.S C := by
        rcases le_total c zp with h | h
        · rw [hC, max_eq_right h]; exact hzp
        · rw [hC, max_eq_left h]; exact hzc
      have hB0 : 0 ≤ B := le_trans (le_of_lt hyp0) (le_max_right _ _)
      have hC0 : 0 ≤ C := le_trans (le_of_lt hzp0) (le_max_right _ _)
      have hbB : b ≤ B := le_max_left _ _
      have hcC : c ≤ C := le_max_left _ _
      have hq' : q < a * B + a * C := by
        nlinarith [hq, mul_le_mul_of_nonneg_left hbB (le_of_lt ha0),
          mul_le_mul_of_nonneg_left hcC (le_of_lt ha0)]
      refine ⟨a * B - (a * B + a * C - q) / 2, a * C - (a * B + a * C - q) / 2,
        Or.inr ⟨a, B, le_of_lt ha0, hB0, hxa, hBmem, by linarith⟩,
        Or.inr ⟨a, C, le_of_lt ha0, hC0, hxa, hCmem, by linarith⟩, by ring⟩
  · -- REVERSE: pmul x y + pmul x z ⊆ pmul x (y+z)
    rintro ⟨u, v, hu, hv, hquv⟩
    rw [pmul_S] at hu hv
    rcases hu with hun | ⟨a1, b, ha1, hb, hxa1, hyb, huab⟩
    · rcases hv with hvn | ⟨a2, c, ha2, hc, hxa2, hzc, hvac⟩
      · exact Or.inl (by rw [hquv]; linarith)
      · right
        refine ⟨a2, yp + c, ha2, by linarith, hxa2, ?_, ?_⟩
        · rw [add_S]; exact ⟨yp, c, hyp, hzc, rfl⟩
        · have h0 : 0 ≤ a2 * yp := mul_nonneg ha2 (le_of_lt hyp0)
          have hexp : a2 * (yp + c) = a2 * yp + a2 * c := by ring
          rw [hexp, hquv]; linarith
    · rcases hv with hvn | ⟨a2, c, ha2, hc, hxa2, hzc, hvac⟩
      · right
        refine ⟨a1, b + zp, ha1, by linarith, hxa1, ?_, ?_⟩
        · rw [add_S]; exact ⟨b, zp, hyb, hzp, rfl⟩
        · have h0 : 0 ≤ a1 * zp := mul_nonneg ha1 (le_of_lt hzp0)
          have hexp : a1 * (b + zp) = a1 * b + a1 * zp := by ring
          rw [hexp, hquv]; linarith
      · right
        set a : Q := max a1 a2 with hamax
        have ha : 0 ≤ a := le_trans ha1 (le_max_left _ _)
        have hxa : x.S a := by
          rcases le_total a1 a2 with h | h
          · rw [hamax, max_eq_right h]; exact hxa2
          · rw [hamax, max_eq_left h]; exact hxa1
        have ha1a : a1 ≤ a := le_max_left _ _
        have ha2a : a2 ≤ a := le_max_right _ _
        refine ⟨a, b + c, ha, by linarith, hxa, ?_, ?_⟩
        · rw [add_S]; exact ⟨b, c, hyb, hzc, rfl⟩
        · have hub : u < a * b := lt_of_lt_of_le huab (mul_le_mul_of_nonneg_right ha1a hb)
          have hvc : v < a * c := lt_of_lt_of_le hvac (mul_le_mul_of_nonneg_right ha2a hc)
          have hexp : a * (b + c) = a * b + a * c := by ring
          rw [hexp, hquv]; linarith

end ContinuumQ
end Phys.Foundation
