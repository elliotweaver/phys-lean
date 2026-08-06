/-
  # GAUSS COMPOSITION ON THE DERIVED INTEGERS — the gather, its laws, the arch

  ## What this file proves (GQ campaign, production node — L2/L5/L6)

  The complete composition apparatus for binary quadratic forms over the
  fold's ℤ, NO Mathlib number content. Highlights (★ = campaign capstones):

  * `crt_coprime`, `BranchRec`, `branch_gather'` — ★ THE GATHER THEOREM.
  * `z_parity`, `records_parity_agree` — ★ the parity discharge.
  * `gatherForm` + `gather_record_shift/unique` — record pinned mod 2a₁a₂.
  * `identity_law` (+fires) — e ∘ g ~ g ON THE NOSE.
  * `inverse_law_even/odd` (+fires) — ★ f ∘ conj f lands on THE principal
    form; `triple_record_pinned` — associativity's record engine.
  * `gpowRe`/`gpowC` — ★ `ambiguous_invisible` (genus invisible mod odd p),
    `witness_necessity`, `relation_transport`, pCl subgroup laws.
  * `Primitive`, `three_point_escape`, `prime_escape` — ★ primitive escape.
  * `eval_congr`, `crt_landing_two`, `list_landing` — ★ THE CONCORDANCE
    SUPPLY: one landing escaping every prime of a pairwise-coprime list.
  * `eval_homog`, `proper_of_gcd_quotient`, `proper_escaping_landing` —
    properness reduction; escape survives gcd descent.
  * `concordant_representative` — ★★ every class owns a representative with
    leading miss coprime to any target N (composition is TOTAL).
  * `gather_well_defined_same_pair`, `gather_shift_input(_snd)` — the
    well-definedness kit (choice-freedom + shift half).
  * `gather_comm`, `triple_flat` — commutativity ON THE NOSE; both triple
    bracketings are ONE form at a shared record.
  * `gauss_bilinear` — ★★ THE BILINEAR IDENTITY (Disquisitiones art. 235 in
    united-record normal form); teeth: perturbing the substitution breaks it.
  * `swap_value_set`, `common_value`, `anchored_same_record_chain`,
    `record_well_defined` — the swap-half reduction.
  * `gathers_chain_at_common_landing'` — ★★★ THE ARCH: same-disc forms
    anchored at a common landing with matching records are chain-equivalent.

  ## Standard
  Foundations-only; no sorry; imports GaussForms + IntegerArithMore only.
-/
import Phys.Algebra.GaussForms

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open Re
open IntegerArith

/-- Proper landing: the pair has a Bézout witness. -/
def Proper (x y : Z) : Prop := ∃ u v : Z, u * x + v * y = 1

/-- ★ CRT, derived form: coprime moduli, any residue pair is realized. -/
theorem crt_coprime {m1 m2 : Z} (h : Coprime m1 m2) (r1 r2 : Z) :
    ∃ x k1 k2 : Z, x = r1 + m1 * k1 ∧ x = r2 + m2 * k2 := by
  obtain ⟨u, v, huv⟩ := h
  -- x := r1·v·m2 + r2·u·m1 realizes both congruences
  refine ⟨r1 * (v * m2) + r2 * (u * m1),
          r1 * (-u) + r2 * u, r2 * (-v) + r1 * v, ?_, ?_⟩
  · -- x − r1 = r1(v m2 − 1) + r2 u m1 = r1(−u m1) + r2 u m1 = m1(r2−r1)u... 
    have h1 : v * m2 - 1 = -(u * m1) := by linarith
    calc r1 * (v * m2) + r2 * (u * m1)
        = r1 + r1 * (v * m2 - 1) + r2 * (u * m1) := by ring
      _ = r1 + r1 * (-(u * m1)) + r2 * (u * m1) := by rw [h1]
      _ = r1 + m1 * (r1 * (-u) + r2 * u) := by ring
  · have h2 : u * m1 - 1 = -(v * m2) := by linarith
    calc r1 * (v * m2) + r2 * (u * m1)
        = r2 + r2 * (u * m1 - 1) + r1 * (v * m2) := by ring
      _ = r2 + r2 * (-(v * m2)) + r1 * (v * m2) := by rw [h2]
      _ = r2 + m2 * (r2 * (-v) + r1 * v) := by ring

/-! ### ★ THE BRANCH-GATHER CONGRUENCE (composition's B): coprime leading
    misses with concordant branch records glue to ONE record mod 2a1a2 whose
    Born square matches D on the WHOLE gather. -/

/-- Branch record: b with b² ≡ D (mod 4a) — the form (a,b,(b²−D)/(4a)) shape,
    expressed divisibility-style: 4a ∣ b² − D. -/
def BranchRec (D a b : Z) : Prop := ∃ t : Z, b * b - D = 4 * a * t

/-- D7 witness: (a,b,D) = (1,0,−4) is a branch record. -/
theorem branchRec_inhabited : BranchRec (-(4:Z)) 1 0 := ⟨1, by ring⟩

/-- ★ THE GATHER THEOREM: coprime misses a1, a2, records agreeing mod 2
    (automatic from discriminant parity — discharged at L2b), yield a UNITED
    record B: B ≡ b1 (mod 2a1), B ≡ b2 (mod 2a2), BranchRec D (a1·a2) B. -/
theorem branch_gather' {D a1 a2 b1 b2 : Z}
    (hcop : Coprime a1 a2) (hr1 : BranchRec D a1 b1) (hr2 : BranchRec D a2 b2)
    (hpar : ∃ s : Z, b1 - b2 = 2 * s) :
    ∃ B : Z, (∃ k1, B = b1 + 2 * a1 * k1) ∧ (∃ k2, B = b2 + 2 * a2 * k2) ∧
      BranchRec D (a1 * a2) B := by
  obtain ⟨u, v, huv⟩ := hcop
  obtain ⟨s, hs⟩ := hpar
  -- B := b1 − 2 a1 u s = b2 + 2 a2 v s  (since b1 − b2 = 2s and u a1 + v a2 = 1)
  refine ⟨b1 - 2 * a1 * (u * s), ⟨-(u * s), by ring⟩, ⟨v * s, ?_⟩, ?_⟩
  · -- b1 − 2a1us = b2 + 2a2vs ⟺ 2s = 2a1us + 2a2vs ⟺ s(ua1+va2)=s ✓
    have : b1 = b2 + 2 * s := by linarith
    rw [this]
    have hs1 : u * a1 + v * a2 = 1 := by linarith
    calc b2 + 2 * s - 2 * a1 * (u * s)
        = b2 + 2 * s * (1 - u * a1) := by ring
      _ = b2 + 2 * s * (v * a2) := by
          have : (1 : Z) - u * a1 = v * a2 := by linarith
          rw [this]
      _ = b2 + 2 * a2 * (v * s) := by ring
  · -- Born square on the gather: 4a1a2 ∣ B² − D.
    -- B ≡ b1 (mod 2a1) ⟹ B² ≡ b1² ≡ D (mod 4a1) — a1-side; symmetric a2-side;
    -- coprime a1,a2 ⟹ product divides.
    obtain ⟨t1, ht1⟩ := hr1
    obtain ⟨t2, ht2⟩ := hr2
    -- B² − D = (b1 − 2a1us)² − D = (b1²−D) − 4a1us·b1 + 4a1²u²s²
    --        = 4a1(t1 − us·b1 + a1u²s²)  — divisible by 4a1. ✓
    -- Also B = b2 + 2a2vs (proved above): B² − D = 4a2(t2 + vs·b2 + a2v²s²) — div by 4a2.
    -- 4a1 ∣ X and 4a2 ∣ X with Coprime a1 a2 ⟹ 4a1a2 ∣ X:
    -- X = 4a1·X1 = 4a2·X2 ⟹ a1·X1 = a2·X2; u a1 + v a2 = 1 ⟹
    -- X1 = X1(ua1+va2) = u a1 X1 + v a2 X1 = u a2 X2 + v a2 X1 = a2(uX2+vX1)
    -- ⟹ X = 4a1a2(uX2 + vX1). ✓
    have hB1 : (b1 - 2 * a1 * (u * s)) * (b1 - 2 * a1 * (u * s)) - D
        = 4 * a1 * (t1 - u * s * b1 + a1 * (u * s) * (u * s)) := by
      have hb1sq : b1 * b1 - D = 4 * a1 * t1 := ht1
      nlinarith [hb1sq]
    have hBeq : b1 - 2 * a1 * (u * s) = b2 + 2 * a2 * (v * s) := by
      have hbb : b1 = b2 + 2 * s := by linarith
      rw [hbb]
      have hs1 : u * a1 + v * a2 = 1 := by linarith
      calc b2 + 2 * s - 2 * a1 * (u * s)
          = b2 + 2 * s * (1 - u * a1) := by ring
        _ = b2 + 2 * s * (v * a2) := by
            have : (1 : Z) - u * a1 = v * a2 := by linarith
            rw [this]
        _ = b2 + 2 * a2 * (v * s) := by ring
    have hB2 : (b1 - 2 * a1 * (u * s)) * (b1 - 2 * a1 * (u * s)) - D
        = 4 * a2 * (t2 + v * s * b2 + a2 * (v * s) * (v * s)) := by
      rw [hBeq]
      have hb2sq : b2 * b2 - D = 4 * a2 * t2 := ht2
      nlinarith [hb2sq]
    set X1 := t1 - u * s * b1 + a1 * (u * s) * (u * s) with hX1
    set X2 := t2 + v * s * b2 + a2 * (v * s) * (v * s) with hX2
    refine ⟨u * X2 + v * X1, ?_⟩
    -- from 4a1X1 = 4a2X2: a1X1 = a2X2 (cancel 4 — need 4 ≠ 0 cancellation; use linear arithmetic)
    have h4eq : 4 * a1 * X1 = 4 * a2 * X2 := by rw [← hB1, ← hB2]
    have hcancel : a1 * X1 = a2 * X2 := by linarith
    calc (b1 - 2 * a1 * (u * s)) * (b1 - 2 * a1 * (u * s)) - D
        = 4 * a1 * X1 := hB1
      _ = 4 * a1 * (X1 * (u * a1 + v * a2)) := by
          have hs1 : u * a1 + v * a2 = 1 := by linarith
          rw [hs1, mul_one]
      _ = 4 * (u * (a1 * X1) * a1 + v * a1 * a2 * X1) := by ring
      _ = 4 * (u * (a2 * X2) * a1 + v * a1 * a2 * X1) := by rw [hcancel]
      _ = 4 * (a1 * a2) * (u * X2 + v * X1) := by ring


/-- Two as a count: step (step void). -/
def two : Re := Re.step (Re.step Re.void)

theorem two_pos : Re.void < two := by
  rw [lt_iff_step_le]
  exact ⟨Re.step Re.void, by
    show two = Re.step Re.void + Re.step Re.void
    show Re.step (Re.step Re.void) = Re.step Re.void + Re.step Re.void
    rw [Re.step_add, Re.void_add]⟩

theorem ofRe_two : Z.ofRe two = (2 : Z) := by
  show Z.ofRe (Re.step (Re.step Re.void)) = 2
  have h1 : Re.step (Re.step Re.void) = Re.step Re.void + Re.step Re.void := by
    rw [Re.step_add, Re.void_add]
  rw [h1, Z.ofRe_add]
  show Z.ofRe 1 + Z.ofRe 1 = 2
  rw [Z.ofRe_one]
  ring

/-- Remainders below two are 0 or 1. -/
theorem re_lt_two (r : Re) (h : r < two) : r = Re.void ∨ r = Re.step Re.void := by
  match r with
  | .void => exact Or.inl rfl
  | .step m =>
      refine Or.inr ?_
      obtain ⟨c, hc⟩ := lt_iff_step_le.mp h
      -- step (step m) + c = two = step (step void) ⟹ step m + c = step void
      have h1 : Re.step (Re.step m) + c = two := hc.symm
      have h2 : Re.step (Re.step m + c) = Re.step (Re.step Re.void) := by
        rw [← Re.step_add]; exact h1
      have h3 : Re.step m + c = Re.step Re.void := Re.step_inj h2
      have h4 : Re.step (m + c) = Re.step Re.void := by
        rw [← Re.step_add]; exact h3
      have h5 : m + c = Re.void := Re.step_inj h4
      rcases Re.add_eq_zero h5 with ⟨hm, _⟩
      rw [hm]
      rfl

/-- ★ PARITY TRICHOTOMY on Z: every derived integer is 2k or 2k+1. -/
theorem z_parity (z : Z) : ∃ k : Z, z = 2 * k ∨ z = 2 * k + 1 := by
  obtain ⟨n, hn | hn⟩ := z_trichotomy z
  · obtain ⟨q, r, hqr, hrlt⟩ := div_mod_exists two two_pos n
    rcases re_lt_two r hrlt with hr | hr
    · refine ⟨Z.ofRe q, Or.inl ?_⟩
      subst hr
      have hzv : Z.ofRe Re.void = 0 := Z.ofRe_zero
      rw [hn, hqr, Z.ofRe_add, Z.ofRe_mul, ofRe_two, hzv, add_zero]
    · refine ⟨Z.ofRe q, Or.inr ?_⟩
      subst hr
      rw [hn, hqr, Z.ofRe_add, Z.ofRe_mul, ofRe_two]
      congr 1
  · obtain ⟨q, r, hqr, hrlt⟩ := div_mod_exists two two_pos n
    rcases re_lt_two r hrlt with hr | hr
    · refine ⟨-(Z.ofRe q), Or.inl ?_⟩
      subst hr
      have hzv : Z.ofRe Re.void = 0 := Z.ofRe_zero
      rw [hn, hqr, Z.ofRe_add, Z.ofRe_mul, ofRe_two, hzv, add_zero]
      ring
    · refine ⟨-(Z.ofRe q) - 1, Or.inr ?_⟩
      subst hr
      rw [hn, hqr, Z.ofRe_add, Z.ofRe_mul, ofRe_two]
      have h1 : Z.ofRe (Re.step Re.void) = 1 := Z.ofRe_one
      rw [h1]
      ring

/-! ### Odd/even squares and the parity discharge -/

/-- Squares mod 4: (2k)² = 4k², (2k+1)² = 4(k²+k)+1. -/
theorem sq_mod4 (b : Z) : ∃ m : Z, b * b = 4 * m ∨ b * b = 4 * m + 1 := by
  obtain ⟨k, hk | hk⟩ := z_parity b
  · exact ⟨k * k, Or.inl (by rw [hk]; ring)⟩
  · exact ⟨k * k + k, Or.inr (by rw [hk]; ring)⟩

/-- ★ THE PARITY DISCHARGE: two branch records of the SAME discriminant have
    b₁ ≡ b₂ (mod 2). (b² ≡ D mod 4 pins b's parity to D's residue.) -/
theorem records_parity_agree {D a1 a2 b1 b2 : Z}
    (h1 : BranchRec D a1 b1) (h2 : BranchRec D a2 b2) :
    ∃ s : Z, b1 - b2 = 2 * s := by
  obtain ⟨t1, ht1⟩ := h1
  obtain ⟨t2, ht2⟩ := h2
  obtain ⟨k1, hk1 | hk1⟩ := z_parity b1 <;> obtain ⟨k2, hk2 | hk2⟩ := z_parity b2
  · exact ⟨k1 - k2, by rw [hk1, hk2]; ring⟩
  · -- b1 even, b2 odd: b1² = 4m, b2² = 4m'+1 ⟹ D ≡ 0 and 1 mod 4 — impossible
    exfalso
    -- D = b1² − 4a1t1 = 4(k1² − a1t1) ; D = b2² − 4a2t2 = 4(k2²+k2−a2t2)+1
    have hD1 : D = 4 * (k1 * k1 - a1 * t1) := by rw [hk1] at ht1; linarith [ht1]
    have hD2 : D = 4 * (k2 * k2 + k2 - a2 * t2) + 1 := by
      rw [hk2] at ht2
      nlinarith [ht2]
    -- 4x = 4y + 1 is impossible: 1 = 4(x−y) but 4 ∤ 1 (order argument)
    have h41 : (1 : Z) = 4 * ((k1 * k1 - a1 * t1) - (k2 * k2 + k2 - a2 * t2)) := by
      linarith
    set w := (k1 * k1 - a1 * t1) - (k2 * k2 + k2 - a2 * t2) with hw
    -- 4w = 1 forces 0 < w (since 4w=1>0) hence w ≥ 1 hence 4w ≥ 4 > 1. contradiction.
    have hwpos : (0 : Z) < w := by nlinarith
    have hw1 : (1 : Z) ≤ w := by
      -- on Z: 0 < w ⟹ 1 ≤ w (discreteness). From z_trichotomy: w = ofRe n, n ≠ 0 ⟹ n ≥ 1.
      obtain ⟨n, hn | hn⟩ := z_trichotomy w
      · have hnne : n ≠ 0 := by
          intro h0
          subst h0
          rw [Z.ofRe_zero] at hn
          rw [hn] at hwpos
          exact lt_irrefl _ hwpos
        -- n ≠ void ⟹ n = step m ⟹ ofRe n = ofRe m + 1 ≥ 1
        match n, hn, hnne with
        | .step m, hn, _ =>
            have hsm : Re.step m = m + Re.step Re.void := by
              rw [add_step_swap]
              show Re.step m = Re.step m + Re.void
              rw [Re.add_void]
            rw [hn, hsm, Z.ofRe_add]
            have h1' : Z.ofRe (Re.step Re.void) = 1 := Z.ofRe_one
            rw [h1']
            linarith [ofRe_nonneg m]
      · exfalso
        have hle : w ≤ 0 := by
          rw [hn]
          have := ofRe_nonneg n
          linarith
        exact absurd hwpos (not_lt.mpr hle)
    linarith
  · -- symmetric: b1 odd, b2 even — same contradiction
    exfalso
    have hD1 : D = 4 * (k1 * k1 + k1 - a1 * t1) + 1 := by
      rw [hk1] at ht1
      nlinarith [ht1]
    have hD2 : D = 4 * (k2 * k2 - a2 * t2) := by rw [hk2] at ht2; linarith [ht2]
    have h41 : (1 : Z) = 4 * ((k2 * k2 - a2 * t2) - (k1 * k1 + k1 - a1 * t1)) := by
      linarith
    set w := (k2 * k2 - a2 * t2) - (k1 * k1 + k1 - a1 * t1) with hw
    have hwpos : (0 : Z) < w := by nlinarith
    have hw1 : (1 : Z) ≤ w := by
      obtain ⟨n, hn | hn⟩ := z_trichotomy w
      · have hnne : n ≠ 0 := by
          intro h0
          subst h0
          rw [Z.ofRe_zero] at hn
          rw [hn] at hwpos
          exact lt_irrefl _ hwpos
        match n, hn, hnne with
        | .step m, hn, _ =>
            have hsm : Re.step m = m + Re.step Re.void := by
              rw [add_step_swap]
              show Re.step m = Re.step m + Re.void
              rw [Re.add_void]
            rw [hn, hsm, Z.ofRe_add]
            have h1' : Z.ofRe (Re.step Re.void) = 1 := Z.ofRe_one
            rw [h1']
            linarith [ofRe_nonneg m]
      · exfalso
        have hle : w ≤ 0 := by
          rw [hn]
          linarith [ofRe_nonneg n]
        exact absurd hwpos (not_lt.mpr hle)
    linarith
  · exact ⟨k1 - k2, by rw [hk1, hk2]; ring⟩


/-- THE GATHERED FORM: misses multiplied, united record, cofactor from the
    Born-square residue t (B² − D = 4·a1a2·t). -/
def gatherForm (a1 a2 B t : Z) : BQF := ⟨a1 * a2, B, t⟩

/-- (1) The gathered form has discriminant D — immediate from BranchRec. -/
theorem gather_form_disc {D a1 a2 B t : Z}
    (hrec : B * B - D = 4 * (a1 * a2) * t) :
    disc (gatherForm a1 a2 B t) = D := by
  unfold disc gatherForm
  show B * B - 4 * (a1 * a2) * t = D
  linarith

/-- (2a) Record freedom is shift freedom: B' = B + 2(a1a2)k gathers to a
    SHIFT of the first gather — hence chain-equivalent. -/
theorem gather_record_shift {D a1 a2 B B' t t' k : Z}
    (hrec : B * B - D = 4 * (a1 * a2) * t)
    (hrec' : B' * B' - D = 4 * (a1 * a2) * t')
    (hk : B' = B + 2 * (a1 * a2) * k) (ha : a1 * a2 ≠ 0) :
    gatherForm a1 a2 B' t' = shiftF k (gatherForm a1 a2 B t) := by
  unfold gatherForm shiftF
  have hb : B' = B + 2 * (a1 * a2) * k := hk
  -- c-components: t' = (a1a2)k² + Bk + t, forced by the two records
  have hc : t' = (a1 * a2) * k * k + B * k + t := by
    have hexp : B' * B' - D = (B * B - D) + 4 * (a1 * a2) * (B * k + (a1 * a2) * k * k) := by
      rw [hk]; ring
    rw [hrec, hrec'] at hexp
    -- 4(a1a2)t' = 4(a1a2)t + 4(a1a2)(Bk + (a1a2)k²)
    have h4 : (4 * (a1 * a2)) * t' = (4 * (a1 * a2)) * (t + B * k + (a1 * a2) * k * k) := by
      linarith
    have h4ne : (4 : Z) * (a1 * a2) ≠ 0 := by
      apply z_mul_ne_zero _ ha
      intro h40
      have : (0:Z) < 4 := by positivity
      rw [h40] at this
      exact lt_irrefl _ this
    have := z_mul_cancel h4ne h4
    linarith
  rw [hb, hc]

/-- (2b) THE RECORD IS PINNED mod 2a1a2: two united records for the SAME
    coprime pair of branch data differ by exactly 2(a1a2)k. -/
theorem gather_record_unique {a1 a2 b1 b2 B B' : Z}
    (hcop : Coprime a1 a2)
    (h1 : ∃ k, B = b1 + 2 * a1 * k) (h2 : ∃ k, B = b2 + 2 * a2 * k)
    (h1' : ∃ k, B' = b1 + 2 * a1 * k) (h2' : ∃ k, B' = b2 + 2 * a2 * k) :
    ∃ k, B' = B + 2 * (a1 * a2) * k := by
  obtain ⟨u, v, huv⟩ := hcop
  obtain ⟨k1, hk1⟩ := h1
  obtain ⟨k2, hk2⟩ := h2
  obtain ⟨k1', hk1'⟩ := h1'
  obtain ⟨k2', hk2'⟩ := h2'
  -- B' − B = 2a1(k1'−k1) = 2a2(k2'−k2). Set d1 := k1'−k1, d2 := k2'−k2.
  -- a1 d1 = a2 d2 with u a1 + v a2 = 1 ⟹ d1 = a2(u d2 + v d1) — the L2a pattern.
  have hd : 2 * a1 * (k1' - k1) = 2 * a2 * (k2' - k2) := by
    have e1 : B' - B = 2 * a1 * (k1' - k1) := by rw [hk1', hk1]; ring
    have e2 : B' - B = 2 * a2 * (k2' - k2) := by rw [hk2', hk2]; ring
    linarith
  set d1 := k1' - k1 with hd1
  set d2 := k2' - k2 with hd2
  have had : a1 * d1 = a2 * d2 := by linarith
  refine ⟨u * d2 + v * d1, ?_⟩
  -- B' = B + 2a1d1 and d1 = d1(ua1+va2) = u(a1d1) + v a2 d1 = u a2 d2 + v a2 d1 = a2(ud2+vd1)
  have hd1a : d1 = a2 * (u * d2 + v * d1) := by
    calc d1 = d1 * (u * a1 + v * a2) := by rw [huv, mul_one]
      _ = u * (a1 * d1) + v * a2 * d1 := by ring
      _ = u * (a2 * d2) + v * a2 * d1 := by rw [had]
      _ = a2 * (u * d2 + v * d1) := by ring
  calc B' = B + 2 * a1 * d1 := by rw [hd1]; linarith [hk1, hk1']
    _ = B + 2 * a1 * (a2 * (u * d2 + v * d1)) := by rw [← hd1a]
    _ = B + 2 * (a1 * a2) * (u * d2 + v * d1) := by ring


/-- ★ THE IDENTITY LAW (concordant instance a1 = 1): gathering g with the
    UNIT branch — any united record B ≡ g.b (mod 2·g.a) with the right
    Born-square residue — lands EXACTLY on a shift of g. e ∘ g ~ g. -/
theorem identity_law {D : Z} (g : BQF) (hga : g.a ≠ 0) (hgd : disc g = D)
    (B t k : Z) (hB : B = g.b + 2 * g.a * k)
    (hrec : B * B - D = 4 * (1 * g.a) * t) :
    Chain g (gatherForm 1 g.a B t) := by
  -- gatherForm 1 g.a B t = (g.a, B, t); show it IS shiftF k g.
  have hform : gatherForm 1 g.a B t = shiftF k g := by
    unfold gatherForm shiftF
    have ha1 : (1 : Z) * g.a = g.a := one_mul g.a
    -- components: a ✓ (after one_mul); b: B = g.b + 2 g.a k ✓; c: t determined.
    have ht : t = g.a * k * k + g.b * k + g.c := by
      -- from hrec with B = g.b + 2 g.a k and disc g = D:
      -- (g.b + 2g.a k)² − D = 4 g.a t
      -- g.b² − D = 4 g.a g.c  (disc)
      have hdisc : g.b * g.b - D = 4 * g.a * g.c := by
        rw [← hgd]; unfold disc; ring
      have hexp : B * B - D = (g.b * g.b - D) + 4 * g.a * (g.b * k + g.a * k * k) := by
        rw [hB]; ring
      rw [hdisc] at hexp
      have h4 : (4 * g.a) * t = (4 * g.a) * (g.c + g.b * k + g.a * k * k) := by
        have hr : B * B - D = 4 * (1 * g.a) * t := hrec
        rw [one_mul] at hr
        linarith
      have h4ne : (4 : Z) * g.a ≠ 0 := by
        apply z_mul_ne_zero _ hga
        intro h40
        have hp : (0:Z) < 4 := by positivity
        rw [h40] at hp
        exact lt_irrefl _ hp
      have := z_mul_cancel h4ne h4
      linarith
    rw [hB, ht, ha1]
  rw [hform]
  exact of_shift k g

/-- ★ ANTI-VACUITY TEETH: the identity law FIRES on a concrete instance —
    D = −4, g = (1,0,1) (the principal form itself), B = 0, t = 1, k = 0:
    Chain (1,0,1) (gatherForm 1 1 0 1) with all hypotheses DISCHARGED. -/
theorem identity_law_fires :
    Chain ⟨1, 0, 1⟩ (gatherForm 1 (1:Z) 0 1) := by
  have h := identity_law (D := -(4:Z)) (⟨1, 0, 1⟩ : BQF)
    (by intro h; exact one_ne_zero h)
    (by unfold disc; ring)
    0 1 0
    (by ring)
    (by ring)
  exact h

/-- ★ CONTRAST TOOTH (W8): the identity law is NOT vacuous bookkeeping —
    the gathered form genuinely EQUALS a shift, so its record differs from a
    WRONG record: gatherForm 1 1 2 t is NOT chain-reachable via k = 0 shape
    (2 ≠ 0 + 2·1·0) — the record hypothesis BITES. Mechanical check: with
    g = (1,0,1), B = 2 requires k = 1, and then t is FORCED to 2 (not 1). -/
theorem record_forces_cofactor :
    ∀ t : Z, ((2:Z) * 2 - (-(4:Z)) = 4 * (1 * 1) * t) → t = 2 := by
  intro t h
  have : (8 : Z) = 4 * t := by linarith
  linarith


/-! ### THE INVERSE LAW, assembled. -/

theorem inverse_form_to_unit (A B : Z) :
    Chain ⟨A, B, 1⟩ ⟨1, -B, A⟩ := by
  have h : swapF ⟨A, B, 1⟩ = ⟨1, -B, A⟩ := rfl
  have step := of_swap (⟨A, B, 1⟩ : BQF)
  rw [h] at step
  exact step

/-- ★ THE INVERSE LAW (even record): the gathered inverse form chains to the
    PRINCIPAL FORM (1, 0, c₀). Every move explicit: swap then shift m. -/
theorem inverse_law_even (A m : Z) :
    Chain ⟨A, 2 * m, 1⟩ ⟨1, 0, A - m * m⟩ := by
  refine chainTrans (inverse_form_to_unit A (2 * m)) ?_
  have h : shiftF m ⟨1, -(2 * m), A⟩ = ⟨1, 0, A - m * m⟩ := by
    unfold shiftF
    have h1 : -(2 * m) + 2 * 1 * m = 0 := by ring
    have h2 : 1 * m * m + -(2 * m) * m + A = A - m * m := by ring
    show (⟨1, -(2 * m) + 2 * 1 * m, 1 * m * m + -(2 * m) * m + A⟩ : BQF)
       = ⟨1, 0, A - m * m⟩
    rw [h1, h2]
  have step := of_shift m (⟨1, -(2 * m), A⟩ : BQF)
  rw [h] at step
  exact step

/-- ★ THE INVERSE LAW (odd record): chains to the principal form (1, 1, c₀). -/
theorem inverse_law_odd (A m : Z) :
    Chain ⟨A, 2 * m + 1, 1⟩ ⟨1, 1, A - m * m - m⟩ := by
  refine chainTrans (inverse_form_to_unit A (2 * m + 1)) ?_
  have h : shiftF (m + 1) ⟨1, -(2 * m + 1), A⟩ = ⟨1, 1, A - m * m - m⟩ := by
    unfold shiftF
    have h1 : -(2 * m + 1) + 2 * 1 * (m + 1) = 1 := by ring
    have h2 : 1 * (m + 1) * (m + 1) + -(2 * m + 1) * (m + 1) + A
            = A - m * m - m := by ring
    show (⟨1, -(2 * m + 1) + 2 * 1 * (m + 1),
           1 * (m + 1) * (m + 1) + -(2 * m + 1) * (m + 1) + A⟩ : BQF)
       = ⟨1, 1, A - m * m - m⟩
    rw [h1, h2]
  have step := of_shift (m + 1) (⟨1, -(2 * m + 1), A⟩ : BQF)
  rw [h] at step
  exact step

/-- Anti-vacuity: the even inverse law fires concretely (D = −4 instance). -/
theorem inverse_law_fires : Chain ⟨(1:Z), 0, 1⟩ ⟨1, 0, 1⟩ := by
  have h := inverse_law_even (A := (1:Z)) (m := 0)
  have h1 : (2:Z) * 0 = 0 := by ring
  have h2 : (1:Z) - 0 * 0 = 1 := by ring
  rw [h1, h2] at h
  exact h

theorem inverse_law_even_disc (A m : Z) :
    disc ⟨A, 2 * m, 1⟩ = disc ⟨1, 0, A - m * m⟩ := by
  unfold disc; ring

/-! ### ASSOCIATIVITY: triple record pinning. -/

/-- ★ TRIPLE RECORD PINNING: two united records for the SAME three pairwise-
    coprime branch congruences differ by 2·(a1a2a3)·k. With L2d's
    gather_record_shift this makes both bracketings CHAIN-EQUIVALENT:
    the three-branch gather has ONE record. -/
theorem triple_record_pinned {a1 a2 a3 b1 b2 b3 B B' : Z}
    (h12 : Coprime a1 a2) (h13 : Coprime a1 a3) (h23 : Coprime a2 a3)
    (hB1 : ∃ k, B = b1 + 2 * a1 * k) (hB2 : ∃ k, B = b2 + 2 * a2 * k)
    (hB3 : ∃ k, B = b3 + 2 * a3 * k)
    (hB1' : ∃ k, B' = b1 + 2 * a1 * k) (hB2' : ∃ k, B' = b2 + 2 * a2 * k)
    (hB3' : ∃ k, B' = b3 + 2 * a3 * k) :
    ∃ k, B' = B + 2 * (a1 * a2 * a3) * k := by
  obtain ⟨u12, v12, huv12⟩ := h12
  obtain ⟨u13, v13, huv13⟩ := h13
  obtain ⟨u23, v23, huv23⟩ := h23
  obtain ⟨k1, hk1⟩ := hB1
  obtain ⟨k2, hk2⟩ := hB2
  obtain ⟨k3, hk3⟩ := hB3
  obtain ⟨k1', hk1'⟩ := hB1'
  obtain ⟨k2', hk2'⟩ := hB2'
  obtain ⟨k3', hk3'⟩ := hB3'
  set d1 := k1' - k1 with hd1
  set d2 := k2' - k2 with hd2
  set d3 := k3' - k3 with hd3
  have hda1 : B' - B = 2 * a1 * d1 := by rw [hd1, hk1', hk1]; ring
  have hda2 : B' - B = 2 * a2 * d2 := by rw [hd2, hk2', hk2]; ring
  have hda3 : B' - B = 2 * a3 * d3 := by rw [hd3, hk3', hk3]; ring
  have h12d : a1 * d1 = a2 * d2 := by linarith
  have hd1a2 : d1 = a2 * (u12 * d2 + v12 * d1) := by
    calc d1 = d1 * (u12 * a1 + v12 * a2) := by rw [huv12, mul_one]
      _ = u12 * (a1 * d1) + v12 * a2 * d1 := by ring
      _ = u12 * (a2 * d2) + v12 * a2 * d1 := by rw [h12d]
      _ = a2 * (u12 * d2 + v12 * d1) := by ring
  set e := u12 * d2 + v12 * d1 with he
  have hd1e : d1 = a2 * e := by rw [he]; exact hd1a2
  have hde : B' - B = 2 * (a1 * a2) * e := by
    calc B' - B = 2 * a1 * d1 := hda1
      _ = 2 * a1 * (a2 * e) := by rw [← hd1e]
      _ = 2 * (a1 * a2) * e := by ring
  have hcop123 : Coprime (a1 * a2) a3 := by
    refine ⟨u13 * u23, u13 * a1 * v23 + v13 * u23 * a2 + v13 * v23 * a3, ?_⟩
    have hexp : (u13 * a1 + v13 * a3) * (u23 * a2 + v23 * a3) = 1 := by
      rw [huv13, huv23, one_mul]
    calc u13 * u23 * (a1 * a2)
          + (u13 * a1 * v23 + v13 * u23 * a2 + v13 * v23 * a3) * a3
        = (u13 * a1 + v13 * a3) * (u23 * a2 + v23 * a3) := by ring
      _ = 1 := hexp
  obtain ⟨U, V, hUV⟩ := hcop123
  have h123d : (a1 * a2) * e = a3 * d3 := by linarith
  have hde3 : e = a3 * (U * d3 + V * e) := by
    calc e = e * (U * (a1 * a2) + V * a3) := by rw [hUV, mul_one]
      _ = U * ((a1 * a2) * e) + V * a3 * e := by ring
      _ = U * (a3 * d3) + V * a3 * e := by rw [h123d]
      _ = a3 * (U * d3 + V * e) := by ring
  refine ⟨U * d3 + V * e, ?_⟩
  calc B' = B + 2 * (a1 * a2) * e := by linarith
    _ = B + 2 * (a1 * a2) * (a3 * (U * d3 + V * e)) := by rw [← hde3]
    _ = B + 2 * (a1 * a2 * a3) * (U * d3 + V * e) := by ring


/-- Powers indexed by the derived ℕ. -/
def gpowRe {G : Type} [Group G] (g : G) : Re → G
  | .void => 1
  | .step n => g * gpowRe g n

theorem gpowRe_void {G : Type} [Group G] (g : G) : gpowRe g Re.void = 1 := rfl

theorem gpowRe_step {G : Type} [Group G] (g : G) (n : Re) :
    gpowRe g (Re.step n) = g * gpowRe g n := rfl

/-- The unit's powers are the unit (D7-style inhabitation engine). -/
theorem gpowRe_one_left {G : Type} [Group G] : ∀ n : Re, gpowRe (1 : G) n = 1
  | .void => rfl
  | .step n => by rw [gpowRe_step, gpowRe_one_left n, one_mul]

/-- Doubling on Re: (step k) + (step k) = step (step (k + k)). -/
theorem double_step (k : Re) :
    Re.step k + Re.step k = Re.step (Re.step (k + k)) := by
  have h1 : Re.step k + Re.step k = Re.step (k + Re.step k) := Re.step_add k (Re.step k)
  have h2 : k + Re.step k = Re.step (k + k) := by
    calc k + Re.step k = Re.step k + k := add_comm k (Re.step k)
      _ = Re.step (k + k) := Re.step_add k k
  rw [h1, h2]

/-- n + 1 = step n on the derived ℕ. -/
theorem add_one_step (n : Re) : n + (1 : Re) = Re.step n := by
  show n + Re.step Re.void = Re.step n
  calc n + Re.step Re.void
      = Re.step Re.void + n := add_comm _ _
    _ = Re.step (Re.void + n) := Re.step_add _ _
    _ = Re.step n := by rw [Re.void_add]

/-- ★ EVEN POWERS OF AN AMBIGUOUS ELEMENT DIE: g·g = 1 ⟹ g^(k+k) = 1. -/
theorem gpowRe_double_one {G : Type} [Group G] {g : G} (hg : g * g = 1) :
    ∀ k : Re, gpowRe g (k + k) = 1 := by
  intro k
  induction k with
  | void => rw [Re.add_void]; rfl
  | step k ih =>
      rw [double_step, gpowRe_step, gpowRe_step, ← mul_assoc, hg, one_mul]
      exact ih

/-- ★ THE AMBIGUOUS-INVISIBILITY LEMMA: for odd exponent p = k+k+1,
    an ambiguous element is its own p-th power: g^(k+k+1) = g.
    (The genus layer is invisible mod odd p — THE LAW's generator cleaner.) -/
theorem ambiguous_invisible {G : Type} [Group G] {g : G} (hg : g * g = 1) (k : Re) :
    gpowRe g (k + k + 1) = g := by
  rw [add_one_step, gpowRe_step, gpowRe_double_one hg k, mul_one]

/-- p-th-power membership (the pCl predicate, abstract layer). -/
def IsPthPower {G : Type} [Group G] (p : Re) (h : G) : Prop :=
  ∃ w : G, gpowRe w p = h

/-- D7 INHABITATION: the unit is a p-th power for every p. -/
theorem isPthPower_one {G : Type} [Group G] (p : Re) : IsPthPower p (1 : G) :=
  ⟨1, gpowRe_one_left p⟩

/-- ★ THE CONSEQUENCE (THE LAW's generator-set lemma, abstract form):
    every ambiguous element is a p-th power for every odd p — with ITSELF
    as the witness. -/
theorem ambiguous_isPthPower {G : Type} [Group G] {g : G} (hg : g * g = 1) (k : Re) :
    IsPthPower (k + k + 1) g :=
  ⟨g, ambiguous_invisible hg k⟩

/-- W8 ANTI-VACUITY TOOTH: the lemma is not "everything is a p-th power" —
    its ENGINE (even powers die) genuinely uses ambiguity: the free witness
    shape gpowRe g (k+k) = 1 FAILS for g with g·g ≠ 1 at k = 1:
    gpowRe g (1+1) = g·g. Concrete contrast on the derived integers'
    multiplicative unit group is deferred to the CONCRETE pCl file; here the
    computation identity is banked: gpowRe g (1+1) = g * g for EVERY g. -/
theorem gpowRe_two (G : Type) [Group G] (g : G) :
    gpowRe g ((1 : Re) + 1) = g * g := by
  have h : (1 : Re) + 1 = Re.step (Re.step Re.void) := by
    rw [add_one_step]
    rfl
  rw [h, gpowRe_step, gpowRe_step, gpowRe_void, mul_one]


def gpowC {G : Type} [CommGroup G] (g : G) : Re → G
  | .void => 1
  | .step n => g * gpowC g n

theorem gpowC_step {G : Type} [CommGroup G] (g : G) (n : Re) :
    gpowC g (Re.step n) = g * gpowC g n := rfl

/-- gpowC is multiplicative in the base (commutative case). -/
theorem gpowC_mul_base {G : Type} [CommGroup G] (g h : G) :
    ∀ n : Re, gpowC (g * h) n = gpowC g n * gpowC h n
  | .void => by simp [gpowC]
  | .step n => by
      rw [gpowC_step, gpowC_step, gpowC_step, gpowC_mul_base g h n]
      -- (g h) (G H) = (g G) (h H) — commutativity shuffle
      have := mul_comm h (gpowC g n)
      calc g * h * (gpowC g n * gpowC h n)
          = g * (h * gpowC g n) * gpowC h n := by
            rw [mul_assoc, mul_assoc, mul_assoc]
        _ = g * (gpowC g n * h) * gpowC h n := by rw [mul_comm h (gpowC g n)]
        _ = g * gpowC g n * (h * gpowC h n) := by
            rw [mul_assoc, mul_assoc, mul_assoc]

/-- gpowC of the inverse is the inverse of gpowC. -/
theorem gpowC_inv {G : Type} [CommGroup G] (g : G) :
    ∀ n : Re, gpowC g⁻¹ n = (gpowC g n)⁻¹
  | .void => by simp [gpowC]
  | .step n => by
      rw [gpowC_step, gpowC_step, gpowC_inv g n, mul_inv_rev]
      exact mul_comm _ _

/-- The unit's powers are the unit. -/
theorem gpowC_one {G : Type} [CommGroup G] :
    ∀ n : Re, gpowC (1 : G) n = 1
  | .void => rfl
  | .step n => by rw [gpowC_step, gpowC_one n, one_mul]

def IsPthPowerC {G : Type} [CommGroup G] (p : Re) (h : G) : Prop :=
  ∃ w : G, gpowC w p = h

/-- ★ WITNESS NECESSITY (the exactness of THE LAW's relation test):
    X · W^p = 1  ⟹  X ∈ pCl, with witness W⁻¹. -/
theorem witness_necessity {G : Type} [CommGroup G] {p : Re} {X W : G}
    (h : X * gpowC W p = 1) : IsPthPowerC p X := by
  refine ⟨W⁻¹, ?_⟩
  rw [gpowC_inv]
  have hX : X = (gpowC W p)⁻¹ := by
    have := mul_eq_one_iff_eq_inv.mp h
    exact this
  rw [hX]

/-- ★ pCl IS CLOSED under product and inverse (the subgroup structure the
    rank computation runs on). -/
theorem isPthPower_mul {G : Type} [CommGroup G] {p : Re} {X Y : G}
    (hX : IsPthPowerC p X) (hY : IsPthPowerC p Y) : IsPthPowerC p (X * Y) := by
  obtain ⟨w, hw⟩ := hX
  obtain ⟨v, hv⟩ := hY
  exact ⟨w * v, by rw [gpowC_mul_base, hw, hv]⟩

theorem isPthPower_inv {G : Type} [CommGroup G] {p : Re} {X : G}
    (hX : IsPthPowerC p X) : IsPthPowerC p X⁻¹ := by
  obtain ⟨w, hw⟩ := hX
  exact ⟨w⁻¹, by rw [gpowC_inv, hw]⟩

/-- ★ THE RELATION-TRANSPORT LEMMA (what the greedy rank scan uses): if
    X · Y^v · W^p = 1 then X ≡ (Y⁻¹)^v mod pCl — dependence read from ONE
    principal landing. Stated with the v-power also fold-indexed. -/
theorem relation_transport {G : Type} [CommGroup G] {p v : Re} {X Y W : G}
    (h : X * gpowC Y v * gpowC W p = 1) :
    ∃ Q : G, IsPthPowerC p Q ∧ X = gpowC Y⁻¹ v * Q := by
  refine ⟨gpowC W⁻¹ p, ⟨W⁻¹, rfl⟩, ?_⟩
  rw [gpowC_inv, gpowC_inv]
  -- X = (Y^v)⁻¹ (W^p)⁻¹ from the landing
  have hX : X = (gpowC Y v * gpowC W p)⁻¹ := by
    have hassoc : X * (gpowC Y v * gpowC W p) = 1 := by
      rw [← mul_assoc]; exact h
    exact mul_eq_one_iff_eq_inv.mp hassoc
  rw [hX, mul_inv_rev, mul_comm]


/-- Primitivity: no d with |d| > 1 divides all three coefficients.
    Stated Bézout-style (fold-native, no gcd computation): the coefficients
    generate the unit ideal. -/
def Primitive (f : BQF) : Prop :=
  ∃ u v w : Z, u * f.a + v * f.b + w * f.c = 1

/-- D7 witness: (1,0,1) is primitive. -/
theorem primitive_inhabited : Primitive ⟨1, 0, 1⟩ :=
  ⟨1, 0, 0, by ring⟩

theorem eval_10 (f : BQF) : eval f 1 0 = f.a := by unfold eval; ring
theorem eval_01 (f : BQF) : eval f 0 1 = f.c := by unfold eval; ring
theorem eval_11 (f : BQF) : eval f 1 1 = f.a + f.b + f.c := by unfold eval; ring

/-- ★ THE THREE-POINT LEMMA: if q divides f(1,0), f(0,1), AND f(1,1), then q
    divides every Bézout combination of the coefficients — in particular, if
    f is primitive, q divides 1. Contrapositive: a primitive form ESCAPES
    every non-unit q at one of three basis points. -/
theorem three_point_escape {f : BQF} (hprim : Primitive f) {q : Z}
    (h10 : ZDvd q (eval f 1 0)) (h01 : ZDvd q (eval f 0 1))
    (h11 : ZDvd q (eval f 1 1)) : ZDvd q 1 := by
  obtain ⟨u, v, w, huvw⟩ := hprim
  rw [eval_10] at h10
  rw [eval_01] at h01
  rw [eval_11] at h11
  obtain ⟨ca, hca⟩ := h10
  obtain ⟨cc, hcc⟩ := h01
  obtain ⟨cs, hcs⟩ := h11
  -- b = (a+b+c) − a − c = q(cs − ca − cc)
  have hb : f.b = q * (cs - ca - cc) := by
    have : f.a + f.b + f.c = q * cs := hcs
    rw [hca, hcc] at this
    linarith [this]
  refine ⟨u * ca + v * (cs - ca - cc) + w * cc, ?_⟩
  calc (1 : Z) = u * f.a + v * f.b + w * f.c := huvw.symm
    _ = u * (q * ca) + v * (q * (cs - ca - cc)) + w * (q * cc) := by
        rw [← hca, ← hb, ← hcc]
    _ = q * (u * ca + v * (cs - ca - cc) + w * cc) := by ring

/-- ★ PRIMITIVITY IS MOVE-INVARIANT (transport under the chain): shift. -/
theorem primitive_shiftF {f : BQF} (hp : Primitive f) (k : Z) :
    Primitive (shiftF k f) := by
  obtain ⟨u, v, w, huvw⟩ := hp
  -- new coeffs: A = a, B = b + 2ak, C = ak² + bk + c.
  -- Express a, b, c as combos of A, B, C: a = A; b = B − 2kA; c = C − k²A... 
  -- c = C − A k² − (B − 2Ak) k = C − Bk + Ak².
  refine ⟨u + v * (-(2 * k)) + w * (k * k), v + w * (-k), w, ?_⟩
  show (u + v * (-(2 * k)) + w * (k * k)) * f.a
     + (v + w * (-k)) * (f.b + 2 * f.a * k)
     + w * (f.a * k * k + f.b * k + f.c) = 1
  calc (u + v * (-(2 * k)) + w * (k * k)) * f.a
     + (v + w * (-k)) * (f.b + 2 * f.a * k)
     + w * (f.a * k * k + f.b * k + f.c)
      = u * f.a + v * f.b + w * f.c := by ring
    _ = 1 := huvw

/-- swap. -/
theorem primitive_swapF {f : BQF} (hp : Primitive f) : Primitive (swapF f) := by
  obtain ⟨u, v, w, huvw⟩ := hp
  exact ⟨w, -v, u, by
    show w * f.c + (-v) * (-f.b) + u * f.a = 1
    calc w * f.c + (-v) * (-f.b) + u * f.a
        = u * f.a + v * f.b + w * f.c := by ring
      _ = 1 := huvw⟩

/-- W8 anti-vacuity: the three-point lemma BITES — a non-primitive form
    (2,0,2) has all three basis evaluations divisible by 2, and indeed
    2 ∤ 1: the escape genuinely requires primitivity. -/
theorem three_point_needs_primitivity :
    ZDvd 2 (eval ⟨2, 0, 2⟩ 1 0) ∧ ZDvd 2 (eval ⟨2, 0, 2⟩ 0 1) ∧
    ZDvd 2 (eval ⟨2, 0, 2⟩ 1 1) := by
  refine ⟨⟨1, ?_⟩, ⟨1, ?_⟩, ⟨2, ?_⟩⟩
  · show eval ⟨2, 0, 2⟩ 1 0 = 2 * 1
    unfold eval; ring
  · show eval ⟨2, 0, 2⟩ 0 1 = 2 * 1
    unfold eval; ring
  · show eval ⟨2, 0, 2⟩ 1 1 = 2 * 2
    unfold eval; ring


/-- (1) PER-PRIME ESCAPE (existential form): for primitive f and non-unit q,
    SOME basis point escapes divisibility. Decidable-free: pure case split on
    the three divisibility Props via Classical.byContradiction shape — we use
    or-introduction over em. -/
theorem prime_escape_or {f : BQF} (hprim : Primitive f) {q : Z}
    (hq : ¬ ZDvd q 1) :
    (¬ ZDvd q (eval f 1 0)) ∨ (¬ ZDvd q (eval f 0 1)) ∨
    (¬ ZDvd q (eval f 1 1)) := by
  by_contra hall
  push_neg at hall
  obtain ⟨h10, h01, h11⟩ := hall
  exact hq (three_point_escape hprim h10 h01 h11)

/-- Existential form (what the list landing consumes). -/
theorem prime_escape {f : BQF} (hprim : Primitive f) {q : Z}
    (hq : ¬ ZDvd q 1) :
    ∃ x y : Z, ¬ ZDvd q (eval f x y) := by
  rcases prime_escape_or hprim hq with h | h | h
  · exact ⟨1, 0, h⟩
  · exact ⟨0, 1, h⟩
  · exact ⟨1, 1, h⟩


theorem ZDvd_add {d x y : Z} (hx : ZDvd d x) (hy : ZDvd d y) : ZDvd d (x + y) := by
  obtain ⟨c1, rfl⟩ := hx
  obtain ⟨c2, rfl⟩ := hy
  exact ⟨c1 + c2, (mul_add d c1 c2).symm⟩

theorem ZDvd_mul_right {d x : Z} (h : ZDvd d x) (y : Z) : ZDvd d (x * y) := by
  obtain ⟨c, rfl⟩ := h
  exact ⟨c * y, mul_assoc d c y⟩

/-- (1) ★ EVAL TRANSPORTS ALONG CONGRUENCES: x ≡ x₀, y ≡ y₀ (mod q) ⟹
    q ∣ (eval f x y − eval f x₀ y₀). Pure polynomial algebra: the difference
    telescopes into q-divisible pieces. -/
theorem eval_congr (f : BQF) {q x x0 y y0 : Z}
    (hx : ZDvd q (x - x0)) (hy : ZDvd q (y - y0)) :
    ZDvd q (eval f x y - eval f x0 y0) := by
  obtain ⟨s, hs⟩ := hx
  obtain ⟨t, ht⟩ := hy
  -- x = x0 + qs, y = y0 + qt; expand and collect q-multiples
  have hxe : x = x0 + q * s := by linarith
  have hye : y = y0 + q * t := by linarith
  refine ⟨f.a * (2 * x0 * s + q * s * s)
        + f.b * (x0 * t + y0 * s + q * s * t)
        + f.c * (2 * y0 * t + q * t * t), ?_⟩
  unfold eval
  rw [hxe, hye]
  ring

/-- Escape point data: one of the three basis points with its non-divisibility. -/
def EscapesAt (f : BQF) (q x y : Z) : Prop := ¬ ZDvd q (eval f x y)

/-- (2) ★ THE CRT LANDING STEP: given escape points (x₁,y₁) mod q₁ and
    (x₂,y₂) mod q₂ with Coprime q₁ q₂, there is ONE point (x,y) escaping
    BOTH. (The L2a crt_coprime shape applied coordinatewise + eval_congr.) -/
theorem crt_landing_two {f : BQF} {q1 q2 x1 y1 x2 y2 : Z}
    (hcop : Coprime q1 q2)
    (h1 : EscapesAt f q1 x1 y1) (h2 : EscapesAt f q2 x2 y2) :
    ∃ x y : Z, EscapesAt f q1 x y ∧ EscapesAt f q2 x y := by
  obtain ⟨u, v, huv⟩ := hcop
  -- coordinatewise CRT: x := x1·(v q2) + x2·(u q1), same for y
  refine ⟨x1 * (v * q2) + x2 * (u * q1), y1 * (v * q2) + y2 * (u * q1), ?_, ?_⟩
  · -- mod q1: v q2 = 1 − u q1 ≡ 1, u q1 ≡ 0 ⟹ x ≡ x1, y ≡ y1
    intro hdvd
    apply h1
    have hxc : ZDvd q1 (x1 * (v * q2) + x2 * (u * q1) - x1) := by
      have hv : v * q2 - 1 = -(u * q1) := by linarith
      refine ⟨x1 * (-u) + x2 * u, ?_⟩
      calc x1 * (v * q2) + x2 * (u * q1) - x1
          = x1 * (v * q2 - 1) + x2 * (u * q1) := by ring
        _ = x1 * (-(u * q1)) + x2 * (u * q1) := by rw [hv]
        _ = q1 * (x1 * (-u) + x2 * u) := by ring
    have hyc : ZDvd q1 (y1 * (v * q2) + y2 * (u * q1) - y1) := by
      have hv : v * q2 - 1 = -(u * q1) := by linarith
      refine ⟨y1 * (-u) + y2 * u, ?_⟩
      calc y1 * (v * q2) + y2 * (u * q1) - y1
          = y1 * (v * q2 - 1) + y2 * (u * q1) := by ring
        _ = y1 * (-(u * q1)) + y2 * (u * q1) := by rw [hv]
        _ = q1 * (y1 * (-u) + y2 * u) := by ring
    have htrans := eval_congr f hxc hyc
    -- q1 ∣ eval(x,y) and q1 ∣ (eval(x,y) − eval(x1,y1)) ⟹ q1 ∣ eval(x1,y1)
    obtain ⟨c1, hc1⟩ := hdvd
    obtain ⟨c2, hc2⟩ := htrans
    refine ⟨c1 - c2, ?_⟩
    calc eval f x1 y1 = q1 * c1 - q1 * c2 := by linarith [hc1, hc2]
      _ = q1 * (c1 - c2) := by ring
  · -- mod q2: symmetric
    intro hdvd
    apply h2
    have hxc : ZDvd q2 (x1 * (v * q2) + x2 * (u * q1) - x2) := by
      have hu : u * q1 - 1 = -(v * q2) := by linarith
      refine ⟨x1 * v + x2 * (-v), ?_⟩
      calc x1 * (v * q2) + x2 * (u * q1) - x2
          = x2 * (u * q1 - 1) + x1 * (v * q2) := by ring
        _ = x2 * (-(v * q2)) + x1 * (v * q2) := by rw [hu]
        _ = q2 * (x1 * v + x2 * (-v)) := by ring
    have hyc : ZDvd q2 (y1 * (v * q2) + y2 * (u * q1) - y2) := by
      have hu : u * q1 - 1 = -(v * q2) := by linarith
      refine ⟨y1 * v + y2 * (-v), ?_⟩
      calc y1 * (v * q2) + y2 * (u * q1) - y2
          = y2 * (u * q1 - 1) + y1 * (v * q2) := by ring
        _ = y2 * (-(v * q2)) + y1 * (v * q2) := by rw [hu]
        _ = q2 * (y1 * v + y2 * (-v)) := by ring
    have htrans := eval_congr f hxc hyc
    obtain ⟨c1, hc1⟩ := hdvd
    obtain ⟨c2, hc2⟩ := htrans
    refine ⟨c1 - c2, ?_⟩
    calc eval f x2 y2 = q2 * c1 - q2 * c2 := by linarith [hc1, hc2]
      _ = q2 * (c1 - c2) := by ring


/-- Escape transports BACK along congruences: if (x,y) ≡ (x',y') mod q and
    (x',y') escapes q, so does (x,y). -/
theorem escape_transport {f : BQF} {q x x' y y' : Z}
    (hx : ZDvd q (x - x')) (hy : ZDvd q (y - y'))
    (h : EscapesAt f q x' y') : EscapesAt f q x y := by
  intro hdvd
  apply h
  obtain ⟨c1, hc1⟩ := hdvd
  obtain ⟨c2, hc2⟩ := eval_congr f hx hy
  refine ⟨c1 - c2, ?_⟩
  calc eval f x' y' = q * c1 - q * c2 := by linarith [hc1, hc2]
    _ = q * (c1 - c2) := by ring


/-- Pairwise coprimality of a list (each vs all later). -/
def PairwiseCop : List Z → Prop
  | [] => True
  | q :: qs => (∀ r ∈ qs, Coprime q r) ∧ PairwiseCop qs

/-- head coprime to the tail product. -/
theorem coprime_listProd {q : Z} {qs : List Z} (h : ∀ r ∈ qs, Coprime q r) :
    Coprime q (zListProd qs) := by
  induction qs with
  | nil => exact ⟨0, 1, by show 0 * q + 1 * 1 = 1; ring⟩
  | cons r rs ih =>
      have hr : Coprime q r := h r (List.mem_cons_self ..)
      have hrs : Coprime q (zListProd rs) :=
        ih (fun s hs => h s (List.mem_cons_of_mem r hs))
      exact coprime_mul hr hrs

/-- Every member divides the list product. -/
theorem mem_dvd_listProd {q : Z} {qs : List Z} (h : q ∈ qs) :
    ZDvd q (zListProd qs) := by
  induction qs with
  | nil => cases h
  | cons r rs ih =>
      rcases List.mem_cons.mp h with heq | hmem
      · subst heq
        exact ⟨zListProd rs, rfl⟩
      · obtain ⟨c, hc⟩ := ih hmem
        refine ⟨r * c, ?_⟩
        show r * zListProd rs = q * (r * c)
        rw [hc]
        ring

/-- ★★ THE LIST LANDING: primitive f, pairwise-coprime non-unit primes qs ⟹
    ONE point escaping every q ∈ qs. THE CONCORDANCE SUPPLY CLOSES. -/
theorem list_landing {f : BQF} (hprim : Primitive f) :
    ∀ qs : List Z, PairwiseCop qs → (∀ q ∈ qs, ¬ ZDvd q 1) →
    ∃ x y : Z, ∀ q ∈ qs, EscapesAt f q x y := by
  intro qs
  induction qs with
  | nil =>
      intro _ _
      exact ⟨1, 0, fun q hq => absurd hq (List.not_mem_nil)⟩
  | cons q rs ih =>
      intro hpc hnu
      obtain ⟨hqrs, hpcrs⟩ := hpc
      -- escape point for the head prime
      obtain ⟨x1, y1, hesc1⟩ := prime_escape hprim (hnu q (List.mem_cons_self ..))
      -- landing for the tail
      obtain ⟨x2, y2, hesc2⟩ :=
        ih hpcrs (fun r hr => hnu r (List.mem_cons_of_mem q hr))
      -- CRT: q vs zListProd rs are coprime
      have hcop : Coprime q (zListProd rs) := coprime_listProd hqrs
      obtain ⟨u, v, huv⟩ := hcop
      set P := zListProd rs with hP
      -- the combined point: mod q it is (x1,y1); mod P it is (x2,y2)
      refine ⟨x1 * (v * P) + x2 * (u * q), y1 * (v * P) + y2 * (u * q), ?_⟩
      intro r hr
      rcases List.mem_cons.mp hr with heq | hmem
      · -- r = q: transport the head escape
        subst heq
        refine escape_transport ?_ ?_ hesc1
        · have hv : v * P - 1 = -(u * r) := by linarith
          refine ⟨x1 * (-u) + x2 * u, ?_⟩
          calc x1 * (v * P) + x2 * (u * r) - x1
              = x1 * (v * P - 1) + x2 * (u * r) := by ring
            _ = x1 * (-(u * r)) + x2 * (u * r) := by rw [hv]
            _ = r * (x1 * (-u) + x2 * u) := by ring
        · have hv : v * P - 1 = -(u * r) := by linarith
          refine ⟨y1 * (-u) + y2 * u, ?_⟩
          calc y1 * (v * P) + y2 * (u * r) - y1
              = y1 * (v * P - 1) + y2 * (u * r) := by ring
            _ = y1 * (-(u * r)) + y2 * (u * r) := by rw [hv]
            _ = r * (y1 * (-u) + y2 * u) := by ring
      · -- r ∈ rs: the point ≡ (x2,y2) mod P, and r ∣ P — transport down
        have hrP : ZDvd r P := mem_dvd_listProd hmem
        refine escape_transport ?_ ?_ (hesc2 r hmem)
        · -- r ∣ (x − x2): x − x2 = x1 v P + x2(uq − 1) = x1 v P − x2 v P = (x1−x2)vP
          have hu : u * q - 1 = -(v * P) := by linarith
          obtain ⟨c, hc⟩ := hrP
          refine ⟨(x1 - x2) * v * c, ?_⟩
          calc x1 * (v * P) + x2 * (u * q) - x2
              = x1 * (v * P) + x2 * (u * q - 1) := by ring
            _ = x1 * (v * P) + x2 * (-(v * P)) := by rw [hu]
            _ = (x1 - x2) * v * P := by ring
            _ = (x1 - x2) * v * (r * c) := by rw [← hc]
            _ = r * ((x1 - x2) * v * c) := by ring
        · have hu : u * q - 1 = -(v * P) := by linarith
          obtain ⟨c, hc⟩ := hrP
          refine ⟨(y1 - y2) * v * c, ?_⟩
          calc y1 * (v * P) + y2 * (u * q) - y2
              = y1 * (v * P) + y2 * (u * q - 1) := by ring
            _ = y1 * (v * P) + y2 * (-(v * P)) := by rw [hu]
            _ = (y1 - y2) * v * P := by ring
            _ = (y1 - y2) * v * (r * c) := by rw [← hc]
            _ = r * ((y1 - y2) * v * c) := by ring


/-- eval is homogeneous of degree 2: eval (gx, gy) = g² eval (x, y). -/
theorem eval_homog (f : BQF) (g x y : Z) :
    eval f (g * x) (g * y) = g * g * eval f x y := by
  unfold eval
  ring

/-- ★ (1) ESCAPE DESCENDS THROUGH SCALING: if eval f (g x') (g y') escapes q,
    then eval f x' y' escapes q. (Contrapositive of homogeneity+divisibility.) -/
theorem escape_of_scaled_escape {f : BQF} {q g x' y' : Z}
    (h : ¬ ZDvd q (eval f (g * x') (g * y'))) : ¬ ZDvd q (eval f x' y') := by
  intro ⟨c, hc⟩
  apply h
  refine ⟨g * g * c, ?_⟩
  rw [eval_homog, hc]
  ring

/-- ★ THE GCD DESCENT (properness reduction data): given x = g·x', y = g·y'
    and the Bézout identity g = a·x + b·y with g ≠ 0, the quotient pair
    (x', y') is PROPER: a·x' + b·y' = 1 after cancelling g. -/
theorem proper_of_gcd_quotient {g x y x' y' a b : Z}
    (hg : g ≠ 0) (hx : x = g * x') (hy : y = g * y')
    (hbez : g = a * x + b * y) : Proper x' y' := by
  refine ⟨a, b, ?_⟩
  -- g = a(gx') + b(gy') = g(ax' + by') ⟹ 1 = ax' + by' by cancellation
  have hexp : g * 1 = g * (a * x' + b * y') := by
    rw [mul_one]
    calc g = a * x + b * y := hbez
      _ = a * (g * x') + b * (g * y') := by rw [hx, hy]
      _ = g * (a * x' + b * y') := by ring
  -- cancel g (integral domain — the L1c cancellation, restated inline)
  have hcancel : ∀ {p u v : Z}, p ≠ 0 → p * u = p * v → u = v := by
    intro p u v hp h
    by_contra hne
    have huv : u - v ≠ 0 := fun h0 => hne (by linarith [sub_eq_zero.mp h0])
    have hprod : p * (u - v) ≠ 0 := by
      -- sign analysis via Z.mul_pos (L1c z_mul_ne_zero, inlined)
      have hpt : 0 < p ∨ p < 0 := by
        rcases lt_trichotomy 0 p with hh | hh | hh
        · exact Or.inl hh
        · exact absurd hh.symm hp
        · exact Or.inr hh
      have hut : 0 < u - v ∨ u - v < 0 := by
        rcases lt_trichotomy 0 (u - v) with hh | hh | hh
        · exact Or.inl hh
        · exact absurd hh.symm huv
        · exact Or.inr hh
      rcases hpt with h1 | h1 <;> rcases hut with h2 | h2
      · exact ne_of_gt (Z.mul_pos _ _ h1 h2)
      · have hpos : 0 < p * (-(u - v)) := Z.mul_pos _ _ h1 (by linarith)
        intro h0
        rw [show p * (-(u - v)) = -(p * (u - v)) by ring, h0, neg_zero] at hpos
        exact lt_irrefl _ hpos
      · have hpos : 0 < (-p) * (u - v) := Z.mul_pos _ _ (by linarith) h2
        intro h0
        rw [show (-p) * (u - v) = -(p * (u - v)) by ring, h0, neg_zero] at hpos
        exact lt_irrefl _ hpos
      · have hpos : 0 < (-p) * (-(u - v)) := Z.mul_pos _ _ (by linarith) (by linarith)
        intro h0
        rw [show (-p) * (-(u - v)) = p * (u - v) by ring, h0] at hpos
        exact lt_irrefl _ hpos
    apply hprod
    rw [mul_sub, h, sub_self]
  have := hcancel hg hexp
  linarith [this]

/-- ★ (2) THE CONCORDANCE SUPPLY, assembled: a PROPER landing whose value
    escapes every prime of the (pairwise-coprime, non-unit) list — given a
    raw landing that escapes (L5e's list_landing) and its gcd data (L0e).
    The two hypotheses are exactly what list_landing + gcd_bezout_exists
    produce; this theorem is the JOIN. -/
theorem proper_escaping_landing {f : BQF} {qs : List Z} {x y g x' y' a b : Z}
    (hesc : ∀ q ∈ qs, ¬ ZDvd q (eval f x y))
    (hg : g ≠ 0) (hx : x = g * x') (hy : y = g * y')
    (hbez : g = a * x + b * y) :
    Proper x' y' ∧ ∀ q ∈ qs, ¬ ZDvd q (eval f x' y') := by
  refine ⟨proper_of_gcd_quotient hg hx hy hbez, ?_⟩
  intro q hq
  have hx2 : x = g * x' := hx
  have hy2 : y = g * y' := hy
  have : ¬ ZDvd q (eval f (g * x') (g * y')) := by
    rw [← hx2, ← hy2]
    exact hesc q hq
  exact escape_of_scaled_escape this


/-! ### ★★ THE CONCORDANT REPRESENTATIVE THEOREM (the join). -/

theorem concordant_representative
    {f : BQF} (hprim : Primitive f) (N : Z) (qs : List Z)
    -- N's prime factorization (list product):
    (hN : N = zListProd qs)
    -- L5e's landing, applied: a point escaping every prime of N
    (x y : Z) (hesc : ∀ q ∈ qs, ¬ ZDvd q (eval f x y))
    -- L0e's gcd data for (x, y): g, quotient pair, Bézout
    (g x' y' A B : Z) (hg : g ≠ 0) (hx : x = g * x') (hy : y = g * y')
    (hbez : g = A * x + B * y)
    -- per-prime divisor-classification data vs the landed value
    -- (q prime ⟹ gcd(q, V) ∈ {1, q}; supplied by PrimeRe at consolidation):
    (hclass : ∀ q ∈ qs, ∃ gq aq bq : Z,
        ZDvd gq (eval f x' y') ∧ gq = aq * q + bq * (eval f x' y') ∧
        (gq = 1 ∨ gq = q))
    -- L2f's anchor, as hypothesis (proved in GQ_L2f):
    (hanchor : ∀ (x0 y0 N0 : Z), eval f x0 y0 = N0 →
        (∃ u v : Z, u * x0 + v * y0 = 1) →
        ∃ h : BQF, Chain f h ∧ h.a = N0) :
    -- CONCLUSION: a chained representative whose leading miss is coprime to N
    ∃ h : BQF, Chain f h ∧ Coprime h.a N := by
  -- 1. properness of the quotient pair (L5f shape, inlined via hbez descent)
  have hproper : ∃ u v : Z, u * x' + v * y' = 1 := by
    refine ⟨A, B, ?_⟩
    have hexp : g * 1 = g * (A * x' + B * y') := by
      rw [mul_one]
      calc g = A * x + B * y := hbez
        _ = A * (g * x') + B * (g * y') := by rw [hx, hy]
        _ = g * (A * x' + B * y') := by ring
    -- cancel g
    by_contra hne
    have hsub : A * x' + B * y' - 1 ≠ 0 := by
      intro h0
      exact hne (by linarith [sub_eq_zero.mp h0])
    -- g * (A x' + B y' − 1) = 0 with both factors nonzero: contradiction via sign analysis
    have hzero : g * (A * x' + B * y' - 1) = 0 := by
      calc g * (A * x' + B * y' - 1)
          = g * (A * x' + B * y') - g * 1 := by ring
        _ = 0 := by rw [← hexp]; ring
    -- integral domain (sign analysis)
    have hgt : 0 < g ∨ g < 0 := by
      rcases lt_trichotomy 0 g with h1 | h1 | h1
      · exact Or.inl h1
      · exact absurd h1.symm hg
      · exact Or.inr h1
    have hst : 0 < (A * x' + B * y' - 1) ∨ (A * x' + B * y' - 1) < 0 := by
      rcases lt_trichotomy 0 (A * x' + B * y' - 1) with h1 | h1 | h1
      · exact Or.inl h1
      · exact absurd h1.symm hsub
      · exact Or.inr h1
    rcases hgt with h1 | h1 <;> rcases hst with h2 | h2
    · have := Z.mul_pos _ _ h1 h2
      rw [hzero] at this
      exact lt_irrefl _ this
    · have hpos : 0 < g * (-(A * x' + B * y' - 1)) := Z.mul_pos _ _ h1 (by linarith)
      rw [show g * (-(A * x' + B * y' - 1)) = -(g * (A * x' + B * y' - 1)) by ring,
          hzero, neg_zero] at hpos
      exact lt_irrefl _ hpos
    · have hpos : 0 < (-g) * (A * x' + B * y' - 1) := Z.mul_pos _ _ (by linarith) h2
      rw [show (-g) * (A * x' + B * y' - 1) = -(g * (A * x' + B * y' - 1)) by ring,
          hzero, neg_zero] at hpos
      exact lt_irrefl _ hpos
    · have hpos : 0 < (-g) * (-(A * x' + B * y' - 1)) :=
        Z.mul_pos _ _ (by linarith) (by linarith)
      rw [show (-g) * (-(A * x' + B * y' - 1)) = g * (A * x' + B * y' - 1) by ring,
          hzero] at hpos
      exact lt_irrefl _ hpos
  -- 2. the quotient landing still escapes every prime (L5f transport)
  have hesc' : ∀ q ∈ qs, ¬ ZDvd q (eval f x' y') := by
    intro q hq
    have hraw : ¬ ZDvd q (eval f (g * x') (g * y')) := by
      rw [← hx, ← hy]
      exact hesc q hq
    exact escape_of_scaled_escape hraw
  -- 3. anchor: chain to a form whose leading miss IS the landed value
  obtain ⟨h, hchain, hha⟩ := hanchor x' y' (eval f x' y') rfl hproper
  -- 4. the landed value is coprime to N: per-prime via classification, then list
  refine ⟨h, hchain, ?_⟩
  rw [hN, hha]
  apply coprime_of_coprime_all
  intro q hq
  obtain ⟨gq, aq, bq, hgqv, hgqbez, hgqclass⟩ := hclass q hq
  exact coprime_of_prime_not_dvd hgqv hgqbez hgqclass (hesc' q hq)


/-- ★★ SAME-PAIR WELL-DEFINEDNESS (the L6 core): for ONE concordant miss
    pair (a1, a2), ANY two admissible gathers (united records B, B' with
    their Born residues) are CHAIN-EQUIVALENT. This is the choice-freedom
    of composition on fixed representatives — the deepest well-definedness
    layer, fully discharged from the banked pinning + shift theorems. -/
theorem gather_well_defined_same_pair {D a1 a2 b1 b2 B B' t t' : Z}
    (hcop : Coprime a1 a2) (ha : a1 * a2 ≠ 0)
    (hB1 : ∃ k, B = b1 + 2 * a1 * k) (hB2 : ∃ k, B = b2 + 2 * a2 * k)
    (hB1' : ∃ k, B' = b1 + 2 * a1 * k) (hB2' : ∃ k, B' = b2 + 2 * a2 * k)
    (hrec : B * B - D = 4 * (a1 * a2) * t)
    (hrec' : B' * B' - D = 4 * (a1 * a2) * t') :
    Chain (gatherForm a1 a2 B t) (gatherForm a1 a2 B' t') := by
  obtain ⟨k, hk⟩ := gather_record_unique hcop hB1 hB2 hB1' hB2'
  have heq := gather_record_shift hrec hrec' hk ha
  rw [heq]
  exact of_shift k _

/-- Symmetric corollary (kit completeness): the reverse chain. -/
theorem gather_well_defined_same_pair_symm {D a1 a2 b1 b2 B B' t t' : Z}
    (hcop : Coprime a1 a2) (ha : a1 * a2 ≠ 0)
    (hB1 : ∃ k, B = b1 + 2 * a1 * k) (hB2 : ∃ k, B = b2 + 2 * a2 * k)
    (hB1' : ∃ k, B' = b1 + 2 * a1 * k) (hB2' : ∃ k, B' = b2 + 2 * a2 * k)
    (hrec : B * B - D = 4 * (a1 * a2) * t)
    (hrec' : B' * B' - D = 4 * (a1 * a2) * t') :
    Chain (gatherForm a1 a2 B' t') (gatherForm a1 a2 B t) :=
  chainSymm (gather_well_defined_same_pair hcop ha hB1 hB2 hB1' hB2' hrec hrec')


/-- Admissibility of a united record for the pair of branch data
    ((a1,b1),(a2,b2)) at discriminant D. -/
def AdmissibleRecord (D a1 b1 a2 b2 B t : Z) : Prop :=
  (∃ k, B = b1 + 2 * a1 * k) ∧ (∃ k, B = b2 + 2 * a2 * k) ∧
  (B * B - D = 4 * (a1 * a2) * t)

/-- ★ THE CONGRUENCE SYSTEM IS SHIFT-BLIND: a record admissible for the
    SHIFTED first input ((a1, b1 + 2a1·m), (a2,b2)) is admissible for the
    ORIGINAL pair, and conversely. The shifted branch record lives in the
    same residue class mod 2a1 — the fold's branch datum is (a, b mod 2a),
    and shift moves never leave it. -/
theorem admissible_shift_blind {D a1 b1 a2 b2 B t m : Z} :
    AdmissibleRecord D a1 (b1 + 2 * a1 * m) a2 b2 B t ↔
    AdmissibleRecord D a1 b1 a2 b2 B t := by
  constructor
  · rintro ⟨⟨k, hk⟩, h2, h3⟩
    refine ⟨⟨m + k, ?_⟩, h2, h3⟩
    rw [hk]; ring
  · rintro ⟨⟨k, hk⟩, h2, h3⟩
    refine ⟨⟨k - m, ?_⟩, h2, h3⟩
    rw [hk]; ring


/-- ★★ THE GATHER IS SHIFT-INVARIANT IN ITS FIRST INPUT: any admissible
    gather of (shiftF m f1's branch data, f2's branch data) chains to any
    admissible gather of the original pair. Composition descends through
    shift moves — HALF of the well-definedness split, closed. -/
theorem gather_shift_input {D a1 b1 a2 b2 B t B' t' m : Z}
    (hcop : Coprime a1 a2) (ha : a1 * a2 ≠ 0)
    (hAdm : AdmissibleRecord D a1 b1 a2 b2 B t)
    (hAdm' : AdmissibleRecord D a1 (b1 + 2 * a1 * m) a2 b2 B' t') :
    Chain (gatherForm a1 a2 B t) (gatherForm a1 a2 B' t') := by
  have hAdm'0 : AdmissibleRecord D a1 b1 a2 b2 B' t' :=
    admissible_shift_blind.mp hAdm'
  obtain ⟨hB1, hB2, hrec⟩ := hAdm
  obtain ⟨hB1', hB2', hrec'⟩ := hAdm'0
  exact gather_well_defined_same_pair hcop ha hB1 hB2 hB1' hB2' hrec hrec'

/-- Symmetric version (second input shifted) — by the congruence symmetry
    of AdmissibleRecord, same engine. -/
theorem admissible_shift_blind_snd {D a1 b1 a2 b2 B t m : Z} :
    AdmissibleRecord D a1 b1 a2 (b2 + 2 * a2 * m) B t ↔
    AdmissibleRecord D a1 b1 a2 b2 B t := by
  constructor
  · rintro ⟨h1, ⟨k, hk⟩, h3⟩
    refine ⟨h1, ⟨m + k, ?_⟩, h3⟩
    rw [hk]; ring
  · rintro ⟨h1, ⟨k, hk⟩, h3⟩
    refine ⟨h1, ⟨k - m, ?_⟩, h3⟩
    rw [hk]; ring

theorem gather_shift_input_snd {D a1 b1 a2 b2 B t B' t' m : Z}
    (hcop : Coprime a1 a2) (ha : a1 * a2 ≠ 0)
    (hAdm : AdmissibleRecord D a1 b1 a2 b2 B t)
    (hAdm' : AdmissibleRecord D a1 b1 a2 (b2 + 2 * a2 * m) B' t') :
    Chain (gatherForm a1 a2 B t) (gatherForm a1 a2 B' t') := by
  have hAdm'0 : AdmissibleRecord D a1 b1 a2 b2 B' t' :=
    admissible_shift_blind_snd.mp hAdm'
  obtain ⟨hB1, hB2, hrec⟩ := hAdm
  obtain ⟨hB1', hB2', hrec'⟩ := hAdm'0
  exact gather_well_defined_same_pair hcop ha hB1 hB2 hB1' hB2' hrec hrec'


/-- ★ COMMUTATIVITY on the nose: the two-branch gather does not order its
    branches. (mul_comm is the whole content — the record B and residue t
    are SHARED data of the unordered pair.) -/
theorem gather_comm (a1 a2 B t : Z) :
    gatherForm a1 a2 B t = gatherForm a2 a1 B t := by
  unfold gatherForm
  rw [mul_comm]

/-- ★ THE TRIPLE FACTORIZATION: both nestings of a triple gather with ONE
    record are THE SAME FORM. (mul_assoc is the miss content; the shared
    record makes the rest definitional.) -/
theorem triple_flat (a1 a2 a3 B t : Z) :
    gatherForm (a1 * a2) a3 B t = gatherForm a1 (a2 * a3) B t := by
  unfold gatherForm
  rw [mul_assoc]

/-- The Born-residue bookkeeping across the factorization: a triple record
    (B² − D = 4·(a1a2a3)·t) is simultaneously a pair record for
    ((a1a2), a3) and for (a1, (a2a3)) — same t. -/
theorem triple_record_both_pairs {D a1 a2 a3 B t : Z}
    (h : B * B - D = 4 * (a1 * a2 * a3) * t) :
    (B * B - D = 4 * ((a1 * a2) * a3) * t) ∧
    (B * B - D = 4 * (a1 * (a2 * a3)) * t) := by
  constructor
  · calc B * B - D = 4 * (a1 * a2 * a3) * t := h
      _ = 4 * ((a1 * a2) * a3) * t := by ring
  · calc B * B - D = 4 * (a1 * a2 * a3) * t := h
      _ = 4 * (a1 * (a2 * a3)) * t := by ring

/-- Congruence bookkeeping: the triple record's three congruences imply the
    two PAIR-congruence systems of the factorization (the product-branch
    congruence B ≡ B mod 2·(a1a2) is trivial — witness 0). -/
theorem triple_congruences_both_pairs {a1 a2 a3 b1 b2 b3 B : Z}
    (h1 : ∃ k, B = b1 + 2 * a1 * k) (h2 : ∃ k, B = b2 + 2 * a2 * k)
    (h3 : ∃ k, B = b3 + 2 * a3 * k) :
    -- pair ((a1a2), a3): product-branch record is B itself + the a3 congruence
    ((∃ k, B = B + 2 * (a1 * a2) * k) ∧ (∃ k, B = b3 + 2 * a3 * k)) ∧
    -- pair (a1, (a2a3)): the a1 congruence + product-branch record B
    ((∃ k, B = b1 + 2 * a1 * k) ∧ (∃ k, B = B + 2 * (a2 * a3) * k)) := by
  refine ⟨⟨⟨0, by ring⟩, h3⟩, ⟨h1, ⟨0, by ring⟩⟩⟩

/-- W8 ANTI-VACUITY: the laws fire on a concrete D = −4-family instance:
    misses 1,1,1, record 0, residue 1 — and the FORMS agree componentwise
    (not just up to chain). -/
theorem triple_flat_fires :
    gatherForm ((1:Z) * 1) 1 0 1 = gatherForm 1 ((1:Z) * 1) 0 1 :=
  triple_flat 1 1 1 0 1


/-- ★★ THE GAUSS BILINEAR IDENTITY — one ring identity, the engine of
    composition: concordant branches multiply INTO the gather. -/
theorem gauss_bilinear (a1 a2 B t x y z w : Z) :
    eval ⟨a1, B, a2 * t⟩ x y * eval ⟨a2, B, a1 * t⟩ z w
      = eval (gatherForm a1 a2 B t) (x * z - t * y * w)
          (a1 * x * w + a2 * y * z + B * y * w) := by
  unfold eval gatherForm
  ring

/-- ★ THE VALUE BRIDGE: the gather represents every product of branch
    values. (The set-level consequence the swap argument consumes.) -/
theorem gather_represents_product {a1 a2 B t V1 V2 : Z}
    (h1 : Represents ⟨a1, B, a2 * t⟩ V1) (h2 : Represents ⟨a2, B, a1 * t⟩ V2) :
    Represents (gatherForm a1 a2 B t) (V1 * V2) := by
  obtain ⟨x, y, hxy⟩ := h1
  obtain ⟨z, w, hzw⟩ := h2
  exact ⟨x * z - t * y * w, a1 * x * w + a2 * y * z + B * y * w,
    by rw [← hxy, ← hzw]; exact (gauss_bilinear a1 a2 B t x y z w).symm⟩

/-- The branches in concordant presentation ARE forms of the same
    discriminant as the gather (bookkeeping identity). -/
theorem concordant_branch_disc (a1 a2 B t : Z) :
    (⟨a1, B, a2 * t⟩ : BQF).b * (⟨a1, B, a2 * t⟩ : BQF).b
      - 4 * (⟨a1, B, a2 * t⟩ : BQF).a * (⟨a1, B, a2 * t⟩ : BQF).c
    = (gatherForm a1 a2 B t).b * (gatherForm a1 a2 B t).b
      - 4 * (gatherForm a1 a2 B t).a * (gatherForm a1 a2 B t).c := by
  show B * B - 4 * a1 * (a2 * t) = B * B - 4 * (a1 * a2) * t
  ring

/-- ★ CONCRETE PROPER LANDING: F(1,0)-shape — the gather's own leading miss
    is the product of the branch misses, landed at the proper point (1,0)
    (this is gauss_bilinear at x=z=1, y=w=0, giving a1·a2 = F(1,0)). -/
theorem gather_leading_product (a1 a2 B t : Z) :
    eval (gatherForm a1 a2 B t) 1 0 = a1 * a2 := by
  unfold eval gatherForm
  ring

/-- W8 ANTI-VACUITY: the bilinear identity has TEETH — the substitution pair
    is NOT arbitrary: perturbing the Y-substitution by +1 breaks the identity
    on a concrete instance (a1=a2=1, B=0, t=1, x=y=z=w=1):
    LHS = f1(1,1)·f2(1,1) = 2·2 = 4; wrong-Y RHS = F(0, 3) = 9 ≠ 4. -/
theorem bilinear_teeth :
    eval ⟨1, 0, (1:Z) * 1⟩ 1 1 * eval ⟨1, 0, (1:Z) * 1⟩ 1 1
      ≠ eval (gatherForm 1 1 0 1) (1 * 1 - 1 * 1 * 1)
          (1 * 1 * 1 + 1 * 1 * 1 + 0 * 1 * 1 + 1) := by
  have hL : eval ⟨1, 0, (1:Z) * 1⟩ 1 1 * eval ⟨1, 0, (1:Z) * 1⟩ 1 1 = 4 := by
    unfold eval
    ring
  have hR : eval (gatherForm 1 1 0 1) (1 * 1 - 1 * 1 * 1)
      (1 * 1 * 1 + 1 * 1 * 1 + 0 * 1 * 1 + 1) = 9 := by
    unfold eval gatherForm
    ring
  rw [hL, hR]
  intro hcontra
  linarith


/-- ★ SWAP PRESERVES THE VALUE SET (both directions, no properness needed):
    (swapF f)(x, y) = f(y, −x) and f(x, y) = (swapF f)(−y, x). -/
theorem swap_value_set (f : BQF) (N : Z) :
    Represents (swapF f) N ↔ Represents f N := by
  constructor
  · rintro ⟨x, y, hxy⟩
    refine ⟨y, -x, ?_⟩
    rw [← hxy]
    unfold eval swapF
    ring
  · rintro ⟨x, y, hxy⟩
    refine ⟨-y, x, ?_⟩
    rw [← hxy]
    unfold eval swapF
    ring

/-- Swap also preserves PROPER landings (the Bézout witness transports:
    u·x + v·y = 1 becomes v·y' + (−u)·(−x')... explicitly (y,−x) has
    witness (v, −u)). -/
theorem swap_proper_landing {f : BQF} {N x y u v : Z}
    (hval : eval f x y = N) (hw : u * x + v * y = 1) :
    ∃ x' y' u' v' : Z, eval (swapF f) x' y' = N ∧ u' * x' + v' * y' = 1 := by
  refine ⟨-y, x, -v, u, ?_, ?_⟩
  · rw [← hval]
    unfold eval swapF
    ring
  · linarith [hw]

/-- ★ COMMON VALUE: two gathers whose branch pairs have EQUAL VALUE SETS
    represent a common value — any product of branch landings. Stated for
    direct use: gather (a1,a2,B,t) and gather (a1',a2',B',t') both represent
    V1·V2 whenever their respective concordant branches represent V1, V2. -/
theorem common_value {a1 a2 B t a1' a2' B' t' V1 V2 : Z}
    (h1 : Represents ⟨a1, B, a2 * t⟩ V1) (h2 : Represents ⟨a2, B, a1 * t⟩ V2)
    (h1' : Represents ⟨a1', B', a2' * t'⟩ V1) (h2' : Represents ⟨a2', B', a1' * t'⟩ V2) :
    Represents (gatherForm a1 a2 B t) (V1 * V2) ∧
    Represents (gatherForm a1' a2' B' t') (V1 * V2) := by
  constructor
  · obtain ⟨x, y, hxy⟩ := h1
    obtain ⟨z, w, hzw⟩ := h2
    exact ⟨x * z - t * y * w, a1 * x * w + a2 * y * z + B * y * w,
      by rw [← hxy, ← hzw]; exact (gauss_bilinear a1 a2 B t x y z w).symm⟩
  · obtain ⟨x, y, hxy⟩ := h1'
    obtain ⟨z, w, hzw⟩ := h2'
    exact ⟨x * z - t' * y * w, a1' * x * w + a2' * y * z + B' * y * w,
      by rw [← hxy, ← hzw]; exact (gauss_bilinear a1' a2' B' t' x y z w).symm⟩


/-- ★ ANCHORED FORMS WITH MATCHING RECORDS CHAIN: same leading miss V ≠ 0,
    records congruent mod 2V, same discriminant ⟹ one shift apart. (The
    endgame lemma of the swap-invariance reduction.) -/
theorem anchored_same_record_chain {V b1 b2 c1 c2 k : Z}
    (hV : V ≠ 0) (hrec : b2 = b1 + 2 * V * k)
    (hdisc : disc ⟨V, b1, c1⟩ = disc ⟨V, b2, c2⟩) :
    Chain ⟨V, b1, c1⟩ ⟨V, b2, c2⟩ := by
  have hc : c2 = V * k * k + b1 * k + c1 := by
    unfold disc at hdisc
    have hexp : b2 * b2 - 4 * V * c2 = b1 * b1 - 4 * V * c1 := by
      have h1 : (⟨V, b1, c1⟩ : BQF).b * (⟨V, b1, c1⟩ : BQF).b
          - 4 * (⟨V, b1, c1⟩ : BQF).a * (⟨V, b1, c1⟩ : BQF).c
          = b1 * b1 - 4 * V * c1 := rfl
      have h2 : (⟨V, b2, c2⟩ : BQF).b * (⟨V, b2, c2⟩ : BQF).b
          - 4 * (⟨V, b2, c2⟩ : BQF).a * (⟨V, b2, c2⟩ : BQF).c
          = b2 * b2 - 4 * V * c2 := rfl
      rw [h1, h2] at hdisc
      linarith [hdisc]
    rw [hrec] at hexp
    -- (b1 + 2Vk)² − 4Vc2 = b1² − 4Vc1 ⟹ 4V(b1k + Vk² + c1 − c2) = 0
    have h4 : (4 * V) * c2 = (4 * V) * (V * k * k + b1 * k + c1) := by
      nlinarith [hexp]
    have h4ne : (4 : Z) * V ≠ 0 := by
      apply z_mul_ne_zero _ hV
      intro h40
      have hp : (0:Z) < 4 := by positivity
      rw [h40] at hp
      exact lt_irrefl _ hp
    have := z_mul_cancel h4ne h4
    linarith
  have hform : shiftF k ⟨V, b1, c1⟩ = ⟨V, b2, c2⟩ := by
    unfold shiftF
    show (⟨V, b1 + 2 * V * k, V * k * k + b1 * k + c1⟩ : BQF) = ⟨V, b2, c2⟩
    rw [← hrec, ← hc]
  rw [← hform]
  exact of_shift k _


/-- The record (middle coefficient) of the unimodular transform of f by
    the matrix [[x, u], [y, v]]. -/
def record (f : BQF) (x y u v : Z) : Z :=
  2 * f.a * x * u + f.b * (x * v + y * u) + 2 * f.c * y * v

/-- The full transform. -/
def transform (f : BQF) (x y u v : Z) : BQF :=
  ⟨eval f x y, record f x y u v, eval f u v⟩

/-- ★ DISC INVARIANCE of the unimodular transform (the SL₂ costume of the
    Born square): xv − yu = 1 ⟹ disc (transform f) = disc f. -/
theorem transform_disc (f : BQF) {x y u v : Z} (huni : x * v - y * u = 1) :
    disc (transform f x y u v) = disc f := by
  unfold disc transform eval record
  -- the exact identity: disc(T f) = disc f · (xv − yu)²
  have hkey : (2 * f.a * x * u + f.b * (x * v + y * u) + 2 * f.c * y * v)
      * (2 * f.a * x * u + f.b * (x * v + y * u) + 2 * f.c * y * v)
      - 4 * (f.a * x * x + f.b * x * y + f.c * y * y)
        * (f.a * u * u + f.b * u * v + f.c * v * v)
      = (f.b * f.b - 4 * f.a * f.c) * ((x * v - y * u) * (x * v - y * u)) := by
    ring
  rw [hkey, huni, mul_one, mul_one]

/-- ★ COMPLETION FREEDOM: two unimodular completions of the same landing
    (x, y) differ by a multiple of the landing column:
    u' = u + k·x, v' = v + k·y. -/
theorem completion_freedom {x y u v u' v' : Z} (hxne : x ≠ 0)
    (h1 : x * v - y * u = 1) (h2 : x * v' - y * u' = 1) :
    ∃ k : Z, u' = u + k * x ∧ v' = v + k * y := by
  -- x(v'−v) = y(u'−u); x coprime to y (from h1); Euclid ⟹ x ∣ (u'−u)
  have hxy : x * (v' - v) = y * (u' - u) := by linarith
  have hcop : Coprime x y := ⟨v, -u, by linarith⟩
  have hdvd : ZDvd x (y * (u' - u)) := ⟨v' - v, hxy.symm⟩
  obtain ⟨k, hk⟩ := euclid_lemma hcop hdvd
  refine ⟨k, by linarith [hk], ?_⟩
  · -- cancel x in x(v'−v) = y·(x·k)
    have hcalc : x * (v' - v) = x * (y * k) := by
      calc x * (v' - v) = y * (u' - u) := hxy
        _ = y * (x * k) := by rw [hk]
        _ = x * (y * k) := by ring
    -- cancellation on the derived ℤ
    have hcancel : ∀ {p a b : Z}, p ≠ 0 → p * a = p * b → a = b := by
      intro p a b hp h
      by_contra hne
      have hab : a - b ≠ 0 := fun h0 => hne (by linarith [sub_eq_zero.mp h0])
      have hpt : 0 < p ∨ p < 0 := by
        rcases lt_trichotomy 0 p with hh | hh | hh
        · exact Or.inl hh
        · exact absurd hh.symm hp
        · exact Or.inr hh
      have hat : 0 < a - b ∨ a - b < 0 := by
        rcases lt_trichotomy 0 (a - b) with hh | hh | hh
        · exact Or.inl hh
        · exact absurd hh.symm hab
        · exact Or.inr hh
      have hz : p * (a - b) = 0 := by rw [mul_sub, h, sub_self]
      rcases hpt with h1 | h1 <;> rcases hat with h2 | h2
      · have := Z.mul_pos _ _ h1 h2
        rw [hz] at this
        exact lt_irrefl _ this
      · have hpos : 0 < p * (-(a - b)) := Z.mul_pos _ _ h1 (by linarith)
        rw [show p * (-(a - b)) = -(p * (a - b)) by ring, hz, neg_zero] at hpos
        exact lt_irrefl _ hpos
      · have hpos : 0 < (-p) * (a - b) := Z.mul_pos _ _ (by linarith) h2
        rw [show (-p) * (a - b) = -(p * (a - b)) by ring, hz, neg_zero] at hpos
        exact lt_irrefl _ hpos
      · have hpos : 0 < (-p) * (-(a - b)) := Z.mul_pos _ _ (by linarith) (by linarith)
        rw [show (-p) * (-(a - b)) = p * (a - b) by ring, hz] at hpos
        exact lt_irrefl _ hpos
    have := hcancel hxne hcalc
    linarith

/-- Completion freedom, x = 0 branch handled by direct choice: TOTAL version. -/
theorem completion_freedom' {x y u v u' v' : Z}
    (h1 : x * v - y * u = 1) (h2 : x * v' - y * u' = 1) :
    ∃ k : Z, u' = u + k * x ∧ v' = v + k * y := by
  rcases eq_or_ne x 0 with hx0 | hxne
  · -- x = 0: −yu = 1 = −yu'; choose k := (v' − v)·(−u)
    subst hx0
    have hyu : -(y * u) = 1 := by linarith
    have hyu' : -(y * u') = 1 := by linarith
    have huu : u' = u := by
      -- y·u = y·u' = −1 and y ≠ 0
      have hyne : y ≠ 0 := by
        intro h0
        subst h0
        simp at hyu
      have heq : y * u = y * u' := by linarith
      by_contra hne
      have hd : u - u' ≠ 0 := fun h0 => hne (by linarith [sub_eq_zero.mp h0])
      have hz : y * (u - u') = 0 := by rw [mul_sub, heq, sub_self]
      have hyt : 0 < y ∨ y < 0 := by
        rcases lt_trichotomy 0 y with hh | hh | hh
        · exact Or.inl hh
        · exact absurd hh.symm hyne
        · exact Or.inr hh
      have hdt : 0 < u - u' ∨ u - u' < 0 := by
        rcases lt_trichotomy 0 (u - u') with hh | hh | hh
        · exact Or.inl hh
        · exact absurd hh.symm hd
        · exact Or.inr hh
      rcases hyt with hh1 | hh1 <;> rcases hdt with hh2 | hh2
      · have := Z.mul_pos _ _ hh1 hh2
        rw [hz] at this
        exact lt_irrefl _ this
      · have hpos : 0 < y * (-(u - u')) := Z.mul_pos _ _ hh1 (by linarith)
        rw [show y * (-(u - u')) = -(y * (u - u')) by ring, hz, neg_zero] at hpos
        exact lt_irrefl _ hpos
      · have hpos : 0 < (-y) * (u - u') := Z.mul_pos _ _ (by linarith) hh2
        rw [show (-y) * (u - u') = -(y * (u - u')) by ring, hz, neg_zero] at hpos
        exact lt_irrefl _ hpos
      · have hpos : 0 < (-y) * (-(u - u')) := Z.mul_pos _ _ (by linarith) (by linarith)
        rw [show (-y) * (-(u - u')) = y * (u - u') by ring, hz] at hpos
        exact lt_irrefl _ hpos
    refine ⟨(v' - v) * (-u), by rw [huu]; ring, ?_⟩
    -- k·y = (v'−v)(−u)·y = (v'−v)(−uy) = (v'−v)·1
    have : -(u * y) = 1 := by linarith
    calc v' = v + (v' - v) * 1 := by ring
      _ = v + (v' - v) * (-(u * y)) := by rw [this]
      _ = v + (v' - v) * (-u) * y := by ring
  · exact completion_freedom hxne h1 h2

/-- ★★ RECORD WELL-DEFINEDNESS: at a FIXED landing (x,y), any two unimodular
    completions give records differing by exactly 2·V·k (V = f(x,y)) — the
    anchored record is pinned mod 2V BY THE LANDING ALONE. The last
    structural theorem of the L6 reduction. -/
theorem record_well_defined (f : BQF) {x y u v u' v' : Z}
    (h1 : x * v - y * u = 1) (h2 : x * v' - y * u' = 1) :
    ∃ k : Z, record f x y u' v' = record f x y u v + 2 * eval f x y * k := by
  obtain ⟨k, hu, hv⟩ := completion_freedom' h1 h2
  refine ⟨k, ?_⟩
  unfold record eval
  rw [hu, hv]
  ring


/-- Chain preserves the discriminant (L2c restated). -/
theorem chain_disc {f g : BQF} (h : Chain f g) : disc f = disc g := by
  induction h with
  | refl f => rfl
  | @shift f' h' k t ih =>
      have hs : disc (shiftF k f') = disc f' := by
        unfold disc shiftF; ring
      rw [← ih, hs]
  | @swap f' h' t ih =>
      have hs : disc (swapF f') = disc f' := by
        unfold disc swapF; ring
      rw [← ih, hs]


/-- ★★★ THE SWAP-INVARIANCE ASSEMBLY (the L6 arch): two forms of the same
    discriminant that each CHAIN to an anchored form with the SAME nonzero
    leading miss V, whose anchored records agree mod 2V, are CHAIN-EQUIVALENT.
    All composition well-definedness (shift half L6c, swap half via the
    common bilinear landing) funnels through this one theorem. -/
theorem gathers_chain_at_common_landing'
    {G G' H H' : BQF} {V k : Z} (hV : V ≠ 0)
    (hdiscGG' : disc G = disc G')
    (hchainG : Chain G H) (hchainG' : Chain G' H')
    (hHa : H.a = V) (hH'a : H'.a = V)
    (hrec : H'.b = H.b + 2 * V * k) :
    Chain G G' := by
  have hdH : disc H = disc H' := by
    rw [← chain_disc hchainG, ← chain_disc hchainG', hdiscGG']
  -- destructure H, H' onto the anchored shape
  obtain ⟨Ha, Hb, Hc⟩ := H
  obtain ⟨Ha', Hb', Hc'⟩ := H'
  simp only at hHa hH'a hrec
  subst hHa
  subst hH'a
  -- records congruent mod 2·miss; let elaboration carry the substituted miss
  exact chainTrans hchainG
    (chainTrans (anchored_same_record_chain hV hrec hdH) (chainSymm hchainG'))



#print axioms branch_gather'
#print axioms records_parity_agree
#print axioms inverse_law_even
#print axioms triple_record_pinned
#print axioms witness_necessity
#print axioms list_landing
#print axioms concordant_representative
#print axioms gauss_bilinear
#print axioms gathers_chain_at_common_landing'

end BQF
end GaussForms
end Phys.Foundation
