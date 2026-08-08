/-
  # THE SQUEEZE — a touching small prime caps the disc (GQ SG-ak)

  ## What this file proves (SEED-GROWTH campaign, THE COVERED REGION)

  The covered region's explicit bound as ONE kernel theorem: the
  growth law (N657) floors any complete box by the deep q-levels; if
  A ≥ 4·q^(2(H+1)) then levels 1..H+1 are all deep and the box
  exceeds H. Contrapositive:

  * `levelList` kit — the level list [1..n], length/membership/
    pairwise.
  * `zqpow_mono_le` — tower monotonicity (≤).
  * `touching_squeeze` — ★★★ THE SQUEEZE (∀D): q touching split odd
    prime, box complete + duplicate-free, box.length ≤ H ⟹
    A < 4·q^(2(H+1)). EXPLICIT at every H.

  With N654's 2-adic arm (split 2 ⟹ A < 3·4^(H+1) via the realized
  2-tower): every disc with ANY touching small prime is explicitly
  confined at every h-level. The ∀m composition's covered region is
  kernel; the residue is the sparse tail (all small primes
  non-touching) — the named summit, return-law route.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussGrowthLaw

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open IntegerArith

/-- The level list [1, 2, ..., n]. -/
def levelList : Nat → List Nat
  | 0 => []
  | n + 1 => levelList n ++ [n + 1]

theorem levelList_length : ∀ n, (levelList n).length = n
  | 0 => rfl
  | n + 1 => by simp [levelList, levelList_length n]

theorem levelList_mem : ∀ n j, j ∈ levelList n → 1 ≤ j ∧ j ≤ n
  | 0, j, hj => by simp [levelList] at hj
  | n + 1, j, hj => by
      simp only [levelList, List.mem_append, List.mem_singleton] at hj
      rcases hj with h | rfl
      · have := levelList_mem n j h
        omega
      · omega

theorem levelList_pairwise : ∀ n, List.Pairwise (· ≠ ·) (levelList n)
  | 0 => List.Pairwise.nil
  | n + 1 => by
      simp only [levelList]
      rw [List.pairwise_append]
      refine ⟨levelList_pairwise n, List.pairwise_singleton _ _, ?_⟩
      intro a ha b hb
      rcases List.mem_singleton.mp hb with rfl
      have := levelList_mem n a ha
      omega

/-- Tower monotonicity, ≤ version. -/
theorem zqpow_mono_le {q : Z} (hq3 : 3 ≤ q) {j j' : Nat} (h : j ≤ j') :
    zqpow q j ≤ zqpow q j' := by
  rcases Nat.eq_or_lt_of_le h with rfl | hlt
  · exact le_refl _
  · exact le_of_lt (zqpow_lt hq3 hlt)

/-- ★★★ THE SQUEEZE: a touching split odd prime caps the disc of any
    H-bounded complete box — A < 4·q^(2(H+1)). -/
theorem touching_squeeze {q c₀ A x w : Z} {p : Re} {H : Nat}
    (hA : A = 4 * c₀ - 1) (hq : q = Z.ofRe p) (hprime : PrimeRe p)
    (hq3 : 3 ≤ q)
    (htouch : x * x + x + c₀ = q * w)
    (hqndD : ¬ ZDvd q (1 - 4 * c₀))
    (box : List BQF)
    (hboxpw : List.Pairwise (· ≠ ·) box)
    (hcomplete : ∀ f : BQF, Reduced f → PosDef f → disc f = 1 - 4 * c₀ →
      f ∈ box)
    (hH : box.length ≤ H) :
    A < 4 * (zqpow q (H + 1) * zqpow q (H + 1)) := by
  by_contra hbig
  push_neg at hbig
  -- levels 1..H+1 are all deep: q^j ≤ q^(H+1) ⟹ 4·q^(2j) ≤ 4·q^(2(H+1)) ≤ A
  have hdeep : ∀ j ∈ levelList (H + 1),
      1 ≤ j ∧ 4 * (zqpow q j * zqpow q j) ≤ A := by
    intro j hj
    obtain ⟨h1, h2⟩ := levelList_mem (H + 1) j hj
    refine ⟨h1, ?_⟩
    have hmono := zqpow_mono_le hq3 h2
    have hpos := zqpow_pos3 hq3 j
    nlinarith
  have hfloor := growth_law hA hq hprime hq3 htouch hqndD box hboxpw
    hcomplete (levelList (H + 1)) (levelList_pairwise (H + 1)) hdeep
  rw [levelList_length] at hfloor
  omega


#print axioms touching_squeeze

end BQF
end GaussForms
end Phys.Foundation
