/-
  # SLOT-FACTOR TOUCHES — the descent (GQ SG-k)

  ## What this file proves (SEED-GROWTH campaign, production node)

  The uniform-closure route's engine: every deep odd prime factor of a
  slot's leading coefficient TOUCHES the principal branch.

  * `z_even_or_odd` — parity decomposition on the derived integers.
  * `disc_slot_descend` — ★ p | a ⟹ p | b² − D (divisibility algebra).
  * `odd_disc_b_odd` — ★ odd disc forces b odd (parity contradiction).
  * `slot_factor_touches` — ★★★ THE DESCENT: p odd, p | f.a, disc f =
    1 − 4c₀ ⟹ ∃ x k, P(x) = p·k, explicit witness x = (b−1)/2 via the
    double-parity division 4·P(t) = p·w ⟹ P(t) = p·v.

  CONSEQUENCE (the structure theorem for deferral, next node): total
  odd-deep blocking ⟹ NO reduced form of disc D has a deep-odd-
  factored leading coefficient — the whole box is band/2-power/
  principal shaped. Deferral is structurally pinned.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussEmSkeleton

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open IntegerArith

/-- Parity decomposition on Z (inline; production home:
    IntegerArithMore). Every z is 2t or 2t+1. -/
theorem z_even_or_odd (z : Z) : ∃ t : Z, z = 2 * t ∨ z = 2 * t + 1 := by
  obtain ⟨n, hn | hn⟩ := z_trichotomy z
  · -- z = ofRe n: divide n by 2 on the Re side
    obtain ⟨q, r, hqr, hrlt⟩ := div_mod_exists (Re.step (Re.step Re.void))
      (by exact lt_iff_step_le.mpr ⟨Re.step Re.void, rfl⟩) n
    have hr01 : Z.ofRe r = 0 ∨ Z.ofRe r = 1 := by
      have h2 : Z.ofRe r < 2 := by
        have hm := ofRe_strict_mono hrlt
        have hv : Z.ofRe (Re.step (Re.step Re.void)) = (2 : Z) := rfl
        rw [hv] at hm
        exact hm
      have h0 : 0 ≤ Z.ofRe r := ofRe_nonneg r
      have hz01 := z_zero_or_one (b := Z.ofRe r)
        (by linarith) (by
          rcases lt_trichotomy (Z.ofRe r) 2 with hb | hb | hb
          · rcases lt_trichotomy (Z.ofRe r) 1 with hc | hc | hc
            · have h1r : Z.ofRe r ≤ 0 := by
                by_contra hpos
                push_neg at hpos
                have := z_pos_ge_one hpos
                linarith
              linarith
            · linarith
            · have := z_pos_ge_one (show (0:Z) < Z.ofRe r - 1 by linarith)
              linarith
          · linarith
          · linarith)
      exact hz01
    have hz : z = 2 * Z.ofRe q + Z.ofRe r := by
      rw [hn, hqr, Z.ofRe_add, Z.ofRe_mul]
      have hv : Z.ofRe (Re.step (Re.step Re.void)) = (2 : Z) := rfl
      rw [hv]
    rcases hr01 with h | h
    · exact ⟨Z.ofRe q, Or.inl (by rw [hz, h]; ring)⟩
    · exact ⟨Z.ofRe q, Or.inr (by rw [hz, h])⟩
  · -- z = −ofRe n: negate the decomposition
    obtain ⟨q, r, hqr, hrlt⟩ := div_mod_exists (Re.step (Re.step Re.void))
      (by exact lt_iff_step_le.mpr ⟨Re.step Re.void, rfl⟩) n
    have hr01 : Z.ofRe r = 0 ∨ Z.ofRe r = 1 := by
      have h2 : Z.ofRe r < 2 := by
        have hm := ofRe_strict_mono hrlt
        have hv : Z.ofRe (Re.step (Re.step Re.void)) = (2 : Z) := rfl
        rw [hv] at hm
        exact hm
      have h0 : 0 ≤ Z.ofRe r := ofRe_nonneg r
      have hz01 := z_zero_or_one (b := Z.ofRe r)
        (by linarith) (by
          rcases lt_trichotomy (Z.ofRe r) 2 with hb | hb | hb
          · rcases lt_trichotomy (Z.ofRe r) 1 with hc | hc | hc
            · have h1r : Z.ofRe r ≤ 0 := by
                by_contra hpos
                push_neg at hpos
                have := z_pos_ge_one hpos
                linarith
              linarith
            · linarith
            · have := z_pos_ge_one (show (0:Z) < Z.ofRe r - 1 by linarith)
              linarith
          · linarith
          · linarith)
      exact hz01
    have hz : z = -(2 * Z.ofRe q + Z.ofRe r) := by
      rw [hn, hqr, Z.ofRe_add, Z.ofRe_mul]
      have hv : Z.ofRe (Re.step (Re.step Re.void)) = (2 : Z) := rfl
      rw [hv]
    rcases hr01 with h | h
    · exact ⟨-Z.ofRe q, Or.inl (by rw [hz, h]; ring)⟩
    · exact ⟨-(Z.ofRe q + 1), Or.inr (by rw [hz, h]; ring)⟩

/-- ★ Slot divisibility descends: p | a ⟹ p | b² − D. -/
theorem disc_slot_descend {f : BQF} {D p e : Z}
    (hdisc : disc f = D) (hpa : f.a = p * e) :
    ∃ w : Z, f.b * f.b - D = p * w := by
  refine ⟨4 * e * f.c, ?_⟩
  have h : D = f.b * f.b - 4 * f.a * f.c := by
    rw [← hdisc]; rfl
  rw [h, hpa]
  ring

/-- ★ Odd disc forces b odd: D = 1 − 4c₀ and 4a·c = b² − D with a even
    contribution... direct route: b² = D + 4ac = 1 − 4c₀ + 4ac, so
    b² ≡ 1 mod 4 ⟹ b odd. Realized: ∃ t, b = 2t + 1, from b² − 1 =
    4(ac − c₀) via parity trichotomy on b. -/
theorem odd_disc_b_odd {f : BQF} {c₀ : Z}
    (hdisc : disc f = 1 - 4 * c₀) :
    ∃ t : Z, f.b = 2 * t + 1 := by
  have h : f.b * f.b = 1 - 4 * c₀ + 4 * f.a * f.c := by
    have hd : disc f = 1 - 4 * c₀ := hdisc
    show f.b * f.b = _
    have : f.b * f.b - 4 * f.a * f.c = 1 - 4 * c₀ := hd
    linarith
  -- parity: b = 2t or b = 2t+1 (evens_or_odds on Z via trichotomy...
  -- use z_trichotomy-based parity from the banked kit: b − 2*(b/2)...
  -- fold-simple: (b − 1)(b + 1) = b² − 1 = 4(ac − c₀); if b = 2t then
  -- 4t² = 1 + 4(ac − c₀) ⟹ 4 | 1: false. Parity witness by cases on
  -- the banked even/odd decomposition:
  obtain ⟨t, ht | ht⟩ := z_even_or_odd f.b
  · exfalso
    rw [ht] at h
    -- 4t² = 1 − 4c₀ + 4ac ⟹ 4(t² + c₀ − ac) = 1
    have h4 : 4 * (t * t + c₀ - f.a * f.c) = 1 := by ring_nf; linarith [h]
    rcases lt_trichotomy (t * t + c₀ - f.a * f.c) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(t * t + c₀ - f.a * f.c) by linarith)]
    · rw [hc] at h4; norm_num at h4
    · nlinarith [z_pos_ge_one hc]
  · exact ⟨t, ht⟩

/-- ★★★ THE DESCENT: an odd prime factor of a slot's leading coefficient
    touches the principal branch — explicit witness x = (b−1)/2. -/
theorem slot_factor_touches {f : BQF} {c₀ p e m : Z}
    (hdisc : disc f = 1 - 4 * c₀)
    (hpa : f.a = p * e) (hodd : p = 2 * m + 1) :
    ∃ x k : Z, x * x + x + c₀ = p * k := by
  obtain ⟨w, hw⟩ := disc_slot_descend hdisc hpa
  obtain ⟨t, ht⟩ := odd_disc_b_odd hdisc
  refine ⟨t, ?_⟩
  -- 4·P(t) = b² + (4c₀ − 1) = b² − D = p·w, with b = 2t+1:
  -- 4(t² + t + c₀) = (2t+1)² + 4c₀ − 1 = b² − D = p·w
  -- p odd: p | 4·P(t) ⟹ p | P(t) via Euclid on 4 = 2·2... fold-direct:
  -- w = 4v? p·w = 4·P(t) and gcd(p,4)... use: p·w ≡ 0 mod 4 ⟹ w = 4v
  -- (p odd): w(2m+1) = 4P ⟹ w ≡ 0 mod 4 by parity descent twice.
  have h4P : 4 * (t * t + t + c₀) = p * w := by
    have hb : f.b = 2 * t + 1 := ht
    rw [hb] at hw
    have hD : (2*t+1) * (2*t+1) - (1 - 4*c₀) = 4 * (t * t + t + c₀) := by ring
    linarith [hw, hD]
  -- w even twice: p odd ⟹ p·w ≡ 0 mod 2 ⟹ w even; repeat.
  obtain ⟨u, hu | hu⟩ := z_even_or_odd w
  · -- w = 2u: 2(t²+t+c₀)... 4P = p·2u ⟹ 2P = p·u; parity again on u
    obtain ⟨v, hv | hv⟩ := z_even_or_odd u
    · -- u = 2v: 4P = 4pv ⟹ P = pv
      refine ⟨v, ?_⟩
      have h44 : 4 * (t * t + t + c₀) = 4 * (p * v) := by
        rw [hu, hv] at h4P
        calc 4 * (t * t + t + c₀) = p * (2 * (2 * v)) := h4P
          _ = 4 * (p * v) := by ring
      linarith
    · -- u = 2v+1: 2P = p(2v+1) — RHS odd×odd = odd... 2P even: contra
      exfalso
      have h2P : 2 * (t * t + t + c₀) = p * u := by
        rw [hu] at h4P
        have : 4 * (t * t + t + c₀) = 2 * (p * u) := by
          calc 4 * (t * t + t + c₀) = p * (2 * u) := h4P
            _ = 2 * (p * u) := by ring
        linarith
      rw [hv, hodd] at h2P
      -- (2m+1)(2v+1) = 2P: odd = even
      have : 2 * ((t*t+t+c₀) - (2*m*v + m + v)) = 1 := by ring_nf; nlinarith [h2P]
      rcases lt_trichotomy ((t*t+t+c₀) - (2*m*v + m + v)) 0 with hc | hc | hc
      · nlinarith [z_pos_ge_one (show (0:Z) < -((t*t+t+c₀) - (2*m*v + m + v)) by linarith)]
      · rw [hc] at this; norm_num at this
      · nlinarith [z_pos_ge_one hc]
  · -- w odd: 4P = p·w odd×odd = odd, but 4P even: contra
    exfalso
    rw [hu, hodd] at h4P
    have : 2 * (2 * (t*t+t+c₀) - (2*m*u + m + u)) = 1 := by ring_nf; nlinarith [h4P]
    rcases lt_trichotomy (2 * (t*t+t+c₀) - (2*m*u + m + u)) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(2 * (t*t+t+c₀) - (2*m*u + m + u)) by linarith)]
    · rw [hc] at this; norm_num at this
    · nlinarith [z_pos_ge_one hc]


#print axioms disc_slot_descend
#print axioms odd_disc_b_odd
#print axioms slot_factor_touches

end BQF
end GaussForms
end Phys.Foundation
