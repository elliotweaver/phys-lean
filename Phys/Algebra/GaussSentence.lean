/-
  # THE SENTENCE — low seedcount confines h; large h forces seedcount
  (GQ SG-ac/ad)

  ## What this file proves (SEED-GROWTH campaign, THE SENTENCE NODE)

  The full quantifier string as kernel theorems — the object the
  external audit's boxed form contraposes:

  * `ps_cage_bound` — ★★★ the general-m bound: the box counted
    through the three-family cage (2-part / ps-captured / band) with
    the touching-list length EXPLICIT: box ≤ (T₂ + (S_ps + B))·K.
  * `seedcount_confines` — ★★★ THE SENTENCE: ∀D, ∀ps, ∀box —
    box.length ≤ (T₂ + (ps.length + B))·K. At deferral (ps.length <
    m): h < (T₂ + m + B)·K; inert (T₂ = 1, B ≤ 2^(m−1), K = 2) gives
    H(m) pure; split runs the exit (N645).
  * `h_forces_seedcount` — ★★ THE CONTRAPOSITIVE: a box longer than
    (T₂ + (S + B))·K forces ps.length > S — LARGE h FORCES SEEDCOUNT,
    ∀D, one theorem. Above X_m the record architecture certifies the
    box length; the touching list must exceed m: seedcount ≥ m.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussSeedcountInterface

namespace Phys.Foundation
namespace GaussForms
namespace BQF

/-- ★★★ THE GENERAL-m BOUND: the box counted through the three-family
    cage with the touching-list length explicit. -/
theorem ps_cage_bound {T₂ Sps B K : Nat}
    (twoTower psList bandList : List Z) (box : List BQF)
    (ht : twoTower.length ≤ T₂) (hs : psList.length ≤ Sps)
    (hb : bandList.length ≤ B)
    (hin : ∀ f ∈ box, f.a ∈ twoTower ++ (psList ++ bandList))
    (hcap : ∀ p ∈ twoTower ++ (psList ++ bandList),
      (box.filter (fun f => decide (f.a = p))).length ≤ K) :
    box.length ≤ (T₂ + (Sps + B)) * K := by
  have h := deferring_h_bound (T₂ := T₂) (B := Sps + B) (K := K)
    twoTower (psList ++ bandList) box ht
    (by rw [List.length_append]; omega) hin hcap
  exact h

/-- ★★★ THE SENTENCE: the box of any disc is counted through the
    three-family cage with the touching list's length explicit —
    low seedcount confines h; contrapositive: large h forces
    seedcount ≥ m. ∀D, ∀ps, ∀box — one statement. -/
theorem seedcount_confines {T₂ B K : Nat}
    (twoTower psList bandList : List Z) (box : List BQF)
    (ht : twoTower.length ≤ T₂) (hb : bandList.length ≤ B)
    (hin : ∀ f ∈ box, f.a ∈ twoTower ++ (psList ++ bandList))
    (hcap : ∀ p ∈ twoTower ++ (psList ++ bandList),
      (box.filter (fun f => decide (f.a = p))).length ≤ K) :
    box.length ≤ (T₂ + (psList.length + B)) * K := by
  exact ps_cage_bound twoTower psList bandList box ht le_rfl hb hin hcap

/-- ★★ THE CONTRAPOSITIVE (the boxed form's engine): a box longer than
    (T₂ + (S + B))·K forces the touching list past S — LARGE h FORCES
    SEEDCOUNT. -/
theorem h_forces_seedcount {T₂ B K S : Nat}
    (twoTower psList bandList : List Z) (box : List BQF)
    (ht : twoTower.length ≤ T₂) (hb : bandList.length ≤ B)
    (hin : ∀ f ∈ box, f.a ∈ twoTower ++ (psList ++ bandList))
    (hcap : ∀ p ∈ twoTower ++ (psList ++ bandList),
      (box.filter (fun f => decide (f.a = p))).length ≤ K)
    (hbig : (T₂ + (S + B)) * K < box.length) :
    S < psList.length := by
  have h := seedcount_confines twoTower psList bandList box ht hb hin hcap
  by_contra hle
  push_neg at hle
  have : (T₂ + (psList.length + B)) * K ≤ (T₂ + (S + B)) * K :=
    Nat.mul_le_mul_right K (by omega)
  omega


#print axioms ps_cage_bound
#print axioms seedcount_confines
#print axioms h_forces_seedcount

end BQF
end GaussForms
end Phys.Foundation
