/-
  Phys.Foundation.ContinuumFieldRing — THE ℝ RUNG'S FIELD OPERATIONS, INCREMENT 3:
  THE COMMUTATIVE RING `CommRing Cut` on the DERIVED-ℚ completion `ContinuumQ.Cut`.
  ===========================================================================
  N10 banked the ORDER half over the DERIVED ℚ; N11 the ADDITIVE ORDERED GROUP
  (`AddCommGroup Cut` + `LinearOrder Cut` + `IsOrderedAddMonoid Cut`); N12 the
  POSITIVE-CONE MULTIPLICATION `pmul`, sign-extended to `Mul Cut`, `One = Qcut 1`,
  and the CAPSTONE `√2 · √2 = 2`. THIS file banks INCREMENT 3: the RING LAWS — `Cut`
  is a COMMUTATIVE RING under the sign-extended product, with NO posited ℝ, NO
  `import Mathlib.Data.{Nat,Int,Rat,Real,Complex}` used to GET it. (The multiplicative
  INVERSE → `Field Cut` + `IsStrictOrderedRing Cut` is the next increment, childed.)

  ── THE THEORY-NATIVE PICTURE (the trunk, read OUT of the math; §2 below) ──
  THE POSITIVE CONE is where Born = self-overlap = POSITIVITY lives. The ring laws
  are GENUINE MATHEMATICAL CONTENT proved ON THE CONE (`pmul_assoc_cone`,
  `pmul_distrib_cone`, `pmul_one_cone`), where `pmul` is the true product of approached
  points. The SIGN EXTENSION (the banked `instMul`) reduces every product to the cone
  via the banked NEGATION (the fold's reflection, N11) and the banked `LinearOrder Cut`.
  The SIGN-HOMOMORPHISM laws `neg_mul`/`mul_neg` collapse the sign explosion: each ring
  law on all of `Cut` reduces — by peeling each factor's sign through the reflection — to
  its cone version. Born positivity makes the cone the seat of the multiplication; the
  reflection carries it to the whole line.

  §2. PHYSICS-WORDS-REMOVABLE (STANDARD §2). Delete "fold / reflection / gather / Born /
  positivity / cone / completion / continuum / counting": what remains is that the type of
  lower Dedekind cuts of a derived linearly ordered Archimedean field is a COMMUTATIVE RING
  under the sign-extended product (the cut of pairwise products of nonnegative members,
  reflected by sign), with `Qcut 1` the unit. Pure order theory over a derived ordered
  field; no theorem STATEMENT needs a trunk or physics word.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge,
  NO Mathlib number-system content import, NO posited ℝ.
-/
import Phys.Foundation.ContinuumFieldMul
import Mathlib.Tactic

namespace Phys.Foundation
namespace ContinuumQ
open Phys.Foundation ContinuumQ

/-! ## CONE MEMBERSHIP LEVERS (recovered from the N12 gauge). -/

/-- `0 ≤ x` (i.e. `Qcut 0 ≤ x`) means x contains every negative rational. -/
theorem nonneg_iff {x : Cut} : (0:Cut) ≤ x ↔ ∀ q, q < 0 → x.S q := by
  rw [show (0:Cut) = Qcut 0 from rfl, Cut.le_def]; rfl

/-- For `x ≥ 0` with `x ≠ 0`, x has a strictly positive element (nomax past 0). -/
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

/-- The positive-cone product ALWAYS contains the negative ray: `0 ≤ pmul x y`
    unconditionally (Born positivity — the product cone never dips below 0). -/
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

/-- `(0:Cut) ≤ 1` (the unit cut is nonnegative). -/
theorem zero_le_one' : (0:Cut) ≤ 1 := by
  rw [show (1:Cut) = Qcut 1 from rfl, show (0:Cut) = Qcut 0 from rfl]
  exact le_of_lt (Qcut_strictMono (by norm_num))

/-- `pmul x 1 = x` for `x ≥ 0` (the unit cut; the nomax up-step supplies the
    decomposition, mirror of N11 `zero_add'`). -/
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

/-- `pmul 1 x = x` for `x ≥ 0`. -/
theorem one_pmul_cone {x : Cut} (hx : 0 ≤ x) : pmul 1 x = x := by
  rw [pmul_comm]; exact pmul_one_cone hx

/-! ## PHASE 2 — cone associativity + cone distributivity. -/

/-- CONE ASSOCIATIVITY: `pmul (pmul x y) z = pmul x (pmul y z)` for `x,y,z ≥ 0`. -/
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

/-- ★ CONE DISTRIBUTIVITY: `pmul x (y + z) = pmul x y + pmul x z` for `x,y,z ≥ 0`.
    Attacked THROUGH the positive cone + the banked `add_S` (Born positivity makes the
    negative ray harmless). FORWARD replaces each factor by its `max` with a fixed
    positive witness (no sign sub-cases); REVERSE combines the two x-approximants via
    `max`. Degenerate cuts handled by the banked `pmul_zero`/`zero_pmul`. -/
theorem pmul_distrib_cone {x y z : Cut} (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
    pmul x (y + z) = pmul x y + pmul x z := by
  by_cases hx0 : x = 0
  · rw [hx0, zero_pmul, zero_pmul, zero_pmul, add_zero']
  by_cases hy0 : y = 0
  · rw [hy0, zero_add', pmul_zero, zero_add']
  by_cases hz0 : z = 0
  · rw [hz0, add_zero', pmul_zero, add_zero']
  obtain ⟨yp, hyp0, hyp⟩ := exists_pos_mem hy hy0
  obtain ⟨zp, hzp0, hzp⟩ := exists_pos_mem hz hz0
  apply Cut.ext'; intro q
  rw [pmul_S, add_S]
  constructor
  · rintro (hneg | ⟨a, s, ha, hs, hxa, hsmem, hq⟩)
    · exact ⟨q / 2, q / 2, Or.inl (by linarith), Or.inl (by linarith), by ring⟩
    rcases lt_or_ge q 0 with hqneg | hqpos
    · exact ⟨q / 2, q / 2, Or.inl (by linarith), Or.inl (by linarith), by ring⟩
    · have ha0 : 0 < a := by
        rcases eq_or_lt_of_le ha with h | h
        · exfalso; rw [← h, zero_mul] at hq; linarith
        · exact h
      rw [add_S] at hsmem
      obtain ⟨b, c, hyb, hzc, hsbc⟩ := hsmem
      rw [hsbc] at hq
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
  · rintro ⟨u, v, hu, hv, hquv⟩
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

/-! ## PHASE 3 — THE SIGN EXTENSION: the four branches of the banked `instMul`, then
    the sign-homomorphism laws `neg_mul`/`mul_neg`. -/

theorem mul_pp {x y : Cut} (hx : 0 ≤ x) (hy : 0 ≤ y) : x * y = pmul x y :=
  mul_of_nonneg hx hy

theorem mul_pn {x y : Cut} (hx : 0 ≤ x) (hy : ¬ 0 ≤ y) : x * y = -(pmul x (-y)) := by
  show (if 0 ≤ x then (if 0 ≤ y then pmul x y else -(pmul x (-y)))
    else (if 0 ≤ y then -(pmul (-x) y) else pmul (-x) (-y))) = -(pmul x (-y))
  rw [if_pos hx, if_neg hy]

theorem mul_np {x y : Cut} (hx : ¬ 0 ≤ x) (hy : 0 ≤ y) : x * y = -(pmul (-x) y) := by
  show (if 0 ≤ x then (if 0 ≤ y then pmul x y else -(pmul x (-y)))
    else (if 0 ≤ y then -(pmul (-x) y) else pmul (-x) (-y))) = -(pmul (-x) y)
  rw [if_neg hx, if_pos hy]

theorem mul_nn {x y : Cut} (hx : ¬ 0 ≤ x) (hy : ¬ 0 ≤ y) : x * y = pmul (-x) (-y) := by
  show (if 0 ≤ x then (if 0 ≤ y then pmul x y else -(pmul x (-y)))
    else (if 0 ≤ y then -(pmul (-x) y) else pmul (-x) (-y))) = pmul (-x) (-y)
  rw [if_neg hx, if_neg hy]

/-- `¬ 0 ≤ x → 0 ≤ -x` (the reflection sends the negative half-line to the nonneg one). -/
theorem nonneg_neg_of_not_nonneg {x : Cut} (hx : ¬ 0 ≤ x) : 0 ≤ -x := by
  rw [le_neg, neg_zero]; exact le_of_not_ge hx

theorem mul_zero' (x : Cut) : x * 0 = 0 := by
  by_cases hx : 0 ≤ x
  · rw [mul_pp hx (le_refl 0), pmul_zero]
  · rw [mul_np hx (le_refl 0), pmul_zero, neg_zero]

theorem zero_mul' (x : Cut) : 0 * x = 0 := by
  by_cases hx : 0 ≤ x
  · rw [mul_pp (le_refl 0) hx, zero_pmul]
  · rw [mul_pn (le_refl 0) hx, zero_pmul, neg_zero]

/-- SIGN HOMOMORPHISM (left): `(-x) * y = -(x * y)`. The boundary `x = 0` (where both
    `0≤x` and `0≤-x` hold) is absorbed by `zero_mul'`. -/
theorem neg_mul (x y : Cut) : (-x) * y = -(x * y) := by
  by_cases hx0 : x = 0
  · rw [hx0, neg_zero, zero_mul', neg_zero]
  by_cases hx : 0 ≤ x
  · have hnx : ¬ 0 ≤ -x := by
      rw [not_le, neg_lt, neg_zero]
      rcases lt_or_eq_of_le hx with h | h
      · exact h
      · exact absurd h.symm hx0
    by_cases hy : 0 ≤ y
    · rw [mul_np hnx hy, neg_neg, mul_pp hx hy]
    · rw [mul_nn hnx hy, neg_neg, mul_pn hx hy, neg_neg]
  · have hnx : 0 ≤ -x := nonneg_neg_of_not_nonneg hx
    by_cases hy : 0 ≤ y
    · rw [mul_pp hnx hy, mul_np hx hy, neg_neg]
    · rw [mul_pn hnx hy, mul_nn hx hy]

/-- SIGN HOMOMORPHISM (right): `x * (-y) = -(x * y)`. -/
theorem mul_neg (x y : Cut) : x * (-y) = -(x * y) := by
  by_cases hy0 : y = 0
  · rw [hy0, neg_zero, mul_zero', neg_zero]
  by_cases hy : 0 ≤ y
  · have hny : ¬ 0 ≤ -y := by
      rw [not_le, neg_lt, neg_zero]
      rcases lt_or_eq_of_le hy with h | h
      · exact h
      · exact absurd h.symm hy0
    by_cases hx : 0 ≤ x
    · rw [mul_pn hx hny, neg_neg, mul_pp hx hy]
    · rw [mul_nn hx hny, neg_neg, mul_np hx hy, neg_neg]
  · have hny : 0 ≤ -y := nonneg_neg_of_not_nonneg hy
    by_cases hx : 0 ≤ x
    · rw [mul_pp hx hny, mul_pn hx hy, neg_neg]
    · rw [mul_np hx hny, mul_nn hx hy]

/-! ## PHASE 4 — the ring laws on all of `Cut`, lifted from the cone via the sign
    homomorphism + `subst`-based sign peeling, and the `CommRing Cut` assembly. -/

/-- COMMUTATIVITY: from `pmul_comm` on the cone, lifted by the sign homomorphism. -/
theorem mul_comm' (x y : Cut) : x * y = y * x := by
  by_cases hx : 0 ≤ x
  · by_cases hy : 0 ≤ y
    · rw [mul_pp hx hy, mul_pp hy hx, pmul_comm]
    · rw [mul_pn hx hy, mul_np hy hx, pmul_comm]
  · by_cases hy : 0 ≤ y
    · rw [mul_np hx hy, mul_pn hy hx, pmul_comm]
    · rw [mul_nn hx hy, mul_nn hy hx, pmul_comm]

theorem one_mul' (x : Cut) : 1 * x = x := by
  by_cases hx : 0 ≤ x
  · rw [mul_pp zero_le_one' hx, one_pmul_cone hx]
  · have hnx : 0 ≤ -x := nonneg_neg_of_not_nonneg hx
    have hmul : 1 * (-x) = -x := by rw [mul_pp zero_le_one' hnx, one_pmul_cone hnx]
    have : 1 * x = -(1 * (-x)) := by rw [mul_neg, neg_neg]
    rw [this, hmul, neg_neg]

theorem mul_one' (x : Cut) : x * 1 = x := by rw [mul_comm']; exact one_mul' x

/-- ASSOCIATIVITY on the nonnegative cone, lifted through `mul_pp` + `zero_le_pmul`. -/
theorem mul_assoc_nn {x y z : Cut} (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
    x * y * z = x * (y * z) := by
  rw [mul_pp hx hy, mul_pp (zero_le_pmul x y) hz, mul_pp hy hz,
    mul_pp hx (zero_le_pmul y z), pmul_assoc_cone hx hy hz]

/-- ASSOCIATIVITY on all of `Cut`: peel each factor's sign via `subst` + the sign
    homomorphism, reducing to `mul_assoc_nn`. -/
theorem mul_assoc' (x y z : Cut) : x * y * z = x * (y * z) := by
  rcases le_or_gt 0 x with hx | hx
  · rcases le_or_gt 0 y with hy | hy
    · rcases le_or_gt 0 z with hz | hz
      · exact mul_assoc_nn hx hy hz
      · obtain ⟨w, hw, rfl⟩ : ∃ w, 0 ≤ w ∧ z = -w :=
          ⟨-z, le_of_lt (neg_pos.mpr hz), (neg_neg z).symm⟩
        simp only [mul_neg, neg_mul, mul_assoc_nn hx hy hw]
    · obtain ⟨v, hv, rfl⟩ : ∃ v, 0 ≤ v ∧ y = -v :=
        ⟨-y, le_of_lt (neg_pos.mpr hy), (neg_neg y).symm⟩
      rcases le_or_gt 0 z with hz | hz
      · simp only [mul_neg, neg_mul, mul_assoc_nn hx hv hz]
      · obtain ⟨w, hw, rfl⟩ : ∃ w, 0 ≤ w ∧ z = -w :=
          ⟨-z, le_of_lt (neg_pos.mpr hz), (neg_neg z).symm⟩
        simp only [mul_neg, neg_mul, neg_neg, mul_assoc_nn hx hv hw]
  · obtain ⟨u, hu, rfl⟩ : ∃ u, 0 ≤ u ∧ x = -u :=
      ⟨-x, le_of_lt (neg_pos.mpr hx), (neg_neg x).symm⟩
    rcases le_or_gt 0 y with hy | hy
    · rcases le_or_gt 0 z with hz | hz
      · simp only [mul_neg, neg_mul, mul_assoc_nn hu hy hz]
      · obtain ⟨w, hw, rfl⟩ : ∃ w, 0 ≤ w ∧ z = -w :=
          ⟨-z, le_of_lt (neg_pos.mpr hz), (neg_neg z).symm⟩
        simp only [mul_neg, neg_mul, neg_neg, mul_assoc_nn hu hy hw]
    · obtain ⟨v, hv, rfl⟩ : ∃ v, 0 ≤ v ∧ y = -v :=
        ⟨-y, le_of_lt (neg_pos.mpr hy), (neg_neg y).symm⟩
      rcases le_or_gt 0 z with hz | hz
      · simp only [mul_neg, neg_mul, neg_neg, mul_assoc_nn hu hv hz]
      · obtain ⟨w, hw, rfl⟩ : ∃ w, 0 ≤ w ∧ z = -w :=
          ⟨-z, le_of_lt (neg_pos.mpr hz), (neg_neg z).symm⟩
        simp only [mul_neg, neg_mul, neg_neg, mul_assoc_nn hu hv hw]

/-- DISTRIBUTIVITY on the all-nonnegative cone (the base case). -/
theorem mul_add_nn {x y z : Cut} (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
    x * (y + z) = x * y + x * z := by
  rw [mul_pp hx (add_nonneg hy hz), mul_pp hx hy, mul_pp hx hz, pmul_distrib_cone hx hy hz]

/-- THE SUBTRACTION FORM on the cone: `x * (y - w) = x * y - x * w` for `x,y,w ≥ 0`.
    The bridge that lets mixed-sign distributivity reduce to the cone, via additive
    cancellation in the banked group. -/
theorem mul_sub_cone {x y w : Cut} (hx : 0 ≤ x) (hy : 0 ≤ y) (hw : 0 ≤ w) :
    x * (y - w) = x * y - x * w := by
  rcases le_or_gt w y with hwy | hwy
  · -- 0 ≤ y - w: y = (y - w) + w, all nonneg; apply mul_add_nn then cancel.
    have hsub : 0 ≤ y - w := sub_nonneg.mpr hwy
    have hkey : x * y = x * (y - w) + x * w := by
      conv_lhs => rw [show y = (y - w) + w by abel]
      exact mul_add_nn hx hsub hw
    rw [hkey]; abel
  · -- y < w: y - w = -(w - y), 0 ≤ w - y; reflect.
    have hsub : 0 ≤ w - y := sub_nonneg.mpr (le_of_lt hwy)
    have hkey : x * w = x * (w - y) + x * y := by
      conv_lhs => rw [show w = (w - y) + y by abel]
      exact mul_add_nn hx hsub hy
    have heq : y - w = -(w - y) := by abel
    rw [heq, mul_neg, hkey]; abel

/-- LEFT DISTRIBUTIVITY for `x ≥ 0`, all signs of `y, z`: reduce each mixed-sign case
    to `mul_add_nn` / `mul_sub_cone` via the reflection. -/
theorem mul_add_left_nn {x : Cut} (hx : 0 ≤ x) (y z : Cut) :
    x * (y + z) = x * y + x * z := by
  rcases le_or_gt 0 y with hy | hy
  · rcases le_or_gt 0 z with hz | hz
    · exact mul_add_nn hx hy hz
    · obtain ⟨w, hw, rfl⟩ : ∃ w, 0 ≤ w ∧ z = -w :=
        ⟨-z, le_of_lt (neg_pos.mpr hz), (neg_neg z).symm⟩
      rw [mul_neg, ← sub_eq_add_neg, ← sub_eq_add_neg, mul_sub_cone hx hy hw]
  · obtain ⟨v, hv, rfl⟩ : ∃ v, 0 ≤ v ∧ y = -v :=
      ⟨-y, le_of_lt (neg_pos.mpr hy), (neg_neg y).symm⟩
    rcases le_or_gt 0 z with hz | hz
    · rw [mul_neg, show -v + z = z - v by abel, mul_sub_cone hx hz hv]; abel
    · obtain ⟨w, hw, rfl⟩ : ∃ w, 0 ≤ w ∧ z = -w :=
        ⟨-z, le_of_lt (neg_pos.mpr hz), (neg_neg z).symm⟩
      rw [mul_neg, mul_neg, show -v + -w = -(v + w) by abel, mul_neg,
        mul_add_nn hx hv hw]; abel

/-- LEFT DISTRIBUTIVITY on all of `Cut`: peel `x`'s sign via the reflection. -/
theorem left_distrib' (x y z : Cut) : x * (y + z) = x * y + x * z := by
  rcases le_or_gt 0 x with hx | hx
  · exact mul_add_left_nn hx y z
  · obtain ⟨u, hu, rfl⟩ : ∃ u, 0 ≤ u ∧ x = -u :=
      ⟨-x, le_of_lt (neg_pos.mpr hx), (neg_neg x).symm⟩
    rw [neg_mul, mul_add_left_nn hu y z, neg_mul, neg_mul]; abel

theorem right_distrib' (x y z : Cut) : (x + y) * z = x * z + y * z := by
  rw [mul_comm', left_distrib', mul_comm' z x, mul_comm' z y]

/-! ## THE COMMUTATIVE RING. -/

/-- ★ THE COMPLETION IS A COMMUTATIVE RING under the sign-extended product. Built on the
    banked `addCommGroup` (the additive half) + the cone ring laws lifted through the
    sign homomorphism. The ring laws are GENUINE content: associativity/distributivity on
    the positive cone (Born positivity), carried to the whole line by the fold's
    reflection. NO posited ℝ, NO Mathlib number-system content import. -/
noncomputable instance commRing : CommRing Cut where
  __ := addCommGroup
  mul := (· * ·)
  mul_assoc := mul_assoc'
  one := 1
  one_mul := one_mul'
  mul_one := mul_one'
  left_distrib := left_distrib'
  right_distrib := right_distrib'
  mul_comm := mul_comm'
  zero_mul := zero_mul'
  mul_zero := mul_zero'

/-! ## Non-vacuity (W8): the banked capstone `√2 · √2 = 2` is now a `CommRing` identity
    on a genuinely new element (`sqrt2 ∉ Qcut '' Q`), so the ring is non-degenerate and
    strictly extends the derived ℚ — the multiplication is not the zero/trivial product. -/

/-- The completion ring is NON-TRIVIAL: `0 ≠ 1` (the unit cut strictly contains the zero
    cut). With the banked capstone `sqrt2 * sqrt2 = Qcut 2` this confirms the ring's
    multiplication is genuine (a new element whose square lands on a rational cut). -/
theorem zero_ne_one' : (0 : Cut) ≠ 1 := by
  intro h
  have : (0 : Cut) < 1 := by
    rw [show (1:Cut) = Qcut 1 from rfl, show (0:Cut) = Qcut 0 from rfl]
    exact Qcut_strictMono (by norm_num)
  exact (lt_irrefl _ (h ▸ this))

end ContinuumQ
end Phys.Foundation
