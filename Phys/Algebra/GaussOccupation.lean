/-
  # THE OCCUPATION THEOREM — the 2-tower is realized at split discs
  (GQ SG-ag)

  ## What this file proves (SEED-GROWTH campaign, AUDIT WELD 1)

  The fourth audit's weld (1): the split arm of X_m needed "2 split ⟹
  the occupied tower BILLS h" as a ∀D theorem, not a per-D
  certificate. Here it is — Hensel lifting in the derived tower:

  * `pow2'_add` / `pow2'_two_step` / `odd_sq_ge_one` — tower kit.
  * `hensel_two` — ★★★ THE LIFT: at split c₀ (c₀ = 2c₁), for every k
    there is an odd b, 0 < b ≤ 2^(k+1), with 2^(k+2) | b² − D. Pure
    parity recursion: even cofactor keeps b; odd cofactor shifts by
    the half-modulus (the cross term supplies the missing 2).
  * `two_tower_realized` — ★★★ THE OCCUPATION (∀D): split disc, 2^j
    deep (4·4^j ≤ A) ⟹ ∃ reduced PosDef form of the disc with
    a = 2^j EXACTLY. Normalization into (−2^j, 2^j] preserves parity
    and divisibility; the gate arithmetic forces c ≥ a.

  With tower_growth (N644) + split_fiber_exit (N645): deferring
  split-D exit every fiber h ≤ H below A = 3·4^(H+1) — now with the
  occupation hypothesis a THEOREM. The split arm of X_m is
  unconditional.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussCageCharacterization

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open IntegerArith

theorem pow2'_add : ∀ m n : Nat, pow2' (m + n) = pow2' m * pow2' n := by
  intro m n
  induction m with
  | zero => simp [pow2']
  | succ k ih =>
      have hidx : k + 1 + n = (k + n) + 1 := by omega
      rw [hidx]
      simp only [pow2']
      rw [ih]
      ring

theorem pow2'_two_step (j : Nat) : pow2' (j + 2) = 4 * pow2' j := by
  simp only [pow2']
  ring

theorem odd_sq_ge_one (t : Z) : 1 ≤ (2 * t + 1) * (2 * t + 1) := by
  rcases lt_trichotomy t 0 with h | h | h
  · have h1 : (1 : Z) ≤ -t := z_pos_ge_one (by linarith)
    nlinarith
  · rw [h]; norm_num
  · have h1 : (1 : Z) ≤ t := z_pos_ge_one h
    nlinarith

theorem pow2'_ge_one (j : Nat) : (1 : Z) ≤ pow2' j :=
  z_pos_ge_one (pow2'_pos j)

/-- ★★★ THE LIFT: odd squares climb the whole 2-tower at split c₀. -/
theorem hensel_two {c₀ c₁ : Z} (hc : c₀ = 2 * c₁) :
    ∀ k : Nat, ∃ b t u : Z, b = 2 * t + 1 ∧ 0 < b ∧ b ≤ pow2' (k + 1) ∧
      b * b - (1 - 4 * c₀) = pow2' (k + 2) * u
  | 0 => by
      refine ⟨1, 0, c₀, by norm_num, by norm_num, ?_, ?_⟩
      · have := pow2'_ge_one 1
        linarith
      · have h2 : pow2' 2 = (4 : Z) := by norm_num [pow2']
        rw [h2]; ring
  | 1 => by
      refine ⟨1, 0, c₁, by norm_num, by norm_num, ?_, ?_⟩
      · have := pow2'_ge_one 2
        linarith
      · have h3 : pow2' 3 = (8 : Z) := by norm_num [pow2']
        rw [h3, hc]; ring
  | (k + 2) => by
      obtain ⟨b, t, u, hbt, hbpos, hble, hbu⟩ := hensel_two hc (k + 1)
      rcases z_parity u with ⟨s, hs | hs⟩
      · -- u = 2s: the same b already lifts
        refine ⟨b, t, s, hbt, hbpos, ?_, ?_⟩
        · have h23 : pow2' (k + 3) = 2 * pow2' (k + 2) := rfl
          have := pow2'_pos (k + 2)
          linarith
        · rw [hbu, hs]
          have h34 : pow2' (k + 4) = 2 * pow2' (k + 3) := rfl
          rw [h34]; ring
      · -- u = 2s+1: shift by the half-modulus
        refine ⟨b + pow2' (k + 2), t + pow2' (k + 1), s + t + 1 + pow2' k,
          ?_, ?_, ?_, ?_⟩
        · have h12 : pow2' (k + 2) = 2 * pow2' (k + 1) := rfl
          rw [hbt, h12]; ring
        · have := pow2'_pos (k + 2)
          linarith
        · have h23 : pow2' (k + 3) = 2 * pow2' (k + 2) := rfl
          rw [h23]; linarith
        · have h23 : pow2' (k + 3) = 2 * pow2' (k + 2) := rfl
          have h24 : pow2' (k + 4) = 4 * pow2' (k + 2) := by
            simp only [pow2']; ring
          have hsq : pow2' (k + 2) * pow2' (k + 2) = pow2' (k + 4) * pow2' k := by
            rw [← pow2'_add]
            have : k + 2 + (k + 2) = (k + 4) + k := by omega
            rw [this, pow2'_add]
          calc (b + pow2' (k + 2)) * (b + pow2' (k + 2)) - (1 - 4 * c₀)
              = (b * b - (1 - 4 * c₀)) + 2 * pow2' (k + 2) * b
                + pow2' (k + 2) * pow2' (k + 2) := by ring
            _ = pow2' (k + 3) * u + 2 * pow2' (k + 2) * b
                + pow2' (k + 4) * pow2' k := by rw [hbu, hsq]
            _ = pow2' (k + 4) * (s + t + 1 + pow2' k) := by
                rw [h23, h24, hs, hbt]; ring

/-- ★★★ THE OCCUPATION (∀D): at split discs every deep 2-power is the
    leading coefficient of a reduced positive-definite form. -/
theorem two_tower_realized {c₀ c₁ A : Z} (hA : A = 4 * c₀ - 1)
    (hc : c₀ = 2 * c₁) :
    ∀ j : Nat, 4 * (pow2' j * pow2' j) ≤ A →
    ∃ f : BQF, Reduced f ∧ PosDef f ∧ disc f = 1 - 4 * c₀ ∧ f.a = pow2' j := by
  intro j hdeep
  obtain ⟨b, t, u, hbt, hbpos, hble, hbu⟩ := hensel_two hc j
  have hpj := pow2'_pos j
  have h12 : pow2' (j + 1) = 2 * pow2' j := rfl
  have h4 : pow2' (j + 2) = 4 * pow2' j := pow2'_two_step j
  -- normalize b into (−2^j, 2^j]
  rcases lt_trichotomy (pow2' j) b with hgt | heq | hlt
  · -- b > 2^j: shift down by 2^(j+1); stays odd, divisibility preserved
    set b' := b - pow2' (j + 1) with hb'
    have hodd' : ∃ t' : Z, b' = 2 * t' + 1 :=
      ⟨t - pow2' j, by rw [hb', hbt, h12]; ring⟩
    obtain ⟨t', hbt'⟩ := hodd'
    have hlow : -pow2' j < b' := by rw [hb', h12]; linarith
    have hhigh : b' ≤ pow2' j := by rw [hb', h12]; linarith
    have hsq : pow2' (j + 1) * pow2' (j + 1) = pow2' (j + 2) * pow2' j := by
      rw [← pow2'_add]
      have : j + 1 + (j + 1) = (j + 2) + j := by omega
      rw [this, pow2'_add]
    have hdvd : b' * b' - (1 - 4 * c₀) = pow2' (j + 2) * (u - b + pow2' j) := by
      have h2step : (2 : Z) * pow2' (j + 1) = pow2' (j + 2) := by
        rw [h12, h4]; ring
      calc b' * b' - (1 - 4 * c₀)
          = (b * b - (1 - 4 * c₀)) - 2 * pow2' (j + 1) * b
            + pow2' (j + 1) * pow2' (j + 1) := by rw [hb']; ring
        _ = pow2' (j + 2) * u - 2 * pow2' (j + 1) * b
            + pow2' (j + 2) * pow2' j := by rw [hbu, hsq]
        _ = pow2' (j + 2) * (u - b + pow2' j) := by rw [← h2step]; ring
    -- the cofactor is the c-coefficient
    set cc := u - b + pow2' j with hcc
    have hkey : b' * b' + A = 4 * pow2' j * cc := by
      have := hdvd
      rw [h4] at this
      linarith [this, hA]
    have hb'sq : (1 : Z) ≤ b' * b' := by rw [hbt']; exact odd_sq_ge_one t'
    have hcpos : 0 < cc := by nlinarith
    have hcge : pow2' j ≤ cc := by nlinarith
    refine ⟨⟨pow2' j, b', cc⟩, ⟨hlow, hhigh, hcge⟩, ⟨hpj, hcpos⟩, ?_, rfl⟩
    show b' * b' - 4 * pow2' j * cc = 1 - 4 * c₀
    linarith [hkey, hA]
  · -- b = 2^j: dead — b odd but 2^j even for j ≥ 1; j = 0 gives b = 1 ≤ 1 fine
    -- treat directly: b ≤ pow2' j holds (equality), reuse the b'=b case
    have hlow : -pow2' j < b := by linarith
    have hhigh : b ≤ pow2' j := by linarith
    have hdvd : b * b - (1 - 4 * c₀) = pow2' (j + 2) * u := hbu
    set cc := u with hcc
    have hkey : b * b + A = 4 * pow2' j * cc := by
      have := hdvd
      rw [h4] at this
      linarith [this, hA]
    have hb'sq : (1 : Z) ≤ b * b := by rw [hbt]; exact odd_sq_ge_one t
    have hcpos : 0 < cc := by nlinarith
    have hcge : pow2' j ≤ cc := by nlinarith
    refine ⟨⟨pow2' j, b, cc⟩, ⟨hlow, hhigh, hcge⟩, ⟨hpj, hcpos⟩, ?_, rfl⟩
    show b * b - 4 * pow2' j * cc = 1 - 4 * c₀
    linarith [hkey, hA]
  · -- b < 2^j: already in range
    have hlow : -pow2' j < b := by linarith
    have hhigh : b ≤ pow2' j := by linarith
    set cc := u with hcc
    have hkey : b * b + A = 4 * pow2' j * cc := by
      have := hbu
      rw [h4] at this
      linarith [this, hA]
    have hb'sq : (1 : Z) ≤ b * b := by rw [hbt]; exact odd_sq_ge_one t
    have hcpos : 0 < cc := by nlinarith
    have hcge : pow2' j ≤ cc := by nlinarith
    refine ⟨⟨pow2' j, b, cc⟩, ⟨hlow, hhigh, hcge⟩, ⟨hpj, hcpos⟩, ?_, rfl⟩
    show b * b - 4 * pow2' j * cc = 1 - 4 * c₀
    linarith [hkey, hA]


#print axioms hensel_two
#print axioms two_tower_realized

end BQF
end GaussForms
end Phys.Foundation
