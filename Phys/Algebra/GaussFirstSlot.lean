/-
  # THE FIRST-SLOT LAW — a split prime occupies a slot (GQ N674)

  ## What this file proves (REVERSE-DIRECTION campaign, link 1)

  The swap-recon's constructive content (manager-private recon,
  6429/6478 fundamental discs, first-slot/first-prime ratio ≤ 1): a
  non-inert prime forces a REDUCED slot at leading coefficient a = p.
  This is the banked seed law (N619: p | P(x) at depth 4p² ≤ |D| ⟹
  slot at a = p) lifted from "p divides a principal-branch value" to
  "p has a root of b² ≡ D (mod 4p)" — the split-prime contact that
  does NOT need to pass through the principal branch. It is the first
  committed theorem of the REVERSE direction (window → box): the
  gather produces small-a forms because small primes cannot all stay
  inert.

  * `split_seed_form` — ★ a root b of b² − D = 4·p·m gives
    disc ⟨p, b, m⟩ = D. One ring identity (no principal-branch detour).
  * `split_slot` — ★★★ THE FIRST-SLOT LAW: a 4p-root at depth
    4p² ≤ |D| occupies a REDUCED PosDef slot at a = p (bnorm window
    walk + gate arithmetic, the seed_slot skeleton).
  * `odd_sq_sub_one` — ★ b = 2t+1 ⟹ b² − 1 = 4(t²+t) (CHOICE-FREE).
  * `dvd4p_of_dvd4_dvd_p` — ★★ the CRT gather in divisibility form:
    4 | w ∧ p | w ∧ Bezout 4s + pt = 1 ⟹ 4p | w.

  Together: a split prime (root mod p) at odd D lifts (parity) to a
  4p-root, which `split_slot` lands as a reduced box member. The
  mod-p → odd-root step (one of r, r+p is odd) is the remaining micro-
  weld, recorded honestly in the ledger as the node's named successor.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussDeferral

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open Re
open IntegerArith

/-- ★ THE RAW SPLIT SEED: a root b of b² − D = 4·p·m gives
    disc ⟨p, b, m⟩ = D (the direct analogue of seed_form). -/
theorem split_seed_form {D p b m : Z}
    (hb : b * b - D = 4 * p * m) :
    disc (⟨p, b, m⟩ : BQF) = D := by
  show b * b - 4 * p * m = D
  linarith [hb]

/-- ★★★ THE FIRST-SLOT LAW: a root of b² ≡ D (mod 4p), witnessed by m
    with b² − D = 4·p·m, at depth 4p² ≤ |D|, occupies a REDUCED PosDef
    slot at a = p. -/
theorem split_slot {D p b m : Z}
    (hp : 0 < p) (hb : b * b - D = 4 * p * m)
    (hdeep : 4 * (p * p) ≤ -D) (hDneg : D < 0) :
    ∃ f : BQF, Reduced f ∧ PosDef f ∧ disc f = D ∧ f.a = p := by
  obtain ⟨n, hn | hn⟩ := z_trichotomy (b * b)
  case _ =>
    obtain ⟨b', c', hd, hw1, hw2⟩ := bnorm hp n b m (le_of_eq hn)
    rw [split_seed_form hb] at hd
    have hdisc : b' * b' - 4 * p * c' = D := hd
    have hc'pos : 0 < c' := by nlinarith [mul_self_nonneg b']
    have hpc : p ≤ c' := by nlinarith [mul_self_nonneg b']
    exact ⟨⟨p, b', c'⟩, ⟨hw1, hw2, hpc⟩, ⟨hp, hc'pos⟩, hd, rfl⟩
  case _ =>
    have hsq : b * b ≤ 0 := by
      rw [hn]
      have := ofRe_nonneg n
      linarith
    have hb0 : b * b = 0 := le_antisymm hsq (mul_self_nonneg _)
    obtain ⟨b', c', hd, hw1, hw2⟩ := bnorm hp Re.void b m
      (by rw [hb0]; exact le_of_eq Z.ofRe_zero.symm)
    rw [split_seed_form hb] at hd
    have hdisc : b' * b' - 4 * p * c' = D := hd
    have hc'pos : 0 < c' := by nlinarith [mul_self_nonneg b']
    have hpc : p ≤ c' := by nlinarith [mul_self_nonneg b']
    exact ⟨⟨p, b', c'⟩, ⟨hw1, hw2, hpc⟩, ⟨hp, hc'pos⟩, hd, rfl⟩

/-- ★ Odd squares are 1 mod 4: b = 2t+1 ⟹ b² − 1 = 4·(t²+t). CHOICE-FREE. -/
theorem odd_sq_sub_one (t : Z) :
    (2 * t + 1) * (2 * t + 1) - 1 = 4 * (t * t + t) := by ring

/-- ★★ THE CRT GATHER (divisibility form): 4 | w and p | w with
    1 = 4s + p·t (Bezout) ⟹ 4p | w. One gather step. -/
theorem dvd4p_of_dvd4_dvd_p {w p s t : Z}
    (hbez : 4 * s + p * t = 1)
    (h4 : ZDvd' 4 w) (hp : ZDvd' p w) :
    ZDvd' (4 * p) w := by
  obtain ⟨a, ha⟩ := h4   -- w = 4 * a
  obtain ⟨b, hb⟩ := hp   -- w = p * b
  refine ⟨s * b + t * a, ?_⟩
  have hw : w = w * (4 * s + p * t) := by rw [hbez]; ring
  have e1 : w * (4 * s) = 4 * p * (s * b) := by rw [hb]; ring
  have e2 : w * (p * t) = 4 * p * (t * a) := by rw [ha]; ring
  have : w * (4 * s + p * t) = 4 * p * (s * b + t * a) := by
    nlinarith [e1, e2]
  rw [this] at hw
  exact hw

#print axioms split_seed_form
#print axioms split_slot
#print axioms odd_sq_sub_one
#print axioms dvd4p_of_dvd4_dvd_p

end BQF
end GaussForms
end Phys.Foundation
