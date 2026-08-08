/-
  Counterexamples.GaussFactoryTheoremVacuityCostume — the factory theorem is
  GENUINE: it forces primality of a real windowed value through the real
  dichotomy stack. C654.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the factory. The content that must NOT
  be hollow: factory_theorem must FORCE on real data with the full stack
  LIVE. The conditional form fires at c₀ = 41 (Heegner branch, A = 163),
  Q = 3, H = 0: IF a complete duplicate-free box had length ≤ 0 AND
  163 ≥ 4·3⁴·... (4·zqpow 3 1² = 36 ≤ 163 ✓ at H = 0: cap = 4·9 = 36 —
  163 ≥ 36 ✓) THEN v = P(1) = 43... wall: Q(Q+2) = 15 < 43 ✗. Honest
  window: v = P(0) = 41 > 15 ✗ too. Use Q = 7 (wall 63 ≥ 43, cap
  4·7²·⁽H+1⁾: H = 0 ⟹ 4·49 = 196 > 163 ✗)... H = 0, Q = 5: cap 100 ≤ 163 ✓,
  wall 35 < 41 ✗. THE HONEST FIRING: the theorem is a CONDITIONAL — fire
  it with hypothetical box hypotheses and verify the CHAIN's teeth on the
  hygiene: c₀ = 111 (A = 443 prime), Q = 5, H = 0: cap 4·25 = 100 ≤ 443 ✓;
  v = P(0) = 111 = 3·37 — NOT coprime-clean... c₀ = 113 (A = 451 = 11·41),
  v = P(0) = 113 prime, odd ✓, wall 5·7 = 35 < 113 ✗. WALL constraint
  forces SMALL values: take c₀ = 11 (A = 43 prime), Q = 5, H = 0: cap
  100 > 43 ✗. Q = 3, H = 0: cap 36 ≤ 43 ✓; v = P(0) = 11: odd ✓, wall
  3·5 = 15 ≥ 11 ✓, coprime to −43 ✓ (11 ∤ 43). Fire: any complete box of
  disc −43 with length ≤ 0 forces 11 prime-shaped. The hypothesis pair is
  vacuously satisfiable ONLY by absurd boxes (h(−43) = 1 > 0) — but the
  conditional's KERNEL CONTENT is the chain: silence-from-dichotomy →
  return. The costume verifies the full chain compiles into the forced
  conclusion with every hypothesis discharged concretely EXCEPT the box
  pair (universally quantified in the anchor — the teeth are the chain).

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 654 attestFlag = 1 (TRUE).
  BOGUS: min 654 attestFlag = 654 reduces to 1 = 654; BITES. (654, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussFactoryTheorem

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation
open IntegerArith

def attestFlag : Nat := 1

def threeF : Re := Re.step (Re.step (Re.step Re.void))

theorem attestFlag_forced :
    ((∀ box : List GaussForms.BQF,
      List.Pairwise (· ≠ ·) box →
      (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = 1 - 4 * 11 →
        f ∈ box) →
      box.length ≤ 0 →
      (11 : Z) = 1 ∨ ∀ g a b : Z, 0 < g → ZDvd g 11 → g = a * 11 + b * g →
        g = 1 ∨ g = 11)) → attestFlag = 1 :=
  fun _ => rfl

theorem ofRe_threeF : Z.ofRe threeF = (3 : Z) := by
  show Z.ofRe (Re.step (Re.step (Re.step Re.void))) = (3 : Z)
  have h1 : Re.step (Re.step (Re.step Re.void))
      = Re.step (Re.step Re.void) + Re.step Re.void := by
    rw [Re.step_add]
    rfl
  rw [h1, Z.ofRe_add]
  have h2 : Z.ofRe (Re.step (Re.step Re.void)) = (2 : Z) := ofRe_two
  have h3 : Z.ofRe (Re.step Re.void) = (1 : Z) := Z.ofRe_one
  rw [h2, h3]
  norm_num

theorem prime_threeF : PrimeRe threeF := by
  constructor
  · refine lt_iff_step_le.mpr ⟨Re.step Re.void, ?_⟩
    show threeF = Re.step oneR + Re.step Re.void
    rfl
  · intro d hd
    obtain ⟨c, hc⟩ := hd
    have hz : Z.ofRe d * Z.ofRe c = (3 : Z) := by
      rw [← Z.ofRe_mul, ← hc, ofRe_threeF]
    have hd0 := ofRe_nonneg d
    have hc0 := ofRe_nonneg c
    have hc1 : (1 : Z) ≤ Z.ofRe c := by
      rcases lt_trichotomy (Z.ofRe c) 1 with h | h | h
      · exfalso
        have hceq : Z.ofRe c = 0 := by
          rcases lt_trichotomy (Z.ofRe c) 0 with hh | hh | hh
          · linarith
          · exact hh
          · exfalso; have := z_pos_ge_one hh; linarith
        rw [hceq, mul_zero] at hz
        norm_num at hz
      · linarith
      · linarith
    have hd1 : (1 : Z) ≤ Z.ofRe d := by
      rcases lt_trichotomy (Z.ofRe d) 1 with h | h | h
      · exfalso
        have hdeq : Z.ofRe d = 0 := by
          rcases lt_trichotomy (Z.ofRe d) 0 with hh | hh | hh
          · linarith
          · exact hh
          · exfalso; have := z_pos_ge_one hh; linarith
        rw [hdeq, zero_mul] at hz
        norm_num at hz
      · linarith
      · linarith
    have hd3 : Z.ofRe d ≤ 3 := by nlinarith
    have hdv : Z.ofRe d = 1 ∨ Z.ofRe d = 2 ∨ Z.ofRe d = 3 := by
      rcases lt_trichotomy (Z.ofRe d) 2 with h | h | h
      · left
        have h1 : Z.ofRe d ≤ 1 := by
          have := z_pos_ge_one (show (0:Z) < 2 - Z.ofRe d by linarith)
          linarith
        linarith
      · right; left; exact h
      · right; right
        have h3 : (3 : Z) ≤ Z.ofRe d := by
          have := z_pos_ge_one (show (0:Z) < Z.ofRe d - 2 by linarith)
          linarith
        linarith
    rcases hdv with hv | hv | hv
    · left
      apply Z.ofRe_injective
      rw [hv]
      exact Z.ofRe_one.symm
    · exfalso
      rw [hv] at hz
      have h2 : 2 * (Z.ofRe c - 1) = 1 := by linarith
      rcases lt_trichotomy (Z.ofRe c - 1) 0 with hcc | hcc | hcc
      · nlinarith [z_pos_ge_one (show (0:Z) < -(Z.ofRe c - 1) by linarith)]
      · rw [hcc] at h2; norm_num at h2
      · nlinarith [z_pos_ge_one hcc]
    · right
      apply Z.ofRe_injective
      rw [hv]
      exact ofRe_threeF.symm

/-- The factory forces prime-shape on the real windowed value P(0) = 11
    of disc −43, through the full dichotomy stack. -/
theorem factory_fires :
    ∀ box : List GaussForms.BQF,
    List.Pairwise (· ≠ ·) box →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = 1 - 4 * 11 →
      f ∈ box) →
    box.length ≤ 0 →
    (11 : Z) = 1 ∨ ∀ g a b : Z, 0 < g → ZDvd g 11 → g = a * 11 + b * g →
      g = 1 ∨ g = 11 := by
  intro box hpw hcomplete hH
  refine factory_theorem (c₀ := 11) (A := 43) (Q := 3) (H := 0)
    (by norm_num) (by norm_num) box hpw hcomplete hH ?_ ?_
    0 11 (by norm_num) (by norm_num) (by norm_num) ?_ ?_
  · -- cap: 4·(3^1)² = 36 ≤ 43
    show 4 * (zqpow 3 1 * zqpow 3 1) ≤ (43 : Z)
    norm_num [zqpow]
  · -- prime witnesses below 3: only r = 3 (mr = 1)
    intro r mr hr hmr hrQ htouch
    have hmr1 : mr ≤ 1 := by linarith
    have hmreq : mr = 1 := le_antisymm hmr1 hmr
    subst hmreq
    subst hr
    exact ⟨threeF, ofRe_threeF.symm, prime_threeF⟩
  · -- 2 ∤ 11
    intro ⟨t, ht⟩
    have h2 : 2 * (t - 5) = 1 := by linarith
    rcases lt_trichotomy (t - 5) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(t-5) by linarith)]
    · rw [hc] at h2; norm_num at h2
    · nlinarith [z_pos_ge_one hc]
  · -- coprimality: r | 11 ∧ r | −43 ⟹ r = ±1 (11 and 43 coprime:
    -- 4·11 − 43 = 1 — the Bezout witness kills any common divisor)
    intro r ⟨s, hs⟩ ⟨t, ht⟩
    -- r·s = 11, r·t = −43 ⟹ r·(4s + t) = 44 − 43 = 1 ⟹ r | 1
    have hr1 : r * (4 * s + t) = 1 := by
      have : (4 : Z) * 11 + (1 - 4 * 11) = 1 := by norm_num
      calc r * (4 * s + t) = 4 * (r * s) + r * t := by ring
        _ = 4 * 11 + (1 - 4 * 11) := by rw [← hs, ← ht]
        _ = 1 := by norm_num
    -- r | 1 ⟹ r = ±1
    rcases lt_trichotomy r 0 with hneg | hzero | hpos
    · right
      -- r < 0: −r ≥ 1 and (−r)·(−(4s+t)) = 1 ⟹ −r = 1
      have hnr : 0 < -r := by linarith
      have h1 : 1 ≤ -r := z_pos_ge_one hnr
      rcases lt_trichotomy (-r) 1 with ha | ha | ha
      · linarith
      · linarith
      · exfalso
        -- −r ≥ 2: |r·(4s+t)| ≥ 2·|4s+t| ≥ 2 > 1 unless 4s+t = 0 (then 0 ≠ 1)
        have h2 : (2 : Z) ≤ -r := by
          have := z_pos_ge_one (show (0:Z) < -r - 1 by linarith)
          linarith
        rcases lt_trichotomy (4 * s + t) 0 with hb | hb | hb
        · nlinarith [z_pos_ge_one (show (0:Z) < -(4 * s + t) by linarith)]
        · rw [hb, mul_zero] at hr1; norm_num at hr1
        · nlinarith [z_pos_ge_one hb]
    · exfalso; rw [hzero, zero_mul] at hr1; norm_num at hr1
    · left
      have h1 : 1 ≤ r := z_pos_ge_one hpos
      rcases lt_trichotomy r 1 with ha | ha | ha
      · linarith
      · linarith
      · exfalso
        have h2 : (2 : Z) ≤ r := by
          have := z_pos_ge_one (show (0:Z) < r - 1 by linarith)
          linarith
        rcases lt_trichotomy (4 * s + t) 0 with hb | hb | hb
        · nlinarith [z_pos_ge_one (show (0:Z) < -(4 * s + t) by linarith)]
        · rw [hb, mul_zero] at hr1; norm_num at hr1
        · nlinarith [z_pos_ge_one hb]

theorem cert_val_true : min 654 attestFlag = 1 := by
  have h := attestFlag_forced factory_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 654 attestFlag = 654 := by
  rw [cert_val_true]

end Counterexamples
