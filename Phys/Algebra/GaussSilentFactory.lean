/-
  # THE SILENT FACTORY LAW — silence bills every low composite
  (GQ SG-au)

  ## What this file proves (SEED-GROWTH campaign, THE CROWN'S JAW
  AT FULL SCALE)

  Silence removes the jaw's b-window constraint: any divisor of a
  silent value exceeds Q (odd because the value is odd; odd ≤ Q dies
  by silence), so at positions 2x+1 ≤ Q the divisor form lands
  reduced automatically —

  * `silent_position_bills` — ★★★ THE WELD (∀D): c₀ odd, position
    2x+1 ≤ Q, any divisor witness 1 < s, s | P(x), s² ≤ P(x), plus
    silence ⟹ the jaw's exact billing shape (s > Q ≥ 2x+1 forced).
    Parity infrastructure: P(x) odd for odd c₀ (both x-parities).
  * `silent_factory_law` — ★★★ THE LAW (∀D): m distinct low
    positions with divisor witnesses under silence ⟹ box ≥ m.

  CONTRAPOSITIVE at h ≤ H: all but H low-window values of a silent
  disc have NO divisor below their square root — they are PRIME.
  Euler's factory at FULL window scale (√A positions), wall-free.
  With the ramified arm (N664) and JAW 1 (N663): every configuration
  of the silent crown now bills the box or forces total primality of
  the low window — the boxed sentence's last mechanism.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussRabinowitschJaw

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open IntegerArith

/-- ★★★ THE WELD: silence turns any divisor witness at a low position
    into the jaw's billing shape. -/
theorem silent_position_bills {c₀ c₁ Q x s : Z}
    (hodd : c₀ = 2 * c₁ + 1) (hx : 0 ≤ x) (hxQ : 2 * x + 1 ≤ Q)
    (hs1 : 1 < s) (hdvd : ZDvd s (x * x + x + c₀))
    (hsq : s * s ≤ x * x + x + c₀)
    (hsilent : ∀ r mr : Z, r = 2 * mr + 1 → 1 ≤ mr → r ≤ Q →
      ¬ ZDvd r (x * x + x + c₀)) :
    ∃ r' : Z, x * x + x + c₀ = s * r' ∧ 0 < s ∧ s ≤ r' ∧ 2 * x + 1 ≤ s := by
  obtain ⟨r', hr'⟩ := hdvd
  have hspos : 0 < s := by linarith
  -- v odd: x² + x even, c₀ odd
  have hvodd : ¬ ZDvd (2 : Z) (x * x + x + c₀) := by
    intro ⟨t, ht⟩
    obtain ⟨u, hu | hu⟩ := z_parity x
    · -- x = 2u: x² + x = 2(2u² + u); v = 2t ⟹ c₀ even — dead
      have : 2 * (t - (2 * u * u + u) - c₁) = 1 := by
        rw [hu] at ht
        rw [hodd] at ht
        linarith [ht]
      rcases lt_trichotomy (t - (2 * u * u + u) - c₁) 0 with hc | hc | hc
      · nlinarith [z_pos_ge_one (show (0:Z) < -(t - (2 * u * u + u) - c₁) by linarith)]
      · rw [hc] at this; norm_num at this
      · nlinarith [z_pos_ge_one hc]
    · -- x = 2u+1: x² + x = (2u+1)(2u+2) = 2(2u+1)(u+1)
      have : 2 * (t - (2 * u + 1) * (u + 1) - c₁) = 1 := by
        rw [hu] at ht
        rw [hodd] at ht
        nlinarith [ht]
      rcases lt_trichotomy (t - (2 * u + 1) * (u + 1) - c₁) 0 with hc | hc | hc
      · nlinarith [z_pos_ge_one (show (0:Z) <
          -(t - (2 * u + 1) * (u + 1) - c₁) by linarith)]
      · rw [hc] at this; norm_num at this
      · nlinarith [z_pos_ge_one hc]
  -- s odd: s = 2ms even ⟹ 2 | s | v dead
  obtain ⟨ms, hms | hms⟩ := z_parity s
  · exfalso
    exact hvodd ⟨ms * r', by rw [hr', hms]; ring⟩
  -- s ≥ 3: odd and > 1
  have hms1 : 1 ≤ ms := by
    rcases lt_trichotomy ms 1 with h | h | h
    · exfalso
      have hms0 : ms ≤ 0 := by
        by_contra hgt
        push_neg at hgt
        have := z_pos_ge_one hgt
        linarith
      linarith [hms]
    · linarith
    · linarith
  -- Q < s: else silence kills s itself
  have hQs : Q < s := by
    by_contra hle
    push_neg at hle
    exact hsilent s ms hms hms1 hle ⟨r', hr'⟩
  -- s ≤ r': s² ≤ v = s·r'
  have hsr' : s ≤ r' := by
    have : s * s ≤ s * r' := by rw [← hr']; exact hsq
    exact le_of_mul_le_mul_left this hspos
  exact ⟨r', hr', hspos, hsr', by linarith⟩

/-- ★★★ THE SILENT FACTORY LAW: silence bills every low composite —
    m distinct witnessed low positions force the box past m. -/
theorem silent_factory_law {c₀ c₁ Q : Z}
    (hodd : c₀ = 2 * c₁ + 1)
    (box : List BQF)
    (hboxpw : List.Pairwise (· ≠ ·) box)
    (hcomplete : ∀ f : BQF, Reduced f → PosDef f → disc f = 1 - 4 * c₀ →
      f ∈ box)
    (xs : List Z)
    (hxspw : List.Pairwise (· ≠ ·) xs)
    (hwit : ∀ x ∈ xs, 0 ≤ x ∧ 2 * x + 1 ≤ Q ∧
      (∃ s : Z, 1 < s ∧ ZDvd s (x * x + x + c₀) ∧
        s * s ≤ x * x + x + c₀) ∧
      (∀ r mr : Z, r = 2 * mr + 1 → 1 ≤ mr → r ≤ Q →
        ¬ ZDvd r (x * x + x + c₀))) :
    xs.length ≤ box.length := by
  refine composite_positions_bound box hboxpw hcomplete xs hxspw ?_
  intro x hx
  obtain ⟨hx0, hxQ, ⟨s, hs1, hdvd, hsq⟩, hsil⟩ := hwit x hx
  obtain ⟨r', hr', hspos, hsr', hwin⟩ :=
    silent_position_bills hodd hx0 hxQ hs1 hdvd hsq hsil
  exact ⟨hx0, s, r', hr', hspos, hsr', hwin⟩


#print axioms silent_position_bills
#print axioms silent_factory_law

end BQF
end GaussForms
end Phys.Foundation
